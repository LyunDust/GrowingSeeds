boolean playing = false;

PFont titleFont;

void setup(){
  size(540,960);
  setStartScreen();
  setScreen();
}

void draw(){
  if (playing == true){
    drawScreen();
  }
  else {
    drawStartScreen();
  }
}

void setStartScreen(){
  titleFont = createFont("Cabin Sketch", 60);
}

void drawStartScreen(){
  background(157, 207, 255);
  textFont(titleFont, 60);
  textAlign(CENTER, CENTER);
  text("Growing Seeds", width/2, height/2-250);
}

// for the test
void keyPressed(){
  if (key == ' '){
    playing = true;
  }
}
