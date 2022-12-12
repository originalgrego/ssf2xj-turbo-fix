 org $0
  incbin "build\ssf2xj.bin"

  include	"src\ssf2xjhack_turbofix.asm"

 org $246880
  include	"src\ssf2xjhack_turbofix_hijacks.asm"
