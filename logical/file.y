%{
#include<stdio.h>
#include<stdlib.h>
char * val;
%}

%token id num AND OR NOT
%left '<' '>'
%left "<=" ">="
%left "!=" "=="

%%

stmt : expn { printf("statement recognized\n"); };

expn : expn AND expn {
			$$=$1 && $3;
		printf("LogicalOp. Result:%d\n",$$);
			};

expn : expn OR expn {
			$$=$1 || $3;
		printf("LogicalOP. Result:%d\n",$$);
			};
expn : NOT expn {
			$$=!$2;
		printf("LogicalOP. Result:%d\n",$$);
			};


expn : num { };

%%
void main()
{
 printf("Enter expr\n");
 yyparse();
}

yyerror()
{
 printf("Error");
 exit(1);
}
