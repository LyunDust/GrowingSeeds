//Owner: Kim Hyeri

PImage[] creatures;
PImage[] noCreatures;
int creatureNumber;
int creatureSize = 400;
boolean[] creaturesAlive = new boolean[8];  // for every game data
boolean[] currentCreaturesAlive = new boolean[8];  // for current game data
float creaturePosY = 0;

void setCreature(){
  for(int i=0; i<creatures.length; i++){
    creaturesAlive[i] = false;
    currentCreaturesAlive[i] = false;
  }
}

void setCreature(int n){
  creaturesAlive[n] = true;
  currentCreaturesAlive[n] = true;
  setForJump();
}

void drawCreature(int n){
  pushMatrix();
  translate(width/2, height/2+230);
  
  imageMode(CENTER);
  image(creatures[n], 0, -creaturePosY, creatureSize, creatureSize);
  popMatrix();
  println("creature"+n);
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
