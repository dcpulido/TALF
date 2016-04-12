%{ /* Codigo C */
  #include <stdlib.h>
  #include <malloc.h>
  #include <string.h>
  #include "calc.tab.h"
%}

DIGITO [0-9]
LETRA [A-Za-z]

%%

{DIGITO}+                       { yylval.valor_entero = atoi(yytext);
                                  return (CONSTANTE_ENTERA);
                                  }

{DIGITO}+\.{DIGITO}+            { yylval.valor_real = atof(yytext);
                                  return (CONSTANTE_REAL);
                                  }

"+"|"-"|"*"|"/"|"="|"^"             return (yytext[0]);

"\n"                            return (yytext[0]);

{LETRA}({LETRA}|_)*             { yylval.texto = (char *) malloc (strlen(yytext) + 1);
                                  strcpy(yylval.texto, yytext);
                                  return (IDENTIFICADOR);
                                  }

.                               ;

%%
