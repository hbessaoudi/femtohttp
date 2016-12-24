/*******************************************************************
 * femtohttp - Implantation d'un mini serveur http
 * by Bessaoudi.Hillal@gmail.com && Robin.BMayo@gmail.com 
 * [UPMC-STL-2016]
 *******************************************************************/
/* This file was originally written by : Bessaoudi.Hillal@gmail.com */




%{
    #include <stdio.h>
    #include <string.h>
    
        /*This macro perform a copy of the curent token value to yylval
        which is used in the symantic actions*/
    #define CPY_VALUE yylval=malloc(yyleng);strcpy(yylval,yytext);
    
    int num_lines = 0, num_chars = 0;
    
%}


HTTP_VERSION "HTTP/"[0-9]+"\."[0-9]+
REQUEST_URI ("/"[^" "]+)+"/"?

CRLF "\r\n"
LWS  {CRLF}?({SP}|{HT})+
TEXT [a-Z0-9]* 
     /*any OCTET except CTLs,but including LWS*/
IDENT [a-zA-Z]+[a-zA-Z0-9'-']*


%%
\n {return CRLF;}
: return CLN;
[ ] return SP;


{HTTP_VERSION} {CPY_VALUE;return HTTP_VERSION;}
{REQUEST_URI} {CPY_VALUE;return REQUEST_URI;}
{IDENT} {CPY_VALUE;return IDENT;}
%%
/*int main()
{
    yylex();
    printf( "# of lines = %d, # of chars = %d\n",
            num_lines, num_chars );
}
*/