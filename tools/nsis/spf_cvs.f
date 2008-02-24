WARNING 0!

REQUIRE COMPARE-U ~ac/lib/string/compare-u.f
REQUIRE FIND-FILES-R       ~ac/lib/win/file/findfile-r.f
REQUIRE ONFALSE ~profit/lib/bac4th.f
REQUIRE LIKE ~pinka/lib/like.f
REQUIRE replace-str- ~pinka/samples/2005/lib/replace-str.f
REQUIRE /STRING lib/include/string.f
REQUIRE DateM>S ~ac/lib/win/date/date-int.f

\ ���� � �������� ������� �����
\ ������������ �������
\ : SPF-PATH ( -- a u ) S" spf" ;
: SPF-PATH-LEN ( -- u ) SPF-PATH NIP ;
: double-slashed  ( a u -- s )  " {s}" DUP " \" " \\" replace-str- ;
SPF-PATH double-slashed VALUE path\\
: SPF-PATH-\\ path\\ STR@ ;

: MyDate# { d m y -- } y #N DROP [CHAR] . HOLD m DateM>S HOLDS DROP [CHAR] . HOLD d #N## DROP ;
: DateRaw# { d m y -- } d #N## DROP m #N## DROP y #N DROP ;
: MY_DATE ( -- a u ) <# TIME&DATE MyDate# 0 0 #> ;
: DATE_RAW ( -- a u ) <# TIME&DATE DateRaw# 0 0 #> ;
: NUM_RAW ( n -- ) S>D (D.) ;

: PROD_NAME    S" {PROD_NAME}" ;
: PROD_FILE    S" {PROD_FILE}" ;
: PROD_VENDOR  S" {PROD_VENDOR}" ;
: PROD_ICON    S" {PROD_ICON}" ;
: VER_MAJOR    S" {VER_MAJOR}" ;
: VER_MINOR    S" {VER_MINOR}" ;

: INI S" {INI}" ;

: VER_DATE     S" {VER_DATE}" ;
: MUI_ICON     S" {MUI_ICON}" ;
: INSTDIR      S" {INSTDIR}" ;
: LANG_ENGLISH S" {LANG_ENGLISH}" ;
: LANG_RUSSIAN S" {LANG_RUSSIAN}" ;

: Switch       S" {Switch}" ;
: Case         S" {Case}" ;
: Break        S" {Break}" ;
: EndSwitch    S" {EndSwitch}" ;
: WM_SETTEXT   S" {WM_SETTEXT}" ;
: stSTAT       S" {stSTAT}" ;

: SecSPF       S" {SecSPF}" ;
: SecUnRegVal  S" {SecUnRegVal}" ;
: SecStartMenu S" {SecStartMenu}" ;
: SecDesktop   S" {SecDesktop}" ;
: SecAssociate S" {SecAssociate}" ;
: SecShortcuts S" {SecShortcuts}" ;

\ ������ ����� � ��������
: />\ ( addr u -- )
  0 ?DO DUP I + C@ [CHAR] / = IF [CHAR] \ OVER I + C! THEN LOOP DROP ;

\ ��� ����� �� ����� ��� ���������� �������� ���������� � ������
: root-files=>
   PRO 
   S" spf4.exe" CONT
   S" jpf375c.exe" CONT 
   S" spf4.ini" CONT
   S" help.fhlp" CONT
   S" uninstall.exe" CONT ;

\ ���������� ������ ����� �� ��������� ���������
: root-dirs=> 
   PRO 
   S" devel" CONT
   S" docs" CONT
   S" lib" CONT
   S" samples" CONT
   S" src" CONT ;

\ �� ���������� ����� �����
: exceptions=>
  PRO
  S" *.log" CONT
  S" *\\CVS\\*" CONT
  S" *.old" CONT
  S" *.rar" CONT
  S" *.bak" CONT
  S" *.svn" CONT
  S" *.7z" CONT
  S" *.zip" CONT
  S" *.RAR" CONT
  S" *Entries.Log" CONT
  S" *.pid" CONT
  S" *-setup.exe" CONT
  S" *.md" CONT
  S" *.mdt" CONT
  S" *.md.css" CONT
  S" *\\~yz\\prog\\blank\\*" CONT \ http://sourceforge.net/tracker/index.php?func=detail&aid=1874989&group_id=17919&atid=117919
  S" *\\docs\\mark.new" CONT
  S" *\\docs\\Makefile" CONT ;


: FILTER ( a u -- a u ? )
   PREDICATE 
     root-files=> 
     " {SPF-PATH}\{s}" STR@ 
     2OVER COMPARE-U 0= ONTRUE
   SUCCEEDS IF TRUE EXIT THEN

   PREDICATE
     root-dirs=> 
     " {SPF-PATH-\\}\\{s}\\*" STR@ 2OVER 2SWAP ULIKE ONTRUE
   SUCCEEDS 0= IF FALSE EXIT THEN

   PREDICATE
     exceptions=>
     2OVER 2SWAP ULIKE ONTRUE
   SUCCEEDS 
   0= 
;

: FILE-FILTER ( a u f1 f2 -- a u ? )
  NIP
  IF 0 EXIT THEN

  2DUP />\ FILTER
;

: NSI-FILTER ( a u f1 f2 -- )
  FILE-FILTER
  0= IF 2DROP EXIT THEN

  2DUP " {s}" STR@
  CUT-PATH 
  1-
  DUP SPF-PATH-LEN < ABORT" STRANGE"
  SPF-PATH-LEN /STRING
  "  SetOutPath {''}$INSTDIR{s}{''}" STYPE CR
  "  File {''}{s}{''}" STYPE CR
;

: RAR-FILTER
  FILE-FILTER
  0= IF 2DROP EXIT THEN

  CR TYPE ;

: NSI-LIST SPF-PATH ['] NSI-FILTER FIND-FILES-R ;
: RAR-LIST SPF-PATH ['] RAR-FILTER FIND-FILES-R ;
