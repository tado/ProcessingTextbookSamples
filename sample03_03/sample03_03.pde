float x = 30.0;
void setup() {
  size(800, 600);
}
void draw() {
  drawCircle();
}
void drawCircle() {
  ellipse(x, 70.0, 50.0, 50.0);
  x += 60.0;
}