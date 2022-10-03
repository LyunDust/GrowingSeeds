PImage[] background;
boolean forest = false, ocean = true, day = true, night = false;

void setup(){
  size(540,960);
  background(255);
  setEndingScreen();
  
  background = new PImage[4];
  for(int i=0; i<background.length; i++){
    background[i] = loadImage("background"+i+".PNG");
  }
}

void draw(){
  background(255);
  setBackground();
  drawEndingScreen();
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
