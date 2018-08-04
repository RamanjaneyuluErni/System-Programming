page 60,132
title sumavg4 (exe) finding sum and average of an array elements
;------------------------------------------------------------------
.model small
.stack 60
.386
.data
  array db 1,2,3,4,5,6,7,8,9,0
  sum db 0
  avg db 0
  str1 db "sum : ",'$'
  str2 db 10,"avg: ",'$'
  reminder db ?
  quotient db ?
;------------------------------------------------------------------
.code
 main proc near
      mov ax,@data
      mov ds,ax
      lea si,array
      mov cl,0ah

 Asum:
       mov al,[si]
       add al,sum
       mov sum,al
       inc si
       dec cl
       jnz Asum

 print:
      mov ah,09h         ;sum printing
      lea dx,str1
      int 21h
      mov al,sum
      cbw
      mov bl,0ah
      div bl
      mov reminder,ah
      mov quotient,al
      mov ah,02h
      mov dl,quotient
      add dl,30h
      int 21h
      mov ah,02h
      mov dl,reminder
      add dl,30h
      int 21h

      mov ah,09h        ;avg printing
      lea dx,str2
      int 21h
      mov ah,02h
      mov dl,quotient
      add dl,30h
      int 21h
 exit:
      mov ax,4c00h
      int 21h
 main endp
 end main
