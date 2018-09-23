float centerX = 30.0;//ボール中心のx座標という状態を格納するグローバル変数
float dx = 10.0; //毎フレームのボール水平方向の移動量（水平速度）
float radius = 25.0; //ボールの半径
float diameter = radius * 2.0; //ボールの直径
void setup() {
  size(800, 600);
}
void draw() {
  background(128);//ウィンドウの描画領域全体（背景）を灰色でクリアする
  drawBall();
}
void drawBall() {
  ellipse(centerX, 70.0, diameter, diameter);
  centerX += dx;
}
void mousePressed() {//マウスボタンが押されるたびに一回呼び出される
  centerX = mouseX;//状態の変更。カーソル位置のx座標を円中心x座標とする
}