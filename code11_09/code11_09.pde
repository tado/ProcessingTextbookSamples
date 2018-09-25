//ビデオライブラリーのインポート
import processing.video.*;
//ムービープレイヤーの宣言
Movie movie;

void setup() {
  //画面初期設定
  size(853, 480);
  frameRate(60);
  //再生するムービーを読み込み (読み込んだファイル名に変更)
  movie = new Movie(this, "movie.mov");
  //ループ再生開始
  movie.loop();
}

void draw() {
  //ムービーを画面に描画
  image(movie, 0, 0, width, height);
}

//ムービーのフレームが更新されたらイベント実行
void movieEvent(Movie m) {
  //現在のフレームを読み込み
  m.read();
}