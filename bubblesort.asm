;ð������
;http://blog.csdn.net/u013457167/article/details/46399321

;ʮ������С��������
Size   equ   10              ; ���ݸ���
Array  equ   60h             ; ������ʼ��ַ
Change equ   0               ; ������־
ORG 0000H
MOV 60H,#02H  ;��60-69H�洢��Ԫ�ͳ�ֵ
MOV 61H,#05H
MOV 62H,#03H
MOV 63H,#07H
MOV 64H,#09H
MOV 65H,#14H
MOV 66H,#13H
MOV 67H,#08H
MOV 68H,#01H
MOV 69H,#12H
SORT:
       MOV   R0, #Array
       MOV   R7, #Size-1
       CLR   Change
GOON:
       MOV   A, @R0
       MOV   R2, A
       INC   R0


       MOV   B, @R0
       CJNE  A, B, NotEqual
       SJMP  Next
NotEqual:
       JC    Next            ; ǰС���, ������

       SETB  Change          ; ǰ���С, �ý�����־
       XCH   A, @R0          ; ����
       DEC   R0
       XCH   A, @R0
       INC   R0
Next:
       DJNZ  R7, GOON
       JB    Change, SORT
       LJMP  $


       end 