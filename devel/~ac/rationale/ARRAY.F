: Limits ( addr size -- addr2 addr )
  OVER + SWAP
;
: CELL ( -- cellsize )
  1 CELLS
;

( ��������� xt ��� ������ ��������� �������, ��������� ������� ������
  � �������� � ������. ������ �������� ������� - cell.
  ������������ addr - ����� � �������, ��� ��������� �������� xt
  ������ true. ������ ��� ���� ���������� �� �� �����.
  ���� ����� ��������� false, �� �� ��������� ��������� ������������ 0.
)
: ArrayForEach ( ... xt array size -- addr )  \ size - ������ ������� � ������
  Limits ?DO I @ SWAP DUP >R EXECUTE
             IF R> DROP I UNLOOP EXIT THEN
             R>
         CELL +LOOP DROP 0
;
: (ArraySearch) ( n -- n flag )
  OVER =
;
: ArraySearch ( n array size -- addr | 0 )
  ['] (ArraySearch) ROT ROT ArrayForEach NIP
;

\ �������

\ CREATE Array1 11 , 22 , 33 ,

\ 22 Array1 3 CELLS ArraySearch @ .
\ 33 Array1 3 CELLS ArraySearch @ .
\ 44 Array1 3 CELLS ArraySearch .
