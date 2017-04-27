
Caminante c;

void setup() {
  size( 800, 600 );

  //inicializo el objeto
  c = new Caminante( 200 , 300 );
  background( 255 );
}
void draw() {
  pushStyle();
  noStroke();
  fill( 255 , 5 );
  rect( 0 , 0 , width , height );
  popStyle();
  
  c.mover();
  c.dibujar();
}

