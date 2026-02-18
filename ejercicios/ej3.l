%{
#include "ej3.tab.h"
#include <stdlib.h>
%}

%%

"&&"   { return AND; }
"||"   { return OR; }

"+"    { return ADD; }
"-"    { return SUB; }
"*"    { return MUL; }
"/"    { return DIV; }

[0-9]+ { yylval = atoi(yytext); return NUMBER; }

\n     { return EOL; }
[ \t]  { }
.      { }

%%
