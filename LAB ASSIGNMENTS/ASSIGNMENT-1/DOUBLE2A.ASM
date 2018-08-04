page 60,132
title double2a (exe) double words addition
;--------------------------------------------
.model small
.stack 60
.data 
    num1a dw 0123
    num1b dw 0132
    num2a dw 0111
    num2b dw 0234
    temp1 dw ?
    temp2 dw ?
    msg db "addition result :",'$'
;--------------------------------------------
.code 
   main proc far 
        mov ax,@data
        mov ds,ax
        clc
        mov ax,num1a
        adc ax,num2a
        
        mov bx,num1b
        adc bx,num2b
        
        mov temp1,ax
        mov temp2,bx
        mov ah,09h
        lea dx,msg
        int 21h
        
        mov ax,temp1
        call print
        
        mov ax,temp2
        call print 
        
   exit:
        mov ax,4c00h
        int 21h
   main endp   
;--------------------------------------------
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