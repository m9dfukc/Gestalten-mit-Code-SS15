void setup() {
  frameRate(30);
  background(255);
  size(500, 500);
}

void draw() {
  background(255);
  
  float time = millis() / 1000.0;
  float waveFunction = sineWave(time, 0.25);
  float waveFunction2 = sineWave(time, 0.25, 0.1);
  
  float positionY = map(waveFunction, -1.0, 1.0, 0, height);
  float positionY2 = map(waveFunction2, -1.0, 1.0, 0, height);
  
  ellipse(250, positionY, 20, 20);
  ellipse(250, positionY2, 20, 20);
}




