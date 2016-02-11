
%start COMENTARIO

%% 
"/*" {BEGIN(COMENTARIO);}
<COMENTARIO>. ;
<COMENTARIO>\n ;
<COMENTARIO>"*/" {BEGIN(INITIAL);}
"//".* ;
^\n ;
%% 

int yywrap() 
{ 
    return 1; 
} 

main(int argc,char *argv[]) 
{ 
	printf("%s",argv[1]);
	yyin=fopen(argv[1],"r");
	yyout=fopen(argv[2],"w");
    while (yylex());
} 