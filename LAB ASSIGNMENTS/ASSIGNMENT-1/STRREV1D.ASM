page 60,132
title strrev (exe) code to implement string rev
;---------------------------------------------------
.model small
.stack 60
.data
    str db "ramanjan",'$'
    rev db 8 dup(?)
;---------------------------------------------------
.code
     main proc near
          mov ax,@data
          mov ds,ax
          lea si,str
          lea di,rev
          mov cl,00h
  
   strlen:
          mov al,[si]
          cmp al,'$'
          je strrev
          inc si
          inc cl
          jmp strlen

   strrev:
          dec si
          mov al,[si]
          mov [di],al
          inc di
          dec cl
          jnz strrev

          mov al,'$'
          mov [di],al
   print:
         mov ah,09h
         lea dx,rev
         int 21h
     mov ax,4c00h
     int 21h
  main endp
  end main





