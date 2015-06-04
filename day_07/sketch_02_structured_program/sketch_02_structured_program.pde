/* This is an example of a slightly more complex sketch. It demonstrates our custom build 
 * Wavefunctions class and resembles the animation found on the archery blog which can be found here:
 * http://intothecontinuum.tumblr.com/post/57763145216/these-remarks-make-some-interesting-observations
 *
 * Reference to the used (and new) processing functions:
 * rotate: https://processing.org/reference/rotate_.html
 * push-/popMatrix: https://processing.org/reference/pushMatrix_.html
 *
 * Your homework is to incorporate the Sound library into this sketch and use
 * the position of the ellipses to modulate the sound (pan/amp/pitch ... u name it).
 * try also to change various parameters to get soem more complex motion!
 */

float speedHz, rotationAngle;
int count = 10;
boolean drawPath = false;
Wavefunction[] osc = new Wavefunction[count];

void setup() {
  size(600, 600);
  frameRate(60);
  
  speedHz = 0.25; // 0.25 rotations per second
  rotationAngle = (PI / count); // calculate the partial rotation (in radians) for each path
  
  for (int i=0; i < count; i++) {
    // calculate the phaseshift of every wavefunction, play with this (f.e. multiply by 0.5 ...)
    float phase = (PI / count) * i;
    // instanciate our wavefunction with a SINE wave, speed in herz, and a calculated offset
    // try other wavefunctions f.e. Wavefunction.TRIANGLE, look into the Wavefunctions tab for options
    // or toggle every odd i another wavefunction and a different offset
    osc[i] = new Wavefunction(Wavefunction.SINE, speedHz, phase);
  }
 
}

void draw() {
  background(255);
  fill(0);
  float time = millis() / 1000.0; // our timeline in seconds
 
  pushMatrix();
    translate(width/2, height/2); // translate our coordinate system to the center of the screen
    ellipse(0, 0, 5, 5); // draw center point
    
    for (int i=0; i < count; i++) {
      // calculate the position (x axis) for each ellipse
      // here the phaseshift comes into play (see line 15, where we instanciate or Wavefunction)
      float rawPos = osc[i].process(time);
      float pos = map(rawPos, -1, 1, -height/2.0, height/2.0);
      
      // rotate our coordinate system by the precaluculated angle,
      // this adds up for cycle of the for loop. Play with this value!
      rotate(rotationAngle);
      
      if (drawPath) {
        // draw the path
        stroke(240);
        line(0, -height/2.0, 0, height/2.0);
      }
      // draw our ellipse
      stroke(0);
      ellipse(0, pos, 20, 20);
    }
  popMatrix(); 

}

