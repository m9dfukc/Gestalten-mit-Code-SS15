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
  
  if (frameCount%10 == 0) {
    index = index + 1;
    if (countX * countY == index - 1) {
      index = 0;
    }
  }
  
  for (int i = 0; i < countY; i = i + 1) {
    for (int j = 0; j < countX; j = j + 1) {
      
      float posX = map(j, 0, countX-1, 50, width-50);
      float posY = map(i, 0, countY-1, 50, height-50);
      
      int circleIndex = (i * countY) + j;
      
      if (index == circleIndex) {
        fill(0); 
      } else {
        fill(255);
      }
      ellipse(posX, posY, ellipseSize, ellipseSize);
      
    }
  }
  
}
