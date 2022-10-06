//This is just for testing. 
//Coordinate the details with the team member's code and match them.

PImage Cloud, img;
PImage[] creatures;
PImage Creature;
int DecideCreature;
float x,y;
float angle=0;
boolean moveCreature=false;


void setBackground(){
  background(255);
  Cloud=loadImage("cloud.png");
  imageMode(CENTER);
  image(cloud,width/2,200,400,400);
  x=width/2;
  y=height-200;

}

void creatureEnding(){
  setBackground();
  loadCreature();
  imageMode(CENTER);
  if(moveCreature){
  if(DecideCreature==1){
    move(); 
    angle+=5;
  }else if(DecideCreature==0||DecideCreature==3){
    jump();
    angle+=5;
  }else if(DecideCreature==2){
    
  }
  }
  image(creatures[DecideCreature],x,y,400,400);
  
}

void loadCreature(){
  creatures=new PImage[4];
  creatures[0]=loadImage("unicorn.png");
  creatures[1]=loadImage("hedgehog.png");
  creatures[2]=loadImage("jackOLantern.png");
  creatures[3]=loadImage("wingcat.png");
  DecideCreature=2;
  img=creatures[DecideCreature];
  println("w = " + img.width + " | h = " + img.height);
}
