float R = 400;// ばねの長さ
float weightWidth = 100;// おもりの幅
float weightHeight = 100;// おもりの高さ

void setup() {
  size(500, 800);
  rectMode(CENTER);
  stroke(255);
  strokeWeight(5);
}

void draw() {
  background(0);
  drawSpring();
}

void drawSpring() {
  line(width/2, 0, width/2, R);// ばねを描く
  rect(width/2, R, weightWidth, weightHeight);// おもりを描く
}