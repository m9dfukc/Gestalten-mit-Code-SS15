/* Ok let's play arround with array's 
 * let's make up two arrays, one filled with sine values
 * one filled with cosine values; combined together we 
 * can print a circle with those values.
 */
 
int degrees = 360;
float[] cos_vals = new float[degrees];
float[] sin_vals = new float[degrees];

void setup() {
  size(600, 600);
  
  noFill();
  stroke(220, 10, 10);
  
  // fill up our array with one period of the cosine/sine
  for (int i = 0; i < degrees; i++) {
    float factor; // let's play arround with the factor f.e.: comment/uncomment below
    //factor = map(i, 0, degrees-1, 0, 1);
    factor = 1.0;
    
    cos_vals[i] = cos(TWO_PI/degrees * i) * factor;
    sin_vals[i] = sin(TWO_PI/degrees * i) * factor;
  }
}


void draw() {
  background(220);
  
  // let's draw a circle with sine and cosine values ... filled in our arrays:
  beginShape();
  for (int i = 0; i < degrees; i++) {
    // we know that sine, cosine ... always go between -1 and 1
    // now let's map that into our viewport range
    float padding = 30; 
    float posX = map(cos_vals[i], -1, 1, padding, width - padding);
    float posY = map(sin_vals[i], -1, 1, padding, height - padding);
    vertex(posX, posY);
  }
  endShape();
}



