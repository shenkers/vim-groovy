" Vim syntax file
"
" Language:	   Groovy
" Maintainer:	 Brian Stewart <brian@thecodesmith.com>
" Version: 	   0.2.0
" URL:	       github.com/thecodesmith/vim-groovy
" Last Change: 2018/06/18
"
" Much credit goes to the original authors:
" https://github.com/vim-scripts/groovy.vim
"
" History:
"   For version 5.x: Clear all syntax items
"   For version 6.x: Quit when a syntax file was already loaded
"
" Note: Relies on html.vim
"
" Usage:
"
" 1) copy the file in the (global or user's $HOME/.vim/syntax/) syntax folder
"
" 2) add this line to recognize groovy files by filename extension:
"      au BufNewFile,BufRead *.groovy  setf groovy
"    in the global vim filetype.vim file or inside $HOME/.vim/filetype.vim
"
" 3) add this part to recognize by content groovy script
"
"  if did_filetype()
"    finish
"  endif
"  if getline(1) =~ '^#!.*[/\\]groovy\>'
"    setf groovy
"  endif
"
"  in the global scripts.vim file or in $HOME/.vim/scripts.vim

" Quit when a syntax file was already loaded
if !exists('main_syntax')
  if version < 600
    syntax clear
  elseif exists('b:current_syntax')
    finish
  endif
  let main_syntax='groovy'
endif

" Don't use standard HiLink, it will not work with included syntax files
if version < 508
  command! -nargs=+ GroovyHiLink hi link <args>
else
  command! -nargs=+ GroovyHiLink hi def link <args>
endif

" ##########################
" some characters that cannot be in a groovy program (outside a string)
" syn match groovyError "[\\@`]"
" syn match groovyError "<<<\|\.\.\|=>\|<>\|||=\|&&=\|[^-]->\|\*\/"
" syn match groovyOK "\.\.\."

" keyword definitions

" taken from official docs:
syn keyword groovyKeyword
            \ as
            \ assert
            \ break
            \ case
            \ catch
            \ class
            \ const
            \ continue
            \ def
            \ default
            \ do
            \ else
            \ enum
            \ extends
            \ false
            \ finally
            \ for
            \ goto
            \ if
            \ implements
            \ import
            \ in
            \ instanceof
            \ interface
            \ new
            \ null
            \ package
            \ return
            \ super
            \ switch
            \ this
            \ throw
            \ throws
            \ trait
            \ true
            \ try
            \ while

syn keyword groovyExternal        native
syn match groovyExternal          '^package '
syn match groovyExternal          '\<import\s\+\(static\>\)\?'
syn keyword groovyError           goto const
syn keyword groovyConditional     if else switch
syn keyword groovyRepeat          while for do
syn keyword groovyBoolean         true false
syn keyword groovyConstant        null
syn keyword groovyTypedef         this super
syn keyword groovyOperator        new instanceof
syn keyword groovyType            void
syn keyword groovyPrimitiveType   boolean char byte short int long float double
syn keyword groovyObjectType		  Integer Double Date Boolean Float String Array Vector List
syn keyword groovyStatement       return
syn keyword groovyStorageClass    static synchronized transient volatile final strictfp serializable
syn keyword groovyExceptions      throw try catch finally
syn keyword groovyAssert          assert
syn keyword groovyMethodDecl      synchronized throws
syn keyword groovyClassDecl       extends implements interface
" use a match here to differentiate the keyword class from MyClass.class
syn match   groovyTypedef         '\.\s*\<class\>\s'ms=s+1
syn keyword groovyClassDecl       enum
syn match   groovyClassDecl       '^class\>'
syn match   groovyClassDecl       '[^.]\s*\<class\>\s'ms=s+1
syn match   groovyClassDecl       '^trait\>'
syn keyword groovyBranch          break continue nextgroup=groovyUserLabelRef skipwhite
syn match   groovyUserLabelRef    '\k\+' contained
syn keyword groovyScopeDecl       public protected private abstract

if exists('groovy_highlight_groovy_lang_ids') || exists('groovy_highlight_groovy_lang') || exists('groovy_highlight_all')
  " groovy.lang.*
  syn keyword groovyLangClass  Closure MetaMethod GroovyObject

  syn match groovyJavaLangClass '\<System\>'
  syn keyword groovyJavaLangClass Cloneable Comparable Runnable Serializable Boolean Byte Class Object
  syn keyword groovyJavaLangClass Character CharSequence ClassLoader Compiler
  " syn keyword groovyJavaLangClass Integer Double Float Long
  syn keyword groovyJavaLangClass InheritableThreadLocal Math Number Object Package Process
  syn keyword groovyJavaLangClass Runtime RuntimePermission InheritableThreadLocal
  syn keyword groovyJavaLangClass SecurityManager Short StrictMath StackTraceElement
  syn keyword groovyJavaLangClass StringBuffer Thread ThreadGroup
  syn keyword groovyJavaLangClass ThreadLocal Throwable Void ArithmeticException
  syn keyword groovyJavaLangClass ArrayIndexOutOfBoundsException AssertionError
  syn keyword groovyJavaLangClass ArrayStoreException ClassCastException
  syn keyword groovyJavaLangClass ClassNotFoundException
  syn keyword groovyJavaLangClass CloneNotSupportedException Exception
  syn keyword groovyJavaLangClass IllegalAccessException
  syn keyword groovyJavaLangClass IllegalArgumentException
  syn keyword groovyJavaLangClass IllegalMonitorStateException
  syn keyword groovyJavaLangClass IllegalStateException
  syn keyword groovyJavaLangClass IllegalThreadStateException
  syn keyword groovyJavaLangClass IndexOutOfBoundsException
  syn keyword groovyJavaLangClass InstantiationException InterruptedException
  syn keyword groovyJavaLangClass NegativeArraySizeException NoSuchFieldException
  syn keyword groovyJavaLangClass NoSuchMethodException NullPointerException
  syn keyword groovyJavaLangClass NumberFormatException RuntimeException
  syn keyword groovyJavaLangClass SecurityException StringIndexOutOfBoundsException
  syn keyword groovyJavaLangClass UnsupportedOperationException
  syn keyword groovyJavaLangClass AbstractMethodError ClassCircularityError
  syn keyword groovyJavaLangClass ClassFormatError Error ExceptionInInitializerError
  syn keyword groovyJavaLangClass IllegalAccessError InstantiationError
  syn keyword groovyJavaLangClass IncompatibleClassChangeError InternalError
  syn keyword groovyJavaLangClass LinkageError NoClassDefFoundError
  syn keyword groovyJavaLangClass NoSuchFieldError NoSuchMethodError
  syn keyword groovyJavaLangClass OutOfMemoryError StackOverflowError
  syn keyword groovyJavaLangClass ThreadDeath UnknownError UnsatisfiedLinkError
  syn keyword groovyJavaLangClass UnsupportedClassVersionError VerifyError
  syn keyword groovyJavaLangClass VirtualMachineError

  syn keyword groovyJavaLangObject clone equals finalize getClass hashCode
  syn keyword groovyJavaLangObject notify notifyAll toString wait

  GroovyHiLink groovyLangClass      groovyConstant
  GroovyHiLink groovyJavaLangClass  groovyExternal
  GroovyHiLink groovyJavaLangObject groovyConstant
  syn cluster groovyTop     add=groovyJavaLangObject,groovyJavaLangClass,groovyLangClass
  syn cluster groovyClasses add=groovyJavaLangClass,groovyLangClass
endif

" Groovy stuff
syn match groovyOperator '\.\.'
syn match groovyOperator ' <\{2,3} '
syn match groovyOperator ' >\{2,3} '
syn match groovyOperator '->'
syn match groovyExternal '^#!.*[/\\]groovy\>'
syn match groovyExceptions '\<Exception\>\|\<[A-Z]\{1,}[a-zA-Z0-9]*Exception\>'

" Groovy JDK stuff
syn keyword groovyJDKBuiltin as def in
syn keyword groovyJDKOperOverl div minus plus abs round power multiply
syn keyword groovyJDKMethods each call inject sort print println
syn keyword groovyJDKMethods getAt putAt size push pop toList getText writeLine eachLine readLines
syn keyword groovyJDKMethods withReader withStream withWriter withPrintWriter write read leftShift
syn keyword groovyJDKMethods withWriterAppend readBytes splitEachLine
syn keyword groovyJDKMethods newInputStream newOutputStream newPrintWriter newReader newWriter
syn keyword groovyJDKMethods compareTo next previous isCase
syn keyword groovyJDKMethods times step toInteger upto any collect collectEntries dump every find findAll grep
syn keyword groovyJDKMethods inspect invokeMethods join
syn keyword groovyJDKMethods getErr getIn getOut waitForOrKill
syn keyword groovyJDKMethods count tokenize asList flatten immutable intersect reverse reverseEach
syn keyword groovyJDKMethods subMap append asWritable eachByte eachLine eachFile
syn cluster groovyTop add=groovyJDKBuiltin,groovyJDKOperOverl,groovyJDKMethods

if exists('groovy_space_errors')
  if !exists('groovy_no_trail_space_error')
    syn match groovySpaceError '\s\+$'
  endif
  if !exists('groovy_no_tab_space_error')
    syn match groovySpaceError ' \+\t'me=e-1
  endif
endif

" it is a better case construct than java.vim to match groovy syntax
syn region  groovyLabelRegion transparent matchgroup=groovyLabel start='\<case\>' matchgroup=NONE end=':\|$' contains=groovyNumber,groovyString,groovyLangClass,groovyJavaLangClass
syn match   groovyUserLabel '^\s*[_$a-zA-Z][_$a-zA-Z0-9_]*\s*:'he=e-1 contains=groovyLabel
syn keyword groovyLabel default

" The following cluster contains all groovy groups except the contained ones
syn cluster groovyTop add=groovyExternal,groovyError,groovyError,groovyBranch,groovyLabelRegion,groovyLabel,groovyConditional,groovyRepeat,groovyBoolean,groovyConstant,groovyTypedef,groovyOperator,groovyType,groovyPrimitiveType,groovyObjectType,groovyStatement,groovyStorageClass,groovyAssert,groovyExceptions,groovyMethodDecl,groovyClassDecl,groovyClassDecl,groovyClassDecl,groovyScopeDecl,groovyError,groovyError2,groovyUserLabel,groovyLangObject

" Comments
syn keyword groovyTodo contained TODO FIXME

if exists('groovy_comment_strings')
  syn region  groovyCommentString    contained start=+"+ end=+"+ end=+$+ end=+\*/+me=s-1,he=s-1 contains=groovySpecial,groovyCommentStar,groovySpecialChar,@Spell
  syn region  groovyComment2String   contained start=+"+  end=+$\|"+                            contains=groovySpecial,groovySpecialChar,@Spell
  syn match   groovyCommentCharacter contained "'\\[^']\{1,6\}'" contains=groovySpecialChar
  syn match   groovyCommentCharacter contained "'\\''"           contains=groovySpecialChar
  syn match   groovyCommentCharacter contained "'[^\\]'"
  syn cluster groovyCommentSpecial  add=groovyCommentString,groovyCommentCharacter,groovyNumber
  syn cluster groovyCommentSpecial2 add=groovyComment2String,groovyCommentCharacter,groovyNumber
endif

syn region groovyComment     start='/\*'  end='\*/' contains=@groovyCommentSpecial,groovyTodo,@Spell
syn match  groovyCommentStar contained '^\s*\*[^/]'me=e-1
syn match  groovyCommentStar contained '^\s*\*$'
syn match  groovyLineComment '//.*' contains=@groovyCommentSpecial2,groovyTodo,@Spell
syn match  groovyLineComment '#.*'  contains=@groovyCommentSpecial2,groovyTodo,@Spell

GroovyHiLink groovyCommentString groovyString
GroovyHiLink groovyComment2String groovyString
GroovyHiLink groovyCommentCharacter groovyCharacter

syn cluster groovyTop add=groovyComment,groovyLineComment

syn region groovyDocComment start='/\*\*' end='\*/' keepend contains=groovyCommentTitle,groovyDocTags,groovyTodo,@Spell
syn region groovyDocTags  contained start='{@\(link\|linkplain\|inherit[Dd]oc\|doc[rR]oot\|value\)' end='}'
syn match  groovyDocTags  contained '@\(see\|param\|exception\|throws\|since\)\s\+\S\+' contains=groovyDocParam
syn match  groovyDocTags  contained '@\(version\|author\|return\|deprecated\|serial\|serialField\|serialData\)\>'
syn match  groovyDocParam contained '\s\S\+'
syn match  groovyComment '/\*\*/' " match comment form: /**/

" TODO: copy this for yaml string support
" if !exists('groovy_ignore_groovydoc') && main_syntax != 'jsp'
"   syntax case ignore
"   " syntax coloring for groovydoc comments (HTML)
"   " syntax include @groovyHtml <sfile>:p:h/html.vim
"   syntax include @groovyHtml runtime! syntax/html.vim
"   unlet b:current_syntax
"   syn region groovyDocComment   start="/\*\*"  end="\*/" keepend contains=groovyCommentTitle,@groovyHtml,groovyDocTags,groovyTodo,@Spell
"   syn region groovyCommentTitle contained matchgroup=groovyDocComment start="/\*\*"   matchgroup=groovyCommentTitle keepend end="\.$" end="\.[ \t\r<&]"me=e-1 end="[^{]@"me=s-2,he=s-1 end="\*/"me=s-1,he=s-1 contains=@groovyHtml,groovyCommentStar,groovyTodo,@Spell,groovyDocTags

"   syn region groovyDocTags  contained start="{@\(link\|linkplain\|inherit[Dd]oc\|doc[rR]oot\|value\)" end="}"
"   syn match  groovyDocTags  contained "@\(see\|param\|exception\|throws\|since\)\s\+\S\+" contains=groovyDocParam
"   syn match  groovyDocParam contained "\s\S\+"
"   syn match  groovyDocTags  contained "@\(version\|author\|return\|deprecated\|serial\|serialField\|serialData\)\>"
"   syntax case match
" endif

" Strings and constants
syn match  groovySpecialError     contained '\\.'
syn match  groovySpecialCharError contained "[^']"
syn match  groovySpecialChar      contained "\\\([4-9]\d\|[0-3]\d\d\|[\"\\'ntbrf]\|u\x\{4\}\)"
syn region groovyString start=/"/   end=/"/   end=/$/ contains=groovySpecialChar,groovySpecialError,@Spell,groovyInterpolatedWrapper
syn region groovyString start=/"""/ end=/"""/         contains=groovySpecialChar,groovySpecialError,@Spell,groovyInterpolatedWrapper
syn region groovyString start=/'/   end=/'/   end=/$/ contains=groovySpecialChar,groovySpecialError,@Spell
syn region groovyString start=/'''/ end=/'''/         contains=groovySpecialChar,groovySpecialError,@Spell

syn region groovyInterpolatedWrapper start="\${" end="}" contained containedin=groovyString contains=groovyString
syn match groovyInterpolatedString "\v\w+(\(\))?" contained containedin=groovyInterpolatedWrapper

" syn region groovyYamlString start=/yaml '''/ end=/'''/

" TODO: attempt at yaml syntax inside groovy string; see HTML handling later
" syn region  groovyYamlString matchgroup=Delimiter
" \ start=+yaml '''+
" \ end=+'''+
" \ contains=@htmlJavascript,phpIdentifierSimply,phpIdentifier,phpIdentifierComplex,phpBackslashSequences,phpMethodsVar,@Spell
" \ keepend extend
" \ contained

syn match groovyInterpolatedWrapper /\${.\{-}}/ contained
syn match groovyInterpolatedWrapper /\$\w\+/    contained
GroovyHiLink groovyInterpolatedWrapper Normal

" TODO: necessary?
" syn match groovyClosureParams	'[ a-zA-Z0-9_*]\+' contained
" GroovyHiLink groovyClosureParams Identifier
" next line disabled, it can cause a crash for long lines
" syn match groovyStringError '"\([^"\\]\|\\.\)*$'

syn match groovyNumber '\v<0x[0-9a-fA-F]+>'                   " hex
syn match groovyNumber '\v<0[0-7]+>'                          " octal
syn match groovyNumber '\v<0b[01]+>'                          " binary
syn match groovyNumber '\v<\d+[iIlLgG]?>'                     " int/long/BigInteger
syn match groovyNumber '\v<\d(\.\d+)?[fFdDgG]?>'              " double/float/BigDecimal
syn match groovyNumber '\v<\d[0-9_]+[lLiIgG]?>'               " underscore int/long/BigInteger
syn match groovyNumber '\v<\d[0-9_]+(\.[0-9_]+)?[dDfFgG]?>'   " underscore double/float/BigDecimal
syn match groovyNumber '\v<\d+(\.\d+)?[eE][-+]?\d+[fFdDgG]?>' " exponent

syn match groovyAnnotation '^\s*@\w\+'

" unicode characters
syn match groovySpecial '\\u\d\{4\}'

syn cluster groovyTop add=groovyString,groovyCharacter,groovyNumber,groovySpecial,groovyStringError

if exists('groovy_highlight_functions')
  if groovy_highlight_functions == 'indent'
    syn match  groovyFuncDef "^\(\t\| \{8\}\)[_$a-zA-Z][_$a-zA-Z0-9_. \[\]]*([^-+*/()]*)"                  contains=groovyScopeDecl,groovyType,groovyPrimitiveType,groovyObjectType,groovyStorageClass,@groovyClasses
    syn region groovyFuncDef start=+^\(\t\| \{8\}\)[$_a-zA-Z][$_a-zA-Z0-9_. \[\]]*([^-+*/()]*,\s*+ end=+)+ contains=groovyScopeDecl,groovyType,groovyStorageClass,@groovyClasses
    syn match  groovyFuncDef "^  [$_a-zA-Z][$_a-zA-Z0-9_. \[\]]*([^-+*/()]*)"                              contains=groovyScopeDecl,groovyType,groovyStorageClass,@groovyClasses
    syn region groovyFuncDef start=+^  [$_a-zA-Z][$_a-zA-Z0-9_. \[\]]*([^-+*/()]*,\s*+ end=+)+             contains=groovyScopeDecl,groovyType,groovyStorageClass,@groovyClasses
  else
    " This line catches method declarations at any indentation>0, but it assumes
    " two things:
    "   1. class names are always capitalized (ie: Button)
    "   2. method names are never capitalized (except constructors, of course)
    syn region groovyFuncDef start=+^\s\+\(\(public\|protected\|private\|static\|abstract\|final\|native\|synchronized\)\s\+\)*\(\(void\|boolean\|char\|byte\|short\|int\|long\|float\|double\|\([A-Za-z_][A-Za-z0-9_$]*\.\)*[A-Z][A-Za-z0-9_$]*\)\(<[^>]*>\)\=\(\[\]\)*\s\+[a-z][A-Za-z0-9_$]*\|[A-Z][A-Za-z0-9_$]*\)\s*([^0-9]+ end=+)+ contains=groovyScopeDecl,groovyType,groovyPrimitiveType,groovyObjectType,groovyStorageClass,groovyComment,groovyLineComment,@groovyClasses
  endif
  syn match groovyBraces '[{}]'
  syn cluster groovyTop add=groovyFuncDef,groovyBraces
endif

if exists("groovy_highlight_debug")
  " Strings and constants
  syn match   groovyDebugSpecial          contained "\\\d\d\d\|\\."
  syn region  groovyDebugString           contained start=+"+  end=+"+  contains=groovyDebugSpecial
  syn match   groovyDebugStringError      +"\([^"\\]\|\\.\)*$+
  syn match   groovyDebugCharacter        contained "'[^\\]'"
  syn match   groovyDebugSpecialCharacter contained "'\\.'"
  syn match   groovyDebugSpecialCharacter contained "'\\''"
  syn match   groovyDebugNumber           contained "\<\(0[0-7]*\|0[xX]\x\+\|\d\+\)[lL]\=\>"
  syn match   groovyDebugNumber           contained "\(\<\d\+\.\d*\|\.\d\+\)\([eE][-+]\=\d\+\)\=[fFdD]\="
  syn match   groovyDebugNumber           contained "\<\d\+[eE][-+]\=\d\+[fFdD]\=\>"
  syn match   groovyDebugNumber           contained "\<\d\+\([eE][-+]\=\d\+\)\=[fFdD]\>"
  syn keyword groovyDebugBoolean          contained true false
  syn keyword groovyDebugType             contained null this super
  syn region  groovyDebugParen  start=+(+ end=+)+ contained contains=groovyDebug.*,groovyDebugParen

  " to make this work you must define the highlighting for these groups
  syn match groovyDebug "\<System\.\(out\|err\)\.print\(ln\)*\s*("me=e-1 contains=groovyDebug.* nextgroup=groovyDebugParen
  syn match groovyDebug "\<p\s*("me=e-1 contains=groovyDebug.* nextgroup=groovyDebugParen
  syn match groovyDebug "[A-Za-z][a-zA-Z0-9_]*\.printStackTrace\s*("me=e-1 contains=groovyDebug.* nextgroup=groovyDebugParen
  syn match groovyDebug "\<trace[SL]\=\s*("me=e-1 contains=groovyDebug.* nextgroup=groovyDebugParen

  syn cluster groovyTop add=groovyDebug

  if version >= 508 || !exists('did_c_syn_inits')
    GroovyHiLink groovyDebug                 Debug
    GroovyHiLink groovyDebugString           DebugString
    GroovyHiLink groovyDebugStringError      groovyError
    GroovyHiLink groovyDebugType             DebugType
    GroovyHiLink groovyDebugBoolean          DebugBoolean
    GroovyHiLink groovyDebugNumber           Debug
    GroovyHiLink groovyDebugSpecial          DebugSpecial
    GroovyHiLink groovyDebugSpecialCharacter DebugSpecial
    GroovyHiLink groovyDebugCharacter        DebugString
    GroovyHiLink groovyDebugParen            Debug

    GroovyHiLink DebugString               String
    GroovyHiLink DebugSpecial              Special
    GroovyHiLink DebugBoolean              Boolean
    GroovyHiLink DebugType                 Type
  endif
endif

" Match all Exception classes
syn match groovyExceptions '\<Exception\>\|\<[A-Z]\{1,}[a-zA-Z0-9]*Exception\>'

if !exists('groovy_minlines')
  let groovy_minlines = 10
endif
exec 'syn sync ccomment groovyComment minlines=' . groovy_minlines

" ## Groovy stuff

syn match groovyOperator '|[ ,a-zA-Z0-9_*]\+|'

" All groovy valid tokens
" syn match groovyTokens ";\|,\|<=>\|<>\|:\|:=\|>\|>=\|=\|==\|<\|<=\|!=\|/\|/=\|\.\.|\.\.\.\|\~=\|\~=="
" syn match groovyTokens "\*=\|&\|&=\|\*\|->\|\~\|+\|-\|/\|?\|<<<\|>>>\|<<\|>>"

" Must put explicit these ones because groovy.vim mark them as errors otherwise
" syn match groovyTokens "<=>\|<>\|==\~"
" syn cluster groovyTop add=groovyTokens

" Mark these as operators

" Hightlight brackets
" syn match groovyBraces '[{}]'
" syn match groovyBraces '[\[\]]'
" syn match groovyBraces '[\|]'

if exists('groovy_mark_braces_in_parens_as_errors')
  syn match groovyInParen contained "[{}]"
  GroovyHiLink groovyInParen groovyError
  syn cluster groovyTop add=groovyInParen
endif

" catch errors caused by wrong parenthesis
syn region groovyParenT  transparent matchgroup=groovyParen  start='('  end=')' contains=@groovyTop,groovyParenT1
syn region groovyParenT1 transparent matchgroup=groovyParen1 start='(' end=')'  contains=@groovyTop,groovyParenT2 contained
syn region groovyParenT2 transparent matchgroup=groovyParen2 start='(' end=')'  contains=@groovyTop,groovyParenT  contained
syn match  groovyParenError ')'

GroovyHiLink groovyParenError groovyError

" catch errors caused by wrong square brackets
syn region groovyParenT  transparent matchgroup=groovyParen  start='\['  end='\]' contains=@groovyTop,groovyParenT1
syn region groovyParenT1 transparent matchgroup=groovyParen1 start='\[' end='\]'  contains=@groovyTop,groovyParenT2 contained
syn region groovyParenT2 transparent matchgroup=groovyParen2 start='\[' end='\]'  contains=@groovyTop,groovyParenT  contained
syn match  groovyParenError '\]'

" ## Java stuff

" java.vim default highlighting
if version >= 508 || !exists('did_groovy_syn_inits')
  if version < 508
    let did_groovy_syn_inits = 1
  endif
  GroovyHiLink groovyFuncDef          Function
  GroovyHiLink groovyBraces           Function
  GroovyHiLink groovyBranch           Conditional
  GroovyHiLink groovyUserLabelRef     groovyUserLabel
  GroovyHiLink groovyLabel            Label
  GroovyHiLink groovyUserLabel        Label
  GroovyHiLink groovyConditional      Conditional
  GroovyHiLink groovyRepeat           Repeat
  GroovyHiLink groovyExceptions       Exception
  GroovyHiLink groovyAssert           Statement
  GroovyHiLink groovyStorageClass     StorageClass
  GroovyHiLink groovyMethodDecl       groovyStorageClass
  GroovyHiLink groovyClassDecl        groovyStorageClass
  GroovyHiLink groovyScopeDecl        groovyStorageClass
  GroovyHiLink groovyBoolean          Boolean
  GroovyHiLink groovySpecial          Special
  GroovyHiLink groovySpecialError     Error
  GroovyHiLink groovySpecialCharError Error
  GroovyHiLink groovyString           String
  GroovyHiLink groovyCharacter        Character
  GroovyHiLink groovySpecialChar      SpecialChar
  GroovyHiLink groovyNumber           Number
  GroovyHiLink groovyError            Error
  GroovyHiLink groovyStringError      Error
  GroovyHiLink groovyStatement        Statement
  GroovyHiLink groovyOperator         Operator
  GroovyHiLink groovyComment          Comment
  GroovyHiLink groovyDocComment       Comment
  GroovyHiLink groovyLineComment      Comment
  GroovyHiLink groovyConstant         Constant
  GroovyHiLink groovyTypedef          Typedef
  GroovyHiLink groovyTodo             Todo
  GroovyHiLink groovyAnnotation       Annotation

  GroovyHiLink groovyCommentTitle     SpecialComment
  GroovyHiLink groovyDocTags          Special
  GroovyHiLink groovyDocParam         Function
  GroovyHiLink groovyCommentStar      groovyComment

  GroovyHiLink groovyType             Type
  GroovyHiLink groovyPrimitiveType    Type
  GroovyHiLink groovyObjectType       Normal
  GroovyHiLink groovyExternal         Include

  GroovyHiLink htmlComment            Special
  GroovyHiLink htmlCommentPart        Special
  GroovyHiLink groovySpaceError       Error
  GroovyHiLink groovyJDKBuiltin       Special
  GroovyHiLink groovyJDKOperOverl     Operator
  GroovyHiLink groovyJDKMethods       Function
  GroovyHiLink groovyKeyword          Keyword
endif

delcommand GroovyHiLink

let b:current_syntax = 'groovy'
if main_syntax == 'groovy'
  unlet main_syntax
endif

let b:spell_options='contained'

" vim: ts=2
