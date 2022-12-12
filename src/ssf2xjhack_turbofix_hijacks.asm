;===================================

hijack_turbo_handling:
  lea     ($61ca,A5), A6 ; Load turbo handler mem ref

  tst.b   ($0,A6) ; Is turbo enabled
  bne     .continue

.exit
  jmp $0e994e ; Return, no skip frame

.continue
  tst.b ($38d,a5) ; Check if vsync has ran
  beq .exit

  tst.b ($2ee,A5)
  beq .exit

  clr.b ($38d,a5) ; Clear vsync handled flag

  add.b  #$27, ($2,A6) ; Increment count

  move.b  ($2,A6), D0 ; Load count
  cmp.b   ($cd3,A5), D0 ; Compare with turbo setting. 
  bhi     .do_skip

  bra .exit

.do_skip
  sub.b ($cd3,A5), D0 ; Bring count below turbo setting
  move.b D0, ($2,A6) ; Store count
  
  jmp $0E9956 ; Store inputs and apply frame skip
  
;===================================
