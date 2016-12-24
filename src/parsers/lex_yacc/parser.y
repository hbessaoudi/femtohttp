/*******************************************************************
 * femtohttp - Implantation d'un mini serveur http
 * by Bessaoudi.Hillal@gmail.com && Robin.BMayo@gmail.com 
 * [UPMC-STL-2016]
 *******************************************************************/
/* This file was originally written by : Bessaoudi.Hillal@gmail.com */




%{
    #define YYSTYPE char *
    
    #include <stdio.h>
    #include <stdlib.h>
    #include "parserInterface.h"
    #include "symanticActions.h"
    
    int yylex(void);
    
    /*This pointer points to a string which is the result of the interpretation of the request*/
    char *response;
    
%}


%token SP CRLF END IDENT HTTP_VERSION REQUEST_URI  CLN


%start request


%%
request:
     requestLine messageHeader CRLF 
        {
            requestInterpr(&$$,&$1,&$2);
        }
    ;

requestLine   :
     IDENT SP REQUEST_URI SP HTTP_VERSION CRLF  
        {
            requestLineInterpr(&$$,&$1,&$3,&$5);
        }
    ;
messageHeader:
    |IDENT CLN IDENT CRLF
        {
            messageHeaderInterpr(&$$,&$1,&$3);
        }
    ;
%%

#include "lex.yy.c"


/*Main function to test parser*/
#ifdef ENABLE_MAIN
int main(int argc,char *argv[])
{
    if(argc>=2)
    {
        yyin=fopen(argv[1],"r");
        return yyparse();
        
    }
    char string[] = "GET /indexhtml HTTP/1.1\nHost:wwwupmccom\n\n";
    YY_BUFFER_STATE buffer = yy_scan_string(string);
    yyparse();
    yy_delete_buffer(buffer);
    
}
#endif



char* parseRequest(char req[])
{
    YY_BUFFER_STATE buffer = yy_scan_string(req);
    yyparse();
    yy_delete_buffer(buffer);
    return response;
}
