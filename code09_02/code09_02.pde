void setup () {
  colorMode(HSB, 360, 100, 100);
  size(500, 500);
  frameRate(10);//フレームレートの設定
}

void draw () {
  //draw関数がループする毎に円の色を変えて表示
  fill(random(360), random(100), random(100));
  ellipse(250, 250, 50, 50);
}