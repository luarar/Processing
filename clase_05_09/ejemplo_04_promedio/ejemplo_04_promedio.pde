import oscP5.*;
import netP5.*;

boolean monitor = false;

OscP5 oscP5;
int puerto;

GestorSenial altura;

float inFrec;
float inAmp;

float angulo;



//----------------------------

void setup() {
  size( 800, 600 );
  smooth();

  altura = new GestorSenial( 46, 70 );

  puerto = 12000;
  oscP5 = new OscP5( this, puerto ); // Entrada: mensajes de entrada por el puerto especificado
}
//----------------------------

void draw() {

  altura.actualizar( inFrec );

  float diam = altura.filtradoNorm() * 300;

  if ( altura.derivadaNorm() > 0.2 ) {
    angulo += 5;
  }
  else if ( altura.derivadaNorm() < -0.2 ) {
    angulo -= 5;
  }


  background( 0 );
  pushMatrix();
  translate( width/2, height/2 );
  rotate( radians( angulo ));
  rectMode( CENTER ); 

  rect( 0, 0, 200, 200 );
  popMatrix();

  if ( monitor ) {
    altura.imprimir( 50, 50, 600, 200, false, false, true, true );
  }
}
//----------------------------

void oscEvent(OscMessage theOscMessage) {

  if (theOscMessage.checkAddrPattern("/datos")==true) {

    if (theOscMessage.checkTypetag("f")) {
      inFrec = theOscMessage.get(0).floatValue();
    }
  }
  else if (theOscMessage.checkAddrPattern("/vel")==true) {

    if (theOscMessage.checkTypetag("f")) {
      inAmp = theOscMessage.get(0).floatValue();
    }
  }
}

