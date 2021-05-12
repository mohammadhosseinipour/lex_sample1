%{
	
	#include <stdio.h>
	#include <stdbool.h>
	#include <string.h>
    char pos[100][100][20]={};
	int temp_arr[100];
	int row=0,column=0;
%}

%%
[a-zA-Z]+   {
			strcpy(pos[row][column],yytext);
			column++;
			if(strcmp(yytext,str)==0)
			{	
				str_num++;
				temp_arr[row]=1;
			}
			}
			
\n	{row++;}
%%
int yywrap(){}

int main(){
	FILE *f=fopen("input1.txt","r");
	if ( f == NULL ) 
    { 
        printf( " file failed to open." ) ; 
		return 0;
    }
	scanf("%s",&str);
	yyin = f;
	yylex();
	printf("number of found:%d\n",str_num);
	for(int i=0;i<50;i++)
	{
		if(temp_arr[i]==1)
		{
			printf("%d:",i);
			for(int j=0;j<100;j++)
			{	
				printf("%s ",pos[i][j]);
			}
			printf("\n");
		}
	}
	
}