class Shields{
  float x; float y;
  float margin = 40;
  float widthS = 60; float heightS = 60;
  int lives=5;
  boolean used = false;
  int showTime;
  Shields(){
    x = random(SCREENX - widthS - margin);
    y = random(heightS, SCREENY - heightS - margin);
    showTime = (int)random(100, 200);
  }
  
  void hit(Bomb bom){
    if(!used && showTime == 0 && !bom.usedBomb){
        if((bom.bomby + bom.bombWidth >= y && bom.bomby <=  y + heightS) && (bom.bombx <= x +widthS && bom.bombx + ALIENWIDTH >= x)){
          bom.usedBomb = true;
          lostLife(3); 
    }
    }
  }
  
  boolean hit(Bullet bill){
    if(showTime == 0){
      if((bill.y + bill.radius*2 >= y && bill.y <=  y + heightS) && (bill.x <= x +widthS && bill.x + bill.radius*2 >= x)){
        lostLife(1); return true;
      }
    }
    return false;
  }
  
  void draw(){
    if(!used && showTime == 0){
      if(lives == 1) image(umbrella1, x, y);
      if(lives == 2) image(umbrella2, x, y);
      if(lives == 3) image(umbrella3, x, y);
      if(lives == 4) image(umbrella4, x, y);
      if(lives == 5) image(umbrella5, x, y);
      if(lives == 6) image(umbrella6, x, y);
    }
    else if (showTime > 0)
    showTime--;
    
  }
  
  void lostLife(int numLost){
    if(!used){
      lives-= numLost;
      if(lives == 0) 
        used = true;
    }
  }
}
