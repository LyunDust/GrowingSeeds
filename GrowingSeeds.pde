import java.util.*;
Potion potion = new Potion();
Credit creditBtn = new Credit();
BackgroundBtn backgroundBtn = new BackgroundBtn();
homeBtn homeButton = new homeBtn();
Boolean showCredit = false, timeCheck = false, CloudClicked, playing = false, EndingMode = false, gage = false;
float angle, imgsize, x, y, imgSize;
PImage cloud,seed, Back;
int savedTime, totalDrops=0, WaterNum=0, waterGage = 0;
Rain RainWater[];
SoundFile rainFile;

void setup(){
  size(540, 960);
  
  loadGameImage();
  
  setStartScreen();
  setScreen();
  setCreatureFirst();
  
  json = loadJSONObject(URL);
  setTimeWithAPI();
  
  //PlayMode=true;

  imageMode(CENTER);
  cloud=loadImage("cloud.png");
  seed=loadImage("seed.png");
  CloudClicked=false;
  
  RainWater=new Rain[100];
  rainFile=new SoundFile(this,"RainSound.mp3");
  rainFile.amp(0.2);
}

void draw(){
  background(255);
  
  if (playing == true && EndingMode == false){
    backgroundBtn.drawBtn();
    drawInPlayMode();
    drawScreen();
    
    if(timeCheck == false){
      checkStartTime();
    }
  
    if(shouldList == false){
      potion.tempTime = millis();
      potion.time = millis() - potion.startTime;
      potion.randomPotion();
    }else{
      potion.pauseTime = millis()-potion.tempTime;
    }
    homeButton.drawBtn();
    
    if (shouldList == true){
      setList();
    }
  }
  else if(playing == false && EndingMode == false){
    drawStartScreen();
    SettingOff();
  }else if(playing == false && EndingMode == true){
    
    backgroundBtn.drawBtn();
    homeButton.drawBtn();
    drawScreen();
    if(timeCheck == false){
      checkStartTime();
    }
    if (shouldList == true){
      setList();
    }
  }
  
}

void keyPressed(){
  if(playing == true && EndingMode == false && potion.randomKey == key && potion.randomKey != 0){
    potion.countPotion();
  }
}

void mouseClicked(){
  if(mouseButton == LEFT && shouldList == false){
  if(playing == false && EndingMode == false){
    creditBtn.checkBtnClicked();
  }else {
    backgroundBtn.checkBtn1Clicked();
    backgroundBtn.checkBtn2Clicked();
    homeButton.checkBtnClicked();
  }
  }
}
    
void mousePressed(){
  
  if(mouseButton == LEFT && shouldList == false){
    if(playing == true && EndingMode == false &&
    mouseX>=width/2-150&&mouseX<=width/2+150&&mouseY>=100&&mouseY<=300){
    if(CloudClicked == false){
      gage = true;
    }
    CloudClicked=true;
    
    
    if(!rainFile.isPlaying()){
      rainFile.play();
    }
  }
  
  if(EndingMode == true && playing == false && 
    mouseX>=width/2-170&&mouseX<=width/2+170&&mouseY>=height-350&&mouseY<=height){
    moveCreature=true;
  } 
  }
  
  if(mouseButton == RIGHT){
    if (shouldList == false){
      shouldList = true;
    }
    else {
      shouldList = false;
      potion.startTime += potion.pauseTime;
    }
  }
}

void SettingOff(){
    creditBtn.drawButton();    
    timeCheck = false;
    WaterNum = 0;
    waterGage = 0;
    savedTime = millis();
    
    if(showCredit == true){
      creditBtn.showCredit();
    }
    
    backgroundBtn.checkTime();
    backgroundBtn.changeLS = false;
    potion.clearPotion();
}

void decideEnding(){ //Must be checked within draw()

  if(WaterNum>=15){
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

  image(cloud,width/2,180,340,340);
  image(seed,width/2,height-180,200,200);
  
  if(CloudClicked){  
    println(WaterNum);
    
    if(gage == true){
      waterGage += 1;
      gage = false;
    }
    
    RainWater[totalDrops]=new Rain();
    totalDrops++;
    if(totalDrops>=RainWater.length){
      totalDrops = 0;
      CloudClicked=false;
      rainFile.pause();   
      WaterNum++;
    }
    for(int i=0;i<totalDrops;i++){
      RainWater[i].display();
    }   
  }
  decideEnding();
}


void loadGameImage(){
  backgroundBtn.BackgroundIMG0 = loadImage("background0.png");
  backgroundBtn.BackgroundIMG1 = loadImage("background1.png");
  backgroundBtn.BackgroundIMG2 = loadImage("background2.png");
  backgroundBtn.BackgroundIMG3 = loadImage("background3.png");
  homeButton.homeButton = loadImage("homeBtn.png");
  potion.potionIMG1 = loadImage("redPotion144dpi.png");
  potion.potionIMG2 = loadImage("greenPotion144dpi.png");
  potion.potionIMG3 = loadImage("bluePotion144dpi.png");
  creditBtn.makeButton();
}
