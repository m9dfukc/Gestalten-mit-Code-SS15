import processing.pdf.*;
import processing.sound.*;

SoundFile sample;
Amplitude rms;

float stack[] = new float[150];
int counter = 0;



public void setup() {
  //size(512,512);

  size(400, 400, PDF, "filename.pdf");

  background(255);
  frameRate(30);




  sample = new SoundFile(this, "sound1.mp3");

  sample.play(0.5);
  sample.loop();

  // Create and patch the rms tracker
  rms = new Amplitude(this);
  rms.input(sample);
}      

public void draw() {
  background(125, 255, 125);

  float rmsValue = rms.analyze();

  stack[counter] = rmsValue;

  for (int i = 0; i < 150; i++) {
    float scale = map(stack[i], 0, 1.0, 0, height);
    float posX = map(i, 0, 150, 0, width);
    line(posX, height, posX, height-scale);
  }

  PGraphicsPDF pdf = (PGraphicsPDF) g;  // Get the renderer
  // When finished drawing, quit and save the file
  if (frameCount == 150) {
    endRecord();
    exit();
  }

  counter = counter + 1;
  if (counter >= 150) {
    counter = 0;
  } 


}
