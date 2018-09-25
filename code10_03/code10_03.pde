float rectSize; //四角形の大きさ

void setup(){
  size(640, 480);
  frameRate(60);
  //四角形の大きさを10で初期化
  rectSize = 10;
}

void draw(){
  background(0);
  fill(255);
  noStroke();
  //キーボードの状態によって大きさを変化させる
  if(keyPressed){
    //もし何らかのキーを押していたらサイズを拡大
    rectSize += 6;
  } else if(rectSize > 10){
    //そうでなく大きさが10以上だったら縮小
    rectSize -= 2;
  }
  //四角形を描画
  rectMode(CENTER);
  rect(width/2, height/2, rectSize, rectSize);
}
