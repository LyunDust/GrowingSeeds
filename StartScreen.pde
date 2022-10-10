PFont titleFont;

void setStartScreen(){
  titleFont = createFont("Cabin Sketch", 60);
}

void drawStartScreen(){
  background(157, 207, 255);
  textFont(titleFont, 60);
  textAlign(CENTER, CENTER);
  text("Growing Seeds", width/2, height/2-250);
}
