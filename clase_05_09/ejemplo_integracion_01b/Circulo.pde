

class Circulo{
  
  float x;
  float y;
  float d;
  
  String estado;
  
  Circulo(){
    d = 10;
    x = random( width );
    y = random( height );
    estado = "crece";
  }
  
  void actualizar(){
    if( estado.equals( "crece" ) ){
      d ++;
    }else if( estado.equals( "estatico" ) ){
      
    }
  }
  
  void dibujar(){
    ellipse( x , y , d , d );
  }
  
  void dejarDeCrecer(){
    estado = "estatico";
  }
}
