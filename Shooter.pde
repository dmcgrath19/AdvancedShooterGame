class Shooter{
  ArrayList<Bullet> bullets = new ArrayList<Bullet>();
  int bulletSpeed; int tempCount;
  Shooter(){
    bulletSpeed = (int)random(25, 50);
     tempCount = 0;
  }
  
  void shoot(float x, float y){
    bullets.add(new Bullet(x, y));
    oscillatorCount = 7; oscillator(); 
  }
  
  void shoot(float x, float y, PowerUp power){
    bullets.add(new Bullet(x, y, power));
    move();
    powerShoot();
  }
  
  void shoot(float x, float y, Boolean alien){
    if(tempCount == 0){
      bullets.add(new Bullet(x, y, alien));
      tempCount = bulletSpeed;
    }
    else tempCount--;
    move();
  }
  
  void move(){
     for(int i = 0; i <bullets.size(); i++){
    bullets.get(i).move();
    if(!bullets.get(i).onScreen){
      bullets.remove(i); 
      i--;
    }
    hitShield();
     }
    
  }
  
  void draw(){
     for(int i = 0; i <bullets.size(); i++)
    bullets.get(i).draw();
  }
  
  boolean kill(Player player){
    for(int i = 0; i < bullets.size(); i++){
      Bullet bill = bullets.get(i);
   if((player.xpos <= bill.x) && (player.xpos + PADDLEWIDTH >= bill.x) && (player.ypos == bill.y )){
     bullets.remove(i);
     i--;
     player.lostLife();
     if(player.dead) return true;
   }
    }
   return false;
  }
  
  
  void hitShield(){
    effect();
    for(int bill = 0; bill < bullets.size(); bill++){
    for(int i = 0; i <shields.size(); i++){
      if(shields.get(i).showTime ==0 && bill>-1)
      if(shields.get(i).hit(bullets.get(bill))) {
        bullets.remove(bill);
        bill--;
        effectCount=8;
      }
    }
  }
}
}
