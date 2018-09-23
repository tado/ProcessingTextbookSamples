void setup() {
  size(500, 500);
  stroke(0);
}
void draw() {
  background(255);
  if (mousePressed) {
    if (mouseButton == LEFT) {
      ellipse(mouseX, mouseY, 100, 100); //円を描画
    } else if (mouseButton == RIGHT) {
      triangle(mouseX, mouseY - 60, mouseX - 50, 
        mouseY + 30, mouseX + 50, mouseY + 30); //三角形を描画
    } else {
      //×を描画
      line(mouseX - 50, mouseY - 50, mouseX + 50, mouseY + 50); 
      line(mouseX + 50, mouseY - 50, mouseX - 50, mouseY + 50);
    }
  } else {
    ellipse(mouseX, mouseY, 10, 10); //小さな円を描画
  }
}
