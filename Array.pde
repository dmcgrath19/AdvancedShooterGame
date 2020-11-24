import java.util.LinkedList;
import java.util.Queue;
import java.util.Iterator;
import java.util.ArrayList;

int lowBombNum = 3;
int highBombNum = 7;

ArrayList<Shields> shields;
Queue <Bullet> bullets;
Alien alienGang[];
PowerUp currentPower; 
float timeUntilNextPower = 0;
boolean speedBall = false;
boolean lost = false;
boolean won = false;
int maxShields = 3;
int shieldCount = -1;



void mousePressed(){
  speedBall = false;
   for(int i=0; i<alienGang.length; i++){
    if(!alienGang[i].status && alienGang[i].powerNum >= 0 && alienGang[i].powerNum < 3 && alienGang[i].power.powerOn){
      speedBall = true;
      currentPower = alienGang[i].power;
    }
    
   }
  if(speedBall)
    user.shooter.shoot(user.xpos, user.ypos, currentPower);
  else
    user.shooter.shoot(user.xpos, user.ypos);
  
}

 
 void collision(Player player, Alien alienArray[]){
   player.shooter.move();
   for(int i = 0; i < player.shooter.bullets.size(); i++){
    
      Bullet bullet = player.shooter.bullets.get(i);
      for(int index = 0; index < alienArray.length; index++){
        bullet.collide(alienArray[index]);
    }
   }
   player.shooter.draw();
 }
 
void adjustShields(ArrayList <Shields> shield){
  if(shieldCount < maxShields && shieldCount <shield.size())
    if(shield.get(shieldCount).showTime == 0) {
      shield.add(new Shields()); 
      shieldCount++;
    }
    for(int i = 0; i <shield.size(); i++){
      shield.get(i).draw();
      if(shield.get(i).used){
        shield.remove(i);
        i--;
      }
    }
  
}

void init_array(Alien theArray[]){
  for(int i=0; i<theArray.length; i++)
    theArray[i] = new Alien();
}
void draw_array(Alien theArray[], int gang){
  for(int i=0; i<gang; i++)
    theArray[i].draw();
}
void move_array(Alien theArray[], int gang, Player player, ArrayList <Shields> shield){
  int deadcount =0;
  for(int i=0; i < gang; i++){
    theArray[i].move();
    if(!theArray[i].status) deadcount++;
    if(theArray[i].powerNum >= 0 && theArray[i].powerNum < lowBombNum)theArray[i].power.gathered(player);
    if(theArray[i].powerNum >= lowBombNum && theArray[i].powerNum <= highBombNum) {
      if(theArray[i].bombs.hit(player) ) lost = true;
      for(int s = 0; s <shield.size(); s++)
       shield.get(s).hit(theArray[i].bombs);
    }
    if(theArray[i].powerNum > highBombNum)
      if(theArray[i].shooter.kill(player)) lost = true;
  }
  if (deadcount ==theArray.length) won = true;
}
