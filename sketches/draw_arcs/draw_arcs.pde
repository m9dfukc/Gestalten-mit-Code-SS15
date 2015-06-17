
int counter = 0;

void setup() {
  size(400, 400);
  frameRate(30);
}

void draw() {
  background(255);
  noFill();
  
  arcs(20, 0, TWO_PI);
}

// start = 0, end max TWO_PI
void arcs(int count, float start, float end) {
  for (int i = 0; i < count; i++) {
    float progress = map(i, 0, count, start, end);
    float size = map(i, 0, count, 30, 100);

    arc(width/2, height/2, size, size, 0, progress);
  }
}

