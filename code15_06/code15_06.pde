PVector ballPos;//ボールの中央座標
PVector ballVel;//ボールの速度
PVector ballAcc;//ボールの加速度
int ballR = 64; //ボールの半径

PVector target1Pos,target2Pos,target3Pos;

PImage ball,target1,target2,target3;

int time = 30000;

int breakNum = 0;

void setup(){
  size(1280,720);

  ballPos = new PVector(100,100);
  ballVel = new PVector(5,0);
  ballAcc = new PVector(0,1);

  target1Pos = new PVector(random(ballR*2, width-ballR*2),random(ballR*2, height-ballR*2));
  target2Pos = new PVector(random(ballR*2, width-ballR*2),random(ballR*2, height-ballR*2));
  target3Pos = new PVector(random(ballR*2, width-ballR*2),random(ballR*2, height-ballR*2));

  ball = loadImage("ball.png");
  target1 = loadImage("target1.png");
  target2 = loadImage("target2.png");
  target3 = loadImage("target3.png");

}

void draw(){
  background(255);
  
  ballVel.add(ballAcc);//重力
  if(millis()<time){
    ballVel.x += (mouseX-ballPos.x)/200.0;//バネ
    ballVel.y += (mouseY-ballPos.y)/200.0;//バネ
  }
  ballVel.mult(0.98);//空気抵抗
  ballPos.add(ballVel);
  
  //ボールの壁反射
  if (ballPos.x < ballR){
      ballPos.x = ballR;
      ballVel.x *= -1;
  }
  if (width - ballR < ballPos.x){
      ballPos.x = width - ballR;
      ballVel.x *= -1;
  }
  if (ballPos.y < ballR){
      ballPos.y = ballR;
      ballVel.y *= -1;
  }
  if (height - ballR < ballPos.y){
      ballPos.y = height - ballR;
      ballVel.y *= -1;
  }
  
  //ボール描画
  image(ball, ballPos.x-ball.width/2, ballPos.y-ball.height/2);
  
  //バネ描画
  if(millis()<time){
    stroke(255,0,0);
    strokeWeight(4);
    line(mouseX, mouseY, ballPos.x, ballPos.y);
  }

  //的あたり判定
  PVector p = new PVector(ballPos.x, ballPos.y);
  float len = (p.sub(target1Pos)).mag();
  if (len < ballR*2){
    target1Pos = new PVector(target2Pos.x, target2Pos.y);
    target2Pos = new PVector(target3Pos.x, target3Pos.y);
    target3Pos.x = random(ballR*2, width -ballR*2);
    target3Pos.y = random(ballR*2, height-ballR*2);
    breakNum++;
  }
  
  //残り時間表示
  fill(255,0,0);
  rect(0,0,width-width*millis()/time,30);

  //点数表示
  fill(0);
  textSize(50);
  text("Score", 100, 100);
  text(breakNum, 300, 100);
  
  //target表示
  image(target1, target1Pos.x-64, target1Pos.y-64);
  image(target2, target2Pos.x-64, target2Pos.y-64);
  image(target3, target3Pos.x-64, target3Pos.y-64);
  
}