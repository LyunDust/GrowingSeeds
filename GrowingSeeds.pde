import java.util.*;
Potion potion = new Potion();
Credit creditBtn = new Credit();
BackgroundBtn backgroundBtn = new BackgroundBtn();
homeBtn homeButton = new homeBtn();
Boolean showCredit = false, timeCheck = false, CloudClicked, playing = false, EndingMode = false;
float angle, imgsize, x, y, imgSize;
PImage cloud,seed, Back;
int savedTime, totalDrops=0, WaterNum=0;
Rain RainWater[];

void setup(){
  size(540, 960);
  
  setStartScreen();
  setScreen();
  
  json = loadJSONObject(URL);
  setTimeWithAPI();
  creditBtn.makeButton();
  
  //PlayMode=true;

  imageMode(CENTER);
  cloud=loadImage("cloud.png");
  seed=loadImage("seed.png");
  CloudClicked=false;
  savedTime=millis();
  RainWater=new Rain[100];
}

void draw(){
  if (playing == true && EndingMode == false){
    backgroundBtn.drawBtn();
    drawInPlayMode();
    drawScreen();
    if(timeCheck == false){
      checkStartTime();
    }
    potion.time = millis() - potion.startTime;
    potion.randomPotion();
    homeButton.drawBtn();
  }
  else if(playing == false && EndingMode == false){
    drawStartScreen();
    SettingOff();
  }
  else if(playing == false && EndingMode == true){
    
    backgroundBtn.drawBtn();
    homeButton.drawBtn();
    drawScreen();
    if(timeCheck == false){
      checkStartTime();
    }
    drawForJump();
  }
  
}

void keyPressed(){
  if(playing == true && EndingMode == false && potion.randomKey == key && potion.randomKey != 0){
    potion.countPotion();
  }
  
  if (key == ' '){
    playing = true;
  }
}

void mouseClicked(){
  if(playing == false && EndingMode == false){
    creditBtn.checkBtnClicked();
  }else {
    backgroundBtn.checkBtn1Clicked();
    backgroundBtn.checkBtn2Clicked();
    homeButton.checkBtnClicked();
  }
}
    
void mousePressed(){
  if(playing == true && EndingMode == false &&
    mouseX>=width/2-200&&mouseX<=width/2+200&&mouseY>=0&&mouseY<=400){
    CloudClicked=true;   
    //WaterNum++;
  }
  
  if(EndingMode == true && playing == false && 
    mouseX>=width/2-200&&mouseX<=width/2+200&&mouseY>=height-400&&mouseY<=height){
    moveCreature=true;
  }
  
  if(mouseButton == RIGHT){
    if (shouldList == false){
      shouldList = true;
    }
    else {
      shouldList = false;
    }
  }
}

void SettingOff(){
    creditBtn.drawButton();    
    timeCheck = false;
    
    if(showCredit == true){
      creditBtn.showCredit();
    }
    
    backgroundBtn.checkTime();
    backgroundBtn.changeLS = false;
    potion.clearPotion();
}

void decideEnding(){ //Must be checked within draw()
  int passedTime=millis()-savedTime;
  
  if(passedTime<30000&&WaterNum>=2){
    //println("Seed die because of too much water");
    dieEnding();
  }
  else if(passedTime>60000&&WaterNum<2){
    //println("Seed die because of too little water");
    dieEnding();
  }
  else if(passedTime>=3000&&passedTime<=60000&&WaterNum>=2){
    playing=false;
    EndingMode=true;   
  }
}

void dieEnding(){
}

void drawInPlayMode(){   
  //background(255);
  imageMode(CENTER);
  //draw rain->draw background every time!!
  image(cloud,width/2,200,400,400);
  image(seed,width/2,height-100,200,200);
  if(CloudClicked){  
//    println(WaterNum);
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
