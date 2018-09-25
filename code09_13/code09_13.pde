float R = 400;
float weightWidth = 100;
float weightHeight = 100;
float y; // おもりの位置およびばねの長さ
int max = 600; // おもりのy方向の最大移動値
int min = 200; // おもりのy方向の最小移動値
boolean movable = false; // ドラッグ可能かどうかを表す

void setup() {
  size(500, 800);
  rectMode(CENTER);
  stroke(255);
  strokeWeight(5);
  y=R; // 初期のばねの長さ(おもりのy)は自然長
}

void draw() {
  background(0);
  drawSpring();
}

void drawSpring() {
  if (movable) {
    y = mouseY;    // ばねの長さをマウスドラッグにより設定
    y = constrain(y, min, max);// ばねの長さをminからmaxの間に制限
  }
  line(width/2, 0, width/2, y);
  rect(width/2, y, weightWidth, weightHeight);
}

void mousePressed() {
  // おもりの上でマウスボタンを押したかどうか
  if (mouseX > width/2-weightWidth/2 && mouseX < width/2+weightWidth/2
    && mouseY > y-weightHeight/2 && mouseY < y+weightHeight/2) {
    movable = true;//マウスがおもりの上だったらドラッグ可能
  } else {
    movable = false;
  }
}

void mouseReleased() {
  // マウスボタンを離すとおもりは移動不可能
  movable = false;
}