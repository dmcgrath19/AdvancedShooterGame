/*

*/
final int SCREENX = 1000;
final int SCREENY = 500;
final int ALIENWIDTH = 30; 
final int ALIENHEIGHT = 25; 


class Alien{
  float x; float y;
  float dx; float dy;
  boolean status;
  float yCount;
  float deadtime = 100;
  float separatespeed = 1;
  int powerNum; 
  Bomb bombs;
  PowerUp power;
  Shooter shooter;
  boolean endGame = false;
  int hit = 0;
  
  float xbl; float ybl;
  float xbr; float ybr;
  float xtr; float ytr;
  float xtl; float ytl;
  
  Alien(){
    x = 0 - ALIENWIDTH; y = 0;
    dx = 1; dy = 0;
    yCount = 0;
    status = true;
    powerNum = (int)random(10);
    if(powerNum == 0 || powerNum == 1 || powerNum == 2){
      power = new PowerUp();
    }
    if(powerNum >= lowBombNum && powerNum <= highBombNum){
      bombs = new Bomb();
    }
    if(powerNum > highBombNum){
      shooter = new Shooter();
    }
  }
  
  void move(){
    if(status){
      if(x + ALIENWIDTH <  SCREENX && dx ==1)  x++;
    
      else if(x + ALIENWIDTH == SCREENX && dx ==1) {
        dx = 2; dy = 1; yCount = 0;
      }
    
      else if(dy == 1 && yCount < ALIENHEIGHT){
         y++;
         yCount++;
      }
      
      else if(dy == 1 && yCount == ALIENHEIGHT){
        dy = 0; 
        yCount =0;
        if(dx ==2) dx = -1;
        if(dx == -2) dx =1;
      }
    
      else if(dx == -1 && 0 < x) x--;
    
      else if (dx == -1 && 0 == x){
        dx = -2; dy = 1;
      }
    
    
    if(powerNum >= 0 && powerNum < lowBombNum){
      power.x = x + ALIENWIDTH/4; power.y = y+ ALIENHEIGHT;
      power.carry();
    }
    
    if(powerNum > highBombNum){
      shooter.shoot(x + ALIENWIDTH/2, y + ALIENHEIGHT, status);
    }
  }
    
    if(!status && powerNum >= 0 && powerNum < 3){
      power.move();
      power.draw();
    
  }
    if(powerNum >= lowBombNum && powerNum <= highBombNum){
      if(bombs.carry){bombs.bombx = x+ALIENWIDTH/4; bombs.bomby = y+ ALIENHEIGHT;}
      if(!status) bombs.carry = false;
     bombs.move(); bombs.draw();
    }
    
  }
  
  
  boolean checkHit(Player player){

    endGame = endGame && bombs.hit(player);
   
    return endGame;
  }
    
  void explode(){
    status = false;
    
    
    xtl = x; ytl = y;
    ytr = y; xtr = x + 15;
    xbl = x; ybl = y +15; 
    xbr = x +15; ybr = y +15;
    
 
  }
  
  void draw(){
    if(status){
      if(powerNum > highBombNum){
          shooter.draw();
    }
    image(alienImage, x, y);
    }
    else {
      separatespeed += .1;
      
     
      pushMatrix();
      translate(xbl--, ybl++); 
      rotate(-PI/6 * separatespeed);
      image(bottomLeft, 0, 0);
      popMatrix();
      
      pushMatrix();
      translate(xtl--, ytl--); 
      rotate(PI/6.0 * separatespeed);
      image(topLeft, 0, 0);
      popMatrix();
      
      
      
      pushMatrix();
      translate(xtr++, ytr--); 
     rotate(PI/6.0 * separatespeed);
      image(topRight, 0, 0);
      popMatrix();
      
      
     
      pushMatrix();
      translate(xbr++, ybr++); 
      rotate(-PI/6.0*separatespeed);
      image(bottomRight, 0, 0);
      popMatrix();
      
    }
    
  }
}
