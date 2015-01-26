
// these funcs are ALL called from draw() 

// no other funcs here please, only those that are called from draw().


void stateForTITLESCREEN() { 

  background(20);

  fill(183, 146, 13);

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
} // func


void stateForINTROSTORY () { 
  background(20);
  textAlign(LEFT);
  image(book, 0, 0, width, height);
  textFont(fontIntro);
  String[] pages=introStory();
  fill(0);
  text(pages[pageNumber], 57, 25, width/2-32*2, height-44);
  text(pages[pageNumber+1], width/2+32, 25, width/2-64, height-44);
} // func

void stateForMENU () { 

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

  fill(183, 146, 13);
  textSize(35);
  text("New Game", width / 2, 235);
  text("Introduction", width / 2, 305);
  text("Exit", width /2, 375);
  text("Credits", width/2, 445);
  text("Error Check", width/2, 520);
} // func

void stateForCREDITS() {
  s1.pause();
  s2.play();
  background(20);
  showFourStars();
  names();
} // func

void stateForERRORCHECKS() {
  background(20);
  showFourStars();
  textSize(50);
  textAlign(CENTER);
  text("Found " + errorCount + " error(s)!", width/2, 60);
  text("Press any key to exit Error Checks", width/2, height-50);
  if (errorCount<=0) {
    text("Your game is good to go!", width/2, 120);
  }
  else if (errorCount>=1) {
    textAlign(LEFT);
    textSize(25);
    text("Uh Oh. There's a problem. Check for a message error. If problem persists, email our company at: portalswwd@gmail.com", 10, 120);
  }
  if (keyPressed) {
    state=MENU;
  }
} // func

void stateForNEXTLEVEL() {
  // next level
  maze.drawMaze() ;
  player.addX=0;
  player.addY=0;
  player.drawPlayer();

  fill(0);

  switch (levelCount) {

  case 0:
    bigMsg("START FOREST ", 
    "Level " + levelCount);
    break;

  case 1:
    bigMsg("START DESERT ", 
    "Level " + levelCount);
    break;

  case 2:
    bigMsg("START ROCK ", 
    "Level " + levelCount);
    break;

  default: 
    bigMsg("Next Level", 
    "Level " + levelCount);
    break;
  } // switch 
  //

  //    if (!(millis ()-2900<=getTime)) { 
  //      initGame();
  //    }
}

// 

