        NAME    main
        
        PUBLIC  __iar_program_start
  
        SECTION .intvec:CODE:NOROOT (2)



    
__iar_program_start

                
main    
        LDR     R0,=thumbcode
        MOV     LR,PC
        BX     R0
STOP    B       STOP

CODE16
thumbcode
        
        MOV     R1,#5
        MOV     R2,R1
LOOP    SUBS     R2,R2,#1
        BEQ     FINAL
        MUL     R1,R1,R2
        B       LOOP
FINAL
        BX      LR
       
        END
