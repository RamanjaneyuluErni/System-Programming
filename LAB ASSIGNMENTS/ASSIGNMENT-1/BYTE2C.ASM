page 60,132
title bytemul2c (exe) byte by byte multiplication
;---------------------------------------------
.model small
.stack 60
.data
  num1 db 22
  num2 db 11
  res dw ?
;---------------------------------------------
.code
   main proc near
        mov ax,@data
        mov ds,ax
        mov al,num1
        mov ah,00h
        mul num2

        mov res,ax
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
        
        pop bx 
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