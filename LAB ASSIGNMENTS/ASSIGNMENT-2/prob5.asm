.model small 
.stack 
.data 
msg db "sandy",'$'
num1 db 2
num2 db 14
.code 
main proc far 
mov ax,@data 
mov ds,ax



outer:
mov ah,06h
mov bh,3ah
mov al,00h
mov cx,0414h
mov dx,113ch
int 10h
mov dh,04h
mov bl,14
inner:

mov ah,86h
mov cx,0005h 
int 15h


mov ah,02h
mov bh,00h
mov dl,20
int 10h

call print

inc dh 
dec bl 
jnz inner
dec num1 
jnz outer 

mov ax,4c00h
int 21h

main endp 

print proc near 
pusha
mov ah,09h
lea dx,msg
int 21h
popa 
ret 
print endp

end main 
