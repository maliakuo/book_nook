#define BUTTON_PIN 21 // GPIO21 pin connected to button
#define BUTTON_PIN_2 17 // GPIO17 pin connected to button

#include <Servo.h>

Servo myservo;  // create servo object to control a servo
// twelve servo objects can be created on most boards

int pos = 90;    // variable to store the servo position


// Variables will change:
int lastState = HIGH; // the previous state from the input pin
int currentState;     // the current reading from the input pin

int lastState2 = HIGH; // the previous state from the input pin
int currentState2;     // the current reading from the input pin

int pressedButtons[3];
int correctPress[3] = {1, 2, 2};

bool right = false;

int counter = 0;

void setup() {
  Serial.begin(9600);
  // initialize the pushbutton pin as an pull-up input
  pinMode(BUTTON_PIN, INPUT_PULLUP);
  pinMode(BUTTON_PIN_2, INPUT_PULLUP);
  myservo.attach(13);  // attaches the servo on pin 13 to the servo object
}

void loop() {
  // read the state of the switch/button:
  currentState = digitalRead(BUTTON_PIN);
  currentState2 = digitalRead(BUTTON_PIN_2);

  if(lastState == LOW && currentState == HIGH) {
    if (counter < 3) {
      pressedButtons[counter] = 1;
      counter++;
      // Serial.println(counter);
      Serial.print(1);
      // Serial.println("The state of button 1 changed from LOW to HIGH");
    } 
  }
  lastState = currentState;

  if(lastState2 == LOW && currentState2 == HIGH) {
    if (counter < 3) {
        pressedButtons[counter] = 2;
        counter++;
        Serial.print(2);
        // Serial.println(counter);
        // Serial.println("The state of button 2 changed from LOW to HIGH");
      } 
  }
  lastState2 = currentState2;

  if (counter == 3) {
    // for (int i = 0; i < 3; i++) {
    //   Serial.println(pressedButtons[i]);
    // }


    for (int i = 0; i < 3; i++) {
      if (pressedButtons[i] == correctPress[i]) {
        right = true;
      } else {
        Serial.print("wrong");
        right = false;
        break;
      }
    } 

    if (right) {
      Serial.print("right");
      for (pos = 90; pos >= 0; pos -= 1) { // goes from 0 degrees to 180 degrees
    // in steps of 1 degree
      myservo.write(pos);              // tell servo to go to position in variable 'pos'
      delay(15);                       // waits 15ms for the servo to reach the position
      }
    }

    pressedButtons[0] = 0;
    pressedButtons[1] = 0;
    pressedButtons[2] = 0;

    counter = 0;

  }

  // for (pos = 0; pos <= 180; pos += 1) { // goes from 0 degrees to 180 degrees
  //   // in steps of 1 degree
  //   myservo.write(pos);              // tell servo to go to position in variable 'pos'
  //   delay(15);                       // waits 15ms for the servo to reach the position
  // }
  // for (pos = 180; pos >= 0; pos -= 1) { // goes from 180 degrees to 0 degrees
  //   myservo.write(pos);              // tell servo to go to position in variable 'pos'
  //   delay(15);                       // waits 15ms for the servo to reach the position
  // }
}
