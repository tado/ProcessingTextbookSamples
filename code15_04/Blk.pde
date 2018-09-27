class Blk{
  private PVector pos;
  private int w, h;
  public Rectangle rect;
  public color col;
  public int HP;

  //ブロックの位置を決め、幅と高さと矩形を決める。
  public void setPos(PVector p){
    pos = p;
    w = 100;
    h = 25;
    rect = new Rectangle((int)pos.x, (int)pos.y, w, h);
  }
  
  public PVector getPos(){
    return pos;
  }
  
  public void setColor(color c){
    col = c;
  }
}