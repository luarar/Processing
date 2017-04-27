
class Caminante{
  
  float vel;
  float dir;
  
  float x,y;
  float t;
  //-----------------------------
  
  Caminante(){
    x = 100;
    y = 100;
    t = 20;
  }
  //-----------------------------
  
  Caminante( float x , float y ){
    this.x = x;
    this.y = y;
    t = 20;
    
    vel = 2;
    dir = radians( 170 );
  }
  //-----------------------------
  
  Caminante( float x_ , float y_ , float t_ ){
    x = x_;
    y = y_;
    t = t_;
  }
  //-----------------------------
  
  void dibujar(){
    ellipse( x , y , t , t );
  }  
  //-----------------------------
  
  void mover(){
    
    dir += radians( random(-10,10) );
     
    float dx = vel * cos( dir );
    float dy = vel * sin( dir );
    
    float xn = x+dx;
    float yn = y+dy;
    
    x = xn;
    y = yn;
    
    //espacio toroidal
    x = ( x>width ? x-width : x );
    x = ( x<0 ? x+width : x );
    y = ( y>height ? y-height : y );
    y = ( y<0 ? y+height : y );
    
  }
  //-----------------------------
}
