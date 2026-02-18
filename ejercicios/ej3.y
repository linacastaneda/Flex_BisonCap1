/* Ejercicio 3 – Calculadora con && y || */

%{
#include <stdio.h>

int yylex(void);
void yyerror(const char *s);
%}

%token NUMBER
%token ADD SUB MUL DIV
%token AND OR
%token EOL

%%

calclist:
      /* empty */
    | calclist expr EOL     { printf("= %d\n", $2); }
    ;

expr:
      or_exp
    ;

or_exp:
      and_exp
    | or_exp OR and_exp     { $$ = $1 || $3; }
    ;

and_exp:
      add_exp
    | and_exp AND add_exp   { $$ = $1 && $3; }
    ;

add_exp:
      mul_exp
    | add_exp ADD mul_exp   { $$ = $1 + $3; }
    | add_exp SUB mul_exp   { $$ = $1 - $3; }
    ;

mul_exp:
      term
    | mul_exp MUL term      { $$ = $1 * $3; }
    | mul_exp DIV term      { $$ = $1 / $3; }
    ;

term:
      NUMBER
    ;

%%

int main(void)
{
    return yyparse();
}

void yyerror(const char *s)
{
    fprintf(stderr, "error: %s\n", s);
}


