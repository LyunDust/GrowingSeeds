//Owner: Kim Hyeri

PImage creatureList;
boolean shouldList = false;

void setList(){
  // set the image of creature list
  // call the method to draw the image of creature list

  background(255);
  
  rectMode(CORNER);
  
  fill(255, 131, 131);
  noStroke();
  rect(0, height/4 + 100, width, 200);
  
  fill(165, 222, 159);
  noStroke();
  rect(0, height/4 * 2 + 30, width, 180);
  
  fill(139, 189, 255);
  noStroke();
  rect(0, height/4 * 3, width, 200);
  
  drawList();
  
  creatureList = loadImage("List.png");
  imageMode(CENTER);
  image(creatureList, width/2,height/2, width, height); //[PSY] changed code
  
}

void drawList(){
  // draw the image of creature list
  // if there is no creature, the list is empty
  // if there are some creature, the image of creatures are drawn

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
