//Owner: LeeSoyoung
class homeBtn{
  PImage homeButton;
  float bx, by;
  
  void drawBtn(){
    bx = 50;
    by = 90;

    imageMode(CENTER);
    image(homeButton, bx, by, 80, 80);
  }
  
  void checkBtnClicked(){
    if(mouseX > bx - 45 && mouseX < bx + 45 && 
    mouseY > by - 40 && mouseY < by + 40){
      playing = false;
      EndingMode = false;
      if(rainFile.isPlaying()){
        rainFile.pause();
      }
      CloudClicked=false;
      totalDrops=0;
    }
  }
}
