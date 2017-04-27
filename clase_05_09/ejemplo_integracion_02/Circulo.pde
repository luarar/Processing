

class Circulo {

  float x;
  float y;
  float d;

  String estado;
  color relleno;

  Circulo() {
    d = 10;
    x = random( width );
    y = random( height );
    estado = "crece";
    relleno = color( 255, 255, 255 );
  }

  void actualizar( float valorNormalizado ) {
    if ( estado.equals( "crece" ) ) {
      d ++;
      pushStyle();
      colorMode( HSB );
      relleno = color( valorNormalizado * 255 , 255 , 255 );
      popStyle();
    } else if ( estado.equals( "estatico" ) ) {
    }
  }

  void dibujar() {
    pushStyle();
    fill( relleno );
    ellipse( x, y, d, d );
    popStyle();
  }

  void dejarDeCrecer() {
    estado = "estatico";
  }
}

