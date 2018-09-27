class Rectangle{
  public int x;
  public int y;
  public int h;
  public int w;
  
  Rectangle(int xx, int yy, int ww, int hh){
    x = xx;
    y = yy;
    w = ww;
    h = hh;
  }
  
  boolean Intersects(Rectangle r){
    if(x   <= r.x+r.w &&
       y   <= r.y+r.h &&
       x+w >= r.x &&
       y+h >= r.y)
      return true;
    else
      return false;
  }
}