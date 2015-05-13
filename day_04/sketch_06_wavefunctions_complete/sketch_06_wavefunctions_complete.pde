void setup() {
  frameRate(60);
  background(255);
  size(500, 500);
}

void draw() {
  background(255); 
  
  float time = millis() / 1000.0;

  float funcSine = sineWave(time, 0.25);
  float funcSquare = squareWave(time, 0.25);
  float funcTriangle = triangleWave(time, 0.25);
  float funcSaw = sawWave(time, 0.25);
  
  ellipse(150, mapFunc(funcSine, 0, 500), 20, 20);
  ellipse(200, mapFunc(funcSquare, 0, 500), 20, 20);
  ellipse(250, mapFunc(funcTriangle, 0, 500), 20, 20);
  ellipse(300, mapFunc(funcSaw, 0, 500), 20, 20);
}

float mapFunc(float func, float upper, float lower) {
  return map(func, -1, 1, upper, lower);
}

