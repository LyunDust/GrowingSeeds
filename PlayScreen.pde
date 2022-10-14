//Owner: Kim Hyeri

PImage[] background;

void setScreen(){
  setEndingScreen();
  background = new PImage[4];
  for(int i=0; i<background.length; i++){
    background[i] = loadImage("background"+i+".png");
  }
}

void drawScreen(){
  if (playing == true && EndingMode == false){
    drawUI();
  }
  if(playing == false && EndingMode == true){
    creatureEnding();
  }
}

void drawUI(){
  WaterNum = constrain(WaterNum, 0, 1000);
  stroke(255);
  strokeWeight(15);
  line(130, 30, width-130, 30);
  stroke(157, 207, 255);
  strokeWeight(10);
  float lineWidth = map(WaterNum, 0, 10, 130, width-130);
  line(130, 30, lineWidth, 30);
}
