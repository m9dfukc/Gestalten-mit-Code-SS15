import processing.sound.*;
SoundFile sample;
FFT fft;

int count = 1024;
float[] spectrum = new float[count];

void setup() {  
  size(600, 600); 
  noFill();


  //Load and play a soundfile and loop it. This has to be called 
  // before the FFT is created.
  sample = new SoundFile(this, "beat.aiff");
  sample.play();
  //sample.loop();

  // Create and patch the rms tracker
  fft = new FFT(this);
  fft.input(sample, count);
}

void draw() {
  background(255);
  
  fft.analyze(spectrum);
  
  beginShape();
  for (int i=0; i < 100; i++) {
    
    float amp = spectrum[i];
    
    float value = (TWO_PI/100)*i; 
    float posX = map(sin(value), -1, 1, 0, width) + map(amp, 0, 1, 0, 100);
    float posY = map(cos(value), -1, 1, 0, height) + map(amp, 0, 1, 0, 100);

    vertex(posX, posY);
  }
  endShape(CLOSE);
}

