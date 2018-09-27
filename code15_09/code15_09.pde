PImage map;
int state;
final int STANBY = 0;
final int GAMESTART = 1;
final int GAMEFINISH = 2;
int startTime;
int finishTime;

void setup(){
  size(1024,1024);
  map = loadImage("map.png");
  textSize(50);
}

void draw(){
  background(0);
  drawMap();
  drawText();
}

void mousePressed(){
  if(get(mouseX,mouseY)==color(255,0,0)){
    state = GAMESTART;
    startTime = millis();
  }
}

void drawMap(){
  fill(255);
  noStroke();
  pushMatrix();
    translate(-mouseX, -mouseY);
    image(map,0,0);
    pushMatrix();
      translate(675,1747);
      rotate(frameCount/30.0);
      rect(-165,-10,330,20);
      rotate(PI*0.5);
      rect(-165,-10,330,20);
    popMatrix();
    pushMatrix();
      translate(960,1747);
      rotate(-frameCount/50.0);
      rect(-165,-10,330,20);
      rotate(PI*0.5);
      rect(-165,-10,330,20);
    popMatrix();
    pushMatrix();
      translate(1255,1747);
      rotate(frameCount/70.0);
      rect(-165,-10,330,20);
      rotate(PI*0.5);
      rect(-165,-10,330,20);
    popMatrix();
  popMatrix();
}

void drawText(){
  fill(254,0,0);
  switch(state){
    case STANBY: 
      text("Click red circle for start race.",200,550);
      break;
    case GAMESTART: 
      text((millis()-startTime)*0.001,400,550);
      if(get(mouseX,mouseY)==color(255)){
        fill(255,0,0);
        rect(0,0,width,height);
        state = STANBY;
      }
      if(get(mouseX,mouseY)==color(0,0,255)){
        state = GAMEFINISH;
        finishTime=millis()-startTime;
      }
      break;
    case GAMEFINISH:
      text(finishTime*0.001,400,550);
      break;
  }
}