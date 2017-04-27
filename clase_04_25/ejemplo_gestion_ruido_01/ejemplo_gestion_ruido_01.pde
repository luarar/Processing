
float mx;
float ruido;
float nivelRuido = 20;

GestorSenial gestor; 

void setup() {
  size( 800, 600 );
  //gestor = new GestorSenial( 0 , width );

  gestor = new GestorSenial( "valor mouse", //etiqueta
    0, width, //mínimo y máximo
    200, //tamaño muestras
    0.05, // factor de amortiguación
    30, //amplitud de la derivada
    200, //muestras del promedio
    20 //amplitud varianza
    );
}
void draw() {


  ruido = random( -nivelRuido, nivelRuido );  
  mx = mouseX + ruido;
  gestor.actualizar( mx );

  float filtrada = gestor.filtrado;

  //float filtrada = gestor.filtradoNorm();
  float derivada = gestor.derivadaNorm();

  if ( derivada > 0.1 ) {
    background( 255 );
  } else if ( derivada < -0.1 ) {
    background( 0 );
  } else {
    background( 127 );
  }

  gestor.imprimir( 
    100, 100, //x,y
    600, 100, //ancho y alto
    false, //señal filtrada
    true, 
    false, 
    false
    );

  stroke( 255, 0, 0 );
  line( mouseX, 0, mouseX, height );
  stroke( 255 );
  line( mx, 0, mx, height );
  stroke( 0, 255, 0);
  line( filtrada, 0, filtrada, height );
}