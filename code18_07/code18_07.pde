//Processingで映像を扱うライブラリの読み込み
import processing.video.*;

//カメラ入力映像を扱うビデオデータ用の変数videoをCapture型として設定する
Capture video;
//画像データを格納する変数を設定する
PImage prev;

//レイヤーの面をPGraphics型の変数として設定する。
PGraphics pg;

//認識する動きの上限の変数を設定する
float threshold =10;

//動きのある範囲の中心座標を格納する変数を設定する
float motionX = 0;
float motionY = 0;
//中心座標の敏感な動きを抑えた座標を格納する変数を設定する
float lerpX = 0;
float lerpY = 0;
//１つ前のフレームのトラッキング円の座標を格納する変数を設定する
float preLerpX = 0;
float preLerpY = 0;


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
  //PImage変数prevを(640,340)のサイズの画像データ用のバッファとする。データの種類はRGB。
  //これがWebカメラから入力されるフレームのデータを入れるバッファになる。
  prev = createImage(640, 360, RGB);
  //PGraphics変数pg(640,340)のサイズの画像データ用のバッファとする。
  pg = createGraphics(640, 360);
}

//Webカメラから入力する際の処理。
void captureEvent(Capture video) {
  //videoの現在のフレームのデータをバッファprevにコピーする。
  prev.copy(video, 0, 0, video.width, video.height, 0, 0, prev.width, prev.height);
  //prevのpixelArrayのデータを表示する
  prev.updatePixels();
  //videoに入力される映像を読み出す。ここでvideoのデータはprevより１フレーム進む。
  video.read();
}

void draw() {
  //現在の入力フレームvideoのスナップショットをpixelArray（ピクセルの配列）に入れる。
  video.loadPixels();
  //1フレーム前のprevのスナップショットをpixelArray（ピクセルの配列）に入れる。
  prev.loadPixels();

  //Captureオブジェクトvideoのデータをimage関数で表示する。Webカメラ入力の表示
  image(video, 0, 0);
  //動きを検知する上限を設定する。この値と比較して表示する。
  threshold = 50;
  //動きに差のあるピクセルの座標の合計を格納する変数を設定し、1フレーム処理するごとにリセットする。
  float avgX = 0;
  float avgY = 0;
  //動きのある、マッチングしたピクセルのカウントをリセットする
  int count =0;

  //以下のfor文内の処理で描画された黒背景白輪郭のスナップショットをpixelArray（ピクセルの配列）に入れる。
  loadPixels();

  //画面内のすべてのx方向とy方向のピクセルを順番にチェックしていく
  for (int x = 0; x < video.width; x++ ) {
    for (int y = 0; y < video.height; y++ ) {
      //変数locに今チェックしているピクセルの見出し番号を格納する
      //すべてのピクセルは画面左上(0, 0)を起点として左端→右端(x++)、一段下がって(y++)、左→右(x++)がくりかえされる。
      //シリアルにピクセルが並ぶ帯状のpixelArrayとしてデータを扱う。
      //例えばsize（640, 480）の画面ではwidth=640(1〜640)であり、
      //(x, y) = (20, 2)のピクセルの見出し番号は、帯の中では(20+2*640)=1300番となる。
      int loc = x + y * video.width;
      // カラー変数currentColorを設定し、ビデオ映像内の特定のピクセル（video.pixels[loc]）の色データを格納する。
      color currentColor = video.pixels[loc];
      //チェックしているピクセルのR,G,Bの数値を変数r1, g1, b1に格納する
      float r1 = red(currentColor);
      float g1 = green(currentColor);
      float b1 = blue(currentColor);

      //prevに格納した1フレーム前の色のデータを変数r2, g2, b2に格納する
      color prevColor = prev.pixels[loc];
      float r2 = red(prevColor);
      float g2 = green(prevColor);
      float b2 = blue(prevColor);

      //dist()は座標間の「距離」を計算する関数。この場合は色データを座標に見立てて差を計算する。
      //チェックしているピクセルの色データと1フレーム前の色データの「距離」を合算して１つの数値としてdに格納する
      float d = dist(r1, g1, b1, r2, g2, b2); 

      //チェックしているピクセルの色の「距離」データを比較する。
      if (d > threshold) {
        //avgX, avgYにそれぞれ現在のx,yの値を加算する。
        avgX += x;
        avgY += y;
        //白く描画したピクセル（変化の大きかったピクセル）の数をカウントする。
        count++;
        //thresholdより上ならば白ピクセル、threshold以下だったら黒ピクセル。
        pixels[loc] = color(255);
      } else {
        pixels[loc] = color(0);
      }
    }
  }
  //格納した動きのある部分のpixelArray内の黒背景白輪郭のデータを画面に表示する。loadPixels();と対にして使う。
  //これを無効にすると、黒背景白輪郭の画面は表示されず、Webカメラ入力データが画面表示される。
  //updatePixels();

  //変化のあったピクセルが200以上あれば、
  if (count > 200) { 
    //１フレームの画面内の白ピクセルのx,y座標の合計を個数で除算して平均（動いている範囲の中心）を出す。
    motionX = avgX / count;
    motionY = avgY / count;
  }
  //敏感なトラッキングの円の動きを抑える。
  lerpX = lerp(lerpX, motionX, 0.1); 
  lerpY = lerp(lerpY, motionY, 0.1); 

  //トラッキングの円の描画。
  fill(255);
  strokeWeight(2.0);
  stroke(0);
  ellipse(lerpX, lerpY, 24, 24);

  //レイヤー画面pgの描画処理を開始する。
  pg.beginDraw();
  pg.stroke(255, 0, 0, 80);
  pg.strokeWeight(10.0);
  //1フレーム前の座標と現在の座標を結ぶline
  pg.line(preLerpX, preLerpY, lerpX, lerpY);//pg上に点を描画
  pg.endDraw();//描画の終了

  //レイヤーpgを画面表示する。
  image(pg, 0, 0);

  //現在の座標がpreLerpX, preLerpYに入れられ、次のフレームの処理で１つ前のフレームの座標となる。
  preLerpX = lerpX;
  preLerpY = lerpY;
}
