//Owner: Park Sinyoung
class Rain{
  float x,y,speed;
  color c;
  
  Rain(){
    //Initialize position, speed, and color when creating an object
    
    x=random(width/2-165,width/2+165);
    y=random(180,height-350);
    speed=random(5,10);
    c=color(#AFD8FF);
  }
  
  void update(){
    //In order to create the motion of rain falling down from the clouds, a random speed is added to the y-position
    y+=speed;
  }
  
  void display(){
    //Draw a raindrop
    
    fill(c);
    noStroke();
    ellipse(x,y,2,15);
    update();
  }
}
