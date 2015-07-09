
PGraphics pg;

void setup() {
  size(600, 600);
  noStroke();
  pg = createGraphics(width, height);
}

void draw() {
  pg.beginDraw();
  pg.background(0);
  pg.ellipse(250, 300, 70, 70);
  pg.endDraw();

  background(255, 255, 0);
  fill(255, 0, 0);
  ellipse(300, 300, 100, 100);

  blend(pg, 0, 0, width, height, 0, 0, width, height, MULTIPLY);
}