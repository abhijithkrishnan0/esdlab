  NAME    main
        
            PUBLIC  __iar_program_start
            SECTION datas:CONST(2)
       num:
              DC32 0X04,0x1,0x05,0x00,010
       length:
              DC32 (length-num)/4
       largest:
              DS32 1 
        smallest:
              DS32 1
              
            SECTION .intvec:CODE:NOROOT (2)
__iar_program_start

main


      code32
      
      
      ldr r0,=thumbcode
      mov lr,pc
      bx  r0
      str r4,largest
      str r2,smallest
            
STOP    B    STOP

   code16
thumbcode

        
       
       ldr r3,length
       ldr r6,=num
       ldr      r4,[r6]
       ldr      r2,[r6]
       
l1:
        add      r6,#4
       ldr      r5,[r6]
       cmp      r4,r5
       blo       l2
       mov      r4,r5
       b        here
l2:
       cmp      r2,r5
       bge       here
       mov      r2,r5
       
       
 
       
here:   sub      r3,r3,#1
        cmp     r3,#0x00
        bne     l1      
        
         BX  LR 
           END