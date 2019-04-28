%{
#include <stdio.h>
#include "y.tab.h"
extern int yylval;
%}
%%
[0-9]+ {yylval = atoi(yytext) ; return num;}
[a-z][a-zA-Z0-9]+ {return id;}
("<=") { return LE;}
("<") { return LT;}
(">=") { return GE;}
(">") { return GT;}
("==") { return EQ;}
("!=") { return NE;}
\n {return 0; }
. {return yytext[0]; }
%%
