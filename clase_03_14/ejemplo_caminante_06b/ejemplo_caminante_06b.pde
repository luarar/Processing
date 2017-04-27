
Caminante c[];
int cantidad = 100;

void setup() {
  size( 800, 600 );


  //dimensión del arreglo
  c = new Caminante[ cantidad ];

  for ( int i=0; i<cantidad; i++ ) {
    //iniciliazo cada objeto del arreglo
    c[i] = new Caminante( width/2, height/2 );
  }
  background( 255 );
}
void draw() {
  pushStyle();
  noStroke();
  fill( 255, 5 );
  rect( 0, 0, width, height );
  popStyle();

  for ( int i=0; i<cantidad; i++ ) {
    
    if( mousePressed ){
      c[i].huir( mouseX , mouseY );
    }
    
    
    c[i].mover();
    c[i].dibujar();
  }
}

