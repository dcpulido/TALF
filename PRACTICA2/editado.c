#define TRUE 1
#define FALSE 0
struct prueba {
   int a; 
   int b; 
   char * c; 
}
int main(int argc, char ** argv) {
   int a,z; 
   double b; 
   char * c = "cadena de prueba \n ocupa 2 lineas \n";
   a = 2;
   b = 3.0;
   z = TRUE;
   if (a > 1) {
      a = 4;
   }
   else {
      a = funcion(b, c, FALSE);
   }
}
int funcion(double x, char * y){
        return(x*x);
}
