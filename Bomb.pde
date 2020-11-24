
class Bomb{
  float bombx, bomby;
  boolean usedBomb = false;
  boolean multiple = false;
  boolean carry;
  int bombCount;
  int bombHeight = POWERHEIGHT;
  int bombWidth = POWERWIDTH;
  
  Bomb(){
    //bombx = random(SCREENX);
    bomby = 0;
    bombCount = (int)random(30, 1000);
    carry = true;
  }
  
  void move(){
    if (!usedBomb){
    bombCount--; 
    if(bombCount == 0) carry = false;
    if(carry)return;
    else if(bomby > SCREENY)
      usedBomb = true;
    else  bomby++;
    }
    }
  
  
  void draw(){
    if(!usedBomb){
      image(bomb, bombx, bomby);
    }
    
  }
  

  
  boolean hit(Player player){
   if((player.xpos <= bombx + bombWidth) && (player.xpos + PADDLEWIDTH >= bombx) && (player.ypos == bomby + bombHeight) && !usedBomb){
     usedBomb = true;
     player.lostLife();
     if(player.dead) return true;
   }
   return false;
  }
  
}
