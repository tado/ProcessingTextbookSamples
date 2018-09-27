PImage[] panel = new PImage[4];
int[][] field = new int[6][6];
int click=0;
int line=0;

void setup(){
  size(1105,768);
  panel[0] = loadImage("sqred.png");
  panel[1] = loadImage("sqgreen.png");
  panel[2] = loadImage("sqblue.png");
  panel[3] = loadImage("sqyellow.png");
  for(int y=0; y<6; y++){
    for(int x=0; x<6; x++){
      field[x][y] = int(random(4));
    }
  }
  noFill();
  strokeWeight(10);
  stroke(255,64,64);
}

void draw(){
  background(255);
  for(int y=0; y<6; y++){
    for(int x=0; x<6; x++){
      image(panel[field[x][y]],x*128,y*128);
    }
  }
  
  noFill();
  rect(((mouseX-64)/128)*128,((mouseY-64)/128)*128,256,256);
  
  textSize(50);
  fill(0);
  text("Click:"+click, 860, 100);
  text("Lines:"+line,  855, 200);
  text("C/L:",  894, 300);
  if(line!=0)
    text(1.0*click/line,  980, 300);
  
}

void mouseClicked(){
  int x = (mouseX-64)/128;//x of leftUpPanel
  int y = (mouseY-64)/128;//y of leftUpPanel
  if(x<5 && y<5){
    int tmp;
    tmp = field[x][y];
    if(mouseButton==LEFT){
      field[x][y] = field[x][y+1];
      field[x][y+1] = field[x+1][y+1];
      field[x+1][y+1] = field[x+1][y];
      field[x+1][y] = tmp;
    }else if(mouseButton==RIGHT){
      field[x][y] = field[x+1][y];
      field[x+1][y] = field[x+1][y+1];
      field[x+1][y+1] = field[x][y+1];
      field[x][y+1] = tmp;
    }
    deleteLine();
    click++;
  }
}

void deleteLine(){
  for(int y=0; y<6; y++){
    int n = field[0][y];
    int x = 1;
    while(n == field[x][y]){
      if(x==5){
        line++;
        for(int i=0; i<6; i++)
          field[i][y] = int(random(4));
      }
      x++;
      if(6<=x)
        break;
    }
  }
  for(int x=0; x<6; x++){
    int n = field[x][0];
    int y = 1;
    while(n == field[x][y]){
      if(y==5){
        line++;
        for(int i=0; i<6; i++)
          field[x][i] = int(random(4));
      }
      y++;
      if(6<=y)
        break;
    }
  }
}