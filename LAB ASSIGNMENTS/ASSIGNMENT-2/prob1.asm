.model small
.stack 64
.data  
  str db 'saikumar','$'  
  len db 25
  bre db 73
.code 
 main proc near
      mov ax,@data
      mov ds,ax 
      
      mov bl,00h
 scrollR:
      mov ah,06h
      mov bh,07h   
      mov al,00h
      mov cx,0000h
      mov dx,184fh
      int 10h  
      
      mov ah,02h
      mov bh,00h 
      mov dh,00
      mov dl,bl
      int 10h
      
      mov ah,09h
      lea dx,str
      int 21h 
      
      inc bl
      cmp bl,bre
      jb scrollR 
      
      dec bl 
 scrollL:
      mov ah,06h
      mov bh,07h
      mov al,00h
      mov cx,0000h
      mov dx,184fh
      int 10h  
      
      mov ah,02h
      mov bh,00h 
      mov dh,00
      mov dl,bl
      int 10h
      
      mov ah,09h
      lea dx,str
      int 21h 
      
      dec bl
      cmp bl,00h
      jne scrollL
      
      mov bl,00h
 scrollD:
      mov ah,06h
      mov bh,07h
      mov al,00h
      mov cx,0000h
      mov dx,184fh
      int 10h  
      
      mov ah,02h
      mov bh,00h 
      mov dh,bl
      mov dl,00
      int 10h
      
      mov ah,09h
      lea dx,str
      int 21h 
      
      inc bl
      cmp bl,len
      jne scrollD
      
      dec bl
 scrollU:
      mov ah,06h
      mov bh,07h
      mov al,00h
      mov cx,0000h
      mov dx,184fh
      int 10h  
      
      mov ah,02h
      mov bh,00h 
      mov dh,bl
      mov dl,00
      int 10h
      
      mov ah,09h
      lea dx,str
      int 21h 
      
      dec bl
      jnz scrollU
     
 exit:
      mov ax,4c00h
      int 21h 
      
 main endp
 end main