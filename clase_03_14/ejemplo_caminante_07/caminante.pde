


class Caminante {

  float vel;
  float dir;

  float x, y;
  float t;

  float f = 0.95;

  float nuevaDir;
  //-----------------------------

  Caminante() {
    x = 100;
    y = 100;
    t = 20;
  }
  //-----------------------------

  Caminante( float x, float y ) {
    this.x = x;
    this.y = y;
    t = 20;

    vel = 2;    
    dir = random( TWO_PI );
    nuevaDir = dir;
  }
  //-----------------------------

  Caminante( float x_, float y_, float t_ ) {
    x = x_;
    y = y_;
    t = t_;
  }
  //-----------------------------

  void dibujar() {
    ellipse( x, y, t, t );
  }  
  //-----------------------------

  void mover() {


    float distanciaAngular = menorDistAngulos( dir, nuevaDir );
    
    dir = distanciaAngular * (1-f) + dir;
    
    //dir = nuevaDir * (1-f) + dir * f;

    

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

  void perseguir( float xo, float yo ) {

    nuevaDir = atan2( yo-y, xo-x );
  }
  //-----------------------------

  void huir( float xo, float yo ) {

    nuevaDir = atan2( yo-y, xo-x ) + radians(180);
  }
  //-----------------------------
}

