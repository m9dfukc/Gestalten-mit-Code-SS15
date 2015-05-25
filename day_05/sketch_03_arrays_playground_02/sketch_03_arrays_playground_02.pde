/* Let's use a array to stick in the position 
 * of our mouse pointer over time (200 frame to be exact).
 * Then let's use these position data to draw a 'snake'!
 */
int cursor = 0;
int queueSize = 100;
float[] queueX = new float[queueSize];
float[] queueY = new float[queueSize];

void setup() {
  size(500, 500);
  frameRate(60);

  // initialize our queue with a default position of -1/-1
  for (int i = 0; i < queueSize; i++) {
    queueX[i] = -1;
    queueY[i] = -1;
  }
}

void draw() {
  background(240);
  noStroke();
  
  // continously write into our queue, if the "buffer" is
  // full, go to back to the beginning and overwrite old values
  cursor = (cursor + 1) % queueSize;
  queueX[cursor] = mouseX;
  queueY[cursor] = mouseY;
  
  // now let's interate over the queue and use the positions in
  // there to draw circles on the canvas
  for (int i = 0; i < queueSize; i++) {
    // get the index in the right order;
    // let's have some fun al also pull out the "next" 
    // position in the queue - therefore we need our index+1 
    int index = (i + cursor + 1) % queueSize;
    int index2 = (i + cursor + 2) % queueSize;
    
    // now let's get our positions
    float positionX1 = queueX[index];
    float positionY1 = queueY[index];
    float positionX2 = queueX[index2];
    float positionY2 = queueY[index2];
    
    // get the distance of these two points using processing dist()
    // or you could do the calc yourself http://www.purplemath.com/modules/distform.htm
    // we use this distance the scale the circle and also generate color values
    if (cursor != index) {
      float distance = dist(positionX1, positionY1, positionX2, positionY2);
      float lightness = map(distance, 0, 50, 0, 180);
      
      fill(lightness);
      ellipse(positionX1, positionY1, distance, distance);
    }

  }
}

