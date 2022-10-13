//Owner: Kim Hyeri

PImage creatureList;
boolean shouldList = false;

void setList(){
  background(255);
  drawList();
  /*pushMatrix();
  translate(width/2, height/2);
  creatureList = loadImage("List.png");
  imageMode(CENTER);
  image(creatureList, 0, 0, width, height);
  popMatrix();*/
  
  creatureList = loadImage("List.png");
  imageMode(CENTER);
  image(creatureList, width/2,height/2, width, height); //[PSY] changed code
  
}

void drawList(){
  int m = 0;
  for(int i=0; i<creatures.length; i++){
    if (creaturesAlive[i] == false){
      if (i%2==0){
        image(noCreatures[i], 395, 240+187*m, 170, 170);
      }
      else {
        image(noCreatures[i], 147, 240+187*m, 170, 170);
      }
    }
    else {
      if (i%2==0){
        image(creatures[i], 395, 240+187*m, 170, 170);
      }
      else {
        image(creatures[i], 147, 240+187*m, 170, 170);
      }
    }
    if (i%2==1){
     m += 1;
    }
  }
}
