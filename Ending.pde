boolean moveCreature=false;
float CreatureImgXpos;
float CreatureImgYpos;
int creatureSize;

void setEndingScreen(){
  creatures = new PImage[8];
  for(int i=0; i<creatures.length; i++){
    creatures[i] = loadImage("creature"+i+".png");
  }
  
  noCreatures = new PImage[8];
  for(int i=0; i<noCreatures.length; i++){
    noCreatures[i] = loadImage("NoCreature"+i+".png");
  }
  
  CreatureImgXpos=width/2;
  CreatureImgYpos=height-200;
  creatureSize=400;
  
  setCreature();
  creatureEnding();
}

void drawEndingScreen(){
  drawCreature(creatureNumber);
}

void creatureEnding(){
  // No potion ending - creature 0, 1
  if (potion.potionCount[0] == potion.potionCount[1] && potion.potionCount[0] == potion.potionCount[2]){
    creatureNumber = int(random(0, 2));
  }
  // Red potion ending - creature 2, 3
  else if (potion.potionCount[0] >= potion.potionCount[1] && potion.potionCount[0] >= potion.potionCount[2]){
    creatureNumber = int(random(2, 4));
  }
  // Green potion ending - creature 4, 5
  else if (potion.potionCount[1] >= potion.potionCount[0] && potion.potionCount[1] >= potion.potionCount[2]){
    creatureNumber = int(random(4, 6));
  }
  // Blue potion ending - creature 6, 7
  else if (potion.potionCount[2] >= potion.potionCount[0] && potion.potionCount[2] >= potion.potionCount[1]){
    creatureNumber = int(random(6, 8));
  }
  setCreature(creatureNumber);
}


void CreatureEnding(){
  
  if(moveCreature){
  if(creatureNumber==1){
    move(); 
    angle+=5;
  }else if(creatureNumber==0||creatureNumber==3){
    jump();
    angle+=5;
  }else if(creatureNumber==2){
    imgScale();
    angle+=5;   
  }
  }
  image(creatures[creatureNumber],x,y,imgSize,imgSize);
  
}
