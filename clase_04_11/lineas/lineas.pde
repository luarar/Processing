

float x1 = 400;
float y1 = 400;
float x2 = 700;
float y2 = 300;
float x3 = 500; 
float y3 = 100;

int cantidad = 20;

size( 800, 600 );

line( x1, y1, x2, y2 );
for ( int i=0; i<cantidad; i++ ) {
  float xm = map(i,0,cantidad,x2,x3);
  float ym = map(i,0,cantidad,y2,y3);
  line( x1, y1, xm, ym );
}
line( x1, y1, x3, y3 );

