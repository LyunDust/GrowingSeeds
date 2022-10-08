//Owner: LeeSoyoung
class BackgroundBtn{
  PImage changeDN, landscapeBtn, BackgroundIMG;
  float x1, y1, x2, y2;
  Boolean changeBG, changeLS = false;
  
  void drawBtn(){
    x1 = width-60;
    y1 = 60;
    changeDN = loadImage("daynight144dpi.png");
    imageMode(CENTER);
    image(changeDN, x1, y1, 100, 100);
    
    x2 = width-60;
    y2 = 150;
    landscapeBtn = loadImage("landscape.png");
    imageMode(CENTER);
    image(landscapeBtn, x2, y2, 90, 90);
  }
  
  void checkTime(){
    if(hour() >= 19){
      changeBG = true; 
    }else{
      changeBG = false;
    }
  }
  
  void checkBtn1Clicked(){
    if(mouseX > x1 - 45 && mouseX < x1 + 45 && 
    mouseY > y1 - 40 && mouseY < y1 + 40){
      if(changeBG == false){
        changeBG = true;
      }else{
        changeBG = false;
      }
    }
  }
  
  void checkBtn2Clicked(){
    if(mouseX > x2 - 45 && mouseX < x2 + 45 && 
    mouseY > y2 - 40 && mouseY < y2 + 40){
      if(changeLS == false){
        changeLS = true;
      }else{
        changeLS = false;
      }
    }
  }
  
  void changeBackground(){
    if(changeBG == true && changeLS == true){
      BackgroundIMG = loadImage("background3.png");
    }else if(changeBG == true && changeLS == false){
      BackgroundIMG = loadImage("background1.png");
    }else if(changeBG == false && changeLS == true){
      BackgroundIMG = loadImage("background2.png");
    }else if(changeBG == false && changeLS == false){
      BackgroundIMG = loadImage("background0.png");
    }
    
    imageMode(CENTER);
    image(BackgroundIMG, width/2, height/2, 540, 960);
  }
}
