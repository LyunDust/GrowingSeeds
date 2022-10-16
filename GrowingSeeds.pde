// Owner: Lee Soyoung: merge & management
// Kim Hyeri: creature system, mic interaction, setting screen
// Lee Soyoung: potion system, weather API, button, SettingOff(), loadGameImage()
// Park Sinyoung: cloud system, interaction, sound, drawInPlayMode(), decideEnding()

import java.util.*;
Potion potion = new Potion();
Credit creditBtn = new Credit();
BackgroundBtn backgroundBtn = new BackgroundBtn();
homeBtn homeButton = new homeBtn();
Boolean showCredit = false, timeCheck = false, CloudClicked, playing = false, EndingMode = false, gage = false;
float angle, imgsize, x, y, imgSize;
PImage cloud,seed, Back;
int savedTime, passedTime, totalDrops=0, WaterNum=0, waterGage = 0;
Rain RainWater[];
SoundFile rainSound, StartScreenBgm, PlayScreenBgm, btnSound, potionSound;
SoundFile creatureSound[];

void setup(){
  size(540, 960);
  
  loadGameImage();
  loadGameSound(); 
  
  setStartScreen();
  setScreen();
  setCreatureFirst();
  
  API_KEY = loadStrings("weatherKey.txt");
  loadFileString();
  
  json = loadJSONObject(URL);
  setTimeWithAPI(); 

  imageMode(CENTER);
  cloud=loadImage("cloud.png");
  seed=loadImage("seed.png");
  CloudClicked=false;
  
  RainWater=new Rain[100];
  
}

void draw(){
  //If both playing and EndingMode are false, the start screen
  //else If playing is true and EndingMode is false, the game play screen
  //else If playing is false and EndingMode is true, the ending screen
  
  background(255);
  
  if (playing == true && EndingMode == false){
    backgroundBtn.drawBtn();
    drawInPlayMode();
    drawScreen();
    
    if(StartScreenBgm.isPlaying()){
      StartScreenBgm.pause();
    }
    if(!PlayScreenBgm.isPlaying()){
      PlayScreenBgm.cueFrame(0);
      PlayScreenBgm.play();
    }
    
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
    SoundInEnding(creatureNumber);
    if(timeCheck == false){
      checkStartTime();
    }
    if (shouldList == true){
      setList();
    }
  }
  
}

void keyPressed(){
  //If the random key matches the key pressed by the user, the potion is removed from the screen and the potion is counted 
  //and potion sound plays
  
  if(playing == true && EndingMode == false && potion.randomKey == key && potion.randomKey != 0){
    potionSound.playFor(1000);
    potion.countPotion();
  }
}

void mouseClicked(){
  //In StartScreen, start button and credit button are shown and can be clicked
  //In PlayScreen, background button and home button are shown and can be clicked
  
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

void mouseReleased(){
  //When you release your hand from the mouse, pause the sound of the button.
  //(Conditions for pause sound)
  
  if(btnSound.isPlaying()){
    btnSound.pause();
  }
}
    
void mousePressed(){
  //When it's playing, you can click on the cloud with your mouse
  //When it's ending, you can click the creature with your mouse
  //If you right-click, you can see the Creature list
  
  if(mouseButton == LEFT && shouldList == false){
    if(playing == true && EndingMode == false &&
    mouseX>=width/2-150&&mouseX<=width/2+150&&mouseY>=100&&mouseY<=300){
    if(CloudClicked == false){
      gage = true;
    }
    CloudClicked=true;
       
    if(!rainSound.isPlaying()){
      rainSound.play();
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

void SettingOff(){  //Reset settings used in gameplay
    creditBtn.drawButton();    
    timeCheck = false;
    WaterNum = 0;
    waterGage = 0;
    setCreature();
    
    if(showCredit == true){
      creditBtn.showCredit();
    }
    
    backgroundBtn.checkTime();
    backgroundBtn.changeLS = false;
    potion.clearPotion();
}

void decideEnding(){ 
  //If the number of rains is 15, the seed changes to creature the ending mode.

  if(WaterNum>=15){
    playing=false;
    EndingMode=true;   
    savedTime=millis();
  }
}

void drawInPlayMode(){   
  //draw cloud and seed
  // Every time a cloud is clicked, it rains, and counts the number of times it rains.
  
  imageMode(CENTER);

  image(cloud,width/2,180,340,340);
  image(seed,width/2,height-180,200,200);
  
  if(CloudClicked){  
    
    if(gage == true){
      waterGage += 1;
      gage = false;
    }
    
    RainWater[totalDrops]=new Rain();
    totalDrops++;
    if(totalDrops>=RainWater.length){
      totalDrops = 0;
      CloudClicked=false;
      rainSound.pause();   
      WaterNum++;
    }
    for(int i=0;i<totalDrops;i++){
      RainWater[i].display();
    }   
  }
  decideEnding();
}

void SoundInEnding(int n){
  //Play different sounds depending on the creature type
  //The ending starts and plays the sound for only one second
  
  passedTime=millis()-savedTime;
  
  if(passedTime<=1000){
    if(!creatureSound[n].isPlaying()){
      creatureSound[n].playFor(1000);
    }     
  }else{
    if(creatureSound[n].isPlaying()){
    creatureSound[n].pause();
    }
  }
}

void loadGameImage(){  //Function to load required images

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

void loadGameSound(){  //Function to load required sounds

  rainSound=new SoundFile(this,"RainSound.mp3");
  rainSound.amp(0.2);
  StartScreenBgm=new SoundFile(this,"main.mp3");
  PlayScreenBgm=new SoundFile(this,"play.mp3");
  btnSound=new SoundFile(this,"button1.mp3");
  potionSound=new SoundFile(this,"potion.wav");
  //StartScreenBgm, PlayScreenBgm, btnSound, potionSound
}
