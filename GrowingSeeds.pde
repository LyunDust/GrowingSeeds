import java.util.*;
Potion potion = new Potion();
Credit creditBtn = new Credit();
BackgroundBtn backgroundBtn = new BackgroundBtn();
homeBtn homeButton = new homeBtn();
Boolean gameStart = false, showCredit = false, timeCheck = false;

void setup(){
  size(540, 960);
  
  json = loadJSONObject(URL);
  setTimeWithAPI();
  creditBtn.makeButton();
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
}
