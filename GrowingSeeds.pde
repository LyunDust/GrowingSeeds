import java.util.*;
Potion potion = new Potion();
Credit creditBtn = new Credit();
BackgroundBtn backgroundBtn = new BackgroundBtn();
homeBtn homeButton = new homeBtn();
Boolean gameStart = false, showCredit = false, timeCheck = false;

PImage cloud,seed, Back;
int WaterNum=0;
int savedTime;
Rain RainWater[];
boolean CloudClicked;
boolean PlayMode, EndingMode;
int totalDrops=0;

void setup(){
  size(540, 960);
  
  json = loadJSONObject(URL);
  setTimeWithAPI();
  creditBtn.makeButton();
  
  PlayMode=true;

  Back=loadImage("background3.png");
  imageMode(CENTER);
  image(Back,width/2,height/2,width,height);
  cloud=loadImage("cloud.png");
  seed=loadImage("seed.png");
  CloudClicked=false;
  savedTime=millis();
  RainWater=new Rain[100];
}

void draw(){
  background(255);
  
  if(gameStart == false){//test code
    
    SettingOff();
    
  }else if(gameStart == true){
    
    if(timeCheck == false){
      checkStartTime();
    }
    
    potion.time = millis() - potion.startTime;
  
    backgroundBtn.drawBtn();
    potion.randomPotion();
    homeButton.drawBtn();
  }
  
    if(PlayMode){
    drawInPlayMode();
  } 
  if(EndingMode){
    creatureEnding();
  }
  
}

void keyPressed(){
  if(gameStart == true && potion.randomKey == key && potion.randomKey != 0){
    potion.countPotion();
  }
  //test
  if(key == 'q'){
    gameStart = true;
  }
}

void mouseClicked(){
  if(gameStart == false){
    creditBtn.checkBtnClicked();
  }else{
    backgroundBtn.checkBtn1Clicked();
    backgroundBtn.checkBtn2Clicked();
    homeButton.checkBtnClicked();
  }
}

void SettingOff(){
    background(100);
    creditBtn.drawButton();    
    timeCheck = false;
    
    if(showCredit == true){
      creditBtn.showCredit();
    }
    
    backgroundBtn.checkTime();
    backgroundBtn.changeLS = false;
    potion.clearPotion();
    
void mousePressed(){
  if(PlayMode&&
    mouseX>=width/2-200&&mouseX<=width/2+200&&mouseY>=0&&mouseY<=400){
    CloudClicked=true;   
    //WaterNum++;
  }
  
  if(EndingMode&&
    mouseX>=width/2-200&&mouseX<=width/2+200&&mouseY>=height-400&&mouseY<=height){
    moveCreature=true;
  }
}

void decideEnding(){ //Must be checked within draw()
  int passedTime=millis()-savedTime;
  
  if(passedTime<30000&&WaterNum>=10){
    println("Seed die because of too much water");
    dieEnding();
  }
  else if(passedTime>60000&&WaterNum<10){
    println("Seed die because of too little water");
    dieEnding();
  }
  else if(passedTime>=3000&&passedTime<=60000&&WaterNum>=10){
    PlayMode=false;
    EndingMode=true;   
  }
}

void dieEnding(){
}

void drawInPlayMode(){   
  //background(255);
  imageMode(CENTER);
  //draw rain->draw background every time!!
  image(Back,width/2,height/2,width,height);
  image(cloud,width/2,200,400,400);
  image(seed,width/2,height-100,200,200);
  if(CloudClicked){  
    println(WaterNum);
    RainWater[totalDrops]=new Rain();
    totalDrops++;
    if(totalDrops>=RainWater.length){
      totalDrops = 0;
      CloudClicked=false;
      WaterNum++;
    }
    for(int i=0;i<totalDrops;i++){
      RainWater[i].display();
    }   
  }
  decideEnding();
}
