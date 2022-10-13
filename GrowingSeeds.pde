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
SoundFile rainFile;

void setup(){
  size(540, 960);
  
  loadGameImage();
  
  setStartScreen();
  setScreen();
  
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
    
    potion.time = millis() - potion.startTime;
  
    
    potion.randomPotion();
    homeButton.drawBtn();
  }
  else if(playing == false && EndingMode == false){
    drawStartScreen();
    SettingOff();
  }else if(playing == false && EndingMode == true){
    drawEndingScreen();
    homeButton.drawBtn();
    
  }
  
}

void keyPressed(){
  if(playing == true && EndingMode == false && potion.randomKey == key && potion.randomKey != 0){
    potion.countPotion();
  }
}

void mouseClicked(){
  if(playing == false && EndingMode == false){
    creditBtn.checkBtnClicked();
  }else if(playing == true && EndingMode == false){
    backgroundBtn.checkBtn1Clicked();
    backgroundBtn.checkBtn2Clicked();
    homeButton.checkBtnClicked();
  }else if(playing == false && EndingMode == true){
    homeButton.checkBtnClicked();
  }
}
    
void mousePressed(){
  if(playing == true && EndingMode == false &&
    mouseX>=width/2-150&&mouseX<=width/2+150&&mouseY>=100&&mouseY<=300){
    CloudClicked=true;   
    if(!rainFile.isPlaying()){
      rainFile.play();
    }
    //WaterNum++;
  }
  
  if(EndingMode == true && playing == false && 
    mouseX>=width/2-170&&mouseX<=width/2+170&&mouseY>=height-350&&mouseY<=height){
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
    background(100);
    creditBtn.drawButton();    
    timeCheck = false;
    WaterNum = 0;
    savedTime = millis();
    
    if(showCredit == true){
      creditBtn.showCredit();
    }
    
    backgroundBtn.checkTime();
    backgroundBtn.changeLS = false;
    potion.clearPotion();
}

void decideEnding(){ //Must be checked within draw()
  int passedTime=millis()-savedTime;
  
  if(passedTime<30000&&WaterNum>=1){
    //println("Seed die because of too much water");
    dieEnding();
  }
  else if(passedTime>60000&&WaterNum<1){
    //println("Seed die because of too little water");
    dieEnding();
  }

  else if(passedTime>=30000&&passedTime<=60000&&WaterNum>=8){
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

  image(cloud,width/2,200,340,340);
  image(seed,width/2,height-200,200,200);

  if(CloudClicked){  
    println(WaterNum);
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
