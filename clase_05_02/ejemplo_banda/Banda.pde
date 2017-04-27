

class Banda {

  String estado;

  float x, y;
  float w, h;

  float vel, dir;

  Banda() {

    estado = "recto";
    x = 100;
    y = 300;
    w = 30;
    h = 50;
    dir = 0;
    vel = 5;
  }

  void actualizar() {
    if ( estado.equals( "recto" ) ) {

      float dx = vel * cos( dir );
      float dy = vel * sin( dir );
      x += dx;
      y += dy;
    } else if ( estado.equals( "horario" ) ) {

      float pasoAngular = radians( 4 );
      //paso 1
      float angB = dir+radians(90);      
      float xB = x + h/2 * cos( angB ); 
      float yB = y + h/2 * sin( angB );

      //paso 2
      dir += pasoAngular;

      //paso 3
      float angC = dir-radians(90);      
      float xC = xB + h/2 * cos( angC ); 
      float yC = yB + h/2 * sin( angC );

      //paso 4
      x = xC + vel * cos( dir );
      y = yC + vel * sin( dir );
      
    } else if ( estado.equals( "anti" ) ) {

      float pasoAngular = radians( 4 );
      //paso 1
      float angB = dir-radians(90);      
      float xB = x + h/2 * cos( angB ); 
      float yB = y + h/2 * sin( angB );

      //paso 2
      dir -= pasoAngular;

      //paso 3
      float angC = dir+radians(90);      
      float xC = xB + h/2 * cos( angC ); 
      float yC = yB + h/2 * sin( angC );

      //paso 4
      x = xC + vel * cos( dir );
      y = yC + vel * sin( dir );
    }
  }

  void girarHorario() {
    estado = "horario";
  }

  void girarAntiHorario() {
    estado = "anti";
  }

  void dibujar() {

    rectMode( CENTER );
    noFill();
    pushMatrix();
    translate( x, y );
    rotate( dir );
    rect( 0, 0, w, h );
    popMatrix();
  }
}