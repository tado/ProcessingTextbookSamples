void setup(){
  size( 300, 300, P3D );  // 3Dモード
}

void draw(){
  background( 0 );
  translate( 0, height/2, -height/4 );  // 原点を移動
  fill( 128 );
  box( 60, 80, 60 );
  
  translate( width, 0, -height/2 );    // 原点をさらに移動
  fill( 255 );
  box( 60, 80, 60 );    // 描画するボックスの大きさは上記と同じ
}