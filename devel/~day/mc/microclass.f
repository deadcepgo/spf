( 13.05.2000 Dmitry Yakimov
  ver. 1.5.

  ��� ���������� ���� �������� ����� � ~1001bytes, ���������� � 
  ���������� [!].  ������� ���� ���� ��
  ������� �����. �������� [� ���� ����] �� ������� �������� ����������
  ���������. � ��������� �� ��� ����� �������. �������� �� �������:
  � ��������� � ���:
  1. ������������ ������ - ����, ���� ������ ��������� �������:
     ������������ � ������ ���������, �������� ��������� /���_������
     ������:

     CLASS: Test
        0
          CELL FIELD x
          CELL FIELD y
        CONSTANT /Test
     ;CLASS


     WITH Test CHILD: Test1
        /Test
          CELL FIELD z
        CONSTANT /Test1
     ;CLASS
      
     \ ����� ������������� ����� ��������� ����� ���������, �� �����
     \ ����� ������� ������ �������  [�������� ����� ��������� � ����������]
     \ �������� �������:
     WITH Test1
       /Test1 OBJECT \ [ ��� /Test1 NEW]
       ...
     WITHOUT
     
     ������, � ����� ��� ��������� /Test1 ����� ���� ��������� �������������,
     ������� ���������� ����� � ������. ���� ����� ���������� ����������.
     ��������, ��� ��� �������� �������� � ����� �������, �� �����������
     � ������. ��� ��� ��� ��� �������. ������������ ����� ����������
     �� ��� ������� ��� ��������� ������������� ������ ��������� ��� ������
     ����������� ����� ������� � ����� ����� ����� by default.
     
     [*] - FIELD - ������ ������ -- ������ �������� � ��������� ��������
           ������� - ���������� self.
           
  2. ������������
     ��� ������������ [���������� � ���� ���� ������ � �������] ��� �����
     �� ���, � ������� ���� ��������. �� ��� �� ����� �������� ������������
     �++ [�� ����� ����� ������]. ��� ����� ������������ � ������������
     �����, ���������� � ��� � ���������������� � ���� ��. ��� ����.
     ��� �� ��������� ��� � ������ ���� ������������ �������� � ������ ������.
     �� ������ - � ��� ��������� ���������� ��� � ���������? � ����� ���
     ����� - ������ �. ���� ���������� ��� ����� ��� ��������� ��� ���� ������
     ��� ����� ������������� ��������� ���������� � ��� �������� � ���
     �������� � ������� ������/���������� �� ����� �������� ������ - ����� 
     ������ ��������� � ��� ������? �� � ������������� private ����������
     ��� ����� � �� �������� �������, ���� ���������. ��, ����� ���� ���������
     � ������������� ��� ��������� ������� �������������� [� ����� ���������
     ��� ����], �� ���� ������ ���������, �� ��� ����� ��.

  3. �����������
     ��� ����� ������ ����� ����� ���� ����� � ���������� ������, �� ��� ������
     ������ ���� � ������ �������. �������� � ������ Point ����� paint
     � � ������ Rectangle ����� paint.
     � ��� ��� ����? ����. �� � ����� ����� ��� � ��� - ����� ���������
     ��  ����� ������ ������ � ������ ��������� ������� ������ �� ������ ��
     ����� ��������� �������� ������������ ������ [����� �����]. ���
     ��� ��� ������, ����� ������� ������ ����������� ���������� ���������
     � ����� � ��� �� ������. �� �� - ������� :> - �� �� ��, ��� ���
     ������������, �� ������������� ������� �������� � ��������� ����������
     �������� ������ ��� �� ����� �� ����� � �� ����� ������ �� ��������
     - ����� �� ����� [����������].
  � �����, ��� ��� ���� ����������� �������� � ���, ����� �������, ��������
  ������ � ��� ���������.
  ����� � �� ������������ ��������������� ������, � ������������ ������
  ��� ���������� ���������.
  ����� ����. ����������� ������ ���� � 2 ����. ��� ��� � ���� :]
)

HERE

USER-VALUE self

\ ���������� ���� �������� ��������
: FIELD
    CREATE OVER , +
    DOES> @ self +
;

: _exitm
\ ����� �� ������
   R> TO self
;

: _in
\ ���� � �����
   R>
   self >R
   ['] _exitm >R
   >R TO self
;

\ ��� ������������ �����

: M: : POSTPONE _in ;

: DO-IT-DEF
  GET-ORDER 1+      \  ...widn n --
   VOC-LIST @ CELL+  \ ������� wid
    SWAP SET-ORDER    \  widn wid n+1
  DEFINITIONS
;

: CLASS: ( "name" -- 0 ) VOCABULARY DO-IT-DEF ;

: ;CLASS  PREVIOUS FORTH-WORDLIST SET-CURRENT ;

: CHILD: ( -- u )
          CONTEXT @ @ PREVIOUS VOCABULARY DO-IT-DEF
          GET-CURRENT !
;

: WITH        ALSO ; IMMEDIATE
: ENDWITH PREVIOUS ; IMMEDIATE

: LOOK-FOR-INIT (  -- 0 | xt 1 | xt -1 )
   S" INIT" CONTEXT @ SEARCH-WORDLIST
;

: LOOK-FOR-DESTROY ( wid -- 0 | xt 1 | xt -1 )
   S" DESTROY" ROT SEARCH-WORDLIST
;

\ �������� ������� � ��������� ������������
: OBJECT  ( length  -- addr )
     HERE OVER ALLOT
      DUP ROT ERASE
       LOOK-FOR-INIT
       IF
         EXECUTE
       THEN
;

: (NEW) ( length  -- addr )
     DUP ALLOCATE THROW
      DUP ROT ERASE
;

\ �������� ������� � ����
: NEW ( -- )
  STATE @
  IF
    POSTPONE (NEW)
    LOOK-FOR-INIT
    IF
      COMPILE,
    THEN
  ELSE
    (NEW)
    LOOK-FOR-INIT
    IF
      EXECUTE
    THEN
  THEN
; IMMEDIATE

\ ������������ ���� ����
: INHERIT ( -- )
   SMUDGE
   LATEST COUNT DUP >R
   PAD SWAP CMOVE
   HIDE PAD R>
   CONTEXT @ SEARCH-WORDLIST
   IF
     5 + \ ���������� _in - � ���� ��������� ������ ����� ���� �����
     COMPILE,
   THEN
; IMMEDIATE


HERE SWAP -
.( Length of microclass.f is ) . .( bytes ) CR