
%{ 
   int num_lineas = 0, num_caracteres = 0; 
%} 

%% 

\n  num_lineas++; num_caracteres++; 
.   num_caracteres++; 

%% 

int yywrap() 
{ 
    return 1; 
} 

main() 
{ 
    while (yylex()); 
    printf("No. lineas = %d, No. caracteres = %d\n", num_lineas, num_caracteres); 
} 
