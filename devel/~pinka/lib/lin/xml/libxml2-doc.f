\ REQUIRE SO            ~ac/lib/ns/so-xt.f
\ ALSO SO NEW: libxml2.dll

128 256 OR 16384 OR VALUE xmlParserOption
\ pedantic error reporting
\ remove blank nodes
\ merge CDATA as text nodes
\ XML_PARSE_COMPACT  65536 : compact small text nodes

: FreeDoc ( doc -- )
  DUP 0= IF  DROP EXIT THEN
  1 xmlFreeDoc DROP
;
: LoadDoc ( file-a file-u -- doc )
  DROP
  xmlParserOption 0 ROT
  3 xmlReadFile
  DUP 0= IF  60001 THROW THEN 
; 
: LoadXmlDoc ( a u -- doc ) 
  2>R xmlParserOption 0 0 R> R>
  5 xmlReadMemory
  DUP 0= IF  60005 THROW THEN 
; 



\ m.b.

: CreatePushParserCtxt ( d-first-chunk d-filename -- ctxt|0 )
\ To allow content encoding detection, size of the first chunk should be >= 4
  DROP -ROT SWAP 0 0
  5 xmlCreatePushParserCtxt
  DUP IF EXIT THEN
  ABORT" error on CreatePushParserCtxt"
;
: WRITE-XMLPARSER ( d-chunk h-parser -- ior )
\ zero size chunk indicates the end of a document
  >R
   DUP 0= -ROT SWAP \ ( flag-of-terminate chunk-size chunk-addr )
  R>
  4 xmlParseChunk 0= IF 0 EXIT THEN 60025
;
: ParseChunk ( d-chunk ctxt -- )
\ zero size chunk indicates the end of a document
  WRITE-XMLPARSER THROW
;
: ClearPushParserCtxt ( ctxt -- )
  >R 
  0 \ encoding
  0 \ filename
  0 \ size
  0 \ chunk
  R> \ ctxt
  5 xmlCtxtResetPush 0= IF EXIT THEN
  ABORT" error on xmlCtxtResetPush"
;
: FreeParserCtxt ( ctxt -- )
  1 xmlFreeParserCtxt DROP
  \ the parsed document in ctxt->myDoc is not freed.
;
: ParserCtxtDoc ( ctxt -- doc )
  2 CELLS + @ 
;
: (PerParseDoc) ( ctxt xt -- )
\ for safing throws from xt or ParseChunk
  SWAP 2>R BEGIN 2R@ >R EXECUTE TUCK R> ( u  addr u ctxt ) ParseChunk 0= UNTIL
  RDROP RDROP
;
: PerParseDoc ( xt -- doc|0 )  \ xt ( -- addr u|0 ) \ transparent stack
  DUP >R EXECUTE ( a u ) DUP 0= IF NIP RDROP EXIT THEN
  0. CreatePushParserCtxt R> OVER >R ['] (PerParseDoc) CATCH
  ( 0 | i*x ior ) R> SWAP >R ( i*x ctxt )
  DUP ParserCtxtDoc SWAP FreeParserCtxt ( doc )
  R@ IF FreeDoc THEN R> THROW
;


S" ~pinka/lib/lin/xml/libxml2-so-workaround.f" INCLUDED

: FreeXmlString ( addr u -- )
  DROP 1 real_xmlFree
  \ 1 = IF EXIT THEN 60008 THROW
  DROP \ see also: libxml2::xmlMemFree
;
: SerializeDoc ( doc -- addr u )
\ "It's up to the caller to free the memory with xmlFree()" -- FreeXmlString
  0 >R RP@  0 >R RP@ ROT ( a-size a-addr doc )
  3 xmlDocDumpMemory DROP R> R>
  \ see also: XML_SERIALIZE
;

\EOF

: DumpDoc ( doc -- )
  H-STDOUT \ see http://xmlsoft.org/examples/io1.c
  2 xmlDocDump
  -1 <> IF EXIT THEN
  ABORT" error on xmlDocDump"
  \ ???  not work
;

