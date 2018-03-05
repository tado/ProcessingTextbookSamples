PImage img; //画像データ

void setup() {
  size(800, 600);
  //画像を読み込み
  img = loadImage("photo.jpg");
}

void draw() {
  background(0);
  //画像を描画
  image(img, 0, 0);
  //画像のマウスポインタ直下のピクセルの色を抽出
  color col = img.get(mouseX, mouseY);
  //取得した色で四角形を描く
  stroke(255);
  fill(col);
  rect(20, 20, 100, 100);
}
