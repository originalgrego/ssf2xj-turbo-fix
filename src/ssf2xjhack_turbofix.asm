 ;------------------------------------
 ; Turbo fix

 ; Let the screen transition turbo code set frame skip on entities
 org $0E99A4
  bra $0E99C8 

 ; Do not clear $38d,A5, let turbo handler use it as vsync handled flag
 org $001D62
   nop
   nop

 org $0E9936
   jmp hijack_turbo_handling
 ;------------------------------------