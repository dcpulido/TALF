

%{
struct map{
   char* key;
   char* value;
};
void coverMap(char*, int);
int limit=0;
int contMap=0;
struct map values;
%}


%% 
"#define".* {coverMap(yytext,yyleng);}
%% 

#include <stdio.h>


int yywrap(){ return 1; }
int main(int argc,char *argv[])
{ 
	yyin=fopen(argv[1],"r");
	yyout=fopen(argv[2],"w");
    while (yylex());
}
void coverMap(char* pair, int limit){
	char* linea=(char*) malloc(limit);
	strcpy(linea,pair);
	fprintf(yyout,"linea:%s tamaño:%u ",linea,limit);
	char key[10];
	char* value;
	int cont=0;
	int flag1=0;
	int flag2=0;
	int flag3=0;
	int k=0;
	

	for(;k<limit;k++){
		fprintf(yyout,"%c ",linea[k]);

		if(linea[k]=='#'){
			flag1=1;
		}
	
		if((flag1==1)&&(linea[k]==' ')){
			flag2=1;
		}
	//PARTE AKI(EN estatico no falla)
		if((flag2==1)&&(linea[k]!=' ')&&(flag3==0)){
			key[cont]=linea[k];
			fprintf(yyout," %c",key[cont]);
			cont=cont+1;
		}
	}
	/*
		if((flag2==1)&&(cont>0)&&(linea[k]==' ')){
			flag3=1;
			cont=0;
		}
		if((flag3==1)&&(linea[k]!=' ')){
			value[cont]=linea[k];
		}
		linea++;
	}
/*
	fprintf(yyout,"esta es la key :%s",key);
	//values.key=key;
	//fprintf(yyout,"%s",values.key);*/

}
