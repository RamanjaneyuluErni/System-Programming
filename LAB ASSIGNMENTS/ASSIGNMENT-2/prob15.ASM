;TSR PROGRAM TO CHANGE THE LETTER PRINTED ON THE SCREEN
CODESEG SEGMENT PARA 'Code'
ASSUME CS:CODESEG,DS:CODESEG,SS:CODESEG,ES:CODESEG
ORG 100H
BEGIN:
      JMP PORTION1
SAVE DD ?    ;STORES ADDRESS OF INT 09H
PORTION2:
         PUSH AX
         PUSH CX
         IN AL,60H   ;GETTING KEYSTROKE FROM PORT
         CMP AL,1EH  ;CHECKING IF 'a' KEY PRESSED OR NOT
         JZ BBB
         CMP AL,30H  ;CHECKING IF 'b' KEY PRESSED OR NOT
         JZ CCC
         CMP AL,2EH  ;CHECKING IF 'c' KEY PRESSED OR NOT
         JZ DDD
         JMP EXIT
         BBB:
             MOV DL,42H
             MOV AH,02H
             INT 21H
             JMP DEL
         CCC:
             MOV DL,43H
             MOV AH,02H
             INT 21H
             JMP DEL
         DDD:
             MOV DL,44H
             MOV AH,02H
             INT 21H     
DEL:     MOV CX,0FFFFH
RUN:     LOOP RUN
EXIT:
         POP CX
         POP AX
         JMP CS:SAVE         


PORTION1:
         CLI
         MOV AH,35H
         MOV AL,09H
         INT 21H     
         
         MOV WORD PTR SAVE,BX
         MOV WORD PTR SAVE+2,ES
         
         MOV AH,25H
         MOV AL,09H
         LEA DX,PORTION2
         INT 21H 
         
         MOV AH,31H
         LEA DX,PORTION1
         STI
         INT 21H  
         
CODESEG ENDS
END BEGIN     
     
