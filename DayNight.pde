//Owner: LeeSoyoung
class DayNight{
  PImage changeDN;
  float x, y;
  
  void drawCdnBtn(){
    x = width-60;
    y = 60;
    changeDN = loadImage("daynight144dpi.png");
    imageMode(CENTER);
    image(changeDN, x, y, 100, 100);
  }
  
  void checkBtnClicked(){
    
    if(mouseX > x - 45 && mouseX < x + 45 && 
    mouseY > y - 40 && mouseY < y + 40){
      if(changeBG == false){
        changeBG = true;
      }else{
        changeBG = false;
      }
    }
  }
  
  void changeDayNight(){
    if(changeBG == true){
      background(200, 50, 200);
    }else{
      background(50, 150, 200);
    }
  }
  
}
