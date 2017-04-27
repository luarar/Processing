
float x;
float f = 0.95;


void setup(){
  size( 600 , 400 );
  
}
void draw(){
  background( 255 );
  
  x = mouseX * (1-f) + x * f;
  
  line( x , 0 , x , height );
}
