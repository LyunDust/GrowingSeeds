class Rain{
  float x,y,speed;
  color c;
  
  Rain(){
    x=random(width/2-200,width/2+200);
    y=random(200,height-400);
    speed=random(5,10);
    c=color(#AFD8FF);
  }
  
  void update(){
    y+=speed;
  }
  
  void display(){
    fill(c);
    noStroke();
    ellipse(x,y,2,15);
    update();
  }
}
