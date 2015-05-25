/* Now let's repeat our previous example "sketch_03_arrays_playground_02"
 * with the help of a simple class. See how much boilerplate we could sort out!
 */

// instead of two queues, one for the x and one for the y position
// we use now just one queue where we stick in out Point2d Object
Point2d[] queue = new Point2d[100];
int cursor = 0;

void setup() {
  size(500, 500);
  frameRate(60);

  // initialize our queue with a default position of -1/-1
  for (int i = 0; i < queue.length; i++) {
    queue[i] = new Point2d(-1, -1);
  }
}

void draw() {
  background(240);
  noStroke();
  
  // continously write into our queue, if the "buffer" is
  // full, go to back to the beginning and overwrite old values
  cursor = (cursor + 1) % queue.length;
  queue[cursor] = new Point2d(mouseX, mouseY);
  
  // now let's interate over the queue and use the positions in
  // there to draw circles on the canvas
  for (int i = 0; i < queue.length; i++) {
    // get the index in the right order;
    // let's have some fun al also pull out the "next" 
    // position in the queue - therefore we need our index+1 
    int index = (i + cursor + 1) % queue.length;
    int index2 = (i + cursor + 2) % queue.length;
    
    // now let's get our positions
    Point2d position  = queue[index];
    Point2d position2 = queue[index2];
    
    // get the distance of these two points using processing dist()
    // or you could do the calc yourself http://www.purplemath.com/modules/distform.htm
    // we use this distance the scale the circle and also generate color values
    if (cursor != index) {
      float distance = dist(position.x, position.y, position2.x, position2.y);
      float lightness = map(distance, 0, 50, 0, 180);
      
      fill(lightness);
      ellipse(position.x, position.y, distance, distance);
    }

  }
}

