size(500, 500);
colorMode(HSB, 360, 100, 100);
float step=10;
fill(100, 50, 80, 60);
noStroke();
background(0, 0, 100);

for (float i=0; i<=360; i+=360/step) {
  rotate(i);
  triangle(250, 200, 200, 300, 300, 300);
}