%{
#include<stdio.h>
#include<stdlib.h>
int yylex();
int yyerror();
extern FILE* yyin;
%}
%token NUM IDENTIFIER NL STRINGLIT CHARLIT
%token CLASS IMPORT
%token PUBLIC PRIVATE PROTECTED STATIC
%token INT DOUBLE CHAR BOOLEAN STRING FLOAT
%token VOID TRUE FALSE 
%left '+' '-'
%left '*' '/' '%'

%%

prog : CLASS IDENTIFIER '{' '}' ; 

%%


int yyerror(char *msg)
{
	printf("Error !!!\n%s\n",msg);
	exit(0);
}
void main (int argc, char *args[])
{
	yyin=fopen(args[1],"r");
	if(!yyin)
	{
		yyerror("FILE error\n");
	}
	do
	{
        printf("ENtered ");
		if(yyparse())
			printf("\nFailed\n");
        printf("Parsing ");
	} while (!feof(yyin));
	printf("SUCCESS");
}
