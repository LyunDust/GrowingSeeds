//Owner: LeeSoyoung
class Credit{
  PImage creditButton;
  float x, y;
  
  void makeButton(){
    creditButton = loadImage("creditButton.png");
  }
  
  void drawButton(){
    x = width - 150;
    y = height - 80;
    imageMode(CENTER);
    image(creditButton, x, y, 200, 200);
  }
  
  //void btnEffect(){
  //  if(mouseX > x - 85 && mouseX < x + 85 && 
  //  mouseY > y - 40 && mouseY < y + 40){
  //    pushMatrix();
  //    translate(x, y);
  //    scale(1.2);
  //    drawButton();
  //    popMatrix();
  //  }else{
  //    pushMatrix();
  //    translate(x, y);
  //    scale(1.0);
  //    drawButton();
  //    popMatrix();
  //  }
  //}
  
  void checkBtnClicked(){
    
    if(mouseX > x - 85 && mouseX < x + 85 && 
    mouseY > y - 40 && mouseY < y + 40){
      if(showCredit == false){
        showCredit = true;
        tint(150);
      }else{
        showCredit = false;
        tint(255);
      }
    }
  }
  
  void showCredit(){
    stroke(0);
    fill(255, 150);
    rectMode(CENTER);
    rect(width/2, 400, 400, 700, 30);
    
    fill(0);
    textAlign(CENTER);
    textSize(30);
    text("-Programming-\nKim Hyeri\nPark Sinyoung\nLee Soyoung\n\n-Art-\nKim Hyeri\nLee Soyoung\n\n-Sound-\nPark Sinyoung", 
    width/2, 150);
  }
}
