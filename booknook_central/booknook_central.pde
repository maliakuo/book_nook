/**
 * Words. 
 * 
 * The text() function is used for writing words to the screen.
 * The letters can be aligned left, center, or right with the 
 * textAlign() function. 
 */
 
import processing.serial.*;
import processing.sound.*;

Serial arduino1;  // Create object from Serial class
Serial arduino2;

String newval;
String message;
String input;
StringList chat;

int xval;
int yval;
int iterator;
boolean stage1;

  
//PFont f;
  
void setup() {
  fullScreen();
  //size(400, 400);
  
  print(Serial.list());
  
  String port1 = Serial.list()[8];
  arduino1 = new Serial(this, port1, 9600);
  
  String port2 = Serial.list()[9];
  arduino2 = new Serial(this, port2, 9600);
  
  chat = new StringList();
  greeting();
  
  newval = "null";
    input = "null";
  
  stage1 = true;

  xval = 40;
  yval = 120;
  
  iterator = 0;
  
  // Create the font
  //printArray(PFont.list());
  //f = createFont("SpaceMono-Regular.ttf", 18);
  //textFont(f);
}

void draw() {
  background(255, 255, 237);
  //rect(800, 120, 600, 400);
  
  textSize(18);
  fill(255);
  
  readData(stage1);
  
  
  if (!newval.equals("null")) {
    textSize(24);
    fill(0);
    //text("you pressed:", 1000, 220);
    text("you pressed: ", 800, 420);
    text(input, 800, 520);
  }
  

  //readData();
  
  //textSize(18);
  //fill(0);
  //text("hello", xval, yval);   
  
  for (int i = iterator; i < chat.size(); i++) {
    String message = chat.get(i);
    //print(message);
    
    textSize(18);
    fill(0);
    int new_y = yval + (i * 20);
    //if (new_y > 200) {
    //  iterator++;
    //  break;
    //}
    text(message, xval, new_y);

  }
}

//void readData(){
  
//  if (arduino1.available() > 0) {  
//    print("true");

//    // If data is available,
//    newval = arduino1.readString(); 
//    input = newval;
//  }
//}

//void readData() {
//  if (arduino1.available() > 0) {  
//      // If data is available,
//      newval = arduino1.readString(); 
      
//      if (newval.equals("green")) {
//        input = "green";
//      } else if (newval.equals("blue")) {
//        input = "blue";
//      } else if  (newval.equals("bluewrong")) {
//        input = "incorrectly. resetting, try again";
//      } else if (newval.equals("greenwrong")) {
//        input = "incorrectly. resetting, try again";
//      } else if (newval.equals("blueright")) {
//        input = "nice! you can move on";
//      } else {
//        input = "incorrectly. resetting, try again";
//      }
//    }
//}

void readData(boolean stage1){
  
  if (stage1) {
    if (arduino1.available() > 0) {  
      // If data is available,
      print("here");
      newval = arduino1.readString(); 
      print(newval);
      
      if (newval.equals("green")) {
        input = "green";
      } else if (newval.equals("blue")) {
        input = "blue";
      } else if  (newval.equals("bluewrong")) {
        input = "incorrectly. resetting, try again";
      } else if (newval.equals("greenwrong")) {
        input = "incorrectly. resetting, try again";
      } else if (newval.equals("blueright")) {
        input = "nice! you can move on";
        stage1 = false;
      } else {
        input = "incorrectly. resetting, try again";
      }
    }
  } else
  {
    if (arduino2.available() > 0) {  
      // If data is available,
      newval = arduino2.readString(); 
      print(newval);
      
      if (newval.equals("fairies")) {
        input = "fairies";
      } else if (newval.equals("mushrooms")) {
        input = "mushrooms";
      } else {
        input = "you've finished";
      }
    }
  }
}

void greeting() {
  chat.append("welcome, destined one");
  chat.append("i, guardian of shadows, greet you in our realm");
  chat.append("i wonder what distant lands you call home...");
  chat.append("darkness has gripped our land");
  chat.append("but you—a beacon of hope—have arrived as foretold");
  chat.append(".....");
  chat.append("embrace your purpose, wield courage, and illuminate our world");
  chat.append("may the stars guide your triumph.");
  chat.append(".....");
  chat.append("should you hope to save us, you must undertake three main objectives.");
  chat.append("first, navigate to the portal to our world, hidden behind a wooden door.");
  chat.append("to enter, you must prove your worth by correctly solving this riddle.");
  chat.append(".....");
  chat.append("In a world of buttons, a puzzle unfolds,");
  chat.append("A sequence of colors, a story to be told.");
  chat.append("Begin with nature's hue, vibrant and bright,");
  chat.append("Press me first, and set things right.");
  chat.append(".....");
  chat.append("Next in line, a shade of the vast, open sea,");
  chat.append("A button of tranquility, press it with glee.");
  chat.append("But don't stop there, the journey's not through,");
  chat.append("Once more in azure, a repeat is due.");
  chat.append(".....");
  chat.append("In this coded dance, your actions speak true,");
  chat.append("Which buttons to press? Solve the riddle, it's up to you.");
  chat.append("tap the buttons a total of 3 times in the right order to pass.");
}

//void drawType(float x) {
//  line(x, 0, x, 65);
//  line(x, 220, x, height);
//  fill(0);
//  text("ichi", x, 95);
//  fill(51);
//  text("ni", x, 130);
//  fill(204);
//  text("san", x, 165);
//  fill(255);
//  text("shi", x, 210);
//}
