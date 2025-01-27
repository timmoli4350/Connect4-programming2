//Olivia Timmermann

class Score { // scoring class, array. prints to console to check for errors 

  int [][] score = new int[6][7]; //create our array (3x3)

  int total = 0; // total added
  
  void scoreReset(){ //resets the score, called at start of games
    int row = 0; // row: int of which row the mousePressed is in
    int col = 0; // col: see above, col instead
    
    for (int r = 0; r < gridWidth; r++) { //iterates through each row
      for (int c = 0; c < gridHeight; c++) { //iterates through each column of each row
        score[row][col] = 0; //equates current place to 0
    }
   }
     player1moves = 0; //resets for start of new game
     player2moves = 0;
  }
    
  public void playGame() { //runs all of our checker functions
    isEmptySquare(checkCol());
    checkAll();
  }
  //---------------------------------------
  public int checkCol() { //returns the mousePressed col as an int
    return mouseX/135;
  }
  
  public int checkRow() { //returns the mousePressed row as an int
    return mouseY/135;
  }
  
  public void isEmptySquare(int column) { //can we place here? to avoid overlaps
    
    for (int rIndex = gridHeight-1; rIndex >= 0; rIndex--) {
      if (score[rIndex][column] == 0) {
        
        if (player1turn) { //if we can place here, define the array place as a "1", switch turns, place image.
          
          image(cherryberries, checkCol() * 135 + 25, rIndex * 135 + 120);
       
           player1turn = false;
           player2turn = true;
           player1moves++;
           println("player 2 turn");
          
          score[rIndex][column] = 1;

          break;
        }
        
        else if (player2turn) { //if we can place here, define the array place as a "8", switch turns, place image.
        
          image(pixelberries, checkCol() * 135 + 25, rIndex * 135 + 120); //row is basically y while col is x 
          
           player1turn = true;
           player2turn = false;
           player2moves++;
           println("player 1 turn");
          
          score[rIndex][column] = 8;

          break;
        }
      }
    }
  }
  
  
  public void checkAll() { //loops through all parts then calls isWinner 
    //rows
    for (int cIndex = 0; cIndex < gridWidth - 3; cIndex++) {
      for (int rIndex = 0; rIndex < gridHeight; rIndex++) {
        total = 0;
        for (int fourIndex = 0; fourIndex < 4; fourIndex++) {  
          total += score[rIndex][cIndex + fourIndex];
          isWinner();
        }
      }
    }
    
    //columns
    for (int cIndex = 0; cIndex < gridWidth; cIndex++) {
      for (int rIndex = 0; rIndex < gridHeight-3; rIndex++) {
        total = 0;
        for (int fourIndex = 0; fourIndex < 4; fourIndex++) {  
          total += score[rIndex + fourIndex][cIndex];
          isWinner();
        }
      }
    }
    
    
    for (int cIndex = 0; cIndex < gridWidth-3; cIndex++) {
      for (int rIndex = 3; rIndex < gridHeight; rIndex++) {
        total = 0;
        for (int fourIndex = 0; fourIndex < 4; fourIndex++) {  
          total += score[rIndex - fourIndex][cIndex + fourIndex];
          isWinner();
        }
      }
    }
    
    for (int cIndex = 0; cIndex < gridWidth-3; cIndex++) {
      for (int rIndex = 0; rIndex < gridHeight-3; rIndex++) {
        total = 0;
        for (int fourIndex = 0; fourIndex < 4; fourIndex++) {  
          total += score[rIndex + fourIndex][cIndex + fourIndex];
          isWinner();
        }
      }
    }

    if (player1moves + player2moves == 42) { //after checking all of the above, if there were 9 moves and no result then we tie
      tieGame();
    }
  }



  public void isWinner() { //adds up parts of the loops
  
    if (total == 4) { //for 1 + 1 + 1 + 1 = 4
      player1Wins();
      
    } else if (total == 32) { //for 8 + 8 + 8 + 8 = 32
      player2Wins();
    }
  }
  
  
  public void player1Wins() { //spawn the image for a p1win, play again function
    println("player 1 (cherry) wins!");
    image(p1win, 200, 225);
    player1totalWon++;
    playAgain();
  }
  
  public void player2Wins() { //spawn the image for a p2win, play again function
    println("player 2 (glow) wins!");
    image(p2win, 200, 225);
    player2totalWon++;
    playAgain();
  }
  
  public void tieGame() { //spawn the image for a tie, play again function
    println("tie game!");
    image(tieGame, 200, 225);
    playAgain();
  }
  
  public void playAgain() { //resets the board, turns off board placement
    println("hit start to play again!");
    scoreReset();
    grid.uiSetup();
    gameCurrently = false;
  }
}
  



//quick drafting notes 
