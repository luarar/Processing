import oscP5.*;
import netP5.*;

OscP5 oscP5;
int puerto;

GestorSenial altura;

float inFrec;
float inAmp;

//----------------------------

void setup() {
  size( 800, 600 );
  smooth();

  altura = new GestorSenial( 46 , 70 );

  puerto = 12000;
  oscP5 = new OscP5( this, puerto ); // Entrada: mensajes de entrada por el puerto especificado
}
//----------------------------

void draw() {

  altura.actualizar( inFrec );

  float gris = map( inFrec, 46, 70, 0, 255 );
  
  float diam = altura.filtradoNorm() * 300;

  background( gris );
  ellipse( width/2, height/2, diam, diam );

  println( "Amp="+inAmp+"    | Frec="+inFrec );

  altura.imprimir( 50, 50, 600, 200 , true , false , false , false );
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

