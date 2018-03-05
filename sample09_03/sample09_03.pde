size(360, 360);
colorMode(HSB, 360, 100, 100);
noFill();

for (int h=0; h<360; h++) {
  stroke(h, 100, 100);
  line(h, 0, 0, h);
}

for (int h=0; h<360; h++) {
  stroke(h, 100, 100);
  line(h, 360, 360, h);
}