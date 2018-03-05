PImage baseImg;
PImage stamp;

void setup() {
  baseImg = loadImage("scene.jpg");
  stamp = loadImage("stamp.png");
  size(baseImg.width, baseImg.height);
  image(baseImg, 0, 0);
}

void draw() {
}

void mousePressed() {
  imageMode(CENTER);
  image(stamp, mouseX, mouseY);
}