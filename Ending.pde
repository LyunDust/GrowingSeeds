//This is just for testing. 
//Coordinate the details with the team member's code and match them.

PImage Cloud, img;
PImage[] creatures;
PImage Creature;
int DecideCreature;
float imgSize;
float x,y;
float angle=0;
boolean moveCreature=false;


void setBackground(){
  Back=loadImage("background3.png");
  imageMode(CENTER);
  image(Back,width/2,height/2,width,height);
  x=width/2;
  y=height-200;
  imgSize=400;
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
    imgScale();
    angle+=5;   
  }
  }
  image(creatures[DecideCreature],x,y,imgSize,imgSize);
  
}

void loadCreature(){
  creatures=new PImage[4];
  creatures[0]=loadImage("unicorn.png");
  creatures[1]=loadImage("hedgehog.png");
  creatures[2]=loadImage("jackOLantern.png");
  creatures[3]=loadImage("wingcat.png");
  DecideCreature=3;
  img=creatures[DecideCreature];
  //println("w = " + img.width + " | h = " + img.height);
}
