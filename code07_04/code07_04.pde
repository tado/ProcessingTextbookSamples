int[] x=new int[4];//clickしたときのx座標
int[] y=new int[4];//clickしたときのy座標
int clickNum;//clickした回数

void setup() {
  size(500, 500);
  clickNum=0;
}

void draw() {
}

void mousePressed() {
  x[clickNum]=mouseX;
  y[clickNum]=mouseY;
  ellipse(mouseX, mouseY, 10, 10);//クリック箇所に制御点を描く
  if ( clickNum > 0 ) { //2回クリック以降に制御点を結ぶ直線を描く
    line(x[clickNum], y[clickNum], x[clickNum-1], y[clickNum-1]);
  }
  if ( clickNum == 3 ) { 
    //4回クリックしたらベジェ曲線を描く
    bezier(
      x[0], y[0], 
      x[1], y[1], 
      x[2], y[2], 
      x[3], y[3]
      );
    clickNum = 0;//クリック回数を0に戻す
  } else { 
    clickNum++;//4 点揃っていなければ点番号を増やす
  }
}