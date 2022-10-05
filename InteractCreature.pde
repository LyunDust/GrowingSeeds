//Creature type-> different interactions

//2,4,6 ->flying
//0,1,5-> move
float xpos, ypos;
float theta=0;
float r=width/2-400;

void move(){
  x+=(20*cos(radians(angle)));
}

void jump(){
  y-=(50*sin(radians(angle)));  
}
