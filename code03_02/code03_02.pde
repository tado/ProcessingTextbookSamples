void setup() {
  size(800, 600);
}

void draw() {
  drawCircle();
}

void drawCircle() {
  float x = 30.0; //変数xの宣言と値の初期化---(1)
  ellipse(x, 70.0, 50.0, 50.0); //変数xの値の利用---(2)
  x += 60.0; //変数xの値の増加 （実はこの位置で値を設定しても無意味）---(3)
}