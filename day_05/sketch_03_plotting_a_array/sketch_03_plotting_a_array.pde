// define our array with a size of 100 elements
float[] numbers = new float[120];
// our position pointer
int pos = 0;

void setup() {
  frameRate(60);
  size(500, 500);
  background(100);
}

void draw() {
  background(100);
  
  float time = millis() / 1000.0;
  // getting a value from our wave function once per draw() loop
  float func = map(sineWave(time, 0.25), -0.5, 0.5, 0.0, 1.0) * sineWave(time, 1.0);
  
  // write current value of the sine function to the array
  numbers[pos] = func;
  
  // draw to screen what's in the array yet
  noFill();
  stroke(255);
    
  beginShape();
  for (int i=0; i < numbers.length; i++) {
    float posY = map(numbers[i], -1, 1, 0, height);
    float posX = map(i, 0, 99, 0, width);
    vertex(posX, posY);
  }
  endShape();
  
  // increment our position pointer
  if (pos < 99) {
    pos = pos + 1;
  } else {
    pos = 0;
  }
  
}
