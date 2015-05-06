void setup() {  
  size(500, 500); 
  smooth();
}

void draw() {
  background(255);
  
  fill(255, 0, 0);
  noStroke();
  
  float time = millis() / 1000.0;
  
  float signal = sineGen(time, 1.0);
  
  println(signal);
}

float sineGen(float time, float freq) {
  return sin(time * TWO_PI * freq);
}
