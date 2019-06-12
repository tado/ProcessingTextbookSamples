var diameter; //円の直径
var bgColor;  //背景色

function setup() {
  //画面の大きさを指定
  createCanvas(640, 480);
  //直径を指定
  diameter = 200;
  //背景色を指定
  bgColor = color(63);
}

function draw() {
  //背景色
  background(bgColor);
  //色を指定
  fill(31, 128, 255);
  noStroke();
  //マウスの位置に円を描く
  ellipse(mouseX, mouseY, diameter, diameter);
}

//マウスボタンを押したら背景色を変更
function mousePressed() {
  bgColor = color(255, 0, 0);
}

//マウスボタンを離したら背景色を元に戻す
function mouseReleased() {
  bgColor = color(63);
}
