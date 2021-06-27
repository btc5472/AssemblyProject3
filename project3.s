;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Brandon Cobb																								 ;
; April 26, 2018																							 ;
; Computer Architecture																						 ;
;																											 ;
; This program starts at 1000 and subtracts the number from 1000 that corresponds to each blue button. The   ;
; two black buttons reset the system at any time. I forced reset is required if the number reaches 0. 		 ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

ResetSystem:
mov r0,#0
swi 0x200										; reset 8-segment display
swi 0x206										; clear screen
mov r3,#1000									; r3 is the number value
mov r0,#0
mov r1,#0
mov r2,r3
swi 0x205										; display 1000 on LCD

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; CHECK BUTTON PRESS LOOP ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
IssaLOOP:

;Was a black button pressed?
ForcedResetLOOP:
swi 0x202
cmp r0,#0
beq NoBlackButtonPressed						; dont reset system if black button wasnt pressed
cmp r0,#1
beq ResetSystem
cmp r0,#2
beq ResetSystem
cmp r0,#3
beq ResetSystem
NoBlackButtonPressed:
;Wait for black button press if #>1000 or #==0
cmp r3,#0
beq ForcedResetLOOP
cmp r3,#1000
bhi ForcedResetLOOP

;Was a blue button pressed?
swi 0x203
cmp r0,#0
beq BlueButtonNotPressed						; blue button was not pressed, proceed to validate r3
;Blue button was pressed, which one?
cmp r0,#1
beq Pressed0.0
cmp r0,#2
beq Pressed0.1
cmp r0,#4
beq Pressed0.2
cmp r0,#8
beq Pressed0.3
cmp r0,#16
beq Pressed1.0
cmp r0,#32
beq Pressed1.1
cmp r0,#64
beq Pressed1.2
cmp r0,#128
beq Pressed1.3
cmp r0,#256
beq Pressed2.0
cmp r0,#512
beq Pressed2.1
cmp r0,#1024
beq Pressed2.2
cmp r0,#2048
beq Pressed2.3
cmp r0,#4096
beq Pressed3.0
cmp r0,#8192
beq Pressed3.1
cmp r0,#16384
beq Pressed3.2
cmp r0,#32768
beq Pressed3.3

;Specific cases where each blue button is pressed
Pressed0.0:
mov r0,#ZERO 
swi 0x200										; Display "0" on 8-segment display
swi 0x206										; clear screen
sub r3,r3,#0									; subtract the number corresponding to the button pressed, from r3 value
mov r0,#0
mov r1,#0
mov r2,r3
swi 0x205										; display r3 on LCD
mov r0,#0
mov r1,#2
ldr r2,=String
swi 0x204										; display sting on LCD
mov r0,#23
mov r1,#2
ldr r2,=HexString0
swi 0x204										; display sting on LCD
bal ButtonActionDone							; jump down and restart loop
Pressed0.1:
mov r0,#ONE
swi 0x200
swi 0x206
sub r3,r3,#1
mov r0,#0
mov r1,#0
mov r2,r3
swi 0x205
mov r0,#0
mov r1,#2
ldr r2,=String
swi 0x204
mov r0,#23
mov r1,#2
ldr r2,=HexString1
swi 0x204
bal ButtonActionDone
Pressed0.2:
mov r0,#TWO 
swi 0x200
swi 0x206
sub r3,r3,#2
mov r0,#0
mov r1,#0
mov r2,r3
swi 0x205
mov r0,#0
mov r1,#2
ldr r2,=String
swi 0x204
mov r0,#23
mov r1,#2
ldr r2,=HexString2
swi 0x204
bal ButtonActionDone
Pressed0.3:
mov r0,#THREE 
swi 0x200
swi 0x206
sub r3,r3,#3
mov r0,#0
mov r1,#0
mov r2,r3
swi 0x205
mov r0,#0
mov r1,#2
ldr r2,=String
swi 0x204
mov r0,#23
mov r1,#2
ldr r2,=HexString3
swi 0x204
bal ButtonActionDone
Pressed1.0:
mov r0,#FOUR 
swi 0x200
swi 0x206
sub r3,r3,#4
mov r0,#0
mov r1,#0
mov r2,r3
swi 0x205
mov r0,#0
mov r1,#2
ldr r2,=String
swi 0x204
mov r0,#23
mov r1,#2
ldr r2,=HexString4
swi 0x204
bal ButtonActionDone
Pressed1.1:
mov r0,#FIVE 
swi 0x200
swi 0x206
sub r3,r3,#5
mov r0,#0
mov r1,#0
mov r2,r3
swi 0x205
mov r0,#0
mov r1,#2
ldr r2,=String
swi 0x204
mov r0,#23
mov r1,#2
ldr r2,=HexString5
swi 0x204
bal ButtonActionDone
Pressed1.2:
mov r0,#SIX 
swi 0x200
swi 0x206
sub r3,r3,#6
mov r0,#0
mov r1,#0
mov r2,r3
swi 0x205
mov r0,#0
mov r1,#2
ldr r2,=String
swi 0x204
mov r0,#23
mov r1,#2
ldr r2,=HexString6
swi 0x204
bal ButtonActionDone
Pressed1.3:
mov r0,#SEVEN 
swi 0x200
swi 0x206
sub r3,r3,#7
mov r0,#0
mov r1,#0
mov r2,r3
swi 0x205
mov r0,#0
mov r1,#2
ldr r2,=String
swi 0x204
mov r0,#23
mov r1,#2
ldr r2,=HexString7
swi 0x204
bal ButtonActionDone
Pressed2.0:
mov r0,#EIGHT 
swi 0x200
swi 0x206
sub r3,r3,#8
mov r0,#0
mov r1,#0
mov r2,r3
swi 0x205
mov r0,#0
mov r1,#2
ldr r2,=String
swi 0x204
mov r0,#23
mov r1,#2
ldr r2,=HexString8
swi 0x204
bal ButtonActionDone
Pressed2.1:
mov r0,#NINE 
swi 0x200
swi 0x206
sub r3,r3,#9
mov r0,#0
mov r1,#0
mov r2,r3
swi 0x205
mov r0,#0
mov r1,#2
ldr r2,=String
swi 0x204
mov r0,#23
mov r1,#2
ldr r2,=HexString9
swi 0x204
bal ButtonActionDone
Pressed2.2:
mov r0,#A 
swi 0x200
swi 0x206
sub r3,r3,#10
mov r0,#0
mov r1,#0
mov r2,r3
swi 0x205
mov r0,#0
mov r1,#2
ldr r2,=String
swi 0x204
mov r0,#23
mov r1,#2
ldr r2,=HexStringA
swi 0x204
bal ButtonActionDone
Pressed2.3:
mov r0,#B 
swi 0x200
swi 0x206
sub r3,r3,#11
mov r0,#0
mov r1,#0
mov r2,r3
swi 0x205
mov r0,#0
mov r1,#2
ldr r2,=String
swi 0x204
mov r0,#23
mov r1,#2
ldr r2,=HexStringB
swi 0x204
bal ButtonActionDone
Pressed3.0:
mov r0,#C 
swi 0x200
swi 0x206
sub r3,r3,#12
mov r0,#0
mov r1,#0
mov r2,r3
swi 0x205
mov r0,#0
mov r1,#2
ldr r2,=String
swi 0x204
mov r0,#23
mov r1,#2
ldr r2,=HexStringC
swi 0x204
bal ButtonActionDone
Pressed3.1:
mov r0,#D 
swi 0x200
swi 0x206
sub r3,r3,#13
mov r0,#0
mov r1,#0
mov r2,r3
swi 0x205
mov r0,#0
mov r1,#2
ldr r2,=String
swi 0x204
mov r0,#23
mov r1,#2
ldr r2,=HexStringD
swi 0x204
bal ButtonActionDone
Pressed3.2:
mov r0,#E 
swi 0x200
swi 0x206
sub r3,r3,#14
mov r0,#0
mov r1,#0
mov r2,r3
swi 0x205
mov r0,#0
mov r1,#2
ldr r2,=String
swi 0x204
mov r0,#23
mov r1,#2
ldr r2,=HexStringE
swi 0x204
bal ButtonActionDone
Pressed3.3:
mov r0,#F 
swi 0x200
swi 0x206
sub r3,r3,#15
mov r0,#0
mov r1,#0
mov r2,r3
swi 0x205
mov r0,#0
mov r1,#2
ldr r2,=String
swi 0x204
mov r0,#23
mov r1,#2
ldr r2,=HexStringF
swi 0x204
ButtonActionDone:
BlueButtonNotPressed:							; blue button was not pressed, proceed to validate r3
; Validate r3
cmp r3,#1000									; if r3==0 or r3>1000 then halt execution until system is reset
bhi IsZero										; IsZero means r3 is not a valid number (has reached zero)
cmp r3,#0
beq IsZero
bal NotZeroYet									; r3 is valid, restart loop (wait for input)
IsZero:
; Enter ForcedResetLOOP
mov r0,#2
swi 0x208										; clear LCD line that contains strings
mov r0,#0
mov r1,#2
ldr r2,=ResetString
swi 0x204										; display ResetString
bal ForcedResetLOOP
NotZeroYet:										; r3 is valid, restart loop (wait for input)

bal IssaLOOP									; Restart IssaLOOP
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

swi 0x11										; unreachable statement, failsafe

; 8- BIT DISPLAY SEGMENTS
.equ SEG_A,0x80
.equ SEG_B,0x40
.equ SEG_C,0x20
.equ SEG_D,0x08
.equ SEG_E,0x04
.equ SEG_F,0x02
.equ SEG_G,0x01
.equ SEG_P,0x10

; DIGITS
.equ ZERO,	SEG_A|SEG_B|SEG_C|SEG_D|SEG_E|SEG_G
.equ ONE,	SEG_B|SEG_C
.equ TWO,	SEG_A|SEG_B|SEG_F|SEG_E|SEG_D
.equ THREE,	SEG_A|SEG_B|SEG_C|SEG_D|SEG_F
.equ FOUR,	SEG_B|SEG_C|SEG_G|SEG_F
.equ FIVE,	SEG_A|SEG_C|SEG_D|SEG_G|SEG_F
.equ SIX,	SEG_A|SEG_C|SEG_D|SEG_E|SEG_F|SEG_G
.equ SEVEN,	SEG_A|SEG_B|SEG_C
.equ EIGHT,	SEG_A|SEG_B|SEG_C|SEG_D|SEG_E|SEG_F|SEG_G
.equ NINE,	SEG_A|SEG_B|SEG_C|SEG_D|SEG_F|SEG_G
.equ A,		SEG_A|SEG_B|SEG_C|SEG_E|SEG_F|SEG_G
.equ B,		SEG_C|SEG_D|SEG_E|SEG_F|SEG_G
.equ C,		SEG_A|SEG_D|SEG_E|SEG_G
.equ D,		SEG_B|SEG_C|SEG_D|SEG_E|SEG_F
.equ E,		SEG_A|SEG_D|SEG_E|SEG_F|SEG_G
.equ F,		SEG_A|SEG_E|SEG_F|SEG_G

; STRINGS
ResetString: .asciz "Number reached 0, press black to reset"
String: .asciz "The button pressed was: "
HexString0: .asciz "0x00"
HexString1: .asciz "0x01"
HexString2: .asciz "0x02"
HexString3: .asciz "0x03"
HexString4: .asciz "0x04"
HexString5: .asciz "0x05"
HexString6: .asciz "0x06"
HexString7: .asciz "0x07"
HexString8: .asciz "0x08"
HexString9: .asciz "0x09"
HexStringA: .asciz "0x0A"
HexStringB: .asciz "0x0B"
HexStringC: .asciz "0x0C"
HexStringD: .asciz "0x0D"
HexStringE: .asciz "0x0E"
HexStringF: .asciz "0x0F"