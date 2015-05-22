\ Oct.2006, Feb.2007

\ ������� ���� GERM � GERM!

: CONCEIVE ( -- )
  ?CSP GERM >CS
  ALIGN HERE GERM!
;
: BIRTH ( -- xt )
  RET, GERM  CS> GERM! DUP IT-A !
  ClearJpBuff \ for OPT
  \ AT-BIRTH ( xt -- xt ) \ is event
  [DEFINED] UNUSED [IF] \ � ���� ��� ����� UNUSED
  UNUSED 250 < IF -8 THROW  THEN \ dictionary overflow
  \ ��������� � ������ �����,
  \ �.�. "��������� �����" ����� ����� � ������������� ���������.
  [THEN]
;
: BEGET-CONST ( x -- xt ) \ xt ( -- x )
  CONCEIVE LIT, BIRTH
;

\EOF
\ �������������� (� �������� ������ �����), ���� �� ������������:

: BEGET-TEXT ( c-addr u -- xt ) \ xt ( -- c-addr2 u )
  CONCEIVE SLIT, BIRTH
;
: BEGET-VAR ( -- xt )  \ xt ( -- addr )
  ALIGN HERE 0 , MAKE-CONST
;
