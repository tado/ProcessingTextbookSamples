float R=500;
float k=0.88, l=0.5; 
float th=0, seg=0.1;
void setup(){
  size(1024,1024);
  background(255);
  stroke(0,0,255);
}
void draw(){
  translate(width/2,height/2);
  float T=(1-k)/k;
  line(R*((1-k)*cos(th    )+l*k*cos(T* th     )),
       R*((1-k)*sin(th    )-l*k*sin(T* th     )),
       R*((1-k)*cos(th+seg)+l*k*cos(T*(th+seg))),
       R*((1-k)*sin(th+seg)-l*k*sin(T*(th+seg))));
  th+=seg;
}