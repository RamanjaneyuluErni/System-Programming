TITLE   Q12(exe) rotate the car
;---------------------------------------
.MODEL  SMALL
.STACK 64
.DATA
r1 dw ?
r2 dw ?
c1 dw ?
c2 dw ?
tr1 dw ?
tr2 dw ?
tc1 dw ?
tc2 dw ?
;----------------------------------------
.CODE
MAIN    PROC    FAR
    MOV AX,@DATA
    MOV DS,AX
    MOV ES,AX
    
    CALL    CLRSCREEN
    MOV AH,00H
    MOV AL,13H
    INT 10H

    
    
    MOV R1,80
    MOV C1,0
    
move:
    CALL CLRSCREEN

    CALL PRINTCAR
    
    CALL PRINTWHEEL
    
    
    MOV CX,25000
w2: LOOP w2
    INC C1
    CMP C1,320
    MOV CX,25000
w3: LOOP w3
    JNE move
    MOV C1,0
    JMP move
    
    MOV AH,01H
    INT 21H

    MOV AX,4C00H
    INT 21H
                
MAIN ENDP 
;----------------------------------------------------
PRINTCAR    PROC    NEAR


    MOV TR1,100
    MOV TR2,100             ;ROAD
    MOV TC1,0
    MOV TC2,320
    CALL    HORIZONTAL

    MOV AX,R1
    MOV TR1,AX
    MOV AX,R1
    MOV TR2,AX
    MOV AX,C1                   ;TOP FLAT
    ADD AX,5
    MOV TC1,AX
    MOV AX,C1
    ADD AX,25
    MOV TC2,AX
    CALL    HORIZONTAL
    
    MOV AX,R1
    ADD AX,5
    MOV TR1,AX
    MOV AX,R1
    ADD AX,16
    MOV TR2,AX                          ;LEFT DOWN LINE
    MOV AX,C1
    MOV TC1,AX
    MOV AX,C1
    MOV TC2,AX
    CALL    VERTICAL
    
    MOV AX,R1
    ADD AX,5
    MOV TR1,AX
    MOV TR2,AX
    MOV AX,C1
    MOV TC1,AX                          ;BOTTOM LINE
    MOV AX,C1
    ADD AX,5
    MOV TC2,AX
    CALL    HORIZONTAL
    
    MOV AX,R1
    MOV TR1,AX
    MOV AX,R1
    ADD AX,6                            ;LEFT UP LINE
    MOV TR2,AX
    MOV AX,C1
    ADD AX,5
    MOV TC1,AX
    MOV TC2,AX
    CALL    VERTICAL
    
    MOV AX,R1
    ADD AX,15
    MOV TR1,AX
    MOV TR2,AX                          ;BOTTOM LINE
    MOV AX,C1
    MOV TC1,AX
    MOV AX,C1
    ADD AX,40
    MOV TC2,AX
    CALL    HORIZONTAL
    
    MOV AX,R1
    ADD AX,5
    MOV TR1,AX
    MOV AX,R1
    ADD AX,16
    MOV TR2,AX                      ;RIGHT BOTTOM LINE
    MOV AX,C1
    ADD AX,40
    MOV TC1,AX
    MOV TC2,AX
    CALL    VERTICAL
    
    MOV AX,R1
    ADD AX,5
    MOV TR1,AX
    MOV TR2,AX
    MOV AX,C1                       ;RIGHT MIDDLE LINE
    ADD AX,30
    MOV TC1,AX
    MOV AX,C1
    ADD AX,40
    MOV TC2,AX
    CALL    HORIZONTAL
    
    MOV AX,R1
    MOV TR1,AX
    ADD AX,5
    MOV TR2,AX
    MOV AX,C1                       ;RIGHT SLANT LINE
    ADD AX,25
    MOV TC1,AX
    MOV AX,C1
    ADD AX,30
    MOV TC2,AX
    CALL    OBLIQUE
    
    RET
    
    PRINTCAR    ENDP
;----------------------------------------------------   
CLRSCREEN PROC NEAR
    
    MOV AH,06H
    MOV AL,00H
    MOV BH,71H
    MOV CX,0000
    MOV DX,184FH
    INT 10H
    RET  
CLRSCREEN ENDP
;----------------------------------------------------   
PRINTWHEEL PROC NEAR

    MOV AX,R1
    ADD AX,15
    MOV TR1,AX
    MOV AX,R1
    ADD AX,20
    MOV TR2,AX                      ;BACK WHEEL
    MOV AX,C1
    ADD AX,5
    MOV TC1,AX
    MOV TC2,AX
    CALL    VERTICAL
    
    MOV AX,R1
    ADD AX,15
    MOV TR1,AX
    MOV AX,R1
    ADD AX,20
    MOV TR2,AX                      
    MOV AX,C1
    ADD AX,13
    MOV TC1,AX
    MOV TC2,AX
    CALL    VERTICAL
    
    MOV AX,R1
    ADD AX,15
    MOV TR1,AX
    MOV TR2,AX
    MOV AX,C1                       
    ADD AX,5
    MOV TC1,AX
    MOV AX,C1
    ADD AX,13
    MOV TC2,AX
    CALL    HORIZONTAL
    
    MOV AX,R1
    ADD AX,20
    MOV TR1,AX
    MOV TR2,AX
    MOV AX,C1                       
    ADD AX,5                        ;BACK WHEEL END
    MOV TC1,AX
    MOV AX,C1
    ADD AX,13
    MOV TC2,AX
    CALL    HORIZONTAL
    
    MOV AX,R1
    ADD AX,15
    MOV TR1,AX
    MOV AX,R1
    ADD AX,20
    MOV TR2,AX                      
    MOV AX,C1                       ;FRONT WHEEL START
    ADD AX,25
    MOV TC1,AX
    MOV TC2,AX
    CALL    VERTICAL
    
    MOV AX,R1
    ADD AX,15
    MOV TR1,AX
    MOV AX,R1
    ADD AX,20
    MOV TR2,AX                      
    MOV AX,C1
    ADD AX,33
    MOV TC1,AX
    MOV TC2,AX
    CALL    VERTICAL
    
    MOV AX,R1
    ADD AX,15
    MOV TR1,AX
    MOV TR2,AX
    MOV AX,C1                       
    ADD AX,25
    MOV TC1,AX
    MOV AX,C1
    ADD AX,33
    MOV TC2,AX
    CALL    HORIZONTAL
    
    MOV AX,R1
    ADD AX,20
    MOV TR1,AX
    MOV TR2,AX
    MOV AX,C1                       
    ADD AX,25
    MOV TC1,AX
    MOV AX,C1
    ADD AX,33
    MOV TC2,AX
    CALL    HORIZONTAL
    
    MOV AX,C1
    MOV BH,3
    DIV BH
    CMP AH,00
    JE  vert
    CMP AH,01
    JE  hori
    CMP AH,02H
    JE  slt

vert:
    MOV AX,R1
    ADD AX,15
    MOV TR1,AX
    MOV AX,R1
    ADD AX,20
    MOV TR2,AX                      
    MOV AX,C1
    ADD AX,8
    MOV TC1,AX
    MOV TC2,AX
    CALL    VERTICAL
    MOV AX,R1
    ADD AX,15
    MOV TR1,AX
    ADD TC1,20
    ADD TC2,20
    CALL    VERTICAL
    RET
    
hori:

    MOV AX,R1
    ADD AX,18
    MOV TR1,AX
    MOV TR2,AX
    MOV AX,C1                       
    ADD AX,5
    MOV TC1,AX
    MOV AX,C1
    ADD AX,13
    MOV TC2,AX
    CALL    HORIZONTAL
    MOV AX,C1                       
    ADD AX,5
    MOV TC1,AX
    ADD TC1,20
    ADD TC2,20
    CALL    HORIZONTAL

    RET
slt:

    MOV AX,R1
    ADD AX,16
    MOV TR1,AX
    MOV AX,R1
    ADD AX,19
    MOV TR2,AX
    MOV AX,C1                     
    ADD AX,6
    MOV TC1,AX
    MOV AX,C1
    ADD AX,9
    MOV TC2,AX
    CALL    OBLIQUE 
    MOV AX,R1
    ADD AX,16
    MOV TR1,AX
    MOV AX,C1                     
    ADD AX,6
    MOV TC1,AX
    ADD TC1,20
    ADD TC2,20
    CALL    OBLIQUE     

    RET  
PRINTWHEEL ENDP
;------------------------------------------------------
SETCURSOR PROC NEAR
    MOV AH,02H
    MOV BH,00
    INT 10H
RET
SETCURSOR ENDP 
;------------------------------------------------------   
HORIZONTAL PROC NEAR
    L1:
        MOV AH,0CH
        MOV BH,00
        MOV AL,0FH
        MOV DX,TR1
        MOV CX,TC1
        INT 10H
        INC TC1
        MOV BX,TC2
        CMP TC1,BX
        JNE L1
    
        RET
     
HORIZONTAL ENDP
;---------------------------------------------------
VERTICAL PROC NEAR   
    L2:
        MOV AH,0CH
        MOV BH,00
        MOV AL,0FH
        MOV DX,TR1
        MOV CX,TC1
        INT 10H
        INC TR1
        MOV BX,TR2
        CMP TR1,BX
        JNE L2
    
        RET
VERTICAL ENDP  
;---------------------------------------------------
OBLIQUE PROC NEAR                                                          
    L3:
        MOV AH,0CH
        MOV BH,00
        MOV AL,0FH
        MOV DX,TR1
        MOV CX,TC1
        INT 10H
        INC TR1
        INC TC1
        MOV BX,TR2
        CMP TR1,BX
        JNE L3
        
        RET
OBLIQUE ENDP
;----------------------------------------------------
END MAIN
