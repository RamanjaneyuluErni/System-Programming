page 60,132
title strcpy (exe) string copy code implementation
;----------------------------------------------------------
.model small
.stack 60
.data
  str db "ramanjan",'$'
  cpy db 8 dup(?)
  str1 db "copied string is ",'$'
;----------------------------------------------------------
.code
  main proc near
       mov ax,@data
       mov ds,ax
       lea si,str
       lea di,cpy
       mov cl,08h
  strcpy:
        mov al,[si]
        mov [di],al
        inc si
        inc di
        dec cl
        jnz strcpy
        mov al,'$'
        mov [di],al

  print:
        mov ah,09h
        lea dx,str1
        int 21h
        mov ah,09h
        lea dx,cpy
        int 21h

        mov ax,4c00h
        int 21h
  main endp
  end main


        
