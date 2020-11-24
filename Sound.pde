int oscillatorCount = 0;
int effectCount = 0;
int gatherCount = 0;
int powerShoot = 0;

TriOsc triangle;
WhiteNoise noise;
BandPass bandPass;
LowPass lowPass;
HighPass highPass;
SoundFile powerSound;
SoundFile gatherSound;

void makeNoise(){
  oscillator();
  effect();
  //gather();
 // powerShoot();
}

void oscillator(){
  if(oscillatorCount-- > 0 ){
  triangle.play();
  triangle.freq(150);
  triangle.amp(.25);
 
  }
  else triangle.stop();
  
}

void effect(){
  if(effectCount-- > 0){
   noise.play();
   highPass.process(gatherSound, 5000);
  }
  else
  noise.stop();
}

void gather(){
     highPass.process(gatherSound, 5000);
    gatherSound.play();
}

void powerShoot(){
    powerSound.play();
}
