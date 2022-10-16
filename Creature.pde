//Owner: Kim Hyeri

PImage[] creatures;
PImage[] noCreatures;
int creatureNumber;
boolean[] creaturesAlive = new boolean[8];  // for every game data - CreatureList
boolean[] currentCreaturesAlive = new boolean[8];  // for current game data - CreatureList

float creaturePosY = 0;
float rot = 0.0;

void setCreatureFirst(){
  // set the creature list (for all game data)

  for(int i=0; i<creatures.length; i++){
    creaturesAlive[i] = false;
  }
}

void setCreature(){
  // set the current creature list (for current game data)

  for(int i=0; i<creatures.length; i++){
    currentCreaturesAlive[i] = false;
  }
}

void setCreature(int n){
  // change the value of creature list
  // call the method to set the mic for creature's jump
  
  creaturesAlive[n] = true;
  currentCreaturesAlive[n] = true;
  setForJump();
}

void drawCreature(int n){
  // draw the creature on the screen
  // draw different movement according to creatures
  // if creatures move, it's not working to call the method to mic jump
  
  if(!moveCreature){
    drawForJump();
  }else if(moveCreature){
  if(n==0||n==1||n==3||n==5||n==7){
    move(); 
    angle+=2;
  }else if(n==2||n==4||n==6){
    jump();
    angle+=2;
  }
  }

  imageMode(CENTER);
  image(creatures[n], CreatureImgXpos, CreatureImgYpos, creatureSize, creatureSize); 
      
}

void mouseWheel(MouseEvent event){
  // move mouseWheel to change the size of creature's image

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
