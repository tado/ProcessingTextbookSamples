void setup() {
  size(800, 600);
}
void draw() {
  background(128); 
  update(); //状態変更（更新）をまとめて呼び出す
  drawBall();
}
void update() {
  moveBall();
  bounceBall();
  checkHitWalls();
  accelerateBall();
}
void mouseDragged() { 
  centerX = pmouseX;
  centerY = pmouseY;
  dx = mouseX - pmouseX;
  dy = mouseY - pmouseY;
}
void keyPressed() {
  float s = 1.2;
  if (key == 'l') radius *= s;
  else if (key == 's') radius /= s;
  radius = min(max(1.0, radius), 200.0);
  diameter = radius * 2;
  println("直径：" + diameter);
} 