const int knockSensor = A0; // the piezo is connected to analog pin 0
const int threshold = 30;   // threshold value to decide when the detected sound is a knock or not

int sensorReading = 0;      // variable to store the value read from the sensor pin

void setup() {
  Serial.begin(9600);       // use the serial port
}

void loop() {
  // read the sensor and store it in the variable sensorReading:
  sensorReading = analogRead(knockSensor);

  // if the sensor reading is greater than the threshold:
  if (sensorReading >= threshold) {
    // send the string "a" back to the computer
    Serial.print("a");
    delay(300);
  }
  
  delay(30);  // delay to avoid overloading the serial port buffer
}


