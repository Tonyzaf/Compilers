/* A Bison parser, made by GNU Bison 3.0.4.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015 Free Software Foundation, Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

#ifndef YY_YY_NOTMAIN_TAB_H_INCLUDED
# define YY_YY_NOTMAIN_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    T_EOF = 0,
    T_SPC = 258,
    T_LETTER = 259,
    T_PROG = 260,
    T_VARS = 261,
    T_CHAR = 262,
    T_INT = 263,
    T_STRCT = 264,
    T_ESTRCT = 265,
    T_TDEF = 266,
    T_PRINT = 267,
    T_IF = 268,
    T_THEN = 269,
    T_ENDIF = 270,
    T_WHILE = 271,
    T_EWHILE = 272,
    T_ELSE = 273,
    T_ELSEIF = 274,
    T_FOR = 275,
    T_TO = 276,
    T_STEP = 277,
    T_ENDFOR = 278,
    T_SMAIN = 279,
    T_EMAIN = 280,
    T_FUNCT = 281,
    T_EFUNCT = 282,
    T_RETURN = 283,
    T_SWITCH = 284,
    T_CASE = 285,
    T_DEF = 286,
    T_ESWITCH = 287,
    T_BREAK = 288,
    T_AND = 289,
    T_OR = 290,
    T_WORD = 291,
    T_NUMBER = 292,
    T_GREATER = 293,
    T_ASSIGN = 294,
    T_COL = 295,
    T_SMALLER = 296,
    T_EQUAL = 297,
    T_NEQUAL = 298,
    T_PLUS = 299,
    T_MINUS = 300,
    T_POWER = 301,
    T_MULT = 302,
    T_COMMENT = 303,
    T_DIV = 304,
    T_LBRACE = 305,
    T_RBRACE = 306,
    T_LBRACKET = 307,
    T_RBRACKET = 308,
    T_LPARENTH = 309,
    T_RPARENTH = 310,
    T_SEMICOL = 311,
    T_DOT = 312,
    T_COMMA = 313,
    T_NEWLINE = 314,
    T_UNKNWON = 315
  };
#endif

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_NOTMAIN_TAB_H_INCLUDED  */
