int mode; //ドローインモード

void setup() {
  //3Dで描画 (OpenGL)
  size(640, 480, P3D);
  //カラーモードをHSBに
  colorMode(HSB, 360, 100, 100, 100);
  background(0);
  mode = 0;
  totalDist = 0;
  lastEllipseX = 0;
  lastEllipseY = 0;
}

void draw() {
}

void mouseDragged() {
  //マウスをドラッグすると描画モードに応じた形態を描く
  if (mode == 0) {
    drawLine0();
  }
  if (mode == 1) {
    drawLine1();
  }
  if (mode == 2) {
    drawLine2();
  }
}

//モード0: 線と色によるドローイング
void drawLine0() {
  float dist = dist(mouseX, mouseY, pmouseX, pmouseY);
  stroke(dist*3, 75, 100);
  strokeWeight(4);
  line(mouseX, mouseY, pmouseX, pmouseY);
  strokeWeight(1);
}

//モード1 : 回転する矩形によるドローイング
void drawLine1() {
  float dist = dist(mouseX, mouseY, pmouseX, pmouseY);
  rectMode(CENTER);
  noStroke();
  fill(random(60, 240), 100, 100, 50);
  pushMatrix();
  translate(mouseX, mouseY);
  rotateZ(random(PI));
  rotateY(random(PI));
  float rectSize = random(10);
  rect(0, 0, rectSize*dist, rectSize*dist/random(5, 10));
  popMatrix();
}

//モード2 : 円と円を結ぶ線
float totalDist; //マウスのトータル移動距離
float lastEllipseX, lastEllipseY; //1つ前に描いた円の位置

void drawLine2() {
  float dist = dist(mouseX, mouseY, pmouseX, pmouseY);
  totalDist += dist;
  if (totalDist > 80) {
    noStroke();
    fill(180, 100, 100, 50);
    float diameter = map(dist, 0, 10, 5, 20);
    ellipse(mouseX, mouseY, diameter, diameter);
    if (lastEllipseX > 0 && lastEllipseY > 0) {
      stroke(255);
      line(mouseX, mouseY, lastEllipseX, lastEllipseY);
    }
    totalDist = 0;
    lastEllipseX = mouseX;
    lastEllipseY = mouseY;
  }
}

//マウスボタンを押すと画面をクリア
void mousePressed() {
  background(0);
  //円の位置をリセット
  lastEllipseX = mouseX;
  lastEllipseY = mouseY;
}

//キー入力で描画モードを切り替える
void keyPressed() {
  if (key == 'a') {
    mode = 0;
  }
  if (key == 's') {
    mode = 1;
  }
  if (key == 'd') {
    mode = 2;
  }
}
