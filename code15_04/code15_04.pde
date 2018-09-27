//ブロック配列
ArrayList<Blk> blks = new ArrayList<Blk>();

final color BLUE = color(0,0,255);
final color GRAY = color(128);
final color GREEN = color(100,250,100);
final color LGREEN = color(200,250,200);

//ボール
Ball ball = new Ball();

//テクスチャ変数
PImage blkTexWhite, ballTex;

//現在のステージ
int nowStage = 0;

void setup(){
  size(1280,720);
  
  //画像の読み込み
  blkTexWhite = loadImage("blockWhite.png");
  ballTex     = loadImage("ball.png");

  //バーを作る。配列番号は０とする。
  //色は白とし、壊れない設定とする。
  blks.add(new Blk());
  blks.get(0).setPos(new PVector(400, 650));
  blks.get(0).setColor(BLUE);

  //ステージを作る
  createFrameBlocks();
  createStageBlocks(nowStage);

  //ボールを初期化する
  PVector p,v;//位置と速度
  p = new PVector(random(200)+200, 550);
  v = new PVector(1, -1);
  v.normalize();//移動距離１に正規化する
  ball.setPos(p);
  ball.setVel(v);
  ball.setSize(10);
}

void IntersectX(){
  for (int i = 0; i < blks.size(); i++){
    Rectangle r1 = ball.rect;
    Rectangle r2 = blks.get(i).rect;
    
    if (r1.Intersects(r2)){
      //左からあたる
      if (r1.x+r1.w/2 < r2.x){
        ball.moveInverseX();
        ball.velocity.x = -abs(ball.velocity.x);
      }
      //右からあたる
      if (r1.x+r1.w/2 > r2.x+r2.w){
        ball.moveInverseX();
        ball.velocity.x = abs(ball.velocity.x);
      }
      //ブロック削除
      deleteBlock(i);
    }
  }
}

void IntersectY(){
  for (int i = 0; i < blks.size(); i++){
    Rectangle r1 = ball.rect;
    Rectangle r2 = blks.get(i).rect;
    if (r1.Intersects(r2)){
      //上からあたる
      if (r1.y+r1.h/2 < r2.y){
        ball.moveInverseY();
        ball.velocity.y = -abs(ball.velocity.y);
        //バーの場合、当たり具合によって反射方向転換
        if (i == 0){
          //左端のときper=-1,右端のときper=1
          float per = (r1.x-r1.w/2 - r2.x-r2.w/2)
                      / (r2.w * 0.5);
          PVector v = new PVector(per*2, -1);
          v.normalize();
          ball.velocity = v;
        }
      }
      //下からあたる
      if (r1.y+r1.h/2 > r2.y+r2.h/2){
        ball.moveInverseY();
        ball.velocity.y = abs(ball.velocity.y);
      }
      //ブロック削除
      deleteBlock(i);
    }
  }
}

//ブロックの削除
void deleteBlock(int n){
  if (blks.get(n).col == LGREEN ||
      blks.get(n).col == GREEN){
      //破壊
    if(blks.get(n).HP == 1){
      blks.remove(n);
    }else if(blks.get(n).HP==2){
      blks.get(n).HP--;
      blks.get(n).setColor(LGREEN);
    }
  }
}

void update(){
  //カーソルキーでバーの移動
  if(keyPressed && key == CODED){
    float x = blks.get(0).getPos().x;
    float y = blks.get(0).getPos().y;
    if(keyCode == RIGHT){
      x += 10;
    }
    if(keyCode == LEFT){
      x -= 10;
    }
    blks.get(0).setPos(new PVector(x, y));
  }
  //マウス操作(カーソルキー操作の場合はコメントアウト)
  blks.get(0).setPos(new PVector(mouseX, 650));

  /*//////////////////////////////////
  ボールを速度アップするには、ブロックの突き抜けに気をつける必要がある。
  ここでは、１ドット以下の速度でボールを進ませ、衝突判定を行い、
  例えばそれを５回繰り返すことで、ボールの速度調整を行っている。
  
  衝突判定の問題
  一般的に、衝突（重なり）を検知することは容易だが、
  その後の、振る舞いを決めるのは難しい。
  「問題点：ブロックとブロックのつなぎ目にボールが
  　　　　　衝突する時、反射結果が不安定になる」
  「解決策：軸毎に当たり判定を行い、その都度、位置を戻す」
  以下、具体的な解説。
  ・Ｘ軸方向だけボールを進ませる。
  ・Ｘ軸方向に関して衝突判定を行う。
  ・衝突していた場合、衝突処理し、位置を戻す。
  ・Ｙ軸方向だけボールを進ませる。
  ・Ｙ軸方向に関して衝突判定を行う。
  ・衝突していた場合、衝突処理し、位置を戻す。
  //////////////////////////////////*/
  int speed = 5;
  for (int i = 0; i < speed; i++){
      ball.moveX(); IntersectX();
      ball.moveY(); IntersectY();
  }
}    


void draw(){
  background(255);

  //ブロックとバーの描画
  for (int i = 0; i < blks.size(); i++){
    tint(blks.get(i).col);
    image(blkTexWhite, blks.get(i).pos.x, blks.get(i).pos.y);
  }
  
  //ボールの描画
  noTint();
  image(ballTex, ball.pos.x, ball.pos.y);

  //入力処理とボールの移動
  update();
  
  // ステージクリア処理
  if(blks.size()-75 == 0){//壁の分を引いた、残りブロック数をチェック
    nowStage++;
    if(nowStage >= 2)
      nowStage = 0;
    createStageBlocks(nowStage);
  }
  
}


void createFrameBlocks(){
  //壁ブロックを作り、初期値を設定する
  int lastAddNum;
  for (int x = 0; x <= 900; x += 100){
    blks.add(new Blk());
    lastAddNum = blks.size() - 1;
    blks.get(lastAddNum).setPos(new PVector(x, 0));
    blks.get(lastAddNum).setColor(GRAY);

    blks.add(new Blk());
    lastAddNum = blks.size() - 1;
    blks.get(lastAddNum).setPos(new PVector(x, 700));
    blks.get(lastAddNum).setColor(GRAY);
  }
  for (int y=25; y<=675; y+=25){
    blks.add(new Blk());
    lastAddNum = blks.size() - 1;
    blks.get(lastAddNum).setPos(new PVector(0, y));
    blks.get(lastAddNum).setColor(GRAY);

    blks.add(new Blk());
    lastAddNum = blks.size() - 1;
    blks.get(lastAddNum).setPos(new PVector(900, y));
    blks.get(lastAddNum).setColor(GRAY);
  }
}

void createStageBlocks(int stage){
  //破壊ブロックを作り、初期値を設定する
  int lastAddNum;
  switch (stage){
    case 0:
      for (int y = 100; y <= 500; y += 25){
        for (int x = 100; x <= 800; x += 120){
          blks.add(new Blk());
          lastAddNum = blks.size() - 1;
          blks.get(lastAddNum).setPos(new PVector(x, y));
          blks.get(lastAddNum).setColor(GREEN);
          blks.get(lastAddNum).HP = 2;
        }
      }
      break;
    case 1:
      for (int y = 25; y <= 200; y += 25){
        for (int x = 100; x <= 100*y/25; x += 100){
          blks.add(new Blk());
          lastAddNum = blks.size() - 1;
          blks.get(lastAddNum).setPos(new PVector(x, y+100));
          blks.get(lastAddNum).setColor(LGREEN);
          blks.get(lastAddNum).HP = 1;
        }
      }
      break;
  }
}        