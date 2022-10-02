Potion potion = new Potion();
DayNight cdnButton = new DayNight();
Credit creditBtn = new Credit();
Boolean gameStart = false, showCredit = false, changeBG = false;

void setup(){
  size(540, 960);
  creditBtn.makeButton();
}

void draw(){
  background(255);
  //println(potion.time);
  
  if(gameStart == false){//test code
    
    background(100);
    
    creditBtn.drawButton();
    //creditBtn.btnEffect();
    
    if(showCredit == true){
      creditBtn.showCredit();
    }
    
    potion.time = 0;
    potion.startTime = millis();
    
  }else if(gameStart == true){
    
    cdnButton.changeDayNight();
    
    potion.time = millis() - potion.startTime;
  
    potion.randomPotion();
    cdnButton.drawCdnBtn();
  }
  
}

void keyPressed(){
  if(potion.randomKey == key && potion.randomKey != 0){
    potion.countPotion();
  }
  
  if(key == 'q'){
    gameStart = true;
  }
}

void mouseClicked(){
  if(gameStart == false){
    creditBtn.checkBtnClicked();
  }else{
    cdnButton.checkBtnClicked();
  }
}
