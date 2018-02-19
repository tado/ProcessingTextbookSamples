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
void accelerateBall() {
  float gravity = 10.0; //１フレームあたりの重力加速度に相当する画素数
  dy += gravity; //下向きに加速する
}
void bounceBall() {
  float centerYLowest = height - radius; //ボールが床に接しているとき・・・
  //のボール中心のy座標
  if (centerY < centerYLowest) return; //床より上に浮いていれば何もしない
  centerY = centerYLowest; //中心高さを調整しボールが床に接するようにする
  dy = -dy; //速度を下向き（正のdy）から上向き（負のdy）に変更する
}
void drawBall() { //MVCのViewの処理
  ellipse(centerX, centerY, diameter, diameter);
}

void mouseDragged() { 
  centerX = pmouseX; //ボールの位置は一つ前のフレームのカーソル位置・・・
  centerY = pmouseY; //とする
  dx = mouseX - pmouseX; //ボールの速度は、一つ前から現在のフレームまで・・・
  dy = mouseY - pmouseY; //のカーソル移動量とする
}