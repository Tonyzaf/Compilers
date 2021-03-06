%{

#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include "main.tab.h"



%}

%option         noyywrap
%option         yylineno

LETTER          [a-zA-Z]
ID              [a-z][a-z0-9]*  
DIGIT           [0-9]
NUMBER          [0-9][0-9]*
NEWLINE         \r\n
TAB             [\t]
other_chars     [.\-_]

%%

"PROGRAM"       {printf("Program Started\n"); return T_PROG;}
"VARS"          {printf("Variable Declaration Started\n"); return T_VARS;}
"CHAR"          {printf("Found Character Variable\n"); return T_CHAR;}
"INTEGER"       {printf("Found Integer variable\n"); return T_INT;}
"STRUCT"        {printf("Found Struct Declaration\n"); return T_STRCT;}
"ENDSTRUCT"     {printf("Struct Declaration Ended\n"); return T_ESTRCT;}
"TYPEDEF"       {printf("Type Defintion Found\n"); return T_TDEF;}
"PRINT"         {printf("Print Statement Found\n"); return T_PRINT;}
"IF"            {printf("If Statement Initiated\n"); return T_IF;}
"THEN"          {printf("Then Statement Found \n"); return T_THEN;}     
"ENDIF"         {printf("If Statement Ended\n"); return T_ENDIF;}
"WHILE"         {printf("Found While\n"); return T_WHILE;}
"ENDWHILE"      {printf("While Condition Ended\n"); return T_EWHILE;}
"ELSE"          {printf("Found Else\n"); return T_ELSE;}
"ELSEIF"        {printf("Found ElseIf\n"); return T_ELSEIF;}
"FOR"           {printf("For Statement Found\n"); return T_FOR;}
"TO"            {printf("For Condition TO\n"); return T_TO;}
"STEP"          {printf("For Condition STEP\n"); return T_STEP;}
"ENDFOR"        {printf("For Condition Ended\n"); return T_ENDFOR;}
"STARTMAIN"     {printf("Main Function Started\n"); return T_SMAIN;}
"ENDMAIN"       {printf("Main Function Ended\n"); return T_EMAIN;}
"FUNCTION"      {printf("Function Declaration\n"); return T_FUNCT;}
"END_FUNCTION"  {printf("Function End Reached\n"); return T_EFUNCT;}
"RETURN"        {printf("Value Return Found\n"); return T_RETURN;}
"SWITCH"        {printf("Found A Switch\n"); return T_SWITCH;}
"CASE"          {printf("Switch Case Found\n"); return T_CASE;}
"DEFAULT"       {printf("Switch Default\n"); return T_DEF;}
"ENDSWITCH"     {printf("Switch Ended\n"); return T_ESWITCH;}
"BREAK"         {printf("Break Found\n"); return T_BREAK;}
"AND"           {printf("Logical And Statemnt Found\n"); return T_AND;}
"OR"            {printf("Logical Or Statement Found\n"); return T_OR;}


{ID}            {printf("ID\n"); return T_ID;}    
{NUMBER}        {printf("NUMBER\n"); return T_NUMBER;}  
{NEWLINE}       {printf("New Line\n"); return T_NLINE;}
{TAB}           {}

"="             {printf("Assign\n"); return T_ASSIGN;}
">"             {printf("Greater Than\n"); return T_GREATER;}
"<"             {printf("Smaller Than\n"); return T_SMALLER;}
"=="            {printf("Equal To\n"); return T_EQUAL;}
"!="            {printf("Not Equal To\n"); return T_NEQUAL;}
"+"             {printf("Plus Sign\n"); return T_PLUS;}
"-"             {printf("Minus Sign\n"); return T_MINUS;}
"^"             {printf("Power Sign\n"); return T_POWER;}
"*"             {printf("Multiplication Sign\n"); return T_MULT;}
"/"             {printf("Division Sign\n"); return T_DIV;}
"{"             {printf("Left Brace\n"); return T_LBRACE;}
"}"             {printf("Right Brace\n"); return T_RBRACE;}
"["             {printf("Left Bracket\n"); return T_LBRACKET;}
"]"             {printf("Right Bracket\n"); return T_RBRACKET;}
"("             {printf("Left Parenthesis\n"); return T_LPARENTH;}
")"             {printf("Right Parenthesis\n"); return T_RPARENTH;}
";"             {printf("Semicolon\n"); return T_SEMICOL;}
":"             {printf("Column\n"); return T_COL;}
"."             {printf("Dot\n"); return T_DOT;}
","             {printf("Comma\n"); return T_COMMA;}
"\""            {printf("Tonos\n"); return T_TONOS;}
" "             {   }
"%"             {printf("Line Comment"); return T_COMMENT;}


<<<<<<< HEAD
<<EOF>>         {printf("Translation Successfull! \n"); return T_EOF;}
=======
<<EOF>>         {printf("Translation Complete!\n");return T_EOF;}
>>>>>>> 7e170cfe4df30d620bb7c00226cdaa4c922a5cf7

.               {printf("Unknown\n");}

%%