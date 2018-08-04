page 60,132
title sort7 (exe) sorting an array of elements
;-----------------------------------------------
.model small
.386
.stack 60
.data
    array db 9,1,6,4,5,2,3,7,8
    num db 9
    space db "  ",'$'
;-----------------------------------------------
.code
  main proc near
       mov ax,@data
       mov ds,ax
       lea si,array
       mov cl,09h
 outer:
       mov bl,cl
       dec bl
       mov al,[si]
       mov di,si
       inc di  
 inner:
       cmp al,[di]
       ja swap  
       inc di
       dec bl
       jz A20
       jmp inner
  swap:
        xchg al,[di]
        mov [si],al
        inc di
        dec bl
        jz A20
        jmp inner
 A20:
     inc si
     dec cl
     cmp cl,01h
     jne outer

      lea si,array
      mov cl,09h
  print2:
         mov al,[si]
         mov ah,02h
         mov dl,al
         add dl,30h
         int 21h
         mov ah,09h
         lea dx,space
         int 21h
         inc si
         dec cl
         jnz print2
   mov ax,4c00h
   int 21h
 main endp
 end main  