
// tools 

boolean sketchFullScreen() {
  return false;
}


void showFourStars() {
  textFont(fontIntro);
  fill(183, 146, 13);
  textAlign(LEFT);
  textSize(64);
  text("*", 26, 66);
  text("*", 26, height-36);
  text("*", width-26*2, 66);
  text("*", width-26*2, height-36);
}

void names() {
  textFont(fontIntro);
  textSize(50);
  textAlign(CENTER);
  text("Thank You To:", nameX, nameY);
  text("Chief of Management: Rywes Tech", nameX, nameY+height);
  text("Chief Technology Officer: Chrisir", nameX, nameY+height*1.5);
  text("Programming Abroad Specialists:", nameX, nameY+height*2);
  text("Tlecoz, Caramazula, Oscar124", nameX, nameY+height*2+50);
  textSize(45);
  text("Music: Chief of Operations TechWiz777", nameX, nameY+height*2.7);
  textSize(50);
  text("Portals: World Wide Developing", nameX, nameY+height*3.2);
  nameY-=2;
  if (nameY<=-1900) {
    state= MENU;
    nameY = 0;
  }
}

// Minor Tools -----------------------------------------

void bigMsg (String text1, String text2) {
  // give the big center message 
  //
  // box
  fill(0);

  textFont(fontIntro);
  fill(183, 146, 13);

  rectMode(CENTER);
  imageMode (CENTER);
  image (bgnSmall, width/2, height/2, 360, 110);
  //rect(width/2, height/2, 360, 110);
  // big text
  textAlign(CENTER);
  textSize(37);
  fill(maze.theWayThroughTheMazeColor);
  text(text1, width/2, height/2);
  // small text  
  textSize(17);
  text(text2, width/2, height/2+40);
  // restore text align to default / left - 
  // just to be polite... 
  textAlign(LEFT);
  // just to be polite... 
  rectMode(CORNER);
  // just to be polite...
  fill(0);
  imageMode (CORNER);
}

//

