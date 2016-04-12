%{ /* Codigo C */
#include <stdio.h>
#include <math.h>
#include "diccionario.h"
DICCIONARIO diccionario; /* variable global para el diccionario */
%}

/* Declaraciones de BISON */
%union {
  int valor_entero;
  double valor_real;
  char * texto;
}

%token <valor_real> CONSTANTE_REAL
%token <valor_entero> CONSTANTE_ENTERA
%token <texto> IDENTIFICADOR

%left '-' '+'
%left '*' '/'
%right '^'
%type <valor_real> expresion

%%
/* Gramatica */
lineas: /* cadena vacia */
  | lineas linea
;

linea: '\n'
  | IDENTIFICADOR '=' expresion '\n' { insertar_diccionario(&diccionario, $1, $3); }
  | expresion '\n'                   { printf ("resultado: %f\n", $1); }
  | error '\n'                       { yyerrok;}
;

expresion: CONSTANTE_REAL            { $$ = $1; }
  | CONSTANTE_ENTERA                 { $$ = (double) $1; }
  | IDENTIFICADOR                    { ENTRADA * entrada = buscar_diccionario(&diccionario,$1);
                                       if (entrada != NULL) { $$ = entrada->valor; }
                                       else { printf("ERROR: variable %s no definida\n", $1); $$ = 0; } }
  | expresion '+' expresion          { $$ = $1 + $3; }
  | expresion '-' expresion          { $$ = $1 - $3; }
  | expresion '*' expresion          { $$ = $1 * $3; }
  | expresion '/' expresion          { $$ = $1 / $3; }
  | expresion '^' expresion          { $$ = pow($1,$3);}
  | '(' expresion ')'                { $$ = $2;}
;

%%

int main(int argc, char** argv) {
  inicializar_diccionario(&diccionario);
  yyparse();
  liberar_diccionario(&diccionario);
}

yyerror (char *s) { printf ("%s\n", s); }

int yywrap() { return 1; }

