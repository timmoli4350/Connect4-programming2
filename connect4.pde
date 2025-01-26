// Olivia Timmermann
// Programming II (Wolfe)
// A connect-4 game. 
// themed berries! 

int player1moves = 0; //number of turns, used to check for a total of 42 (tie)
int player2moves = 0;

int player1totalWon = 0; //counter of times each player has won
int player2totalWon = 0;

boolean player1turn = false; //booleans for each player turn, start false
boolean player2turn = false;

boolean gameCurrently = false;

  int gridHeight = 6; //these variables can be changed to have 
  int gridWidth = 7; //different sized grids
  int gridHeightPoints = 810; //135 x 135 squares
  int gridWidthPoints = 945;

PImage cherryberries; //define all images
PImage pixelberries;
PImage p1win;
PImage p2win;
PImage tieGame;
PFont textFont; //define font (Perpetua)

Grid grid; //instantiate the grid, score classes
Score score;

void setup() {
  cherryberries = loadImage("cherryberries.png");
  pixelberries = loadImage("pixelberries.png");
  p1win = loadImage("p1win.png");
  p2win = loadImage("p2win.png");
  tieGame = loadImage("tiegame.png");
  
  textFont = createFont("Perpetua", 60); //create a new font
  
  cherryberries.resize(100, 100); //resize the markers
  pixelberries.resize(100, 100);
  
  size(1300, 950); //setup the window
  background(#FADADD);
  
  first(); //randomizer for which player starts
  
  grid = new Grid(gridWidth, gridHeight); //creates a new grid with our chosen w/h
  grid.gridSetup(gridWidth, gridHeight); //instantiates
  grid.uiSetup(); //UI setup
  
  score = new Score(); //
  score.scoreReset(); //resets the score at the end of each 
}

void draw() { //nessecary for mousePressed to run
  
}

public void mousePressed() { //all functions that require mouse clicking
    if (mouseX > 1000 && mouseX < 1200 && mouseY > 550 && mouseY < 650) { //within the confines of the start button
      println("start game"); //1000, 550, 200, 100
      setup(); //for restarts
      fill(#FF93B3);
      stroke(#FFFFFF);
      rect(1000, 550, 200, 100); //start button
      if (player1turn) { //prints the output of our earlier randomizer
        text("Player 1 (cherries)", 1010, 780);
      } else if (player2turn) {
        text("Player 2 (glowberries)", 1010, 780);
      }
      gameCurrently = true; //allows players to place on board
    }
    
    if (mouseX < gridWidthPoints && mouseY < 150 && gameCurrently) { //checks if there is a current game, and if it is within the board
        score.playGame();
    }
  }


public void first() { //randomizer for which player starts
  if (Math.random() > 0.5) { //math.random selects a float between 0.0 and 1.0, so 0.5 as a midpoint
    player1turn = true;
  } else {
    player2turn = true;
  }
}
