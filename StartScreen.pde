//Owner: Kim Hyeri

PFont titleFont;
PFont potionFont;

void setStartScreen(){
  titleFont = loadFont("CabinSketch-Bold-100.vlw");
  potionFont = loadFont("ArialMT-40.vlw");
}

void drawStartScreen(){
  background(121, 171, 255);
  fill(255);
  textFont(titleFont);
  textAlign(CENTER, CENTER);
  text("Growing\nSeeds", width/2, height/2-230);
  textSize(30);
  text("for creatures..?", width/2, height/2);
}
