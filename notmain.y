
%{

#include <stdio.h>
#include <stdlib.h>
#include <math.h>

extern FILE *yyin;
extern int yylex();
int error_counter,yylineno;

%}

%error-verbose

%token  T_SPC		"Space" 
%token  T_ID        "ID"
%token  T_LETTER    "Letter"
%token  T_PROG		"Program1"
%token  T_VARS		"Vars"
%token  T_CHAR		"Char"
%token  T_INT		"Int"
%token  T_STRCT		"Struct"
%token  T_ESTRCT	"End of Struct"
%token  T_TDEF		"TYPEDEF"
%token  T_PRINT		"Print"
%token  T_IF		"If"
%token  T_THEN      "Then"
%token  T_ENDIF		"End if"
%token  T_WHILE		"While"
%token  T_EWHILE	"End While"
%token  T_ELSE		"Else"
%token  T_ELSEIF 	"Else If"
%token  T_FOR		"For"
%token  T_TO		"To"
%token  T_STEP		"Step"
%token  T_ENDFOR	"End For"
%token  T_SMAIN		"Start Main"
%token  T_EMAIN		"End Main"
%token  T_FUNCT		"Function"
%token  T_EFUNCT	"End Function"
%token  T_RETURN	"Return"
%token  T_SWITCH	"Switch"
%token  T_CASE		"Case"
%token  T_DEF		"Default"
%token  T_ESWITCH	"End Switch"
%token  T_BREAK		"Break"
%token  T_AND		"AND"
%token  T_OR		"OR"
%token  T_LETTER    "Letter"
%token  T_DIGIT 	"Digit"
%token  T_GREATER	">"
%token  T_ASSIGN    "="
%token  T_COL       ":"
%token  T_SMALLER	"<"
%token  T_EQUAL		"=="
%token  T_NEQUAL	"!="
%token	T_PLUS		"+"
%token	T_MINUS		"-"
%token	T_POWER		"^"
%token	T_MULT		"*"
%token	T_COMMENT	"//"
%token	T_DIV		"/"
%token	T_LBRACE	"{"
%token  T_RBRACE	"}"
%token  T_LBRACKET	"["
%token  T_RBRACKET	"]"
%token  T_LPARENTH	"("
%token  T_RPARENTH	")"
%token  T_SEMICOL	";"
%token  T_DOT		"."
%token  T_COMMA		","
%token	T_NEWLINE	"newline"
%token  T_UNKNWON 	"Unknown"
%token  T_EOF	0   "EOF"

//%type <strval>
//oloi oi aristeroi kanones

%left   T_COMMA
%right  T_ASSIGN 
%left   T_OR
%left   T_AND
%left   T_EQUAL
%left   T_NEQUAL
%left   T_GREATER
%left   T_SMALLER
%left   T_PLUS
%left   T_MINUS
%left   T_MULT
%left   T_DIV
%left   T_LPARENTH T_RPARENTH T_LBRACKET T_RBRACKET T_LBRACE T_RBRACE T_DOT

%start program

%%


program:                     T_PROG name T_NEWLINE;

name:                        T_ID ;    

newline:                     T_NEWLINE;

number:                      T_DIGIT | number T_DIGIT | T_DIGIT number | %empty;

word:                        T_LETTER | word T_LETTER | T_DIGIT word | %empty ;

struct:                      T_STRCT name newline variable-init T_ESTRCT
                                | T_TDEF T_STRCT name newline variable-init name T_ESTRCT
                                | struct struct
                                | %empty;

function:                    T_FUNCT name T_LPARENTH parameters T_RPARENTH newline  function-main-body return-statement T_EFUNCT
                                | function function
                                | %empty;

parameters:                  name 
                                | parameters T_COMMA name;

function-main-body:          variable-init program-command;

return-statement:            T_RETURN name T_SEMICOL;

main-function:               T_SMAIN variable-init program-command T_EMAIN ;

type-specifier:              T_CHAR
                                | T_INT;

variable-init:               T_VARS type-specifier identifier T_SEMICOL
                                | variable-init variable-init
                                | %empty;

identifier:                  name | identifier, identifier;

program-command:             assign-statement
                                | iteration-statement
                                | selection-statement
                                | print-statement
                                | break-statement
                                | line-comment
                                | program-command program-command
                                | %empty;

assign-statement:            name T_ASSIGN statement T_SEMICOL;

statement:                   word 
                                | number 
                                | statement statement 
                                | T_LPARENTH statement T_RPARENTH
                                | statement unary-operator statement;
              
unary-operator:              T_DIV
                                |T_MULT
                                |T_PLUS
                                |T_MINUS
                                |T_POWER;
                  
condition:                   word logical-expression word 
                                | number logical-expression number
                                | number logical-expression word 
                                | word logical-expression number;

logical-expression:          T_GREATER
                                |T_SMALLER
                                |T_EQUAL
                                |T_NEQUAL
                                |T_AND
                                |T_OR;

iteration-statement:          T_WHILE T_LPARENTH condition T_RPARENTH program-command T_EWHILE
                                | T_FOR T_LPARENTH condition T_TO number T_STEP number T_RPARENTH program-command T_ENDFOR ;

selection-statement:         T_IF T_LPARENTH condition T_RPARENTH T_THEN program-command elseif else T_ENDIF
                                | T_SWITCH T_LPARENTH condition T_RPARENTH case default T_LBRACE T_DEF T_COL program-command T_RBRACE T_ESWITCH ;

elseif:                      T_ELSEIF  program-command elseif
                                | %empty;

else:                         T_ELSE program-command
                                | %empty;

case:                        T_CASE T_LPARENTH condition T_RPARENTH program-command case   
                                | %empty    ;

default:                     T_DEF T_COL program-command 
                                | %empty;

print-statement:             T_PRINT T_LPARENTH "message" val T_RPARENTH T_SEMICOL;

message:                     word 
                                | word message  
                                | %empty;

val:                         , [ word ] val
                                | %empty;

break-statement:             T_BREAK T_SEMICOL;

line-comment:                T_COMMENT word
                                | %empty;

multiline-comment:            /* comment */;

comment:                     message newline comment
                                | message
                                | %empty;

%%


int main(int argc, char *argv[]){

//int token;

if(argc > 1){
    yyin = fopen(argv[1], "r");
    if (yyin == NULL){
        perror("Error: Unable to open file");
        return -1;
    }
} 

yyparse();

fclose(yyin);
return 0;

}


void yyerror(const char* err){
    error_counter++;
    printf("[ERROR - LINE %d] %s\n", yylineno , err);

    if(error_counter == 5) {
            printf("Max Errors Found\n");
            exit(EXIT_FAILURE);
    }

    //yyless(1);
}