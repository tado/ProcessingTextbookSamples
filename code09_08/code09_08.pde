float x, y;

void setup () {
  size(500, 500);
  x = width/2; //初期座標x
  y=0; //初期座標y
}

void draw () {
  overlay();
  fill(255);
  x=x+random(-1, 1);
  y=y+random(1, 3);
  ellipse(x, y, 5, 5);
}

void overlay() {
  fill(127, 30);
  noStroke();
  rect(0, 0, width, height);
}
