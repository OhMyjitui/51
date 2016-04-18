;冒泡排序
;http://blog.csdn.net/u013457167/article/details/46399321

;十个数从小到大排序
Size   equ   10              ; 数据个数
Array  equ   60h             ; 数据起始地址
Change equ   0               ; 交换标志
ORG 0000H
MOV 60H,#02H  ;给60-69H存储单元送初值
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
       JC    Next            ; 前小后大, 不交换

       SETB  Change          ; 前大后小, 置交换标志
       XCH   A, @R0          ; 交换
       DEC   R0
       XCH   A, @R0
       INC   R0
Next:
       DJNZ  R7, GOON
       JB    Change, SORT
       LJMP  $


       end 