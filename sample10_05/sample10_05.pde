float y;
void setup () {
  size(500, 500);
  y=250;
}

void draw () {
  reset();
  fill(255);
  stroke(0);
  ellipse(250, y, 50, 50);
  y=y+5;
  if (y>500) {
    y=y-5;
  }
}

void reset() {
  fill(127);
  noStroke();
  rect(0, 0, width, height);
}