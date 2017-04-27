
//declara
ArrayList circulos;

int total = 100;
int cantidad = 0;

void setup() {
  size( 800, 600 );

  //inicializa
  circulos = new ArrayList();
}
void draw() {
  background( 255 );

  for ( int i=0; i<circulos.size(); i++ ) {

    Circulo c = (Circulo) circulos.get( i );

    c.actualizar();
    c.dibujar();
  }
}
void mousePressed() {

  boolean noHiceClickEnAlgunoExistente = true;

  for ( int i=0; i<circulos.size(); i++ ) {
    Circulo c = (Circulo) circulos.get( i );
    if ( c.mouseDentro() ) {
      noHiceClickEnAlgunoExistente = false;
    }
  }

  if ( noHiceClickEnAlgunoExistente ) {
    Circulo c = new Circulo( mouseX, mouseY );
    circulos.add( c );
  }
}