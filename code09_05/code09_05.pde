float y;
void setup () {
  size(500, 500);
  y=0;
}

void draw () {
  reset();
  fill(255);
  ellipse(250, y, 50, 50);
  y=y+5;//yを5ずつ増やし、円を下に動かす
}

void reset() {
  fill(127);
  noStroke();
  rect(0, 0, width, height);
}