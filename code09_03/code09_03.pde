float y;
void setup () {
  size(500, 500);
  y=0;
}

void draw () {
  ellipse(250, y, 50, 50);
  // 円の中心座標yを1ずつ増やす
  y++;
}