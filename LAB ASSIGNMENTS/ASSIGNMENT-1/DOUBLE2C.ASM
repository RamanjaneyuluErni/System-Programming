page 60,132
title double2a (exe) double words multiplicatio(1b 1a * 2b 2a)
;--------------------------------------------
.model small
.stack 60
.data 
    num1a dw 0011h
    num1b dw 0012h
    num2a dw 0004h
    num2b dw 0011h
    p1 dw ?
    p2 dw ?
    p3 dw ?
    p4 dw ?
    msg db "multiplication result :",'$'
;--------------------------------------------
.code 
   main proc far 
        mov ax,@data
        mov ds,ax
        clc
        mov ax,num1a
        mul num2a 
        mov p2,dx
        mov p1,ax
        
        mov ax,num1b
        mul num2a
         
        clc
        adc ax,p2
        mov p2,ax
        mov p3,dx
        
        clc
        mov ax,num1a
        mul num2b
        mov bx,ax
        mov cx,dx
        
        mov ax,num1b
        mul num2b
        add cx,ax
        
        adc bx,p2
        mov p2,bx
        
        adc cx,p3
        mov p3,bx
        
        adc dx,p4
        mov p4,dx
        
        mov ah,09h
        lea dx,msg
        int 21h
        
        mov ax,p4
        call print
        
        mov ax,p3
        call print 
        
        mov ax,p2
        call print
        
        mov ax,p1
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