// // ESP32 Touch Test
// // Just test touch pin - Touch0 is T0 which is on GPIO 4.

// void setup() {
//   Serial.begin(115200);
//   delay(1000); // give me time to bring up serial monitor
//   Serial.println("ESP32 Touch Test");
// }

// void loop() {
//   Serial.println(touchRead(4));  // get value of Touch 0 pin = GPIO 4
//   delay(1000);
// }

#include <Stepper.h>

const int stepsPerRevolution = 4000;  // change this to fit the number of steps per revolution

// ULN2003 Motor Driver Pins
#define IN1 19
#define IN2 18
#define IN3 5
#define IN4 17

#define TOUCH_BEAST 4
#define TOUCH_MUSH 2
#define TOUCH_FISH 27
#define fairy1 21
#define fairy2 12
#define fairy3 26

#define mush1 25
#define mush2 33
#define mush3 32

#define final_light 22

// initialize the stepper library
Stepper myStepper(stepsPerRevolution, IN1, IN3, IN2, IN4);
bool spin = false;
bool fairy = false;
bool mushrooms = false;

void setup() {
  // set the speed at 5 rpm
  myStepper.setSpeed(5);
  pinMode (fairy1, OUTPUT);
  pinMode (fairy2, OUTPUT);
  pinMode (fairy3, OUTPUT);

  pinMode (mush1, OUTPUT);
  pinMode (mush2, OUTPUT);
  pinMode (mush3, OUTPUT);

  pinMode (final_light, OUTPUT);
  // initialize the serial port
  Serial.begin(115200);
}

void loop() {
  // step one revolution in one direction:
  // Serial.println(touchRead(4));

  int touchBeast = touchRead(TOUCH_BEAST);
  Serial.println(touchBeast);

  int touchFish = touchRead(TOUCH_FISH);
  Serial.println(touchFish);

  int touchMush = touchRead(TOUCH_MUSH);
  Serial.println(touchMush);

  // digitalWrite(ledPin, HIGH);

  // if (touchBeast < 30) {
  //   digitalWrite(fairy1, HIGH);
  //   digitalWrite(fairy2, HIGH);
  //   digitalWrite(fairy3, HIGH);
  // } else {
  //   digitalWrite(fairy1, LOW);
  //   digitalWrite(fairy2, LOW);
  //   digitalWrite(fairy3, LOW);
  // }

  // if (touchMush < 30) {
  //   digitalWrite(mush1, HIGH);
  //   digitalWrite(mush2, HIGH);
  //   digitalWrite(mush3, HIGH);
  // } else {
  //   digitalWrite(mush1, LOW);
  //   digitalWrite(mush2, LOW);
  //   digitalWrite(mush3, LOW);
  // }

  if (touchBeast < 30) {
    fairy = true;
  }

  if (touchMush < 30) {
    mushrooms = true;
  }

   if (touchFish < 30) {
    spin = true;
  } 

  // if (touchFish < 30) {
  //   spin = true;
  // } else {
  //   spin = false;
  // }

  if (fairy && mushrooms && spin) {
    digitalWrite(final_light, HIGH);
  }

  if (fairy) {
    digitalWrite(fairy1, HIGH);
    digitalWrite(fairy2, HIGH);
    digitalWrite(fairy3, HIGH);
  } else {
    digitalWrite(fairy1, LOW);
    digitalWrite(fairy2, LOW);
    digitalWrite(fairy3, LOW);
  }

  if (mushrooms) {
    digitalWrite(mush1, HIGH);
    digitalWrite(mush2, HIGH);
    digitalWrite(mush3, HIGH);
  } else {
    digitalWrite(mush1, LOW);
    digitalWrite(mush2, LOW);
    digitalWrite(mush3, LOW);
  }

  if (spin) {
    myStepper.step(stepsPerRevolution);
  }

  // Serial.println("clockwise");
  // myStepper.step(stepsPerRevolution);
  // delay(1000);

  // // step one revolution in the other direction:
  // Serial.println("counterclockwise");
  // myStepper.step(-stepsPerRevolution);
  // delay(1000);
}