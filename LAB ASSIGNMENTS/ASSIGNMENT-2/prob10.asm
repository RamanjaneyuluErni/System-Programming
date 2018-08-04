.model small 
.stack 64
.data
 att db 00
 char db 'saikumar','$' 
.code
main proc far
     mov ax,@data
     mov ds,ax
     
     mov ah,00h
     mov al,13h
     int 10h
     
     mov cx,100
     mov dx,10
     call drawsquare 
     
     mov cx,110
     mov dx,20
     call drawsquare
      
     mov cx,100
     mov dx,10
     call drawline
     
     mov cx,150
     mov dx,10
     call drawline
     
     mov cx,100
     mov dx,60
     call drawline
     
     mov cx,150
     mov dx,60
     call drawline
     
      
exit:            
     mov ax,4c00h
     int 21h 
main endp
;----------------------------------  
 drawsquare proc near
            mov bl,50
 loop1:          
     mov ah,0ch 
     mov al,09h
     mov bh,00h
     int 10h
     inc cx 
     dec bl
     cmp bl,00
     jne loop1
 
     mov bl,50
 loop2:          
     mov ah,0ch 
     mov al,09h
     mov bh,00h
     int 10h
     inc dx 
     dec bl
     cmp bl,00
     jne loop2
 
     mov bl,50
 loop3:          
     mov ah,0ch 
     mov al,09h
     mov bh,00h
     int 10h
     dec cx 
     dec bl
     cmp bl,00
     jne loop3
     
     mov bl,50
 loop4:          
     mov ah,0ch 
     mov al,09h
     mov bh,00h
     int 10h
     dec dx 
     dec bl
     cmp bl,00
     jne loop4
     ret
 drawsquare endp 
 ;-----------------------
 drawline proc near
          mov bl,10
  line1:
       mov ah,0ch
       mov al,09h
       mov bh,00h
       int 10h
       inc cx
       inc dx 
       dec bl
       cmp bl,00
       jne line1
       ret
 drawline endp
 ;----------------------------
 end main