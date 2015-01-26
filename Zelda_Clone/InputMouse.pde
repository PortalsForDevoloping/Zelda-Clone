
// all mouse funcs here 

void mousePressed () {

  // state rules

  switch (state) {

  case MENU:
    mousePressedForStateMENU();
    break;

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

  default:
    // do nothing 
    break;
  } // switch
} // func 

void mousePressedForStateMENU() {

  if (mouseX >= width / 2 - 190 && mouseX <= width / 2 + 190 && mouseY >= 200 && mouseY <= 250) {
    fill(130, 65, 20, 50);
    stroke(0);
    rect(width / 2 - 190, 200, 379, 49);
    if (mousePressed) {
      state = STARTUP;
      getTime = millis();
    }
  } 
  else if (mouseX >= width / 2 - 190 && mouseX <= width / 2 + 190 && mouseY >= 270 && mouseY <= 320) {
    fill(130, 65, 20, 50);
    stroke(0);
    rect(width / 2 - 190, 270, 379, 49);
    if (mousePressed) {
      state = INTROSTORY;
    }
  } 
  else if (mouseX >= width / 2 - 190 && mouseX <= width / 2 + 190 && mouseY >= 340 && mouseY <= 390) {
    fill(130, 65, 20, 50);
    stroke(0);
    rect(width / 2 - 190, 340, 379, 49);
    if (mousePressed) {
      exit();
    }
  } 
  else if (mouseX >= width / 2 - 190 && mouseX <= width / 2 + 190 && mouseY >= 410 && mouseY <= 460) {
    fill(130, 65, 20, 50);
    stroke(0);
    rect(width / 2 - 190, 410, 379, 49);
    if (mousePressed) {
      state= CREDITS;
    }
  } 
  else if (mouseX >= width / 2 - 190 && mouseX <= width / 2 + 190 && mouseY >= 480 && mouseY <= 530) {
    fill(130, 65, 20, 50);
    stroke(0);
    rect(width / 2 - 190, 480, 379, 49);
    if (mousePressed) {
      state= ERRORCHECKS;
    }
  }
}
//

