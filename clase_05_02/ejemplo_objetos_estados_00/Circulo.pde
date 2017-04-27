

class Circulo {

  float x, y;
  float t;
  String estado;

  float m = 5;
  int cantidad;

  boolean antesMousePressed;

  Circulo( float x_, float y_ ) {
    x = x_;
    y = y_;
    t = 20;
    estado = "inicial";
    cantidad = 0;
    antesMousePressed = mousePressed;
  }

  boolean seHizoClick() {
    return mousePressed && !antesMousePressed;
  }

  void actualizar() {
    if ( estado.equals( "inicial" ) ) {

      if ( seHizoClick() ) {
        if ( mouseDentro() ) {
          estado = "despliegue";
        }
      }
    } else if ( estado.equals( "despliegue" ) ) {

      cantidad ++;
      if ( cantidad >= 20 ) {
        estado = "grande";
      }
    } else if ( estado.equals( "grande" ) ) {
    }

    antesMousePressed = mousePressed;
  }

  void dibujar() {
    if ( estado.equals( "inicial" ) ) {

      fill( 100 );
      ellipse( x, y, t, t );
    } else if ( estado.equals( "despliegue" ) 
    || estado.equals( "grande" ) ) {

      noFill();
      for ( int i=0; i<cantidad; i++ ) {
        ellipse( x, y, t+m*i, t+m*i );
      }
      fill( 100 );
      ellipse( x, y, t, t );

    }
  }

  boolean mouseDentro() {
    float distancia = dist( mouseX, mouseY, x, y );
    return distancia < t/2;
  }
}