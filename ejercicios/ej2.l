%{
#include "ej2.tab.h"
#include <stdlib.h>
%}

%%

"0x"[0-9a-fA-F]+   { yylval = strtol(yytext, NULL, 16); return NUMBER; }
[0-9]+             { yylval = atoi(yytext); return NUMBER; }

"+"     { return ADD; }
"-"     { return SUB; }
"*"     { return MUL; }
"/"     { return DIV; }
"|"     { return ABS; }

\n      { return EOL; }
[ \t]   { /* ignore whitespace */ }
.       { /* ignore unknown */ }

%%

