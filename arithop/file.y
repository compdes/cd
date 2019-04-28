%{
#include<stdio.h>
#include<stdlib.h>
%}

%token id num arop
%left '/' '*' 
%left '-' '+' 

%%

stmt : expn { printf("statement recognized"); };

expn : expn arop expn {
		switch($2){
		case '+':$$=$1+$3;
			break;
		case '-':$$=$1-$3;
			break;
		case '/':$$=$1/$3;
			break;
		case '*':$$=$1*$3;
			break;

		}		
		printf("AROP. Result:%d",$$); };

expn : num { };

%%
void main()
{
 printf("Enter expr");
 yyparse();
}

yyerror()
{
 exit(1);
}
