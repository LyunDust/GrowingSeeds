//Owner: LeeSoyoung
class Credit{
  PImage creditButton, startButton;
  float x1, y1, x2, y2;
  
  void makeButton(){
    creditButton = loadImage("creditButton.png");
    startButton = loadImage("startButton.png");
  }
  
  void drawButton(){
    x1 = width/2;
    y1 = height/2 + 320;
    imageMode(CENTER);
    image(creditButton, x1, y1, 200, 200);
    
    x2 = width/2;
    y2 = height/2 + 200;
    image(startButton, x2, y2, 200, 200);
  }
  
  void checkBtnClicked(){
    
    if(mouseX > x1 - 85 && mouseX < x1 + 85 && 
    mouseY > y1 - 40 && mouseY < y1 + 40){
      if(showCredit == false){
        showCredit = true;
        tint(150);
      }else{
        showCredit = false;
        tint(255);
      }
    }
    
    if(mouseX > x2 - 85 && mouseX < x2 + 85 && 
    mouseY > y2 - 40 && mouseY < y2 + 40){
     playing = true;
     EndingMode = false;
     savedTime=millis();
    }
  }
  
  void showCredit(){
    stroke(0);
    strokeWeight(1);
    fill(255, 255);
    rectMode(CENTER);
    rect(width/2, 400, 400, 700, 30);
    
    fill(0);
    textFont(potionFont);
    textAlign(CENTER);
    textSize(35);
    text("-Programming-\nKim Hyeri\nPark Sinyoung\nLee Soyoung\n\n-Art-\nKim Hyeri\nLee Soyoung\n\n-Sound-\nPark Sinyoung", 
    width/2, 160);
  }
}
