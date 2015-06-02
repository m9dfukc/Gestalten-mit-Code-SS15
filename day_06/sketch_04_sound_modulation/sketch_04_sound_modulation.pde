/* This example extends the basic sound introduction using
 * our beloved wavefunctions to modulate the sound pitch/amp.
 */

import processing.sound.*;

SinOsc sine;

float padding = 50.0;
float hz = 0.5;
float freqOffset = 0.08;

void setup() {
  frameRate(60);
  size(600, 600);
  noStroke();
  
  // Instantiate the Sine Oscillator
  sine = new SinOsc(this);
  
  // Start the Sine Oscillator
  sine.play();
}

void draw() {
  background(240);
  fill(80);

  float time = millis() / 1000.0; 

  float sineValue = sineWave(time, hz); 
  float cosineValue = sineWave(time, hz+freqOffset, TWO_PI/4.0);
  
  float minX = width / -2.0 + padding;
  float maxX = width / 2.0 - padding;
  float posX = map(sineValue, -1, 1, minX, maxX);
  
  float minY = height / -2.0 + padding;
  float maxY = height / 2.0 - padding;
  float posY = map(cosineValue, -1, 1, minY, maxY);

  pushMatrix();
    translate(width/2.0, height/2.0);
    ellipse(posX, posY, 20, 20);
  popMatrix();
  
  // Modulating our Oscillator
  float amp = map(posX, 0, height, 1.0, 0.0);
  sine.amp(amp);
   
  float freq = map(posY, 0, width, 100.0, 1000.0);
  sine.freq(freq);
  
  float pos = map(posX, 0, width, -1.0, 1.0);
  sine.pan(pos);
  
}

