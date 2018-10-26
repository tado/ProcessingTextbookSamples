final int NORMAL = unbinary("00000000");//0
final int STRAIN = unbinary("00000001");//1
final int JUMP   = unbinary("00000010");//2
final int WALK   = unbinary("00000100");//4
final int RUN    = unbinary("00001000");//8
final int STOP   = unbinary("00010000");//16
int state = STRAIN | JUMP | STOP;

if((state & STRAIN) > 0)
  println("strain.");