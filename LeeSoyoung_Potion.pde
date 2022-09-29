class LeeSoyoung_Potion{
  String randomColor;
  char randomKey;
  float x, y, appearProb, keyProb, theta = 0, potionSize = 150;
  PImage potionIMG;
  int time, startTime;
  Boolean potionShow = false;
  char[] pressKey = {'a', 's', 'd', 'f'};
  int[] potionCount = {0, 0, 0};
  
  void setRandom(){
    x = random(70, width-70);
    y = random(100, height-70);
    appearProb = random(1);
    keyProb = random(1);
    
    if(appearProb < 0.333){
      potionIMG = loadImage("redPotion144dpi.png");
      randomColor = "RED";
    }else if(appearProb < 0.666){
      potionIMG = loadImage("greenPotion.png");
      randomColor = "GREEN";
    }else{
      potionIMG = loadImage("bluePotion.png");
      randomColor = "BLUE";
    }
    
    if(keyProb < 0.25){randomKey = pressKey[0];}
    else if(keyProb < 0.5){randomKey = pressKey[1];}
    else if(keyProb < 0.75){randomKey = pressKey[2];}
    else{randomKey = pressKey[3];}
  }
  
  void drawText(){
    fill(0);
    textSize(50);
    text(randomKey, x-10, y-100);
  }
  
  void drawPotionIMG(){
    imageMode(CENTER);
    image(potionIMG, x, y, potionSize, potionSize);
  }
  
  
  void randomPotion(){
  /*Every 3 seconds, 'potion' is displayed on the screen with a probability 
  of 0.5. The probability of 'potion' by color is 0.333.*/
  if(time > 3000){
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
    potionSize = map(sin(theta), -1, 1, 150, 160);
    drawText();
    drawPotionIMG();
    
    theta += 0.07;
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
    
    println(potionCount[0] + " / " + potionCount[1] + " / "+ potionCount[2]);
}
  
}
