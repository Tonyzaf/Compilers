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

#ifndef YY_YY_MAIN_TAB_H_INCLUDED
# define YY_YY_MAIN_TAB_H_INCLUDED
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
    T_PROG = 258,
    T_VARS = 259,
    T_CHAR = 260,
    T_INT = 261,
    T_STRCT = 262,
    T_ESTRCT = 263,
    T_TDEF = 264,
    T_PRINT = 265,
    T_IF = 266,
    T_ENDIF = 267,
    T_WHILE = 268,
    T_EWHILE = 269,
    T_ELSE = 270,
    T_ELSEIF = 271,
    T_FOR = 272,
    T_TO = 273,
    T_STEP = 274,
    T_ENDFOR = 275,
    T_SMAIN = 276,
    T_EMAIN = 277,
    T_FUNCT = 278,
    T_EFUNCT = 279,
    T_RETURN = 280,
    T_SWITCH = 281,
    T_CASE = 282,
    T_DEF = 283,
    T_ESWITCH = 284,
    T_BREAK = 285,
    T_AND = 286,
    T_OR = 287,
    T_GREATER = 288,
    T_SMALLER = 289,
    T_EQUAL = 290,
    T_NEQUAL = 291,
    T_PLUS = 292,
    T_MINUS = 293,
    T_POWER = 294,
    T_MULT = 295,
    T_DIV = 296,
    T_LBRACE = 297,
    T_RBRACE = 298,
    T_LBRACKET = 299,
    T_RBRACKET = 300,
    T_LPARENTH = 301,
    T_RPARENTH = 302,
    T_SEMICOL = 303,
    T_COL = 304,
    T_DOT = 305,
    T_COMMA = 306,
    T_TONOS = 307,
    T_NLINE = 308,
    T_COMMENT = 309,
    T_THEN = 310,
    T_ASSIGN = 311,
    T_ID = 312,
    T_NUMBER = 313
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

#endif /* !YY_YY_MAIN_TAB_H_INCLUDED  */
