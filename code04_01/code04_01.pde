void setup() {
  size(500, 500);
  stroke(0);
}
void draw() {
  background(255);
  if (mousePressed) {
    ellipse(mouseX, mouseY, 100, 100); //円を描画
  }
}