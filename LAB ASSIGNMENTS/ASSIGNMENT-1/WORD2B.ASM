page 60,132
title wordsub2A (exe) word by word subtraction
;---------------------------------------------
.model small
.stack 60
.data
  num1 dw 716
  num2 dw 221
  msg db "subtraction result is ",'$'
  num3 dw ?
;---------------------------------------------
.code
   main proc far
        mov ax,@data
        mov ds,ax
        mov ax,num1
        sbb ax,num2
        mov num3,ax
        
        mov ah,09h
        lea dx,msg
        int 21h
        mov ax,num3
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