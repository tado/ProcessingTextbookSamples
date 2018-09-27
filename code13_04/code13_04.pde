void setup(){
  size( 300, 300, P3D );
  noStroke();
}

void draw(){
  background( 0 );
  
  // デフォルトのライトを定義
  lights();
  
  translate( 0, height/2, -height/2 );
  fill( 153 );
  box( 50 );
  
  translate( width, 0, 0 );
  fill( 255 );
  sphere( 50 );
}