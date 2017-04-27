
Caminante c;

void setup(){
  size( 800 , 600 );
  c = new Caminante();
}
void draw(){
  background( 255 );
  //c.monitor();
  c.mover();
  c.dibujar();
}
