%x COMENTARIO
short int cont;
map defines[];

%% 

"/*" {BEGIN(COMENTARIO);}
<COMENTARIO>. ;
<COMENTARIO>[ \t]*\n ;
<COMENTARIO>"*/"[ \t]*\n* {BEGIN(INITIAL);}

^[ ]*"//".*\n		;
"//".*				;
^" "*\n				;
^" "+	fprintf(yyout,"%s",yytext);
" "+	fprintf(yyout,"%s"," "); 
" "+$				; 
"#include".*\n*		;

"#define".
{
	struct map kv;
	int keyCont = 0;
	int flag = 0;
	int limit = sizeof(yytext);
	char* key = '';
	int value = 0;

	for(int k=0; k<limit; k++){
		if(yytext[k]==" ") flag=1;
		if(yytext[k]!=" " && flag==1){
			kv.key[keyCont] = yytext[k];
			keyCont++;
		}
		if(flag==1 && yytext[k]==" " && keyCont>0) flag=2;
		if(flag==2 && yytext[k]!=" ") kv.value = atoi(yytext[k]);
	}
};

%% 
#include <stdio.h>
struct map{
   char* key;
   int value;};
int yywrap(){ return 1; }
int main(int argc,char *argv[])
{ 
	yyin=fopen(argv[1],"r");
	yyout=fopen(argv[2],"w");
    while (yylex());
}
