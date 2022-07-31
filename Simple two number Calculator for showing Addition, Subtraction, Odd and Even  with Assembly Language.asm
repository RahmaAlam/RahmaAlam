.MODEL SMALL
.STACK 100H
.DATA

NUM1 DW 'ENTER 1ST NUMBER: $' 10,13 
NUM2 DW 'ENTER 2ND NUMBER: $' 10,13
SUM DW 'RESULT OF ADDITION: $' 10,13
DIFF DW 'RESULT OF SUBTRACTION: $' 10,13

STR DW 10, 13, 'THIS NUMBER IS $'

VAR1 DW 'EVEN$'
VAR2 DW 'ODD$'

M1 DW 10, 13, 'THE 1ST NUMBER IS LARGER THAN 2ND NUMBER $'
M2 DW 10,13, 'THE 1ST NUMBER IS LESSER THAN 2ND NUMBER $'
M3 DW 10,13, 'BOTH NUMBERS ARE EQUAL $'


VAL1 DB '?'
VAL2 DB '?'


.CODE
MAIN PROC
  
  MOV AX, @DATA
  MOV DS, AX
  
  LEA DX, NUM1
  MOV AH, 9
  INT 21H
  
  MOV AH, 1
  
  INT 21H
  
  MOV BL, AL
  
  LEA DX, STR
  MOV AH, 9
  INT 21H 
  
  TEST BL, 01H
     
  JNE @ODD
    
  MOV AH, 2
  LEA DX, VAR1
  MOV AH, 9
  INT 21H
  
  JMP @EXIT
  
  @ODD:
  
  MOV AH, 2
  LEA DX, VAR2
  MOV AH, 9
  INT 21H
  
  @EXIT:
  
             
  SUB BL, 30H
  MOV VAL1, BL         
           
           
  MOV AH, 2
  MOV DL, 0DH 
  INT 21H
  
  MOV DL, 0AH             
  INT 21H
  

  LEA DX, NUM2
  MOV AH, 9
  INT 21H
  
  MOV AH, 1
  INT 21H
  
  MOV BL, AL
  
  LEA DX, STR
  MOV AH, 9
  INT 21H 
  
  TEST BL, 01H
     
  JNE @ODD1
    
  MOV AH, 2
  LEA DX, VAR1
  MOV AH, 9
  INT 21H
  
  JMP @EXIT1
  
  @ODD1:
  
  MOV AH, 2
  LEA DX, VAR2
  MOV AH, 9 
  INT 21H
  
  @EXIT1:
           
  SUB BL, 30H
  MOV VAL2, BL         
           
           
  MOV AH, 2
  MOV DL, 0DH 
  INT 21H
  
  MOV DL, 0AH             
  INT 21H
  
  LEA DX, SUM
  MOV AH, 9
  INT 21H
  
  MOV AL, VAL1
  ADD AL, VAL2
  
  ADD AL, 30H
  
  MOV AH, 2                   
  MOV DL, AL    
  INT 21H
  
  MOV DL, 0DH 
  INT 21H
  
  MOV DL, 0AH             
  INT 21H 
  
  LEA DX, DIFF
  MOV AH, 9
  INT 21H
  
  MOV AL, VAL1
  SUB AL, VAL2
  
  ADD AL, 30H
  
  MOV AH, 2                   
  MOV DL, AL    
  INT 21H
  
  MOV DL, 0DH 
  INT 21H
  
  MOV DL, 0AH             
  INT 21H
  
  MOV AL, VAL1
  MOV BL, AL
  INT 21H
  
  MOV AL, VAL2
  MOV CL, AL
  INT 21H
  
  CMP BL, CL
  
  JE @EQUAL
  
  JLE @LESS
  
  LEA DX, M1
  MOV AH, 9
  INT 21H
  
  JMP @DONE
  
  @LESS:
  
  LEA DX, M2
  MOV AH, 9
  INT 21H
  
  JMP @DONE
  
  @EQUAL:
  
  LEA DX, M3
  MOV AH, 9
  INT 21H
  
  @DONE:
     
    
  MOV AH, 4CH
  INT 21H
  
  MAIN ENDP
END MAIN
  
  
  
  