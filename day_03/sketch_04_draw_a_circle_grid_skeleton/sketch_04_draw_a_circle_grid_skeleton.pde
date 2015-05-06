int countX = 5;
int countY = 5;
float ellipseSize = 20;
int index = 0;

void setup() {
  frameRate(60);
  size(500, 500);
}

void draw() {
  
  background(255);
  for (int i = 0; i < countX; i = i + 1) {
    for (int j = 0; j < countY; j = j + 1) {
      float posX = map(i, 0, countX-1, 50, width-50);
      float posY = map(j, 0, countY-1, 50, height-50);
      ellipse(posX, posY, ellipseSize, ellipseSize);
      
    }
  }
}
