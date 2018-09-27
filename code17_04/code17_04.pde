import oscP5.*;
import netP5.*;

OscP5 oscP5;
NetAddress myRemoteLocation;

void setup() {
  size(400, 400);
  frameRate(25);

  //Processing側が見ているポート番号は12000番に設定。
  oscP5 = new OscP5(this, 12000);

  //送信先のIPアドレスとポート57110番を設定する。SuperCollider側のポートは57110番が初期設定。
  myRemoteLocation = new NetAddress("127.0.0.1", 57110);
}

//黒い画面を表示。
void draw() {
  background(0);
}

//表示画面をマウスでクリックすると、"/s_new"の後に"test_osc_SC"、1000、1、0、"freq"、"任意の周波数のデータ"を送る。"test_osc_SC"はシンセサイザーの名前で、"freq"以下は引数である。
void mousePressed() {
  OscMessage myMessage = new OscMessage("/s_new"); //Synthノードにシンセサイザーを作る
  myMessage.add("test_osc_SC"); //SynthDef名
  myMessage.add(1000); //シンセサイザーのID（ノードID）
  myMessage.add(1); //アクションの種類
  myMessage.add(0); //ターゲットID

  myMessage.add("freq"); //引数
  myMessage.add(mouseY*3+440); //引数の値
  //myMessageに格納された値をmyRemoteLocationに格納されたIPアドレス、ポート番号に送る。
  oscP5.send(myMessage, myRemoteLocation);
}

//方向キーを押す。
void keyPressed() {
  if (key == CODED) {

    //UPキー：ノードID 1000の削除で音を止める。
    //DOWNキー：全ノードクリア（Cmd+.と同じ）
    //RIGHTキー：ハイハットの音をノードID 1000で鳴らす。
    //LEFTキー：アラーム音をノードID 1000で鳴らす。
    if (keyCode == UP) {
      OscMessage myMessage = new OscMessage("/n_free"); //特定のノードを削除する。
      myMessage.add(1000);
      oscP5.send(myMessage, myRemoteLocation);
    }
    if (keyCode == DOWN) {
      OscMessage myMessage = new OscMessage("/g_freeAll"); //すべてのノードを削除する。
      myMessage.add(0);
      oscP5.send(myMessage, myRemoteLocation);
    }
    if (keyCode == RIGHT) {
      OscMessage myMessage = new OscMessage("/s_new");
      myMessage.add("SC_hat");
      myMessage.add(1001);
      oscP5.send(myMessage, myRemoteLocation);
    }
    if (keyCode == LEFT) {
      OscMessage myMessage = new OscMessage("/s_new");
      myMessage.add("SC_alarm");
      myMessage.add(1002);
      myMessage.add(1); 
      myMessage.add(0); 

      myMessage.add("freq");
      myMessage.add(random(300, 1000)); //300〜1000Hzの範囲でランダムに数値を送る。
      oscP5.send(myMessage, myRemoteLocation);
    }
  }
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
