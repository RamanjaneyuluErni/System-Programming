.model small
.stack 64
.data 
 num db 01 
 char dw 00
.code
 main proc far
      mov ax,@data   
      mov ds,ax 

      mov ah,02h
      mov bh,00h
      mov dh,00
      mov dl,01
      int 10h 
      
      call horline 
      
 loop1:
       mov bl,25
       
       mov ah,02h
       mov bh,00h
       mov dh,num
       mov dl,01
       int 10h
 
 loop2: 
       
       mov ah,02h
       mov dx,char
       int 21h
       mov ax,char
       inc ax
       mov char,ax
       mov ax,char
       cmp ax,00ffh
       ja exit
       dec bl
       cmp bl,00
       jne loop2
       
       mov al,num
       inc al
       mov num,al
       mov ax,char
       cmp ax,00ffh
       jb loop1
 exit:    
      mov ax,4c00h
      int 21h
 main endp
 ;-------------------------------------
 newline proc near
         mov ah,02h
         mov dl,0ah
         int 21h
      
         mov ah,02h 
         mov dl,0dh
         int 21h
         ret
 newline endp
 ;-------------------------------------
 horline proc near
         mov cl,25
     hor1:
         mov ah,02h
         mov dx,00c4h
         int 21h
         loop hor1
         
         mov ah,02h
         mov bh,00h
         mov dh,13
         mov dl,01
         int 10h 
         mov cl,25
     hor2:
         mov ah,02h
         mov dx,00c4h
         int 21h
         loop hor2
             
                 
         mov cl,0ch 
    ver1: 
          mov ah,02h
          mov bh,00h
          mov dh,cl
          mov dl,00
          int 10h 
          mov ah,02h
          mov dx,00b3h
          int 21h 
          loop ver1
          
          mov cl,0ch  
    ver2:
          mov ah,02h
          mov bh,00h
          mov dh,cl
          mov dl,26
          int 10h  
          mov ah,02h
          mov dx,00b3h
          int 21h
          loop ver2
          ret  
 horline endp
 end main
       
      