//Owner: LeeSoyoung
class homeBtn{
  PImage homeButton;
  float bx, by;
  
  void drawBtn(){
    bx = 60;
    by = 60;
    homeButton = loadImage("homeBtn.png");
    imageMode(CENTER);
    image(homeButton, bx, by, 80, 80);
  }
  
  void checkBtnClicked(){
    if(mouseX > bx - 45 && mouseX < bx + 45 && 
    mouseY > by - 40 && mouseY < by + 40){
      playing = false;
      EndingMode = false;
    }
  }
}
