class Point2d {
  float x;
  float y;
  
  Point2d(float _x, float _y) {
    this.x = _x;
    this.y = _y;
  }
  
  float distance(float _x, float _y) {
    return dist(this.x, this.y, _x, _y);
  }
  
  float distance(Point2d anyPoint) {
    return dist(this.x, this.y, anyPoint.x, anyPoint.y);
  }
  
}

Point2d point;
Point2d point2;

void setup() {
  size(500, 500);
  
  
  point  = new Point2d(0.0, 0.0);
  point2 = new Point2d(width/2.0, height/2.0);
  
  float distance = point.distance(point2);
  println(distance);
  
  

}

void draw() {
  background(255);
  fill(0);
  
  point.x = mouseX;
  point.y = mouseY;
  
  ellipse(point.x, point.y, 20, 20);
  ellipse(point2.x, point2.y, 20, 20);
  
}
