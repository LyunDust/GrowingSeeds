int[] potionCount = {10, 15, 5};

void setup(){
  size(540,960);
  background(255);
  
  creatures = new PImage[8];
  for(int i=0; i<creatures.length; i++){
    creatures[i] = loadImage("creature"+i+".png");
  }
  
  noCreatures = new PImage[8];
  for(int i=0; i<noCreatures.length; i++){
    noCreatures[i] = loadImage("NoCreature"+i+".png");
  }
  
  setCreature();
  creatureEnding();
}

void draw(){
  background(255);
  drawCreature(creatureNumber);
  
  if (shouldList == true){
    setList();
  }
}

void creatureEnding(){
  // No potion ending - creature 0, 1
  if (potionCount[0] == potionCount[1] && potionCount[0] == potionCount[2]){
    creatureNumber = int(random(0, 2));
  }
  // Red potion ending - creature 2, 3
  else if (potionCount[0] >= potionCount[1] && potionCount[0] >= potionCount[2]){
    creatureNumber = int(random(2, 4));
  }
  // Green potion ending - creature 4, 5
  else if (potionCount[1] >= potionCount[0] && potionCount[1] >= potionCount[2]){
    creatureNumber = int(random(4, 6));
  }
  // Blue potion ending - creature 6, 7
  else if (potionCount[2] >= potionCount[0] && potionCount[2] >= potionCount[1]){
    creatureNumber = int(random(6, 8));
  }
  setCreature(creatureNumber);
}
