\ $Id$
\
\ Some common XHTML words

REQUIRE xmltag ~ygrek/lib/xmltag.f
REQUIRE AsQWord ~pinka/spf/quoted-word.f
REQUIRE XMLSAFE ~ygrek/lib/xmlsafe

MODULE: XHTML

\ shortcuts
: << POSTPONE START{ ; IMMEDIATE
: >> POSTPONE }EMERGE ; IMMEDIATE

: :span ( `class -- ) PRO %[ `class $$ ]% `span atag CONT ;
: span: ( "class" -- ) PARSE-NAME PRO :span CONT ;
: hrule `hr /tag ;

: th ( a u -- ) `th tag XMLSAFE::TYPE ;
: tr ( <--> ) PRO `tr tag CONT ;
: td PRO `td tag CONT ;

: :div ( `class -- ) PRO %[ `class $$ ]% `div atag CONT ;

: link-tag ( `link --> \ <-- ) PRO %[ `href $$ ]% `a atag CONT ;
: link-text ( name u link u2 -- ) link-tag XMLSAFE::TYPE ;

: li `li PRO tag CONT ;
: ul `ul PRO tag CONT ;
: mdash ."  &mdash; " ;

: icon-valid ( -- )
  `http://validator.w3.org/check?uri=referer link-tag
   %[ 
    S" Valid XHTML 1.0 Strict" `alt $$
    `http://www.w3.org/Icons/valid-xhtml10 `src $$
    `31 `height $$
    `88 `width $$
   ]% /atag: img ;

: xml-declaration " <?xml version={''}1.0{''}?>" STYPE CR ;

: doctype-strict
  " <!DOCTYPE html PUBLIC {''}-//W3C//DTD XHTML 1.0 Strict//EN{''} {''}http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd{''}>" STYPE CR ;

: xhtml 
  PRO
  %[ `http://www.w3.org/1999/xhtml `xmlns $$ ( `en `xml:lang $$ `en `lang $$ ) ]% atag: html 
  CONT ;
  
\ : meta-content-type %[ `content-type `http-equiv $$ `text/html;charset=cp1251 `content $$ ]% /atag: meta ;
 
: link-stylesheet ( `href -- ) %[ `href $$ `stylesheet `rel $$ `text/css `type $$ ]% /atag: link ;

;MODULE