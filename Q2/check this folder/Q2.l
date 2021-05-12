%{
// Definitions
	#include <stdio.h>
	#include <stdbool.h>
	#include <string.h>
	char str1[100];
	char pos[50][2000]={};
	char temp[2000];
	int temp_arr[50];
	int row=0,i=0,flag=0,skip=0;
	
	
	void wtf(char *temp){
	i=0;
	skip=0;
	printf("%s","isgkts");
	while(*(temp+i) != '\\'&&*(temp+i+1) != '\\'&&flag!=1)
	{
		pos[row][i] = temp[i];
		i++;
		if(*(temp+i) == '\\'&&*(temp+i+1) == '\\'&&flag!=1)
			skip=1;
	}
	while(*(temp+i) != '\\'&&*(temp+i+1) != '*'&&flag!=1&&skip!=1)
	{
		pos[row][i] = temp[i];
		i++;
		if(*(temp+i) == '\\'&&*(temp+i+1) == '*'){
			flag=1;
			skip=1;}
	}
	while(*(temp+i) != '*'&&*(temp+i+1) != '\\'&&flag==1&&skip!=1)
	{
		i=i+2;
		if(*(temp+i) == '*'&&*(temp+i+1) == '\\'&&flag==1&&skip!=1)
		{
			flag=0;
			while(*(temp+i) != '\\'&&*(temp+i+1) != '\\'&&flag!=1)
			{
			pos[row][i] = temp[i];
			i++;
			if(*(temp+i) == '\\'&&*(temp+i+1) == '\\'&&flag!=1)
				skip=1;
			}
			while(*(temp+i) != '\\'&&*(temp+i+1) != '*'&&flag!=1&&skip!=1)
			{
			pos[row][i] = temp[i];
			i++;
			if(*(temp+i) == '\\'&&*(temp+i+1) == '*'){
				flag=1;
				skip=1;}
			}
		}
	}
		
	}
%}

%%
. 	{wtf(yytext);	}
\n	{row++;}
%%
int yywrap(){} 

int main(){
scanf("%s",&str1);
	printf("aa");
FILE *f=fopen(str1,"r");
if ( f == NULL ) 
    { 
        printf( " file failed to open." ) ; 
		return 0;
    }
	printf("a");
	yyin = f;
		printf("b");
	fclose(f);
	f=fopen("output2.cpp","w");
	if ( f == NULL ) 
    { 
        printf( " file failed to open." ) ; 
		return 0;
    }
		printf("c");
	for(int i=0;i<50;i++)
	{
		fprintf(f,"%s",pos[i]);
		fprintf(f,"%s","\n");
	}
		printf("d");

}