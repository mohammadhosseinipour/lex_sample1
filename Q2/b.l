/*Definition Section*/ 
%{
 #include <stdio.h>
 #include <stdlib.h>
 #include <string.h> 
 char str1[30];
%}

/*Rule Section*/ 
%%
\/\*(.|\n)*\*\/ {}
\/\/(.*) {}
%%

int yywrap()
{
 return 1; 
}

int main()
{
scanf("%s",&str1);
yyin=fopen(str1,"r"); 
yyout=fopen("out.cpp","w"); 
yylex(); 
}