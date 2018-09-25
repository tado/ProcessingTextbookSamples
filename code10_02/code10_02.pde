void setup() {
  //画面の基本設定
  size(640, 480);
  frameRate(60);
}

void draw() {
  background(0);
  noFill();
  //前のフレームと現在のマウスの移動距離
  float length = dist(mouseX, mouseY, pmouseX, pmouseY);
  //移動距離を線の太さを設定
  strokeWeight(length + 1);
  //移動距離で色を設定
  stroke(length*4.0, 0, 255-length*4.0);
  //前のフレームのマウスの位置と現在の位置の間を直線で結ぶ
  line(mouseX, mouseY, pmouseX, pmouseY);
}
