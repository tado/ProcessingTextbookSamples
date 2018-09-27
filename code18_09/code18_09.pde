//Kinect4種類の映像を同時に表示する

//open kinectライブラリを読み込む。
import org.openkinect.processing.*;

//kinect2のオブジェクトを定義する。
Kinect2 kinect2;

void setup() {
  size(1024, 848);
  //Kinectのオブジェクトを実体化する。
  kinect2 = new Kinect2(this);

  //Kinectの初期化をする。
  //RGBビデオ、赤外線、深度、Registered（RGBと赤外線を位置修正をしたデータ）、そして最後がKinectの初期化。
  kinect2.initVideo();
  kinect2.initIR();
  kinect2.initDepth();
  kinect2.initRegistered();
  kinect2.initDevice();
}

void draw() {
  //背景をリフレッシュ
  background(0);

  //PImageでKinectからの映像データを格納する。
  //VideoImageは一般的なカメラからのRGBデータ。
  //IrImageは赤外線プロジェクタ部と受光部からのデータ。
  //DepthImageは奥行きを表現したデータ。
  //RegisteredImageはRGBの赤外線の位置的なズレを補正したデータ。
  //PImage video = kinect2.getVideoImage();
  //PImage ir = kinect2.getIrImage();
  //PImage depth = kinect2.getDepthImage();
  //PImage regist = kinect2.getRegisteredImage();

  //image関数でそれぞれを表示する。
  //左上:映像 右上:赤外線 左下:深度 右下:Registerd
  //色(Color)座標系の解像度(1920*1080)
  //深度(Depth)座標系の解像度(512*424)
  //image(video, 0, 0, kinect2.colorWidth*512/1920, kinect2.colorHeight*512/1920);
  //image(ir, kinect2.depthWidth, 0);
  //image(depth, 0, kinect2.depthHeight);
  //image(regist, kinect2.depthWidth, kinect2.depthHeight);

  //PImageを経由しないでimage関数で直接表示する場合。
  image(kinect2.getVideoImage(), 0, 0, kinect2.colorWidth*512/1920, kinect2.colorHeight*512/1920);
  image(kinect2.getIrImage(), kinect2.depthWidth, 0);
  image(kinect2.getDepthImage(), 0, kinect2.depthHeight);
  image( kinect2.getRegisteredImage(), kinect2.depthWidth, kinect2.depthHeight);

  //フレームレートを表示
  text("Framerate: " + (int)(frameRate), 10, 10);
}