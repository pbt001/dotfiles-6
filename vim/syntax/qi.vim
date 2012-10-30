" Vim syntax file
" Language: Qi/Shen
" Maintainer: Titus v. d. Malsburg <malsburg@gmail.com>
" Last Change: Dec 24, 2008
" Version: 1.01
" URL: http://www.cl.uni-heidelberg.de/~malsburg/qi/
"
" Based on the syntax file for Lisp by Charles Campbell.
"
 let qi_highlight_sys_functions = 1
 let qi_highlight_special_vars = 1

" ---------------------------------------------------------------------
" Clusters: {{{1
syn cluster qiAtomCluster contains=qiAtomBarSymbol,qiAtomList,qiAtomNmbr0,qiComment,qiDecl,qiFunc,qiLeadWhite
syn cluster qiBaseListCluster contains=qiAtom,qiAtomBarSymbol,qiAtomMark,qiBarSymbol,qiComment,qiConcat,qiDecl,qiFunc,qiKey,qiList,qiNumber,qiSpecial,qiSymbol,qiVar,qiLeadWhite
syn cluster qiListCluster contains=@qiBaseListCluster,qiString

" ---------------------------------------------------------------------
" Lists: {{{1 
syn match qiSymbol contained ![^()\[\]'`,"; \t]\+!
syn region qiList matchgroup=Delimiter start="(" skip="|.\{-}|" matchgroup=Delimiter end=")" contains=@qiListCluster

" ---------------------------------------------------------------------
" Atoms: {{{1
syn match qiAtomMark "'"
syn match qiAtom "'("me=e-1 contains=qiAtomMark nextgroup=qiAtomList
syn match qiAtom "'[^ \t()]\+" contains=qiAtomMark
syn match qiAtomBarSymbol !'|..\{-}|! contains=qiAtomMark
syn region qiAtom start=+'"+ skip=+\\"+ end=+"+
syn region qiAtomList contained matchgroup=Special start="(" skip="|.\{-}|" matchgroup=Special end=")" contains=@qiAtomCluster,qiString
syn match qiAtomNmbr contained "\<\d\+"
syn match qiLeadWhite contained "^\s\+"

" ---------------------------------------------------------------------
" Standard Qi Functions: {{{1
" Qi *sysfuncs*
if exists("qi_highlight_sys_functions")
  syn keyword qiFunc and append apply assoc assoc-type boolean? cd character?
  syn keyword qiFunc compile complex? concat congruent? cons? cons datatype
  syn keyword qiFunc debug defcc delete-file destroy difference
  syn keyword qiFunc do dump echo element? empty? explode fail-if
  syn keyword qiFunc findall fix float? freeze fst gensym get-array get-prop
  syn keyword qiFunc head identical 
  syn keyword qiFunc include include-all-but input input+ integer? inferences
  syn keyword qiFunc intersection length let lineread list m-prolog
  syn keyword qiFunc make-array make-string map mapcan maxinferences multi
  syn keyword qiFunc newsym newvar not nth number? occurrences occurs-check or
  syn keyword qiFunc opaque output print preclude preclude-all-but
  syn keyword qiFunc prolog? ps put-array put-prop quit random
  syn keyword qiFunc rational? read-char read-file-as-charlist read-file
  syn keyword qiFunc read-chars-as-stringlist real? remove reverse round rule
  syn keyword qiFunc s-prolog save snd speed sqrt step
  syn keyword qiFunc string? strong-warning sugarlist subst symbol?
  syn keyword qiFunc synonyms tail tc thaw time transparent tuple? type
  syn keyword qiFunc typecheck unassoc-type undebug union 
  syn keyword qiFunc value variable? version warn
  syn keyword qiFunc write-to-file y-or-n? > < >= <= = * / /. - == @p
  syn keyword qiFunc when is bind return call
endif

" ---------------------------------------------------------------------
" Qi Macros, Special Forms, Declarations, etc.: {{{1
" Basically anything that's some kind of operator but not a first-class
" function, i.e. no support for partial application etc.
syn keyword qiKey define nextgroup=qiFunctionDef skipwhite
syn match qiFunctionDef "[a-zA-Z\-_<>][a-zA-Z0-9_\-<>?]*" contained
syn keyword qiKey defcc nextgroup=qiRuleDef skipwhite
syn match qiRuleDef "<[a-zA-Z\-_][a-zA-Z0-9_\-?]*>" contained
syn keyword qiKey set nextgroup=qiVarDef skipwhite
syn match qiVarDef "\*[a-zA-Z\-_][a-zA-Z0-9_\-?]*\*" contained
syn keyword qiKey let if load tc
syn keyword qiKey spy profile unprofile profile-results specialise
syn keyword qiKey unspecialise track untrack sugar unsugar 
syn keyword qiKey where eval error do
syn match qiKey "->"
syn match qiKey ":="
syn match qiKey "<-"
syn match qiKey "/\."

" ---------------------------------------------------------------------
" Standard Qi Variables: {{{1
if exists("qi_highlight_special_vars")
  syn keyword qiVar *multi* *strong-warning* *currfunc* *sysfuncs* *speed*
  syn keyword qiVar *alist* *exempted-macro* *history* *qi_home_directory*
  syn keyword qiVar *version* *tempsigs* *assoctypes* *maxcomplexity*
  syn keyword qiVar *backtrack* *occurs* *inferences* *syntax-in* *syntax-out*
  syn keyword qiVar *special* *extraspecial* *alldatatypes* *datatypes*
  syn keyword qiVar *synonyms* *maxinferences* *spy* *call* *tc* *step*
  syn keyword qiVar *Failure* *first_n* *sources* *failure-object* *alphabet*
  syn keyword qiVar *signatures* *arity* *allsynonyms* *teststack* 
endif

" ---------------------------------------------------------------------
" Strings: {{{1
syn region qiString matchgroup=Normal start=+"+ skip=+\\\\\|\\"+ end=+"+ contains=@Spell

" ---------------------------------------------------------------------

" ---------------------------------------------------------------------
" Numbers: supporting integers and floating point numbers {{{1
syn match qiNumber "-\=\(\.\d\+\|\d\+\(\.\d*\)\=\)\(e[-+]\=\d\+\)\="
syn match qiNumber "\d\+/\d\+"

syn match qiSpecial !#|[^()'`,"; \t]\+|#!
syn match qiSpecial !#x\x\+!
syn match qiSpecial !#o\o\+!
syn match qiSpecial !#b[01]\+!
syn match qiSpecial !#\\[ -}\~]!
syn match qiSpecial !#[':][^()'`,"; \t]\+!
syn match qiSpecial !#([^()'`,"; \t]\+)!
syn match qiSpecial !#\\\%(Escape\|Space\|Newline\|Tab\|Page\|Rubout\|Linefeed\|Return\|Backspace\)!

syn match qiConcat "\s\.\s"
syn match qiParenError ")"

" ---------------------------------------------------------------------
" Comments: {{{1
syn cluster qiCommentGroup contains=qiTodo,@Spell
" ; is not a comment marker in Qi and if we pretend it was, it interferes with
" the ; in QiYacc rules.
" syn match qiComment ";.*$" contains=@qiCommentGroup
syn region qiCommentRegion start="\\" end="\\" keepend contains=qiCommentRegion,@qiCommentGroup
syn keyword qiTodo contained combak combak: todo todo: TODO TODO: FIXME FIXME:

" ---------------------------------------------------------------------
" Synchronization: {{{1
syn sync lines=100

" ---------------------------------------------------------------------
" Define Highlighting: {{{1
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508
 command -nargs=+ HiLink hi def link <args>

 HiLink qiCommentRegion qiComment
 HiLink qiAtomNmbr qiNumber
 HiLink qiAtomMark qiMark
 HiLink qiInStringString qiString

 HiLink qiFunctionDef Function
 HiLink qiRuleDef Function
 HiLink qiVarDef Function
 HiLink qiAtom Identifier
 HiLink qiAtomBarSymbol Special
 HiLink qiBarSymbol Special
 HiLink qiComment Comment
 HiLink qiConcat Statement
 HiLink qiDecl Statement
 HiLink qiFunc Statement
 HiLink qiKey Type
 HiLink qiMark Delimiter
 HiLink qiNumber Number
 HiLink qiParenError Error
 HiLink qiSpecial Number
 HiLink qiString String
 HiLink qiTodo Todo
 HiLink qiVar Number

 delcommand HiLink
endif

let b:current_syntax = "qi"

" ---------------------------------------------------------------------
" vim: ts=2 nowrap fdm=marker
