final int maxBalls = 100;
Ball[] ball = new Ball[maxBalls];
int numBalls = 0;

void setup() {
  size(800, 600);
}
void draw() {
  background(128); 
  update();//状態変更（更新）をまとめて呼び出す
  for (int i = 0; i < numBalls; i++) {
    ball[i].draw(); //ボールを描く
  }
}
void update() {
  for (int i = 0; i < numBalls; i++) {
    ball[i].update();
  }
}
void mousePressed() {
  numBalls = 0;
}
void mouseDragged() { 
  if (maxBalls <= numBalls) return;
  if (numBalls % 2 == 1) ball[numBalls] = new Ball();
  else ball[numBalls] = new LightBall();
  ball[numBalls].setRadius(random(20, 60));
  ball[numBalls].setCenter(pmouseX, pmouseY);
  ball[numBalls].setVelocity(mouseX - pmouseX, mouseY - pmouseY);
  numBalls++;
}
void keyPressed() {
  for (int i = 0; i < numBalls; i++) {
    ball[i].changeSize(key);
  }
}
