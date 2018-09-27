float a=3,b=4;
float th=0,seg=0.01;
float r=500;
void setup(){
  size(1024,1024);
  background(255);
  strokeWeight(20);
  stroke(0,0,255);
}
void draw(){
  translate(width/2,height/2);
  line(r*cos(a*th),r*sin(b*th),
       r*cos(a*(th+seg)),r*sin(b*(th+seg)));
  th+=seg;
  //r-=0.1;
}