PImage[] creatures;
PImage[] noCreatures;
int creatureNumber;
int creatureSize = 400;
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

void drawCreature(int n){
  pushMatrix();
  translate(width/2, height/2+230);
  
  imageMode(CENTER);
  image(creatures[n], 0, -creaturePosY, creatureSize, creatureSize);
  popMatrix();
  

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

// when there is the button for playing, this code will be distroyed
void mousePressed(){  
  if(mouseButton == RIGHT){
    if (shouldList == false){
      shouldList = true;
    }
    else {
      shouldList = false;
    }
  }
}
