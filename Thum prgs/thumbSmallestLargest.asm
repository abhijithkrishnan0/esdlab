        NAME    main
        
        PUBLIC  __iar_program_start
        
        SECTION .DATA:CONST:NOROOT(2)
NUM     DC32 0X12,34,56,78,01,21,99,11
LEN     DC32 (LEN-NUM)/4
HIGH    DS32  2
LOW     DS32  1
        SECTION .intvec:CODE:NOROOT (2)



    
__iar_program_start

                
main    
        LDR     R0,=thumbcode
        MOV     LR,PC
        BX     R0
STOP    B       STOP

CODE16
thumbcode
       LDR      R2,=NUM
       
       LDR      R3,NUM;SMALL
       LDR      R4,NUM;LARGE
       LDR      R1,LEN
LOOP    SUBS     R1,R1,#1
        ADD      R2,R2,#4
        BEQ     HERE
        LDR     R5,[R2]
        CMP     R3,R5
        BHI     LOOP2
        MOV     R3,R5
        B       LOOP
LOOP2   CMP     R4,R5
        BLO     LOOP
        MOV    R4,R5
        B       LOOP
HERE        BX      LR
        END
