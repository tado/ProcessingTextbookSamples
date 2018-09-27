//Processingで映像を扱うライブラリの読み込み
import processing.video.*;

//カメラ入力映像を扱うビデオデータ用の変数videoをCapture型として設定する
Capture video;

void setup() {
  size(640, 480);
  //接続したWebカメラの「名前」、「解像度サイズ」「fps」のリストを配列camerasに文字列として格納する
  String[] cameras = Capture.list();
  //配列camerasの中の文字列をコンソールに表示する
  printArray(cameras);  
  //Captureオブジェクトを作り、リスト３番目のフォーマットでキャプチャデータをvideoに読み込む
  video = new Capture(this, cameras[3]);
  //videoを開始
  video.start();
}

//videoに入力される映像を読み出す。
void captureEvent(Capture video) {
  video.read();
}

void draw() {
  //Captureオブジェクトvideoのデータをimage関数で表示する
  image(video, 0, 0, width, height);
}
