\ ��������� ������ �� HTTP/FTP ����� ���������� CURL
\ ~ac: ��������� ����� xt-so.f 18.08.2005
\ $Id$
\ ��������� libcurl.dll - http://curl.haxx.se/latest.cgi?curl=win32-devel-ssl

REQUIRE SO            ~ac/lib/ns/so-xt.f
REQUIRE STR@          ~ac/lib/str5.f
REQUIRE [IF]          lib/include/tools.f

REQUIRE ADD-CONST-VOC lib/ext/const.f
S" ~ygrek/lib/data/curl.const" ADD-CONST-VOC

USER uCurlRespCode

ALSO SO NEW: libcurl.dll
ALSO SO NEW: libcurl.so
ALSO SO NEW: libcurl.so.3
ALSO SO NEW: libcurl.so.4

\ Global libcurl initialization
\ ~ac 01.01.2008: ��� ������������� � ������ ��������� ������� curl
\ �������� �� ������ �������������� dll (�� ����������� ���� ��� ����),
\ ������� ����� �������� ����������� �������� ��� �������� �������������,
\ ��� ���� ������, � ��� ������������� ������� CURL-GLOBAL-INIT ��������.

VARIABLE CURL-ERR

: (CURL-GLOBAL-INIT) CURL_GLOBAL_ALL 1 curl_global_init THROW ;
: CURL-GLOBAL-INIT1 ['] (CURL-GLOBAL-INIT) CATCH CURL-ERR ! ;
VECT CURL-GLOBAL-INIT ' CURL-GLOBAL-INIT1 TO CURL-GLOBAL-INIT
..: AT-PROCESS-STARTING CURL-GLOBAL-INIT ;..
CURL-GLOBAL-INIT

\ Maximum number of bytes to download. 0 - unlimited
USER-VALUE CURL-MAX-SIZE
161 CONSTANT CURLOPT_POSTREDIR

USER uCurlRes
USER uCurlVerifySsl
USER uCurlConnectTimeout
USER uCurlTimeout

: CURL-VERSION ( -- addr u )
  0 curl_version ASCIIZ>
;
:NONAME { stream nmemb size ptr \ asize ti -- stream nmemb size ptr size*nmemb }
  TlsIndex@ -> ti stream TlsIndex!
  size nmemb * -> asize
  ptr asize uCurlRes @ STR+
  stream nmemb size ptr asize
  CURL-MAX-SIZE IF
    uCurlRes @ STR@ NIP CURL-MAX-SIZE > IF DROP 0 THEN
  THEN
  ti TlsIndex!
; 16 CALLBACK: CURL_CALLBACK

: CURL-SETOPT ( value opt h -- ) 3 curl_easy_setopt THROW ;

\ �����-���������� - ���������� ����� curl_perform
: AT-CURL-PRE ( h -- h ) ... ;

\ ���� ������ paddr pu - �������� ������, �� ���� ������������ ���� ������
\ curl ����� ������������ ���������� ��������� http_proxy, ftp_proxy
\ ������� ����� �� �������� ������ ����.
: GET-FILE-VIAPROXY-COOK { addr u ca cu paddr pu \ h url pr de slist -- str }
  "" uCurlRes !
  0 curl_easy_init -> h
  addr u >STR DUP -> url STRA CURLOPT_URL h CURL-SETOPT
  uCurlVerifySsl @ CURLOPT_SSL_VERIFYPEER h CURL-SETOPT
  uCurlConnectTimeout @ ?DUP IF CURLOPT_CONNECTTIMEOUT h CURL-SETOPT THEN
  uCurlTimeout @ ?DUP IF CURLOPT_TIMEOUT h CURL-SETOPT THEN

\  S" name:passw" DROP CURLOPT_USERPWD  h 3 curl_easy_setopt DROP
  1 -> de
  S" gzip,deflate" DROP CURLOPT_ENCODING h CURL-SETOPT
  ^ de CURLOPT_HTTP_CONTENT_DECODING   h CURL-SETOPT

  cu IF ca CURLOPT_COOKIE h CURL-SETOPT THEN

  S" Accept: */*" DROP 0 2 curl_slist_append -> slist
\  S" User-Agent: SP-Forth/4" DROP slist 2 curl_slist_append -> slist
  slist CURLOPT_HTTPHEADER h 3 curl_easy_setopt DROP

  pu IF paddr pu >STR DUP -> pr STRA CURLOPT_PROXY h CURL-SETOPT THEN

  1 CURLOPT_FOLLOWLOCATION h CURL-SETOPT
  5 CURLOPT_MAXREDIRS      h CURL-SETOPT
  3 CURLOPT_POSTREDIR      h CURL-SETOPT

  ['] CURL_CALLBACK CURLOPT_WRITEFUNCTION h CURL-SETOPT
  TlsIndex@ CURLOPT_WRITEDATA h CURL-SETOPT

  h AT-CURL-PRE DROP

  h 1 curl_easy_perform
  ?DUP IF 1 curl_easy_strerror ASCIIZ> ." cURL: " TYPE
\          ."  (" url STR@ TYPE ." )"
          CR
       THEN
  uCurlRespCode CURLINFO_RESPONSE_CODE h 3 curl_easy_getinfo DROP
  h 1 curl_easy_cleanup DROP
  url STRFREE pr ?DUP IF STRFREE THEN
  0 TO CURL-MAX-SIZE
  uCurlRes @
;
: GET-FILE-VIAPROXY ( addr u paddr pu  -- str )
  S" " 2SWAP GET-FILE-VIAPROXY-COOK
;
: GET-FILE ( addr u -- str )
  \ ��� ������ ��� � �������� � ���������� ��������� http_proxy
  2DUP FILE-EXIST IF FILE 2DUP >STR NIP SWAP FREE THROW EXIT THEN
  S" " GET-FILE-VIAPROXY
;

PREVIOUS PREVIOUS PREVIOUS PREVIOUS

\EOF
\ ����������� IP ��� xml-�������� � �������: http://xml.yandex.ru/ip.xml
: TEST
  S" http://xmlsearch.yandex.ru/xmlsearch?query=sp-forth" GET-FILE STYPE CR
  S" http://xmlsearch.yandex.ru/xmlsearch?query=sp-forth" S" http://proxy.enet.ru:3128/" GET-FILE-VIAPROXY STYPE CR
  S" ftp://ftp.forth.org.ru/" GET-FILE STYPE
;
TEST
