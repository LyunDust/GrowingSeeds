//Owner: LeeSoyoung
class homeBtn{
  PImage homeButton;
  float bx, by;
  
  void drawBtn(){
    //Show home button image
    
    bx = 50;
    by = 50;

    imageMode(CENTER);
    image(homeButton, bx, by, 80, 80);
  }
  
  void checkBtnClicked(){
    //Return to the start screen when the button image area is clicked
    //Stop the background sound of the play screen, play the button sound, and turn on the background sound of the start screen.

    if(mouseX > bx - 45 && mouseX < bx + 45 && 
    mouseY > by - 40 && mouseY < by + 40){

      if(PlayScreenBgm.isPlaying()){
        PlayScreenBgm.pause();
      }
      
      if(!btnSound.isPlaying()){
        btnSound.cueFrame(0);
        btnSound.play();
      }
      
      if(!StartScreenBgm.isPlaying()){
        StartScreenBgm.cueFrame(0);
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
