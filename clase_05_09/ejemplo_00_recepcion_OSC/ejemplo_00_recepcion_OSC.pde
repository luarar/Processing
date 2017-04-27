import oscP5.*;
import netP5.*;

OscP5 oscP5;
int puerto;

float inFrec;
float inAmp;

//----------------------------

void setup() {
  size( 800, 600 );
  smooth();
  puerto = 12000;
  oscP5 = new OscP5( this , puerto ); // Entrada: mensajes de entrada por el puerto especificado
  
}
//----------------------------

void draw() {
  
  float gris = map( inFrec , 46 , 70 , 0 , 255 );
  float diam = map( inAmp , 0 , 127 , 20 , 300 );
  
  background( gris );
  ellipse( width/2 , height/2 , diam , diam );
  
  println( "Amp="+inAmp+"    | Frec="+inFrec );
  
  
}
//----------------------------

void oscEvent(OscMessage theOscMessage) {

  if (theOscMessage.checkAddrPattern("/datos")==true) {
    
    if (theOscMessage.checkTypetag("f")) {
      inFrec = theOscMessage.get(0).floatValue();
    }
    
  }else if (theOscMessage.checkAddrPattern("/vel")==true) {
    
    if (theOscMessage.checkTypetag("f")) {
      inAmp = theOscMessage.get(0).floatValue();
    }
  }
}

