class Bullet {
  boolean onScreen = true;
  float x; float y;
  float x2; boolean evil = false;
  float dy;
  int radius;
  color ballColor;
  boolean shootsDouble = false;
  
  Bullet(float mysteryx, float mysteryy, boolean alien){
    evil = true;
    x = mysteryx;
    y = mysteryy;
    dy = -2;
    radius = 5;
    ballColor = color (157, 133, 225);
  }
  
  Bullet(float playerxpos, float playerypos){
    x = playerxpos + PADDLEWIDTH/2;
    y = playerypos;
    dy = 2;
    radius=5;
    ballColor = color(255);
  }
  
  Bullet(float playerxpos, float playerypos, PowerUp power){
    if (power.power == cherry){
      x = playerxpos + PADDLEWIDTH/4; 
      x2 = playerxpos + PADDLEWIDTH * 3 /4;
      y = playerypos;
      dy = 2;
      shootsDouble = true;
      ballColor = color(245, 91, 91);
      radius = 5;
    }
    else if(power.power == bolt){
      x = playerxpos + PADDLEWIDTH/2;
      y = playerypos;
      dy = 4;
      radius=5;
      ballColor = color(255, 255, 151);
    }
    else if(power.power == star){
      x = playerxpos + PADDLEWIDTH/2;
      y = playerypos;
      dy = 4;
      radius = 15;
      ballColor = color(255, 194, 242);
    }
     
  }

  void move(){
    y-= dy;
    if(y < 0) onScreen = false;
  }
  
  void draw(){
    noStroke();
    fill(ballColor);
    if (shootsDouble){
      ellipse(int(x), int(y), radius, radius);
      ellipse(int(x2), int(y), radius, radius);
    }
    else
    ellipse(int(x), int(y), radius, radius);
  }

  void collide(Alien alien){
    if((alien.y + ALIENHEIGHT >= y && alien.y <=  y + radius) && (alien.x <= x +radius && alien.x + ALIENWIDTH >= x) && alien.status){
        alien.explode();
    }
  }
  
  

    
  
  
}
