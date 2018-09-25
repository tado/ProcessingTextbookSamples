float y;
float speed_y;//縦方向の速度
void setup () {
  size(500, 500);
  y=0;
  speed_y=5;
}

void draw () {
  reset();
  fill(255);
  ellipse(250, y, 50, 50);
  y=y+speed_y;
  if (y>500) {//円がウィンドウの下端まで来たら
    speed_y=speed_y * (-1);//速度の+方向と-方向を入れ替える
  }
}

void reset() {
  fill(127);
  noStroke();
  rect(0, 0, width, height);
}