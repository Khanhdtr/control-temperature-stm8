;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.0 #9615 (Mac OS X x86_64)
;--------------------------------------------------------
	.module uart
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _Printf
	.globl _SetupSerialPort
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area DATA
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area INITIALIZED
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area DABS (ABS)
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area HOME
	.area GSINIT
	.area GSFINAL
	.area GSINIT
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area HOME
	.area HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area CODE
;	user/uart.c: 4: void SetupSerialPort(void)
;	-----------------------------------------
;	 function SetupSerialPort
;	-----------------------------------------
_SetupSerialPort:
;	user/uart.c: 8: (void) UART1->SR;
	ldw	x, #0x5230
	ld	a, (x)
;	user/uart.c: 9: (void) UART1->DR;
	ldw	x, #0x5231
	ld	a, (x)
;	user/uart.c: 11: UART1->CR2 = UART1_CR2_RESET_VALUE;
	mov	0x5235+0, #0x00
;	user/uart.c: 12: UART1->CR4 = UART1_CR4_RESET_VALUE;
	mov	0x5237+0, #0x00
;	user/uart.c: 13: UART1->CR5 = UART1_CR5_RESET_VALUE;
	mov	0x5238+0, #0x00
;	user/uart.c: 14: UART1->GTR = UART1_GTR_RESET_VALUE;
	mov	0x5239+0, #0x00
;	user/uart.c: 15: UART1->PSCR = UART1_PSCR_RESET_VALUE;
	mov	0x523a+0, #0x00
;	user/uart.c: 17: UART1->CR1 = (u8) UART1_WORDLENGTH_8D | (u8) UART1_PARITY_NO;   // Word length = 8, no parity.
	mov	0x5234+0, #0x00
;	user/uart.c: 18: UART1->CR3 = (u8) UART1_STOPBITS_1;                             // 1 stop bit.
	mov	0x5236+0, #0x00
;	user/uart.c: 19: UART1->BRR1 &= (uint8_t) (~UART1_BRR1_DIVM);
	ldw	x, #0x5232
	ld	a, (x)
	mov	0x5232+0, #0x00
;	user/uart.c: 20: UART1->BRR2 &= (uint8_t) (~UART1_BRR2_DIVM);
	ldw	x, #0x5233
	ld	a, (x)
	and	a, #0x0f
	ld	(x), a
;	user/uart.c: 21: UART1->BRR2 &= (uint8_t) (~UART1_BRR2_DIVF);
	ldw	x, #0x5233
	ld	a, (x)
	and	a, #0xf0
	ld	(x), a
;	user/uart.c: 23: UART1->BRR2 = 0x0b;
	mov	0x5233+0, #0x0b
;	user/uart.c: 24: UART1->BRR1 = 0x08;
	mov	0x5232+0, #0x08
;	user/uart.c: 26: UART1->CR2 &= (u8) ~(UART1_CR2_TEN | UART1_CR2_REN);
	ldw	x, #0x5235
	ld	a, (x)
	and	a, #0xf3
	ld	(x), a
;	user/uart.c: 28: UART1->CR3 &= (u8)~(UART1_CR3_CPOL | UART1_CR3_CPHA | UART1_CR3_LBCL);
	ldw	x, #0x5236
	ld	a, (x)
	and	a, #0xf8
	ld	(x), a
;	user/uart.c: 30: UART1->CR3 |= (u8)((u8) UART1_SYNCMODE_CLOCK_ENABLE &
	ldw	x, #0x5236
	ld	a, (x)
	ldw	x, #0x5236
	ld	(x), a
;	user/uart.c: 33: UART1->CR2 |= (u8) ((u8) UART1_CR2_TEN | (u8) UART1_CR2_REN);
	ldw	x, #0x5235
	ld	a, (x)
	or	a, #0x0c
	ld	(x), a
;	user/uart.c: 34: UART1->CR3 &= (u8) (~UART1_CR3_CKEN);
	ldw	x, #0x5236
	ld	a, (x)
	and	a, #0xf7
	ld	(x), a
	ret
;	user/uart.c: 38: void Printf(char *message)
;	-----------------------------------------
;	 function Printf
;	-----------------------------------------
_Printf:
;	user/uart.c: 40: char *ch = message;
	ldw	y, (0x03, sp)
;	user/uart.c: 41: while (*ch)
00104$:
	ld	a, (y)
	tnz	a
	jrne	00126$
	ret
00126$:
;	user/uart.c: 43: UART1->DR = (u8) (*ch);
	ldw	x, #0x5231
	ld	(x), a
;	user/uart.c: 44: while ((UART1->SR & (u8) UART1_FLAG_TXE) == RESET);
00101$:
	ldw	x, #0x5230
	ld	a, (x)
	tnz	a
	jrpl	00101$
;	user/uart.c: 45: ch++;
	incw	y
	jra	00104$
	ret
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)
