PImage[] background;

void setScreen(){
  setEndingScreen();
  background = new PImage[4];
  for(int i=0; i<background.length; i++){
    background[i] = loadImage("background"+i+".png");
  }
}

void drawScreen(){
  drawUI();
  //drawEndingScreen();
  //drawForJump();
  if (shouldList == true){
    setList();
  }
}

void drawUI(){
  WaterNum = constrain(WaterNum, 0, 1000);
  stroke(255);
  strokeWeight(15);
  line(70, 30, width-70, 30);
  stroke(0);
  strokeWeight(10);
  float lineWidth = map(WaterNum, 0, 1000, 70, width-70);
  line(70, 30, lineWidth, 30);
}
