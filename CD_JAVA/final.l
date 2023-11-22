%{
#include<stdio.h>
#include "final.tab.h"
%}

%%
[0-9]+ {return NUM;}
[0-9]+"."[0-9]+ {return NUM;}
([*=(){}/%;]|"+"|","|"-"|".") {return yytext[0];}
"class" {return CLASS;}
"import" {return IMPORT;}
"public" {return PUBLIC;}
"private" {return PRIVATE;}
"protected" {return PROTECTED;}
"static" {return STATIC;}
"int" {return INT;}
"double" {return DOUBLE;}
"char" {return CHAR;}
"boolean" {return BOOLEAN;}
"String" {return STRING;}
"float" {return FLOAT;}
"void" {return VOID;}
"true" {return TRUE;}
"false" {return FALSE;}
\"[^"]*\" {return STRINGLIT;}
'[^']?' {return CHARLIT;}
[_$a-zA-Z][a-zA-Z0-9_$]* {return IDENTIFIER;}
%%

int yywrap()
{
	return 1;
}
