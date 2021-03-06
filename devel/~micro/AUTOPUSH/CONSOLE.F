\ ����� � ���᮫��

WINAPI: WriteConsoleOutputCharacterA kernel32.dll

REQUIRE CursorPos@ ~micro/lib/windows/mouse.f
REQUIRE GetDesktopWindow ~micro/lib/windows/window.f
REQUIRE .R lib/include/core-ext.f

: ANIM:
\ ANIM: <name> <ᨬ����>
\ ᮧ���� ���⨪ <name>, ����騩 �� ���஢-ᨬ����� <ᨬ����>
\ �ᯮ������: SetAnim <name>
\ <name> ( -- addr u )
  CREATE
    0 PARSE
    DUP ,
    HERE
    SWAP
    DUP ALLOT
    MOVE
  DOES>
    DUP @
    SWAP CELL+
    SWAP
;

VECT ANIM ( -- addr u )
\ ⥪�騩 ���⨪
VARIABLE NANIM
\ � ⥪�饣� ����

: SetAnim
\ SetAnim <name> ���樠������� ���⨪ <name>
  ' TO ANIM
  NANIM 0!
;

: ToRange ( size n1 -- n2 )
\ ��ଠ����� ������ n1 � ��ப� � ������ size.
\ 4 3 ToRange \ 3
\ 4 4 ToRange \ 0
\ 4 5 ToRange \ 0
  DUP ROT
  < AND
;

: GetAnimSymbol ( -- � )
\ �뤠�� ��।��� ᨬ��� ⥪�饣� ���⨪�
  ANIM SWAP
  NANIM @ + C@ >R
  NANIM @ 1+ ToRange NANIM !
  R>
;

CREATE StatusLine 80 ALLOT
\ ��ப� �����

: ClearStatusLine
\ ������ ��ப� �����
  StatusLine 80 BL FILL
;

: PutAnim
\ ������� ��।��� ᨬ��� ���⨪� � ���� ᨬ��� ��ப� �����
  GetAnimSymbol StatusLine C!
;

: PutMouseCoord
\ ������� ���न���� ��� � ��ப� �����
  BASE @
    CursorPos@
    DECIMAL
    S>D <# #S #> StatusLine 2 + SWAP MOVE
    S>D <# #S #> StatusLine 6 + SWAP MOVE
  BASE !
;

: FillStatusLine
\ ��������� ��ப� �����
  ClearStatusLine
  PutAnim
  PutMouseCoord
;

: ShowStatusLine
\ �⮡ࠧ��� ��ப� �����
  FillStatusLine
    0 SP@
    0
    80
    StatusLine
    H-STDOUT
  WriteConsoleOutputCharacterA
  2DROP
;

\ ������騥 ᫮�� �।�����祭� ��� ࠡ��� � ������ �������஬

VARIABLE CurrentWindow
\ ����� ⥪�饣� ����

20 VALUE Lines
\ �᫮ �����뢭� �뢮����� ��ப.
\ �筥�, �� �᫮ CR-��, �믮��塞�� ��� ��⠭����
VARIABLE LinesLeft
\ �᫮ ��ப, ����� ��� ���� �뢥���� ��� ��⠭����

: CR
\ ���� CR, � ����ᮬ �� �த������� �뢮��
  CR
  LinesLeft @ 1- DUP LinesLeft !
  0< IF
    Lines LinesLeft !
    ." -- more -- space-abort" CR KEY BL = ABORT" Aborted"
  THEN
;

: ShowWindowInfo ( hwnd -- )
\ �������� ���ଠ�� �� ����
  DUP ." hwnd=" 4 .R
  DUP GetWindowOwner ." ; owner=" 4 .R
  DUP WindowRect@
  ." ; coord=(" 4 .R ." ," 4 .R ." ;" 4 .R ." ," 4 .R ." )" CR
  DUP GetWindowText ."            text='" ANSI>OEM TYPE ." '" CR
      GetWindowClass ."           class='" ANSI>OEM TYPE ." '" CR
;

: cw
\ �������� ���ଠ�� � ⥪�饬 ����
  CurrentWindow @ ShowWindowInfo CR
;

: MyOk
\ ���� OK (� SPF �믮������ ��। ����ᮬ ����� ��ப� � ���᮫�)
  CR
  ." Current window: "
  cw
  Lines LinesLeft !
;

: childs
\ �뢮� ᯨ᪠ ���୨� ���� ⥪�饣� ����
  CurrentWindow @
  GetWindowChild
  DUP IF
    BEGIN
      DUP ShowWindowInfo CR
      GetWindowNext ?DUP
    0= UNTIL
  ELSE
    ." no childs"
  THEN
  CR
;

: nc ( hwnd -- )
\ ������� ⥪�饣� ����
  CurrentWindow !
;

: ..
\ ��६�饭�� � ����-��������� ⥪�饣�
  CurrentWindow @ GetWindowOwner CurrentWindow !
;

\ default config =================================

ANIM: ANIM1  ���۲��
ANIM: ANIM2 ��O�
SetAnim ANIM1
20 TO Lines
