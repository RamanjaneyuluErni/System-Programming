.model small
.stack
.data 
list label byte
maxlen db 14h
aclen db ?
dat db 21 dup(?)
.code
main proc far 
mov ax,@data 
mov ds,ax

mov ah,0ah
lea dx,list
int 21h 

mov bl,aclen
mov bh,00h 

mov dat[bx],07h
mov dat[bx+1],'$'
shr bl,1

neg bl
add bl,28h


mov ah,02h
mov bh,00h
mov dh,0ch
mov dl,bl
int 10h

mov ah,06h
mov al,00h
mov bh,8bh
mov cx,0000h
mov dx,184fh
int 10h

mov ah,09h
lea dx,dat 
int 21h

mov ax,4c00h
int 21h
 
main endp 
end main
