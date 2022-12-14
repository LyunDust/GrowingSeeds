//Owner: Kim Hyeri

boolean moveCreature=false;
float CreatureImgXpos;
float CreatureImgYpos;
int creatureSize, changeY = 250;

void setEndingScreen(){
  // set the images and position of creatures
  // call the current creature list
  // load Creatures Sound

  creatures = new PImage[8];
  for(int i=0; i<creatures.length; i++){
    creatures[i] = loadImage("creature"+i+".png");
  }
  
  noCreatures = new PImage[8];
  for(int i=0; i<noCreatures.length; i++){
    noCreatures[i] = loadImage("NoCreature"+i+".png");
  }
  
  CreatureImgXpos=width/2;
  CreatureImgYpos=height-changeY;
  creatureSize=400; 
  setCreature();
   
  creatureSound=new SoundFile[8];
  for(int i=0;i<8;i++){
    creatureSound[i]=new SoundFile(this,"creatureSound"+i+".mp3");
  } 
}

void drawEndingScreen(){
  // call the method to draw the creature on the screen

  drawCreature(creatureNumber);
}

void creatureEnding(){
  // depending on the number of potions used, the creature is confirmed randomly
  // call the method to change the value of creature list
  // call the method to draw the creature on the screen

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

  // To prevent duplicates or changes to creatures
  int cNum = creatureNumber%2;
  if (cNum == 0){
    if (currentCreaturesAlive[creatureNumber] == false) {
      if (currentCreaturesAlive[creatureNumber+1] == false){
        setCreature(creatureNumber);
      }
      else if (currentCreaturesAlive[creatureNumber+1] == true) {
        creatureNumber += 1;
      }
    }
  }
  else {
    if (currentCreaturesAlive[creatureNumber] == false) {
      if (currentCreaturesAlive[creatureNumber-1] == false) {
        setCreature(creatureNumber);
      }
      else if (currentCreaturesAlive[creatureNumber-1] == true) {
        creatureNumber -= 1;
      }
    }
  }
  drawEndingScreen();
}
