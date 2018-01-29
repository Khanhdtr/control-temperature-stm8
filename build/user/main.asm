;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.0 #9615 (Mac OS X x86_64)
;--------------------------------------------------------
	.module main
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _TIM4_UPD_OVF_IRQHandler
	.globl _Printf
	.globl _SetupSerialPort
	.globl _TIMER_CheckTimeMS
	.globl _TIMER_InitTime
	.globl _TIMER_Inc
	.globl _TIMER_Init
	.globl _TIM4_ClearITPendingBit
	.globl _I2C_Cmd
	.globl _I2C_Init
	.globl _I2C_DeInit
	.globl _GPIO_WriteLow
	.globl _GPIO_WriteHigh
	.globl _GPIO_Init
	.globl _CLK_GetFlagStatus
	.globl _CLK_GetClockFreq
	.globl _CLK_SYSCLKConfig
	.globl _CLK_HSIPrescalerConfig
	.globl _CLK_ClockSwitchConfig
	.globl _CLK_PeripheralClockConfig
	.globl _CLK_ClockSwitchCmd
	.globl _CLK_LSICmd
	.globl _CLK_HSICmd
	.globl _CLK_HSECmd
	.globl _CLK_DeInit
	.globl _ToggleVar
	.globl _tick
	.globl _clock_setup
	.globl _I2C_setup
	.globl _GPIO_setup
	.globl _Led_manager
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area DATA
_tick::
	.ds 6
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area INITIALIZED
_ToggleVar::
	.ds 1
;--------------------------------------------------------
; Stack segment in internal ram 
;--------------------------------------------------------
	.area	SSEG
__start__stack:
	.ds	1

;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area DABS (ABS)
;--------------------------------------------------------
; interrupt vector 
;--------------------------------------------------------
	.area HOME
__interrupt_vect:
	int s_GSINIT ;reset
	int 0x0000 ;trap
	int 0x0000 ;int0
	int 0x0000 ;int1
	int 0x0000 ;int2
	int 0x0000 ;int3
	int 0x0000 ;int4
	int 0x0000 ;int5
	int 0x0000 ;int6
	int 0x0000 ;int7
	int 0x0000 ;int8
	int 0x0000 ;int9
	int 0x0000 ;int10
	int 0x0000 ;int11
	int 0x0000 ;int12
	int 0x0000 ;int13
	int 0x0000 ;int14
	int 0x0000 ;int15
	int 0x0000 ;int16
	int 0x0000 ;int17
	int 0x0000 ;int18
	int 0x0000 ;int19
	int 0x0000 ;int20
	int 0x0000 ;int21
	int 0x0000 ;int22
	int _TIM4_UPD_OVF_IRQHandler ;int23
	int 0x0000 ;int24
	int 0x0000 ;int25
	int 0x0000 ;int26
	int 0x0000 ;int27
	int 0x0000 ;int28
	int 0x0000 ;int29
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area HOME
	.area GSINIT
	.area GSFINAL
	.area GSINIT
__sdcc_gs_init_startup:
__sdcc_init_data:
; stm8_genXINIT() start
	ldw x, #l_DATA
	jreq	00002$
00001$:
	clr (s_DATA - 1, x)
	decw x
	jrne	00001$
00002$:
	ldw	x, #l_INITIALIZER
	jreq	00004$
00003$:
	ld	a, (s_INITIALIZER - 1, x)
	ld	(s_INITIALIZED - 1, x), a
	decw	x
	jrne	00003$
00004$:
; stm8_genXINIT() end
	.area GSFINAL
	jp	__sdcc_program_startup
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area HOME
	.area HOME
__sdcc_program_startup:
	jp	_main
;	return from main will return to caller
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area CODE
;	user/main.c: 27: void clock_setup(void)
;	-----------------------------------------
;	 function clock_setup
;	-----------------------------------------
_clock_setup:
;	user/main.c: 29: CLK_DeInit();
	call	_CLK_DeInit
;	user/main.c: 30: CLK_HSECmd(DISABLE);
	push	#0x00
	call	_CLK_HSECmd
	pop	a
;	user/main.c: 31: CLK_LSICmd(DISABLE);
	push	#0x00
	call	_CLK_LSICmd
	pop	a
;	user/main.c: 32: CLK_HSICmd(ENABLE);
	push	#0x01
	call	_CLK_HSICmd
	pop	a
;	user/main.c: 33: while(CLK_GetFlagStatus(CLK_FLAG_HSIRDY) == FALSE);
00101$:
	push	#0x02
	push	#0x01
	call	_CLK_GetFlagStatus
	popw	x
	tnz	a
	jreq	00101$
;	user/main.c: 34: CLK_ClockSwitchCmd(ENABLE);
	push	#0x01
	call	_CLK_ClockSwitchCmd
	pop	a
;	user/main.c: 36: CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
	push	#0x00
	call	_CLK_HSIPrescalerConfig
	pop	a
;	user/main.c: 39: CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV1 );
	push	#0x80
	call	_CLK_SYSCLKConfig
	pop	a
;	user/main.c: 40: CLK_ClockSwitchConfig(CLK_SWITCHMODE_AUTO, CLK_SOURCE_HSI, DISABLE, CLK_CURRENTCLOCKSTATE_ENABLE);
	push	#0x01
	push	#0x00
	push	#0xe1
	push	#0x01
	call	_CLK_ClockSwitchConfig
	addw	sp, #4
;	user/main.c: 42: CLK_PeripheralClockConfig(CLK_PERIPHERAL_SPI, DISABLE);
	push	#0x00
	push	#0x01
	call	_CLK_PeripheralClockConfig
	popw	x
;	user/main.c: 43: CLK_PeripheralClockConfig(CLK_PERIPHERAL_I2C, ENABLE);
	push	#0x01
	push	#0x00
	call	_CLK_PeripheralClockConfig
	popw	x
;	user/main.c: 44: CLK_PeripheralClockConfig(CLK_PERIPHERAL_ADC, DISABLE);
	push	#0x00
	push	#0x13
	call	_CLK_PeripheralClockConfig
	popw	x
;	user/main.c: 45: CLK_PeripheralClockConfig(CLK_PERIPHERAL_AWU, DISABLE);
	push	#0x00
	push	#0x12
	call	_CLK_PeripheralClockConfig
	popw	x
;	user/main.c: 46: CLK_PeripheralClockConfig(CLK_PERIPHERAL_UART1, ENABLE);
	push	#0x01
	push	#0x03
	call	_CLK_PeripheralClockConfig
	popw	x
;	user/main.c: 47: CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER1, DISABLE);
	push	#0x00
	push	#0x07
	call	_CLK_PeripheralClockConfig
	popw	x
;	user/main.c: 48: CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER2, DISABLE);
	push	#0x00
	push	#0x05
	call	_CLK_PeripheralClockConfig
	popw	x
;	user/main.c: 49: CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER4, ENABLE);
	push	#0x01
	push	#0x04
	call	_CLK_PeripheralClockConfig
	popw	x
	ret
;	user/main.c: 52: INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 23)
;	-----------------------------------------
;	 function TIM4_UPD_OVF_IRQHandler
;	-----------------------------------------
_TIM4_UPD_OVF_IRQHandler:
	div	x, a
;	user/main.c: 54: TIM4_ClearITPendingBit(TIM4_IT_UPDATE);
	push	#0x01
	call	_TIM4_ClearITPendingBit
	pop	a
;	user/main.c: 55: TIMER_Inc();
	call	_TIMER_Inc
	iret
;	user/main.c: 59: void I2C_setup(void)
;	-----------------------------------------
;	 function I2C_setup
;	-----------------------------------------
_I2C_setup:
;	user/main.c: 61: I2C_DeInit();
	call	_I2C_DeInit
;	user/main.c: 67: (CLK_GetClockFreq() / 1000000));
	call	_CLK_GetClockFreq
	push	#0x40
	push	#0x42
	push	#0x0f
	push	#0x00
	pushw	x
	pushw	y
	call	__divulong
	addw	sp, #8
	ld	a, xl
;	user/main.c: 62: I2C_Init(100000, 
	push	a
	push	#0x00
	push	#0x01
	push	#0x00
	push	#0x46
	push	#0x00
	push	#0xa0
	push	#0x86
	push	#0x01
	push	#0x00
	call	_I2C_Init
	addw	sp, #10
;	user/main.c: 68: I2C_Cmd(ENABLE);
	push	#0x01
	call	_I2C_Cmd
	pop	a
	ret
;	user/main.c: 71: void GPIO_setup(void)
;	-----------------------------------------
;	 function GPIO_setup
;	-----------------------------------------
_GPIO_setup:
;	user/main.c: 73: GPIO_Init(GPIOB, GPIO_PIN_4, GPIO_MODE_OUT_OD_HIZ_FAST);
	push	#0xb0
	push	#0x10
	push	#0x05
	push	#0x50
	call	_GPIO_Init
	addw	sp, #4
;	user/main.c: 74: GPIO_Init(GPIOB, GPIO_PIN_5, GPIO_MODE_OUT_OD_HIZ_FAST);
	push	#0xb0
	push	#0x20
	push	#0x05
	push	#0x50
	call	_GPIO_Init
	addw	sp, #4
;	user/main.c: 75: GPIO_Init(GPIOA,GPIO_PIN_1,GPIO_MODE_OUT_PP_LOW_SLOW);
	push	#0xc0
	push	#0x02
	push	#0x00
	push	#0x50
	call	_GPIO_Init
	addw	sp, #4
	ret
;	user/main.c: 95: void Led_manager (void)
;	-----------------------------------------
;	 function Led_manager
;	-----------------------------------------
_Led_manager:
;	user/main.c: 97: if(TIMER_CheckTimeMS(&tick, 1000) == 0) ToggleVar = ~ToggleVar;  
	ldw	x, #_tick+0
	push	#0xe8
	push	#0x03
	push	#0x00
	push	#0x00
	pushw	x
	call	_TIMER_CheckTimeMS
	addw	sp, #6
	tnz	a
	jrne	00102$
	ld	a, _ToggleVar+0
	cpl	a
	ld	_ToggleVar+0, a
00102$:
;	user/main.c: 98: if(ToggleVar == 0x01)   
	ld	a, _ToggleVar+0
	cp	a, #0x01
	jrne	00104$
;	user/main.c: 99: GPIO_WriteHigh(GPIOA,GPIO_PIN_1);   
	push	#0x02
	push	#0x00
	push	#0x50
	call	_GPIO_WriteHigh
	addw	sp, #3
	ret
00104$:
;	user/main.c: 101: GPIO_WriteLow(GPIOA,GPIO_PIN_1);
	push	#0x02
	push	#0x00
	push	#0x50
	call	_GPIO_WriteLow
	addw	sp, #3
	ret
;	user/main.c: 105: void main() 
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
;	user/main.c: 109: clock_setup();
	call	_clock_setup
;	user/main.c: 110: GPIO_setup();
	call	_GPIO_setup
;	user/main.c: 111: I2C_setup();
	call	_I2C_setup
;	user/main.c: 113: TIMER_Init();
	call	_TIMER_Init
;	user/main.c: 114: SetupSerialPort();
	call	_SetupSerialPort
;	user/main.c: 116: enableInterrupts();
	rim
;	user/main.c: 117: TIMER_InitTime(&tick);
	ldw	x, #_tick+0
	pushw	x
	call	_TIMER_InitTime
	popw	x
;	user/main.c: 118: while(1)
00102$:
;	user/main.c: 120: Led_manager ();
	call	_Led_manager
;	user/main.c: 121: Printf("Hello from my program");
	ldw	x, #___str_0+0
	pushw	x
	call	_Printf
	popw	x
	jra	00102$
	ret
	.area CODE
___str_0:
	.ascii "Hello from my program"
	.db 0x00
	.area INITIALIZER
__xinit__ToggleVar:
	.db #0x01	; 1
	.area CABS (ABS)
