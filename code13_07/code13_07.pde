void setup(){
  size( 300, 300, P3D );
  fill( 204 );
  strokeWeight( 2 );
}

void draw(){
  lights();
  background( 0 );
  
  camera( 0.0, mouseY*2, 120.0,
           0.0, 0.0, 0.0,
           0.0, 1.0, 0.0 );
  noStroke();
  box( 60 );
  stroke( 255 );
  line( -80, 0, 0, 80, 0, 0 );
  line( 0, -80, 0, 0, 80, 0 );
  line( 0, 0, -80, 0, 0, 80 );
}