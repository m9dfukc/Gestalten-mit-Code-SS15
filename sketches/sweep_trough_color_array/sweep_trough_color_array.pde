color colors1[] = {
  color(100, 0, 100), 
  color(200, 0, 0), 
  color(0, 255, 0) 
};

color colors2[] = new color[100];


void setup() {
 size(400, 400);
 background(255);
 
 for (int i=0; i<100; i++) {
   int r = int(map(sin(i * TWO_PI / 100), -1, 1, 0, 255));
   int g = int(map(cos(i * TWO_PI / 100), -1, 1, 0, 255));
   int b = int(map(sin(i * PI / 100), -1, 1, 0, 255));
   colors2[i] = color(r, g, b);
 }
 
}

void draw() {
  int colorIndex1 = int(map(mouseX, 0, width, 0, 3)); 
  int colorIndex2 = int(map(mouseX, 0, width, 0, 99)); 
  
  fill(colors1[colorIndex1]);
  stroke(colors1[colorIndex1]);
  ellipse(150, 200, 60, 60);
  
  fill(colors2[colorIndex2]);
  stroke(colors2[colorIndex2]);
  ellipse(250, 200, 60, 60);
  
}

