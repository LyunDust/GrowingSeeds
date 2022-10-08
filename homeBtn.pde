//Owner: LeeSoyoung
class homeBtn{
  PImage homeButton;
  float x, y;
  
  void drawBtn(){
    x = 60;
    y = 60;
    homeButton = loadImage("homeBtn.png");
    imageMode(CENTER);
    image(homeButton, x, y, 80, 80);
  }
  
  void checkBtnClicked(){
    if(mouseX > x - 45 && mouseX < x + 45 && 
    mouseY > y - 40 && mouseY < y + 40){
      gameStart = false;
    }
  }
}
