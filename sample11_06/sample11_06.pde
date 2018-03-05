//リストの長さの最大値
int LENGTH = 200;
//マウスの位置を記録するためのリスト
ArrayList<PVector> mouseLocs = new ArrayList<PVector>();

void setup() {
  size(640, 480);
  frameRate(60);
  background(0);
  rectMode(CENTER);
  //リストを初期化
  for (int i = 0; i < LENGTH; i++) {
    //画面の中心に配置
    PVector loc = new PVector(width/2, height/2);
    mouseLocs.add(loc);
  }
}

void draw() {
  //画面基本設定
  background(0);
  noFill();
  stroke(255);
  //現在のマウスの位置をリストに追加
  PVector loc = new PVector(mouseX, mouseY);
  mouseLocs.add(loc);
  //一定間隔でリストに記録したマウスの位置を取り出して描画
  for (int i = 0; i < mouseLocs.size(); i+=10) {
    if(mousePressed){
      //もしマウスボタンが押されていたら四角形を描く
      rect(mouseLocs.get(i).x, mouseLocs.get(i).y, i, i);
    } else {
      //そうでなければ、円を描く
      ellipse(mouseLocs.get(i).x, mouseLocs.get(i).y, i, i);
    }
  }
  //リストの長さが最大値を越えたら、先頭の要素を削除
  if (mouseLocs.size() > LENGTH) {
    mouseLocs.remove(0);
  }
}
