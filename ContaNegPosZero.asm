;---------------------------------------------------
; Programa:Positivos, Negativos e Zero
; Autor: Lucas Germano da Silva
; Data:31/08/2017
;---------------------------------------------------

ORG 100

;Declaração de variaveis do programa principal

TAM_VETOR:  DB 16
END_VETOR: DW VETOR
POS: DB 0
NEG: DB 0
ZEROS: DB 0
VETOR: DB -50, 0, 20, 0, 15, 1, 14, 0, 0, -1, -2, -15, -50, 1, 0, -1
CONT: DB 0

ORG 0


INICIO:
;teste se ja chegou ao fim do vetor
   LDA TAM_VETOR
   SUB CONT
   JZ FIM

;zero
   LDA #0
   ADD @END_VETOR
   JZ EHZERO

;negativo
   LDA #0
   ADD @END_VETOR
   JN EHNEG

;se nao for nada e positivo
   LDA #1
   ADD POS
   STA POS
   
ITER:
   LDA #1
   ADD CONT
   STA CONT
   LDA #1
   ADD END_VETOR
   STA END_VETOR
   JMP INICIO


EHZERO:
   LDA #1
   ADD ZEROS
   STA ZEROS
   JMP ITER

EHNEG:
   LDA #1
   ADD NEG
   STA NEG
   JMP ITER


FIM:
   HLT