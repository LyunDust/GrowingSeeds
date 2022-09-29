PImage cloud,seed;
int WaterNum=0;
int savedTime;
Rain RainWater[];
boolean CloudClicked;

void setup(){
  size(540,960);
  background(255);
  cloud=loadImage("cloud.png");
  seed=loadImage("seed.png");
  CloudClicked=false;
  savedTime=millis();
  RainWater=new Rain[200];
  for(int i=0;i<100;i++){
    RainWater[i]=new Rain();
  }
}

void draw(){
  background(255);
  imageMode(CENTER);
  image(cloud,width/2,200,400,400);
  image(seed,width/2,height-100,200,200);
  if(CloudClicked){   
    for(int i=0;i<100;i++){
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
    println("Seed die because of too mush water");
  }
  else if(passedTime>60000&&WaterNum<20){
    println("Seed die because of too little water");
  }
}
