/* This example shows howto do "granular sample playback".
 * Granular sample playbay retains the sample length irrespective of the samples pitch.
 *
 * This example needs the "Beads" audio library to be installed via:
 * "Sketch/Import Library/Add Library/Beads". Also have a look into library examples!
 */

// Load beads library
import beads.*;
import java.util.Arrays; 

// Declare audio context and sample player variables
AudioContext ac;
GranularSamplePlayer player;

color fore = color(255, 102, 204);
color back = color(0,0,0);

void setup() {
  size(300,300);

  // generate audio contect
  ac = new AudioContext();

  // load our sample
  String sourceFile = dataPath("Hello.wav");
  Sample sample = SampleManager.sample(sourceFile);
  
  // use the "GranularSamplePlay" for playback (which has a setPitch method)
  player = new GranularSamplePlayer(ac, sample);
  
  // Loop our sample (optional - could also be oneshot)
  player.setLoopType(SamplePlayer.LoopType.LOOP_FORWARDS);
  player.start();

  // Output amplitude and wiring sampleplayer to output
  Gain g = new Gain(ac, 2, 0.2);
  g.addInput(player);
  ac.out.addInput(g);
  ac.start();
}

void draw() {
  // Use mouseX position to pitch the sample without changing it's length
  float pitch = pow(2,map(mouseX, 0, width, -12, 12)/12.0);
  player.setPitch(new Glide(ac, pitch));

  // Draw the waveform to screen
  loadPixels();
  //set the background
  Arrays.fill(pixels, back);
  //scan across the pixels
  for(int i = 0; i < width; i++) {
    //for each pixel work out where in the current audio buffer we are
    int buffIndex = i * ac.getBufferSize() / width;
    //then work out the pixel height of the audio data at that point
    int vOffset = (int)((1 + ac.out.getValue(0, buffIndex)) * height / 2);
    //draw into Processing's convenient 1-D array of pixels
    vOffset = min(vOffset, height);
    pixels[vOffset * height + i] = fore;
  }
  updatePixels();
}
