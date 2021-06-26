%{

#include <stdio.h>
#include <stdlib.h>
#include <math.h>

extern FILE *yyin;
extern int yylex();
extern int yylineno;
extern char *yytext;

void yyerror(const char *message);
int MAX_ERRORS=5;
	
int error_count=0; 
int flag_err_type=0; 
int scope=0;


%}

%define parse.error verbose

  

%token T_PROG       "PROGRAM"		
%token T_VARS	    "VARS"	
%token T_CHAR	    "CHAR"	
%token T_INT	    "INTEGER"	
%token T_STRCT	    "STRUCT"	
%token T_ESTRCT	    "END STRUCT"    
%token T_TDEF	    "TYPE DEF"	
%token T_PRINT	    "PRINT"	
%token T_IF		    "IF"
%token T_ENDIF	    "ENDIF"	
%token T_WHILE	    "WHILE"	
%token T_EWHILE	    "END WHILE"
%token T_ELSE	    "ELSE"	
%token T_ELSEIF	    "ELSE IF"
%token T_FOR	    "FOR"	
%token T_TO		    "TO"
%token T_STEP	    "STEP"	
%token T_ENDFOR	    "END FOR"
%token T_SMAIN	    "START MAIN"	
%token T_EMAIN	    "END MAIN"	
%token T_FUNCT	    "FUNCTION"	
%token T_EFUNCT	    "END FUNCTION"
%token T_RETURN	    "RETURN"
%token T_SWITCH	    "SWITCH"
%token T_CASE	    "CASE"	
%token T_DEF	    "DEFAULT"	
%token T_ESWITCH	"END SWITCH"
%token T_BREAK		"BREAK"
%token T_AND		"AND"
%token T_OR		    "OR"
%token T_GREATER	">"
%token T_SMALLER	"<"
%token T_EQUAL		"=="
%token T_NEQUAL	    "!="
%token T_PLUS		"+"
%token T_MINUS		"-"
%token T_POWER		"^"
%token T_MULT		"*"
%token T_DIV		"/"
%token T_LBRACE	    "{"
%token T_RBRACE	    "}"
%token T_LBRACKET	"["
%token T_RBRACKET	"]"
%token T_LPARENTH	"("
%token T_RPARENTH	")"
%token T_SEMICOL	";"
%token T_COL        ":"
%token T_DOT		"."
%token T_COMMA		","
%token T_TONOS      "\""
%token T_NLINE	    "NEW LINE"
%token T_COMMENT    "%"
%token T_THEN       "THEN"
%token T_ASSIGN     "="
%token T_ID         "ID"
%token T_NUMBER     "NUMBER" 
%token T_EOF	0   "EOF"





%%


program:                        T_PROG T_ID T_NLINE varksm struct function main T_EOF
                                ;

struct:                         struct_type struct T_NLINE
                                |%empty
                                ;

struct_type:                    T_STRCT T_ID T_NLINE varksm T_ID T_ESTRCT
                                |T_TDEF T_STRCT T_ID T_NLINE varksm T_ID T_ESTRCT
                                ;


function:                       T_FUNCT T_ID T_LPARENTH var T_RPARENTH T_NLINE varksm functionbody return T_EFUNCT T_NLINE 
                                |function function              
                                |%empty
                                ;

varksm:                         T_VARS vartype var T_SEMICOL T_NLINE
                                |varksm varksm
                                |%empty
                                ;

vartype:                        T_CHAR
                                |T_INT 
                                ;

var:                            T_ID
                                |T_ID T_COMMA var 
                                |%empty
                                ;                                

functionbody:                   command
                                |functionbody command
                                |%empty
                                ;

command:                        assignment T_NLINE
                                |loop T_NLINE
                                |check T_NLINE
                                |print T_NLINE
                                |break T_NLINE
                                |comment T_NLINE
                                |mcomment T_NLINE
                                ;

assignment:                     T_ID T_ASSIGN expression T_SEMICOL
                                ;

expression:                     literal
                                |T_ID T_LPARENTH var T_RPARENTH
                                |T_ID T_LBRACKET T_NUMBER T_RBRACKET
                                |operation
                                ;

operation:                      literal noperator literal
                                |operation noperator operation
                                |operation noperator literal
                                |literal noperator operation
                                |T_LPARENTH operation T_RPARENTH
                                ;


literal:                        T_NUMBER
                                |T_ID
                                ;
                        
noperator:                      T_PLUS
                                |T_MINUS
                                |T_POWER
                                |T_MULT
                                |T_DIV
                                ;

loop:                           forloop
                                |whileloop
                                ;

forloop:                        T_FOR T_ID T_ASSIGN T_NUMBER T_TO T_NUMBER T_STEP T_NUMBER T_NLINE functionbody T_ENDFOR
                                ;

whileloop:                      T_WHILE T_LPARENTH condition T_RPARENTH T_NLINE functionbody T_EWHILE
                                ;

condition:                      literal operators literal
                                ;

operators:                       loperator
                                |coperator
                                ;

loperator:                      T_SMALLER
                                |T_GREATER
                                |T_EQUAL
                                |T_NEQUAL
                                ;

coperator:                      T_AND
                                |T_OR
                                ;

check:                          checkif
                                |checkcase
                                ;

checkif:                        T_IF T_LPARENTH condition T_RPARENTH T_THEN T_NLINE functionbody  T_ENDIF
                                |T_IF T_LPARENTH condition T_RPARENTH T_THEN T_NLINE functionbody T_ELSE T_NLINE functionbody  T_ENDIF
                                |T_IF T_LPARENTH condition T_RPARENTH T_THEN T_NLINE functionbody elseif T_ELSE T_NLINE functionbody  T_ENDIF
                                ; 

elseif:                         T_ELSEIF T_NLINE functionbody 
                                |elseif elseif
                                ;


checkcase:                      T_SWITCH T_LPARENTH expression T_RPARENTH T_NLINE case default T_ESWITCH
                                ;

case:                           T_CASE T_LPARENTH expression T_RPARENTH T_COL T_NLINE functionbody
                                |case case
                                ; 

default:                        T_DEF T_COL T_NLINE functionbody
                                |%empty
                                ;                                                                                          

print:                          T_PRINT T_LPARENTH T_TONOS message T_TONOS T_COMMA T_LBRACKET var T_RBRACKET T_RPARENTH T_SEMICOL 
                                ;

message:                        literal
                                |literal message
                                |%empty
                                ;

break:                          T_BREAK T_SEMICOL
                                ;

comment:                        T_COMMENT message
                                ;
                    
mcomment:                       T_DIV T_MULT messages T_MULT T_DIV
                                ;

messages:                       message
                                |message T_NLINE messages
                                ;

return:                         T_RETURN literal T_SEMICOL T_NLINE
                                ;

main:                           T_SMAIN T_NLINE varksm functionbody T_EMAIN
                                ;


%%


int main(int argc, char* argv[]){
 int token;
	if(argc>1){
		yyin=fopen(argv[1], "r");
		if(yyin==NULL)
		{
			perror("Error opening file");
			return -1;
		}
	 }
  
	yyparse();

	fclose(yyin);
	return 0;
}

void yyerror(const char *message)
{
    error_count++;
    
    if(flag_err_type==0){
        printf("-> ERROR at line %d caused by %s : %s\n", yylineno, yytext, message);
    }else if(flag_err_type==1){
  
        printf("-> ERROR at line %d %s\n", yylineno, message);
    }
    flag_err_type = 0;
    if(MAX_ERRORS <= 0) return;
    if(error_count == MAX_ERRORS){
        printf("Max errors (%d) detected.\n", MAX_ERRORS);
        exit(-1);
    }
}