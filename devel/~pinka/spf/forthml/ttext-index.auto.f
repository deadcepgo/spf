



FORTH-WORDLIST PUSH-DEVELOP  





`CONTAINS 2>CS CONCEIVE 
`SEARCH & EXEC, 
`NIP & EXEC, 
`NIP & EXEC, 
BIRTH 2CS> NAMING- 
`STARTS-WITH 2>CS CONCEIVE 
`ROT & EXEC, 
`OVER & EXEC, 
`ULT & EXEC, ZBFW, 
`2DROP & EXEC, 
`DROP & EXEC, 
`FALSE & EXEC, EXIT, RFW 
`TUCK & EXEC, 
`EQUAL & EXEC, 
BIRTH 2CS> NAMING- 
`ENDS-WITH 2>CS CONCEIVE 
`DUP & EXEC, 
`>R & EXEC, 
`2SWAP & EXEC, 
`DUP & EXEC, 
`R@ & EXEC, 
`ULT & EXEC, ZBFW, 
`2DROP & EXEC, 
`2DROP & EXEC, 
`RDROP & EXEC, 
`FALSE & EXEC, EXIT, RFW 
`R@ & EXEC, 
`- & EXEC, 
`+ & EXEC, 
`R> & EXEC, 
`EQUAL & EXEC, 
BIRTH 2CS> NAMING- 
`SUBSTRING-AFTER 2>CS CONCEIVE 
`DUP & EXEC, 
`>R & EXEC, 
`SEARCH & EXEC, ZBFW, 
`SWAP & EXEC, 
`R@ & EXEC, 
`+ & EXEC, 
`SWAP & EXEC, 
`R> & EXEC, 
`- & EXEC, EXIT, RFW 
`RDROP & EXEC, 
`2DROP & EXEC, 0 LIT, 0 LIT, 
BIRTH 2CS> NAMING- 
`SUBSTRING-BEFORE 2>CS CONCEIVE 3 LIT, 
`PICK & EXEC, 
`>R & EXEC, 
`SEARCH & EXEC, ZBFW, 
`DROP & EXEC, 
`R> & EXEC, 
`TUCK & EXEC, 
`- & EXEC, EXIT, RFW 
`RDROP & EXEC, 
`2DROP & EXEC, 0 LIT, 0 LIT, 
BIRTH 2CS> NAMING- 
`SPLIT- 2>CS CONCEIVE 3 LIT, 
`PICK & EXEC, 
`>R & EXEC, 
`DUP & EXEC, 
`>R & EXEC, 
`SEARCH & EXEC, ZBFW, 
`OVER & EXEC, 
`R@ & EXEC, 
`+ & EXEC, 
`SWAP & EXEC, 
`R> & EXEC, 
`- & EXEC, 
`ROT & EXEC, 
`R@ & EXEC, 
`- & EXEC, 
`R> & EXEC, 
`SWAP & EXEC, 
`TRUE & EXEC, EXIT, RFW 
`2R> & EXEC, 
`2DROP & EXEC, 
`FALSE & EXEC, 
BIRTH 2CS> NAMING- 
`SPLIT 2>CS CONCEIVE 
`DUP & EXEC, 
`>R & EXEC, 3 LIT, 
`PICK & EXEC, 
`>R & EXEC, 
`SEARCH & EXEC, ZBFW, 
`SWAP & EXEC, 
`R@ & EXEC, 
`OVER & EXEC, 
`R> & EXEC, 
`- & EXEC, 
`2SWAP & EXEC, 
`R@ & EXEC, 
`+ & EXEC, 
`SWAP & EXEC, 
`R> & EXEC, 
`- & EXEC, 
`TRUE & EXEC, EXIT, RFW 
`2R> & EXEC, 
`2DROP & EXEC, 
`FALSE & EXEC, 
BIRTH 2CS> NAMING- 
`MATCH-HEAD 2>CS CONCEIVE 2 LIT, 
`PICK & EXEC, 
`OVER & EXEC, 
`ULT & EXEC, ZBFW, 
`2DROP & EXEC, 
`FALSE & EXEC, EXIT, RFW 
`DUP & EXEC, 
`>R & EXEC, 3 LIT, 
`PICK & EXEC, 
`R@ & EXEC, 
`EQUAL & EXEC, 
`0EQ & EXEC, ZBFW, 
`RDROP & EXEC, 
`FALSE & EXEC, EXIT, RFW 
`SWAP & EXEC, 
`R@ & EXEC, 
`+ & EXEC, 
`SWAP & EXEC, 
`R> & EXEC, 
`- & EXEC, 
`TRUE & EXEC, 
BIRTH 2CS> NAMING- 


`MATCH-STARTS 2>CS CONCEIVE 
`MATCH-HEAD & EXEC, 
BIRTH 2CS> NAMING- 






`IS-WHITE 2>CS CONCEIVE 0x21 LIT, 
`ULT & EXEC, 
BIRTH 2CS> NAMING- 
`FINE-HEAD 2>CS CONCEIVE 

MBW 
`DUP & EXEC, ZBFW2, 
`OVER & EXEC, 
`C@ & EXEC, 
`IS-WHITE & EXEC, ZBFW2, 
`SWAP & EXEC, 
`CHAR+ & EXEC, 
`SWAP & EXEC, 
`CHAR- & EXEC, BBW, RFW RFW 

BIRTH 2CS> NAMING- 
`FINE-TAIL 2>CS CONCEIVE 

`OVER & EXEC, 
`+ & EXEC, MBW 
`2DUP & EXEC, 
`EQ & EXEC, ZBFW, 
`DROP & EXEC, 0 LIT, EXIT, RFW 
`CHAR- & EXEC, 
`DUP & EXEC, 
`C@ & EXEC, 
`IS-WHITE & EXEC, 
`0EQ & EXEC, ZBBW, 
`CHAR+ & EXEC, 
`OVER & EXEC, 
`- & EXEC, 
BIRTH 2CS> NAMING- 
`SPLIT-WHITE-FORCE 2>CS CONCEIVE 
`2DUP & EXEC, 
`OVER & EXEC, 
`+ & EXEC, 
`SWAP & EXEC, MBW 
`2DUP & EXEC, 
`EQ & EXEC, ZBFW, 
`DROP & EXEC, 0 LIT, EXIT, RFW 
`DUP & EXEC, 
`CHAR+ & EXEC, 
`SWAP & EXEC, 
`C@ & EXEC, 
`IS-WHITE & EXEC, ZBBW, 
`CHAR- & EXEC, 
`DUP & EXEC, 
`>R & EXEC, 
`- & EXEC, 
`DUP & EXEC, 
`>R & EXEC, 
`- & EXEC, 
`2R> & EXEC, 
BIRTH 2CS> NAMING- 
`-SPLIT-WHITE-FORCE 2>CS CONCEIVE 
`2DUP & EXEC, 
`OVER & EXEC, 
`+ & EXEC, MBW 
`2DUP & EXEC, 
`EQ & EXEC, ZBFW, 
`NIP & EXEC, 0 LIT, 
`2SWAP & EXEC, EXIT, RFW 
`CHAR- & EXEC, 
`DUP & EXEC, 
`SWAP & EXEC, 
`C@ & EXEC, 
`IS-WHITE & EXEC, ZBBW, 
`CHAR+ & EXEC, 
`TUCK & EXEC, 
`>R & EXEC, 
`- & EXEC, 
`TUCK & EXEC, 
`- & EXEC, 
`R> & EXEC, 
`SWAP & EXEC, 
BIRTH 2CS> NAMING- 
`UNBROKEN 2>CS CONCEIVE 
`-SPLIT-WHITE-FORCE & EXEC, 2 LIT, 
`PICK & EXEC, ZBFW, 
`2DROP & EXEC, EXIT, RFW 
`2SWAP & EXEC, 
`2DROP & EXEC, 
BIRTH 2CS> NAMING- 
`WORD|TAIL 2>CS CONCEIVE 
`FINE-HEAD & EXEC, 
`SPLIT-WHITE-FORCE & EXEC, 
BIRTH 2CS> NAMING- 

DROP-DEVELOP

 




`CDR 2>CS CONCEIVE 
`CELL- & EXEC, 
`@ & EXEC, 
BIRTH 2CS> NAMING- 
`TIED 2>CS CONCEIVE 
`OVER & EXEC, 
`CELL- & EXEC, 
`! & EXEC, 
BIRTH 2CS> NAMING- 
`TIED- 2>CS CONCEIVE 
`TUCK & EXEC, 
`CELL- & EXEC, 
`! & EXEC, 
BIRTH 2CS> NAMING- 
`UNTIED 2>CS CONCEIVE 
`CELL- & EXEC, 
`DUP & EXEC, 
`@ & EXEC, 
`SWAP & EXEC, 
`0! & EXEC, 
BIRTH 2CS> NAMING- 

`BIND-NODE 2>CS CONCEIVE 
`2DUP & EXEC, 
`@ & EXEC, 
`SWAP & EXEC, 
`CELL- & EXEC, 
`! & EXEC, 
`! & EXEC, 

BIRTH 2CS> NAMING- 
`UNBIND-NODE 2>CS CONCEIVE 
`DUP & EXEC, 
`@ & EXEC, 
`DUP & EXEC, 
`0= & EXEC, ZBFW, 
`NIP & EXEC, EXIT, RFW 

`TUCK & EXEC, 
`CELL- & EXEC, 
`@ & EXEC, 
`SWAP & EXEC, 
`! & EXEC, 
BIRTH 2CS> NAMING- 
`CDR-BY-VALUE 2>CS CONCEIVE 
MBW 
`DUP & EXEC, ZBFW2, 
`2DUP & EXEC, 
`@ & EXEC, 
`NEQ & EXEC, ZBFW2, 
`CELL- & EXEC, 
`@ & EXEC, BBW, RFW RFW 

BIRTH 2CS> NAMING- 
`FOREACH-NODE 2>CS CONCEIVE 
MBW 
`DUP & EXEC, ZBFW2, 
`2DUP & EXEC, 
`2>R & EXEC, 
`SWAP & EXEC, 
`EXECUTE & EXEC, 
`2R> & EXEC, 
`CELL- & EXEC, 
`@ & EXEC, BBW, RFW 
`2DROP & EXEC, 
BIRTH 2CS> NAMING- 
`REVERSE-NODE 2>CS CONCEIVE 0 LIT, 
`SWAP & EXEC, MBW 
`DUP & EXEC, ZBFW2, 
`TUCK & EXEC, 
`CELL- & EXEC, 
`DUP & EXEC, 
`@ & EXEC, 
`-ROT & EXEC, 
`! & EXEC, BBW, RFW 
`DROP & EXEC, 
BIRTH 2CS> NAMING- 
`FIND-LIST 2>CS CONCEIVE 
`@ & EXEC, 
`CDR-BY-VALUE & EXEC, 
`DUP & EXEC, ZBFW, 
`NIP & EXEC, 
`TRUE & EXEC, RFW 

BIRTH 2CS> NAMING- 
`FIND-LIST-SUB 2>CS CONCEIVE 
`SWAP & EXEC, 
`>R & EXEC, 
`DUP & EXEC, 
`@ & EXEC, MBW 
`DUP & EXEC, ZBFW2, 

`DUP & EXEC, 
`@ & EXEC, 
`R@ & EXEC, 
`= & EXEC, ZBFW, 
`DROP & EXEC, 
`RDROP & EXEC, 
`TRUE & EXEC, EXIT, RFW 
`NIP & EXEC, 
`CELL- & EXEC, 
`DUP & EXEC, 
`@ & EXEC, BBW, RFW 
`2DROP & EXEC, 
`R> & EXEC, 
`FALSE & EXEC, 
BIRTH 2CS> NAMING- 
`FOREACH-LIST-NODE 2>CS CONCEIVE 
`@ & EXEC, 
`FOREACH-NODE & EXEC, 
BIRTH 2CS> NAMING- 
`FOREACH-LIST-VALUE 2>CS CONCEIVE 
`@ & EXEC, MBW 
`DUP & EXEC, ZBFW2, 
`2DUP & EXEC, 
`2>R & EXEC, 
`@ & EXEC, 
`SWAP & EXEC, 
`EXECUTE & EXEC, 
`2R> & EXEC, 
`CELL- & EXEC, 
`@ & EXEC, BBW, RFW 
`2DROP & EXEC, 
BIRTH 2CS> NAMING- 
`FOR-LIST-NODE 2>CS CONCEIVE 
`SWAP & EXEC, 
`FOREACH-LIST-NODE & EXEC, 
BIRTH 2CS> NAMING- 
`FOR-LIST-VALUE 2>CS CONCEIVE 
`SWAP & EXEC, 
`FOREACH-LIST-VALUE & EXEC, 
BIRTH 2CS> NAMING- 
`CALC-NODE-TAIL 2>CS CONCEIVE 0 LIT, `NIP & LIT, 
`ROT & EXEC, 
`FOREACH-NODE & EXEC, 
BIRTH 2CS> NAMING- 
`CALC-LIST-TAIL 2>CS CONCEIVE 
`@ & EXEC, 
`CALC-NODE-TAIL & EXEC, 
BIRTH 2CS> NAMING- 

`BIND-RNODE 2>CS CONCEIVE 
`2DUP & EXEC, 
`@ & EXEC, 
`DUP & EXEC, ZBFW, 
`CELL- & EXEC, 
`! & EXEC, 
`! & EXEC, EXIT, RFW 
`2DROP & EXEC, 
`! & EXEC, 
BIRTH 2CS> NAMING- 
`BIND-DNODE-TAIL 2>CS CONCEIVE 

`DUP & EXEC, 
`@ & EXEC, 
`0EQ & EXEC, ZBFW, 
`2DUP & EXEC, 
`! & EXEC, 
`CELL+ & EXEC, 
`! & EXEC, EXIT, RFW 
`CELL+ & EXEC, 
`2DUP & EXEC, 
`@ & EXEC, 
`DUP & EXEC, ZBFW, 
`CELL- & EXEC, 
`! & EXEC, 
`! & EXEC, EXIT, RFW 
`DROP & EXEC, 
`SWAP & EXEC, 
`CELL- & EXEC, 
`DUP & EXEC, 
`@ & EXEC, 
`0EQ & EXEC, ZBFW, 
`2! & EXEC, EXIT, RFW 
`NIP & EXEC, 
`DUP & EXEC, 
`CELL+ & EXEC, 
`SWAP & EXEC, 
`CALC-NODE-TAIL & EXEC, 
`OVER & EXEC, 
`! & EXEC, 
`BIND-RNODE & EXEC, 
BIRTH 2CS> NAMING- 
`PERFORM-NODE-COND 2>CS CONCEIVE 
MBW 
`DUP & EXEC, ZBFW2, 
`DUP & EXEC, 
`>R & EXEC, 
`@ & EXEC, 
`EXECUTE & EXEC, 
`DUP & EXEC, ZBFW, 
`RDROP & EXEC, EXIT, RFW 
`DROP & EXEC, 
`R> & EXEC, 
`CELL- & EXEC, 
`@ & EXEC, BBW, RFW 


BIRTH 2CS> NAMING- 
`PERFORM-LIST-COND 2>CS CONCEIVE 
`@ & EXEC, 
`PERFORM-NODE-COND & EXEC, 
BIRTH 2CS> NAMING- 
`DISPLACE-SUBLIST 2>CS CONCEIVE 
`>R & EXEC, 
`>R & EXEC, 
`DUP & EXEC, 
`@ & EXEC, 
`DUP & EXEC, 
`R@ & EXEC, 
`EQ & EXEC, ZBFW, 
`RDROP & EXEC, 
`RDROP & EXEC, 
`2DROP & EXEC, EXIT, RFW 
`R@ & EXEC, 
`ROT & EXEC, 
`! & EXEC, 0 LIT, 
`OVER & EXEC, 
MBW 
`DUP & EXEC, ZBFW2, 
`NIP & EXEC, 
`DUP & EXEC, 
`CELL- & EXEC, 
`@ & EXEC, 
`DUP & EXEC, 
`R@ & EXEC, 
`EQ & EXEC, ZBBW, RFW 
`DROP & EXEC, 
`RDROP & EXEC, 

`R@ & EXEC, 
`@ & EXEC, 
`SWAP & EXEC, 
`CELL- & EXEC, 
`! & EXEC, 
`R> & EXEC, 
`! & EXEC, 

BIRTH 2CS> NAMING- 




`TS-LIT 2>CS CONCEIVE 
`DUP & EXEC, 
`0= & EXEC, ZBFW, 
`DROP & EXEC, EXIT, RFW 
`DUP & EXEC, 1 LIT, 
`= & EXEC, ZBFW, 
`DROP & EXEC, 
`LIT, & EXEC, EXIT, RFW 
`DUP & EXEC, 2 LIT, 
`= & EXEC, ZBFW, 
`DROP & EXEC, 
`LIT, & EXEC, `LIT, & LIT, 
`EXEC, & EXEC, EXIT, RFW 
`1- & EXEC, 
`SWAP & EXEC, 
`LIT, & EXEC, 
`LIT, & EXEC, GERM LIT, 
`EXEC, & EXEC, 
BIRTH 2CS> NAMING- 
`TS-EXEC 2>CS CONCEIVE 
`DUP & EXEC, 
`0= & EXEC, ZBFW, 
`DROP & EXEC, 
`EXECUTE & EXEC, EXIT, RFW 
`DUP & EXEC, 1 LIT, 
`= & EXEC, ZBFW, 
`DROP & EXEC, 
`EXEC, & EXEC, EXIT, RFW 
`DUP & EXEC, 2 LIT, 
`= & EXEC, ZBFW, 
`DROP & EXEC, 
`LIT, & EXEC, `EXEC, & LIT, 
`EXEC, & EXEC, EXIT, RFW 
`1- & EXEC, 
`SWAP & EXEC, 
`LIT, & EXEC, 
`LIT, & EXEC, GERM LIT, 
`EXEC, & EXEC, 
BIRTH 2CS> NAMING- 
`TS-SLIT 2>CS CONCEIVE 
`DUP & EXEC, 
`0= & EXEC, ZBFW, 
`DROP & EXEC, EXIT, RFW 
`DUP & EXEC, 1 LIT, 
`= & EXEC, ZBFW, 
`DROP & EXEC, 
`SLIT, & EXEC, EXIT, RFW 
`DUP & EXEC, 2 LIT, 
`= & EXEC, ZBFW, 
`DROP & EXEC, 
`SLIT, & EXEC, `SLIT, & LIT, 
`EXEC, & EXEC, EXIT, RFW 
`1- & EXEC, 
`-ROT & EXEC, 
`SLIT, & EXEC, 
`LIT, & EXEC, GERM LIT, 
`EXEC, & EXEC, 
BIRTH 2CS> NAMING- 
`TS-2LIT 2>CS CONCEIVE 
`DUP & EXEC, 
`0= & EXEC, ZBFW, 
`DROP & EXEC, EXIT, RFW 
`DUP & EXEC, 1 LIT, 
`= & EXEC, ZBFW, 
`DROP & EXEC, 
`2LIT, & EXEC, EXIT, RFW 
`DUP & EXEC, 2 LIT, 
`= & EXEC, ZBFW, 
`DROP & EXEC, 
`2LIT, & EXEC, `2LIT, & LIT, 
`EXEC, & EXEC, EXIT, RFW 
`1- & EXEC, 
`-ROT & EXEC, 
`2LIT, & EXEC, 
`LIT, & EXEC, GERM LIT, 
`EXEC, & EXEC, 
BIRTH 2CS> NAMING- 

`STATE 2>CS SP@ >CS SP@ CS> EQ ?DUP XOR ALIGN HERE SWAP , CONCEIVE LIT, BIRTH 2CS> NAMING- 


`STATE 2>CS SP@ >CS SP@ CS> EQ ?DUP XOR ALIGN HERE SWAP , CONCEIVE LIT, BIRTH 2CS> NAMING- 
`M 2>CS SP@ >CS SP@ CS> EQ ?DUP XOR ALIGN HERE SWAP , CONCEIVE LIT, BIRTH 2CS> NAMING- 
`STATE? 2>CS CONCEIVE 
`STATE & EXEC, 
`@ & EXEC, 
BIRTH 2CS> NAMING- 
`STATE0? 2>CS CONCEIVE 
`STATE & EXEC, 
`@ & EXEC, 
`0EQ & EXEC, 
BIRTH 2CS> NAMING- 
`INC-M 2>CS CONCEIVE 
`M & EXEC, 
`@ & EXEC, ZBFW, -5005 LIT, 
`THROW & EXEC, RFW 
`M & EXEC, 
`1+! & EXEC, 
BIRTH 2CS> NAMING- 
`DEC-M 2>CS CONCEIVE 
`M & EXEC, 
`@ & EXEC, 
`0= & EXEC, ZBFW, -5004 LIT, 
`THROW & EXEC, RFW 
`M & EXEC, 
`1-! & EXEC, 
BIRTH 2CS> NAMING- 
`INC-S 2>CS CONCEIVE 
`STATE & EXEC, 
`1+! & EXEC, 
BIRTH 2CS> NAMING- 
`DEC-S 2>CS CONCEIVE 
`STATE & EXEC, 
`@ & EXEC, 
`0= & EXEC, ZBFW, -5004 LIT, 
`THROW & EXEC, RFW 
`STATE & EXEC, 
`1-! & EXEC, 
BIRTH 2CS> NAMING- 


`T-LIT 2>CS CONCEIVE 
`M & EXEC, 
`@ & EXEC, ZBFW, 
`STATE & EXEC, 
`@ & EXEC, ZBFW, 
`STATE & EXEC, 
`@ & EXEC, 
`TS-LIT & EXEC, GERM LIT, 
`STATE & EXEC, 
`@ & EXEC, 
`TS-EXEC & EXEC, EXIT, RFW RFW 
`STATE & EXEC, 
`@ & EXEC, 
`TS-LIT & EXEC, 
BIRTH 2CS> NAMING- 
`T-EXEC 2>CS CONCEIVE 
`M & EXEC, 
`@ & EXEC, ZBFW, 
`STATE & EXEC, 
`@ & EXEC, ZBFW, 
`STATE & EXEC, 
`@ & EXEC, 
`TS-LIT & EXEC, GERM LIT, 
`STATE & EXEC, 
`@ & EXEC, 
`TS-EXEC & EXEC, EXIT, RFW RFW 
`STATE & EXEC, 
`@ & EXEC, 
`TS-EXEC & EXEC, 
BIRTH 2CS> NAMING- 
`T-SLIT 2>CS CONCEIVE 
`M & EXEC, 
`@ & EXEC, ZBFW, 
`STATE & EXEC, 
`@ & EXEC, ZBFW, 
`STATE & EXEC, 
`@ & EXEC, 
`TS-SLIT & EXEC, GERM LIT, 
`STATE & EXEC, 
`@ & EXEC, 
`TS-EXEC & EXEC, EXIT, RFW RFW 
`STATE & EXEC, 
`@ & EXEC, 
`TS-SLIT & EXEC, 
BIRTH 2CS> NAMING- 
`T-2LIT 2>CS CONCEIVE 
`M & EXEC, 
`@ & EXEC, ZBFW, 
`STATE & EXEC, 
`@ & EXEC, ZBFW, 
`STATE & EXEC, 
`@ & EXEC, 
`TS-2LIT & EXEC, GERM LIT, 
`STATE & EXEC, 
`@ & EXEC, 
`TS-EXEC & EXEC, EXIT, RFW RFW 
`STATE & EXEC, 
`@ & EXEC, 
`TS-2LIT & EXEC, 
BIRTH 2CS> NAMING- 

`M-LIT 2>CS CONCEIVE 
`M & EXEC, 
`@ & EXEC, ZBFW, 
`STATE & EXEC, 
`@ & EXEC, ZBFW, 
`STATE & EXEC, 
`@ & EXEC, 
`TS-LIT & EXEC, GERM LIT, 
`STATE & EXEC, 
`@ & EXEC, 
`TS-EXEC & EXEC, EXIT, RFW RFW 

BIRTH 2CS> NAMING- 
`M-EXEC 2>CS CONCEIVE 
`M & EXEC, 
`@ & EXEC, ZBFW, 
`STATE & EXEC, 
`@ & EXEC, ZBFW, 
`STATE & EXEC, 
`@ & EXEC, 
`TS-LIT & EXEC, GERM LIT, 
`STATE & EXEC, 
`@ & EXEC, 
`TS-EXEC & EXEC, EXIT, RFW RFW 
`EXECUTE & EXEC, 
BIRTH 2CS> NAMING- 
`M-DEC-STATE 2>CS CONCEIVE 
`DEC-S & LIT, 
`M-EXEC & EXEC, 
BIRTH 2CS> NAMING- 
`M-INC-STATE 2>CS CONCEIVE 
`INC-S & LIT, 
`M-EXEC & EXEC, 
BIRTH 2CS> NAMING- 





`I-DLIT 2>CS CONCEIVE 
`DUP & EXEC, 1 LIT, 
`ULT & EXEC, ZBFW, 
`FALSE & EXEC, EXIT, RFW 
`2DUP & EXEC, 
`OVER & EXEC, 
`C@ & EXEC, `- DROP C@ LIT, 
`= & EXEC, 
`DUP & EXEC, 
`>R & EXEC, ZBFW, 
`1- & EXEC, 
`SWAP & EXEC, 
`CHAR+ & EXEC, 
`SWAP & EXEC, RFW 
`DUP & EXEC, 
`0EQ & EXEC, ZBFW, 
`NIP & EXEC, 
`RDROP & EXEC, EXIT, RFW 0 LIT, 0 LIT, 
`2SWAP & EXEC, 
`>NUMBER & EXEC, 
`NIP & EXEC, ZBFW, 
`RDROP & EXEC, 
`2DROP & EXEC, 
`FALSE & EXEC, EXIT, RFW 
`R> & EXEC, ZBFW, 
`DNEGATE & EXEC, RFW 
`2SWAP & EXEC, 
`2DROP & EXEC, 
`TRUE & EXEC, 
BIRTH 2CS> NAMING- 
`I-LIT 2>CS CONCEIVE 
`I-DLIT & EXEC, ZBFW, 
`D>S & EXEC, 
`TRUE & EXEC, EXIT, RFW 
`FALSE & EXEC, 
BIRTH 2CS> NAMING- 
`I-DLIT-FORM 2>CS CONCEIVE 
`DUP & EXEC, 2 LIT, 
`ULT & EXEC, ZBFW, 
`FALSE & EXEC, EXIT, RFW 
`2DUP & EXEC, 
`1- & EXEC, 
`CHARS & EXEC, 
`+ & EXEC, 
`C@ & EXEC, `. DROP C@ LIT, 
`= & EXEC, ZBFW, 
`1- & EXEC, 
`I-DLIT & EXEC, ZBFW, 
`TRUE & EXEC, EXIT, RFW 
`1+ & EXEC, RFW 
`FALSE & EXEC, 
BIRTH 2CS> NAMING- 
`I-HLIT-FORM 2>CS CONCEIVE 
`DUP & EXEC, 3 LIT, 
`ULT & EXEC, ZBFW, 
`FALSE & EXEC, EXIT, RFW 
`OVER & EXEC, 2 LIT, `0x SLIT, 
`CEQUAL & EXEC, 
`0EQ & EXEC, ZBFW, 
`FALSE & EXEC, EXIT, RFW 
`OVER & EXEC, 
`CHAR+ & EXEC, 
`CHAR+ & EXEC, 
`OVER & EXEC, 2 LIT, 
`- & EXEC, 
`BASE & EXEC, 
`@ & EXEC, 
`>R & EXEC, 
`HEX & EXEC, 
`I-LIT & EXEC, 
`R> & EXEC, 
`BASE & EXEC, 
`! & EXEC, ZBFW, 
`NIP & EXEC, 
`NIP & EXEC, 
`TRUE & EXEC, EXIT, RFW 
`2DROP & EXEC, 
`FALSE & EXEC, 
BIRTH 2CS> NAMING- 
`I-SLIT-FORM 2>CS CONCEIVE 
`DUP & EXEC, 2 LIT, 
`ULT & EXEC, ZBFW, 
`FALSE & EXEC, EXIT, RFW 
`OVER & EXEC, 
`C@ & EXEC, `` DROP C@ LIT, 
`NEQ & EXEC, ZBFW, 
`FALSE & EXEC, EXIT, RFW 
`1- & EXEC, 
`SWAP & EXEC, 
`CHAR+ & EXEC, 
`SWAP & EXEC, 
`TRUE & EXEC, 
BIRTH 2CS> NAMING- 
`I-NATIVE 2>CS CONCEIVE 
`2DUP & EXEC, 
`>R & EXEC, 
`>R & EXEC, 
`SFIND & EXEC, 
`DUP & EXEC, 1 LIT, 
`EQ & EXEC, 
`0EQ & EXEC, ZBFW, 
`RDROP & EXEC, 
`RDROP & EXEC, EXIT, RFW 
`DROP & EXEC, 
`DUP & EXEC, 
`GET-COMPILER? & EXEC, 
`NIP & EXEC, ZBFW, 
`TRUE & EXEC, 
`RDROP & EXEC, 
`RDROP & EXEC, EXIT, RFW 
`DROP & EXEC, 
`R> & EXEC, 
`R> & EXEC, 
`FALSE & EXEC, 

BIRTH 2CS> NAMING- 



`_I-NATIVE 2>CS SP@ >CS `I-NATIVE & SP@ CS> EQ ?DUP XOR ALIGN HERE SWAP , CONCEIVE LIT, BIRTH 2CS> NAMING- 
`I-NATIVE 2>CS CONCEIVE 
`_I-NATIVE & EXEC, 
`@ & EXEC, 
`EXECUTE & EXEC, 
BIRTH 2CS> NAMING- 






`EXECUTE-BALANCED(+1) 2>CS CONCEIVE 
`SP@ & EXEC, 
`>R & EXEC, 
`EXECUTE & EXEC, 
`SP@ & EXEC, 
`R> & EXEC, 
`EQ & EXEC, 
`0EQ & EXEC, ZBFW, -5010 LIT, 
`THROW & EXEC, RFW 

BIRTH 2CS> NAMING- 
`(I-QNATIVE) 2>CS CONCEIVE 
`>R & EXEC, `:: SLIT, 
`SPLIT- & EXEC, 
`0EQ & EXEC, ZBFW, 
`R> & EXEC, 
`SEARCH-WORDLIST & EXEC, EXIT, RFW 
`R> & EXEC, 
`SEARCH-WORDLIST & EXEC, 
`0EQ & EXEC, ZBFW, 
`2DROP & EXEC, 
`FALSE & EXEC, EXIT, RFW 
`EXECUTE-BALANCED(+1) & EXEC, GERM >CS BBW, 

BIRTH 2CS> NAMING- 
`I-QNATIVE 2>CS CONCEIVE 
`2DUP & EXEC, `:: SLIT, 
`SPLIT- & EXEC, 
`0EQ & EXEC, ZBFW, 
`2DROP & EXEC, 
`FALSE & EXEC, EXIT, RFW 
`I-NATIVE & EXEC, 
`0EQ & EXEC, ZBFW, 
`2DROP & EXEC, 
`2DROP & EXEC, 
`FALSE & EXEC, EXIT, RFW 
`EXECUTE-BALANCED(+1) & EXEC, 
`(I-QNATIVE) & EXEC, 
`0EQ & EXEC, ZBFW, 
`FALSE & EXEC, EXIT, RFW 
`NIP & EXEC, 
`NIP & EXEC, 
`TRUE & EXEC, 
BIRTH 2CS> NAMING- 

`T-NAME 2>CS CONCEIVE 
`I-SLIT-FORM & EXEC, ZBFW, 
`T-SLIT & EXEC, EXIT, RFW 
`I-NATIVE & EXEC, ZBFW, 
`T-EXEC & EXEC, EXIT, RFW 
`I-QNATIVE & EXEC, ZBFW, 
`T-EXEC & EXEC, EXIT, RFW 
`I-LIT & EXEC, ZBFW, 
`T-LIT & EXEC, EXIT, RFW 
`I-HLIT-FORM & EXEC, ZBFW, 
`T-LIT & EXEC, EXIT, RFW 
`I-DLIT-FORM & EXEC, ZBFW, 
`T-2LIT & EXEC, EXIT, RFW 
`CR & EXEC, 
`TYPE & EXEC, 
`CR & EXEC, -321 LIT, 
`THROW & EXEC, 
BIRTH 2CS> NAMING- 
`T-PLAIN 2>CS CONCEIVE 
MBW 
`FINE-HEAD & EXEC, 
`SPLIT-WHITE-FORCE & EXEC, 
`2>R & EXEC, 
`DUP & EXEC, ZBFW2, 
`T-NAME & EXEC, 
`2R> & EXEC, BBW, RFW 
`2DROP & EXEC, 
`RDROP & EXEC, 
`RDROP & EXEC, 
BIRTH 2CS> NAMING- 
`I-NATIVE-FORCE 2>CS CONCEIVE 
`I-NATIVE & EXEC, ZBFW, EXIT, RFW 
`I-QNATIVE & EXEC, ZBFW, EXIT, RFW -321 LIT, 
`THROW & EXEC, 
BIRTH 2CS> NAMING- 








`chain-current 2>CS SP@ >CS SP@ CS> EQ ?DUP XOR ALIGN HERE SWAP , CONCEIVE LIT, BIRTH 2CS> NAMING- 
`chain-context 2>CS SP@ >CS SP@ CS> EQ ?DUP XOR ALIGN HERE SWAP , CONCEIVE LIT, BIRTH 2CS> NAMING- 
`chain-context-node 2>CS SP@ >CS SP@ CS> EQ ?DUP XOR ALIGN HERE SWAP , CONCEIVE LIT, BIRTH 2CS> NAMING- 
`chain-tree-stack 2>CS SP@ >CS SP@ CS> EQ ?DUP XOR ALIGN HERE SWAP , CONCEIVE LIT, BIRTH 2CS> NAMING- 
`advice-before 2>CS CONCEIVE 0 LIT, 
`, & EXEC, 
`HERE & EXEC, 
`SWAP & EXEC, 
`, & EXEC, 
`chain-current & EXEC, 
`@ & EXEC, 
`BIND-NODE & EXEC, 
BIRTH 2CS> NAMING- 
`advice-after 2>CS CONCEIVE 0 LIT, 
`, & EXEC, 
`HERE & EXEC, 
`SWAP & EXEC, 
`, & EXEC, 
`chain-current & EXEC, 
`@ & EXEC, 
`BIND-NODE-TAIL & EXEC, 
BIRTH 2CS> NAMING- 
`_perform-node-cond 2>CS CONCEIVE 

`chain-context-node & EXEC, 
`@ & EXEC, 
`>R & EXEC, MBW 
`DUP & EXEC, ZBFW2, 
`DUP & EXEC, 
`chain-context-node & EXEC, 
`! & EXEC, 
`@ & EXEC, 
`EXECUTE & EXEC, 
`DUP & EXEC, 
`0EQ & EXEC, ZBFW2, 
`DROP & EXEC, 
`chain-context-node & EXEC, 
`@ & EXEC, 
`CELL- & EXEC, 
`@ & EXEC, BBW, RFW RFW 
`R> & EXEC, 
`chain-context-node & EXEC, 
`! & EXEC, 
BIRTH 2CS> NAMING- 
`perform-chain-explicit 2>CS CONCEIVE 
`chain-tree-stack & EXEC, 
`@ & EXEC, 
`>R & EXEC, 
`chain-context-node & EXEC, 
`@ & EXEC, 
`>R & EXEC, 
`RP@ & EXEC, 
`chain-tree-stack & EXEC, 
`! & EXEC, 
`@ & EXEC, 
`_perform-node-cond & EXEC, 
`R> & EXEC, 
`chain-context-node & EXEC, 
`! & EXEC, 
`R> & EXEC, 
`chain-tree-stack & EXEC, 
`! & EXEC, 
BIRTH 2CS> NAMING- 
`perform-chain-next 2>CS CONCEIVE 
`chain-tree-stack & EXEC, 
`@ & EXEC, 
`>R & EXEC, 
`chain-context-node & EXEC, 
`@ & EXEC, MBW 
`CDR & EXEC, 
`_perform-node-cond & EXEC, 
`DUP & EXEC, 
`0EQ & EXEC, ZBFW2, 
`DROP & EXEC, 
`chain-tree-stack & EXEC, 
`@ & EXEC, 
`DUP & EXEC, ZBFW2, 
`2@ & EXEC, 
`SWAP & EXEC, 
`chain-tree-stack & EXEC, 
`! & EXEC, 
BBW, RFW RFW 
`R> & EXEC, 
`chain-tree-stack & EXEC, 
`! & EXEC, 
BIRTH 2CS> NAMING- 
`perform-chain 2>CS CONCEIVE 
`chain-context & EXEC, 
`@ & EXEC, 
`DUP & EXEC, 
`0EQ & EXEC, ZBFW, EXIT, RFW 
`chain-tree-stack & EXEC, 
`@ & EXEC, 
`>R & EXEC, 0 LIT, 
`chain-tree-stack & EXEC, 
`! & EXEC, 
`@ & EXEC, 
`_perform-node-cond & EXEC, 
`R> & EXEC, 
`chain-tree-stack & EXEC, 
`! & EXEC, 
BIRTH 2CS> NAMING- 
`perform-chain-sure 2>CS CONCEIVE 
`perform-chain & EXEC, ZBFW, EXIT, RFW 
`ABORT & EXEC, 
BIRTH 2CS> NAMING- 


`rules-default 2>CS SP@ >CS SP@ CS> EQ ?DUP XOR ALIGN HERE SWAP , CONCEIVE LIT, BIRTH 2CS> NAMING- 

`rules-default & EXECUTE 
`DUP & EXECUTE 
`chain-current & EXECUTE 
`! & EXECUTE 
`chain-context & EXECUTE 
`! & EXECUTE 
`advice-rule-after 2>CS CONCEIVE 
`advice-after & EXEC, 
BIRTH 2CS> NAMING- 
`advice-rule-before 2>CS CONCEIVE 
`advice-before & EXEC, 
BIRTH 2CS> NAMING- 
`trans-node-force 2>CS CONCEIVE 
`perform-chain & EXEC, ZBFW, EXIT, RFW -5321 LIT, 
`THROW & EXEC, 
BIRTH 2CS> NAMING- 
`perform-rules 2>CS CONCEIVE 
`perform-chain-explicit & EXEC, 
BIRTH 2CS> NAMING- 
`perform-rules-next 2>CS CONCEIVE 
`perform-chain-next & EXEC, 
BIRTH 2CS> NAMING- 
`import-rules 2>CS CONCEIVE 

`CONCEIVE & EXEC, 
`LIT, & EXEC, 
`perform-rules & LIT, `EXEC, & EXEC, 
`BIRTH & EXEC, 
`advice-rule-before & EXEC, 
BIRTH 2CS> NAMING- 


`document-context-hidden WORDLIST-NAMED PUSH-DEVELOP 


`dataspace-hidden WORDLIST-NAMED PUSH-DEVELOP 
`D0 2>CS SP@ >CS SP@ CS> EQ ?DUP XOR ALIGN HERE SWAP , CONCEIVE LIT, BIRTH 2CS> NAMING- 
`DP 2>CS SP@ >CS SP@ CS> EQ ?DUP XOR ALIGN HERE SWAP , CONCEIVE LIT, BIRTH 2CS> NAMING- 
`D9 2>CS SP@ >CS SP@ CS> EQ ?DUP XOR ALIGN HERE SWAP , CONCEIVE LIT, BIRTH 2CS> NAMING- 
BEGIN-EXPORT 



`HERE 2>CS CONCEIVE 
`DP & EXEC, 
`@ & EXEC, 
BIRTH 2CS> NAMING- 
`UNUSED 2>CS CONCEIVE 
`D9 & EXEC, 
`@ & EXEC, 
`DP & EXEC, 
`@ & EXEC, 
`- & EXEC, 
BIRTH 2CS> NAMING- 
`ALLOT 2>CS CONCEIVE 
`DP & EXEC, 
`+! & EXEC, 
BIRTH 2CS> NAMING- 
`ALIGN 2>CS CONCEIVE 
`DP & EXEC, 
`@ & EXEC, 
`ALIGNED & EXEC, 
`DP & EXEC, 
`! & EXEC, 
BIRTH 2CS> NAMING- 
`B, 2>CS CONCEIVE 
`HERE & EXEC, 
`B! & EXEC, 1 LIT, 
`ALLOT & EXEC, 
BIRTH 2CS> NAMING- 
`C, 2>CS CONCEIVE 
`HERE & EXEC, 
`C! & EXEC, 
`/CHAR & EXEC, 
`ALLOT & EXEC, 
BIRTH 2CS> NAMING- 
`, 2>CS CONCEIVE 
`HERE & EXEC, 
`! & EXEC, 
`/CELL & EXEC, 
`ALLOT & EXEC, 
BIRTH 2CS> NAMING- 
`2, 2>CS CONCEIVE 
`HERE & EXEC, 
`2! & EXEC, 2 LIT, 
`CELLS & EXEC, 
`ALLOT & EXEC, 
BIRTH 2CS> NAMING- 
`S, 2>CS CONCEIVE 
`UNUSED & EXEC, 
`UMIN & EXEC, 
`HERE & EXEC, 
`SWAP & EXEC, 
`DUP & EXEC, 
`ALLOT & EXEC, 
`MOVE & EXEC, 
BIRTH 2CS> NAMING- 
`SXZ, 2>CS CONCEIVE 
`DUP & EXEC, 
`, & EXEC, 
`S, & EXEC, 0 LIT, 
`C, & EXEC, 
BIRTH 2CS> NAMING- 
`SCZ, 2>CS CONCEIVE 
`DUP & EXEC, 
`C, & EXEC, 
`S, & EXEC, 0 LIT, 
`C, & EXEC, 
BIRTH 2CS> NAMING- 
`CARBON 2>CS CONCEIVE 
`ALIGN & EXEC, 
`HERE & EXEC, 
`>R & EXEC, 
`S, & EXEC, 
`R> & EXEC, 
`HERE & EXEC, 
`OVER & EXEC, 
`- & EXEC, 
BIRTH 2CS> NAMING- 
`SAVE-DATASPACE 2>CS CONCEIVE 
`DP & EXEC, 
`@ & EXEC, 
`D0 & EXEC, 
`@ & EXEC, 
`D9 & EXEC, 
`@ & EXEC, 3 LIT, 
BIRTH 2CS> NAMING- 
`RESTORE-DATASPACE 2>CS CONCEIVE 3 LIT, 
`NEQ & EXEC, ZBFW, 
`ABORT & EXEC, RFW 
`D9 & EXEC, 
`! & EXEC, 
`D0 & EXEC, 
`! & EXEC, 
`DP & EXEC, 
`! & EXEC, 
BIRTH 2CS> NAMING- 
`DATASPACE! 2>CS CONCEIVE 
`OVER & EXEC, 
`DUP & EXEC, 
`D0 & EXEC, 
`! & EXEC, 
`DP & EXEC, 
`! & EXEC, 
`+ & EXEC, 
`D9 & EXEC, 
`! & EXEC, 
BIRTH 2CS> NAMING- 
`DATASPACE 2>CS CONCEIVE 
`D0 & EXEC, 
`@ & EXEC, 
`D9 & EXEC, 
`@ & EXEC, 
`OVER & EXEC, 
`- & EXEC, 
BIRTH 2CS> NAMING- 
`DATASPACE-CONTENT 2>CS CONCEIVE 
`D0 & EXEC, 
`@ & EXEC, 
`DP & EXEC, 
`@ & EXEC, 
`OVER & EXEC, 
`- & EXEC, 
BIRTH 2CS> NAMING- 
`CLEAR-DATASPACE 2>CS CONCEIVE 
`D0 & EXEC, 
`@ & EXEC, 
`DP & EXEC, 
`! & EXEC, 
BIRTH 2CS> NAMING- 

END-EXPORT 
DROP-DEVELOP 


`PUSH-MARKER 2>CS CONCEIVE 
`DUP & EXEC, 
`@ & EXEC, 
`, & EXEC, 
`HERE & EXEC, 
`SWAP & EXEC, 
`! & EXEC, 
BIRTH 2CS> NAMING- 
`DROP-MARKER 2>CS CONCEIVE 
`DUP & EXEC, 
`@ & EXEC, 
`CELL- & EXEC, 
`DUP & EXEC, 
`@ & EXEC, 
`ROT & EXEC, 
`! & EXEC, 
`HERE & EXEC, 
`- & EXEC, 
`ALLOT & EXEC, 
BIRTH 2CS> NAMING- 


`_doc 2>CS SP@ >CS SP@ CS> EQ ?DUP XOR ALIGN HERE SWAP , CONCEIVE LIT, BIRTH 2CS> NAMING- 
`_doc-url 2>CS SP@ >CS SP@ CS> EQ ?DUP XOR ALIGN HERE SWAP , CONCEIVE LIT, BIRTH 2CS> NAMING- 
BEGIN-EXPORT 
`init-document-context 2>CS CONCEIVE 256000 LIT, 
`ALLOCATED & EXEC, 
`DATASPACE! & EXEC, 
`HERE & EXEC, 
`_doc-url & EXEC, 
`! & EXEC, 0 LIT, 
`, & EXEC, 
`_doc & EXEC, 
`0! & EXEC, 
BIRTH 2CS> NAMING- 
`push-document 2>CS CONCEIVE 
`_doc & EXEC, 
`PUSH-MARKER & EXEC, 
`, & EXEC, 
`_doc-url & EXEC, 
`PUSH-MARKER & EXEC, 
`SCZ, & EXEC, 
BIRTH 2CS> NAMING- 
`drop-document 2>CS CONCEIVE 
`_doc-url & EXEC, 
`DROP-MARKER & EXEC, 
`_doc & EXEC, 
`DROP-MARKER & EXEC, 
BIRTH 2CS> NAMING- 
`document-url 2>CS CONCEIVE 
`_doc-url & EXEC, 
`@ & EXEC, 
`COUNT & EXEC, 
BIRTH 2CS> NAMING- 
`document-base 2>CS CONCEIVE 
`document-url & EXEC, 
`CUT-PATH & EXEC, 
BIRTH 2CS> NAMING- 
`concat-in-document- 2>CS CONCEIVE 
`HERE & EXEC, 
`>R & EXEC, 
`S, & EXEC, 
`S, & EXEC, 
`R> & EXEC, 
`HERE & EXEC, 
`OVER & EXEC, 
`- & EXEC, 0 LIT, 
`, & EXEC, 
BIRTH 2CS> NAMING- 
`document-based-url 2>CS CONCEIVE 
`_doc-url & EXEC, 
`@ & EXEC, 
`0EQ & EXEC, ZBFW, EXIT, RFW 
`document-base & EXEC, 
`concat-in-document- & EXEC, 
`normalizeURI & EXEC, 
BIRTH 2CS> NAMING- 
`cnode-based-url 2>CS CONCEIVE 
`_doc-url & EXEC, 
`@ & EXEC, 
`0EQ & EXEC, ZBFW, EXIT, RFW 
`BaseURI & EXEC, 
`concat-in-document- & EXEC, 
`normalizeURI & EXEC, 
BIRTH 2CS> NAMING- 
END-EXPORT 
DROP-DEVELOP 



`name-n-uri 2>CS CONCEIVE `: SLIT, 
`SPLIT- & EXEC, 
`0= & EXEC, ZBFW, 
`2DUP & EXEC, `# SLIT, 
`STARTS-WITH & EXEC, ZBFW, 0 LIT, 0 LIT, EXIT, RFW 0 LIT, 0 LIT, RFW 
`Namespace-uri-for-prefix & EXEC, 
BIRTH 2CS> NAMING- 
`trans-childs 2>CS CONCEIVE 
`cnode & EXEC, 
`>R & EXEC, 
`FirstChild & EXEC, MBW 
`cnode & EXEC, ZBFW2, 
`trans-node-force & EXEC, 
`NextSibling & EXEC, BBW, RFW 
`R> & EXEC, 
`cnode! & EXEC, 
BIRTH 2CS> NAMING- 
`trans-document 2>CS CONCEIVE 
`cnode & EXEC, 
`>R & EXEC, 
`documentElement & EXEC, 
`cnode! & EXEC, 
`trans-node-force & EXEC, 
`R> & EXEC, 
`cnode! & EXEC, 
BIRTH 2CS> NAMING- 
`expanded-url 2>CS CONCEIVE 
`2DUP & EXEC, `/ SLIT, 
`SPLIT- & EXEC, ZBFW, `: SLIT, 
`CONTAINS & EXEC, ZBFW, 
`2DROP & EXEC, EXIT, RFW RFW 
`2DROP & EXEC, 
`cnode-based-url & EXEC, 
BIRTH 2CS> NAMING- 
`EMBODY 2>CS CONCEIVE 
`2DUP & EXEC, 
`DefaultLSParser & EXEC, 
`parseURI & EXEC, 
`DUP & EXEC, 
`0= & EXEC, ZBFW, -5003 LIT, 
`THROW & EXEC, RFW 
`DUP & EXEC, 
`>R & EXEC, 
`push-document & EXEC, 
`R@ & EXEC, 
`trans-document & EXEC, 
`R> & EXEC, 
`DefaultLSParser & EXEC, 
`freeDoc & EXEC, 
`drop-document & EXEC, 
BIRTH 2CS> NAMING- 
`Embody 2>CS CONCEIVE 
`expanded-url & EXEC, 
`EMBODY & EXEC, 
BIRTH 2CS> NAMING- 



