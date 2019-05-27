Ball ball;

void setup() {
  ball = new Ball();
  size(800, 600);
}
void draw() {
  background(128); 
  update();//状態変更（更新）をまとめて呼び出す
  ball.draw();//ボールを描く
}
void update() {
  ball.move();//ボールを移動する
  ball.bounce();//ボールを検査し床バウンド処理を行う
  ball.checkHitWalls();//ボールを検査し壁打ち処理を行う
  ball.accelerate();//ボールを加速する
}
void mouseDragged() { 
  ball.setCenter(pmouseX, pmouseY);
  ball.setVelocity(mouseX - pmouseX, mouseY - pmouseY);
}
void keyPressed() {
  float s = 1.2;
  if (key == 'l') ball.radius *= s;
  else if (key == 's') ball.radius /= s;
  ball.radius = min(max(1.0, ball.radius), 200.0);
  ball.diameter = ball.radius * 2;
  println("直径：" + ball.diameter);
}
