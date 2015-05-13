void setup() {
  frameRate(30);
  background(255);
  size(500, 500);
}

void draw() {
  background(255);
  
  float time = millis() / 1000.0;
  float waveFunction = sineWave(time, 0.25);
  float waveFunction2 = sineWave(time, 0.125);
  
  float positionY = map(waveFunction, -1.0, 1.0, 0, height);
  float size = map(waveFunction2, -1.0, 1.0, 0, 50);
  
  ellipse(250, positionY, size, size);
}

float sineWave(float time, float herz) {
  float phase = (time * herz) * (PI * 2.0);
  return sin(phase);
}
