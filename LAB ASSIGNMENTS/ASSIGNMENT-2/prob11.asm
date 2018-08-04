.model small 
.stack 64
.data 
 height db 00
.code
main proc far
     mov ax,@data
     mov ds,ax
     
     mov ah,00h
     mov al,13h
     int 10h              
                        ;first quad
     mov bl,100
     mov height,bl
     mov cx,10
     mov dx,10
     call drawsquare 
     
     mov cx,20
     mov dx,20
     call drawsquare
     
     mov cx,10
     mov dx,10
     call drawline
     
     mov cx,40
     mov dx,10
     call drawline
     
     mov cx,10
     mov dx,110
     call drawline
     
     mov cx,40
     mov dx,110
     call drawline
     
          
                      ;second quad
     mov bl,60
     mov height,bl
     mov cx,60
     mov dx,50
     call drawsquare 
     
     mov cx,70
     mov dx,60
     call drawsquare
      
     mov cx,60
     mov dx,50
     call drawline
     
     mov cx,90
     mov dx,50
     call drawline
     
     mov cx,60
     mov dx,110
     call drawline
     
     mov cx,90
     mov dx,110
     call drawline                
                        
                       ;third quad
     
     mov bl,30
     mov height,bl
     mov cx,110
     mov dx,80
     call drawsquare 
     
     mov cx,120
     mov dx,90
     call drawsquare
      
     mov cx,110
     mov dx,80
     call drawline
     
     mov cx,140
     mov dx,80
     call drawline
     
     mov cx,110
     mov dx,110
     call drawline
     
     mov cx,140
     mov dx,110
     call drawline
      
     
     mov bx,700 
     mov cx,00
     mov dx,120
loop5:          
     mov ah,0ch 
     mov al,09h
     mov bh,00h
     int 10h
     inc cx 
     dec bx
     cmp bx,00
     jne loop5  
      
exit:            
     mov ax,4c00h
     int 21h 
main endp
;----------------------------------  
 drawsquare proc near
            mov bl,30     
 loop1:          
     mov ah,0ch 
     mov al,09h
     mov bh,00h
     int 10h
     inc cx 
     dec bl
     cmp bl,00
     jne loop1
 
     mov bl,height
 loop2:          
     mov ah,0ch 
     mov al,09h
     mov bh,00h
     int 10h
     inc dx 
     dec bl
     cmp bl,00
     jne loop2
 
     mov bl,30
 loop3:          
     mov ah,0ch 
     mov al,09h
     mov bh,00h
     int 10h
     dec cx 
     dec bl
     cmp bl,00
     jne loop3
     
     mov bl,height
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