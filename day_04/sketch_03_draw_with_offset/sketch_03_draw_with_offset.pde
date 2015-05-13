void setup() {
  frameRate(30);
  background(255);
  size(500, 500);
}

void draw() {
  background(255);
  
  float time = millis() / 1000.0;
  float sawFunc = sawWave(time, 0.1);
  float sineFunc = sineWave(time, 0.1);
  float squareFunc = squareWave(time, 0.1);
  
  float posY1 = map(sawFunc, -1, 1, 0, height);
  float posY2 = map(sineFunc, -1, 1, 0, height);
  float posY3 = map(squareFunc, -1, 1, 0, height);
  
  //ellipse(250, posY1, 20, 20);
  ellipse(250, posY3, 20, 20);

}




