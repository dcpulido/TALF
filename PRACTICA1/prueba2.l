%{ 
   #include <stdio.h>    /* Incluye el protopipo de la funcion putchar() */ 
%} 

%% 

^\n        ;              /* Lineas en blanco */ 
^" "+\n    ;              /* Lineas solo con espacios */ 
^" "+      ;              /* Espacios al principio de la linea */ 
" "+$      ;              /* Espacios al final de la linea */  
" "+       putchar(' ');  /* Sustituir multiples espacios por uno solo */  

%% 