grammar CalculatorNotSimple;

// Parser rules
program: statements;

statements: statement+;

statement
    : identifier '=' expr ';'
    | 'begin' statements 'end'
    | 'if' expr 'then' statement ('else' statement)?
    | 'while' expr 'do' statement
    | 'for' identifier 'of' number 'to' number 'do' statement
    | 'loop' identifier ':' number 'do' statement
    | 'print' identifier ';'
    | 'print' stringLiteral ',' identifier ';'
    ;

expr
    : expr '^' expr
    | expr ('*' | '/') expr
    | expr ('+' | '-') expr
    | expr ('<' | '>' | '<=' | '>=' | '==' | '!=') expr
    | '!' expr
    | '(' expr ')'
    | identifier
    | number
    ;

// Lexer rules
identifier: LETTER (LETTER | DIGIT | '_')*;
number: INTEGER | FLOAT;
stringLiteral: STRING;

LETTER: [a-zA-Z];
DIGIT: [0-9];
INTEGER: DIGIT+;
FLOAT: DIGIT+ '.' DIGIT+;
STRING: '"' .*? '"';

WS: [ \t\r\n]+ -> skip;
COMMENT: '//' .*? '\n' -> skip;

// Keywords
BEGIN: 'begin';
END: 'end';
IF: 'if';
THEN: 'then';
ELSE: 'else';
WHILE: 'while';
DO: 'do';
FOR: 'for';
OF: 'of';
TO: 'to';
LOOP: 'loop';
PRINT: 'print';

// Operators
ASSIGN: '=';
PLUS: '+';
MINUS: '-';
MULTIPLY: '*';
DIVIDE: '/';
POWER: '^';
LT: '<';
GT: '>';
LE: '<=';
GE: '>=';
EQ: '==';
NE: '!=';
NOT: '!';