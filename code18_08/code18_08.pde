//Kinectでの基本の表示
//open kinectライブラリを読み込む。
import org.openkinect.processing.*;

//kinect2のオブジェクトを定義する。
Kinect2 kinect2;

//Kinectのデータを受け取る準備
void setup() {
  size(1024, 848);
  kinect2 = new Kinect2(this);
  kinect2.initVideo();
  kinect2.initIR();
  kinect2.initDepth();
  kinect2.initRegistered();
  kinect2.initDevice();
}

void draw() {
  //背景をリフレッシュ
  background(0);
  //PImageでKinectの取得するデータを実体化する
  PImage video = kinect2.getVideoImage();
  //PImage ir = kinect2.getIrImage();
  //PImage depth = kinect2.getDepthImage();
  //PImage regist = kinect2.getRegisteredImage();

  //image関数でそれぞれを表示する。
  image(video, 0, 0);
  //image(ir, 0, 0);
  //image(depth, 0, 0);
  //image(regist, 0, 0);

  //PImageを経由しないでimage関数で直接表示する場合。
  //image(kinect2.getVideoImage(), 0, 0);
  //image(kinect2.getIrImage(), 0, 0);
  //image(kinect2.getDepthImage(), 0, 0);
  //image( kinect2.getRegisteredImage(), 0, 0);

  //フレームレートを表示
  text("Framerate: " + (int)(frameRate), 10, 515);
}