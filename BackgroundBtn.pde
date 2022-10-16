//Owner: LeeSoyoung
class BackgroundBtn{
  PImage changeDN, landscapeBtn, BackgroundIMG0, BackgroundIMG1, BackgroundIMG2, BackgroundIMG3;
  float x1, y1, x2, y2;
  Boolean changeBG, changeLS = false;
  
  void drawBtn(){
    //After showing the background image according to the condition, draw two buttons that change the background
    
    changeBackground();
    
    x1 = width-50;
    y1 = 50;
    changeDN = loadImage("daynight144dpi.png");
    imageMode(CENTER);
    image(changeDN, x1, y1, 90, 90);
    
    x2 = width-50;
    y2 = 140;
    landscapeBtn = loadImage("landscape.png");
    imageMode(CENTER);
    image(landscapeBtn, x2, y2, 80, 80);    
    
  }
  
  void checkTime(){
    //Sets the background based on the current time

    if(currentTime >= sunsetTime || currentTime < sunriseTime){
      changeBG = true; 
    }else{
      changeBG = false;
    }
  }
  
  void checkBtn1Clicked(){
    //Clicking on the image area of the changeDN button changes time in the background
    //When the button is clicked, it plays the clicking sound.

    if(mouseX > x1 - 40 && mouseX < x1 + 40 && 
    mouseY > y1 - 35 && mouseY < y1 + 35){
      if(!btnSound.isPlaying()){
        btnSound.cueFrame(0);
        btnSound.play();
      }
      if(changeBG == false){
        changeBG = true;
      }else{
        changeBG = false;
      }
    }
  }
  
  void checkBtn2Clicked(){
    //Clicking on the image area of the landscapeBtn button changes the landscape in the background
    //When the button is clicked, it plays the clicking sound.

    if(mouseX > x2 - 40 && mouseX < x2 + 40 && 
    mouseY > y2 - 35 && mouseY < y2 + 35){
      if(!btnSound.isPlaying()){
        btnSound.cueFrame(0);
        btnSound.play();
      }
      if(changeLS == false){
        changeLS = true;
      }else{
        changeLS = false;
      }
    }
  }
  
  void changeBackground(){
    //Determine the background to be finally seen according to the conditions

    imageMode(CENTER);
    
    if(changeBG == true && changeLS == true){
      image(BackgroundIMG3, width/2, height/2, 540, 960);
    }else if(changeBG == true && changeLS == false){
      image(BackgroundIMG1, width/2, height/2, 540, 960);
    }else if(changeBG == false && changeLS == true){
      image(BackgroundIMG2, width/2, height/2, 540, 960);
    }else if(changeBG == false && changeLS == false){
      image(BackgroundIMG0, width/2, height/2, 540, 960);
    }
    
  }
}
