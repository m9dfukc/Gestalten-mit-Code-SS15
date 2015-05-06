int positionY = 200;
int direction = 1;

void setup() {
  size(400, 400);
  frameRate(30);
  background(255);
}

void draw() {
  background(255);
  line(0, positionY, width, positionY);
  
  positionY = positionY + (5 * direction);
  
  if (positionY > 399) {
    direction = -1;
  } else if (positionY < 1) {
    direction = 1;
  }
}
