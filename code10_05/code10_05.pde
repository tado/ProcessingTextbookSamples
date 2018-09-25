void setup() {
  size(640, 480);
  frameRate(60);
  background(0);
}

void draw() {
  //画面を黒にフェードしていく
  fill(0, 10);
  rect(0, 0, width, height);
}

void keyPressed() {
  //入力したキーをランダムな場所に表示
  fill(255);
  textSize(random(32, 64));
  text(key, random(width), random(height));
}