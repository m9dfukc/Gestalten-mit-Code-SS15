import processing.sound.*;
import processing.serial.*;

int numFiles = 5;
SoundFile files[];
Serial myPort;

void setup() {
  size(640, 360);
  background(255);

  files = new SoundFile[numFiles];

  // Load a soundfile from the /data folder of the sketch and play it back
  for (int i=0; i < numFiles; i++) {
    files[i] = new SoundFile(this, "s"+(i+1)+".aif");
  } 
  
  // Show a list of all serial ports
  println(Serial.list());
  
  // connect to our arduino device
  String portName = Serial.list()[3];
  myPort = new Serial(this, portName, 9600);
}

void serialEvent(Serial myPort) {
  // read a byte from the serial port:
  int inByte = myPort.read();
  if (inByte == 'a') {
    int index = int(random(0, numFiles));
    files[index].play();
    println("knock knock!");
  }
}

void draw() {
}

