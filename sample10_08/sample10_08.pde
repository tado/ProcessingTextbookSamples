float x, y;

void setup () {
  size(500, 500);
  x=0;
}

void draw () {
  reset();
  fill(255);
  ellipse(x, y+height/2, 50, 50);
  y=100*sin(radians(x));
  x++;
}

void reset() {
  fill(126, 5);
  noStroke();
  rect(0, 0, width, height);
}