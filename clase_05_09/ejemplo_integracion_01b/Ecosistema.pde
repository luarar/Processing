

class Ecosistema {

  ArrayList <Circulo> circulos;

  String estado;
  Circulo actual;

  Ecosistema() {

    circulos = new ArrayList();
    estado = "espera";
  }

  void actualizar( boolean estimulo ) {

    if ( estado.equals( "espera" )) {

      if ( estimulo ) {
        estado = "genera";

        actual = new Circulo();
        circulos.add( actual );
      }
    } else if ( estado.equals( "genera" )) {

      if ( !estimulo ) {
        actual.dejarDeCrecer();
        estado = "espera";
      }
    }

    for ( Circulo c : circulos ) {
      c.actualizar();
    }
  }

  void dibujar() {

    for ( Circulo c : circulos ) {
      c.dibujar();
    }
  }
}

