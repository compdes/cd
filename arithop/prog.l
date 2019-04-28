%{
#include <stdio.h>
#include "y.tab.h"
extern int yylval;
%}
%%
[0-9]+ {yylval = atoi(yytext) ; return num;}
[a-z][a-zA-Z0-9]+ {return id;}
[+-/*] {yylval =yytext[0]; return arop;}
\n {return 0; }
. {return yytext[0]; }
%%
