/*******************************************************************
 * femtohttp - Implantation d'un mini serveur http
 * by Bessaoudi.Hillal@gmail.com && Robin.BMayo@gmail.com 
 * [UPMC-STL-2016]
 *******************************************************************/
/* This file was originally written by : Bessaoudi.Hillal@gmail.com */




/*This function takes a byte array ending with a null '\0' caracter,
 do the parse and return a response(interpratation of the request),
 the '\0' must not appear in the middle of the array ! */
char* parseRequest(char req[]);

/*To test the parser, compile and run with this command : 
 f lex lexer.l && bison -r 'all'  parser.y
 && gcc -D ENABLE_MAIN parser.tab.c symanticActions.c  -ly -lfl 
 && printf "\n\n\nBegin\n" && ./a.out ./test
 */

