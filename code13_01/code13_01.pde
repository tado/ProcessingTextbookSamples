void setup(){
  size( 300, 300, P3D );  // 3Dモード
}

void draw(){
  background( 204 );
  translate( width/2, height/2, 0 );  // 原点を画面中心に移動
  rect( -50, -50, 100, 100 );    // 画面の中心に四角形を描画
}