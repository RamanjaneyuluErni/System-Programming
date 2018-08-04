page 60,132
title cal (exe) claculator
;---------------------------------------------
.model small
.stack 60
.data
  num1 dw 215
  num2 db 05
  result dw ? 
  temp1 db ?
  temp2 db ?
  msg1 db "addition result is ",'$'
  msg2 db 10,"subtraction result is ",'$' 
  msg3 db 10,"multipliaction result is ",'$'
  msg4 db 10,"division result is ",'$'
;---------------------------------------------
.code
   main proc far
        mov ax,@data
        mov ds,ax
        
   add10:
   
        mov ax,num1
        mov bl,num2
        mov bh,00h
        adc ax,bx
        mov result,ax
        mov ah,09h
        lea dx,msg1
        int 21h
         
        mov ax,result
        call print
        
       
  sub10:
        mov ax,num1
        mov bl,num2
        mov bh,00h
        sbb ax,bx
        mov result,ax
        mov ah,09h
        lea dx,msg2
        int 21h
         
        mov ax,result
        call print 
         
        
  mul10:
        mov ax,num1
        mov bl,num2
        mul bl
        mov result,ax
        mov ah,09h
        lea dx,msg3
        int 21h
        
        mov ax,result
        call print 
          
  div10:
        mov ax,num1
        mov bl,num2
        div bl 
        mov result,ax
        mov ah,09h
        lea dx,msg4
        int 21h
        
        mov ax,result
        call print
        
   exit:
        mov ax,4c00h
        int 21h
    main endp
;----------------------------------------------
 
 print proc near
        mov bl,0ah
        mov cl,00h
  A20:
        div bl
        mov dh,00h
        mov dl,ah
        push dx
        cbw
        inc cl
        cmp ax,00h
        jne A20
        
  print1:
        pop bx
        mov ah,02h
        mov dl,bl 
        add dl,30h
        int 21h
        dec cl
        jnz print1
        ret
   print endp
 end main
   
     