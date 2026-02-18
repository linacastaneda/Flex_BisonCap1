/* recognize tokens for the calculator and print them out */
%{
#include <stdio.h>
#include <stdlib.h>

enum yytokentype {
    NUMBER = 258,
    ADD,
    SUB,
    MUL,
    DIV,
    ABS,
    EOL
};

int yylval;
%}

%%
"+"     { return ADD; }
"-"     { return SUB; }
"*"     { return MUL; }
"/"     { return DIV; }
"|"     { return ABS; }
[0-9]+  { yylval = atoi(yytext); return NUMBER; }
\n      { return EOL; }
[ \t]   { /* ignore whitespace */ }
.       { printf("Mystery character %c\n", *yytext); }
%%

int main(void)
{
    int tok;
    while ((tok = yylex())) {
        printf("Token: %d", tok);
        if (tok == NUMBER)
            printf(" = %d", yylval);
        printf("\n");
    }
    return 0;
}
