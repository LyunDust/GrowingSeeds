PImage cloud,seed;
int WaterNum=0;
int savedTime;
Rain RainWater[];
boolean CloudClicked;
int totalDrops=0;

void setup(){
  size(540,960);
  background(255);
  cloud=loadImage("cloud.png");
  seed=loadImage("seed.png");
  CloudClicked=false;
  savedTime=millis();
  RainWater=new Rain[100];
}

void draw(){
  int i=0;
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
    for(i=0;i<totalDrops;i++){
      RainWater[i].display();
    }   
  }
  decideEnding();
}

void mousePressed(){
  if(mouseX>=width/2-200&&mouseX<=width/2+200&&mouseY>=0&&mouseY<=400){
    CloudClicked=true;   
    WaterNum++;
  }
}

void decideEnding(){
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
    creatureEnding();
  }
}

void dieEnding(){
}

void creatureEnding(){
  println("The seeds have grown well");
}
