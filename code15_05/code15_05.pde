PVector pos, vel, acc;
void setup(){
  background(255);
  fill(0);
  size(1280,720);
  pos = new PVector(100,600);
  vel = new PVector(5,-30);
  acc = new PVector(0,1);
}
void draw(){
  ellipse(pos.x, pos.y,10,10);
  vel.add(acc);
  pos.add(vel);
  if(pos.y>600){
    pos.y = 600;
    vel.y *= -0.8;
  }
}