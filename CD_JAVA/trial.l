%{
#include<stdio.h>
#include "trial.tab.h"
%}

%%
[0-9]+ {return NUM;}
[0-9]+"."[0-9]+ {return NUM;}
([*=(){}/%;]|"+"|","|"-"|".") {return yytext[0];}
"class" {return CLASS;}
[a-zA-Z_$][a-zA-Z0-9_$]* {return IDENTIFIER;}
%%

int yywrap()
{
	return 1;
}
