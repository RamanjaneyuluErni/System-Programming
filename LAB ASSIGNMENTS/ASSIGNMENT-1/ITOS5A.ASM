page 60,132
title inttostr (exe) integer to string 
;---------------------------------------------
.model small
.stack 60
.data
  num dw 1234
  str1 db 4 dup(?)
  str2 db 4 dup(?)
  divider db 10
 ;--------------------------------------------
.code
    main proc near
         mov ax,@data
         mov ds,ax
         mov ax,num
         lea si,str1
 convert:
         div divider
         add ah,30h
         mov [si],ah
         inc si
         cbw
         cmp ax,0000h
         jne convert

         lea si,str1
          mov cl,04h
  count:
         inc si
         dec cl
         jnz count
         dec si
         lea di,str2
         mov cl,04h
  reverse:
          mov al,[si]
          mov [di],al
          dec si
          inc di
          dec cl
          jnz reverse
          mov al,'$'
          mov [di],al

  print:
         mov ah,09h
         lea dx,str2
         int 21h
     mov ax,4c00h
     int 21h
   main endp
   end main

