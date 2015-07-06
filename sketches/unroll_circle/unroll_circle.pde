/* This sketch shows how to unroll circles to its circumference
 * http://blog.matthen.com/post/98459487701/unrolling-these-circles-fills-a-triangle-with-base
 *
 * could be improved efficiency wise but still fine enought to serve as an example,
 * todo: implement this as a class/object contruct
 */


// Global values holding play/pause values
boolean pause = false;
float stopped = 0.0;

void setup() {
  size(600, 600);
  smooth();
  noFill();
  strokeWeight(2);
  frameRate(60);
}

void draw() {
  background(255);

  // only count up time if pause == false
  float time = pause ? stopped : (millis() / 1000.0) - stopped;

  // start wave function generator 1
  float value = sineWave(time, 0.15, PI/2.0);
  float phase = map(value, 1, -1, 0, 1);

  // start wave function generator 2
  float value2 = triangleWave(time, 0.15, PI/2.0);
  float phase2 = map(value2, 1, -1, 0, 1);

  pushMatrix();
    // translate our coordinate system to the center of the screen
    translate(width/2, height/2);

    // Generate first letter, left side of the screen
    pushMatrix();
      translate(-100, 0);    
      letterO(phase, 8, 20, 10);
    popMatrix();

    // Generate next letter, right side of the screen
    pushMatrix();
      translate(150, 0);   
      letterO(phase2, 12, 10, 10);
    popMatrix();

  popMatrix();
}

// out letter drawing function, will be always aligned to the center if the screen
// takes 'phase' (time), 'num' (number of lines), 'minDim' (minimum inner dimension), 'margin' (line margin) 
void letterO(float phase, int num, float minDim, float margin) {
  // count the maximum (outer) circle dimension,
  // compute the longest (outer) circle circumference 
  float maxDim = ((num - 1) * margin) + minDim;
  float range  = maxDim * PI;
  float dist   = range * phase;

  pushMatrix();
    // should be cntered in it's unrolled state
    translate(-maxDim/2 + minDim, -range/2);
    for (int i=0; i < num; i++) {
      // current circle dimension / circumference
      float circleDim = minDim + (i * margin);
      float circleCirc = circleDim * PI;
      // compute the current circle radians
      float radians = TWO_PI - (maxDim / circleDim * phase * TWO_PI);
      // compute the length of the corresponding line and it's x position
      float lenght = (dist <= circleCirc) ? dist : circleCirc;
      float posX = circleDim / 2.0;

      // draw the whole thing
      arc(0, dist, circleDim, circleDim, 0, radians);
      line(posX, 0, posX, lenght);
    }
  popMatrix();
}

// toggle between timeline pause and play (use key 'p')
void keyPressed() {
  if (key == 'p' || key == 'P') {
    pause = !pause;
    stopped = millis() / 1000.0 - stopped;
  }
}

