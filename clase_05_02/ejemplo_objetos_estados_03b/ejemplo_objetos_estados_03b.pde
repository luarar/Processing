
//declara
ArrayList <Circulo> circulos;

int total = 100;
int cantidad = 0;

void setup() {
  size( 800, 600 );

  //inicializa
  circulos = new ArrayList();
}
void draw() {
  background( 255 );

  for (Circulo c : circulos) {
    c.actualizar();
    c.dibujar();    
  }
}
void mousePressed() {

  boolean noHiceClickEnAlgunoExistente = true;

  for (Circulo c : circulos) {
    if ( c.mouseDentro() ) {
      noHiceClickEnAlgunoExistente = false;
    }
  }

  if ( noHiceClickEnAlgunoExistente ) {
    Circulo c = new Circulo( mouseX, mouseY );
    circulos.add( c );
  }
}