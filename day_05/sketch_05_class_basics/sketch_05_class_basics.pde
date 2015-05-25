/* Let's see what a class is.
 * Classes help as to factor out parts of code 
 * into some resuable components. 
 * 
 * For reference (please read carefully):
 * https://www.processing.org/reference/class.html
 *
 * also go into the Point2d tab and read the comments in there!
 */

// we declare our class variable here
Point2d position;

void setup() {
  size(500, 500);
  background(240);
  noStroke();
    
  // now we "create" our Point2d ... it's called "Object Instantiation".
  // this Object now contains the positions for x (width/2) and y (height/2) -> center of the screen
  position = new Point2d(width/2, height/2);
  
  // we can now access what's inside of this Object, namely the x and y coordinates
  fill(255);
  ellipse(position.x, position.y, 50, 50);
  
  // we can also use the "methods" inside the object to change the things inside
  position.set(width/1.5, height/2);
  
  // now get back the new coordinates x, y and draw our second circle
  fill(210);
  ellipse(position.x, position.y, 70, 70);
  
}

