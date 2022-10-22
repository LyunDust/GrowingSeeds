String[] playScreenText = {
  "Right-click to view the Creature list.",
  "When you click the cloud 15 times, the seed grows.",
  "Creature depends on the amount of potion."
};
String[] EndingScreenText = {
  "Click on the creature and the creature moves.",
  "When you don't click on a creature, you can move the creature according to the sound of the microphone."
};

int textIndex = 0;
float textX = width, tW;

void psText(){ //Make sure the instructions come out on the play screen and move
  textFont(playFont, 20);
  textAlign(LEFT);
  fill(255);
  text(playScreenText[textIndex], textX, height - 20);
  
  textX -= 3;
  
  tW = textWidth(playScreenText[textIndex]);
  
  if(textX < -tW){
    textX = width;
    textIndex = (textIndex + 1) % playScreenText.length;
  }
}

void esText(){ //Make sure the instructions come out on the ending screen and move
  textFont(playFont, 20);
  textAlign(LEFT);
  fill(255);
  text(EndingScreenText[textIndex], textX, height - 20);
  
  textX -= 3;
  
  tW = textWidth(EndingScreenText[textIndex]);
  
  if(textX < -tW){
    textX = width;
    textIndex = (textIndex + 1) % EndingScreenText.length;
  }
}
