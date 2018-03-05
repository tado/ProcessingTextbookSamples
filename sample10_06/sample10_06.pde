float y;
float speed_y;
void setup () {
  size(500, 500);
  y=250;
  speed_y=5;
}

void draw () {
  reset();
  fill(255);
  stroke(0);
  ellipse(250, y, 50, 50);
  y=y+speed_y;
  if (y>500) {
    speed_y=speed_y * (-1);
  }
}

void reset() {
  fill(127);
  noStroke();
  rect(0, 0, width, height);
}