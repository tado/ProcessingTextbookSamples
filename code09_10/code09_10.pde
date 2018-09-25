float x, y;

void setup () {
  size(500, 500);
  x=0;
}

void draw () {
  overlay();
  fill(255);
  ellipse(x, y+height/2, 50, 50);//円の高さをウィンドウ中央に補正
  x++;
  y=100*sin(radians(x));//y=100sin(x)
}

void overlay() {
  fill(126, 5);
  noStroke();
  rect(0, 0, width, height);
}