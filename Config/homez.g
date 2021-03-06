; homez.g
; called to home the Z axis
;
; generated by RepRapFirmware Configuration Tool on Mon Sep 18 2017 23:51:32 GMT-0700 (Pacific Daylight Time)

; Lift Z relatively to current position
;G91
;G1 Z5 F12000

; Back to absolute positioning
M0
G90
G92 Z0 ; Momentarily set Z to 0 position so tool change can be executed

M584 Z2 ; Split the 2 Z towers for independent control. this will move left tower only
T0 P0 ; Select Tool 0 without running tfree tpre tpost
G1 X59 Y59 F12000 ; T0 Go to center bed probe point 
G30 ; this will home and probe the left Z tower
; lift left Z tower after probing
G91
G1 Z5 F200
G90
T1 P1 ; Select Tool 1 and run tfree0 only to park T0

M584 Z5 ; Split the 2 Z towers for independent control. this will move right tower only
G1 X59 Y59 F12000 ; T1 Go to center bed probe point
M558 P6 X0 Y0 Z1 H132 F120 T12000 ; Allow right tower to go all the way down to FSR on bed
G30 ; this will home and probe the right Z tower
; lift right Z tower after probing
G91
G1 Z5 F200
G90
T0 P1 ; Select Tool 0 and run tfree1 only to park T1


M584 Z2:5 ; join both Z together
M558 P6 X0 Y0 Z1 H132 F120 T12000
