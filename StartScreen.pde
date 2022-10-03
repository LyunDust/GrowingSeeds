boolean playing = false;

void setup(){
  size(540,960);
  background(255);
  setScreen();
}

void draw(){
  if (playing == true){
    println("key pressed");
    drawScreen();
  }
  else
  println("no key");
}

// when there is the button for playing, this code will be distroyed
void keyPressed(){
  if (key == ' '){
    playing = true;
  }
}
