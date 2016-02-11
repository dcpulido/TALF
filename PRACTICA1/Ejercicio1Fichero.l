%{ 
   int num_secuencias_mayus = 0, num_secuencias_minus  = 0,num_secuencias_mezcla=0,num_enteros = 0,num_reales=0,suma_enteros=0;
   float suma_reales=0;
%} 

%% 
[A-Z]+ num_secuencias_mayus++;
[a-z]+ num_secuencias_minus++;
[a-zA-Z]+ num_secuencias_mezcla++;
[0-9]+ {
	num_enteros++;
	suma_enteros+=atoi( yytext );
}
([0-9]+[\.|,][0-9]*)|([0-9]*[\.|,][0-9]+)|([0-9]+) {
	num_reales++;
	suma_reales+= atof(yytext);
}  
^\n ;
. ;
%% 

int yywrap() 
{ 
    return 1; 
} 

main(int argc,char *argv[]) 
{ 
	printf("%s",argv[1]);
	yyin=fopen(argv[1],"r");
    while (yylex());
    printf("num_secuencias_mayus= %d,num_secuencias_minus=%d, num_secuencias_mezcla=%d, num_enteros=%d, num_reales=%d, suma_enteros=%d, suma_reales= %f\n", num_secuencias_mayus,num_secuencias_minus,num_secuencias_mezcla,num_enteros,num_reales, suma_enteros,suma_reales); 
} 
