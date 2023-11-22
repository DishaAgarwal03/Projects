#ifndef YY_final_h_included
#define YY_final_h_included
/*#define YY_USE_CLASS 
*/
#line 1 "/usr/share/bison++/bison.h"
/* before anything */
#ifdef c_plusplus
 #ifndef __cplusplus
  #define __cplusplus
 #endif
#endif


 #line 8 "/usr/share/bison++/bison.h"

#line 21 "/usr/share/bison++/bison.h"
 /* %{ and %header{ and %union, during decl */
#ifndef YY_final_COMPATIBILITY
 #ifndef YY_USE_CLASS
  #define  YY_final_COMPATIBILITY 1
 #else
  #define  YY_final_COMPATIBILITY 0
 #endif
#endif

#if YY_final_COMPATIBILITY != 0
/* backward compatibility */
 #ifdef YYLTYPE
  #ifndef YY_final_LTYPE
   #define YY_final_LTYPE YYLTYPE
/* WARNING obsolete !!! user defined YYLTYPE not reported into generated header */
/* use %define LTYPE */
  #endif
 #endif
/*#ifdef YYSTYPE*/
  #ifndef YY_final_STYPE
   #define YY_final_STYPE YYSTYPE
  /* WARNING obsolete !!! user defined YYSTYPE not reported into generated header */
   /* use %define STYPE */
  #endif
/*#endif*/
 #ifdef YYDEBUG
  #ifndef YY_final_DEBUG
   #define  YY_final_DEBUG YYDEBUG
   /* WARNING obsolete !!! user defined YYDEBUG not reported into generated header */
   /* use %define DEBUG */
  #endif
 #endif 
 /* use goto to be compatible */
 #ifndef YY_final_USE_GOTO
  #define YY_final_USE_GOTO 1
 #endif
#endif

/* use no goto to be clean in C++ */
#ifndef YY_final_USE_GOTO
 #define YY_final_USE_GOTO 0
#endif

#ifndef YY_final_PURE

 #line 65 "/usr/share/bison++/bison.h"

#line 65 "/usr/share/bison++/bison.h"
/* YY_final_PURE */
#endif


 #line 68 "/usr/share/bison++/bison.h"
#ifndef YY_USE_CLASS
# ifndef YYSTYPE
#  define YYSTYPE int
#  define YYSTYPE_IS_TRIVIAL 1
# endif
#endif

#line 68 "/usr/share/bison++/bison.h"
/* prefix */

#ifndef YY_final_DEBUG

 #line 71 "/usr/share/bison++/bison.h"

#line 71 "/usr/share/bison++/bison.h"
/* YY_final_DEBUG */
#endif

#ifndef YY_final_LSP_NEEDED

 #line 75 "/usr/share/bison++/bison.h"

#line 75 "/usr/share/bison++/bison.h"
 /* YY_final_LSP_NEEDED*/
#endif

/* DEFAULT LTYPE*/
#ifdef YY_final_LSP_NEEDED
 #ifndef YY_final_LTYPE
  #ifndef BISON_YYLTYPE_ISDECLARED
   #define BISON_YYLTYPE_ISDECLARED
typedef
  struct yyltype
    {
      int timestamp;
      int first_line;
      int first_column;
      int last_line;
      int last_column;
      char *text;
   }
  yyltype;
  #endif

  #define YY_final_LTYPE yyltype
 #endif
#endif

/* DEFAULT STYPE*/
#ifndef YY_final_STYPE
 #define YY_final_STYPE int
#endif

/* DEFAULT MISCELANEOUS */
#ifndef YY_final_PARSE
 #define YY_final_PARSE yyparse
#endif

#ifndef YY_final_LEX
 #define YY_final_LEX yylex
#endif

#ifndef YY_final_LVAL
 #define YY_final_LVAL yylval
#endif

#ifndef YY_final_LLOC
 #define YY_final_LLOC yylloc
#endif

#ifndef YY_final_CHAR
 #define YY_final_CHAR yychar
#endif

#ifndef YY_final_NERRS
 #define YY_final_NERRS yynerrs
#endif

#ifndef YY_final_DEBUG_FLAG
 #define YY_final_DEBUG_FLAG yydebug
#endif

#ifndef YY_final_ERROR
 #define YY_final_ERROR yyerror
#endif

#ifndef YY_final_PARSE_PARAM
 #ifndef __STDC__
  #ifndef __cplusplus
   #ifndef YY_USE_CLASS
    #define YY_final_PARSE_PARAM
    #ifndef YY_final_PARSE_PARAM_DEF
     #define YY_final_PARSE_PARAM_DEF
    #endif
   #endif
  #endif
 #endif
 #ifndef YY_final_PARSE_PARAM
  #define YY_final_PARSE_PARAM void
 #endif
#endif

/* TOKEN C */
#ifndef YY_USE_CLASS

 #ifndef YY_final_PURE
  #ifndef yylval
   extern YY_final_STYPE YY_final_LVAL;
  #else
   #if yylval != YY_final_LVAL
    extern YY_final_STYPE YY_final_LVAL;
   #else
    #warning "Namespace conflict, disabling some functionality (bison++ only)"
   #endif
  #endif
 #endif


 #line 169 "/usr/share/bison++/bison.h"
#define	NUM	258
#define	IDENTIFIER	259
#define	NL	260
#define	STRINGLIT	261
#define	CHARLIT	262
#define	CLASS	263
#define	IMPORT	264
#define	PUBLIC	265
#define	PRIVATE	266
#define	PROTECTED	267
#define	STATIC	268
#define	INT	269
#define	DOUBLE	270
#define	CHAR	271
#define	BOOLEAN	272
#define	STRING	273
#define	FLOAT	274
#define	VOID	275
#define	TRUE	276
#define	FALSE	277


#line 169 "/usr/share/bison++/bison.h"
 /* #defines token */
/* after #define tokens, before const tokens S5*/
#else
 #ifndef YY_final_CLASS
  #define YY_final_CLASS final
 #endif

 #ifndef YY_final_INHERIT
  #define YY_final_INHERIT
 #endif

 #ifndef YY_final_MEMBERS
  #define YY_final_MEMBERS 
 #endif

 #ifndef YY_final_LEX_BODY
  #define YY_final_LEX_BODY  
 #endif

 #ifndef YY_final_ERROR_BODY
  #define YY_final_ERROR_BODY  
 #endif

 #ifndef YY_final_CONSTRUCTOR_PARAM
  #define YY_final_CONSTRUCTOR_PARAM
 #endif
 /* choose between enum and const */
 #ifndef YY_final_USE_CONST_TOKEN
  #define YY_final_USE_CONST_TOKEN 0
  /* yes enum is more compatible with flex,  */
  /* so by default we use it */ 
 #endif
 #if YY_final_USE_CONST_TOKEN != 0
  #ifndef YY_final_ENUM_TOKEN
   #define YY_final_ENUM_TOKEN yy_final_enum_token
  #endif
 #endif

class YY_final_CLASS YY_final_INHERIT
{
public: 
 #if YY_final_USE_CONST_TOKEN != 0
  /* static const int token ... */
  
 #line 212 "/usr/share/bison++/bison.h"
static const int NUM;
static const int IDENTIFIER;
static const int NL;
static const int STRINGLIT;
static const int CHARLIT;
static const int CLASS;
static const int IMPORT;
static const int PUBLIC;
static const int PRIVATE;
static const int PROTECTED;
static const int STATIC;
static const int INT;
static const int DOUBLE;
static const int CHAR;
static const int BOOLEAN;
static const int STRING;
static const int FLOAT;
static const int VOID;
static const int TRUE;
static const int FALSE;


#line 212 "/usr/share/bison++/bison.h"
 /* decl const */
 #else
  enum YY_final_ENUM_TOKEN { YY_final_NULL_TOKEN=0
  
 #line 215 "/usr/share/bison++/bison.h"
	,NUM=258
	,IDENTIFIER=259
	,NL=260
	,STRINGLIT=261
	,CHARLIT=262
	,CLASS=263
	,IMPORT=264
	,PUBLIC=265
	,PRIVATE=266
	,PROTECTED=267
	,STATIC=268
	,INT=269
	,DOUBLE=270
	,CHAR=271
	,BOOLEAN=272
	,STRING=273
	,FLOAT=274
	,VOID=275
	,TRUE=276
	,FALSE=277


#line 215 "/usr/share/bison++/bison.h"
 /* enum token */
     }; /* end of enum declaration */
 #endif
public:
 int YY_final_PARSE(YY_final_PARSE_PARAM);
 virtual void YY_final_ERROR(char *msg) YY_final_ERROR_BODY;
 #ifdef YY_final_PURE
  #ifdef YY_final_LSP_NEEDED
   virtual int  YY_final_LEX(YY_final_STYPE *YY_final_LVAL,YY_final_LTYPE *YY_final_LLOC) YY_final_LEX_BODY;
  #else
   virtual int  YY_final_LEX(YY_final_STYPE *YY_final_LVAL) YY_final_LEX_BODY;
  #endif
 #else
  virtual int YY_final_LEX() YY_final_LEX_BODY;
  YY_final_STYPE YY_final_LVAL;
  #ifdef YY_final_LSP_NEEDED
   YY_final_LTYPE YY_final_LLOC;
  #endif
  int YY_final_NERRS;
  int YY_final_CHAR;
 #endif
 #if YY_final_DEBUG != 0
  public:
   int YY_final_DEBUG_FLAG;	/*  nonzero means print parse trace	*/
 #endif
public:
 YY_final_CLASS(YY_final_CONSTRUCTOR_PARAM);
public:
 YY_final_MEMBERS 
};
/* other declare folow */
#endif


#if YY_final_COMPATIBILITY != 0
 /* backward compatibility */
 /* Removed due to bison problems
 /#ifndef YYSTYPE
 / #define YYSTYPE YY_final_STYPE
 /#endif*/

 #ifndef YYLTYPE
  #define YYLTYPE YY_final_LTYPE
 #endif
 #ifndef YYDEBUG
  #ifdef YY_final_DEBUG 
   #define YYDEBUG YY_final_DEBUG
  #endif
 #endif

#endif
/* END */

 #line 267 "/usr/share/bison++/bison.h"
#endif
