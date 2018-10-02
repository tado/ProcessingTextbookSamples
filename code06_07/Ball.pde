class Ball {
  private float centerX = 30.0; 
  private float centerY = 70.0;
  private float dx = 10.0; //１フレームあたりの変位量（速度の水平成分）
  private float dy = 0.0; //１フレームあたりの変位量（速度の垂直成分）
  float radius = 25.0;
  float diameter = radius * 2.0;

  void update() {
    move(); //ボールを移動する
    checkBounceFloor(); //ボールを検査し床バウンド処理を行う
    checkHitWalls(); //ボールを検査し壁打ち処理を行う
    accelerate(); //ボールを加速する
  }
  void draw() {
    fill(70);
    ellipse(centerX, centerY, diameter, diameter);
    drawHighlight();
  }
  void drawHighlight() {
    fill(255);
    float highlightCenterX = centerX;
    float highlightCenterY = centerY - radius / 1.4;
    float highlightXSize = radius / 2.5;
    float highlightYSize = highlightXSize / 1.3;
    ellipse(highlightCenterX, highlightCenterY, 
      highlightXSize, highlightYSize);
  }
  void move() {
    centerX += dx; //円の中心を右に移動する
    centerY += dy; //円の中心を下に移動する
  }
  void checkBounceFloor() {
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
  void accelerate() {
    float gravity = 10.0; //１フレームあたりの重力加速度に相当する画素数
    dy += gravity; //下向きに加速する
  }
  void setCenter(float x, float y) {
    centerX = x;
    centerY = y;
  }
  void setVelocity(float x, float y) {
    dx = x;
    dy = y;
  }
  void changeSize(int k) {
    float s = 1.2;
    if (k == 'l') radius *= s;
    else if (k == 's') radius /= s;
    radius = min(max(1.0, radius), 200.0);
    diameter = radius * 2;
    println("直径：" + diameter);
  }
}
