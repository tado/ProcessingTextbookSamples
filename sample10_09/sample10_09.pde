float x, y;
float theta;
float r;

void setup () {
  size(500, 500);
  theta=0;
  r=200;
}

void draw () {
  reset();
  fill(255);
  ellipse(x+width/2, y+height/2, 50, 50);
  x=r*cos(radians(theta));
  y=r*sin(radians(theta));
  stroke(0);
  line(width/2, height/2, x+width/2, y+height/2);
  theta++;
}

void reset() {
  fill(127, 50);
  noStroke();
  rect(0, 0, width, height);
}