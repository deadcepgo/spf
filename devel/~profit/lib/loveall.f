\ colorlessForth ��� �����. ���� -- Chuck Moore � Terry Loveall.
\ ���������� �� �������-����������

\ ������� ��������� (�� ��������� � IRC):
\ ��� ������ �������.
\ � ������������ (�� �������) ������ -- ��� colorForth.
\ �� ���� ���� �������� ���� INTERPRET
\ ��� �������� �������� ��� ��� ���� WHILE � BL WORD ������
\ ������ ����� �������������� � ����������� �� �������� �������������� STATE ������.
\ ��, ��� �� �����..
\ ��� ������: "���������!.. ������� STATE � ������ �����".
\ ������ ������� ������ ����������.
\ ������ ������ ����������� ��������������� � ����� ���������.
\ ��� ������: ������, ���������� (��� � Loveall'�), �����������, �������������, ��� ������.
\ �����-�������� -- ����� ������� � ����������� ������� colorForth'�.
\ : square ] DUP ] * ;
\ �������� ��������� ��������:
\ "������� ����� square"
\ "�������������� DUP"
\ "�������������� *"
\ "�������� �����������"

\ ��. ����� ������������ ������: http://forth.org.ru/~profit/COLOR4th.pdf


S" lib\ext\patch.f" INCLUDED

: [ ;
: ] ' COMPILE, ;
: n LIT, ;
 
:NONAME CREATE DOES> EXECUTE ;   ' : REPLACE-WORD
:NONAME RET, ;                   ' ; REPLACE-WORD

\EOF
\ examples
: square  ] DUP  ] *  ;
: 2x2  2 n  ] square  ] . ;