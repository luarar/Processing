
Banda b;

void setup() {
  size( 800, 600 );
  frameRate( 5 );
  b = new Banda();
  background( 255 );
}
void draw() {

  b.actualizar();
  b.dibujar();
}

void keyPressed() {

  if ( keyCode == RIGHT ) {
    b.girarHorario();
  } else  if ( keyCode == LEFT ) {
    b.girarAntiHorario();
  }
}