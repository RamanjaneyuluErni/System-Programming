;TSR PROGRAM TO ON/OFF A SPEAKER
CODESEG SEGMENT PARA 'Code'
ASSUME CS:CODESEG,DS:CODESEG,SS:CODESEG,ES:CODESEG
ORG 100H
BEGIN:
      JMP PORTION1
SAVE DD ?    ;STORES ADDRESS OF INT 09H
DELAY DW 100H
PORTION2:
         PUSH AX
         PUSH CX
         IN AL,60H   ;GETTING KEYSTROKE FROM PORT
         CMP AL,01  ;CHECKING IF ESC KEY PRESSED OR NOT
         JNZ EXIT
         IN AL,61H
         PUSH AX
         OR AL,3
         OUT 61H,AL
         MOV CX,DELAY
RUN:
         LOOP RUN
         OR AL,2
         MOV CX,512H
RUN1:    LOOP RUN1
         POP AX
         AND AL,11111100B
         OUT 61H,AL
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
     
