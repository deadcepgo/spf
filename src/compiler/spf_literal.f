( �������������� �������� ��������� ��� �������������.
  ��-����������� �����������.
  Copyright [C] 1992-1999 A.Cherezov ac@forth.org
  �������������� �� 16-���������� � 32-��������� ��� - 1995-96��
  ������� - �������� 1999
)

: ?LITERAL1 ( T -> ... )
  \ ������������� ������ � �����
  0 0 ROT COUNT
  OVER C@ [CHAR] - = IF 1- SWAP 1+ SWAP TRUE ELSE FALSE THEN >R
  >NUMBER
  DUP 1 > IF -2001 THROW THEN \ ABORT" -?"
  IF C@ [CHAR] . <> IF -2002 THROW THEN \ ABORT" -??"
       R> IF DNEGATE THEN
       [COMPILE] 2LITERAL
  ELSE DROP D>S
       R> IF NEGATE THEN
       [COMPILE] LITERAL
  THEN
;
: ?SLITERAL1 ( c-addr u -> ... )
  \ ������������� ������ � �����
  0 0 2SWAP
  OVER C@ [CHAR] - = IF 1- SWAP 1+ SWAP TRUE ELSE FALSE THEN >R
  >NUMBER
  DUP 1 > IF -2001 THROW THEN \ ABORT" -?"
  IF C@ [CHAR] . <> IF -2002 THROW THEN \ ABORT" -??"
       R> IF DNEGATE THEN
       [COMPILE] 2LITERAL
  ELSE DROP D>S
       R> IF NEGATE THEN
       [COMPILE] LITERAL
  THEN
;
: HEX-LITERAL ( T -> ... )
  BASE @ >R HEX
  0 0 ROT COUNT 2- SWAP 2+ SWAP >NUMBER 2DROP D>S POSTPONE LITERAL
  R> BASE !
;
: HEX-SLITERAL ( T -> ... )
  BASE @ >R HEX
  0 0 2SWAP 2- SWAP 2+ SWAP >NUMBER 2DROP D>S POSTPONE LITERAL
  R> BASE !
;

: ?LITERAL2 ( c-addr -- ... )
  ( ����������� ������� ?LITERAL1:
    ���� ������ - �� �����, �� �������� ���������� �
    ��� ��� ����� ��� ����-INCLUDED)
  DUP COUNT 2 MIN S" 0x" COMPARE 0= 
  IF HEX-LITERAL EXIT THEN
  DUP >R ['] ?LITERAL1 CATCH
  IF   DROP R> COUNT
       OVER C@ [CHAR] " = OVER 2 > AND
       IF 2 - SWAP 1+ SWAP THEN ( ����� �������, ���� ����)
       2DUP + 0 SWAP C!
       ['] INCLUDED CATCH
       DUP 2 = OVER 3 = OR ( ���� �� ������ ��� ���� �� ������ )
       IF -2003 THROW \ ABORT"  -???"
       ELSE THROW THEN
  ELSE RDROP
  THEN
;
: ?SLITERAL2 ( c-addr u -- ... )
  ( ����������� ������� ?SLITERAL1:
    ���� ������ - �� �����, �� �������� ���������� �
    ��� ��� ����� ��� ����-INCLUDED)
  2DUP 2 MIN S" 0x" COMPARE 0= 
  IF HEX-SLITERAL EXIT THEN
  2DUP 2>R ['] ?SLITERAL1 CATCH
  IF   2DROP 2R>
       OVER C@ [CHAR] " = OVER 2 > AND
       IF 2 - SWAP 1+ SWAP THEN ( ����� �������, ���� ����)
       2DUP + 0 SWAP C!
       ['] INCLUDED CATCH
       DUP 2 = OVER 3 = OR ( ���� �� ������ ��� ���� �� ������ )
       IF  -2003 THROW \ ABORT"  -???"
       ELSE  THROW THEN
  ELSE 2R> 2DROP
  THEN
;
