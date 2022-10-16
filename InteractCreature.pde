//Owner: Park Sinyoung
int replayNum=0;

//The interaction varies depending on the creature type

void move(){
  //The Creature moves left and right for a specified number of times.
  
  if(cos(radians(angle))==1){
    println(radians(angle));
    replayNum++;
  }
  if(replayNum<=2){
    CreatureImgXpos+=(cos(radians(angle)));
  }else{
    moveCreature=false;
    replayNum=0;
  }  
  
}

void jump(){
  //The Creature moves up and down for a specified number of times.
  
  if(sin(radians(angle))==-1){
    replayNum++;
  }
  if(replayNum<=2){
    CreatureImgYpos-=(sin(radians(angle))); 
  }else{
    moveCreature=false;
    replayNum=0;
  }
}
