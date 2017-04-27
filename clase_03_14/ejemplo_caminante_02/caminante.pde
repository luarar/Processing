
class Caminante{
  
  //float vel;
  //float dir;
  
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
     y++; 
     x++;
  }
  //-----------------------------
}
