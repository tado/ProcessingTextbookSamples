void setup() {
  size(500, 500);
  stroke(0);
}
void draw() {
  background(255);
  for (int j = 0; j < 20; j++) {
    float y = mouseY + 10 * j;
    for (int i = 0; i < 20; i++) {
      float x = mouseX + 10 * i;
      ellipse(x, y, 10, 10); //円を描画
    }
  }
}