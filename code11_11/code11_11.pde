//ビデオライブラリーのインポート
import processing.video.*;
//ムービープレイヤーの宣言
Movie movie;
//今ムービーを再生しているか否か
boolean playing;

void setup() {
  //画面初期設定
  size(853, 480);
  frameRate(60);
  noStroke();
  //再生するムービーを読み込み (読み込んだファイル名に変更)
  movie = new Movie(this, "movie.mov");
  //ループ再生をONに
  movie.loop();
  //ムービーを再生状態をTrueに
  playing = true;
  background(0);
}

void draw() {
  //設定した間隔で画面をスキャン
  for (int i = 0; i < 100; i++) {
    int x = int(random(width));
    int y = int(random(height));
    color col = movie.get(x, y);
    float diameter = map(saturation(col), 0, 255, 4, 40);
    fill(col, 127);
    ellipse(x, y, diameter, diameter);
  }
}

//ムービーのフレームが更新されたらイベント実行
void movieEvent(Movie m) {
  //現在のフレームを読み込み
  movie.read();
}