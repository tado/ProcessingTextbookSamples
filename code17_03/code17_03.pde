import oscP5.*;
import netP5.*;

//oscP5を受信用の変数OscP5として実体化。
OscP5 oscP5;
//送信元のパソコンのIPアドレス情報（myRemoteLocation）を送信用の変数NetAddressとして実体化。
NetAddress myRemoteLocation;

//RGBの数値を入れる変数
float r, g, b=0;

void setup() {
  size(400, 400);
  frameRate(25);
  colorMode(RGB, 256);
  //受信用の任意のポート12000番に入ってくるデータをチェックするOscP5を実体化して、変数oscP5に入れる。
  oscP5 = new OscP5(this, 12000);
}

//背景色が変化する。
void draw() {
  background(r, g, b);
}

//入力されるOSCメッセージがoscEventメソッドに渡されて表示する。
void oscEvent(OscMessage theOscMessage) {
  float valueR = theOscMessage.get(0).floatValue();
  float valueG = theOscMessage.get(1).floatValue();
  float valueB = theOscMessage.get(2).floatValue();
  //OSCメッセージのリストの0、1、2番目の要素がvalue*に入り、変数r、g、bに入る。
  r=valueR;
  g=valueG;
  b=valueB;
  //入力されたOscメッセージの送信元のアドレスとtypetag（データの種類）、RGBの各数値を表示する。
  print("### received an osc message.");
  print(" addrpattern: "+theOscMessage.addrPattern());
  println(" typetag: "+theOscMessage.typetag());
  println("R:"+r);
  println("G:"+g);
  println("B:"+b);
  //入力されたOSCメッセージを表示する。
  theOscMessage.print();
}
