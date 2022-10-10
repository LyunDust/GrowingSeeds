//Owner: Kim Hyeri

import processing.sound.*;

AudioIn micSound;
Amplitude analyzer;

float quietLevel = 0.15;

void setForJump(){
  micSound = new AudioIn(this, 0);
  micSound.start();
  analyzer = new Amplitude(this);
  analyzer.input(micSound);
}

void drawForJump(){
  float micVolume = analyzer.analyze();
  
  if (micVolume > quietLevel) {
    creaturePosY = micVolume*700;
  }
  else if (micVolume < quietLevel) {
   creaturePosY = 0;
  }
}
