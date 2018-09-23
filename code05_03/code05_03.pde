float centerX = 30.0; 
float centerY = 70.0;
float dx = 10.0; //毎フレームのボール水平方向の移動量（水平速度）
float radius = 25.0; //ボールの半径
float diameter = radius * 2.0; //ボールの直径
void setup() {
  size(800, 600);
}
void draw() {
  background(128); 
  drawBall();
  moveBall();//ボールを移動する
}
void drawBall() {
  ellipse(centerX, centerY, diameter, diameter);
}
void moveBall() {
  centerX += dx;//円の中心を右に10画素移動する
}
void mousePressed() { 
  centerX = mouseX;
  centerY = mouseY;
}