/*
 * Ejemplo de programa C
 * 
 * 
 */

#include <stdlib.h>
#include <stdio.h>


/* Definiciones */
#define                 TRUE  1
#define FALSE 0

/* Estructuras */
struct prueba   {
   int a;     // campo a
   int b;     // campo b
   char * c;  // campo c
} 
 

/*
 * Programa principal
 */
 
int main(int argc, char ** argv) {
   int a,z; // variable a
   double b; // varible b
   char * c = "cadena    de   prueba \n     ocupa 2 lineas  \n";
   
   // inicializacion
   a = 2;
   b = 3.0;   
   z = TRUE;
   
   
   // cuerpo
   if (a > 1) {
      a = 4;
   }
   else {
      a = funcion(b,    c, FALSE);
   }
   
   
}


/*
 * Funcion auxiliar
 */
int funcion(double x,     char * y){
   
   
        return(x*x);
}
