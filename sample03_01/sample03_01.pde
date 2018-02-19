float x = 30.0; //変数xの宣言と値の初期化-(1)

void setup() {
  size(800, 600);
}

void draw() {
  drawCircle();
}

void drawCircle() {
  ellipse(x, 70.0, 50.0, 50.0); //変数xの値の利用。半径25の円を描く。-(2)
  x += 60.0; //変数xの値の増加-(3)
}