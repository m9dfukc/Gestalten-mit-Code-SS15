// this is a class ... see it starts with "class" at the beginning
class Point2d {
  // inside classes we can "encapsulate" variables
  float x;
  float y;
  
  // each class has something called a "constructor", which sets potentially
  // sets some intial values for example the x and y position of this point
  Point2d(float x, float y) {
    this.x = x;
    this.y = y;    
  }
  
  // a class can also contain functions 
  // (they are called methods if they are inside a class) 
  void set(float x, float y) {
    this.x = x;
    this.y = y;
  }
}

