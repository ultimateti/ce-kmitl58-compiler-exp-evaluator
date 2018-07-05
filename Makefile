all: calc clean

calc.tab.c calc.tab.h:	calc.y
	bison -dv calc.y

lex.yy.c: calc.l calc.tab.h
	flex calc.l

calc: lex.yy.c calc.tab.c calc.tab.h
	gcc -o calc calc.tab.c lex.yy.c -lm

clean:
	rm calc.tab.c lex.yy.c calc.tab.h calc.output