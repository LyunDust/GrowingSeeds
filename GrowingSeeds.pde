PImage cloud,seed;
int WaterNum=0;
int savedTime;
Rain RainWater[];
boolean CloudClicked;
boolean PlayMode, EndingMode;
int totalDrops=0;

void setup(){
  PlayMode=true;
  size(540,960);
  background(255);
  cloud=loadImage("cloud.png");
  seed=loadImage("seed.png");
  CloudClicked=false;
  savedTime=millis();
  RainWater=new Rain[100];
}

void draw(){
  if(PlayMode){
    drawInPlayMode();
  } 
  if(EndingMode){
    creatureEnding();
  }
}

void mousePressed(){
  if(mouseX>=width/2-200&&mouseX<=width/2+200&&mouseY>=0&&mouseY<=400){
    CloudClicked=true;   
    WaterNum++;
  }
}

void decideEnding(){ //Must be checked within draw()
  int passedTime=millis()-savedTime;
  
  if(passedTime<30000&&WaterNum>=20){
    println("Seed die because of too much water");
    dieEnding();
  }
  else if(passedTime>60000&&WaterNum<20){
    println("Seed die because of too little water");
    dieEnding();
  }
  else if(passedTime>=3000&&passedTime<=60000&&WaterNum>=20){
    PlayMode=false;
    EndingMode=true;   
  }
}

void dieEnding(){
}

void drawInPlayMode(){   
  background(255);
  imageMode(CENTER);
  image(cloud,width/2,200,400,400);
  image(seed,width/2,height-100,200,200);
  if(CloudClicked){  
    println(WaterNum);
    RainWater[totalDrops]=new Rain();
    totalDrops++;
    if(totalDrops>=RainWater.length){
      totalDrops = 0;
      CloudClicked=false;
    }
    for(int i=0;i<totalDrops;i++){
      RainWater[i].display();
    }   
  }
  decideEnding();
}
