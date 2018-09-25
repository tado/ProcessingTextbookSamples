float[] x = new float[100];
float[] y = new float[100];
int number;
void setup () {
  size(500, 500);
  background(255);
  number=0; //クリックした回数=水滴の数
}
void draw () {
  overlay();
  fill(128);
  for (int i=0; i<number; i++) { 
    ellipse(x[i], y[i], 5, 5);
    x[i]=x[i]+random(-1, 1);
    y[i]=y[i]+random(1, 3);
  }
}
void overlay() {
  fill(255, 30);
  noStroke();
  rect(0, 0, width, height);
}
void mousePressed() {
  x[number]=mouseX;
  y[number]=mouseY;
  number++; //水滴の番号を増やす
}