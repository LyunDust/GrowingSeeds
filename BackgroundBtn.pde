//Owner: LeeSoyoung
class BackgroundBtn{
  PImage changeDN, landscapeBtn;
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
    if(hour() > 19){
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
      background(4, 16, 93);
    }else if(changeBG == true && changeLS == false){
      background(50, 131, 133);
    }else if(changeBG == false && changeLS == true){
      background(50, 165, 255);
    }else if(changeBG == false && changeLS == false){
      background(50, 227, 227);
    }
  }
}
