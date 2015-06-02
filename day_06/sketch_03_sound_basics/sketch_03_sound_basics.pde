/* Introduction to processing Sound.
 * This is a sine-wave oscillator which we modulate by mouse (x/y),
 * mouseX sets the pitch and pan, mouseY the amp of the Oscillator.
 * You'll need Processing 3Alpha and then the library needs to be 
 * installed via "sketch/import library/add library/sound".
 * 
 * For reference: 
 * https://processing.org/reference/libraries/sound/index.html
 */

// The  library needs to be imported (sketch/import library)
import processing.sound.*;

// Declare our sine variable here
SinOsc sine;

float freq=400;
float amp=0.5;
float pos;

void setup() {
    size(640, 360);
    background(255);
    
    // Instantiate the Sine Oscillator
    sine = new SinOsc(this);
    
    // Start the Sine Oscillator
    sine.play();
}

void draw() {

  // Map mouseY from 0.0 to 1.0 for amplitude
  amp = map(mouseY, 0, height, 1.0, 0.0);
  sine.amp(amp);
  
  // Map mouseX from 20Hz to 1000Hz for frequency  
  freq = map(mouseX, 0, width, 80.0, 1000.0);
  sine.freq(freq);
  
  // Map mouseX from -1.0 to 1.0 for left to right 
  pos = map(mouseX, 0, width, -1.0, 1.0);
  sine.pan(pos);
}
