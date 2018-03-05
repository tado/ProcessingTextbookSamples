//ビデオライブラリーのインポート
import processing.video.*;
//カメラの定義
Capture cam;
//読み込みスキップの大きさ
int skip;

void setup() {
  //画面初期設定
  size(960, 540, P3D);
  frameRate(60);
  rectMode(CENTER);
  noStroke();
  //カメラを初期化
  cam = new Capture(this);
  //スキップの大きさ初期化
  skip = 4;
  //キャプチャーの開始
  cam.start();
}

void draw() {
  background(0);
  //画面全体をスキャン
  for (int j = 0; j < height; j+=skip) {
    for (int i = 0; i < width; i+=skip) {
      pushMatrix();
      //色を取得
      color col = cam.get(i, j);
      //色の明るさでZ軸上の位置を変更
      float z = map(brightness(col), 0, 255, 0, 300);
      translate(i, j, z);
      //取得した色で四角形を描く
      fill(col);
      rect(0, 0, skip, skip);
      popMatrix();
    }
  }
}

//カメラのフレームが更新されたらイベント実行
void captureEvent(Capture c) {
  //フレーム読み込み
  cam.read();
}
