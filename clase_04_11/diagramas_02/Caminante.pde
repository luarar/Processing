

class Caminante {

  float x, y;
  float dir, vel;

  float variacion;

  int tiempo;
  long marca;

  float t = 20;
  float paso = 4;
  String estado;

  Caminante() {
    x = width/2;
    y = height/2;
    vel = 2;
    variacion = radians( random(-3, 3) );
    dir = random( radians( 360 ));
    estado = "avanzar";

    marca = millis();
    tiempo = int( random( 1000, 1000 ) );
  }

  void dibujar() {
    ellipse( x, y, t, t );
  }

  void monitor() {
    println( estado );
  }

  void mover() {


    if ( estado.equals("avanzar") ) {
      dir+=variacion;

      float dx = vel * cos( dir );
      float dy = vel * sin( dir );

      x += dx;
      y += dy;


      int ahora = millis();
      if ( ahora > marca+tiempo ||
        x<100 || x>700 || y<100 || y>500
        ) {
        estado = "cambiar";
      }
    } else if ( estado.equals("cambiar") ) {
      dir += radians( random( 160, 200 ) );
      variacion = radians( random(-3, 3) );

      marca = millis();
      tiempo = int( random( 1000, 1000 ) );

      estado = "avanzar";
    }
  }
}

