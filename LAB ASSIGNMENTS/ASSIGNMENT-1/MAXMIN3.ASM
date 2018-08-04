page 60,132
title minmax (exe) finding min and max of an array
;----------------------------------------------------
.model small
.stack 60
.data
  array db 5,7,3,4,1,9,6,8
  max db 0
  min db 99
  str1 db "max : ",'$'
  str2 db 10,"min : ",'$'
;----------------------------------------------------
.code
  main proc near
       mov ax,@data
       mov ds,ax
       mov cl,08h
       lea si,array
 findmax:
          mov al,[si]
          cmp al,max
          jb findmin
          mov max,al
 findmin:
          cmp al,min
          ja increment
          mov min,al
 increment:
          inc si
          dec cl
          jnz findmax


  print:    
        mov ah,09h    ;printing max msg
        lea dx,str1
        int 21h
        mov ah,02h    ;printing maximum num
        mov dl,max
        add dl,30h
        int 21h
        mov ah,09h    ;printing min msg
        lea dx,str2
        int 21h
        mov ah,02h    ;printing minimum num
        mov dl,min
        add dl,30h
        int 21h
    
    mov ax,4c00h
    int 21h
   main endp
   end main
