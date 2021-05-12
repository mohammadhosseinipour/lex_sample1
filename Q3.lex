%{ 
#include <stdio.h> 
#include <string.h>
int line_counter=0, char_num=0, i=0,len1=0, len2=0 ,j=0; 
%} 
alpha    [a-zA-Z]
digit      [0-9]
/*Rule Section*/
%% 
\n {line_counter++; char_num++;}//line counter
(A-Z)({alpha}|{digit})* {
	len1=strlen(yytext);j++;} 
([a-zA-Z0-9])* {len2=strlen(yytext);i++;}
. {char_num++;}     //characters counter
%% 
  
int yywrap() 
{ 
	return 1; 
} 

int main(int argc,char* argv[]) 
{ 
    extern FILE *yyin; 
    yyin=fopen(argv[1], "r");
    yylex(); 
    printf("number of words=%d\n", i+j);
    printf("number of lines=%d\n", line_counter+1);   
    printf("number of captal=%d\n", j); 
    printf("number of other characters=%d\n", char_num+len1+len2); 
      
} 