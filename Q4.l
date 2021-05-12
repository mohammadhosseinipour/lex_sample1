// educated from geeksforgeeks
%{ 
#include<stdio.h> 
#include<string.h> 

char replace_with [] = "a"; 
char replace [] ="b"; 
%} 

%% 
[a-zA-Z]+ { if(strcmp(yytext, replace)==0) 
			{
				fprintf(yyout, "%s", replace_with); 
			}	
			else
			{
				fprintf(yyout, "%s", yytext);
			}
			} 
.		 fprintf(yyout, "%s", yytext); 
%% 


int yywrap() 
{ 
	return 1; 
} 

int main(int argc,char* argv[]) 
{ 
		strcpy(replace_with, argv[3]);
		strcpy(replace, argv[2]);
		extern FILE *yyin, *yyout; 
	yyin=fopen(argv[1], "r"); 

		/* open the output file 
		in write mode */
	yyout=fopen("output.txt", "w"); 
	
		yylex(); 
		printf("done!");
} 
