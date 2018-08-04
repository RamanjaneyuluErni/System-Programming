page 60,132
title wordmul2c (exe) word by word multiplication
;---------------------------------------------
.model small
.stack 60
.data
  num1 dw 0534
  num2 dw 0002
  temp1 dw ?
  temp2 dw ?
  msg db "multiplication result is ",'$'
;---------------------------------------------
.code
   main proc far
        mov ax,@data
        mov ds,ax
        
        mov ax,0000h
        mov dx,0000h
        mov ax,num1
        mul num2
        
        mov temp1,dx
        mov temp2,ax
        
        mov ah,09h
        lea dx,msg
        int 21h
        
        mov ax,temp2
        call print
  exit:
        mov ax,4c00h
        int 21h
    main endp
;----------------------------------------------
 print proc near
        mov dx,00h
        
        mov bl,0ah
        mov cl,00h
  A20:
        div bl
        mov dh,00h
        mov dl,ah
        push dx
        cbw
        inc cl
        cmp ax,00h
        jne A20
        
        
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