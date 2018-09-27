//Processingで映像を扱うライブラリの読み込み
import processing.video.*;

//カメラ入力映像を扱うビデオデータ用の変数videoをCapture型として設定する
Capture video;

void setup() {
  size(640, 480);
  //Captureオブジェクトを作り、キャプチャデータを変数videoに読み込む
  video = new Capture(this, width, height);
  //videoを開始
  video.start();
}

void draw() {
  //カメラからの映像入力のフレームが更新されればvideoのデータを読み出す
  if (video.available() == true) {
    video.read();
  }
  //Captureオブジェクトvideoのデータをimage関数で表示する
  image(video, 0, 0, width, height);
}