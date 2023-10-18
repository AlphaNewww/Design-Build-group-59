#include <SoftwareSerial.h>

// Initializes SoftwareSerial for Bluetooth communication on pins 14 and 15
SoftwareSerial BT(14, 15);

// Initializes SoftwareSerial for Bluetooth communication on pins 14 and 15
#define Limit 8
#define FLimit 20

// Defines the large and small time periods for motor control
#define Period 50
#define BP 25

// Offset values for left and right wheels
int leftOffset;
int rightOffset;

// Defines the pins for motor control
int leftMotor1 = 4;
int leftMotor2 = 5;
int leftENA = 3;
int rightMotor1 = 6;
int rightMotor2 = 7;
int rightENA = 2;

// Defines the pins for ultrasonic sensors' trigger and echo
int trigPinF = 11;
int trigPinL = 13;
int trigPinR = 8;
int echoPinF = 10;
int echoPinL = 12;
int echoPinR = 9;

// Variables to hold the duration of the ultrasonic pulse and the calculated distance
long durationF;
float distanceF;
long durationL;
float distanceL;
long durationR;
float distanceR;

void setup() {
  // Initializes the Bluetooth module
  BT.begin(9600);
  // Sets the pin modes for ultrasonic sensors and motors
  pinMode(trigPinF, OUTPUT);
  pinMode(trigPinL, OUTPUT);
  pinMode(trigPinR, OUTPUT);
  pinMode(echoPinF, INPUT);
  pinMode(echoPinL, INPUT);
  pinMode(echoPinR, INPUT);
  pinMode(leftMotor1, OUTPUT);
  pinMode(leftMotor2, OUTPUT);
  pinMode(leftENA, OUTPUT);
  pinMode(rightMotor1, OUTPUT);
  pinMode(rightMotor2, OUTPUT);
  pinMode(rightENA, OUTPUT);
  Serial.begin(9600);
}


// Function to trigger ultrasonic sensors and calculate distances
void sensor() {
  // Triggers sensor 1
  digitalWrite(trigPinF, LOW);
  delayMicroseconds(2);
  digitalWrite(trigPinF, HIGH);
  delayMicroseconds(10);
  digitalWrite(trigPinF, LOW);

  // receive echo signal and calculate distance
  durationF = pulseIn(echoPinF, HIGH);
  distanceF = durationF * 0.034 / 2;

  // Triggers sensor 2
  digitalWrite(trigPinL, LOW);
  delayMicroseconds(2);
  digitalWrite(trigPinL, HIGH);
  delayMicroseconds(10);
  digitalWrite(trigPinL, LOW);

  // receive echo signal and calculate distance
  durationL = pulseIn(echoPinL, HIGH);
  distanceL = durationL * 0.034 / 2;

  // Triggers sensor 3
  digitalWrite(trigPinR, LOW);
  delayMicroseconds(2);
  digitalWrite(trigPinR, HIGH);
  delayMicroseconds(10);
  digitalWrite(trigPinR, LOW);

  // receive echo signal and calculate distance
  durationR = pulseIn(echoPinR, HIGH);
  distanceR = durationR * 0.034 / 2;

  Serial.print("distanceF: ");
  Serial.print(distanceF);
  Serial.print(" cm");
  Serial.print("   distanceL: ");
  Serial.print(distanceL);
  Serial.print(" cm");
  Serial.print("   distanceR: ");
  Serial.print(distanceR);
  Serial.println(" cm");
}

// Function to control the robot's movement.
// @param left Indicates the direction for the left motor (1 for forward, -1 for backward, 0 for stop).
// @param right Indicates the direction for the right motor (1 for forward, -1 for backward, 0 for stop).
// @param leftDuty Sets the duty cycle (0 ~ 255) for the left motor.
// @param rightDuty Sets the duty cycle (0 ~ 255) for the right motor.
// @param T Defines the time period for motor control.
void run(int left, int right, int leftDuty, int rightDuty, int T) {
  if (left == 1) { //left forward turn
    digitalWrite(leftMotor1, HIGH);
    digitalWrite(leftMotor2, LOW);
  }
  if (left == -1) { //left backword turn
    digitalWrite(leftMotor1, LOW);
    digitalWrite(leftMotor2, HIGH);
  }
  analogWrite(leftENA, leftDuty); //left speed

  if (right == 1) { //right forward turn
    digitalWrite(rightMotor1, HIGH);
    digitalWrite(rightMotor2, LOW);
  }
  if (right == -1) { //right backword turn
    digitalWrite(rightMotor1, LOW);
    digitalWrite(rightMotor2, HIGH);
  }
  analogWrite(rightENA, rightDuty); //right speed
  if(left == 0 && right == 0){
    digitalWrite(rightMotor1, LOW);
    digitalWrite(rightMotor2, LOW);
    digitalWrite(leftMotor1, LOW);
    digitalWrite(leftMotor2, LOW);
  }
  delay(T);
}

// Function to move the robot forward.
// @param delta Adjusts the base speed by this value.
void goForward(int delta) {
  run(1, 1, 90 + delta + leftOffset, 90 + delta + rightOffset, Period); 
}

void goBackward() {
  run(-1, -1, 60, 60, BP * 0.25);
}

void turnLeft() {
  run(-1, 1, 75, 75, Period * 7);
}

void turnRight() {
  run(1, -1, 75, 75, Period * 7);
}

/**
 * The motionLogic function contains the logic for robot movement based on sensor readings.
 */
void motionLogic() {
  
  // Checks if there's enough space in front of the robot
  if(distanceF > FLimit && distanceF < 300) {  
    
    // Checks if there's space on both left and right sides
    if(distanceL > Limit && distanceR > Limit) {  
      goForward(+20);  // Moves forward
    }
    
    // Checks if there's only space on the right side
    if(distanceL < Limit && distanceR > Limit) {  
      turnRight();  // Makes a slight right turn
    }
    
    // Checks if there's only space on the left side
    if(distanceL > Limit && distanceR < Limit) {  
      turnLeft();  // Makes a slight left turn
    }
    
    // Checks if there's no space on either side
    if(distanceL < Limit && distanceR < Limit) {  
      goForward(0);  // Continues forward
    }
  }
  
  // Checks if there's not enough space in front
  if(distanceF < FLimit){  
    
    // Checks if there's no space on either side and makes a U-turn
    if(distanceL < 12 && distanceR < 12) {
      run(0, 0, 0, 0, BP);  // Stops
      run(-1, 1, 150, 145, Period);  // Makes a U-turn
    }
    
    // Checks if there's more space on the left and makes a 90 degree left turn
    if(distanceL > distanceR) {  
      run(0, 0, 0, 0, BP);  // Stops
      run(-1, 1, 75, 70, Period);  // Makes a 90 degree left turn
    }
    
    // Checks if there's more space on the right and makes a 90 degree right turn
    if(distanceR > distanceL) {  
      run(0, 0, 0, 0, BP);  // Stops
      run(1, -1, 75, 70, Period);  // Makes a 90 degree right turn
    }
  }
  
  // Checks if there's a large space in front, possibly indicating the robot has exited the maze
  if(distanceF > 300) {  
    run(0, 0, 0, 0, Period);  // Stops
  }
  
  delay(500);  // Adds a delay before the next loop iteration
}

// Code below is adapted from Xiang Ni's implementation
void UploadDistance() {
  delay(500);
 String message = "front:[" + String(distanceF)+"]";
 BT.write(message.c_str());

 message = "left:[" + String(distanceL)+"]";
 BT.write(message.c_str());

 message = "right:[" + String(distanceR)+"]";
 BT.write(message.c_str());
}

// Main loop to continuously check sensor data, update distances, and control motor logic
void loop() {
  sensor();
  UploadDistance();
  motionLogic();
}