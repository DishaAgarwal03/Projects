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

%name fisac

%left '+' '-'
%left '*' '/' '%'

%%
prog : importst classdecl ; 

importst : IMPORT import_clause ';' importst |  ;
import_clause : package_name'.'type_name ;
package_name : IDENTIFIER more_package_parts ;
more_package_parts : '.'IDENTIFIER more_package_parts |  ;
type_name : IDENTIFIER | '*' ;

classdecl : CLASS IDENTIFIER '{' classbody '}' ;
classbody : classmember classbody |  ;
classmember : instancevar | methoddecl ;

instancevar : accessmod stat dtype IDENTIFIER initialise ';' ;
accessmod : PUBLIC | PRIVATE | PROTECTED |  ;
stat : STATIC |  ;
dtype : INT | DOUBLE | CHAR | BOOLEAN | STRING | FLOAT ;
initialise : '=' literal |  ;

methoddecl : accessmod stat rtype IDENTIFIER '(' paramlist ')' '{' statement_list '}' ;
paramlist : dtype IDENTIFIER moreparam |  ;
moreparam : ',' dtype IDENTIFIER moreparam |  ;
rtype : VOID | dtype ;
statement_list : statement statement_list |  ;
statement : decl ';' | assign_stat ';' ;

decl : dtype IDENTIFIER ;
assign_stat : decl '=' term | IDENTIFIER '=' term ;

expn : NUM | IDENTIFIER | CHARLIT | expn arithop expn | '('expn')' ;
term : expn | TRUE | FALSE | STRINGLIT ;
arithop : '+' | '-' | '*' | '/' | '%' ;
literal : NUM | IDENTIFIER | CHARLIT | STRINGLIT | TRUE | FALSE ;
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
		if(yyparse())
			printf("\nFailed\n");
	} while (!feof(yyin));
	printf("SUCCESS");
}