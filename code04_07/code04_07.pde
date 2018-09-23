void setup() {
  size(500, 500);
  stroke(0);
}
void draw() {
  background(255);
  for (int i = 0; i < 20; i++) {
    float x = mouseX + 10 * i;
    if (width - 20 < x) break; //もしウィンドウ右端近くなら抜ける
    ellipse(x, mouseY, 10, 10); //円を描画
  }
}
