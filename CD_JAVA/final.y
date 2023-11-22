%{
#include<stdio.h>
#include<stdlib.h>
#include<string.h>
int yylex();
int yyerror();
extern FILE* yyin;
%}

%name final
%token NUM IDENTIFIER NL STRINGLIT CHARLIT
%token CLASS IMPORT
%token PUBLIC PRIVATE PROTECTED STATIC
%token INT DOUBLE CHAR BOOLEAN STRING FLOAT
%token VOID TRUE FALSE 
%left '+' '-'
%left '*' '/' '%'

%%

prog : importst classdecl ;

importst : IMPORT import_clause ';' importst |  ;
import_clause : IDENTIFIER '.' package_name ;
package_name : IDENTIFIER more_package_parts| '*' ;
more_package_parts : '.' package_name|  ;

classdecl : CLASS IDENTIFIER '{' classbody '}' ;
classbody : classmember classbody |  ;
classmember : accessmod stat dtype IDENTIFIER mem | accessmod stat VOID IDENTIFIER methoddecl;
accessmod : PUBLIC | PRIVATE | PROTECTED |  ;
stat : STATIC |  ;
dtype : INT | DOUBLE | CHAR | BOOLEAN | STRING | FLOAT ;
mem : instancevar | methoddecl ;

instancevar : initialise ';';
initialise : '=' literal |  ;

methoddecl : '(' paramlist ')' '{' statement_list '}' ;
paramlist : dtype IDENTIFIER moreparam |  ;
moreparam : ',' dtype IDENTIFIER moreparam |  ;
statement_list : statement statement_list |  ;
statement : decl ';' | assign_stat ';' ;
decl : dtype IDENTIFIER assign moreid ;
moreid : ',' IDENTIFIER assign moreid |  ;
assign : '=' val |  ;
assign_stat : IDENTIFIER '=' val ;

val : expn | STRINGLIT | TRUE | FALSE ;
expn : expn '+' term | expn '-' term | term ;
term : term '*' factor | term '/' factor | term '%' factor | factor ;
factor : NUM | IDENTIFIER | CHARLIT | '(' expn ')' ; 
literal : NUM | CHARLIT | STRINGLIT | TRUE | FALSE ;
%%


int yyerror(char *msg)
{
	printf("************* %s *************\n",msg);
	exit(0);
}
void main (int argc, char *args[])
{
	yyin=fopen(args[1],"r");
	if(!yyin)
	{
		yyerror("File Error");
	}
	do
	{
		if(yyparse())
			yyerror("Parse");
	} while (!feof(yyin));
	printf("************* SUCCESS *************\n");
}
