import processing.sound.*;

int numFiles = 2;
SoundFile files[];

void setup() {
  size(640, 360);
  background(255);
  
  files = new SoundFile[numFiles];
  
  // Load a soundfile from the /data folder of the sketch and play it back
  files[0] = new SoundFile(this, "s1.aif");
  files[1] = new SoundFile(this, "s2.aif");
}

void keyPressed() {
  if (key == 'a') {
    files[0].play();
  }
  
  if (key == 's') {
    files[1].play();
  }
  
}

void draw() {
}
