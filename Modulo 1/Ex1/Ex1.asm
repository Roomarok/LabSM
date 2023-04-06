;-------------------------------------------------------------------------------
; MSP430 Assembler Code Template for use with TI Code Composer Studio
;
;
;-------------------------------------------------------------------------------
            .cdecls C,LIST,"msp430.h"       ; Include device header file
            
;-------------------------------------------------------------------------------
            .def    RESET                   ; Export program entry-point to
                                            ; make it known to linker.
;-------------------------------------------------------------------------------
            .text                           ; Assemble into program memory.
            .retain                         ; Override ELF conditional linking
                                            ; and retain current section.
            .retainrefs                     ; And retain any sections that have
                                            ; references to current section.

;-------------------------------------------------------------------------------
RESET       mov.w   #__STACK_END,SP         ; Initialize stackpointer
StopWDT     mov.w   #WDTPW|WDTHOLD,&WDTCTL  ; Stop watchdog timer


;-------------------------------------------------------------------------------
; Main loop here
;-------------------------------------------------------------------------------
Inic:		clr		r5
			clr		r6
			clr		r7
			clr		r8
			mov		#v1,r5
Txt:		mov		#0xFF,r6
			call	#Small
			jmp		$
Small:		mov.b	@r5,r8
			inc		r5
			inc		r7
Loop:		cmp.b	@r5,r6
			clr		r7
			inc		r7
Func1:		inc		r5
			dec		r8
			jnz		Loop
			ret
Func2:		inc		r7
			jmp		Func1

;-------------------------------------------------------------------------------
; Ram Here
;-------------------------------------------------------------------------------

			.data
V1:         .byte 8,6,2,6,6,2,3,4,5


                                            

;-------------------------------------------------------------------------------
; Stack Pointer definition
;-------------------------------------------------------------------------------
            .global __STACK_END
            .sect   .stack
            
;-------------------------------------------------------------------------------
; Interrupt Vectors
;-------------------------------------------------------------------------------
            .sect   ".reset"                ; MSP430 RESET Vector
            .short  RESET
            
