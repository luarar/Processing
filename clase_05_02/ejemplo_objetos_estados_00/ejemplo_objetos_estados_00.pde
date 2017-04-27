
Circulo c;

void setup() {
  size( 800, 600 );
}
void draw() {
  background( 255 );
  if ( c != null ) {
    c.actualizar();
    c.dibujar();
      println( c.estado );
  }
  

}
void mousePressed() {
  if ( c==null ) {
    c = new Circulo( mouseX, mouseY );
  }
}