float rx = 0.0;  // x軸回りの回転角度
float ry = 0.0;  // y軸回りの回転角度
float rz = 0.0;  // z軸回りの回転角度

void setup(){
  size( 300, 300, P3D );  // 3Dモード
}

void draw(){
  // 画面をリフレッシュ
  background( 204 );
  
  // 原点を画面中心に移動
  translate( width/2, height/2, 0 );
  
  // 回転
  rotateX( rx );  // x軸回り
  rotateY( ry );  // y軸回り
  rotateZ( rz );  // z軸回り
  
   // 画面の中心に四角形を描画
  rect( -50, -50, 100, 100 );
}

void keyPressed(){
  switch( keyCode ){
    case UP:
      rx = rx - 0.1;  // x軸回りの回転角度（時計回り）
    
    case DOWN:
      rx = rx + 0.1;  // x軸回りの回転角度（反時計回り）
    
    case LEFT:
      ry = ry - 0.1;  // y軸回りの回転角度（時計回り）
      
    case RIGHT:
      ry = ry + 0.1;  // y軸回りの回転角度（反時計回り）
    
    break;
  }
}

void mouseDragged(){
  rz = mouseX * 0.01;  // z軸回りの回転角度
}