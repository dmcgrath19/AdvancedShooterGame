/*
 recordings, oscillators and effects 
*/

import processing.sound.*;


void settings(){
  size(SCREENX, SCREENY);
}

  PImage alienImage;
  PImage bottomLeft;
  PImage bottomRight;
  PImage topLeft; 
  PImage topRight;
  PImage explodingImage;
  PImage star; 
  PImage cherry;
  PImage bolt; 
  PImage bomb; 
  PImage umbrella1;
  PImage umbrella2;
  PImage umbrella3;
  PImage umbrella4;
  PImage umbrella5;
  PImage umbrella6;
  
void setup(){
  alienImage= loadImage("Invader.GIF");
  umbrella1 = loadImage("umbrella1.png");
  umbrella2 = loadImage("umbrella2.png");
  umbrella3 = loadImage("umbrella3.png");
  umbrella4 = loadImage("umbrella4.png");
  umbrella5 = loadImage("umbrella5.png");
  umbrella6 = loadImage("umbrella6.png");
  bomb = loadImage("blbomb.png");
  cherry = loadImage("cherry.png");
  bolt = loadImage("bolt.png");
  star = loadImage("star.png");
  bottomLeft = loadImage ("bottomLeft.gif");
  bottomRight = loadImage ("bottomRight.gif");
  topLeft = loadImage ("topLeft.gif");
  topRight = loadImage ("topRight.gif");

  alienGang = new Alien[30];
  shields = new ArrayList<Shields>();
  shields.add(new Shields()); shieldCount++;
  bullets = new LinkedList<Bullet>();
  user = new Player(SCREENY-MARGIN-PADDLEHEIGHT);
  noStroke();
  init_array(alienGang);
  
  triangle = new TriOsc(this);
  noise = new WhiteNoise(this);
  bandPass = new BandPass(this);
  
  lowPass = new LowPass(this);
  highPass = new HighPass(this);
  
  powerSound = new SoundFile(this, "positive 1.mp3");
  gatherSound = new SoundFile(this, "positive 2.mp3");


}
  int s = second();
  int gang =1;
  int changed = (int)random(100, 300);
  
void draw(){
  
    background (70);
    oscillator();
    if(lost || won)
      endingText();
      
      
    else{
    if( (frameCount %   100 == 0) && (gang < alienGang.length)){ gang++;}
    
    user.move(mouseX);
    move_array(alienGang, gang, user, shields);

    adjustShields(shields);
    
    collision(user, alienGang);
    user.draw();
    draw_array(alienGang, gang);
    }
  
   
  
    }
    
    void endingText(){
      PFont myFont = loadFont("TeluguMN-48.vlw");
      fill(150);
      textFont(myFont);
      textAlign(CENTER);
      text(lost?"GameOver":"You Win", SCREENX/2, SCREENY/2);
    
    }
