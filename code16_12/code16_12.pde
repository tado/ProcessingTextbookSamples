int y=0;
color black=color(0);
color white=color(255);
void setup(){
  size(1600, 800);
  background(white);
  noSmooth();
  stroke(0);   //-------③
  point(800,0);//-------③
}
void draw(){
  for(int x=1; x<1599; x++){
    color c0 = get(x-1,y);
    color c1 = get(x  ,y);
    color c2 = get(x+1,y);
    if(c0==black && c1==black && c2==black)       stroke(white);
    else if(c0==black && c1==black && c2==white)  stroke(black);
    else if(c0==black && c1==white && c2==black)  stroke(white);
    else if(c0==white && c1==black && c2==black)  stroke(black);
    else if(c0==black && c1==white && c2==white)  stroke(black);
    else if(c0==white && c1==black && c2==white)  stroke(white);
    else if(c0==white && c1==white && c2==black)  stroke(black);
    else if(c0==white && c1==white && c2==white)  stroke(white);
    point(x,y+1);
  }
  y++;
}