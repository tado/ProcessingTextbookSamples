float rx = 0.0;  // x軸まわりの回転角度
float ry = 0.0;  // y軸まわりの回転角度
float rz = 0.0;  // z軸まわりの回転角度

void setup() {
  size(320, 240, P3D);  // 3Dモード
  noStroke();           // 枠線は描画しない
}

void draw() {
  // 画面をリフレッシュ
  background(31);
  
  // デフォルトのライトを点灯
  lights();

  // 画面の中心に原点を移動
  translate(width/2, height/2, -50);
  rotateX(rx);  // x軸まわりの回転
  rotateY(ry);  // y軸まわりの回転
  rotateZ(rz);  // z軸まわりの回転
  scale(50);    // 50倍に拡大
  
  // 立方体を描画
  makeCube();
}

void makeCube() {
  beginShape(QUADS);
    // 前面
    vertex(-1, -1, 1);  // ①
    vertex(-1, 1, 1);   // ②
    vertex(1, 1, 1);    // ③
    vertex(1, -1, 1);   // ④
    
    // 後面
    vertex(1, -1, -1);  // ⑧
    vertex(1, 1, -1);   // ⑦
    vertex(-1, 1, -1);  // ⑥
    vertex(-1, -1, -1); // ⑤
    
    // 上面
    vertex(-1, -1, 1);  // ①
    vertex(1, -1, 1);   // ④
    vertex(1, -1, -1);  // ⑧
    vertex(-1, -1, -1); // ⑤

    // 底面
    vertex(-1, 1, 1);   // ②
    vertex(-1, 1, -1);  // ⑥
    vertex(1, 1, -1);   // ⑦
    vertex(1, 1, 1);    // ③

    // 左面
    vertex(-1, -1, -1); // ⑤
    vertex(-1, 1, -1);  // ⑥
    vertex(-1, 1, 1);   // ②
    vertex(-1, -1, 1);  // ①

    // 右面
    vertex(1, -1, 1);   // ④
    vertex(1, 1, 1);    // ③
    vertex(1, 1, -1);   // ⑦
    vertex(1, -1, -1);  // ⑧
  endShape();
}

void keyPressed() {
  if (keyCode == UP)         { rx = rx - 0.1; }
  else if (keyCode == DOWN)  { rx = rx + 0.1; }
  else if (keyCode == LEFT)  { ry = ry - 0.1; }
  else if (keyCode == RIGHT) { ry = ry + 0.1; }
}

void mouseDragged() {
  rz = mouseX * 0.01;
}
