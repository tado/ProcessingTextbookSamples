import oscP5.*;
import netP5.*;

OscP5 oscP5;
NetAddress myRemoteLocation;

//30個の配列の要素（x、y座標、移動の速度、その配列の円の大きさ）を変数で宣言する。
int  amount =30;
float[] x = new float[amount];
float[] y = new float[amount];
float[] speed = new float[amount];
float[] size = new float[amount];

//初期化
void setup() {
  size(400, 400);
  background(0);  
  frameRate(25);
  oscP5 = new OscP5(this, 12000);
  //OSCdefとSynthが動作するクライアント　ポート57120番に向けて送る。
  myRemoteLocation = new NetAddress("127.0.0.1", 57120);

  //30個の配列の円をランダムな位置と大きさで作る。
  int i = 0;
  while (i < amount) {
    x[i] = random(0, width);
    y[i] = random(0, height);
    speed[i] = random(1, 5);
    size[i] = random(3, 15);
    i = i + 1;
  }
}

//実行
//30個の円を上から下に違うスピードで移動させる。下まで行ったら再度上から。
void draw() {
  background(0);    

  int i = 0;
  while (i < amount) {
    ellipse(x[i], y[i], size[i], size[i]);
    y[i] = y[i] + speed[i];
    if (y[i] > 400) {
      //画面の一番下の400ピクセルを越えたらOSCメッセージを送る。
      //"/snowfall_SC"というSuperColliderで動作するOSCdefで定義しているSource IDの名前を送る。
      OscMessage myMessage = new OscMessage("/snowfall_SC");
      //続いて配列の数値を送る。
      myMessage.add(int(map(x[i], 0, width, 0, 11)));
      oscP5.send(myMessage, myRemoteLocation); 
      //メッセージを送った後にその配列のy座標を0にリセットする。
      y[i] = 0;
    }
    i = i +1;
  }
}
