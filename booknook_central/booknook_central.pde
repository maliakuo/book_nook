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
StringList chat;

int xval;
int yval;

  
//PFont f;
  
void setup() {
  fullScreen();
  size(400, 400);
  
  print(Serial.list());
  
  String port1 = Serial.list()[7];
  arduino1 = new Serial(this, port1, 9600);
  
  chat = new StringList();

  xval = 40;
  yval = 120;
  
  // Create the font
  //printArray(PFont.list());
  //f = createFont("SpaceMono-Regular.ttf", 18);
  //textFont(f);
}

void draw() {
  background(255, 255, 237);
  readData();
  
  //textSize(18);
  //fill(0);
  //text("hello", xval, yval);
    
  //int max_y = yval * chat.size();
  
  for (int i = 0; i < chat.size(); i++) {
    String message = chat.get(i);
    print(message);
    
    textSize(18);
    fill(0);
    text(message, xval, (yval * (i + 1)));
  }
}

void readData(){
  
  if (arduino1.available() > 0) {  

    // If data is available,
    newval = arduino1.readString(); 
    if (newval != null) {
      chat.append(newval);
      //print(newval);
    }
  }
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
