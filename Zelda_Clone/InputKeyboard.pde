
// input keyboard 

void keyPressed() {

  // state rules

  switch (state) {

  case TITLESCREEN:
    state = MENU;
    break;

  case INTROSTORY:
    if (pageNumber<pageNumberMAX-2) {
      pageNumber+=2;
    }
    else
    {
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

  case NEWGAME: 
    keyPressedForStatePlay();
    break;

  case PAUSE:
    keyPressedForStatePause();
    break;

  case STARTUP:
    break;

  case DEAD:
    break;

  case NEWLEVEL:
    // next level
    initGame();
    break; 

  default:
    println ("Error 044 in keyPressed with " + state );
    // exit(); 
    // state = MENU;
    break;
  }// switch
} // func

//
//--------------------------------------------------
//
void keyPressedForStatePause() {
  // any key
  state = MENU;
}
//
void keyPressedForStatePlay() {
  // if special key
  if (key == CODED) {
    if (keyCode == UP) {
      player.addX=0;
      player.addY=-1;
    }
    else if (keyCode == DOWN) {
      player.addX=0;
      player.addY=1;
    }
    else if (keyCode == RIGHT) {
      player.addX=1;
      player.addY=0;
    }
    else if (keyCode == LEFT) {
      player.addX=-1;
      player.addY=0;
    }
    else {
      // do nothing
    }
  }
  else {  
    // not key == CODED -------------
    // normal keys 
    //
    if (key == 'r') {
      // initGame();
    }
    else if (key == 'R') {
      //      levelCount = 0;
      //      initGame();
    }
    else if (key == '#') {
      player.PlayerX=width-90;
      player.PlayerY=266;
      player.addX=0;
      player.addY=-1;
    }
    if (key == 'p') {
      state = PAUSE;
    }
    else {
      // stop the pause if necessary
      if (state == PAUSE) { 
        state = NEWGAME;
      } // if
    } // else
  } // else
} // func 
//

