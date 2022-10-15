//Owner: LeeSoyoung
class Potion{
  String randomColor;
  char randomKey;
  float x, y, appearProb, keyProb, theta = 0, potionSize = 140;
  PImage potionIMG, potionIMG1, potionIMG2, potionIMG3;
  int time = 0, startTime, tempTime = 0, pauseTime = 0;
  Boolean potionShow = false;
  char[] pressKey = {'a', 's', 'd', 'w'};
  int[] potionCount = {0, 0, 0};
  
  void setRandom(){
    x = random(70, width-70);
    y = random(300, height-250);
    appearProb = random(1);
    keyProb = random(1);
    
    if(appearProb < 0.333){
      potionIMG = potionIMG1;
      randomColor = "RED";
    }else if(appearProb < 0.666){
      potionIMG = potionIMG2;
      randomColor = "GREEN";
    }else{
      potionIMG = potionIMG3;
      randomColor = "BLUE";
    }
    
    if(keyProb < 0.25){randomKey = pressKey[0];}
    else if(keyProb < 0.5){randomKey = pressKey[1];}
    else if(keyProb < 0.75){randomKey = pressKey[2];}
    else{randomKey = pressKey[3];}
  }
  
  void drawText(){
    fill(0);
    //textSize(40);
    textFont(potionFont);
    textAlign(CENTER);
    if(randomKey == 'd'){
      text(randomKey, x, y-97);
    }else{
      text(randomKey, x, y-100);
    }
  }
  
  void drawPotionIMG(){
    imageMode(CENTER);
    image(potionIMG, x, y, potionSize, potionSize);
  }
  
  
  void randomPotion(){
  /*Every 2 seconds, 'potion' is displayed on the screen with a probability 
  of 0.3 The probability of 'potion' by color is 0.333.*/
  
  drawPotionCountUI();
  
  if(time > 2000){
    if(random(1) > 0.3){
      setRandom(); //Randomly determine the color and position of the potion
      potionShow = true;
    }else{
      potionShow = false;
      theta = 0;
    }
    time = 0;
    startTime = millis();
  }
  
  if(potionShow == true){
    potionSize = map(sin(theta), -1, 1, 140, 150);
    drawKeyShape();
    drawText();
    drawPotionIMG();
    
    theta += 0.25;
  }
}

  void countPotion(){
      potionShow = false;
      theta = 0;
      switch(randomColor){
      case "RED":
        potionCount[0]++;
        break;
      case "GREEN":
        potionCount[1]++;
        break;
      case "BLUE":
        potionCount[2]++;
        break;
      }
    
      randomKey = 0;
  }
  
  void drawPotionCountUI(){
    noStroke();
    rectMode(CORNER);
    fill(255, 200);
    rect(20, height-170, 95, 140, 20);
    
    textFont(potionFont);
    textAlign(CENTER);
    textSize(20);
    fill(0);
    text("potion", 20+50, height-145);
    
    fill(255, 66, 53);
    rect(35, height-130, 40, 20, 10);
    fill(32, 233, 78);
    rect(35, height-100, 40, 20, 10);
    fill(38, 157, 254);
    rect(35, height-70, 40, 20, 10);
    
    fill(0);
    text(": "+potionCount[0], 20+70, height-115);
    text(": "+potionCount[1], 20+70, height-85);
    text(": "+potionCount[2], 20+70, height-55);
  }
  
  void drawKeyShape(){
    stroke(0);
    strokeWeight(1);
    fill(255);
    rectMode(CENTER);
    rect(x, y-110, 55, 55, 10);
    line(x-55/2+2.5, y-110+55/2-2.5, x+55/2-2.5, y-110-55/2+2.5);
    line(x+55/2-2.5, y-110+55/2-2.5, x-55/2+2.5, y-110-55/2+2.5);
    rect(x, y-110, 40, 40, 10);
  }
  
  void clearPotion(){
     potionShow = false;
     theta = 0;
     time = 0;
     startTime = millis() - time;
     potionCount[0] = 0;
     potionCount[1] = 0;
     potionCount[2] = 0;
  }
  
}
