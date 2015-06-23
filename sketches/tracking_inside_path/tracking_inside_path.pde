/**
 * Simple example of how to check if a tracked object is inside a path 
 *
 * Detect the presence of people and objects in the frame using a simple background-
 * subtraction and binarization technique. To initialize the background, press a key. 
 * Adapt the threshold value to your need. Compare against a "path" image and play a
 * sound if the detected object is inside the path.
 *
 * Requires the Processing Sound library to be installed.
 */


import processing.video.*;
import processing.sound.*;

boolean sampled;
int insideThreshold;
int threshold;
int numPixels;
int[] backgroundPixels;

PImage binaryimage;
PImage pathimage;
Capture video;
TriOsc triOsc;
Env env; 

// Times and levels for the ASR envelope
float attackTime = 1.0;
float sustainTime = 0.002;
float sustainLevel = 1.0;
float releaseTime = 1.0;


void setup() {
  size(640, 480); 
  background(0);
  
  // Load the path image
  pathimage = loadImage("path.png");
  pathimage.filter(THRESHOLD); // convert to "real" b/w image format
    
  // Create an image that stores the b/w binary image
  binaryimage = createImage(width, height, RGB);
  
  // This the default video input, see the GettingStartedCapture 
  video = new Capture(this, width, height);
  
  // Start capturing the images from the camera
  video.start();  
  
  // Set the brightness threshold, everything below gets black
  threshold = 20; 
  
  // Set the minimum amount of pixels that have to be inside the path
  insideThreshold = 30;
  
  numPixels = video.width * video.height;
  // Create array to store the background image
  backgroundPixels = new int[numPixels];
  
  // Create triangle wave and start it (440hz)
  triOsc = new TriOsc(this);
  // Create the envelope 
  env  = new Env(this); 
  
  // no background sample yet
  sampled = false;
}

void draw() {
  fill(255, 0, 0);
  stroke(0, 255, 0);
  strokeWeight(10);
  blendMode(ADD);
  
  if (video.available()) {
    video.read(); // Read a new video frame
    video.loadPixels(); // Make the pixels of video available
    pathimage.loadPixels(); // Make the pixels of path image available

    int insideSum = 0; // number of pixels inside the path 
    for (int i = 0; i < numPixels; i++) { // For each pixel in the video frame and the path image...
      // Fetch the current color in that location, and also the color
      // of the background in that spot
      color pathColor = pathimage.pixels[i]; // only has one channel because it's b/w but the pixels array still returns a rgb color
      color currColor = video.pixels[i];
      color bkgdColor = backgroundPixels[i];
      
      // Extract the red, green, and blue components of the current video pixel's color
      int currR = (currColor >> 16) & 0xFF;
      int currG = (currColor >> 8) & 0xFF;
      int currB = currColor & 0xFF;
      // Convert to grayscale Average
      int currGray = (currR+currG+currB)/3;
      
      // Extract the red, green, and blue components of the background pixel's color
      int bkgdR = (bkgdColor >> 16) & 0xFF;
      int bkgdG = (bkgdColor >> 8) & 0xFF;
      int bkgdB = bkgdColor & 0xFF;
      // Convert to grayscale Average
      int bkgdGray = (bkgdR+bkgdG+bkgdB)/3;
      
      // Extract the brightness value of the path image pixel's
      int pathGray = pathColor & 0xFF; // we only need one channel, remember we did a threshold so all three channels should hold the same value
      
      // Compute the difference 
      int diff = abs(currGray - bkgdGray);

     
      // Render binary image to screen, adapt the threshold value    
      if (diff >= threshold) {
        binaryimage.pixels[i] = color(255, 255, 255);
        if (pathGray > 0) {  
          insideSum += 1;
        }     
      } else {
        binaryimage.pixels[i] = color(0, 0, 0); 
      }
    }
    
    // if there are enough pixels inside the path begin to play the osc
    if (insideSum >= insideThreshold && sampled) {
      triOsc.play(440.0, 1.0);
      env.play(triOsc, attackTime, sustainTime, sustainLevel, releaseTime);
    }
    
    // Draw the binary image to screen
    binaryimage.updatePixels();
    image(binaryimage, 0, 0);
    image(pathimage, 0, 0);
  }
}

// When a key is pressed, capture the background image into the backgroundPixels
// buffer, by copying each of the current frame's pixels into it.
void keyPressed() {
  sampled = true;
  video.loadPixels();
  arraycopy(video.pixels, backgroundPixels);
}
