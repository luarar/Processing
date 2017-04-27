

class Caminante {

  float x, y;
  float t = 20;
  float paso = 4;
  String estado;

  Caminante() {
    x = 100;
    y = 100;
    estado = "Der";
  }

  void dibujar() {
    ellipse( x, y, t, t );
  }
  
  void monitor(){
    println( estado );
  }

  void mover() {

    if ( estado.equals("Der") ) {
      x += paso;
      if ( x>=700 ) {
        estado = "Abajo";
      }
    } else if ( estado.equals("Abajo") ) {
      y += paso;
      if ( y>=500 ) {
        estado = "Izq";
      }
    } else if ( estado.equals("Izq") ) {
      x -= paso;
      if ( x<= 100 ) {
        estado = "Arriba";
      }
    } else if ( estado.equals("Arriba") ) {
      y -= paso;
      if ( y<= 100 ) {
        estado = "Quieto";
      }
    } else if ( estado.equals("Quieto") ) {
    }
  }
}

