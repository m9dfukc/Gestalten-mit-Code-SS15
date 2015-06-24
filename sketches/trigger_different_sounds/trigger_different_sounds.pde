import processing.sound.*;

AudioDevice device;
SoundFile[] file;

// Define the number of samples 
int numsounds = 5;
int rndIndex = 0;

color colors[];

void setup(){
  size(640, 360);
  background(255);
  
  // Create a Sound renderer and an array of empty soundfiles and assign random colors
  file = new SoundFile[numsounds];
  colors = new color[numsounds];
  
  // Load 5 soundfiles from a folder in a for loop. By naming the files 1., 2., 3., n.aif it is easy to iterate
  // through the folder and load all files in one line of code.
  for (int i = 0; i < numsounds; i++){
    file[i] = new SoundFile(this, "s" + (i+1) + ".aif");
    int rR = int(random(0, 255));
    int rG = int(random(0, 255));
    int rB = int(random(0, 255));
    colors[i] = color(rR, rG, rB);
  }
}

void draw(){
  noStroke();
  fill(colors[rndIndex]);
  rect(0, 0, width, height);
}



void keyPressed() {
  rndIndex = int(random(0, 5));  
  file[rndIndex].play(1.0, 1.0);
}
