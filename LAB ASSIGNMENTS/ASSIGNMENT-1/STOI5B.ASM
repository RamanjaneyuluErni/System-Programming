page 60,132
title strtoint (exe) string to integer conversion
;----------------------------------------------------
.model small
.stack 60
.data
   str db "1034",'$'
   num dw 0
   len db ?
   temp db ?
;----------------------------------------------------
.code
  main proc near
       mov ax,@data
       mov ds,ax
       lea si,str
       mov cl,00h

 strlen:            
         mov al,[si]
         inc cl
         inc si
         cmp al,'$'
         jne strlen

         dec cl
         mov len,cl
         lea si,str 
         mov bl,0ah
         mov ax,0000h     
 convert:
         mul bl
         mov dh,00h
         mov dl,[si]
         sub dl,30h
         add ax,dx
         inc si
         dec cl
         jnz convert
         
         mov num,ax
         mov cl,len
         mov bl,0ah
  A20:
        div bl
        mov dh,00h
        mov dl,ah
        push dx
        cbw
        cmp ax,00h
        jne A20
        
  print:
        pop bx
        mov ah,02h
        mov dl,bl 
        add dl,30h
        int 21h
        dec cl
        jnz print
 
   mov ax,4c00h
   int 21h
   main endp
   end main

