/*******************************************************************
 * femtohttp - Implantation d'un mini serveur http
 * by Bessaoudi.Hillal@gmail.com && Robin.BMayo@gmail.com 
 * [UPMC-STL-2016]
 *******************************************************************/
/* This file was originally written by : Bessaoudi.Hillal@gmail.com */


#include "symanticActions.h"
#include <stdio.h>





void requestInterpr(char** request,char** requestLine,char** messageHeader)
{
    /* Write here the code generating the interpretation on the request */
}

void requestLineInterpr(char** requestLine,char** ident
                        ,char** request_URI,char** http_version)
{
    /* Write here the code generating the interpretation on the request */
    
    printf("\nHTTP_Version : %s\n",*http_version);
    printf("\nrequest_URI : %s\n",*request_URI);
}

void messageHeaderInterpr(char** messageHeader,char** identLeft
                        ,char** identRight)
{
    /* Write here the code generating the interpretation on the request */
    
}