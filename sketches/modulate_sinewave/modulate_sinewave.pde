float padding = 50.0;

float oscHz = 0.25;
float modHz = 1.0;

SineOsc sinOsc, cosOsc, modOsc;

void setup() {
  frameRate(60);
  size(600, 600);
  
  sinOsc = new SineOsc(oscHz);
  cosOsc = new SineOsc(oscHz, PI/2.0);
  modOsc = new SineOsc(modHz);

}

void draw() {
  background(240);
  fill(80);
  noStroke();

  float time = millis() / 1000.0; 

  float modValue = modOsc.getOutput();
  float modHz = map(modValue, -1, 1, 0.25, 0.5);

  sinOsc.setFreq(modHz);
  cosOsc.setFreq(modHz);

  float sineValue = sinOsc.getOutput();
  float cosineValue = cosOsc.getOutput();
  
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
}

