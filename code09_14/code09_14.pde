float weightWidth = 100;
float weightHeight = 100;
int max = 600;
int min = 200;
boolean movable = false;
// ばねのシミュレーションのための定数
float K = 0.2; // ばね定数
float D = 0.92; // 減衰
float R = 400; // 自然長
// ばねの長さ関連の初期値
float y = R; // ばねの長さ＝自然長
float v = 0; // おもりの初期速度
float a = 0; // おもりの初期加速度
float f = 0; // ばねの復元力F．自然長時は釣り合っているため0

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
  if (movable) {
    y = mouseY;
    y = constrain(y, min, max);
  } else {
    // ばねの伸縮時の長さを求める
    f = -K * (y - R); // f=-K*l
    a = f; // 運動方程式F=ma．m を1 とする
    v = v + a; // 現在の速度 = 前の速度 + 加速度
    v = D * v;// 抵抗を表現するために速度を減衰させる
    y = y + v; // おもりの位置
  }
  line(width/2, 0, width/2, y);
  rect(width/2, y, weightWidth, weightHeight);
}

void mousePressed() {
  if (mouseX > width/2-weightWidth/2 && mouseX < width/2+weightWidth/2
    && mouseY > y-weightHeight/2 && mouseY < y+weightHeight/2) {
    movable = true;
  } else {
    movable = false;
  }
}

void mouseReleased() {
  movable = false;
}