\ 31-05-2007 ~mOleg
\ Copyright [C] 2007 mOleg mininoleg@yahoo.com
\ ������ � �������
\ �@ �! C, - �������� �� ���������, ����������� ������� ����� ���� 16 ���

 REQUIRE ?DEFINED devel\~moleg\lib\util\ifdef.f

N?DEFINED B! \EOF ���� ��� ���� ���������

 REQUIRE ALIAS    devel\~moleg\lib\util\alias.f

0xFEFF SP@ C@ 256 > NIP \ ���� ������� ������� �����
 ADMIT CR S" Please redefine B@ B! B, becouse Chars are wide" TYPE -1 THROW

?DEFINED B@  ALIAS C@ B@ \ ������� ����, �������� �� ���������� ������
?DEFINED B!  ALIAS C! B! \ ��������� ���� �� ���������� ������
?DEFINED B,  ALIAS C, B, \ ������������� ���� �� ������� ���������.

?DEFINED test{ \EOF -- �������� ������ -----------------------------------------

test{
  CREATE aaa HERE B,
  aaa B@ aaa 0xFF AND <> THROW
  123456 DUP aaa B! aaa B@ SWAP 0xFF AND <> THROW
S" passed" TYPE
}test

\EOF
� ����� � ���, ��� ����������� ���������� ������ ����� �� ��������� �
������������ ���������� ���������� ������ ������ ( ������ �����), � ���
�� ���������� ������������ �����������, �� ������� ���������� �����
(�������� ������ ����� ������� �����������) ������� �������� ��������
����� ����, ���������� � ������� � ��������� �������� � ������ ���������: B
� �� C.

\ 05-11-2007
��� ����������� ������ ���� ����������� � ������ � ������� ������������ ������