page 60,132
title strncpy (exe) strncpy code implementation
;-----------------------------------------------------
.model small
.stack 60
.data
  str db "ramanjan.$"
  num db 5
  cpy db 5 dup(?)
  msg1 db "copied string:",'$'

;-----------------------------------------------------
.code
   main proc near
        mov ax,@data
        mov ds,ax
        lea si,str
        lea di,cpy
        mov cl,num

 strncpy:
         mov al,[si]
         mov [di],al
         inc si
         inc di
         dec cl
         jnz strncpy
         mov al,'$'
         mov [di],al
         mov ah,09h
         lea dx,msg1
         int 21h

  print:
         mov dx,0000h
         mov ah,09h
         lea dx,cpy
         int 21h

         mov ax,4c00h
         int 21h
  main endp
  end main
