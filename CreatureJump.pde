//Owner: Kim Hyeri

import processing.sound.*;

AudioIn micSound;
Amplitude analyzer;

float quietLevel = 0.15;

void setForJump(){
  // set the mic for creature's jump
  
  micSound = new AudioIn(this, 0);
  micSound.start();
  analyzer = new Amplitude(this);
  analyzer.input(micSound);
}

void drawForJump(){
  // change the creature's position according to micVolume
  // if micVolume is loud, the creature jumps high
  // if micVolume is quiet, the creature jumps low

  float micVolume = analyzer.analyze();
  
  if (micVolume > quietLevel) {
    CreatureImgYpos = height-changeY-(micVolume*1000);
  }
  else if (micVolume < quietLevel) {
   CreatureImgYpos = height-changeY; 
  }
}
