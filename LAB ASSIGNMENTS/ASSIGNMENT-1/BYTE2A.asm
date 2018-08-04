page 60,132
title byteadd2A (exe) byte by byte addition
;---------------------------------------------
.model small
.stack 60
.data
  num1 db 10
  num2 db 22
  num3 db ?
;---------------------------------------------
.code
   main proc near
        mov ax,@data
        mov ds,ax
        mov al,num1
        add al,num2
        mov num3,al

        mov ah,00h
        mov al,num3
        mov bl,0ah
        mov cl,00h
  A20:
        div bl
        mov dh,00h
        mov dl,ah
        push dx
        cbw
        inc cl
        cmp dl,00h
        jne A20
        pop dx
        dec cl
  print:
        pop bx
        mov ah,02h
        mov dl,bl 
        add dl,30h
        int 21h
        dec cl
        jnz print

     exit:
          mov ax,4c00h
          int 21h
     main endp
     end main