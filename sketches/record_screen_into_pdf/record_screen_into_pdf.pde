import processing.pdf.*;

boolean pressed = false;
boolean toggle = false;

void setup() {
  size(600, 600);
  frameRate(24);
  background(255);
}

void draw() {
  if (pressed == true && toggle == true) {
    background(255);
    beginRecord(PDF, "recording.pdf");
    pressed = false;
    println("start recording into pdf");
  }
  
  if (toggle) {
    line(mouseX, 0, width-mouseY, height);
  }
  
  if (pressed == true && toggle == false) {
    pressed = false;
    endRecord();
    println("end recording");
  }
}

void keyPressed() {
  if (key == 'r') {
     toggle = !toggle;
     pressed = true;
  }
}
