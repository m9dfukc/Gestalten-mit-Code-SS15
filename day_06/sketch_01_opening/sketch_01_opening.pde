float padding = 50.0;
float hz = 1.0;

void setup() {
  frameRate(60);
  size(600, 600);
}

void draw() {
  background(240);
  fill(80);
  noStroke();

  float time = millis() / 1000.0; 

  float sineValue = sineWave(time, hz); 
  float cosineValue = sineWave(time, hz, TWO_PI/4.0);
  
  float minX = width / -2.0 + padding;
  float maxX = width / 2.0 - padding;
  float posX = map(sineValue, -1, 1, minX, maxX);
  
  float minY = height / -2.0 + padding;
  float maxY = height / 2.0 - padding;
  float posY = map(cosineValue, -1, 1, minY, maxY);

  pushMatrix();
    translate(width/2.0, height/2.0);
    ellipse(posX, posY, 20, 20);
  popMatrix();
}

