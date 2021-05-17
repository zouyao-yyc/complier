%{
#include <stdio.h>
%}
INT_DEX [1-9][0-9]*
INT_HEX [0][Xx][0-9a-fA-F]+
INT_OCT [0][0-7]*
CONST const
SEMI [;]
COMMA [,]
ASSIGNOP [=]
RELOP [>]|[<]|[>][=]|[<][=]|[=][=]|[!][=]
PLUS [+]
MINUS [-]
STAR [*]
DIV [/]
MOD [%]
AND [&][&]
OR [|][|]
NOT [!]
TYPE int|void
LP \(
RP \)
LB \[
RB \]
LC \{
RC \}
RETURN return
IF if
ELSE else 
WHILE while
BREAKE break
CONTINUE continue
SPACE [ \n\t]
ID [a-zA-Z_][a-zA-Z_0-9]*
COMMENTS "/*"([^\*]|(\*)*[^\*/])*(\*)*"*/"
SINGLE_COMMENT "//"[^\n]*
ERROR .
%%
{SEMI} {
    printf("get semmi : %s\n", yytext);

}

{COMMA} {
    printf("get comma : %s\n", yytext);
}
{ASSIGNOP} {
    printf("get assignop : %s\n", yytext);
}

{INT_DEX} |
{INT_HEX} |
{INT_OCT} {
    printf("get an integer: %s\n", yytext);
}

{CONST} {
	printf("get a CONST: %s\n", yytext);
}

{PLUS} | 
{MINUS} |
{DIV} |
{STAR} |
{MOD} {
    printf("get an operator: %s\n", yytext);
}

{RELOP} {
    printf("get a relop: %s\n", yytext);
}

{AND} |
{OR} |
{NOT} {
    printf("get a logic operator: %s\n", yytext);
}


{RETURN} |
{IF} |
{ELSE} |
{WHILE} |
{BREAKE} |
{CONTINUE} {
    printf("get keyword: %s\n", yytext);
}

{TYPE} {
    printf("get type: %s\n", yytext);
}

{LP} |
{RP} |
{LB} |
{RB} |
{LC} |
{RC} {
    printf("get brackets : %s\n", yytext);
}

{SPACE} {

}

{ID} {
    printf("get an ID: %s\n", yytext);
}

{COMMENTS} |
{SINGLE_COMMENT} {
	printf("\n注释内容：\n%s\n\n", yytext);
}

{ERROR} {
	printf("error character：%s\n", yytext);
}
%%
int yywrap() {
  return 1;
}

int main(int argc, char** argv) {
   if (argc > 1) {
       if (!(yyin = fopen(argv[1], "r"))) {   
           perror(argv[1]);
           return 1;
       }
   }
   while (yylex());
   return 0;
}   