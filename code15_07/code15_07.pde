PImage bg;
PImage shaku1,shaku2;
PImage karasu1, karasu2;

PVector shakuPos = new PVector(0, 580);
PVector karasuPos = new PVector(1280, 580);
PVector shakuVelo = new PVector(0, 0);
int karasuSpeed = 4;

final int NORMAL = 0;
final int STRAIN = 1;
final int JUMP   = 2;
int shakuState = NORMAL;
int strainTime = 0;

int point  = 0;
int bg_x = 0;

boolean prevMousePressed = false;

void setup(){
  size(1280,720);
  
  bg = loadImage("bg.png");
  shaku1 = loadImage("inchworm1.png");
  shaku2 = loadImage("inchworm2.png");
  karasu1 = loadImage("karasu1.png");
  karasu2 = loadImage("karasu2.png");
}

void draw(){
  //背景
  bg_x++;
  if (!prevMousePressed && mousePressed){
    point++;
    bg_x += 50;
  }
  prevMousePressed = mousePressed;
  image(bg, -bg_x%width     ,0);
  image(bg, -bg_x%width+width,0);
  
  //カラス移動
  karasuPos.x -= karasuSpeed;
  if (karasuPos.x < -100){
    karasuPos.x = width;
    karasuSpeed = (int)random(6,11);
  }
  
  //カラスと尺取虫が近かったら０点
  if (karasuPos.x               < shakuPos.x+shaku1.width &&
    karasuPos.x+karasu1.width > shakuPos.x &&
    shakuPos.y == 580){
      point = 0;
      fill(255,0,0);
      rect(0,0,width,height);
  }

  //ジャンプ移動計算
  shakuVelo.y += 1;//重力
  shakuPos.add(shakuVelo);
  //地面より下に行かないように調整
  if (shakuPos.y > 580){
    shakuPos.y = 580;
    shakuVelo.y = 0;
  }


  //尺取虫の状態
  if(mousePressed){
    shakuState = STRAIN;
    //タメ
    strainTime++;
  }else{
    //タメ開放(歩くかジャンプか)
    if (strainTime < 60)
      shakuState = NORMAL;
    else{
      shakuState = JUMP;
      shakuVelo.y = -35;
    }
    strainTime = 0;
  }

  //尺取虫の表示
  if(shakuState == NORMAL){
      image(shaku1, shakuPos.x, shakuPos.y);
  }
  if( shakuState == STRAIN){
    //１秒クリックホールドで赤
    if (strainTime < 60)
      image(shaku2, shakuPos.x, shakuPos.y);
    else{
      tint(255,0,0);
      image(shaku2, shakuPos.x, shakuPos.y);
      tint(255);
    }
  }
  
  //カラスの表示
  if (frameCount % 60 < 30)
    image(karasu1, karasuPos.x, karasuPos.y);
  else
    image(karasu2, karasuPos.x, karasuPos.y);

  //点数表示
  fill(0);
  textSize(150);
  text(point,100,200);

}