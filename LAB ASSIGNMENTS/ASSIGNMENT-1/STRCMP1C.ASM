page 60,132
title strcmp (exe) code to compare to strings
;------------------------------------------------
.model small
.stack 60
.data
   str1 db "ramana",'$'
   str2 db "ramanu",'$'
   msg1 db "strings are equal",'$'
   msg2 db "strings are not equal",'$'
;------------------------------------------------
.code
    main proc near
         mov ax,@data
         mov ds,ax
         lea si,str1
         lea di,str2
         mov cl,00h
         mov bl,00h
    len1:
         mov al,[si]
         inc cl
         inc si
         cmp al,'$'
         jne len1
    len2:
          mov al,[di]
          inc bl
          inc di
          cmp al,'$'
          jne len2

          cmp cl,bl
          jne notequal
          lea si,str1
          lea di,str2
    strcmp:
           mov al,[si]
           cmp al,[di]
           jne  notequal
           inc si
           inc di
           dec cl
           cmp cl,00h
           jne strcmp
    equal:
           mov ah,09h
           lea dx,msg1
           int 21h
           jmp exit
  notequal:
           mov ah,09h
           lea dx,msg2
           int 21h
     exit:
           mov ax,4c00h
           int 21h
     main endp
     end main
