float centerX = 30.0; 
float centerY = 70.0;
float dx = 10.0; //毎フレームのボール水平方向の移動量（水平速度）
float dy = 0.0; //毎フレームのボール垂直方向の移動量（垂直速度）
float radius = 25.0; //ボールの半径
float diameter = radius * 2.0; //ボールの直径
void setup() {
  size(800, 600);
}
void draw() {
  background(128); 
  update();//状態変更（更新）をまとめて呼び出す
  drawBall();
}
void update() { //MVCのModelの処理
  moveBall(); //円を移動する
  bounceBall(); //円を床で弾ませる
  accelerateBall(); //円を加速する
}
void moveBall() {
  centerX += dx; //円の中心を右に移動する
  centerY += dy; //円の中心を下に移動する
}
void bounceBall() { //未実装
}
void accelerateBall() { //未実装
}
void drawBall() { //MVCのViewの処理
  ellipse(centerX, centerY, diameter, diameter);
}
void mousePressed() { //MVCのControllerの処理
  centerX = mouseX;
  centerY = mouseY;
}