

// the player

class Player {
  // Player 
  float PlayerX;
  float PlayerY;
  float addX;
  float addY;

  int health = 100;
  int armour = 10;

  // inventory
  boolean hasArrowAndBow = false; 
  boolean hasPotion1     = false; 

  // no real constructor here

    void drawPlayer () {
    fill (255, 0, 0);
    ellipse(PlayerX, PlayerY, 10, 10);
    //ellipse( PlayerX*maze.w+maze.distScreen+maze.w/2.0, PlayerY*maze.h+maze.distScreen, 10, 10);
    if (state != PAUSE) {
      PlayerX+=addX;
      PlayerY+=addY;
    }
  }

  void collision() {
    // Does the player collide with a wall etc.?
    // 
    // loop over rows
    for (int i = 0; i < maze.rows; i++) {
      // check row
      if ( PlayerX >= i*maze.w+maze.distScreen && 
        PlayerX <= i*maze.w+maze.distScreen+maze.w ) {
        //loop over cols
        for (int j = 0; j < maze.cols; j++) {
          // check column
          if (PlayerY >= j*maze.h+maze.distScreen &&
            PlayerY <= j*maze.h+maze.distScreen+maze.h) {
            // depending on the cell type 
            switch(maze.cells[i][j]) {
            case emptyCell:
              // empty / the way through the maze 
              // do nothing here
              break;
            case wallCell:
              // solid wall: die 
              if (PlayerX >= i*maze.w+maze.distScreen && PlayerY >= j*maze.h+maze.distScreen &&
                PlayerX <= i*maze.w+maze.distScreen+maze.w && PlayerY <= j*maze.h+maze.distScreen+maze.h) {
                // died
                println ( "Dead." );
                state = DEAD;
                getTime=millis();
                // red
                maze.theWayThroughTheMazeColor = color (255, 1, 1);
              }   
              break;
            case startCell:
              // start base
              // do nothing
              break;        
            case goalCell:
              // goal cell
              // new level
              println ( "You found a goal." );
              state = NEWLEVEL;
              levelCount++;
              // yellow
              maze.theWayThroughTheMazeColor = color (255, 255, 0 );
              // if all levels...
              if (levelCount>=maxLevel) 
              { 
                // new msg: Completed all levels 
                state = WON;
                levelCount=0;
                // green 
                maze.theWayThroughTheMazeColor = color (0, 255, 0 );
              }
              getTime=millis();
              break;        
            default:
              // shouldn't get here 
              println("Undefined cell type. Error 138 with " + 
                maze.cells[i][j] + ".");
              break;
            } // switch
          } // for
        }
      }
    }
  }
  //
} // class 
// 

