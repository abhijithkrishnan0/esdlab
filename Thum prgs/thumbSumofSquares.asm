        NAME    main
        
        PUBLIC  __iar_program_start
        
        SECTION .DATA:CONST:NOROOT(2)
NUM     DC32 0X1
        SECTION .intvec:CODE:NOROOT (2)



    
__iar_program_start

                
main    
        LDR     R0,=thumbcode
        MOV     LR,PC
        BX     R0
STOP    B       STOP

CODE16
thumbcode
       LDR      R1,NUM
       MOV      R2,R1
LOOP    
        
        MOV     R3,R2
        MUL     R3,R2,R3
        ADD     R4,R3,R4
        SUBS     R2,R2,#1
        BEQ     HERE
        B       LOOP
HERE        BX      LR
        END
