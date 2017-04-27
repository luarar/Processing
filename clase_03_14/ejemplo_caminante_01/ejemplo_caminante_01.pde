
Caminante pepe;
Caminante juan;

void setup() {
  size( 800, 600 );

  //inicializo el objeto
  pepe = new Caminante();
  juan = new Caminante( 200 , 300 );
}
void draw() {
  background( 255 );
  pepe.dibujar();
  juan.dibujar();
}

