float rx = 0.0;  // x軸まわりの回転角度
float ry = 0.0;  // y軸まわりの回転角度
float rz = 0.0;  // z軸まわりの回転角度

PImage tex1;  // マッピング用の画像1
PImage tex2;  // マッピング用の画像2
PImage tex3;  // マッピング用の画像3

void setup() {
  size(320, 240, P3D);  // 3Dモード
  noStroke();           // 枠線は描画しない
  
  // テクスチャ用の画像を読み込む
  tex1 = loadImage("smp01.jpg");
  tex2 = loadImage("smp02.jpg");
  tex3 = loadImage("smp03.jpg");
  textureMode(NORMAL);  // 正規化
}

void draw() {
  // 画面をリフレッシュ
  background(31);
  
  // 画面の中心に原点を移動
  translate(width/2, height/2, 0);
  rotateX(rx);  // x軸まわりの回転
  rotateY(ry);  // y軸まわりの回転
  rotateZ(rz);  // z軸まわりの回転
  scale(50);    // 50倍に拡大
  
  // テクスチャをマッピングした立方体を描画
  makeTexturedCube(tex1, tex2, tex3);
}

void makeTexturedCube(PImage tex1, PImage tex2, PImage tex3) {
  // 前面
  beginShape(QUADS);
    texture(tex1);
    vertex(-1, -1, 1, 0, 0); // ①-A
    vertex(-1, 1, 1, 0, 1);  // ②-B
    vertex(1, 1, 1, 1, 1);   // ③-C
    vertex(1, -1, 1, 1, 0);  // ④-D
  endShape();
  
  // 後面
  beginShape(QUADS);    
    texture(tex1);
    vertex(1, -1, -1, 0, 0);  // ⑧-A
    vertex(1, 1, -1, 1, 0);   // ⑦-D
    vertex(-1, 1, -1, 1, 1);  // ⑥-C
    vertex(-1, -1, -1, 0, 1); // ⑤-B
  endShape();
  
  // 上面
  beginShape(QUADS);    
    texture(tex2);
    vertex(-1, -1, 1, 0, 1);  // ①-B
    vertex(1, -1, 1, 1, 1);   // ④-C
    vertex(1, -1, -1, 1, 0);  // ⑧-D
    vertex(-1, -1, -1, 0, 0); // ⑤-A
  endShape();
  
  // 底面
  beginShape(QUADS);    
    texture(tex2);
    vertex(-1, 1, 1, 0, 0);   // ②-A
    vertex(-1, 1, -1, 0, 1);  // ⑥-D
    vertex(1, 1, -1, 1, 1);   // ⑦-C
    vertex(1, 1, 1, 1, 0);    // ③-B
  endShape();
  
  // 左面
  beginShape(QUADS);    
    texture(tex3);
    vertex(-1, -1, -1, 0, 0); // ⑤-A
    vertex(-1, 1, -1, 0, 1);  // ⑥-D
    vertex(-1, 1, 1, 1, 1);   // ②-C
    vertex(-1, -1, 1, 1, 0);  // ①-B
  endShape();
  
  // 右面
  beginShape(QUADS);    
    texture(tex3);
    vertex(1, -1, 1, 0, 0);  // ④-A
    vertex(1, 1, 1, 0, 1);   // ③-B
    vertex(1, 1, -1, 1, 1);  // ⑦-C
    vertex(1, -1, -1, 1, 0); // ⑧-D
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