;----------------------------------------------------
;	PIC18F47Q10			09.06.2022
;	curiosity nano
;----------------------------------------------------
;       Program : blink LED
;----------------------------------------------------
;	IDE: MPLAB X version 6.00
;----------------------------------------------------
; Ports
;----------------------------------------------------
;	pin	port	    I/O		func	
;----------------------------------------------------
;	1	PORTE,0	    OUT		LED    
;----------------------------------------------------  
; Configuration
;----------------------------------------------------
; PIC18F47Q10 Configuration Bit Settings

; Assembly source line config statements

; CONFIG1L
  CONFIG  FEXTOSC = OFF         ; External Oscillator mode Selection bits (Oscillator not enabled)
  CONFIG  RSTOSC = LFINTOSC     ; Power-up default value for COSC bits (Low-Frequency Oscillator)

; CONFIG1H
  CONFIG  CLKOUTEN = OFF        ; Clock Out Enable bit (CLKOUT function is disabled)
  CONFIG  CSWEN = ON            ; Clock Switch Enable bit (Writing to NOSC and NDIV is allowed)
  CONFIG  FCMEN = ON            ; Fail-Safe Clock Monitor Enable bit (Fail-Safe Clock Monitor enabled)

; CONFIG2L
  CONFIG  MCLRE = EXTMCLR       ; Master Clear Enable bit (MCLR pin (RE3) is MCLR)
  CONFIG  PWRTE = OFF           ; Power-up Timer Enable bit (Power up timer disabled)
  CONFIG  LPBOREN = OFF         ; Low-power BOR enable bit (Low power BOR is disabled)
  CONFIG  BOREN = SBORDIS       ; Brown-out Reset Enable bits (Brown-out Reset enabled , SBOREN bit is ignored)

; CONFIG2H
  CONFIG  BORV = VBOR_190       ; Brown Out Reset Voltage selection bits (Brown-out Reset Voltage (VBOR) set to 1.90V)
  CONFIG  ZCD = OFF             ; ZCD Disable bit (ZCD disabled. ZCD can be enabled by setting the ZCDSEN bit of ZCDCON)
  CONFIG  PPS1WAY = ON          ; PPSLOCK bit One-Way Set Enable bit (PPSLOCK bit can be cleared and set only once; PPS registers remain locked after one clear/set cycle)
  CONFIG  STVREN = ON           ; Stack Full/Underflow Reset Enable bit (Stack full/underflow will cause Reset)
  CONFIG  XINST = OFF           ; Extended Instruction Set Enable bit (Extended Instruction Set and Indexed Addressing Mode disabled)

; CONFIG3L
  CONFIG  WDTCPS = WDTCPS_31    ; WDT Period Select bits (Divider ratio 1:65536; software control of WDTPS)
  CONFIG  WDTE = ON             ; WDT operating mode (WDT always enabled)

; CONFIG3H
  CONFIG  WDTCWS = WDTCWS_7     ; WDT Window Select bits (window always open (100%); software control; keyed access not required)
  CONFIG  WDTCCS = SC           ; WDT input clock selector (Software Control)

; CONFIG4L
  CONFIG  WRT0 = OFF            ; Write Protection Block 0 (Block 0 (000800-003FFFh) not write-protected)
  CONFIG  WRT1 = OFF            ; Write Protection Block 1 (Block 1 (004000-007FFFh) not write-protected)
  CONFIG  WRT2 = OFF            ; Write Protection Block 2 (Block 2 (008000-00BFFFh) not write-protected)
  CONFIG  WRT3 = OFF            ; Write Protection Block 3 (Block 3 (00C000-00FFFFh) not write-protected)
  CONFIG  WRT4 = OFF            ; Write Protection Block 4 (Block 4 (010000-013FFFh) not write-protected)
  CONFIG  WRT5 = OFF            ; Write Protection Block 5 (Block 5 (014000-017FFFh) not write-protected)
  CONFIG  WRT6 = OFF            ; Write Protection Block 6 (Block 6 (018000-01BFFFh) not write-protected)
  CONFIG  WRT7 = OFF            ; Write Protection Block 7 (Block 7 (01C000-01FFFFh) not write-protected)

; CONFIG4H
  CONFIG  WRTC = OFF            ; Configuration Register Write Protection bit (Configuration registers (300000-30000Bh) not write-protected)
  CONFIG  WRTB = OFF            ; Boot Block Write Protection bit (Boot Block (000000-0007FFh) not write-protected)
  CONFIG  WRTD = OFF            ; Data EEPROM Write Protection bit (Data EEPROM not write-protected)
  CONFIG  SCANE = ON            ; Scanner Enable bit (Scanner module is available for use, SCANMD bit can control the module)
  CONFIG  LVP = ON              ; Low Voltage Programming Enable bit (Low voltage programming enabled. MCLR/VPP pin function is MCLR. MCLRE configuration bit is ignored)

; CONFIG5L
  CONFIG  CP = OFF              ; UserNVM Program Memory Code Protection bit (UserNVM code protection disabled)
  CONFIG  CPD = OFF             ; DataNVM Memory Code Protection bit (DataNVM code protection disabled)

; CONFIG5H

; CONFIG6L
  CONFIG  EBTR0 = OFF           ; Table Read Protection Block 0 (Block 0 (000800-003FFFh) not protected from table reads executed in other blocks)
  CONFIG  EBTR1 = OFF           ; Table Read Protection Block 1 (Block 1 (004000-007FFFh) not protected from table reads executed in other blocks)
  CONFIG  EBTR2 = OFF           ; Table Read Protection Block 2 (Block 2 (008000-00BFFFh) not protected from table reads executed in other blocks)
  CONFIG  EBTR3 = OFF           ; Table Read Protection Block 3 (Block 3 (00C000-00FFFFh) not protected from table reads executed in other blocks)
  CONFIG  EBTR4 = OFF           ; Table Read Protection Block 4 (Block 4 (010000-013FFFh) not protected from table reads executed in other blocks)
  CONFIG  EBTR5 = OFF           ; Table Read Protection Block 5 (Block 5 (014000-017FFFh) not protected from table reads executed in other blocks)
  CONFIG  EBTR6 = OFF           ; Table Read Protection Block 6 (Block 6 (018000-01BFFFh) not protected from table reads executed in other blocks)
  CONFIG  EBTR7 = OFF           ; Table Read Protection Block 7 (Block 7 (01C000-01FFFFh) not protected from table reads executed in other blocks)

; CONFIG6H
  CONFIG  EBTRB = OFF           ; Boot Block Table Read Protection bit (Boot Block (000000-0007FFh) not protected from table reads executed in other blocks)

// config statements should precede project file includes.
#include <xc.inc> ;header file

;---------------------------------------------------------------------------
; Reset Vector
; (PSECT resetVec,class=CODE,space=0,abs)
;---------------------------------------------------------------------------
PSECT resetVec,abs
	org 0
resetVec:
	goto START

;---------------------------------------------------------------------------
; DELAY 10µs
;---------------------------------------------------------------------------
DL10:	nop
	nop
	nop
	nop
	nop
	nop
;-------------------------------
	return
;---------------------------------------------------------------------------
; DELAY 100µs
;---------------------------------------------------------------------------
DL100:	call DL10
	call DL10
	call DL10
	call DL10
	call DL10
	call DL10
	call DL10
	call DL10
	call DL10
;-------------------------------
	nop
	nop
	nop
	nop
	nop
	nop
;-------------------------------
	return
;---------------------------------------------------------------------------
; DELAY 1ms
;---------------------------------------------------------------------------
DL1m:	call DL100
	call DL100
	call DL100
	call DL100
	call DL100
	call DL100
	call DL100
	call DL100
	call DL100
;-------------------------------
	call DL10
	call DL10
	call DL10
	call DL10
	call DL10
	call DL10
	call DL10
	call DL10
	call DL10
;-------------------------------
	nop
	nop
	nop
	nop
	nop
	nop
;-------------------------------
	return
;---------------------------------------------------------------------------
; DELAY 10ms
;---------------------------------------------------------------------------
DL10m:	call DL1m
	call DL1m
	call DL1m
	call DL1m
	call DL1m
	call DL1m
	call DL1m
	call DL1m
	call DL1m
	call DL1m
;-------------------------------
	return
;---------------------------------------------------------------------------
; DELAY 100ms
;---------------------------------------------------------------------------
DL100m:	call DL10m
	call DL10m
	call DL10m
	call DL10m
	call DL10m
	call DL10m
	call DL10m
	call DL10m
	call DL10m
	call DL10m
;-------------------------------
	return
;----------------------------------------------------
; Main program
;----------------------------------------------------    
START:	movlb	0x0e		;Bank 0e
	movlw	0x0C
	movwf   TRISE
	bcf	LATE,0
	call	DL100m
	bsf	LATE,0
	call	DL100m
	
END				;---------------------------------------------------