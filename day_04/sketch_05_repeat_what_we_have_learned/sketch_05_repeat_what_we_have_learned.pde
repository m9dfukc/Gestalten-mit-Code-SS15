void setup() {
  frameRate(30);
  background(255);
  size(500, 500);
}

void draw() {
  background(255); 
  float time = millis() / 1000.0;
  float sineFunc = sineWave(time, 0.25);
  float sawFunc = sawWave(time, 0.25);
  
  float posY = map(sineFunc, -1, 1, 0, height);
  float posX = map(sawFunc, -1, 1, 0, width);
  
  ellipse(posX, posY, 20, 20);
  
}


float sineWave(float time, float herz) {
  float phase = (time * herz) * TWO_PI;
  return sin(phase);
}

float squareWave(float time, float herz) {
  float timeInHerz = time * herz;
  float phase = timeInHerz%1;
  return ((phase <= 0.5) ? 1 : -1);
}
float sawWave(float time, float herz) {
   float timeInHerz = time * herz;
   float phase = timeInHerz%1;
   return map(phase, 0, 1, -1, 1);
}
