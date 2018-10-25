  NAME    main
        
            PUBLIC  __iar_program_start
            SECTION datas:CONST(2)
       num:
              DC32 0X04
       sumofsquare:
              DS32 1
              
            SECTION .intvec:CODE:NOROOT (2)
__iar_program_start

main


      code32
      ldr r6,num
      
      ldr r0,=thumbcode
      mov lr,pc
      bx  r0
      str r6,sumofsquare
            
STOP    B    STOP

   code16
thumbcode
        
        mov     r5,r6
        mov     r4,r6
        add     r5,r5,r5
        add     r5,r5,#1
        add     r4,r4,#1
        mov     r3,#1
        mul     r3,r4,r3
        mul     r3,r5,r3
        mul     r3,r6,r3
        mov     r2,#6
        mov     r6,#0
l1:     
        add     r6,r6,#1
        sub     r3,r3,r2
        cmp     r3,#00
        bne      l1
        
        
        
       

           BX  LR 
           END