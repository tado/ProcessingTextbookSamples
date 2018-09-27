void setup(){
 size( 300, 300, P3D );
 noStroke();
}

void draw(){
  lights();
  background( 0 );
  translate( width/2, height/2, -height );
  
  float rz = map( mouseY, 0, height, 0, PI );
  float ry = map( mouseX, 0, width, 0, HALF_PI );
  
  // マウスの座標によって回転
  rotateZ( rz );
  rotateY( ry );
  
  for( int y = -1; y <= 1; y++ ){
    for( int x = -1; x <= 1; x++ ){
      for( int z = -1; z <= 1; z++ ){
        pushMatrix();
        translate( 150*x, 150*y, -150*z );
        box( 30 );
        popMatrix();
      }
    }
  }
}