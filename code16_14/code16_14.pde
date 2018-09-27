size(1000,1000);
background(255);
fill(0);
translate(500,500);
float r=10;

for(float th=0; th<480000; th+=137.5){
  pushMatrix();
    rotate(radians(th));
    translate(th*0.001,0);
    scale(th*0.000003);
    ellipse(0,0,r,r);
  popMatrix();
}