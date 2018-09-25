//ビデオライブラリのインポート
import processing.video.*;
//カメラの定義
Capture cam;

void setup() {
  //画面初期設定
  size(960, 540);
  frameRate(60);
  //カメラを初期化
  cam = new Capture(this);
  //キャプチャーの開始
  cam.start();
}

void draw() {
  //カメラの画像を描画
  image(cam, 0, 0, width, height);
}

//カメラのフレームが更新されたらイベント実行
void captureEvent(Capture c) {
  c.read();
}