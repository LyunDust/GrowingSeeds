//Owner: LeeSoyoung
class Credit{
  PImage creditButton, startButton;
  float x1, y1, x2, y2;
  
  void makeButton(){
    creditButton = loadImage("creditButton.png");
    startButton = loadImage("startButton.png");
  }
  
  void drawButton(){
    //Show credit and start button image
    
    x1 = width/2;
    y1 = height/2 + 320;
    imageMode(CENTER);
    image(creditButton, x1, y1, 200, 200);
    
    x2 = width/2;
    y2 = height/2 + 200;
    image(startButton, x2, y2, 200, 200);
  }
  
  void checkBtnClicked(){
    //Check whether each button image area is clicked
    //If it is credit button, show the credit and tint the button
    //If it is start button, start the game
    
    if(mouseX > x1 - 85 && mouseX < x1 + 85 && 
    mouseY > y1 - 40 && mouseY < y1 + 40){
      if(!btnSound.isPlaying()){
        btnSound.cueFrame(0);
        btnSound.play();
      }
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
      if(!btnSound.isPlaying()){
        btnSound.cueFrame(0);
        btnSound.play();
      }
     playing = true;
     EndingMode = false;
     savedTime=millis();
    }
  }
  
  void showCredit(){
    //Draw the credit window and content
    
    stroke(0);
    strokeWeight(1);
    fill(255, 255);
    rectMode(CENTER);
    rect(width/2, 400, 400, 700, 30);
    
    fill(0);
    textFont(playFont);
    textAlign(CENTER);
    textSize(35);
    text("-Programming-\nKim Hyeri\nPark Sinyoung\nLee Soyoung\n\n-Art-\nKim Hyeri\nLee Soyoung\n\n-Sound-\nPark Sinyoung", 
    width/2, 160);
  }
}
