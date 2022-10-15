//Owner: LeeSoyoung
class homeBtn{
  PImage homeButton;
  float bx, by;
  
  void drawBtn(){
    bx = 50;
    by = 50;

    imageMode(CENTER);
    image(homeButton, bx, by, 80, 80);
  }
  
  void checkBtnClicked(){
    if(mouseX > bx - 45 && mouseX < bx + 45 && 
    mouseY > by - 40 && mouseY < by + 40){
      //sound play
      if(!btnSound.isPlaying()){
        btnSound.play();
      }
      if(PlayScreenBgm.isPlaying()){
        PlayScreenBgm.pause();
      }
      if(!StartScreenBgm.isPlaying()){
        StartScreenBgm.play();
      }
      playing = false;
      EndingMode = false;
      if(rainSound.isPlaying()){
        rainSound.pause();
      }
      CloudClicked=false;
      totalDrops=0;
    }
  }
}
