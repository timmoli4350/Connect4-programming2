//Olivia Timmermann

class Score { // scoring class, array. prints to console to check for errors 

  int [][] score = new int[6][7]; //create our array (3x3)

  int total = 0; // total moves made, = 42 is a tie
  
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
    println("emptysquare comp"); //so it does leave our placement thing, meaning problem is in matrix
    //checkAll();
  }
  //---------------------------------------
  public int checkCol() { //returns the mousePressed col as an int
    return mouseX/135;
  }
  
  public int checkRow() { //returns the mousePressed row as an int
    return mouseY/135;
  }
  
  public void isEmptySquare(int column) { //can we place here? to avoid overlaps
    println(checkCol()); //this is updating
    println(checkRow());
    
    for (int rIndex = gridHeight-1; rIndex >= 0; rIndex--) {
      if (score[rIndex][column] == 0) {
        
        if (player1turn) { //if we can place here, define the array place as a "1", switch turns, place image.
              println("new" + checkCol()); //this is updating
              println(rIndex);
          
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
  
  /*
  public void checkAll() { //loops through all parts then calls isWinner 
    //rows
    for (int row = 0; row < score.length; row++) { //iterates through all rows, adding each up
      total = 0; //reset between rows
      for (int col = 0; col < score[0].length; col++) {
        total += score[row][col];
        isWinner();
      }
    }
      
     //columns
     for (int col = 0; col < score[0].length; col++) { //iterates through all columns, adding each up
      total = 0; //reset between columns
      for (int row = 0; row < score.length; row++) {
        total += score[row][col];
        isWinner(); 
      }
    }
    
    //diagonal: RIGHT TO LEFT
    total = 0;
    for (int row = 0; row < score.length; row++) {
      col = (score.length - 1) - row; //score.length-1 (2, as its 0-2 for each), then subtract the row for a backwards diagonal
      total += score[row][col]; //add to the 
    }
    isWinner(); //called after the loop as it only runs once
    
    //diagonal: LEFT TO RIGHT
    total = 0;
    for (int row = 0; row < score.length; row++) {
      total += score[row][row]; //both are row, as the two numbers are equal for a forward diagonal (left to right)
    }
    isWinner(); //called after the loop as it only runs once
    
    if (player1moves + player2moves == 9) { //after checking all of the above, if there were 9 moves and no result then we tie
      tieGame();
    }
  }
  */
  public void isWinner() { //adds up parts of the loops
    if (total == 4) { //for 1 + 1 + 1 + 1 = 4
      player1Wins();
      
    } else if (total == 32) { //for 8 + 8 + 8 + 8 = 32
      player2Wins();
    }
  }
  
  
  public void player1Wins() { //spawn the image for a p1win, play again function
    println("player 1 (bows) wins!");
    image(p1win, 200, 200);
    player1totalWon++;
    playAgain();
  }
  
  public void player2Wins() { //spawn the image for a p2win, play again function
    println("player 2 (hearts) wins!");
    image(p2win, 200, 200);
    player2totalWon++;
    playAgain();
  }
  
  public void tieGame() { //spawn the image for a tie, play again function
    println("tie game!");
    image(tieGame, 200, 200);
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
