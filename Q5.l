
%{ 
#include<stdio.h> 
#include<string.h> 
%} 


%% 
"int"" "*[a-zA-Z_][a-zA-Z0-9_]*" "*=" "*[0-9]+; {printf("%s \n", yytext);}
"float"" "*[a-zA-Z_][a-zA-Z0-9_]*" "*=" "*([0-9]+|[0-9]+\.[0-9]+); {printf("%s \n", yytext);}
"bool"" "*[a-zA-Z_][a-zA-Z0-9_]*" "*=" "*(true|false|[0-9]); {printf("%s \n", yytext);}
"char"" "*[a-zA-Z_][a-zA-Z0-9_]*" "*=" "*\'[a-zA-z]\'; {printf("%s \n", yytext);}
"string"" "*[a-zA-Z_][a-zA-Z0-9_]*" "*=" "*\".*\"; {printf("%s \n", yytext);}

. {} 	
%% 


int yywrap() 
{ 
	return 1; 
} 

int main(int argc,char* argv[]) 
{ 
		
		
		extern FILE *yyin, *yyout; 
		
	yyin=fopen(argv[1], "r"); 

		yylex(); 
} 
