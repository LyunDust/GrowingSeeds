//Owner: Kim Hyeri

PImage[] creatures;
PImage[] noCreatures;
int creatureNumber;
boolean[] creaturesAlive = new boolean[8];  // for every game data - CreatureList
boolean[] currentCreaturesAlive = new boolean[8];  // for current game data - CreatureList

float creaturePosY = 0;
float rot = 0.0;

void setCreatureFirst(){
  for(int i=0; i<creatures.length; i++){
    creaturesAlive[i] = false;
  }
}

void setCreature(){
  for(int i=0; i<creatures.length; i++){
    creaturesAlive[i] = false;
  }
}

void setCreature(int n){
  creaturesAlive[n] = true;
  currentCreaturesAlive[n] = true;
  setForJump();
}

void drawCreature(int n){
  /*pushMatrix();
  translate(width/2, height/2+230);
  
  imageMode(CENTER);
  image(creatures[n], 0, -creaturePosY, creatureSize, creatureSize);
  popMatrix();*/
  
  if(moveCreature){
  if(n==0||n==1||n==5||n==7){
    move(); 
    angle+=2;
  }else if(n==2||n==4||n==6){
    jump();
    angle+=2;
  }else if(n==3){
    imgScale();
    angle+=2;   
  }
  }//added code-PSY

  imageMode(CENTER);
  image(creatures[n], CreatureImgXpos, CreatureImgYpos, creatureSize, creatureSize); //[PSY] changed code  
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
