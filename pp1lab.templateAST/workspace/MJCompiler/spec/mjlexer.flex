package rs.ac.bg.etf.pp1;

import java_cup.runtime.Symbol;

%%

%{

	// ukljucivanje informacije o poziciji tokena
	private Symbol new_symbol(int type) {
		return new Symbol(type, yyline+1, yycolumn);
	}
	
	// ukljucivanje informacije o poziciji tokena
	private Symbol new_symbol(int type, Object value) {
		return new Symbol(type, yyline+1, yycolumn, value);
	}

%}

%cup
%line
%column

%xstate COMMENT

%eofval{
	return new_symbol(sym.EOF);
%eofval}

%%

" " 	{ }
"\b" 	{ }
"\t" 	{ }
"\r\n" 	{ }
"\f" 	{ }

"program"   { return new_symbol(sym.PROG, yytext()); }
"print" 	{ return new_symbol(sym.PRINT, yytext()); }
"return" 	{ return new_symbol(sym.RETURN, yytext()); }
"void" 		{ return new_symbol(sym.VOID, yytext()); }
"class"			{ return new_symbol(sym.CLASS, yytext()); }
"new"			{ return new_symbol(sym.NEW, yytext()); }
"read"			{ return new_symbol(sym.READ, yytext()); }
"do"			{ return new_symbol(sym.DO, yytext()); }
"while"			{ return new_symbol(sym.WHILE, yytext()); }
"extends"			{ return new_symbol(sym.EXTENDS, yytext()); }
"continue"			{ return new_symbol(sym.CONTINUE, yytext()); }
"-"			{ return new_symbol(sym.MINUS, yytext()); }
"/"			{ return new_symbol(sym.DIV, yytext()); }
"*"			{ return new_symbol(sym.MUL, yytext()); }
"%"			{ return new_symbol(sym.MOD, yytext()); }
"!="			{ return new_symbol(sym.NEQUAL, yytext()); }
">"			{ return new_symbol(sym.GRT, yytext()); }
">="			{ return new_symbol(sym.GRTEQ, yytext()); }
"<"			{ return new_symbol(sym.LESS, yytext()); }
"<="			{ return new_symbol(sym.LESSEQ, yytext()); }
"&&"			{ return new_symbol(sym.AND, yytext()); }
"||"			{ return new_symbol(sym.OR, yytext()); }
"++"			{ return new_symbol(sym.INC, yytext()); }
"--"			{ return new_symbol(sym.DEC, yytext()); }
"=="			{ return new_symbol(sym.EQITONADVAPUT, yytext()); }
"."			{ return new_symbol(sym.DOT, yytext()); }
"["			{ return new_symbol(sym.LBRACKET, yytext()); }
"]"			{ return new_symbol(sym.RBRACKET, yytext()); }
"+" 		{ return new_symbol(sym.PLUS, yytext()); }
"=" 		{ return new_symbol(sym.EQUAL, yytext()); }
";" 		{ return new_symbol(sym.SEMI, yytext()); }
"," 		{ return new_symbol(sym.COMMA, yytext()); }
"(" 		{ return new_symbol(sym.LPAREN, yytext()); }
")" 		{ return new_symbol(sym.RPAREN, yytext()); }
"{" 		{ return new_symbol(sym.LBRACE, yytext()); }
"}"			{ return new_symbol(sym.RBRACE, yytext()); }


"//" 		     { yybegin(COMMENT); }
<COMMENT> .      { yybegin(COMMENT); }
<COMMENT> "\r\n" { yybegin(YYINITIAL); }

true|false	{ return new_symbol(sym.BOOLEAN, new Boolean(yytext())); }
[0-9]+  { return new_symbol(sym.NUMBER, new Integer (yytext())); }
([a-z]|[A-Z])[a-z|A-Z|0-9|_]* 	{return new_symbol (sym.IDENT, yytext()); }
'.'	   {return new_symbol (sym.CHAR, new Character(yytext().charAt(1))); }

. { System.err.println("Leksicka greska ("+yytext()+") u liniji "+(yyline+1)); }





