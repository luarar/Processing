
Circulo c[];
int total = 100;
int cantidad = 0;

void setup() {
  size( 800, 600 );
  c = new Circulo[ total ];
}
void draw() {
  background( 255 );

  for ( int i=0; i<cantidad; i++ ) {
    c[i].actualizar();
    c[i].dibujar();
  }
}
void mousePressed() {
  if ( cantidad<total ) { 
    c[ cantidad ] = new Circulo( mouseX, mouseY );
    cantidad++;
  }
}