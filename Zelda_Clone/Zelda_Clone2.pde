
import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;

// states of the program
final int TITLESCREEN   = 0; 
final int INTROSTORY    = 1; 
final int MENU          = 2;
final int NEWGAME       = 3;  // playing!!!!!!!!!!
final int HELP          = 4;
final int EXIT          = 5;
final int CREDITS       = 6;
final int ERRORCHECKS   = 7;
final int PAUSE         = 8;
final int DEAD          = 9;
final int NEWLEVEL      = 10;  // next level  
final int WON           = 11;
final int STARTUP       = 12;  // before game  
int state;      // current 

int pageNumberMAX=0;  // for the story
int pageNumber=0;     // for the story
int imgPlace;
PFont fontIntro;

int errorCount = 0;

PImage book;
PImage panorama;
PImage button;
PImage bgnSmall; // bgnSmall.png

//song composed and played by TechWiz777
Minim minim;
AudioPlayer s1, s2;

//For the credits
int nameX=440;
int nameY=height/2;

// -------------------------------------------

// Player 
Player player = new Player();

// -------------------------------------------------

// Maze 
Maze maze = new Maze();
//
// the content of the cells in the maze can be 
final int emptyCell =0;
final int wallCell  =1;
final int startCell =2;
final int goalCell  =3;

// -------------------------------------------

// time 
int getTime; 

// the levels 
int levelCount = 0;
final int maxLevel = 3;  

// -------------------------------------------

void setup() {
  if (sketchFullScreen()) {
    size(displayWidth, displayHeight);
  }
  else
  {
    size(880, 600);
  }
  if (frame != null) {
    frame.setResizable(true);
  }

  background(20);

  book = loadImage("book.png");//Rywes
  panorama = loadImage("panorama.jpg");
  button = loadImage("button.png");
  bgnSmall  = loadImage("bgnSmall.png"); // bgnSmall.png

  fontIntro = createFont ("Andalus", 22); // primary font

  if (fontIntro==null) { // secondary font (if not found)
    fontIntro = createFont ("Arial", 22);
    print("Error: 001");
    errorCount = errorCount + 1;
  }

  textFont(fontIntro);
  fill(183, 146, 13);

  minim= new Minim(this);
  s1= minim.loadFile("BalladoftheDragonChild.wav");
  if (s1==null) {
    println(" ERROR 002: Song not found, ask TechWiz777 for file or download from GitHub");
    errorCount = errorCount + 1;
  }
  s2=minim.loadFile("TransLullaby.wav");
  if (s2==null) {
    println("ERROR 003: Song not found, ask TechWiz777 for file or download from Github");
    errorCount= errorCount  + 1;
  }
  s1.play();
  s1.loop();

  println("\nSetup took " + 
    millis() / 1000.0 + 
    " second(s).\n\n");

  // maze stuff
  initGame();
  state = TITLESCREEN;
} // func

void draw() {

  // state rules
  switch (state) {

  case TITLESCREEN:
    stateForTITLESCREEN(); 
    break;

  case  INTROSTORY:
    stateForINTROSTORY(); 
    break;

  case MENU:
    stateForMENU();
    break;

  case NEWGAME:
    // code for  
    // play
    maze.drawMaze() ;
    player.drawPlayer();
    player.collision();
    break;

  case HELP:
    // put code for help in here
    // ps. will break and execute big error if no code
    break;

  case EXIT:
    exit();
    break;

  case CREDITS:
    stateForCREDITS(); 
    break;

  case ERRORCHECKS:
    stateForERRORCHECKS(); 
    break;

  case PAUSE:
    // Pause
    maze.drawMaze() ;
    player.drawPlayer();    
    break;

  case DEAD:
    // dead
    maze.drawMaze() ;
    player.addX=0;
    player.addY=0;
    player.drawPlayer();
    showFourStars();
    bigMsg("Y O U  ARE  D E A D", "");
    if (!(millis ()-2900<=getTime)) { 
      initGame();
      state=TITLESCREEN;
    }
    break;

  case STARTUP:
    // splash screen
    maze.drawMaze();
    showFourStars();
    bigMsg("Dragon Child", 
    "Level " + levelCount);     
    if (!(millis ()-2900<=getTime)) { 
      state=NEWGAME;
    }
    break;    

  case NEWLEVEL:
    stateForNEXTLEVEL(); 
    break;

  case WON:
    // Completed all levels 
    maze.drawMaze() ;
    player.addX=0;
    player.addY=0;
    player.drawPlayer();
    bigMsg("You won", 
    "all levels completed");
    if (!(millis ()-2900<=getTime)) { 
      initGame();
      state=MENU;
    }
    break;

  default:
    println ("Error 003 with unknown state being " 
      +state);
    exit();
    break;
    //
  }// switch
  //
}// func 

// -------------------------------------------------------

