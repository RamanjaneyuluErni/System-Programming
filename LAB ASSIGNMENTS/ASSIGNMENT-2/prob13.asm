TITLE Q13(EXE) menu bar
;-----------------------------------------------
.MODEL SMALL
.STACK 64
;------------------------------------------------
.DATA
ROW DB 4
COL DB 25
KEY DB ?
MENU DB 0DAH,25 DUP('-'),0BFH
     DB '|','    ADD RECORDS          ','|'
     DB '|','    DELETE RECORDS       ','|'
     DB '|','    ENTER RECORDS        ','|'
     DB '|','    PRINT REPORTS        ','|'
     DB '|','    UPDATE ACCOUNTS      ','|'
     DB '|','    VIEW RECORDS         ','|'
     DB 0C0H,25 DUP('-'),0D9H
;------------------------------------------------------
.CODE
MAIN PROC FAR
    MOV AX,@data
    MOV DS,AX
    MOV ES,AX

    CALL CLEARSCREEN
    CALL DISPLAYMENU
    MOV AX,00
    MOV DX,00
    MOV CX,00
    MOV BX,00
    CALL MOVEMENT
EXIT:
    MOV AX,4C00H
    INT 21H
MAIN ENDP
;----------------------------------------------------------
CLEARSCREEN PROC NEAR
    MOV AX,0600H
    MOV BH,21H
    MOV CX,0000H
    MOV DX,184FH
    INT 10H
    RET
CLEARSCREEN ENDP
;--------------------------------------------------------------
MOVEMENT PROC NEAR
    MOV AX,00
    LEA BP,MENU
    ADD BP,54
    MOV BH,00
    MOV ROW,6
    MOV COL,25
LOOP3:
    MOV AH,10H
    int 16h
    CMP AL,13
    JE PASSBY
    JMP CONT
PASSBY: JMP RETU
CONT:
    MOV KEY,AH
    MOV AH,13H
    MOV AL,01H
    MOV BH,00H
    MOV BL,71H
    MOV DH,ROW
    MOV DL,COL
    MOV CX, 27
    INT 10H
    CMP KEY,48H
    JE UP 
    CMP KEY,50H
    JE DOWN
    JNE LOOP3

UP:
    DEC ROW
    MOV COL,25
    CMP ROW,4
    JE ADJUST1
    JMP XXX1
    ADJUST1:
    MOV ROW,10
    ADD BP,135
    JMP YYY1
    XXX1:
    SUB BP,27
    YYY1:
    MOV BL,17H
    MOV DH,ROW
    MOV DL,COL
    INT 10H
    JMP LOOP3

DOWN:
    INC ROW
    MOV COL,25
    CMP ROW,11
    JE ADJUST2
    JMP XXX2
    ADJUST2:
    MOV ROW,5
    SUB BP,135
    JMP YYY2
    XXX2:
    ADD BP,27
    YYY2:
    MOV BL,17H
    MOV DH,ROW
    MOV DL,COL
    INT 10H

    JMP LOOP3
RETU:
    RET
MOVEMENT ENDP
;-----------------------------------------------------
DISPLAYMENU PROC NEAR
    MOV AH,13H
    MOV AL,01H
    MOV BH,00H
    MOV BL,71H
    LEA BP,MENU
    MOV CX,27
    MOV DH,ROW
    MOV DL,COL
LOOP1:
      INT 10H
      ADD BP,27
      INC DH
      CMP DH,12
      JNZ LOOP1
    RET
DISPLAYMENU ENDP
;----------------------------------------------------
END MAIN
