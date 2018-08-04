page 60,132
title bytediv2d (exe) byte by byte division
;---------------------------------------------
.model small
.stack 60
.data
  num1 db 25
  num2 db 11
  quotient db ?
  reminder db ?
  msg1 db 10,"reminder is ",'$'
  msg2 db "quotient is ",'$'
;---------------------------------------------
.code
   main proc far
        mov ax,@data
        mov ds,ax
        mov al,num1
        mov ah,00h
        div num2
        mov reminder,ah
        mov quotient,al
        
        mov ah,09h
        lea dx,msg2
        int 21h
        mov ah,00h
        mov al,quotient
        call print
        
        mov ah,09h
        lea dx,msg1
        int 21h
        mov ah,00h
        mov al,reminder
        call print

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
        cmp dl,00h
        jne A20
        
        pop bx 
        dec cl
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
   
     