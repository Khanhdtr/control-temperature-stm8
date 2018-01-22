;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.0 #9615 (Mac OS X x86_64)
;--------------------------------------------------------
	.module bh1750
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _delay_ms
	.globl _delay
	.globl _I2C_GetFlagStatus
	.globl _I2C_CheckEvent
	.globl _I2C_SendData
	.globl _I2C_Send7bitAddress
	.globl _I2C_ReceiveData
	.globl _I2C_AcknowledgeConfig
	.globl _I2C_GenerateSTOP
	.globl _I2C_GenerateSTART
	.globl _BH1750_init
	.globl _BH1750_write
	.globl _BH1750_read_word
	.globl _get_lux_value
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
;	user/bh1750.c: 4: void delay(uint16_t x)
;	-----------------------------------------
;	 function delay
;	-----------------------------------------
_delay:
	pushw	x
;	user/bh1750.c: 6: while(x--);
	ldw	x, (0x05, sp)
00101$:
	ldw	(0x01, sp), x
	decw	x
	ldw	y, (0x01, sp)
	jrne	00101$
	popw	x
	ret
;	user/bh1750.c: 8: void delay_ms(int time){
;	-----------------------------------------
;	 function delay_ms
;	-----------------------------------------
_delay_ms:
	pushw	x
;	user/bh1750.c: 9: while(time--){
	ldw	x, (0x05, sp)
00101$:
	ldw	(0x01, sp), x
	decw	x
	ldw	y, (0x01, sp)
	jreq	00104$
;	user/bh1750.c: 10: delay(1000);
	pushw	x
	push	#0xe8
	push	#0x03
	call	_delay
	popw	x
	popw	x
	jra	00101$
00104$:
	popw	x
	ret
;	user/bh1750.c: 14: void BH1750_init(void)
;	-----------------------------------------
;	 function BH1750_init
;	-----------------------------------------
_BH1750_init:
;	user/bh1750.c: 16: delay_ms(10);  
	push	#0x0a
	push	#0x00
	call	_delay_ms
	popw	x
;	user/bh1750.c: 17: BH1750_write(power_down);
	push	#0x00
	call	_BH1750_write
	pop	a
	ret
;	user/bh1750.c: 21: void BH1750_write(unsigned char cmd)
;	-----------------------------------------
;	 function BH1750_write
;	-----------------------------------------
_BH1750_write:
;	user/bh1750.c: 23: I2C_GenerateSTART(ENABLE);
	push	#0x01
	call	_I2C_GenerateSTART
	pop	a
;	user/bh1750.c: 24: while(!I2C_CheckEvent(I2C_EVENT_MASTER_MODE_SELECT));
00101$:
	push	#0x01
	push	#0x03
	call	_I2C_CheckEvent
	popw	x
	tnz	a
	jreq	00101$
;	user/bh1750.c: 26: I2C_Send7bitAddress(BH1750_addr, I2C_DIRECTION_TX); 
	push	#0x00
	push	#0x46
	call	_I2C_Send7bitAddress
	popw	x
;	user/bh1750.c: 27: while(!I2C_CheckEvent(I2C_EVENT_MASTER_TRANSMITTER_MODE_SELECTED));
00104$:
	push	#0x82
	push	#0x07
	call	_I2C_CheckEvent
	popw	x
	tnz	a
	jreq	00104$
;	user/bh1750.c: 29: I2C_SendData(cmd);
	ld	a, (0x03, sp)
	push	a
	call	_I2C_SendData
	pop	a
;	user/bh1750.c: 30: while(!I2C_CheckEvent(I2C_EVENT_MASTER_BYTE_TRANSMITTED));
00107$:
	push	#0x84
	push	#0x07
	call	_I2C_CheckEvent
	popw	x
	tnz	a
	jreq	00107$
;	user/bh1750.c: 32: I2C_GenerateSTOP(ENABLE);   
	push	#0x01
	call	_I2C_GenerateSTOP
	pop	a
	ret
;	user/bh1750.c: 36: unsigned int BH1750_read_word(void)
;	-----------------------------------------
;	 function BH1750_read_word
;	-----------------------------------------
_BH1750_read_word:
	sub	sp, #12
;	user/bh1750.c: 39: unsigned char num_of_bytes = 0x02;   
	ld	a, #0x02
	ld	(0x03, sp), a
;	user/bh1750.c: 40: unsigned char bytes[2] = {0x00, 0x00};
	ldw	x, sp
	incw	x
	ldw	(0x04, sp), x
	ldw	x, (0x04, sp)
	clr	(x)
	ldw	x, (0x04, sp)
	incw	x
	ldw	(0x06, sp), x
	ldw	x, (0x06, sp)
	clr	(x)
;	user/bh1750.c: 42: while(I2C_GetFlagStatus(I2C_FLAG_BUSBUSY));
00101$:
	push	#0x02
	push	#0x03
	call	_I2C_GetFlagStatus
	popw	x
	tnz	a
	jrne	00101$
;	user/bh1750.c: 44: I2C_GenerateSTART(ENABLE);
	push	#0x01
	call	_I2C_GenerateSTART
	pop	a
;	user/bh1750.c: 45: while(!I2C_CheckEvent(I2C_EVENT_MASTER_MODE_SELECT));
00104$:
	push	#0x01
	push	#0x03
	call	_I2C_CheckEvent
	popw	x
	tnz	a
	jreq	00104$
;	user/bh1750.c: 47: I2C_Send7bitAddress(BH1750_addr, I2C_DIRECTION_RX);
	push	#0x01
	push	#0x46
	call	_I2C_Send7bitAddress
	popw	x
;	user/bh1750.c: 48: while(!I2C_CheckEvent(I2C_EVENT_MASTER_RECEIVER_MODE_SELECTED));
00107$:
	push	#0x02
	push	#0x03
	call	_I2C_CheckEvent
	popw	x
	tnz	a
	jreq	00107$
;	user/bh1750.c: 50: while(num_of_bytes)
00114$:
	tnz	(0x03, sp)
	jreq	00116$
;	user/bh1750.c: 52: if(I2C_CheckEvent(I2C_EVENT_MASTER_BYTE_RECEIVED))
	push	#0x40
	push	#0x03
	call	_I2C_CheckEvent
	popw	x
	tnz	a
	jreq	00114$
;	user/bh1750.c: 54: if(num_of_bytes == 0)
	tnz	(0x03, sp)
	jrne	00111$
;	user/bh1750.c: 56: I2C_AcknowledgeConfig(I2C_ACK_NONE);
	push	#0x00
	call	_I2C_AcknowledgeConfig
	pop	a
;	user/bh1750.c: 57: I2C_GenerateSTOP(ENABLE);   
	push	#0x01
	call	_I2C_GenerateSTOP
	pop	a
00111$:
;	user/bh1750.c: 60: bytes[(num_of_bytes - 1)] = I2C_ReceiveData();
	ld	a, (0x03, sp)
	dec	a
	ld	(0x08, sp), a
	clrw	x
	ld	a, (0x08, sp)
	ld	xl, a
	addw	x, (0x04, sp)
	pushw	x
	call	_I2C_ReceiveData
	popw	x
	ld	(x), a
;	user/bh1750.c: 61: num_of_bytes--;
	ld	a, (0x08, sp)
	ld	(0x03, sp), a
	jra	00114$
00116$:
;	user/bh1750.c: 65: value = ((bytes[1] << 8) | bytes[0]);  
	ldw	x, (0x06, sp)
	ld	a, (x)
	ld	xh, a
	clr	a
	clr	(0x0a, sp)
	ldw	y, (0x04, sp)
	ld	a, (y)
	clr	(0x0b, sp)
	or	a, (0x0a, sp)
	ld	xl, a
	ld	a, xh
	or	a, (0x0b, sp)
	clrw	y
	tnz	a
	jrpl	00161$
	decw	y
00161$:
	ld	xh, a
;	user/bh1750.c: 67: return value;
	addw	sp, #12
	ret
;	user/bh1750.c: 71: unsigned int get_lux_value(unsigned char mode, unsigned int delay_time)
;	-----------------------------------------
;	 function get_lux_value
;	-----------------------------------------
_get_lux_value:
	sub	sp, #9
;	user/bh1750.c: 73: unsigned long lux_value = 0x00;  
	clrw	x
	ldw	(0x04, sp), x
	ldw	(0x02, sp), x
;	user/bh1750.c: 77: while(s)
	ld	a, #0x08
	ld	(0x01, sp), a
00102$:
	tnz	(0x01, sp)
	jreq	00104$
;	user/bh1750.c: 79: BH1750_write(power_up);
	push	#0x01
	call	_BH1750_write
	pop	a
;	user/bh1750.c: 80: BH1750_write(mode);
	ld	a, (0x0c, sp)
	push	a
	call	_BH1750_write
	pop	a
;	user/bh1750.c: 81: lux_value += BH1750_read_word();
	call	_BH1750_read_word
	clr	a
	clr	(0x06, sp)
	addw	x, (0x04, sp)
	adc	a, (0x03, sp)
	ld	yl, a
	ld	a, (0x06, sp)
	adc	a, (0x02, sp)
	ld	yh, a
	ldw	(0x04, sp), x
	ldw	(0x02, sp), y
;	user/bh1750.c: 82: for(dly = 0; dly < delay_time; dly += 1)
	clr	a
00106$:
	clrw	x
	ld	xl, a
	cpw	x, (0x0d, sp)
	jrnc	00101$
;	user/bh1750.c: 84: delay_ms(1);
	push	a
	push	#0x01
	push	#0x00
	call	_delay_ms
	popw	x
	pop	a
;	user/bh1750.c: 82: for(dly = 0; dly < delay_time; dly += 1)
	inc	a
	jra	00106$
00101$:
;	user/bh1750.c: 86: BH1750_write(power_down);
	push	#0x00
	call	_BH1750_write
	pop	a
;	user/bh1750.c: 87: s--;
	dec	(0x01, sp)
	jra	00102$
00104$:
;	user/bh1750.c: 89: lux_value >>= 3;
	ldw	x, (0x04, sp)
	ldw	y, (0x02, sp)
	srlw	y
	rrcw	x
	srlw	y
	rrcw	x
	srlw	y
	rrcw	x
;	user/bh1750.c: 91: return ((unsigned int)lux_value);
	addw	sp, #9
	ret
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)
