// states of the program

final int TITLESCREEN = 0; 

final int INTROSTORY  = 1; 

final int MENU        = 2;

final int NEWGAME     = 3;

final int HELP        = 4;

final int EXIT        = 5;

int state = TITLESCREEN; 



int pageNumber=0;  // for the story

PFont fontIntro; 



void setup() {

  size(880, 600);

  background(20);

  // primary font

  fontIntro = createFont ("Andalus", 22);

  // secondary font (if not found)

  if (fontIntro==null)

    fontIntro = createFont ("Arial", 22);

  textFont(fontIntro);

  fill(183, 146, 13);

} // func



void draw() {
  switch (state) {

  case TITLESCREEN:

    background(20);

    textFont(fontIntro);

    textSize(64);

    textAlign(CENTER);

    text ("The Adventures\nof Tran", 

    16, 93, width-16*2, height-16*2);

    showFourStars();

    break;



  case  INTROSTORY:

    background(20);

    textAlign(LEFT);

    textFont(fontIntro);

    String[] pages=introStory();

    text(pages[pageNumber], 

    57, 25, width-57*2, height-6);

    showFourStars();

    break;



  case MENU:

    background(20);

    textAlign(CENTER);

    textFont(fontIntro);

    text("Game Menu", 

    16, 34, width-16*2, height-16*2);

    textAlign(LEFT);

    text("1. New Game \n 2. Help \n 3. Exit ", 

    256, 110, width-16*2, height-16);



    break;
    
  
  
  case NEWGAME:
    
    // put code for newgame in here
    // ps. big error will execute if no code
    
  break;
    
  
  
  
  case HELP:
    
    // put code for help in here
    // ps. big error will execute if no code
  
  break;
  
  
  case EXIT:
  
    exit();
  
  break;
    
  



  default:

    println ("big error 1234 / unknown state");

    exit();

    break;

  }// switch

} // func 



// -------------------------------------------------------



void keyPressed() {
  

  
  switch (state) {



  case TITLESCREEN:

    state = INTROSTORY;

    break;



  case INTROSTORY:

    if (pageNumber<4)

      pageNumber++;

    else 

      state = MENU;

    break;



  case MENU:

    if(keyCode == '1'){state = NEWGAME;} //---------------------//
    if(keyCode == '2'){state = HELP;}    // Yours truly Oscar124//
    if(keyCode == '3'){state = EXIT;}    //---------------------//


    break;



  default:

    println ("big error 1262 / unknown state");

    break;

  }// switch

} // func



// ---------------------------------------------------

// Misc



void showFourStars() {

  textAlign(LEFT);

  textSize(64);



  text("*", 26, 66);

  text("*", 26, height-36);

  text("*", width-26*2, 66);

  text("*", width-26*2, height-36);

}



String[] introStory() {



  String[] page = new String[5]; 



  page[0]=

    "Tran is a 14 year old girl from the outskirts of Ireland and one day upon a walk she encountered a dragon. Befriending the dragon quickly, she calls it Dramdern. "+

    "Visiting his cave each day, rumors have been circulating that she is the Lost Dragon Child. \nThe last Dragon Child was in the 1300's and now in the 1700's, the time when she lived, "+

    "being a dragon child proved to be both beneficial and risky. The dragon child, or who they thought was the dragon child must have their dominant hand (whether they are right or left handed) "+

    "scorched by the dragons breath.\nThere was only one dragon, renamed multiple times, for dragons lived for centuries, and Dramdern was the only available dragon to be ready for the dragon child. ";



  page[1]=

    "As mentioned before, being the dragon child has benefits. The dragon child may control the skies, with the power of The Authority through the dragon. The Authority is the being that controls "+

    "everything in the universe. Air, wind, rain, and everything else produced by the sky. \nTran finally accepts the fact that she is a possible Dragon child, and prepares for the hand burning ritual. "+

    "A sorceress by the name of Weronicka, had felt that since she was born, being the dragon child was her destiny. She prepared as well for the hand burning ritual, not knowing that Tran was doing the same. "+

    "\nThe entire kingdom waited in silence as Tran stepped up the stony steps to the dragon. Weronicka arrives a little late but then is in shock at what she sees. She stuns Tran, and then tried to force the "+

    "dragon to breath fire on her arm. The dragon refuses so she stuns the dragon, and takes him to her fortress beneath the Baltic Sea. ";



  page[2]=

    "Tran was stunned in a time capsule, scheduled to release her after ten years, "+

    "the amount of time Weronicka thought she would need to convince the dragon to breathe fire on her. The king sent his best sorceress and sorcerers to Tran, and they managed to lower the capsule's time to one year. "+

    "During her coma trance, Tran was guided by one of the Authority's minions, to see what was happening to Dramdern. Weronicka hit him, and tried many different spells, but she could do nothing to convince him. "+

    "\nThe Authority saw that Tran was good, and employed a wizard, minion, and witch to train her in general knowledge, strength, and magic. After almost a year in the trance, Tran is finally ready. On her day of Departure, "+

    "or better known as the day she would awake from the stun trance, she received a map from the minion, a key for the witch, and a potion for the wizard. She was then taken to the Authority. Her head bowed, he spoke to her. ";



  page[3]=

    "\"Use these three relics to save the dragon you call Dramdern. Do not let the sorceress Weronicka prevail for she has evil in her heart. If she does manage to control your dragon, all of the Universe can fail to thrive "+

    "for much more.\"\nSuddenly Tran then saw herself standing over a cliff, a gust of wind pushed her over. She fell and fell, and then she saw jagged rocks at the bottom. She began to scream but before she touched the "+

    "ground she stopped.\n\"Congratulations, you hoped to be stopped, so the winds stopped you, you now have control over the skies. But it isn't complete domination. You need to complete the ritual.\""+

    " Said an anonymous voice, whom she at first thought was the Authority. But she then changed her mind. She new she had to begin her quest once she woke up from her trance. ";



  page[4]=

    "She then realized, "+

    "that the voice that spoke to her was the Universe itself. Then she woke up. She blinked in the sunlight. It was exactly a year from the time she was last awake. She was in a cave. She was now "+

    "15, she thought. \nShe stood up and her right shoulder felt heavy. She looked and saw a satchel, and when she opened it, she saw the three relics given to her during her trance. Everyone thought "+

    "that she had died, even the wizards, for even they did not know if they helped her. She ran out of the cave into the forest, and then she noticed she was in the same cave that she met Dramdern in. "+

    "She ran back in, kissed the wall, went out, looked in all directions, and began running.\n\nBefore the cave became to far away, she waved to it, and continued to embark on her quest.";



  return (page);

}

//
