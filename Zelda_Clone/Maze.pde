

// the maze

class Maze {
  //
  // Maze 
  // no real constructor here
  //
  // what variables are needed for maze component
  final int rows = 30;
  final int cols = 30;
  //
  int w;
  int h;
  //
  final int distScreen = 0;
  //
  // this j is defined on class level
  int classLevel_J;
  //
  // the color of the way cells  
  color theWayThroughTheMazeColor;
  //
  int[][] cells = new int[rows][cols];
  //
  //
  //
  void defineMaze() {

    w = width/(maze.cols+0);
    h = height/(maze.rows+0);

    classLevel_J=1;
    theWayThroughTheMazeColor = color (255); // white 

    // working 2D array, nested for loop
    // Pre-init: all empty
    // loop rows
    for (int i = 0; i < maze.rows; i++) {
      //loop cols
      for (int j = 0; j < maze.cols; j++) {
        maze.cells[i][j]= emptyCell;
      } // for
    } // for
    //
    // Init walls outside 
    for (int i = 0; i < cells[0].length; i++) {
      cells[0][i]= wallCell;
      cells[rows-1][i]= wallCell;
      cells[i][0]= wallCell;
      cells[i][rows-1]= wallCell;
    } // for
    //
    switch (levelCount) {
    case 0:
      defineMazeLevel0 () ;
      break;
    case 1:
      defineMazeLevel1 () ;
      break;
    case 2:
      defineMazeLevel2 () ;
      break;      
    default:
      println ("Level missing, tab Maze, 62");
      exit();
      break;
    }
  }

  private void defineMazeLevel0 () {
    // Init walls inside // HERE YOU ENTER THE MAZE !
    //    The content of the cell can be: 
    //    final int emptyCell =0;
    //    final int wallCell  =1;
    //    final int startCell =2;
    //    final int goalCell  =3; 
    fillMaze( "100000000000000000000001000001"); 
    fillMaze( "100001111111100000000001000301");
    fillMaze( "100000000000100000000001000001");
    fillMaze( "100001111110100000000001000001");
    fillMaze( "100001000000111111000001000001");
    fillMaze( "100001011111100000000001000001");
    fillMaze( "100001000000100000000001000001");
    fillMaze( "100001111100100000000001000001");
    fillMaze( "100001000000100000000001000001");
    fillMaze( "100001000000100000000001000001");
    fillMaze( "100001011111111111000001000001");
    fillMaze( "100001000000100000000001000001");
    fillMaze( "100001000000100000000000000001");
    fillMaze( "111111111100100000000001000001");
    fillMaze( "100001000000100000000001000001");
    fillMaze( "101001000000100000000000000001");
    fillMaze( "101001000000111111000001000001");
    fillMaze( "101101000000100000000001000001");
    fillMaze( "101001000000100000000001000001");
    fillMaze( "101001111100100000000000000001");
    fillMaze( "101001000000100000000001000001");
    fillMaze( "101001000000100000000001000001");
    fillMaze( "101001000000111111000000000001");
    fillMaze( "101001000000000000000001000001");
    fillMaze( "101001000000000000000001000001");
    fillMaze( "101001111100100000000001000001");
    fillMaze( "121001000000000000000000000001");
    fillMaze( "100000000000000000000001000001");
  }
  //
  private void defineMazeLevel1 () {
    // Init walls inside // HERE YOU ENTER THE MAZE !
    //    The content of the cell can be: 
    //    final int emptyCell =0;
    //    final int wallCell  =1;
    //    final int startCell =2;
    //    final int goalCell  =3; 
    fillMaze( "100000000000000000000001000001"); 
    fillMaze( "100001111111100000000001000301");
    fillMaze( "100000000000100000000001000001");
    fillMaze( "100001111110100000000001000001");
    fillMaze( "100001000000111111000001000001");
    fillMaze( "100001011111100000000001000001");
    fillMaze( "100001000000100000000001000001");
    fillMaze( "100001111100100000000001000001");
    fillMaze( "100001000000100000000001000001");
    fillMaze( "100001000000100000000001000001");
    fillMaze( "100000000000000000000001000001");
    fillMaze( "100001000000100000000001000001");
    fillMaze( "100001000000000000000000000001");
    fillMaze( "100000000000000000000001000001");
    fillMaze( "100001000000100000000001000001");
    fillMaze( "101001000000100000000000000001");
    fillMaze( "101001000000000000000001000001");
    fillMaze( "101101000000100000000001000001");
    fillMaze( "101001000000100000000001000001");
    fillMaze( "100000000000000000000000000001");
    fillMaze( "101001000000100000000001000001");
    fillMaze( "101001000000100000000001000001");
    fillMaze( "100000000000000000000000000001");
    fillMaze( "101001000000000000000001000001");
    fillMaze( "101001000000000000000001000001");
    fillMaze( "101001111100100000000001000001");
    fillMaze( "121001000000000000000000000001");
    fillMaze( "100000000000000000000001000001");
  }
  //
  private void defineMazeLevel2 () {
    // Init walls inside // HERE YOU ENTER THE MAZE !
    //    The content of the cell can be: 
    //    final int emptyCell =0;
    //    final int wallCell  =1;
    //    final int startCell =2;
    //    final int goalCell  =3; 
    //
    fillMaze( "100000000000000000000001000001"); 
    fillMaze( "100001111111100000000001000301");
    fillMaze( "101001111100100000000001000001");
    fillMaze( "100000000000000000000001000001");
    fillMaze( "100000000000000000000001000001");
    fillMaze( "100000000000000000000001000001");
    fillMaze( "100000000000000000000001000001");
    fillMaze( "100000000000000000000001000001");
    fillMaze( "100000000000000000000001000001");
    fillMaze( "100000000000000000000001000001");
    fillMaze( "100000000000000000000001000001");
    fillMaze( "121001000000000000000000000001");
    fillMaze( "100000000000000000000001000001");
    //
  }
  // 
  void drawMaze () {
    // 
    noStroke();
    //
    // loop  rows
    for (int i = 0; i < rows; i++) {
      //loop cols
      for (int j = 0; j < cols; j++) {
        // draw depending on the cell type 
        switch(cells[i][j]) {
        case emptyCell:
          // empty / the way through the maze 
          fill(theWayThroughTheMazeColor);
          rect(i*w+distScreen, j*h+distScreen, w, h );
          break;
        case wallCell:
          // solid wall
          fill(110);
          rect(i*w+distScreen, j*h+distScreen, w, h );
          break;
        case startCell:
          // start base
          fill( 0, 1, 255);
          stroke(2);
          rect(i*w+distScreen, j*h+distScreen, w, h );
          noStroke();
          break;        
        case goalCell:
          // goal cell
          fill(1, 212, 9);
          rect(i*w+distScreen, j*h+distScreen, w, h );
          break;        
        default:
          // shouldn't get here 
          println("Undefined cell type. Error 63 with " + 
            cells[i][j] + ".");
          break;
        } // switch
        //
      } // for
    } // for
  }

  void fillMaze ( String theContent ) {
    for (int i = 0; i < theContent.length()-1; i++) {
      cells[i][classLevel_J] = theContent.charAt(i) - 48;
      if (theContent.charAt(i) - 48 == startCell) {
        player.PlayerX = i*w+distScreen+w/2.0;
        player.PlayerY = classLevel_J*h+distScreen;
        player.addX=0;
        player.addY=-1;
      } // if
    } // for 
    classLevel_J++;
  } // func  
  //
} // class 
//


