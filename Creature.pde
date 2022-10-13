PImage[] creatures;
PImage[] noCreatures;
int creatureNumber;

boolean shouldDance = false;
boolean[] creaturesAlive = new boolean[8];

float creaturePosY = 0;
float rot = 0.0;



void setCreature(){
  for(int i=0; i<creatures.length; i++){
    creaturesAlive[i] = false;
  }
}

void setCreature(int n){
  creaturesAlive[n] = true;
  setForJump();
}

void drawCreature(int n){//Coordinate code with KHR for interaction
   if(!moveCreature){
      drawForJump();
    }
      
  else if(moveCreature){
  /*if(n==0||n==1||n==5||n==7){
    move(); 
    angle+=2;
  }else if(n==2||n==4||n==6){
    jump();
    angle+=2;
  }else if(n==3){
    imgScale();
    angle+=2;   
  }*/
  jump();
  angle+=2;
  }//added code-PSY
  
  imageMode(CENTER);
  image(creatures[n], CreatureImgXpos, CreatureImgYpos, creatureSize, creatureSize); 

}

void mouseWheel(MouseEvent event){
  int count = event.getCount();
  if (count>0){
    creatureSize -= 3;
    creatureSize = constrain(creatureSize, 250, 430);
  }
  else {
    creatureSize += 3;
    creatureSize = constrain(creatureSize, 250, 430);
  }
}
