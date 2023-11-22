%{
#include<stdio.h>
%}

%%
[0-9]+ {printf(" NUM");}
[0-9]+"."[0-9]+ {printf(" NUM");}
\n {printf("\n");}
([*=(){}/%;]|"+"|","|"-"|".") {printf(" %c",yytext[0]);}
"class" {printf(" CLASS");}
"import" {printf(" IMPORT");}
"public" {printf(" PUBLIC");}
"private" {printf(" PRIVATE");}
"protected" {printf(" PROTECTED");}
"static" {printf(" STATIC");}
"int" {printf(" INT");}
"double" {printf(" DOUBLE");}
"char" {printf(" CHAR");}
"boolean" {printf(" BOOLEAN");}
"String" {printf(" STRING");}
"float" {printf(" FLOAT");}
"void" {printf(" VOID");}
"true" {printf(" TRUE");}
"false" {printf(" FALSE");}
\"[^"]*\" {printf(" STRINGLIT");}
'[^']?' {printf(" CHARLIT");}
[_$a-zA-Z][a-zA-Z0-9_$]* {printf(" IDENTIFIER");}
%%

int yywrap()
{
	return 1;
}

int main(int argc, char *args[])
{
    yyin=fopen(args[1],"r");
    yylex();
    printf("\n............Done............");
}