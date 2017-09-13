;---------------------------------------------------
; Programa:
; Autor:
; Data:
;---------------------------------------------------
ORG 100
A: DW 100H
B: DW 500H
PTR_A: DW A
PTR_B: DW B
HIGH_BYTE: DB 0



ORG 0
INICIO:
   LDA HIGH_BYTE
   PUSH
   LDA PTR_A
   PUSH
   LDA HIGH_BYTE
   PUSH
   LDA PTR_B
   PUSH
   JSR OP16BITS

   
   
   HLT

ORG 1000
SP: DW 0
TEMP: DW 0
PTR1: DW 0
PTR1_2: DW 0
PTR2: DW 0
PTR2_2: DW 0
PTR_TEMP: DW TEMP
PTR_TEMP_2: DW TEMP

OP16BITS:
   STS SP
   POP
   POP ;Descarta as 2 pos do stack 
   ;Pegar ponteiros

   POP
   STA PTR2
   ADD #1
   STA PTR2_2
   POP
   STA PTR2 + 1
   STA PTR2_2 + 1

   POP
   STA PTR1
   ADD #1
   STA PTR1_2
   POP
   STA PTR1 + 1
   STA PTR1_2 + 1

   JMP MAIOR
RETORNO:
   ;SE ACC FOR 0 NAO TROCA
   JZ FIM
   LDA PTR_TEMP
   ADD #1
   STA PTR_TEMP_2
   LDA @PTR2
   STA @PTR_TEMP
   LDA @PTR2_2
   STA @PTR_TEMP_2
   LDA @PTR1
   STA @PTR2
   LDA @PTR1_2
   STA @PTR2_2
   LDA @PTR_TEMP
   STA @PTR1
   LDA @PTR_TEMP_2
   STA @PTR1_2
FIM:
   LDS SP
   RET   

;MAIOR 16 BITS
MAIOR:
   ;Primeiro maior bits
   LDA @PTR1_2
   SUB @PTR2_2
   JZ IGUAL
   JP OPRIMEIRO
   JMP OSEGUNDO
    

OPRIMEIRO:
;SE O PRIMEIRO FOR MAIOR
   LDA #0
   JMP RETORNO

OSEGUNDO: 
   LDA #1
   JMP RETORNO
   

IGUAL:
   LDA @PTR1
   SUB @PTR2
   JZ IGUAL_MESMO
   JP OPRIMEIRO
   JMP OSEGUNDO


IGUAL_MESMO:
   LDS SP
   LDA #0
   JMP RETORNO
