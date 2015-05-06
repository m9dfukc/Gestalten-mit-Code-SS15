float position = 0;
int countUp = 0;

void setup() {
  frameRate(60);
  size(500, 500);
  background(255);
  noStroke();

  for (int i = 0; i < 10; i = i + 1) {

    for (int j = 0; j < 10; j = j + 1) {
      float posY = i * 50 + 25;
      float posX = j * 50 + 25;
      float size = i * 20 + 10;
      
      float brightness = map(countUp, 0, 99, 0, 255);
      countUp = countUp + 1; //<>//
      
      fill(brightness);
      ellipse(posX, posY, size, size);
      
    }
  }
}
