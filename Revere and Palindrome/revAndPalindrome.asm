        NAME    main
        
        PUBLIC  __iar_program_start
        SECTION .DATA:CONST:NOROOT (2)
STRING  DCB     'YOLOLOY'
LEN     DCB     LEN-STRING
REV     DS8     8

        SECTION .intvec:CODE:NOROOT (2)

__iar_program_start

main   
          
          LDR   R0,=STRING
          LDR   R1,=LEN
          SUB   R1,R1,#1
          LDR   R2,=REV
          LDR   R5,LEN
          ;START REV
          
          
REVL:
          LDRB   R3,[R1],#-1
          STRB   R3,[R2],#1
          SUB    R5,R5,#1
          CMP    R5,#0
          BNE   REVL
          
          ;PALINDROME
          
          LDR   R1,=LEN
          SUB   R1,R1,#1
          LDR   R2,=REV
          LDR   R5,LEN
PAL:    
          LDRB  R3,[R0],#1
          LDRB  R4,[R1],#-1
          CMP   R3,R4
          BNE   NOPAL
          CMP   R0,R1
          BLO   PAL
          MOV   R6,#1
          B     STOP
NOPAL:
        MOV     R6,#2
          
          
          
STOP    B       STOP
        END
