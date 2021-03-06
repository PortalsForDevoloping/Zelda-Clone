package processing.test.zelda_clone;

import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import ddf.minim.spi.*; 
import ddf.minim.signals.*; 
import ddf.minim.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class Zelda_Clone extends PApplet {

// states of the program
final int TITLESCREEN = 0; 
final int INTROSTORY  = 1; 
final int MENU        = 2;
final int NEWGAME     = 3;
final int HELP        = 4;
final int EXIT        = 5;
final int CREDITS     = 6;
final int GAMESTATS   = 7;
int state = MENU; 

int pageNumberMAX=0;  // for the story
int pageNumber=0;  // for the story
int imgPlace;
PFont fontIntro;

int errorCount = 0;

PImage book;
PImage panorama;
PImage button;

//song composed and played by TechWiz777




Minim minim;
AudioPlayer s1,s2;

//For the credits
int nameX=440;
int nameY=height/2;

public boolean sketchFullScreen(){
    return false;
  }
// -------------------------------------------------

public void setup() {
  if(sketchFullScreen() == true){
   
  }else{
    size(880, 600);
  }
  if (frame != null) {
    frame.setResizable(true);
  }
  
  background(20);

  book = loadImage("book.png");//Rywes
  panorama = loadImage("panorama.jpg");
  button = loadImage("button.png");

  fontIntro = createFont ("Andalus", 22); // primary font

  if (fontIntro==null) { // secondary font (if not found)
    fontIntro = createFont ("Arial", 22);

    errorCount = errorCount + 1;
  }

  textFont(fontIntro);
  fill(183, 146, 13);

  minim= new Minim(this);
  s1= minim.loadFile("BalladoftheDragonChild.wav");
  if (s1==null) {

    errorCount = errorCount + 1;
  }
 s2=minim.loadFile("TransLullaby.wav");
  if(s2==null){

    errorCount= errorCount  + 1;
  }
  s1.play();
  s1.loop();
  


} // func



public void draw() {
  switch (state) {

  case TITLESCREEN:
    background(20);
    textFont(fontIntro);

    textSize(64);
    textAlign(CENTER);

    text ("Dragon Child", 
    16, 93, width-16*2, height-16*2);

    textSize(42);
    text ("The Adventures\nof Tran", 
    16, 243, width-16*2, height-16*2);

    textSize(64);

    showFourStars();
    break;

  case  INTROSTORY:
    
    background(20);
    textAlign(LEFT);
    image(book, 0, 0, width, height);
    textFont(fontIntro);
    String[] pages=introStory();
    fill(0);
    text(pages[pageNumber], 57, 25, width/2-32*2, height-44);
    text(pages[pageNumber+1], width/2+32, 25, width/2-64, height-44);
    break;

  case MENU:
    background(20);
    if (imgPlace < -15092) {
      image(panorama, imgPlace, 0, 15092, height + 30);
      imgPlace = imgPlace + 1;
    }
    if (imgPlace > -15092) {
      image(panorama, imgPlace, 0, 15092, height + 30);
      imgPlace = imgPlace - 1;
    }

    fill(183, 146, 13);
    textFont(fontIntro);
    textSize(64);
    textAlign(CENTER);
    text ("Dragon Child", 16, 20, width-16*2, height-16*2);
    textSize(38);
    text ("The Adventures of Tran", 16, 100, width-16*2, height-16*2);

    image(button, width / 2 - 190, 200, 380, 50);
    image(button, width / 2 - 190, 270, 380, 50);
    image(button, width / 2 - 190, 340, 380, 50);
    image(button, width/2-190, 410, 380, 50);
    image(button, width/2-190, 480, 380, 50);

    if (mouseX >= width / 2 - 190 && mouseX <= width / 2 + 190 && mouseY >= 200 && mouseY <= 250) {
      fill(130, 65, 20, 50);
      stroke(0);
      rect(width / 2 - 190, 200, 379, 49);
      if (mousePressed) {
        state = NEWGAME;
      }
    } else if (mouseX >= width / 2 - 190 && mouseX <= width / 2 + 190 && mouseY >= 270 && mouseY <= 320) {
      fill(130, 65, 20, 50);
      stroke(0);
      rect(width / 2 - 190, 270, 379, 49);
      if (mousePressed) {
        state = INTROSTORY;
      }
    } else if (mouseX >= width / 2 - 190 && mouseX <= width / 2 + 190 && mouseY >= 340 && mouseY <= 390) {
      fill(130, 65, 20, 50);
      stroke(0);
      rect(width / 2 - 190, 340, 379, 49);
      if (mousePressed) {
        exit();
      }
    } else if (mouseX >= width / 2 - 190 && mouseX <= width / 2 + 190 && mouseY >= 410 && mouseY <= 460) {
      fill(130, 65, 20, 50);
      stroke(0);
      rect(width / 2 - 190, 410, 379, 49);
      if (mousePressed) {
        state= CREDITS;
      }
    } else if (mouseX >= width / 2 - 190 && mouseX <= width / 2 + 190 && mouseY >= 480 && mouseY <= 530) {
      fill(130, 65, 20, 50);
      stroke(0);
      rect(width / 2 - 190, 480, 379, 49);
      if (mousePressed) {
        state= GAMESTATS ;
      }
    }



    fill(183, 146, 13);
    textSize(35);
    text("New Game", width / 2, 235);
    text("Introduction", width / 2, 305);
    text("Exit", width /2, 375);
    text("Credits", width/2, 445);
    text("Game Statistics",width/2,520);

    break;

  case NEWGAME:
    // put code for newgame in here
    // ps. will break and execute big error if no code
    break;

  case HELP:
    // put code for help in here
    // ps. will break and execute big error if no code
    break;

  case EXIT:
    exit();
    break;

  case CREDITS:
  s1.pause();
  s2.play();
    background(20);
    showFourStars();
    names();
    break;
    
  
  case GAMESTATS:
   background(20);
   showFourStars();
   textSize(50);
   textAlign(CENTER);
   text("Found " + errorCount + " error(s)!",width/2,60);
   text("Press any key to exit Game Statistics",width/2,height-50);
   if(errorCount<=0){
     text("Your game is good to go!",width/2,120);
   }
   else if(errorCount>=1){
     textAlign(LEFT);
     textSize(25);
     text("Uh Oh. There's a problem. Check for a message error. If problem persists, email our company at: portalswwd@gmail.com", 10, 120);
   }
   if(keyPressed){
   state=MENU;
   }
   break;
   
   default:
    exit();
    break;
  }// switch
}// func 

// -------------------------------------------------------

public void keyPressed() {
  switch (state) {
  case TITLESCREEN:
    state = INTROSTORY;
    break;

  case INTROSTORY:
    if (pageNumber<pageNumberMAX-2){
      pageNumber+=2;
  }else{
      state = MENU;
      pageNumber = 0;
    }
    break;

  case MENU:
    if (keyCode == '1') {
      state = NEWGAME;
    } //---------------------//
    if (keyCode == '2') {
      state = HELP;
    }    // Yours truly Oscar124//
    if (keyCode == '3') {
      state = EXIT;
    }    //---------------------//
    break;

  default:
    state = MENU;
    break;
  }// switch
} // func


public void showFourStars() {
  textAlign(LEFT);
  textSize(64);
  text("*", 26, 66);
  text("*", 26, height-36);
  text("*", width-26*2, 66);
  text("*", width-26*2, height-36);
}

public void names() {
  textFont(fontIntro);
  textSize(50);
  textAlign(CENTER);
  text("Thank You To:", nameX, nameY);
  text("Chief of Management: Rywes Tech", nameX, nameY+height);
  text("Chief Technology Officer: Chrisir", nameX, nameY+height*1.5f);
  text("Programming Abroad Specialists:", nameX, nameY+height*2);
  text("Tlecoz, Caramazula, Oscar124", nameX, nameY+height*2+50);
  textSize(45);
  text("Music: Chief of Operations TechWiz777", nameX, nameY+height*2.7f);
  textSize(50);
  text("Portals: World Wide Developing", nameX, nameY+height*3.2f);
  nameY-=2;
  if (nameY<=-1900){
    state= MENU;
    nameY = 0;
  }
}

public String[] introStory() {
  pageNumberMAX = 10;
  String[] page = new String[pageNumberMAX]; 

  int i=0;

  page[i++]=
    "Tran is a 14 year old girl from the outskirts of Ireland and one day upon a walk she encountered a dragon. Befriending the dragon quickly, she calls it Dramdern. "+
    "Visiting his cave each day, rumors have been circulating that she is the Lost Dragon Child. \nThe last Dragon Child was in the 1300's and now in the 1700's, the time when she lived, "+
    "being a dragon child proved to be both beneficial and risky. The dragon child, or who they thought was ";

  page[i++]=  
    "the dragon child must have their dominant hand (whether they are right or left handed) "+
    "scorched by the dragons breath.\nThere was only one dragon, renamed multiple times, for "+
    "dragons lived for centuries, and Dramdern was the only available dragon to be ready for the dragon child. "+
    "As mentioned before, being the dragon child has benefits. The dragon child may control the skies, with the power of The Authority through the";


  page[i++]=
    "dragon. The Authority is the being that controls "+
    "everything in the universe. Air, wind, rain, and everything else produced by the sky. \nTran finally accepts the fact that she is a possible Dragon child, and prepares for the hand burning ritual. "+
    "A sorceress by the name of Weronicka, had felt that since she was born, being the dragon child was her destiny. She prepared as well for the hand burning ritual, not knowing that Tran was doing the same. ";

  page[i++]=  
    "The entire kingdom waited in silence as Tran stepped up the stony steps to the dragon. Weronicka arrives a little late but then is in shock at what she sees. She stuns Tran, and then tried to force the "+
    "dragon to breath fire on her arm. The dragon refuses so she stuns the dragon, and takes him to her fortress beneath the Baltic Sea. ";

  page[i++]=
    "Tran was stunned in a time capsule, scheduled to release her after ten years, "+
    "the amount of time Weronicka thought she would need to convince the dragon to breathe fire on her. The king sent his best sorceress and sorcerers to Tran, and they managed to lower the capsule's time to one year. "+
    "During her coma trance, Tran was guided by one of the Authority's minions, to see what was happening to Dramdern. Weronicka hit him, and tried many different spells, but she could do";

  page[i++]=  
    "nothing to convince him. "+
    "\nThe Authority saw that Tran was good, and employed a wizard, minion, and witch to train her in general knowledge, strength, and magic. After almost a year in the trance, Tran is finally ready. On her day of Departure, "+
    "or better known as the day she would awake from the stun trance, she received a map from the minion, a key for the witch, and a potion for the wizard. She was then taken to the Authority. Her head bowed, he spoke to";

  page[i++]=  
    "her. \"Use these three relics to save the dragon you call Dramdern. Do not let the sorceress Weronicka prevail for she has evil in her heart. If she does manage to control your dragon, all of the Universe can fail to thrive "+
    "for much more.\"\nSuddenly Tran then saw herself standing over a cliff, a gust of wind pushed her over. She fell and fell, and then she saw jagged rocks at the bottom. She began to scream but before she touched the "+
    "ground she stopped.";

  page[i++]=  
    "\"Congratulations, you hoped to be stopped, so the winds stopped you, you now have control over the skies. But it isn't complete domination. You need to complete the ritual.\""+
    " Said an anonymous voice, whom she at first thought was the Authority. But she then changed her mind. She new she had to begin her quest once she woke up from her trance. "  +
    "She then realized, "+
    "that the voice that spoke to her was the Universe itself."; 

  page[i++]=
    "Then she woke up. She blinked in the sunlight. It was exactly a year from the time she was last awake. She was in a cave. She was now "+
    "15, she thought. \nShe stood up and her right shoulder felt heavy. She looked and saw a satchel, and when she opened it, she saw the three relics given to her during her trance. Everyone thought "+
    "that she had died, even the wizards, for even they did not know if they helped her. She ran out of the cave into the forest, and then she noticed";

  page[i++]=  
    "she was in the same cave that she met Dramdern in. "+
    "She ran back in, kissed the wall, went out, looked in all directions, and began running.\n\nBefore the cave became to far away, she waved to it, and continued to embark on her quest.";

  // page[i++]=""; 

  return (page);
}

  public int sketchWidth() { return displayWidth; }
  public int sketchHeight() { return displayHeight; }
}
