//Olivia Timmermann

class Grid {   //contains the setup for the UI and the grid      

  Grid(int tWidth, int tHeight) { //constructor
    gridWidth = tWidth;
    gridHeight = tHeight;
  }
  
  void gridSetup(int widthBoard, int heightBoard) { //gridsetup: two for loops for columns, rows. from left to right
    for (int i = 0; i <= heightBoard+1; i++) { //vertical lines
      stroke(#FFFFFF);
      strokeWeight(8); 
      line (gridWidthPoints - i*(gridWidthPoints/widthBoard), 100, gridWidthPoints - i*(gridWidthPoints/widthBoard), gridHeightPoints+100); 
    }
    
    for (int i = 0; i <= widthBoard; i++) { //horizontal lines 
      stroke(#FFFFFF);
      strokeWeight(8);
      line (0, gridHeightPoints - i*(gridHeightPoints/heightBoard)+100, gridWidthPoints, gridHeightPoints - i*(gridHeightPoints/heightBoard)+100);
    }
    
    for (int i = 1; i <= heightBoard+1; i++) { //top boxes
      noFill();
      stroke(#FFFFFF);
      strokeWeight(4);
      circle(gridWidthPoints - i*(gridWidthPoints/widthBoard)+ 75, 50, 50);
    }
  }
  
  public void uiSetup(){ //user interface setup, many drawing functions.
    stroke(#FFFFFF); //start button
    fill(#FFFFFF);
    strokeWeight(10);
    rect(1000, 550, 200, 100);
    fill(#FF93B3);
    textSize(50);
    textFont(textFont);
    text("start", 1050, 615);
    
    fill(#FADADD); //part of the resets for text
    stroke(#FADADD);
    rect(1000, 100, 200, 400);
    rect(1000, 700, 200, 200);
    
    fill(#FFFFFF); //total won counter for p1
    textSize(30);
    text("Player 1 (cherries)", 1000, 100);
    text("Games won:", 1010, 130);
    textSize(40);
    text(player1totalWon, 1070, 175);
    
    fill(#FFFFFF); //total won counter for p2
    textSize(30);
    text("Player 2 (glowberries)", 1000, 300);
    text("Games won:", 1010, 330);
    textSize(40);
    text(player2totalWon, 1070, 375);
    
    fill(#FFFFFF); //starting player text
    textSize(30);
    text("Starting Player:", 1000, 750);

  }
}
