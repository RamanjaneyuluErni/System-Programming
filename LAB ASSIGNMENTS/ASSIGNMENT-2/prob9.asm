.model small 
.stack 64
.data 
num1 db 'sandy'
num2 dw 0b800h
.code 
main proc far
mov ax,@data
mov ds,ax
 
mov ax,num2
mov es,ax

lea si,num1 
mov di,2000

mov cx,05h
print:
mov al,[si]
mov es:[di],al
inc di
inc di
inc si
dec cx
jnz print

mov ax,4c00h
int 21h

main endp 
end main

 