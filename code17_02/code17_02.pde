//oscP5、それとセットでnetP5ライブラリの読み込み
import oscP5.*;
import netP5.*;

//oscP5を受信用の変数OscP5として実体化。
OscP5 oscP5;
//送信元のパソコンのIPアドレス情報（myRemoteLocation）を送信用の変数NetAddressとして実体化。
NetAddress myRemoteLocation;

//初期化
void setup() {
  size(400, 400);
  frameRate(25);
  background(0);  
  //受信用の任意のポート12000番に入ってくるデータをチェックするOscP5を実体化して、変数oscP5に入れる。
  oscP5 = new OscP5(this, 12000);
  //送信用のIPアドレスとポート11000番を設定、実体化してからmyRemoteLocationに入れる。
  myRemoteLocation = new NetAddress("127.0.0.1", 11000);
}

//黒い画面を表示。
void draw() {
  //  background(0);
}

//表示画面をマウスでクリックすると"/test"と"123"を送る
void mousePressed() {
  //"/test"を編集myMessageに入れ、OSCのメッセージとして送る。
  OscMessage myMessage = new OscMessage("/test");
  //"/test"にマウスのX座標とY座標のデータを追加する。
  myMessage.add(mouseX);
  myMessage.add(mouseY);
  //myMessageに格納された値をmyRemoteLocationに格納されたIPアドレス、ポート番号に送る。
  oscP5.send(myMessage, myRemoteLocation); 
  //マウスのクリックしたところに白丸を描く。
  fill(255);
  ellipse(mouseX, mouseY, 10+random(30), 10+random(30));
}

//キーを何か押すと画面を黒くする。
void keyPressed() {
  background(0);
}

//入力されるOSCメッセージがoscEventメソッドに渡されて表示する。
void oscEvent(OscMessage theOscMessage) {
  //入力されたOscメッセージの送信元のアドレスとtypetag（データの種類）を表示する。
  print("### received an osc message.");
  print(" addrpattern: "+theOscMessage.addrPattern());
  println(" typetag: "+theOscMessage.typetag());
  //入力されたOSCメッセージを表示する。
  theOscMessage.print();
}
