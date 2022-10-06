//Creature type-> different interactions

//2,4,6 ->flying
//0,1,5-> move
int replayNum=0;

void move(){
  if(cos(radians(angle))==1){
    println(radians(angle));
    replayNum++;
  }
  if(replayNum<=4){
    x+=(20*cos(radians(angle)));
  }else{
    moveCreature=false;
    replayNum=0;
  }  
  
}

void jump(){
  y-=(50*sin(radians(angle)));  
}
