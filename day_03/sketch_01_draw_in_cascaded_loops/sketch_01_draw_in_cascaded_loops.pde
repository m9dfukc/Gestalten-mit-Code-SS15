float position = 0;

void setup() {
  frameRate(60);
  size(500, 500);
  background(255);

  for (int i = 0; i < 10; i = i + 1) {
    println("aussen:");
    println(i);
    for (int j = 0; j < 10; j = j + 1) {
      float posY = i * 50 + 25;
      float posX = j * 50 + 25;
      float size = i * 20 + 10;
      fill(100); // choose some value here comming from "j" and/or "i" 
      
      ellipse(posX, posY, size, size);
      println("innen:");
      println(j);
    }
  }
}
