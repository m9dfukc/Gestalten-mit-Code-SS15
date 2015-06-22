/**
 * Track Objects 
 *
 * Detect the presence of people and objects in the frame using a simple background-
 * subtraction and binarization technique. To initialize the background, press a key. 
 * Adapt the threshold value to your need.
 *
 * Requires to install the 'blobscanner' library via 'sketch/Import Library/Add Library'
 * for reference check the examples https://github.com/robdanet/blobscanner
 */


import processing.video.*;
import blobscanner.*;

int threshold;
int numPixels;
int[] backgroundPixels;

PImage binaryimage;
Capture video;
Detector blobdetector;

void setup() {
  size(640, 480); 
  
  // This initializes the blobdetector
  blobdetector = new Detector(this, 255);
  
  // Create an image that stores the b/w binary image
  binaryimage = createImage(width, height, RGB);
  
  // This the default video input, see the GettingStartedCapture 
  video = new Capture(this, width, height);
  
  // Start capturing the images from the camera
  video.start();  
  
  // Set the brightness threshold, everything below gets black
  threshold = 20; 
  
  numPixels = video.width * video.height;
  // Create array to store the background image
  backgroundPixels = new int[numPixels];
}

void draw() {
  fill(255, 0, 0);
  stroke(0, 255, 0);
  strokeWeight(5);
  
  if (video.available()) {
    video.read(); // Read a new video frame
    video.loadPixels(); // Make the pixels of video available
    // Difference between the current frame and the stored background
    int presenceSum = 0;
    for (int i = 0; i < numPixels; i++) { // For each pixel in the video frame...
      // Fetch the current color in that location, and also the color
      // of the background in that spot
      color currColor = video.pixels[i];
      color bkgdColor = backgroundPixels[i];
      
      // Extract the red, green, and blue components of the current pixel's color
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
      
      // Compute the difference of the red, green, and blue values
      int diff = abs(currGray - bkgdGray);

      // Add these differences to the running tally
      presenceSum += diff;
      
      // Render binary image to screen, adapt the threshold value    
      if (diff >= threshold) {
        binaryimage.pixels[i] = color(255, 255, 255);
      } else {
        binaryimage.pixels[i] = color(0, 0, 0); 
      }
      
    }
    
    // Draw the binary image to screen
    binaryimage.updatePixels();
    image(binaryimage, 0, 0);
    
    // Create a scaled version of the 'binaryimage' for blobdetector usage
    PImage scaledimage = createImage(width, height, RGB);
    arraycopy(binaryimage.pixels, scaledimage.pixels);
    scaledimage.updatePixels();
    scaledimage.filter(THRESHOLD);
    scaledimage.resize(width/4, height/4);
    
    // Spinup the blob detector
    blobdetector.imageFindBlobs(scaledimage);
    blobdetector.loadBlobsFeatures();
    // Computes the blob center of mass.
    blobdetector.findCentroids();
    
    // Draw the blobs centroid to screen, for each blob in the image..
    for(int i = 0; i < blobdetector.getBlobsNumber(); i++) {
      point(blobdetector.getCentroidX(i) * 4, blobdetector.getCentroidY(i)*4);
    }
  }
}

// When a key is pressed, capture the background image into the backgroundPixels
// buffer, by copying each of the current frame's pixels into it.
void keyPressed() {
  video.loadPixels();
  arraycopy(video.pixels, backgroundPixels);
}
