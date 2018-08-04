.model small
.stack 64
.data
 char db 65
 char1  db 00
 num db 23
.code
 main proc near
      mov ax,@data
      mov ds,ax
      
      mov cl,23
 loop1: 
      mov ah,02h
      mov dl,char
      int 21h     
      mov al,char
      inc al
      mov char,al
      
      
      
      call newline
      loop loop1 
 
 loop2: 
       mov bh,05h     ;active page setting
       mov al,00h
       int 10h
       
       mov ah,02h       ;setting cursor at starting
       mov bh,00h
       mov cx,0000h
       mov dx,0000h
       int 10h
       
       mov ah,08h        ;copying content
       mov bh,00h
       int 10h
       
       mov char,al
       
       mov ax,0601h       ;scrolling 1 line
       mov bh,07h
       mov cx,0000h
       mov dx,174fh
       int 10h 
       
       mov ah,02h          ;setting cursor at end
       mov bh,00h
       mov cx,0000h
       mov dx,1600h
       int 10h
       
       mov ah,09h         ;dispalying 1 char
       mov al,char
       mov bh,00h
       mov bl,07h
       mov cx,01
       int 10h
        
       mov bl,num
       dec bl
       mov num,bl
       cmp bl,00h
       jne loop2
       
      mov ax,4c00h
      int 21h
      
      
 main endp
 ;--------------------------------
 newline proc near
         mov ah,02h
         mov dl,0ah
         int 21h
      
         mov ah,02h 
         mov dl,0dh
         int 21h
         ret
 newline endp
 end main
      