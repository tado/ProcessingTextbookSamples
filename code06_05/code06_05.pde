Ball ball;

void setup() {
  ball = new Ball();
  size(800, 600);
}
void draw() {
  background(128); 
  update();//状態変更（更新）をまとめて呼び出す
  ball.draw();
}
void update() {
  ball.update();
}
void mouseDragged() { 
  ball.setCenter(pmouseX, pmouseY);
  ball.setVelociry(mouseX - pmouseX, mouseY - pmouseY);
}
void keyPressed() {
  ball.changeSize(key);
}