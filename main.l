%{

#include <stdio.h>
#include <stdlib.h>
#include <math.h>

%}

%option         case-insensitive
letter          [a-z]
ID              [a-z][a-z0-9]*
digit           [0-9]
other_chars     [.\-_]

%%

"PROGRAM"       printf("Program Started\n");
"VARS"          printf("Variable Declaration Started\n");
"CHAR"          printf("Found Character Variable\n");
"INTEGER"       printf("Found Integer variable\n");
"STRUCT"        printf("Found Struct Declaration\n");
"ENDSTRUCT"     printf("Struct Declaration Ended\n");
"TYPEDEF"       printf("Type Defintion Found\n");
"PRINT"         printf("Print Statement Found\n");
"IF"            printf("If Statement Initiated\n");
"ENDIF"         printf("If Statement Ended\n");
"WHILE"         printf("Found While\n");
"ENDWHILE"      printf("While Condition Ended\n");
"ELSE"          printf("Found Else\n");
"ELSEIF"        printf("Found ElseIf\n");
"FOR"           printf("For Statement Found\n");
"TO"            printf("For Condition TO\n");
"STEP"          printf("For Condition STEP\n");
"ENDFOR"        printf("For Condition Ended\n");
"STARTMAIN"     printf("Main Function Started\n");
"ENDMAIN"       printf("Main Function Ended\n");
"FUNCTION"      printf("Function Declaration\n");
"END_FUNCTION"  printf("Function End Reached\n");
"RETURN"        printf("Value Return Found\n");
"SWITCH"        printf("Found A Switch\n");
"CASE"          printf("Switch Case Found\n");
"DEFAULT"       printf("Switch Default\n");
"ENDSWITCH"     printf("Switch Ended\n");
"BREAK"         printf("Break Found\n");
"AND"           printf("Logical And Statemnt Found\n");
"OR"            printf("Logical Or Statement Found\n");

[a-z]*          printf("Word\n");
[0-9]*          printf("Number\n");

">"             printf("Greater Than\n");
"<"             printf("Smaller Than\n");
"=="            printf("Equal To\n");
"!="            printf("Not Equal To\n");
"+"             printf("Plus Sign\n");
"-"             printf("Minus Sign\n");
"^"             printf("Power Sign\n");
"*"             printf("Multiplication Sign\n");
"//"            printf("Comment Line Found\n");
"/"             printf("Division Sign\n");
"{"             printf("Left Brace\n");
"}"             printf("Right Brace\n");
"["             printf("Left Bracket\n");
"]"             printf("Right Bracket\n");
"("             printf("Left Parenthesis\n");
")"             printf("Right Parenthesis\n");
";"             printf("Semicolon\n");
"."             printf("Dot");
","             printf("Comma");
" "             return 1;
"\n"            printf("New Line\n");

.               printf("Unknown\n");
<<EOF>>         return 0;

%%

int main(int argc, char *argv[]){

int token;

if(argc > 1){
    yyin = fopen(argv[1], "r");
    if (yyin == NULL){
        perror("Error opening file");
        return -1;
    }
}

do{
    token = yylex();
}while(token != 0);

fclose(yyin);
yyterminate();

}