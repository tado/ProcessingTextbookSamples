void setup() {
  size(800, 600);
}
void draw() {
  drawCircle(400.0, 300.0, 50.0); //3つの数値は実引数
}
void drawCircle(float x, float y, float radius) { //x, y, radiusは仮引数
  ellipse(x, y, radius, radius); //x, y, radiusは関数ellipseの実引数
}