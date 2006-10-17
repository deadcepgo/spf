REQUIRE {            ~ac/lib/locals.f
REQUIRE STR@         ~ac/lib/str5.f
REQUIRE [IF]          lib/include/tools.f

WINAPI: MessageBoxA USER32.DLL
         6 CONSTANT IDYES
0x00000004 CONSTANT MB_YESNO
0x00000030 CONSTANT MB_ICONEXCLAMATION

WINAPI: FormatMessageA KERNEL32.DLL

HEX

00000100 CONSTANT FORMAT_MESSAGE_ALLOCATE_BUFFER
00001000 CONSTANT FORMAT_MESSAGE_FROM_SYSTEM

00 CONSTANT LANG_NEUTRAL
01 CONSTANT SUBLANG_DEFAULT
DECIMAL

: MAKELANGID ( p s -- langid )
  10 LSHIFT OR
;
\       ((((WORD  )(s)) << 10) | (WORD  )(p))
USER EMBUF
VARIABLE DenyGuiMessages
: /dgm TRUE DenyGuiMessages ! ;

: ErrorMessage ( errcode -- addr u )
  >R
  0 0 EMBUF
  LANG_NEUTRAL SUBLANG_DEFAULT MAKELANGID
  R> 0
  FORMAT_MESSAGE_ALLOCATE_BUFFER  FORMAT_MESSAGE_FROM_SYSTEM OR
  FormatMessageA
  ?DUP IF EMBUF @ SWAP ( 2-) ELSE HERE 0 THEN
;

[UNDEFINED] PROG-NAME [IF] : PROG-NAME S" SP-Forth" ; [THEN]

: Message { s -- }
  DenyGuiMessages @ IF s STR@ TYPE CR EXIT THEN
  MB_ICONEXCLAMATION PROG-NAME DROP
  s STR@ DROP
  0 MessageBoxA DROP
;
: MessageY/N { s -- flag }
  DenyGuiMessages @ IF s STR@ TYPE ."  - No" CR FALSE EXIT THEN
  MB_YESNO PROG-NAME DROP
  s STR@ DROP 
  0 MessageBoxA IDYES =
;
