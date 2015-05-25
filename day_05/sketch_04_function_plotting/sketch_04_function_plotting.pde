// define our array with a size of 100 elements
float[] stack = new float[100];
int cursor = 0;

void setup() {
  frameRate(60);
  size(600, 400);
}

void draw() {
  background(100);
  
  // use mouse x-axis to set the speed of our sinewave
  float hz = map(mouseX, 0, width, 0.5, 5.0);
  
  float time = millis() / 1000.0; // time in seconds
  float currentValue = sineWave(time, hz); // getting a value from our wave function once per draw() loop
  
  // write current value of the sine function to the array
  cursor = (cursor + 1) % stack.length;  // what's the next slot?
  stack[cursor] = currentValue;  // store the value from the wave function
  
  noFill();
  stroke(255);
  
  // draw what's in the stack
  beginShape();
  for (int i = 0; i < stack.length; i++) {
    int index = (i + cursor + 1) % stack.length; // pointer to the stack wraps around
    float value = stack[index]; // access our stack and get the value    
    float posX = map(i, 0, stack.length - 1, 0, width);
    float posY = map(value, -1, 1, 0, height);
    
    // fill in the vertex position
    vertex(posX, posY);
  }
  endShape();
  
}
