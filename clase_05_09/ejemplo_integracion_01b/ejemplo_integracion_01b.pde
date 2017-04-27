//importo la librería de OSC
import oscP5.*;
import netP5.*;



//objeto para recibir OSC
OscP5 oscP5;
int puerto;

float inFrec;
float inAmp;
//----------------------------------
GestorSenial gestorFrec;
GestorSenial gestorAmp;

Ecosistema e;


void setup() {
  size( 800, 600 );

  //numero de puerto de OSC
  puerto = 12000;
  //inicializo el OSC
  oscP5 = new OscP5( this, puerto ); // Entrada: mensajes de entrada por el puerto especificado

    gestorFrec = new GestorSenial( MINIMO_ENTRADA_FRECUENCIA, 
  MAXIMO_ENTRADA_FRECUENCIA );

  gestorAmp = new GestorSenial( MINIMO_ENTRADA_AMPLITUD, 
  MAXIMO_ENTRADA_AMPLITUD );

  e = new Ecosistema();
}
void draw() {


  //actualizo el gestor de freciencia con el valor de entrada
  gestorFrec.actualizar( inFrec );  
  gestorAmp.actualizar( inAmp );


  //transformo la intensidad de la voz en evento
  float valorAmplitud = gestorAmp.filtradoNorm();
  boolean estoyCantando = valorAmplitud > 0.2;

  background( 100 );
  //gestorFrec.imprimir( 100, 100 );
  gestorAmp.imprimir( 100, 300 );

  e.actualizar( estoyCantando );
  e.dibujar();
}

//funcion del evento de recepcion de OSC
void oscEvent(OscMessage theOscMessage) {

  //pregunta por la etiqueta del mensaje
  if ( theOscMessage.checkAddrPattern("/datos") ) {

    //pregunta si es flotante
    if ( theOscMessage.checkTypetag("f")) {
      inFrec = theOscMessage.get(0).floatValue();
    }
    //pregunta por la etiqueta "vel"
  } else if ( theOscMessage.checkAddrPattern("/vel") ) {

    //pregunta si es flotante
    if (theOscMessage.checkTypetag("f")) {
      inAmp = theOscMessage.get(0).floatValue();
    }
  }
}

