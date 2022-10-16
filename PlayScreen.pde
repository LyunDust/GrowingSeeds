//Owner: Kim Hyeri

PImage[] background;

void setScreen(){
  // call the method to set the images and position of creatures
  // set the background image
  
  setEndingScreen();
  background = new PImage[4];
  for(int i=0; i<background.length; i++){
    background[i] = loadImage("background"+i+".png");
  }
}

void drawScreen(){
  // draw the screen included UI and creature
  // if it is not ending, call the method to draw UI
  // if it is ending, call the method to confirm the creature randomly

  if (playing == true && EndingMode == false){
    drawUI();
  }
  if(playing == false && EndingMode == true){
    creatureEnding();
  }
}

void drawUI(){
  // draw the gage bar of waterNum
  // as waternum increases, the gage goes up
  
  waterGage = constrain(waterGage, 0, 15);
  stroke(255);
  strokeWeight(15);
  line(130, 30, width-130, 30);
  stroke(157, 207, 255);
  strokeWeight(10);
  float lineWidth = map(waterGage, 0, 15, 130, width-130);
  line(130, 30, lineWidth, 30);
}
