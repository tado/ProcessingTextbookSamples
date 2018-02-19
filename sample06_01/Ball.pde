float centerX = 30.0; 
float centerY = 70.0;
float radius = 25.0;
float diameter = radius * 2.0;
float dx = 10.0; //１フレームあたりの変位量（速度の水平成分）
float dy = 0.0; //１フレームあたりの変位量（速度の垂直成分）

void drawBall() {
  fill(70);
  ellipse(centerX, centerY, diameter, diameter);
  drawBallHighlight();
}
void drawBallHighlight() {
  fill(255);
  float highlightCenterX = centerX;
  float highlightCenterY = centerY - radius / 1.4;
  float highlightXSize = radius / 2.5;
  float highlightYSize = highlightXSize / 1.3;
  ellipse(highlightCenterX, highlightCenterY, highlightXSize, highlightYSize);
}
void moveBall() {
  centerX += dx; //円の中心を右に移動する
  centerY += dy; //円の中心を下に移動する
}
void checkHitWalls() {
  float left = radius; //左の壁に当たった時の中心位置x座標
  float right = width - radius; //右の壁に当たった時の中心位置x座標
  if (centerX < left) { //左の壁に当たったら
    centerX = left;
    dx = -dx;
  } else if (right < centerX) { //右の壁に当たったら
    centerX = right;
    dx = -dx;
  }
}
void bounceBall() {
  float centerYFloor  = height - radius; //ボールが床に乗るときの中心y座標
  if (centerY < centerYFloor) return; //ボールが床より上なら何もしない
  centerY = centerYFloor;
  dy = -dy;
  applyFriction(); //実際に弾む場合のみ摩擦力を適用する
}
void applyFriction() {
  float frictionX = 0.2; //摩擦力により水平方向速度を減速させる量
  if (abs(dx) < frictionX) dx = 0.0; //水平速度が十分小さければ止めてしまう
  else if (dx < 0.0) dx += frictionX; //左向きの場合は右向きに減速
  else dx -= frictionX; //右向きの場合は左向きに減速
}
void accelerateBall() {
  float gravity = 10.0; //１フレームあたりの重力加速度に相当する画素数
  dy += gravity; //下向きに加速する
}