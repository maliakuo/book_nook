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
StringList chat2;
StringList chat3;

PFont f;

int xval;
int yval;
int iterator;
boolean stage1 = true;
boolean stage3 = false;

boolean fairy = false;
boolean shroom = false;
boolean fishies = false;


boolean firstHalfGreeting = false;
boolean secondHalfGreeting = false;
boolean chimesPlayed = false;



boolean secondRiddle = false;
  
boolean winMsg = false;  
  
//PFont f;
PFont sixty;
// The font "andalemo.ttf" must be located in the 
      // current sketch's "data" directory to load successfully
  
SoundFile chimes;
SoundFile forest;
  
void setup() {
  fullScreen();
  //size(400, 400);
  
  //print(Serial.list());

  
  String port1 = Serial.list()[3];
  arduino1 = new Serial(this, port1, 9600);
  
  String port2 = Serial.list()[2];
  arduino2 = new Serial(this, port2, 9600);
  
  chimes = new SoundFile(this, "chimes.mp3");
  forest = new SoundFile(this, "forest.mp3");

  
  chat = new StringList();
  chat2 = new StringList();
  chat3 = new StringList();
  
  f = loadFont("Luminari-Regular-48.vlw");
//  greeting();
  
 // delay(2000);
  
//  greeting2();
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
  background(25, 25, 25);
  //rect(800, 120, 600, 400);
  
  textSize(18);
  fill(50);

  readData();
  
  if(firstHalfGreeting == false) {
    greeting();
  }
  
 // delay(1000);
  if(secondHalfGreeting == false) {
    greeting2();
  }

  if(stage1 == false && secondRiddle == false) {
    riddle2();
  }
  
  if(stage3 == true && winMsg == false) {
    printWin();
  }
  
  if (!newval.equals("null")) {
    //textSize(24);
    fill(255);
    //text("you pressed:", 1000, 220);
   // text("you pressed: ", 800, 420);
     textFont(f, 24);
    text(input, 1000, 520);
  }
 
  
  for (int i = iterator; i < chat.size(); i++) {
    String message = chat.get(i);
    //print(message);
    
    //textSize(18);
    fill(255);
   // sixty = createFont("SIXTY.ttf", 128);


//background(0);
   // textFont(sixty);
  //  text("word", 48, 240);
    
    int new_y = yval + (i * 20);
    //if (new_y > 200) {
    //  iterator++;
    //  break;
    //}
    textFont(f, 18);
    text(message, xval, new_y);
   
  

  }
    
  for (int i = iterator; i < chat2.size(); i++) {
    String message = chat2.get(i);
    //print(message);
    
    //textSize(18);
    fill(255);
    int new_y = yval + (i * 20);
    //if (new_y > 200) {
    //  iterator++;
    //  break;
    //}
    textFont(f, 18);
    text(message, xval, new_y);
   
  }
    for (int i = iterator; i < chat3.size(); i++) {
    String message = chat3.get(i);
    //print(message);
    
    //textSize(18);
    fill(255);
    int new_y = yval + (i * 20);
    //if (new_y > 200) {
    //  iterator++;
    //  break;
    //}
    textFont(f, 18);
    text(message, xval, new_y);
   
  }
  
  
}



void readData(){
  
  if (stage1 == true) {
    if (arduino1.available() > 0) {  
      // If data is available,
      newval = arduino1.readString(); 
      
      if (newval.equals("green")) {
        input = "green";


      } else if (newval.equals("blue")) {
        input = "blue";


      } else if (newval.indexOf("wrong") > -1) {
        input = "incorrect. try again";


      } else if (newval.indexOf("right") > -1) {
      //  input = "nice! you can move on";
    
        chat = new StringList();
        forest.play();  
        stage1 = false;
      }
    }
  } else
  {
    if (arduino2.available() > 0) {  
      // If data is available,
      newval = arduino2.readString(); 
      print(newval);
      
      if(newval.indexOf("stage3") > -1) {
        chat2 = new StringList();
        stage3 = true;
        //if (chimesPlayed == false) {
        //  chimes.play();
        //  chimesPlayed = true; 
        //}
        chimes.play();
        input = "You have restored life to the pond";
      } else if (newval.indexOf("fairies") > -1) {
        fairy = true;
       // input = "You have guided the frog";
      } else if (newval.indexOf("mushrooms") > -1) {
        shroom = true;
        input = "You have found the silver stone";
      } else if (newval.indexOf("fish") > -1){
        fishies = true;        
        input = "You have fed the fish";
        //  if (chimesPlayed == false) {
        //    chimes.play();
        //    chimesPlayed = true; 
        //}
        chimes.play();  
      }
      //} else if(fairy == true && shroom == true && fishies == true) {
      //  input = "finished!";
      ////
      //}
      
    }
  }
}

void greeting() {
  chat.append("welcome, destined one");
  chat.append("i, guardian of shadows, greet you in our realm");
  chat.append("i wonder what distant lands you call home...");
  chat.append("darkness has gripped our land");
  chat.append("but you—a beacon of hope—have arrived as foretold");  
  chat.append("\n");
  chat.append("embrace your purpose, wield courage, and illuminate our world");
  chat.append("may the stars guide your triumph.");
  chat.append("\n");
  chat.append("should you hope to save us, you must undertake three main objectives.");
  chat.append("\n");
  chat.append("first, navigate to the portal to our world, hidden behind a wooden door.");
  chat.append("to enter, you must prove your worth by correctly solving this riddle:");
  chat.append("\n");  
  chat.append(".....");
  chat.append("\n");

//  delay(3000);
  firstHalfGreeting = true;
  
}

void greeting2() {

  chat.append("In a world of buttons, a puzzle unfolds,");
  chat.append("A sequence of colors, a story to be told.");
  chat.append("\n");
  
  chat.append("Begin with nature's hue, vibrant and bright,");
  chat.append("Press me first, and set things right.");
  chat.append("\n");
  chat.append(".....");
  chat.append("\n");
  chat.append("Next in line, a shade of the vast, open sea,");
  chat.append("A button of tranquility, press it with glee.");
  chat.append("But don't stop there, the journey's not through,");
  chat.append("\n");
  chat.append("Once more in azure, a repeat is due.");
  chat.append("\n");
  chat.append(".....");
  chat.append("\n");

  chat.append("In this coded dance, your actions speak true,");
  chat.append("Which buttons to press? Solve the riddle, it's up to you.");
  chat.append("tap the buttons a total of 3 times in the right order to pass."); 
  secondHalfGreeting = true;
}

void riddle2(){
  chat2.append("Congratulations,");
  chat2.append("You have passed the first test.");
  chat2.append("\n");
  chat2.append("Solve one last riddle to restore life to the pond.");
  chat2.append("\n");

  chat2.append(".....");
  chat2.append("\n");

  chat2.append("In the moonlit glade, where mysteries unfold,");
  chat2.append("A riddle awaits, an adventure to be told.");
  chat2.append("\n");

  chat2.append(".....");

  chat2.append("Make a wish with the coin against the silver in the lake,");
  chat2.append("See the joy in the fairies' it will lovingly create.");
  chat2.append("\n");  
  chat2.append(".....");
  chat2.append("\n");
  
  chat2.append("Once the amphibian voyage is complete,");
  chat2.append("Seek a metallic rock, its shimmering feat.");
  chat2.append("\n");
  chat2.append(".....");
  chat2.append("\n");
  
  chat2.append("With a gentle touch, awaken the glow,");
  chat2.append("As mushrooms unveil the magic they bestow.");
  chat2.append("\n");  
  chat2.append(".....");
  chat2.append("\n");
  
  
  chat2.append("Now turn your gaze to the watery expanse,");
  chat2.append("Feed the fish, watch as they gracefully dance.");
  chat2.append("\n"); 
  chat2.append(".....");
  chat2.append("\n");

  
  chat2.append("In the ripple and sway of the aquatic trance,");
  chat2.append("The riddle's solution begins its advance.");
  chat2.append("\n");  
  chat2.append("....."); 
  chat2.append("\n");
  
  chat2.append("In the nourishing touch, the fish in their flow,");
  chat2.append("Unlock the mystery, let the answers aglow.");
  
  secondRiddle = true;
  
}


void printWin() {
  chat3.append("In the realm of enchantment, under starry skies,");
  chat3.append("Thy quest complete, a hero's sunrise.");
  chat3.append("\n");
  
  chat3.append("Fairies dance with grateful glee,");
  chat3.append("Metallic rocks and mushrooms agree.");
  chat3.append("\n");
  
  chat3.append("The fish in joyful rhythm move,");
  chat3.append("In the watery ballet, a hero's move.");
  chat3.append("\n");
  
  chat3.append("Eternally grateful, the realm now sings,");
  chat3.append("A hero's heart, on magic wings.");
  chat3.append("\n");  
  
  winMsg = true;
  
}
