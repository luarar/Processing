

class Dibujante {

  float x, y;
  float vel, dir;
  float t;

  String estado;

  //----------------------------------
  Dibujante() {
    estado = "espera";
    t = 10;
    vel = 4;
  }
  //----------------------------------

  void iniciarDibujo() {
    x = random( width );
    y = random( height );
    dir = random( TWO_PI );
  }
  //----------------------------------

  void dibujar() {
    float dx = vel * cos( dir );
    float dy = vel * sin( dir );
    x += dx;
    y += dy;
    x = ( x>width ? x-width : x );
    x = ( x<0 ? x+width : x );
    y = ( y>height ? y-height : y );
    y = ( y<0 ? y+height : y );
    pushStyle();
    rectMode( CENTER );
    fill(0);
    pushMatrix();
    translate( x, y );
    rotate( dir );
    rect(  0, 0, t, t );
    popMatrix();
    popStyle();
  }
  //----------------------------------

  void variarDireccion( float derivada ) {

    if ( derivada > VALOR_UMBRAL_DERIVADA ) {
      dir += radians( ANGULO_VARIACION );
    } else if ( derivada < -VALOR_UMBRAL_DERIVADA ) {
      dir -= radians( ANGULO_VARIACION );
    }
  }
  //----------------------------------

  void actualizar( float amplitudNormalizada, float derivadaFrec ) {

    boolean estoyCantando = amplitudNormalizada > 0.2;

    if ( estado.equals( "espera" ) ) {

      if ( estoyCantando ) {
        estado = "dibuja";
        iniciarDibujo();
      }
    } else if ( estado.equals( "dibuja" ) ) {

      variarDireccion( derivadaFrec );     
      dibujar();

      if ( !estoyCantando ) {
        estado = "espera";
      }
    }
  }
}

