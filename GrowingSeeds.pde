Potion potion = new Potion();
Credit creditBtn = new Credit();
BackgroundBtn backgroundBtn = new BackgroundBtn();
Boolean gameStart = false, showCredit = false;

void setup(){
  size(540, 960);
  creditBtn.makeButton();
  backgroundBtn.checkTime();
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
    
    backgroundBtn.changeBackground();
    
    potion.time = millis() - potion.startTime;
  
    potion.randomPotion();
    backgroundBtn.drawBtn();
  }
  
}

void keyPressed(){
  if(potion.randomKey == key && potion.randomKey != 0){
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
  }
}
