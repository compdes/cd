%{
#include<stdio.h>
#include<stdlib.h>
char * val;
%}

%token id num LE LT GE GT EQ NE
%left '<' '>'
%left "<=" ">="
%left "!=" "=="

%%

stmt : expn { printf("statement recognized\n"); };

expn : expn LT expn {
			if($1<$3)
				val="true";
			else
				val="false";
		printf("RelationalOP:<. Result:%s\n",val);
			};

expn : expn GT expn {
			if($1>$3)
				val="true";
			else
				val="false";
		printf("RelationalOP:>. Result:%s\n",val);
			};
expn : expn LE expn {
			if($1<=$3)
				val="true";
			else
				val="false";
		printf("RelationalOP:LE. Result:%s\n",val);
			};
expn : expn GE expn {
			if($1>=$3)
				val="true";
			else
				val="false";
		printf("RelationalOP:GE. Result:%s\n",val);
			};
expn : expn EQ expn {
			if($1==$3)
				val="true";
			else
				val="false";
		printf("RelationalOP:EQ. Result:%s\n",val);
			};
expn : expn NE expn {
			if($1!=$3)
				val="true";
			else
				val="false";
		printf("RelationalOP:NE. Result:%s\n",val);
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
