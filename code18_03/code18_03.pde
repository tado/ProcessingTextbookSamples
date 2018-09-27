//Processingで映像を扱うライブラリの読み込み
import processing.video.*;

//カメラ入力映像を扱うビデオデータ用の変数videoをCapture型として設定する
Capture video;
//色のデータを格納するカラー変数を設定する
color trackColor; 
//認識する色の上限の変数を設定する
float threshold ;

void setup() {
  size(640, 360);
  //接続したWebカメラの「名前」、「解像度サイズ」「fps」のリストを配列camerasに文字列として格納する
  String[] cameras = Capture.list();
  //配列camerasの中の文字列をコンソールに表示する
  printArray(cameras);  
  //Captureオブジェクトを作り、リスト３番目のフォーマットでキャプチャデータをvideoに読み込む
  video = new Capture(this, cameras[3]);
  //videoを開始
  video.start();
  //トラッキング（追跡する）対象の色としてRGBの赤を初期設定にする
  trackColor = color(255, 0, 0);
}

//videoに入力される映像を読み出す。
void captureEvent(Capture video) {
  video.read();
}

void draw() {
  //画面のスナップショットをpixelArray（ピクセルの配列）に入れる
  video.loadPixels();
  //Captureオブジェクトvideoのデータをimage関数で表示する
  image(video, 0, 0);
  //認識する色の範囲の上限を設定する。この値が小さければトラッキング色とより差の少ない色のピクセルのみがトラッキングの対象となる。
  //周囲の明るさなどの環境によって設定を調整する。
  threshold = 5;
  //トラッキングする色のピクセル群の平均の座標（中心）を格納する変数を設定し、リセットする。
  float avgX = 0;
  float avgY = 0;
  //トラッキングの色とマッチングしたピクセルのカウントをリセットする
  int count =0;

  //画面内のすべてのx方向とy方向のピクセルを順番にチェックしていく
  for (int x = 0; x < video.width; x++ ) {
    for (int y = 0; y < video.height; y++ ) {
      //変数locに今チェックしているピクセルの見出し番号を格納する
      //すべてのピクセルは画面左上(0, 0)を起点として左端→右端(x++)、一段下がって(y++)、左→右(x++)がくりかえされる。
      //シリアルにピクセルデータが並ぶ帯状のpixelArrayとしてデータを扱う。
      //例えばsize（640, 480）の画面ではwidth=640(1〜640)であり、
      //(x, y) = (20, 2)のピクセルの見出し番号は、帯の中では(20+2*640)=1300番となる。
      int loc = x + y * video.width;
      // カラー変数currentColorを設定し、ビデオ映像内の特定のピクセル（video.pixels[loc]）の色データを格納する。
      color currentColor = video.pixels[loc];
      //チェックしているピクセルのR,G,Bの数値を変数r1, g1, b1に格納する
      float r1 = red(currentColor);
      float g1 = green(currentColor);
      float b1 = blue(currentColor);
      //トラッキングする色のデータ（255, 0, 0）を変数r2, g2, b2に格納する
      float r2 = red(trackColor);
      float g2 = green(trackColor);
      float b2 = blue(trackColor);

      //distS()は座標間の「距離」を計算する関数。この場合は色データを座標に見立てて差を計算する。
      //チェックしているピクセルの色データとトラッキングする色データの「距離」合算して１つの数値としてdに格納する
      float d = dist(r1, g1, b1, r2, g2, b2); 
      //チェックしているピクセルの色の「距離」データがthresholdよりも小さければ、そこに白ピクセルを描く。
      if (d < threshold) {
        stroke(255);
        strokeWeight(1);
        point(x, y);
        //avgX, avgYにそれぞれ
        avgX += x;
        avgY += y;
        //白く描画したピクセルの数をカウントする。
        count++;
      }
    }
  }


  if (count > 0) { 
    //１フレームの画面内の白ピクセルのx,y座標を個数で除算して平均を出す。
    //それをavgX,avgYに入れてトラッキングする円の座標として使う。
    avgX = avgX / count;
    avgY = avgY / count;
    //円の描画。
    fill(255);
    strokeWeight(2.0);
    stroke(0);
    ellipse(avgX, avgY, 24, 24);
  }
}

void mousePressed() {
  //マウスをクリックしたらその位置のピクセルの色データをトラッキングするtrackColorとして登録する。
  int loc = mouseX + mouseY*video.width;
  trackColor = video.pixels[loc];
}
