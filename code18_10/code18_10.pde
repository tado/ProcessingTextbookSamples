//Kinectの検知範囲の平均座標をトラッキング　
//深度段階の表示はなし

//open kinectライブラリを読み込む。
import org.openkinect.processing.*;

//kinect2のオブジェクトを定義する。
Kinect2 kinect2;

//検知する範囲の変数　最小値と最大値。
float minThreshold = 480;
float maxThreshold = 550;
//画像データを読み込むPImage型の変数を設定する。
PImage img;
color trackColor; 

void setup() {
  //深度(Depth)座標系の解像度(512*424)に合わせて表示画面を設定。
  size(512, 424);
  //Kinectのオブジェクトを実体化する。
  kinect2 = new Kinect2(this);

  //Kinectの初期化をする。深度データの取り込みを設定する。
  kinect2.initDepth();
  kinect2.initDevice();
  //深度データの幅と高さサイズ分のPImage型変数imgを設定。
  img = createImage(kinect2.depthWidth, kinect2.depthHeight, RGB);
  //トラッキングする範囲の色は緑に設定する
  trackColor = color(0, 255, 0);
}

void draw() {
  //背景をリフレッシュ
  background(0);
  //現在の表示画面のピクセル情報をimgに呼び出す。
  img.loadPixels();

  //PImageでKinectからの映像データを格納する。
  //DepthImageは深度を表現したデータ。
  PImage depth = kinect2.getDepthImage();

  //Kinectの未加工の深度データ（rawデータ）を配列rawDepthに格納する。
  int[] rawDepth = kinect2.getRawDepth();

  //変数を設定。
  float totalX = 0;
  float totalY = 0;
  float count =0;
  float avgX =0;
  float avgY =0;

  //for文で縦横すべてのピクセルを順番に検証する
  for (int x = 0; x < depth.width; x++ ) {
    for (int y = 0; y < depth.height; y++ ) {

      //その配列の番号をlocに入れる。
      int loc = x + y * depth.width;
      //チェックしている配列のデータをcurrentDepthに入れる。
      int currentDepth = rawDepth[loc];
      //もし、そのピクセルが検知範囲内だったら緑に塗る。
      if (currentDepth > minThreshold && currentDepth < maxThreshold) {
        img.pixels[loc] = color(0, 255, 0);
        //塗ったピクセルのx,y座標の合計を積み上げる。
        totalX += x ;
        totalY += y;
        //塗ったピクセル数を数えていく。
        count ++;
      } else {
        //検知範囲外のピクセルだったら黒く塗る
        img.pixels[loc] = color(0, 0, 0);
        //検知範囲外のピクセルだったら元の色（深度データの色）にしておく
        //img.pixels[loc] = depth.pixels[loc];
      }
    }
  }

  //全ピクセルの検証と色塗りが終わったデータをimgにアップデートする。
  img.updatePixels();
  //imgを表示する。
  image(img, 0, 0);

  //色を塗った全ピクセルの座標の平均を算出する。
  avgX= totalX/count;
  avgY= totalY/count;

  //その平均の座標に白い円を描く。
  fill(255);
  ellipse(avgX, avgY, 32, 32);

  //フレームレートを表示
  text("Framerate: " + (int)(frameRate), 10, 10);
}