float rx = 0.0;      // x軸まわりの回転角度
float ry = 0.0;      // y軸まわりの回転角度
float rz = 0.0;      // z軸まわりの回転角度
boolean flg = true;  // 透視投影・オン

void setup() {
  size(320, 240, P3D);  // 3Dモード
  noStroke();           // 枠線は描画しない
}

void draw() {
  // 画面をリフレッシュ
  background(204);

  // 透視投影
  if (flg == true) {
    float aspect = float(width) / float(height);
    perspective(radians(60), aspect, 100, -100);
    translate(width/2, height/2, -50);
  }
  // 平行投影
  else {
    ortho(-width/2, width/2, -height/2, height/2);
    translate(width/2, height/2,0);
  }
  
  // 回転
  rotateX(rx);  // x軸まわり
  rotateY(ry);  // y軸まわり
  rotateZ(rz);  // z軸まわり
  scale(50);    // 50倍に拡大
  
  // 立方体を描画
  makeCube();
}

void makeCube() {
  beginShape(QUADS);
    // 前面
    fill(255, 0, 0);    // 赤
    vertex(-1, -1, 1);  // ①
    vertex(-1, 1, 1);   // ②
    vertex(1, 1, 1);    // ③
    vertex(1, -1, 1);   // ④
    
    // 後面
    fill(0, 255, 0);    // 緑
    vertex(1, -1, -1);  // ⑧
    vertex(1, 1, -1);   // ⑦
    vertex(-1, 1, -1);  // ⑥
    vertex(-1, -1, -1); // ⑤
    
    // 上面
    fill(0, 0, 255);    // 青
    vertex(-1, -1, 1);  // ①
    vertex(1, -1, 1);   // ④
    vertex(1, -1, -1);  // ⑧
    vertex(-1, -1, -1); // ⑤

    // 底面
    fill(255, 255, 0);  // 黄
    vertex(-1, 1, 1);   // ②
    vertex(-1, 1, -1);  // ⑥
    vertex(1, 1, -1);   // ⑦
    vertex(1, 1, 1);    // ③

    // 左面
    fill(255, 0, 255);  // マゼンタ
    vertex(-1, -1, -1); // ⑤
    vertex(-1, 1, -1);  // ⑥
    vertex(-1, 1, 1);   // ②
    vertex(-1, -1, 1);  // ①

    // 右面
    fill(0, 255, 255);  // シアン
    vertex(1, -1, 1);   // ④
    vertex(1, 1, 1);    // ③
    vertex(1, 1, -1);   // ⑦
    vertex(1, -1, -1);  // ⑧
  endShape();    
}

void keyPressed() {
  if (key == 'p')       { flg = true; }   // 透視投影
  else if (key == 'o')  { flg = false; }  // 平行投影

  if (keyCode == UP)         { rx = rx - 0.1; }
  else if (keyCode == DOWN)  { rx = rx + 0.1; }
  else if (keyCode == LEFT)  { ry = ry - 0.1; }
  else if (keyCode == RIGHT) { ry = ry + 0.1; }
}

void mouseDragged() {
  rz = mouseX * 0.01;
}