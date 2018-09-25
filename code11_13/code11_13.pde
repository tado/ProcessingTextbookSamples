//ビデオライブラリーのインポート
import processing.video.*;
//カメラの定義
Capture cam;
//スキャンしている場所(高さ)
float scanHeight;
//スキャンの移動スピード
float scanSpeed;

void setup() {
  //画面初期設定
  size(960, 540);
  frameRate(60);
  //カメラを初期化
  cam = new Capture(this);
  //キャプチャーの開始
  cam.start();
  //スキャン位置とスピードの初期化
  scanHeight = 0.0;
  scanSpeed = 2.0;
  background(0);
}

void draw() {
  //指定した高さの横1行だけスキャン
  for (int i = 0; i < width; i++) {
    //指定した座標の色を読み込み
    color col = cam.get(i, int(scanHeight));
    //塗りの色を設定
    fill(col);
    //四角形で色を塗る
    rect(i, scanHeight, 1, scanSpeed);
  }
  //もしスキャンする場所が下端まできたら0にリセット
  if (scanHeight > height) {
    scanHeight = 0;
  }
}

//カメラのフレームが更新されたらイベント実行
void captureEvent(Capture c) {
  //フレーム読み込み
  cam.read();
  //指定した速さでスキャンの高さを移動
  scanHeight += scanSpeed;
}