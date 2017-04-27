
Caminante c;

void setup() {
  size( 800, 600 );

  //inicializo el objeto
  c = new Caminante( 200 , 300 );
}
void draw() {
  background( 255 );
  c.mover();
  c.dibujar();
}

