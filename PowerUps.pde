
int POWERWIDTH = 20; int POWERHEIGHT = 20;
class PowerUp{
  float x, y;
  PImage power;
  int powerTime; 
  boolean gathered;
  boolean powerOn = false;
  boolean usedPower = false;
  boolean onScreen = true;
  
  PowerUp(){
    x = random(SCREENX);
    y = 0;
    gathered = false;
    powerTime = 250;
    int powerNum = (int)random(3);
    if(powerNum == 0) power = bolt;
    if(powerNum == 1) power = star;
    if(powerNum == 2) power = cherry;
  }
  
  void move(){
    y++;
    if (powerOn){
      powerTime--;
      onScreen = false;
    }
    if(powerTime == 0)
    powerOn = false;
    if(!powerOn && y < SCREENY)
      usedPower = true;
  }
  
  void draw(){
    if(!gathered)
    image(power, x, y);
  }
  
  void gathered(Player player){
   if((player.xpos <= x) && (player.xpos + PADDLEWIDTH >= x) && (player.ypos == y + POWERHEIGHT)){
     powerOn = true; gathered = true;
     gather();
   }
  }
  
  void carry(){
    image(power, x, y);
  }
  
}
