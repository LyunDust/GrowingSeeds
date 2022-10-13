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
  if(playing==false&&EndingMode==true){
    println(micVolume);
  }
   
  if (micVolume > quietLevel) {
    //creaturePosY = micVolume*700;
    CreatureImgYpos = height-200-(micVolume*1000);
    if(playing==false&&EndingMode==true){
    println(CreatureImgYpos);
    }
  }
  else if (micVolume < quietLevel) {
   //creaturePosY = 0;
   CreatureImgYpos=height-200;
       if(playing==false&&EndingMode==true){
    println(CreatureImgYpos);
    }
  }
}
