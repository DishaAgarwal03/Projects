#ifndef YY_fisac_h_included
#define YY_fisac_h_included
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
#ifndef YY_fisac_COMPATIBILITY
 #ifndef YY_USE_CLASS
  #define  YY_fisac_COMPATIBILITY 1
 #else
  #define  YY_fisac_COMPATIBILITY 0
 #endif
#endif

#if YY_fisac_COMPATIBILITY != 0
/* backward compatibility */
 #ifdef YYLTYPE
  #ifndef YY_fisac_LTYPE
   #define YY_fisac_LTYPE YYLTYPE
/* WARNING obsolete !!! user defined YYLTYPE not reported into generated header */
/* use %define LTYPE */
  #endif
 #endif
/*#ifdef YYSTYPE*/
  #ifndef YY_fisac_STYPE
   #define YY_fisac_STYPE YYSTYPE
  /* WARNING obsolete !!! user defined YYSTYPE not reported into generated header */
   /* use %define STYPE */
  #endif
/*#endif*/
 #ifdef YYDEBUG
  #ifndef YY_fisac_DEBUG
   #define  YY_fisac_DEBUG YYDEBUG
   /* WARNING obsolete !!! user defined YYDEBUG not reported into generated header */
   /* use %define DEBUG */
  #endif
 #endif 
 /* use goto to be compatible */
 #ifndef YY_fisac_USE_GOTO
  #define YY_fisac_USE_GOTO 1
 #endif
#endif

/* use no goto to be clean in C++ */
#ifndef YY_fisac_USE_GOTO
 #define YY_fisac_USE_GOTO 0
#endif

#ifndef YY_fisac_PURE

 #line 65 "/usr/share/bison++/bison.h"

#line 65 "/usr/share/bison++/bison.h"
/* YY_fisac_PURE */
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

#ifndef YY_fisac_DEBUG

 #line 71 "/usr/share/bison++/bison.h"

#line 71 "/usr/share/bison++/bison.h"
/* YY_fisac_DEBUG */
#endif

#ifndef YY_fisac_LSP_NEEDED

 #line 75 "/usr/share/bison++/bison.h"

#line 75 "/usr/share/bison++/bison.h"
 /* YY_fisac_LSP_NEEDED*/
#endif

/* DEFAULT LTYPE*/
#ifdef YY_fisac_LSP_NEEDED
 #ifndef YY_fisac_LTYPE
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

  #define YY_fisac_LTYPE yyltype
 #endif
#endif

/* DEFAULT STYPE*/
#ifndef YY_fisac_STYPE
 #define YY_fisac_STYPE int
#endif

/* DEFAULT MISCELANEOUS */
#ifndef YY_fisac_PARSE
 #define YY_fisac_PARSE yyparse
#endif

#ifndef YY_fisac_LEX
 #define YY_fisac_LEX yylex
#endif

#ifndef YY_fisac_LVAL
 #define YY_fisac_LVAL yylval
#endif

#ifndef YY_fisac_LLOC
 #define YY_fisac_LLOC yylloc
#endif

#ifndef YY_fisac_CHAR
 #define YY_fisac_CHAR yychar
#endif

#ifndef YY_fisac_NERRS
 #define YY_fisac_NERRS yynerrs
#endif

#ifndef YY_fisac_DEBUG_FLAG
 #define YY_fisac_DEBUG_FLAG yydebug
#endif

#ifndef YY_fisac_ERROR
 #define YY_fisac_ERROR yyerror
#endif

#ifndef YY_fisac_PARSE_PARAM
 #ifndef __STDC__
  #ifndef __cplusplus
   #ifndef YY_USE_CLASS
    #define YY_fisac_PARSE_PARAM
    #ifndef YY_fisac_PARSE_PARAM_DEF
     #define YY_fisac_PARSE_PARAM_DEF
    #endif
   #endif
  #endif
 #endif
 #ifndef YY_fisac_PARSE_PARAM
  #define YY_fisac_PARSE_PARAM void
 #endif
#endif

/* TOKEN C */
#ifndef YY_USE_CLASS

 #ifndef YY_fisac_PURE
  #ifndef yylval
   extern YY_fisac_STYPE YY_fisac_LVAL;
  #else
   #if yylval != YY_fisac_LVAL
    extern YY_fisac_STYPE YY_fisac_LVAL;
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
 #ifndef YY_fisac_CLASS
  #define YY_fisac_CLASS fisac
 #endif

 #ifndef YY_fisac_INHERIT
  #define YY_fisac_INHERIT
 #endif

 #ifndef YY_fisac_MEMBERS
  #define YY_fisac_MEMBERS 
 #endif

 #ifndef YY_fisac_LEX_BODY
  #define YY_fisac_LEX_BODY  
 #endif

 #ifndef YY_fisac_ERROR_BODY
  #define YY_fisac_ERROR_BODY  
 #endif

 #ifndef YY_fisac_CONSTRUCTOR_PARAM
  #define YY_fisac_CONSTRUCTOR_PARAM
 #endif
 /* choose between enum and const */
 #ifndef YY_fisac_USE_CONST_TOKEN
  #define YY_fisac_USE_CONST_TOKEN 0
  /* yes enum is more compatible with flex,  */
  /* so by default we use it */ 
 #endif
 #if YY_fisac_USE_CONST_TOKEN != 0
  #ifndef YY_fisac_ENUM_TOKEN
   #define YY_fisac_ENUM_TOKEN yy_fisac_enum_token
  #endif
 #endif

class YY_fisac_CLASS YY_fisac_INHERIT
{
public: 
 #if YY_fisac_USE_CONST_TOKEN != 0
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
  enum YY_fisac_ENUM_TOKEN { YY_fisac_NULL_TOKEN=0
  
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
 int YY_fisac_PARSE(YY_fisac_PARSE_PARAM);
 virtual void YY_fisac_ERROR(char *msg) YY_fisac_ERROR_BODY;
 #ifdef YY_fisac_PURE
  #ifdef YY_fisac_LSP_NEEDED
   virtual int  YY_fisac_LEX(YY_fisac_STYPE *YY_fisac_LVAL,YY_fisac_LTYPE *YY_fisac_LLOC) YY_fisac_LEX_BODY;
  #else
   virtual int  YY_fisac_LEX(YY_fisac_STYPE *YY_fisac_LVAL) YY_fisac_LEX_BODY;
  #endif
 #else
  virtual int YY_fisac_LEX() YY_fisac_LEX_BODY;
  YY_fisac_STYPE YY_fisac_LVAL;
  #ifdef YY_fisac_LSP_NEEDED
   YY_fisac_LTYPE YY_fisac_LLOC;
  #endif
  int YY_fisac_NERRS;
  int YY_fisac_CHAR;
 #endif
 #if YY_fisac_DEBUG != 0
  public:
   int YY_fisac_DEBUG_FLAG;	/*  nonzero means print parse trace	*/
 #endif
public:
 YY_fisac_CLASS(YY_fisac_CONSTRUCTOR_PARAM);
public:
 YY_fisac_MEMBERS 
};
/* other declare folow */
#endif


#if YY_fisac_COMPATIBILITY != 0
 /* backward compatibility */
 /* Removed due to bison problems
 /#ifndef YYSTYPE
 / #define YYSTYPE YY_fisac_STYPE
 /#endif*/

 #ifndef YYLTYPE
  #define YYLTYPE YY_fisac_LTYPE
 #endif
 #ifndef YYDEBUG
  #ifdef YY_fisac_DEBUG 
   #define YYDEBUG YY_fisac_DEBUG
  #endif
 #endif

#endif
/* END */

 #line 267 "/usr/share/bison++/bison.h"
#endif
