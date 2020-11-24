Player user;


final int PADDLEHEIGHT = 15;
final int PADDLEWIDTH = 50;
final int MARGIN = 10;


class Player {
  int xpos; int ypos;
  color paddlecolor = color(50);
  int lives = 3;
  boolean dead = false;
  Shooter shooter = new Shooter();
  Player(int screen_y)
  {
    xpos=SCREENX/2;
    ypos=screen_y;
  }
  
  void move(int x){
    if(x>SCREENX-PADDLEWIDTH) xpos = SCREENX-PADDLEWIDTH;
    else xpos=x;
  }
  
  void draw()
  {
    
     noStroke();
    
    if(lives == 1)
    strokeWeight(0);
    else if(lives == 2)strokeWeight(5);
    else if (lives ==3) strokeWeight(10);
    
    stroke(255);
    fill(paddlecolor);
    rect(xpos, ypos, PADDLEWIDTH, PADDLEHEIGHT);
  }
  
  void moveComputer(int xOfBall){
    if (xOfBall > xpos){
      xpos++;
    }
    else{
      xpos--;
    }
    
  }
  void lostLife(){
    lives--;
    if(lives == 0) dead = true;
  }
  

  }
  
  
  
