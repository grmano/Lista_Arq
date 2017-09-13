;---------------------------------------------------
; Programa:
; Autor:
; Data:
;---------------------------------------------------
ORG 200
X: DB 99H
Y: DB 88H
PTR_X: DW X
PTR_Y: DW Y
ANS: DW 0
PTR_ANS: DW ANS
HIGH_BYTE: DB 0

ORG 0
INICIO:
   LDA HIGH_BYTE
   PUSH
   LDA PTR_ANS
   PUSH
   LDA HIGH_BYTE
   PUSH
   LDA PTR_Y
   PUSH
   LDA HIGH_BYTE
   PUSH
   LDA PTR_X
   PUSH
   JSR MULT
   HLT
   

ORG 1000
A: DB 0
B: DB 0
PTR_A: DW 0
PTR_B: DW 0
PTR_RES: DW 0
PTR_RES_2: DW 0
SP: DW 0


MULT:
   STS SP
   POP
   POP ; DESCARTA RIP
   POP
   STA PTR_A
   POP

   POP
   STA PTR_B
   POP

   POP
   STA PTR_RES
   ADD #1
   STA PTR_RES_2
   POP




   LDA @PTR_A
   STA A
   JZ FIM
   LDA @PTR_B
   STA B
   JZ FIM
   STA @PTR_RES

LOOP:
   LDA A
   SUB #1
   JZ FIM
   STA A
   LDA @PTR_RES
   ADD @PTR_B
   STA @PTR_RES
   LDA @PTR_RES_2
   ADC #0
   STA @PTR_RES_2
   JMP LOOP


FIM:
   LDS SP
   RET
  
   