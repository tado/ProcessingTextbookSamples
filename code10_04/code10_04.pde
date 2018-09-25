//マウスを動かした際の座標
float moveX, moveY;
//マウスをドラッグした際の座標
float dragX, dragY;
//ドラッグした座標と現在の位置を補完
float interpX, interpY;

void setup() {
  size(640, 480);
  noStroke();
  //それぞれの座標を画面中央に初期化
  interpX = moveX = dragX = width/2;
  interpY = moveY = dragY = height/2;
}

void draw() {
  background(0);
  //ドラッグした場所を補完してなめらかな動きに
  fill(127);
  interpX = interpX + (dragX - interpX) * 0.1;
  interpY = interpY + (dragY - interpY) * 0.1;
  //補完した場所に円を描く
  ellipse(interpX, interpY, 60, 60);
  //ドラッグしたマウスの位置に円を描く
  fill(255, 0, 0);
  ellipse(dragX, dragY, 40, 40);
  //動かしたマウスの位置に円を描く
  fill(0, 0, 255);
  ellipse(moveX, moveY, 20, 20);
}

//マウスを動かした時
void mouseMoved() {
  moveX = mouseX;
  moveY = mouseY;
}

//マウスをドラッグした時
void mouseDragged() {
  dragX = mouseX;
  dragY = mouseY;
}

//マウスボタンを押した時
void mousePressed() {
  dragX = mouseX;
  dragY = mouseY;
}

//マウスボタンを離した時
void mouseReleased() {
  dragX = width/2;
  dragY = height/2;
}