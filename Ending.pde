PImage Cloud, img;
PImage[] creatures;
PImage Creature;
int DecideCreature;
float imgSize;
float x,y;
float angle=0;
boolean moveCreature=false;

void setEndingScreen(){
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

void drawEndingScreen(){
  drawCreature(creatureNumber);
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

//This is just for testing. 
//Coordinate the details with the team member's code and match them.




void setBackground(){
  Back=loadImage("background3.png");
  imageMode(CENTER);
  image(Back,width/2,height/2,width,height);
  x=width/2;
  y=height-200;
  imgSize=400;
}

void CreatureEnding(){
  
  if(moveCreature){
  if(DecideCreature==1){
    move(); 
    angle+=5;
  }else if(DecideCreature==0||DecideCreature==3){
    jump();
    angle+=5;
  }else if(DecideCreature==2){
    imgScale();
    angle+=5;   
  }
  }
  image(creatures[DecideCreature],x,y,imgSize,imgSize);
  
}

void loadCreature(){
  creatures=new PImage[4];
  creatures[0]=loadImage("unicorn.png");
  creatures[1]=loadImage("hedgehog.png");
  creatures[2]=loadImage("jackOLantern.png");
  creatures[3]=loadImage("wingcat.png");
  DecideCreature=3;
  img=creatures[DecideCreature];
  //println("w = " + img.width + " | h = " + img.height);
}
