( �������� �������������� ����� "����-����������"
  Copyright [C] 1992-1999 A.Cherezov ac@forth.org
  �������������� �� 16-���������� � 32-��������� ��� - 1995-96��
  ������� - �������� 1999
)

( ���������� ��� ��������������� ������ ����.
  ESP - ��������� ����� ���������
  EBP - ��������� ����� ������
  EDI - ����������� ������� [��������� ������ ������ � SPF]
)

HEX

\ ================================================================
\ �������� �����������

CODE DUP ( x -- x x ) \ 94
\ �������������� x.
     LEA EBP, -4 [EBP]
     MOV [EBP], EAX
     RET
END-CODE

' DUP TO 'DUP_V

CODE 2DUP ( x1 x2 -- x1 x2 x1 x2 ) \ 94
\ �������������� ���� ����� x1 x2.
     MOV ECX, [EBP]
     MOV -4 [EBP], EAX
     MOV -8 [EBP], ECX
     LEA EBP, -8 [EBP]
     RET
END-CODE

CODE DROP ( x -- ) \ 94
\ ������ x �� �����.
     MOV EAX, [EBP]
     LEA EBP, 4 [EBP]
     RET
END-CODE
' DROP TO 'DROP_V

CODE MAX ( n1 n2 -- n3 ) \ 94
\ n3 - ������� �� n1 � n2.
     CMP EAX, [EBP]
     JL  # ' DROP
     LEA EBP, 4 [EBP]
     RET
END-CODE

CODE MIN ( n1 n2 -- n3 ) \ 94
 \ n3 - ������� �� n1 � n2.
     CMP EAX, [EBP]
     JG  # ' DROP
     LEA EBP, 4 [EBP]
     RET
END-CODE

CODE UMAX ( n1 n2 -- n3 ) \ 94
     CMP EAX, [EBP]
     JB  # ' DROP
     LEA EBP, 4 [EBP]
     RET
END-CODE

CODE UMIN ( n1 n2 -- n3 ) \ 94
     CMP EAX, [EBP]
     JA  # ' DROP
     LEA EBP, 4 [EBP]
     RET
END-CODE

CODE 2DROP ( x1 x2 -- ) \ 94
\ ������ �� ����� ���� ����� x1 x2.
     MOV EAX, 4 [EBP]
     LEA EBP, 8 [EBP]
     RET
END-CODE

CODE SWAP ( x1 x2 -- x2 x1 ) \ 94
\ �������� ������� ��� ������� �������� �����
\     XCHG EAX, [EBP]
     MOV   EDX, [EBP]
     MOV   [EBP], EAX
     MOV   EAX, EDX
     RET
END-CODE

CODE 2SWAP ( x1 x2 x3 x4 -- x3 x4 x1 x2 ) \ 94
\ �������� ������� ��� ������� ���� �����.
     MOV ECX, [EBP]
     MOV EBX, 4 [EBP]
     MOV EDX, 8 [EBP]
     MOV 8 [EBP], ECX
     MOV 4 [EBP], EAX
     MOV [EBP], EDX
     MOV EAX, EBX
     RET
END-CODE

CODE OVER ( x1 x2 -- x1 x2 x1 ) \ 94
\ �������� ����� x1 �� ������� �����.
     LEA EBP, -4 [EBP]
     MOV [EBP], EAX
     MOV EAX, 4 [EBP]
     RET
END-CODE

CODE 2OVER ( x1 x2 x3 x4 -- x1 x2 x3 x4 x1 x2 ) \ 94
\ ���������� ���� ����� x1 x2 �� ������� �����.
     MOV ECX, 8 [EBP]
     MOV -4 [EBP], EAX
     MOV -8 [EBP], ECX
     MOV EAX, 4 [EBP]
     LEA EBP, -8 [EBP]
     RET
END-CODE

CODE NIP ( x1 x2 -- x2 ) \ 94 CORE EXT
\ ������ ������ ������� ��� �������� �����.
     LEA EBP, 4 [EBP]
     RET
END-CODE

CODE ROT ( x1 x2 x3 -- x2 x3 x1 ) \ 94
\ ���������� ��� ������� �������� �����.
     MOV  EDX, [EBP]
     MOV  [EBP], EAX
     MOV  EAX, 4 [EBP]
     MOV  4 [EBP], EDX
     RET
END-CODE

CODE -ROT ( x1 x2 x3 -- x3 x1 x2 ) \ 94
\ ���������� ��� ������� �������� �����.
     MOV  EDX, 4 [EBP]
     MOV  4 [EBP], EAX
     MOV  EAX, [EBP]
     MOV  [EBP], EDX
     RET
END-CODE

CODE PICK ( xu ... x1 x0 u -- xu ... x1 x0 xu ) \ 94 CORE EXT
\ ������ u. ���������� xu �� ������� �����. �������������� ��������
\ ���������, ���� ����� ����������� PICK �� ����� ������,
\ ��� u+2 ���������.
     A; 8B C, 44 C, 85 C, 00 C,  \    MOV    EAX, [EBP + EAX*4 ]
     RET
END-CODE

CODE ROLL ( xu xu-1 ... x0 u -- xu-1 ... x0 xu ) \ 94 CORE EXT
\ ������ u. ��������� u+1 ������� �� ������� �����.
\ �������������� �������� ���������, ���� ����� ����������� ROLL
\ �� ����� ������ ��� u+2 ���������.
     OR EAX, EAX
     JZ SHORT @@1
     MOV ECX, EAX
     LEA EAX, [EAX*4]
     MOV EDX, EBP
     ADD EDX, EAX
     MOV EBX, [EDX]
@@2: LEA EDX, -4 [EDX]
     MOV EAX, [EDX]
     MOV 4 [EDX], EAX
     DEC ECX
     JNZ SHORT @@2
     MOV EAX, EBX
     JMP SHORT @@3
@@1: MOV EAX, [EBP]
@@3: LEA EBP, 4 [EBP]
     RET
END-CODE

CODE TUCK ( x1 x2 -- x2 x1 x2 )
\ Copy the first (top) stack item below the second stack item. 
     LEA EBP, -4 [EBP]
     MOV EDX, 4 [EBP]
     MOV [EBP], EDX
     MOV 4 [EBP], EAX
     RET
END-CODE


\ ================================================================
\ ���� ���������


CODE 2>R   \ 94 CORE EXT
\ �������������: ��������� ������������.
\ ����������: ( x1 x2 -- ) ( R: -- x1 x2 )
\ ��������� ���� ����� x1 x2 �� ���� ���������. ������������ 
\ ������������ SWAP >R >R.
     POP  EBX
     PUSH [EBP]
     PUSH EAX
     LEA EBP, 8 [EBP]
     MOV EAX, -4 [EBP]
     JMP EBX
END-CODE

CODE 2R>  \ 94 CORE EXT
\ �������������: ��������� ������������.
\ ����������: ( -- x1 x2 ) ( R: x1 x2 -- )
\ ��������� ���� ����� x1 x2 �� ����� ���������. ������������ 
\ ������������ R> R> SWAP.
     MOV EBX, [ESP]
     MOV  -4 [EBP], EAX
     MOV ECX, 8 [ESP]
     MOV EAX, 4 [ESP]
     MOV -8 [EBP], ECX
     LEA EBP, -8 [EBP]
     LEA ESP, 0C [ESP]
     JMP EBX
END-CODE

CODE R@ \ 94
\ ����������: ( -- x ) ( R: x -- x )
\ �������������: ��������� � ������ ������������� ������������.
     LEA EBP, -4 [EBP]
     MOV [EBP], EAX
     MOV EAX, 4 [ESP]
     RET
END-CODE   


CODE 2R@  \ 94 CORE EXT
\ �������������: ��������� ������������.
\ ����������: ( -- x1 x2 ) ( R: x1 x2 -- x1 x2 )
\ ���������� ���� ����� x1 x2 �� ����� ���������. ������������ 
\ ������������ R> R> 2DUP >R >R SWAP.
     MOV -4 [EBP], EAX
     MOV EAX, 4 [ESP]
     MOV EBX, 8 [ESP]
     MOV -8 [EBP], EBX
     LEA EBP, -8 [EBP]
     RET
END-CODE


\ ================================================================
\ �������� � �������

CODE @ ( a-addr -- x ) \ 94
\ x - �������� �� ������ a-addr.
     MOV EAX, [EAX]
     RET
END-CODE

CODE ! ( x a-addr -- ) \ 94
\ �������� x �� ������ a-addr.
     MOV EBX, [EBP]
     MOV [EAX], EBX
     MOV EAX, 4 [EBP]
     LEA EBP, 8 [EBP]
     RET
END-CODE

CODE C@ ( c-addr -- char ) \ 94
\ �������� ������ �� ������ c-addr. ���������� ������� ���� ������ �������.
     MOVZX EAX, BYTE [EAX]
     RET
END-CODE

CODE C! ( char c-addr -- ) \ 94
\ �������� char �� ������ a-addr.
     MOV EBX, [EBP]
     MOV BYTE [EAX], BL
     MOV EAX, 4 [EBP]
     LEA EBP, 8 [EBP]
     RET
END-CODE

CODE W@ ( c-addr -- word )
\ �������� word �� ������ c-addr. ���������� ������� ���� ������ �������.
     MOVZX EAX, WORD [EAX]
     RET
END-CODE

CODE W! ( word c-addr -- )
\ �������� word �� ������ a-addr.
     MOV EBX, [EBP]
     MOV WORD [EAX], BX
     MOV EAX, 4 [EBP]
     LEA EBP, 8 [EBP]
     RET
END-CODE

CODE 2@ ( a-addr -- x1 x2 ) \ 94
\ �������� ���� ����� x1 x2, ���������� �� ������ a-addr.
\ x2 �� ������ a-addr, x1 � ��������� ������.
\ ����������� DUP CELL+ @ SWAP @
     MOV EBX, 4 [EAX]
     LEA EBP, -4 [EBP]
     MOV [EBP], EBX
     MOV EAX, [EAX]
     RET
END-CODE

CODE 2! ( x1 x2 a-addr -- ) \ 94
\ �������� ���� ����� x1 x2 �� ������ a-addr,
\ x2 �� ������ a-addr, x1 � ��������� ������.
\ ����������� SWAP OVER ! CELL+ !
     MOV EBX, [EBP]
     MOV [EAX], EBX
     MOV EBX, 4 [EBP]
     MOV 4 [EAX], EBX
     LEA EBP, 0C [EBP]
     MOV EAX, -4 [EBP]
     RET
END-CODE

\ ================================================================
\ ����������

CODE 1+ ( n1|u1 -- n2|u2 ) \ 94
\ ��������� 1 � n1|u1 � �������� ����� u2|n2.
     LEA EAX, 1 [EAX]
     RET
END-CODE

CODE 1- ( n1|u1 -- n2|u2 ) \ 94
\ ������� 1 �� n1|u1 � �������� �������� n2|u2.
     LEA EAX, -1 [EAX]
     RET
END-CODE

CODE 2+ ( W -> W+2 )
     LEA EAX, 2 [EAX]
     RET
END-CODE

CODE 2- ( W -> W-2 )
     LEA EAX, -2 [EAX]
     RET
END-CODE

CODE 2*
     LEA EAX, [EAX*2]
     RET
END-CODE

CODE + ( n1|u1 n2|u2 -- n3|u3 ) \ 94
\ ������� n1|u1 � n2|u2 � �������� ����� n3|u3.
     ADD EAX, [EBP]
     LEA EBP, 4 [EBP]
     RET
END-CODE

CODE CELL+
     LEA EAX, 4 [EAX]
     RET
END-CODE

CODE CELL-
     LEA EAX, -4 [EAX]
     RET
END-CODE

CODE CELLS
     LEA EAX, [EAX*4]
     RET
END-CODE
               
CODE D+ ( d1|ud1 d2|ud2 -- d3|ud3 ) \ 94 DOUBLE
\ ������� d1|ud1 � d2|ud2 � ���� ����� d3|ud3.
     MOV EBX, [EBP]
     ADD 8 [EBP], EBX
     ADC EAX, 4 [EBP]
     LEA EBP, 8 [EBP]
     RET     
END-CODE

CODE D- ( d1|ud1 d2|ud2 -- d3|ud3 ) \ 94 DOUBLE
     MOV EBX, [EBP]
     SUB 8 [EBP], EBX
     SBB 4 [EBP], EAX
     MOV EAX, 4 [EBP]
     LEA EBP, 8 [EBP]
     RET
END-CODE

CODE - ( n1|u1 n2|u2 -- n3|u3 ) \ 94
\ ������� n2|u2 �� n1|u1 � �������� �������� n3|u3.
     NEG EAX
     ADD EAX, [EBP]
     LEA EBP, 4 [EBP]
     RET
END-CODE

CODE 1+! ( A -> )
     INC DWORD [EAX]
     MOV EAX, [EBP]
     LEA EBP, 4 [EBP]
     RET
END-CODE

CODE 0! ( A -> )
     MOV DWORD [EAX], # 0 
     MOV EAX, [EBP]
     LEA EBP, 4 [EBP]
     RET
END-CODE

CODE COUNT ( c-addr1 -- c-addr2 u ) \ 94
\ �������� ������ �������� �� ������ �� ��������� c-addr1.
\ c-addr2 - ����� ������� ������� �� c-addr1.
\ u - ���������� ����� c-addr1, ���������� ������ ������ ��������,
\ ������������ � ������ c-addr2.
     LEA EBP, -4 [EBP]
     LEA EBX, 1 [EAX]
     MOV [EBP], EBX
     MOVZX EAX, BYTE [EAX]
     RET
END-CODE

CODE * ( n1|u1 n2|u2 -- n3|u3 ) \ 94
\ ����������� n1|u1 � n2|u2 � �������� ������������ n3|u3.
     IMUL DWORD [EBP]
     LEA EBP, 4 [EBP]
     RET
END-CODE

CODE AND ( x1 x2 -- x3 ) \ 94
\ x3 - ��������� "�" x1 � x2.
     AND EAX, [EBP]
     LEA EBP, 4 [EBP]
     RET
END-CODE

CODE OR ( x1 x2 -- x3 ) \ 94
\ x3 - ��������� "���" x1 � x2.
     OR EAX, [EBP]
     LEA EBP, 4 [EBP]
     RET
END-CODE

CODE XOR ( x1 x2 -- x3 ) \ 94
\ x3 - ��������� "����������� ���" x1 � x2.
     XOR EAX, [EBP]
     LEA EBP, 4 [EBP]
     RET
END-CODE

CODE INVERT ( x1 -- x2 ) \ 94
\ ������������� ��� ���� x1 � �������� ���������� �������� x2.
     NOT EAX
     RET
END-CODE

CODE NEGATE ( n1 -- n2 ) \ 94 
\ n2 - �������������� �������� n1.
       NEG EAX
       RET
END-CODE

CODE DNEGATE ( d1 -- d2 ) \ 94 DOUBLE
\ d2 ��������� ��������� d1 �� ����.
       MOV EBX, [EBP]
       NEG EAX
       NEG EBX
       SBB EAX, # 0
       MOV [EBP], EBX
       RET
END-CODE

CODE ABS ( n -- u ) \ 94
\ u - ���������� �������� n.
       OR EAX, EAX
       JNS SHORT @@1
       NEG EAX
@@1:   RET
END-CODE

CODE NOOP ( -> )
     RET
END-CODE

CODE S>D ( n -- d ) \ 94
\ ������������� ����� n � ������� ����� d � ��� �� �������� ���������.
     CDQ
     LEA EBP, -4 [EBP]
     MOV [EBP], EAX
     MOV EAX, EDX
     RET
END-CODE

CODE D>S ( d -- n ) \ 94 DOUBLE
\ n - ���������� d.
\ �������������� �������� ���������, ���� d ��������� ��� ���������
\ �������� ��������� �����.
     MOV EAX, [EBP]
     LEA EBP, 4 [EBP]
     RET
END-CODE

CODE U>D ( U -> D ) \ ��������� ����� �� ������� �������� �����
     LEA EBP, -4 [EBP]
     MOV [EBP], EAX
     XOR EAX, EAX
     RET
END-CODE

CODE C>S ( c -- n )  \ ��������� CHAR
     MOVSX  EAX, AL
     RET
END-CODE

CODE UM* ( u1 u2 -- ud ) \ 94
\ ud - ������������ u1 � u2. ��� �������� � ���������� �����������.
       MUL DWORD [EBP]
       MOV [EBP], EAX
       MOV EAX, EDX
       RET
END-CODE

CODE / ( n1 n2 -- n3 ) \ 94
\ ������ n1 �� n2, �������� ������� n3.
\ �������������� �������� ���������, ���� n2 ����� ����.
\ ���� n1 � n2 ����������� �� ����� - ������������ ��������� ������� �� 
\ ����������.
       MOV ECX, EAX
       MOV EAX, [EBP]
       CDQ
       IDIV ECX
       LEA EBP, 4 [EBP]
       RET
END-CODE

CODE U/ ( W1, W2 -> W3 ) \ ����������� ������� W1 �� W2
       MOV ECX, EAX
       MOV EAX, [EBP]
       LEA EBP, 4 [EBP]
       XOR EDX, EDX
       DIV ECX
       RET
END-CODE

CODE +! ( n|u a-addr -- ) \ 94
\ ��������� n|u � ���������� ����� �� ������ a-addr.
       MOV EBX, [EAX]
       ADD EBX, [EBP]
       MOV [EAX], EBX
       LEA EBP, 8 [EBP]
       MOV EAX, -4 [EBP]
       RET
END-CODE

CODE MOD ( n1 n2 -- n3 ) \ 94
\ ������ n1 �� n2, �������� ������� n3.
\ �������������� �������� ���������, ���� n2 ����� ����.
\ ���� n1 � n2 ����������� �� ����� - ������������ ��������� ������� �� 
\ ����������.
       MOV EBX, EAX
       MOV EAX, [EBP]
       CDQ
       IDIV EBX
       LEA EBP, 4 [EBP]
       MOV EAX, EDX
       RET
END-CODE

CODE UMOD ( W1, W2 -> W3 ) \ ������� �� ������� W1 �� W2
       MOV EBX, EAX
       MOV EAX, [EBP]
       XOR EDX, EDX
       DIV EBX
       LEA EBP, 4 [EBP]
       MOV EAX, EDX
       RET
END-CODE

CODE UM/MOD ( ud u1 -- u2 u3 ) \ 94
\ ������ ud �� u1, �������� ������� u3 � ������� u2.
\ ��� �������� � ���������� �����������.
\ �������������� �������� ���������, ���� u1 ���� ��� �������
\ ��������� ��� ��������� ��������� ����������� �����.
       MOV EBX, EAX
       MOV EDX, [EBP]
       MOV EAX, 4 [EBP]
       DIV EBX
       LEA EBP, 4 [EBP]
       MOV [EBP], EDX
       RET
END-CODE

CODE 2/ ( x1 -- x2 ) \ 94
\ x2 - ��������� ������ x1 �� ���� ��� ������ ��� ��������� �������� ����.
     D1 C, F8 C,  \    SAR EAX, # 1
     RET
END-CODE

CODE */MOD ( n1 n2 n3 -- n4 n5 ) \ 94
\ �������� n1 �� n2, �������� ������������� ������� ��������� d.
\ ��������� d �� n3, �������� ������� n4 � ������� n5.
       MOV     EBX, EAX
       MOV     EAX, [EBP]
       MOV     ECX, 4 [EBP]
       IMUL    ECX
       IDIV    EBX
       MOV     4 [EBP], EDX
       LEA EBP, 4 [EBP]
       RET
END-CODE

CODE M* ( n1 n2 -- d ) \ 94
\ d - �������� ��������� ��������� n1 �� n2.
     IMUL DWORD [EBP]
     MOV  [EBP], EAX
     MOV  EAX, EDX 
     RET
END-CODE

CODE LSHIFT ( x1 u -- x2 ) \ 94
\ �������� x1 �� u ��� �����. ��������� ���� � �������� �������� ����,
\ ������������� ��� ������.
\ ������������� �������� ���������, ���� u ������ ��� �����
\ ����� ��� � ������.
     MOV ECX, EAX
     MOV EAX, [EBP]
     SHL EAX, CL
     LEA EBP, 4 [EBP]
     RET
END-CODE

CODE RSHIFT ( x1 u -- x2 ) \ 94
\ �������� x1 �� u ��� ������. ��������� ���� � �������� �������� ����,
\ ������������� ��� ������.
\ ������������� �������� ���������, ���� u ������ ��� �����
\ ����� ��� � ������.
     MOV ECX, EAX
     MOV EAX, [EBP]
     SHR EAX, CL
     LEA EBP, 4 [EBP]     
     RET
END-CODE

CODE SM/REM ( d1 n1 -- n2 n3 ) \ 94
\ ��������� d1 �� n1, �������� ������������ ������� n3 � ������� n2.
\ ������� � �������� ��������� ��������.
\ ������������� �������� ���������, ���� n1 ����, ��� ������� ���
\ ��������� ��������� �������� �����.
     MOV EBX, EAX
     MOV EDX, [EBP]
     MOV EAX, 4 [EBP]
     IDIV EBX
     LEA EBP, 4 [EBP]
     MOV [EBP], EDX
     RET
END-CODE

CODE FM/MOD ( d1 n1 -- n2 n3 ) \ 94
\ ��������� d1 �� n1, �������� ������� n3 � ������� n2.
\ ������� � �������� ��������� ��������.
\ ������������� �������� ���������, ���� n1 ����, ��� ������� ���
\ ��������� ��������� �������� �����.
     XCHG EBP, ESP
     MOV EBX, EAX
     POP EDX
     POP EAX
     PUSH EAX
     IDIV EBX
     OR EAX, EAX
     JS SHORT @@1
@@2: POP EBX
     PUSH EDX
     XCHG EBP, ESP
     RET
@@1: OR EDX, EDX
     JZ @@2
     DEC EAX
     MOV ECX, EAX
     IMUL EBX
     POP EBX
     SUB EBX, EAX
     PUSH EBX
     MOV EAX, ECX
     XCHG EBP, ESP
     RET
END-CODE

CODE DIGIT ( C, N1 -> N2, TF / FF ) \ N2 - �������� ������ C ���
           \ ����� � ������� ��������� �� ��������� N1
       MOV ECX, EAX
       MOV EAX, [EBP]
       A;  3C C, 30 C,  \  CMP AL, # 30
       JC SHORT @@1
       A;  3C C, 3A C,  \  CMP AL, # 3A
       JNC SHORT @@2
       A;  2C C, 30 C,  \  SUB AL, # 30
       CMP AL, CL
       JNC SHORT @@1
       MOV [EBP], EAX
       JMP SHORT @@3
@@2:   A;  3C C, 41 C,  \  CMP AL, # 41
       JC SHORT @@1
       A;  2C C, 37 C,  \  SUB AL, # 37
       CMP AL, CL
       JNC SHORT @@1
       MOV [EBP], EAX
@@3:   A; B8 C, TRUE W, TRUE W,  \  MOV EAX, # -1
       RET
@@1:   LEA EBP, 4 [EBP]
       XOR EAX, EAX
       RET
END-CODE

\ ================================================================
\ ���������

CODE = ( x1 x2 -- flag ) \ 94
\ flag "������" ����� � ������ �����, ����� x1 ������� ����� x2.
     XOR  EAX, [EBP]
     SUB  EAX, # 1
     SBB  EAX, EAX 
     LEA  EBP, 4 [EBP]
     RET
END-CODE

CODE <> ( x1 x2 -- flag ) \ 94 CORE EXT
\ flag "������" ����� � ������ �����, ����� x1 �� ����� x2.
     XOR  EAX, [EBP]
     NEG  EAX
     SBB  EAX, EAX
     LEA  EBP, 4 [EBP]
     RET
END-CODE

CODE < ( n1 n2 -- flag ) \ 94
\ flag "������" ����� � ������ �����, ����� n1 ������ n2.
       CMP  EAX, [EBP]
       SETLE AL
       AND  EAX, # 1
       DEC  EAX
       LEA  EBP, 4 [EBP]
       RET
END-CODE

CODE > ( n1 n2 -- flag ) \ 94
\ flag "������" ����� � ������ �����, ����� n1 ������ n2.
       CMP  EAX, [EBP]
       SETGE AL
       AND  EAX,  # 1
       DEC  EAX
       LEA  EBP, 4 [EBP]
       RET
END-CODE

CODE WITHIN     ( n1 low high -- f1 ) \ f1=true if ((n1 >= low) & (n1 < high))
      MOV  EBX, 4 [EBP]
      SUB  EAX, [EBP]
      SUB  EBX, [EBP]
      SUB  EBX, EAX
      SBB  EAX, EAX
      LEA  EBP, 8 [EBP]
      RET
END-CODE

CODE D< ( d1 d2 -- flag ) \ DOUBLE
\ flag "������" ����� � ������ �����, ����� d1 ������ d2.
     MOV EBX, [EBP]
     CMP 8 [EBP], EBX
     SBB 4 [EBP], EAX
     MOV EAX, # 0
     JGE SHORT @@1
       DEC EAX
@@1: LEA EBP, 0C [EBP]
     RET
END-CODE

CODE D> ( d1 d2 -- flag ) \ DOUBLE
\ flag "������" ����� � ������ �����, ����� d1 ������ d2.
     MOV EBX, 8 [EBP]
     CMP [EBP], EBX
     SBB EAX, 4 [EBP]
     MOV EAX, # 0
     JGE SHORT @@1
       DEC EAX
@@1: LEA EBP, 0C [EBP]
    RET
END-CODE

CODE U< ( u1 u2 -- flag ) \ 94
\ flag "������" ����� � ������ �����, ����� u1 ������ u2.
     CMP  [EBP], EAX
     SBB  EAX, EAX
     LEA  EBP, 4 [EBP]
     RET
END-CODE

CODE U> ( u1 u2 -- flag ) \ 94
\ flag "������" ����� � ������ �����, ����� u1 ������ u2.
     CMP  EAX, [EBP]
     SBB  EAX, EAX
     LEA  EBP, 4 [EBP]
     RET
END-CODE

CODE 0< ( n -- flag ) \ 94
\ flag "������" ����� � ������ �����, ����� n ������ ����.
    SAR EAX, # 1F
    RET
END-CODE

CODE 0= ( x -- flag ) \ 94
\ flag "������" ����� � ������ �����, ����� x ����� ����.
     SUB   EAX, # 1
     SBB   EAX, EAX
     RET
END-CODE

CODE 0<> ( x -- flag ) \ 94 CORE EXT
\ flag "������" ����� � ������ �����, ����� x �� ����� ����.
     NEG   EAX
     SBB   EAX, EAX
     RET
END-CODE

CODE D0= ( xd -- flag ) \ 94 DOUBLE
\ flag "������" ����� � ������ �����, ����� xd ����� ����.
     OR   EAX, [EBP]
     SUB  EAX, # 1
     SBB  EAX, EAX
     LEA  EBP, 4 [EBP]
     RET
END-CODE

CODE  D= ( xd1 xd2 -- flag ) \ 94 DOUBLE
\ flag is true if and only if xd1 is bit-for-bit the same as xd2
     MOV  EDX,   [EBP]
     XOR  EAX, 4 [EBP]
     XOR  EDX, 8 [EBP]
      OR  EAX, EDX
     SUB  EAX, # 1
     SBB  EAX, EAX
     LEA  EBP, 0C [EBP]
     RET
END-CODE

CODE D2* ( xd1 -- xd2 ) \ 94 DOUBLE
\ xd2 is the result of shifting xd1 one bit toward the most-significant
\ bit, filling the vacated least-significant bit with zero     
     D1 C, 65 C, 00 C, \  SHL [EBP], # 1
     D1 C, D0 C, \ RCL EAX, # 1
     RET
END-CODE          

CODE D2/ ( xd1 -- xd2 ) \ 94 DOUBLE
\ xd2 is the result of shifting xd1 one bit toward the least-significant bit,
\ leaving the most-significant bit unchanged
     D1 C, F8 C, \ SAR EAX, # 1
     D1 C, 5D C, 00 C, \  RCR [EBP], # 1
     RET
END-CODE

\ ================================================================
\ ������

CODE -TRAILING ( c-addr u1 -- c-addr u2 ) \ 94 STRING
\ ���� u1 ������ ����, u2 ����� u1, ������������ �� ���������� �������� � ����� 
\ ���������� ������, �������� c-addr � u1. ���� u1 ���� ��� ��� ������ ������� 
\ �� ��������, u2 ����.
      OR EAX, EAX
      JZ SHORT @@1
      MOV EDX, EDI
      MOV EDI, [EBP]
      ADD EDI, EAX
      LEA EDI, -1 [EDI]
      MOV ECX, EAX
      A; B0 C, 20 C, \ MOV AL, # 20
      STD
      REPZ SCAS BYTE
      JZ SHORT @@2
      INC ECX
@@2:  MOV EAX, ECX
      MOV EDI, EDX
@@1:  RET
END-CODE

CODE COMPARE ( c-addr1 u1 c-addr2 u2 -- n ) \ 94 STRING
\ �������� ������, �������� c-addr1 u1, �� �������, �������� c-addr2 u2.
\ ������ ������������, ������� � �������� �������, ������ �� ��������, �� ����� 
\ �������� �������� �� ����� ��� �� ���������� ��������. ���� ��� ������ 
\ ���������, n ����. ���� ��� ������ ��������� �� ����� �������� �������� �� 
\ �����, �� n ����� ������� (-1), ���� u1 ������ u2, ����� ������� (1).
\ ���� ��� ������ �� ��������� �� ����� �������� �������� �� �����, �� n ����� 
\ ������� (-1), ���� ������ ������������� ������ ������, �������� c-addr1 u1
\ ����� ������� �������� ��������, ��� ��������������� ������ � ������, 
\ �������� c-addr2 u2, � ������� � ��������� ������.
      MOV EDX, EDI
      MOV EDI,   [EBP]
      MOV ECX, 4 [EBP]
      MOV ESI, 8 [EBP]
      LEA EBP, 0C [EBP]  \    ADD EBP, # 0C   ####
      CMP ECX, EAX
      PUSHFD
      JC  SHORT @@1
      MOV ECX, EAX
@@1:  JECXZ @@2
      CLD
      REPZ CMPS BYTE
      JZ  SHORT @@2
      POP EBX
      A;  B8 C, -1 DUP W, W, \  MOV EAX, # -1
      JC  SHORT @@3
      NEG EAX
      JMP SHORT @@3
@@2:  XOR EAX, EAX
      POPFD
      JZ  SHORT @@3
      A;  B8 C, -1 DUP W, W, \  MOV EAX, # -1
      JC  SHORT @@3
      NEG EAX
@@3:  MOV EDI, EDX
      RET
END-CODE

CODE SEARCH ( c-addr1 u1 c-addr2 u2 -- c-addr3 u3 flag ) \ 94 STRING
\ ���������� ����� � ������, �������� c-addr1 u1, ������, �������� c-addr2 u2.
\ ���� ���� "������", ���������� ������� �� ������ c-addr3 � ����������� u3
\ ���������. ���� ���� "����", ���������� �� �������, � c-addr3 ���� c-addr1,
\ � u3 ���� u1.
      PUSH EDI
      CLD
      MOV EBX,   EAX
      OR EBX, EBX
      JZ SHORT @@5
      MOV EDX, 4 [EBP]
      MOV EDI, 8 [EBP]
      ADD EDX, EDI
@@4:  MOV ESI,   [EBP]
      LODS BYTE
      MOV ECX, EDX
      SUB ECX, EDI
      JECXZ @@1
      REPNZ SCAS BYTE
      JNZ SHORT @@1   \ �� ���� ������ ��� ������� ������� ������� ������
      CMP EBX, # 1
      JZ SHORT @@2   \ ������� ������ ����� ����� 1 � �������
      MOV ECX, EBX
      LEA ECX, -1 [ECX]
      MOV EAX, EDX
      SUB EAX, EDI
      CMP EAX, ECX
      JC SHORT @@1  \ ������� ������ ������ ������� ������
      PUSH EDI
      REPZ CMPS BYTE
      POP EDI
      JNZ SHORT @@4
@@2:  DEC EDI           \ ����� ������ ����������
      SUB EDX, EDI
      MOV 8 [EBP], EDI
      MOV 4 [EBP], EDX
@@5:  A;  B8 C, -1 DUP W, W, \  MOV EAX, # -1
      JMP SHORT @@3
@@1:  XOR EAX, EAX
@@3:  LEA EBP, 4 [EBP]
      POP EDI
      RET
END-CODE

CODE CMOVE ( c-addr1 c-addr2 u -- ) \ 94 STRING
\ ���� u ������ ����, ���������� u ���������������� �������� �� ������������ 
\ ������ ������� � ������ c-addr1 � c-addr2, ������ �� ��������, ������� � 
\ ������� ������� � �������.
       MOV EDX, EDI
       MOV ECX, EAX
       MOV EDI, [EBP]
       MOV ESI, 4 [EBP]
       CLD
\       SAR ECX, # 2
\       REP MOVS DWORD
\       MOV ECX, EAX
\       AND ECX, # 3
       REP MOVS BYTE
       LEA EBP, 0C [EBP]
       MOV EAX, -4 [EBP]
       MOV EDI, EDX
       RET
END-CODE

CODE QCMOVE ( c-addr1 c-addr2 u -- ) \ 94 STRING
\ ���� u ������ ����, ���������� u ���������������� �������� �� ������������ 
\ ������ ������� � ������ c-addr1 � c-addr2, ������ �� ��������, ������� � 
\ ������� ������� � �������.
       MOV EDX, EDI
       MOV ECX, EAX
       MOV EDI, [EBP]
       MOV ESI, 4 [EBP]
       CLD
       SAR ECX, # 2
       REP MOVS DWORD
       MOV ECX, EAX
       AND ECX, # 3
       REP MOVS BYTE
       LEA EBP, 0C [EBP]
       MOV EAX, -4 [EBP]
       MOV EDI, EDX
       RET
END-CODE



CODE CMOVE> ( c-addr1 c-addr2 u -- ) \ 94 STRING
\ ���� u ������ ����, ���������� u ���������������� �������� �� ������������ 
\ ������ ������� � ������ c-addr1 � c-addr2, ������ �� ��������, ������� ��
\ ������� ������� � �������.
       MOV EDX, EDI
       MOV ECX, EAX
       MOV EDI, [EBP]
       MOV ESI, 4 [EBP]
       STD
       ADD EDI, ECX
       DEC EDI
       ADD ESI, ECX
       DEC ESI
       REP MOVS BYTE
       MOV EDI, EDX
       LEA EBP, 0C [EBP]
       MOV EAX, -4 [EBP]
       RET
END-CODE

CODE FILL ( c-addr u char -- ) \ 94
\ ���� u ������ ����, ������� char � u ������ �� ������ c-addr.
       MOV EDX, EDI
       MOV ECX, [EBP]
       MOV EDI, 4 [EBP]
       CLD
       REP STOS BYTE
       MOV EDI, EDX
       LEA EBP, 0C [EBP]
       MOV EAX, -4 [EBP]
       RET
END-CODE

CODE ASCIIZ> ( c-addr -- c-addr u )
       MOV  ECX, EAX
@@1:   MOV  BL, [EAX]
       LEA  EAX, 1 [EAX]
       OR   BL, BL
       JNZ  SHORT @@1
       LEA  EAX, -1 [EAX]
       SUB  EAX, ECX
       LEA  EBP, -4 [EBP]
       MOV  [EBP], ECX
       RET
END-CODE

\ ================================================================
\ ��������� ������

CODE SP! ( A -> )
     MOV EBP, EAX
     MOV EAX, [EBP]
     LEA EBP, 4 [EBP]
     RET
END-CODE

CODE RP! ( A -> )
     POP EBX
     MOV ESP, EAX
     MOV EAX, [EBP]
     LEA EBP, 4 [EBP]
     JMP EBX
END-CODE

CODE SP@ ( -> A )
     LEA EBP, -4 [EBP]
     MOV [EBP], EAX
     MOV EAX, EBP
     RET
END-CODE

CODE RP@ ( -- RP )
     LEA EBP, -4 [EBP]
     MOV [EBP], EAX
     LEA EAX, 4 [ESP]
     RET
END-CODE

\ ================================================================
\ ������� ������ (������ ������ �����)

CODE TlsIndex! ( x -- ) \ ��������� ���������� ���� ������
     MOV EDI, EAX
     MOV EAX, [EBP]
     LEA EBP, 4 [EBP]
     RET
END-CODE

CODE TlsIndex@ ( -- x )
     LEA EBP, -4 [EBP]
     MOV [EBP], EAX
     MOV  EAX, EDI
     RET
END-CODE

CODE FS@ ( addr -- x )
     MOV  EAX, FS: [EAX]
     RET
END-CODE

CODE FS! ( x addr -- )
     MOV  EBX, [EBP]
     MOV  FS: [EAX], EBX
     MOV  EAX, 4 [EBP]
     LEA EBP, 8 [EBP]
     RET
END-CODE

\ ================================================================
\ �����

CODE J   \ 94
\ �������������: ��������� ������������.
\ ����������: ( -- n|u ) ( R: loop-sys -- loop-sys )
\ n|u - ����� ��������� ���������� ����������� �����.
\ ������������� �������� ���������, ���� �������� ����������.
      LEA EBP, -4 [EBP]
      MOV [EBP], EAX
      MOV EAX, 10 [ESP]
      SUB EAX, 14 [ESP]
      RET
END-CODE

( inline'� ��� ���������� ������ )

CODE C-DO
      A;  BB C, 0000 W, 8000 W,   \   MOV     EBX , # 80000000
      SUB  EBX, -8 [EBP]
      PUSH EBX
      ADD  EBX, EAX
      PUSH EBX
      MOV  EAX, -4 [EBP]
      RET
END-CODE

CODE C-?DO
      CMP  EAX, -8 [EBP]
      JNZ  SHORT @@1
\      SIF  0=
        MOV  EAX, -4 [EBP]
        JMP  EBX
\      STHEN
@@1:  PUSH EBX
      A; BB C, 0000 W, 8000 W,   \   MOV     EBX , # 80000000
      SUB  EBX, -8 [EBP]
      PUSH EBX  \ 80000000h-to
      ADD  EBX, EAX
      PUSH EBX  \ 80000000H-to+from
      MOV  EAX, -4 [EBP]
      RET
END-CODE

CODE C-I
      LEA EBP, -4 [EBP]
      MOV [EBP], EAX
      MOV EAX, [ESP]
      SUB EAX, 4 [ESP]
      RET
END-CODE

CODE C->R     \ 94
     PUSH EAX
     MOV  EAX, [EBP]
     LEA  EBP, 4 [EBP]
     RET
END-CODE

CODE C-R>    \ 94
     LEA  EBP, -4 [EBP]
     MOV  [EBP],  EAX
     POP EAX
     RET
END-CODE

CODE C-RDROP
     ADD ESP, # 4
     RET
END-CODE

CODE C-?DUP
     OR  EAX, EAX
     JZ SHORT @@1
     LEA EBP, -4 [EBP]
     MOV [EBP], EAX
@@1: RET
END-CODE 

CODE C-EXECUTE ( i*x xt -- j*x ) \ 94
\ ������ xt �� ����� � ��������� �������� �� ���������.
\ ������ ��������� �� ����� ������������ ������, ������� �����������.
     MOV  EBX, EAX
     MOV  EAX, [EBP]
     LEA  EBP, 4 [EBP]
     CALL EBX
     RET
END-CODE

\ ================================================================
\ ��������� LOCALS

CODE DRMOVE ( x1 ... xn n*4 -- )
\ ��������� n ����� �� ����� ������ �� ���� ���������
     POP  EDX \ ����� ��������
     MOV  ESI, EAX
@@1: 
     PUSH -4 [EBP] [ESI] 
     SUB  ESI, # 4
     JNZ  SHORT @@1
     ADD  EBP, EAX
     MOV  EAX, [EBP]
     LEA  EBP, 4 [EBP]
     JMP  EDX
END-CODE

CODE NR> ( R: x1 ... xn n -- D: x1 ... xn n )
\ ��������� n ����� �� ����� ��������� �� ���� ������
\ ���� n=0 ���������� 0
     POP  EDX \ ����� ��������
     LEA  EBP, -4 [EBP]     
     MOV  [EBP], EAX
     POP  EAX
     OR   EAX, EAX
     JNZ  @@2
     JMP  EDX

@@2: LEA  EAX, [EAX*4]
     MOV  ESI, EAX
@@1: 
     MOV  EBX, EBP
     SUB  EBX, ESI
     POP  [EBX]
     SUB  ESI, # 4
     JNZ  SHORT @@1
     SUB  EBP, EAX
     SAR  EAX, # 2
     JMP  EDX
END-CODE

CODE N>R ( D: x1 ... xn n -- R: x1 ... xn n )
\ ��������� n ����� �� ����� ������ �� ���� ���������
     LEA  EBP, -4 [EBP]
     MOV  [EBP], EAX
     LEA EAX, 4 [EAX*4]

     POP  EDX \ ����� ��������
     MOV  ESI, EAX
@@1: 
     PUSH -4 [EBP] [ESI] 
     SUB  ESI, # 4
     JNZ  SHORT @@1
     ADD  EBP, EAX
     MOV  EAX, [EBP]
     LEA  EBP, 4 [EBP]
     JMP  EDX
END-CODE

CODE NRCOPY ( D: i*x i -- D: i*x i R: i*x i )
\ ����������� n ����� �� ����� ������ �� ���� ���������
     MOV  ECX, EAX
     LEA  ECX, [ECX*4]

     POP  EDX \ ����� ��������
     JECXZ @@2
     MOV  ESI, ECX
@@1: 
     PUSH -4 [ESI] [EBP]
     SUB  ESI, # 4
     JNZ  SHORT @@1
@@2:
     PUSH EAX
     JMP  EDX
END-CODE

CODE RP+@ ( offs -- x )
\ ����� ����� �� ��������� offs ���� �� ������� ����� ��������� (0 RP+@ == RP@)
     8B C, 44 C, 04 C, 04 C, \ MOV EAX, 4 [EAX] [ESP]
     RET
END-CODE
     
CODE RP+ ( offs -- addr )
\ ����� ����� �� ��������� offs ���� �� ������� ����� ���������
     8D C, 44 C, 04 C, 04 C, \  LEA EAX, 4 [EAX] [ESP]
     RET
END-CODE

CODE RP+! ( x offs -- )
\ �������� ����� x �� �������� offs ���� �� ������� ����� ���������
     MOV  EBX, [EBP] A;
     89 C, 5C C, 04 C, 04 C, \   MOV  4 [ESP] [EAX], EBX
     LEA  EBP, 8 [EBP]
     MOV  EAX, -4 [EBP]
     RET
END-CODE

CODE RALLOT ( n -- addr )
\ ��������������� n ����� �� ����� ���������,
\ ������� � �������������� (� �� ���� ������ 8� �������, exception �����)
     POP  EDX
     MOV  ECX, EAX
     XOR  EAX, EAX
@@1: PUSH EAX
     DEC  ECX
     JNZ  SHORT @@1
     MOV  EAX, ESP
     JMP  EDX
END-CODE

CODE (RALLOT) ( n -- )
\ ��������������� n ����� �� ����� ���������
     POP  EDX
     MOV  ECX, EAX
     XOR  EAX, EAX
@@1: PUSH EAX
     DEC  ECX
     JNZ  SHORT @@1
     MOV  EAX, [EBP]
     LEA  EBP, 4 [EBP]
     JMP  EDX
END-CODE

CODE RFREE ( n -- )
\ ������� n ����� ����� ���������
     POP  EDX
     LEA  ESP, [ESP] [EAX*4]
     MOV EAX, [EBP]
     LEA EBP, 4 [EBP]
     JMP  EDX
END-CODE

CODE (LocalsExit) ( -- )
\ ������� ������ � ���� ��������, ����� ���� ����� �� �����
     POP  EBX
     ADD  ESP, EBX
     RET
END-CODE


CODE HASH ( addr u u1 -- u2 )
\ �������� � ������� ��� �������
\ addr u - ������
\ ���� u1 �� 0 ��� ����� � ��������� 0 ... u1-1
\ ���� u1=0 ��� � ��������� 0 ... 2^32-1
     PUSH EDI
     XCHG EAX, [EBP]
     MOV  ECX, EAX

     MOV  EBX, # 10DCD
     MUL  EBX
     ADD  EAX, # 7AB7
     MOV  EBX, # 109CEF4
     DIV  EBX
     MOV  EAX, EDX

     XOR  EDI, EDI
     XOR  EDX, EDX
     MOV  ESI, 4 [EBP]
@@1: ROL  EAX, # 1
     PUSH EAX
     MOVZX EAX, BYTE [EDI] [ESI]
     MOV  EBX, # 10DCD
     MUL  EBX
     ADD  EAX, # 7AB7
     MOV  EBX, # 109CEF4
     DIV  EBX
     POP  EAX
     XOR  EAX, EDX

     INC  EDI
     LOOP @@1

     CMP  DWORD [EBP], # 0
     JZ   @@2
     XOR  EDX, EDX
     DIV  DWORD [EBP]
     MOV  EAX, EDX
@@2: LEA  EBP, 8 [EBP]
     POP  EDI
     RET
END-CODE

CODE TIMER@ ( -- tlo thi ) \ ������ ��� Intel Pentium � ����!!!
\ ���������� �������� ������� ���������� ��� ud
   MOV -4 [EBP], EAX
   RDTSC
   MOV -8 [EBP], EDX
   LEA EBP, -8 [EBP]
   XCHG EAX, [EBP]
   RET
END-CODE

\ ��� ��������� ����������� ����������������:
\ : TIMER@ 0 GetTickCount ;

CODE TRAP-CODE ( D: j*x u R: i*x i -- i*x u )
\ ��������������� ����� ��� �������������� ��������, �����������
\ ����� CATCH �� ����� ���������
     POP  EDX
     POP  ESI
     OR   ESI, ESI
     JZ   @@2
     LEA  ESI, [ESI*4]
     MOV  ECX, ESI
@@1: MOV  EBX, -4 [ESI] [ESP]
     MOV  -4 [ESI] [EBP], EBX
     SUB  ESI, # 4
     JNZ  SHORT @@1
     ADD  ESP, ECX
@@2: JMP  EDX
END-CODE

DECIMAL
