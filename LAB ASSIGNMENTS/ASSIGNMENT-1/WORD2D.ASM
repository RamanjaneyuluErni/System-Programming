page 60,132
title wordmul2c (exe) word by word division
;---------------------------------------------
.model small
.stack 60
.data
  num1 dw 0534
  num2 dw 0012
  reminder db ?
  quotient db ?
  msg1 db "division result : ",'$' 
  msg2 db 10,"reiminder : ",'$'
  msg3 db 10,"quotient : ",'$'
;---------------------------------------------
.code
   main proc far
        mov ax,@data
        mov ds,ax
        
        mov ax,0000h
        mov dx,0000h
        mov bx,num2
        mov ax,num1
        div bl
        
        mov reminder,ah
        mov quotient,al
        
        mov ah,09h
        lea dx,msg1
        int 21h 
        
        mov ah,09h
        lea dx,msg3
        int 21h
        mov ah,00h
        mov al,quotient
        call print
        
        mov ah,09h
        lea dx,msg2
        int 21h
        mov ah,00h
        mov al,reminder
        call print
  exit:
        mov ax,4c00h
        int 21h
    main endp
;----------------------------------------------
 print proc near
        mov dx,00h
        
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