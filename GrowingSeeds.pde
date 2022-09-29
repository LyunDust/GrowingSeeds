LeeSoyoung_Potion potion = new LeeSoyoung_Potion();

void setup(){
  size(540, 960);
}

void draw(){
  background(255);
  potion.time = millis() - potion.startTime;
  //println(potion.time);
  
  potion.randomPotion();
  
}

void keyPressed(){
  if(potion.randomKey == key && potion.randomKey != 0){
    potion.countPotion();
  }
}
