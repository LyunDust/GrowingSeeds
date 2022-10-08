PImage[] background;

// for the test
boolean forest = true, ocean = false, day = true, night = false;

// for the test
int WaterNum=0;

void setScreen(){
  setEndingScreen();
  background = new PImage[4];
  for(int i=0; i<background.length; i++){
    background[i] = loadImage("background"+i+".png");
  }
}

void drawScreen(){
  setBackground();
  drawUI();
  drawEndingScreen();
  drawForJump();
  if (shouldList == true){
    setList();
  }
}

void setBackground(){
  if (forest == true){
    if (day == true){
      drawBackground(0);
    }
    else if (night == true){
      drawBackground(1);
    }
  }
  else if (ocean == true){
    if (day == true){
      drawBackground(2);
    }
    else if (night == true){
      drawBackground(3);
    }
  }
}

void drawBackground(int n){
  pushMatrix();
  translate(width/2, height/2);
  imageMode(CENTER);
  image(background[n], 0, 0, width, height);
  popMatrix();
}

void drawUI(){
  WaterNum++;  // for the test
  WaterNum = constrain(WaterNum, 0, 1000);
  stroke(255);
  strokeWeight(15);
  line(70, 30, width-70, 30);
  stroke(0);
  strokeWeight(10);
  float lineWidth = map(WaterNum, 0, 1000, 70, width-70);
  line(70, 30, lineWidth, 30);
}
