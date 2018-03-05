int[] x=new int[4];
int[] y=new int[4];
int mouseClick;

void setup() {
  size(500, 500);
  mouseClick=0;
}

void draw() {
}

void mousePressed() {
  mouseClick++;
  x[mouseClick-1]=mouseX;
  y[mouseClick-1]=mouseY;
  ellipse(mouseX, mouseY, 10, 10);

  if (mouseClick==2||mouseClick==3||mouseClick==4) {
    line(x[mouseClick-2], y[mouseClick-2], x[mouseClick-1], y[mouseClick-1]);
    if (mouseClick==4) {
      beginShape();
      vertex(x[0], y[0]);
      bezierVertex(x[1], y[1], x[2], y[2], x[3], y[3]);
      endShape(CLOSE);
    }
  }
}