

WINAPI: CreateDialogIndirectParamA USER32.DLL
WINAPI: DialogBoxIndirectParamA    USER32.DLL

:NONAME ( lpar wpar msg hwnd -- u )
    OVER WM_INITDIALOG  = ( the first message of dialog )
    IF
       DUP 4 PICK ( obj = lpar ) DWL_DLGPROC InstallThunk

       \ send this message to the new object
       SendMessageA
    ELSE
       2DROP 2DROP 0
    THEN
; WNDPROC: BaseDlgProc

CWindow SUBCLASS CDialog

: SKIP
   S" OF TRUE EXIT ENDOF" EVALUATE
; IMMEDIATE

: skipMsgResult? ( msg -- f )
    CASE
      WM_INITDIALOG        SKIP
      WM_COMPAREITEM       SKIP
      WM_VKEYTOITEM        SKIP
      WM_CHARTOITEM        SKIP
      WM_QUERYDRAGICON     SKIP
      WM_CTLCOLORMSGBOX    SKIP
      WM_CTLCOLOREDIT      SKIP
      WM_CTLCOLORLISTBOX   SKIP
      WM_CTLCOLORBTN       SKIP
      WM_CTLCOLORDLG       SKIP
      WM_CTLCOLORSCROLLBAR SKIP
      WM_CTLCOLORSTATIC    SKIP
    ENDCASE 0
;

: message ( lpar wpar msg hwnd -- result )
    OVER
    || R: msg ||

    DEPTH >R
    OVER [CHAR] W SWAP SUPER sendWinMessage 0=
    IF
       R> DROP 2DROP 2DROP 0 EXIT
    THEN
    DEPTH R> SWAP - 3 =  INVERT S" Wrong data stack size" SUPER abort

    msg @ skipMsgResult? 0=
    IF
        DWL_MSGRESULT
        SUPER hWnd @ DUP
        IF
           0 SetLastError DROP
           SetWindowLongA SUPER -wthrow 0
        ELSE 2DROP DROP
        THEN        
    THEN
;

\ create modeless dialog
: show ( template parent-obj -- hwnd )
    || R: parent-obj R: template ||
    SELF
    ['] BaseDlgProc
    parent-obj @ DUP IF ^ checkWindow THEN
    template @
    HINST
    CreateDialogIndirectParamA
;

: endDialog ( n )
   SUPER checkWindow EndDialog SUPER -wthrow
;

C: IDCANCEL  ( code -- )
    DROP IDCANCEL endDialog
;

W: WM_CLOSE
    2DROP 2DROP IDCANCEL endDialog 0
;

: showModal ( template parent-obj -- result )
    || R: parent-obj R: template ||
    SELF
    ['] BaseDlgProc
    parent-obj @ DUP IF ^ checkWindow THEN
    template @
    HINST
    DialogBoxIndirectParamA
;

: getItemStrText ( id -- str )
    || CWindow wnd ||
    SUPER checkWindow GetDlgItem wnd hWnd !
    wnd getStrText
;

;CLASS
