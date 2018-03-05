void setup () {
  colorMode(HSB, 360, 100, 100);
  size(500, 500);
  frameRate(60);
}

void draw () {
  fill(random(360), random(100), random(100));
  ellipse(250, 250, 50, 50);
}