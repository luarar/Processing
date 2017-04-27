
Caminante c;

void setup(){
  size( 800 , 600 );
  c = new Caminante();
  background( 255 );
}
void draw(){
  
  //c.monitor();
  c.mover();
  c.dibujar();
}
