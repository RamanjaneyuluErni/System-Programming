.model small
.stack 64
.data
   msg1 db ' __/"""""\__','$'
   msg2 db '|___________|','$'
   msg3 db '  O      O   ','$'
   count db 00
   col db 00
   row1 db 12
   row2 db 13 
   row3 db 14
.code
main proc far
     mov ax,@data
     mov ds,ax
print:
     mov ax,0600H 
     mov bh,3ah
     mov cx,0000H
     mov dx,184fH
     int 10H   
     
     mov ah,02 
     mov bh,00
     mov dl,col
     mov dh,row1
     int 10H 
     
     mov ah,09 
     lea dx,msg1
     int 21H     
     
     mov ah,02   
     mov bh,00
     mov dl,col
     mov dh,row2
     int 10H   
     
     mov ah,09   
     lea dx,msg2
     int 21H 

     mov ah,02 
     mov bh,00
     mov dl,col
     mov dh,row3
     int 10H 
     
     mov ah,09 
     lea dx,msg3
     int 21H   
     
     inc col
     cmp col,66  
     jne print
    
    mov ax,4c00h
    int 21H
main endp
end main


