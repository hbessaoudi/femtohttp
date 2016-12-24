/*******************************************************************
 * femtohttp - Implantation d'un mini serveur http
 * by Bessaoudi.Hillal@gmail.com && Robin.BMayo@gmail.com 
 * [UPMC-STL-2016]
 *******************************************************************/
/* This file was originally written by : Bessaoudi.Hillal@gmail.com */




void requestInterpr(char** request,char** requestLine,char** messageHeader);
void requestLineInterpr(char** requestLine,char** ident
,char** request_URI,char** http_version);
void messageHeaderInterpr(char** messageHeader,char** identLeft
,char** identRight);