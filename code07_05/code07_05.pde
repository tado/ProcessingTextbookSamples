PImage baseImg;//画像の変数を用意する
PImage stamp;

void setup() {
  //画像を読み込む
  baseImg = loadImage("scene.jpg");
  stamp = loadImage("stamp.png");
  size(640, 480);
  image(baseImg, 0, 0);//baseImg 画像を表示する
}

void draw() {
}

void mousePressed() {
  //スタンプ画像中心をクリックした場所にする
  imageMode(CENTER);
  //クリックした場所にスタンプ画像を表示
  image(stamp, mouseX, mouseY);
}