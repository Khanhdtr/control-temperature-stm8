                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 3.6.0 #9615 (Mac OS X x86_64)
                                      4 ;--------------------------------------------------------
                                      5 	.module main
                                      6 	.optsdcc -mstm8
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _main
                                     12 	.globl _delay
                                     13 	.globl _TIM4_UPD_OVF_IRQHandler
                                     14 	.globl _clock_setup
                                     15 	.globl _TIMER_Inc
                                     16 	.globl _TIMER_Init
                                     17 	.globl _TIM4_ClearITPendingBit
                                     18 	.globl _CLK_GetFlagStatus
                                     19 	.globl _CLK_SYSCLKConfig
                                     20 	.globl _CLK_HSIPrescalerConfig
                                     21 	.globl _CLK_ClockSwitchConfig
                                     22 	.globl _CLK_PeripheralClockConfig
                                     23 	.globl _CLK_ClockSwitchCmd
                                     24 	.globl _CLK_LSICmd
                                     25 	.globl _CLK_HSICmd
                                     26 	.globl _CLK_HSECmd
                                     27 	.globl _CLK_DeInit
                                     28 	.globl _tick
                                     29 ;--------------------------------------------------------
                                     30 ; ram data
                                     31 ;--------------------------------------------------------
                                     32 	.area DATA
      000001                         33 _tick::
      000001                         34 	.ds 6
                                     35 ;--------------------------------------------------------
                                     36 ; ram data
                                     37 ;--------------------------------------------------------
                                     38 	.area INITIALIZED
                                     39 ;--------------------------------------------------------
                                     40 ; Stack segment in internal ram 
                                     41 ;--------------------------------------------------------
                                     42 	.area	SSEG
      000010                         43 __start__stack:
      000010                         44 	.ds	1
                                     45 
                                     46 ;--------------------------------------------------------
                                     47 ; absolute external ram data
                                     48 ;--------------------------------------------------------
                                     49 	.area DABS (ABS)
                                     50 ;--------------------------------------------------------
                                     51 ; interrupt vector 
                                     52 ;--------------------------------------------------------
                                     53 	.area HOME
      008000                         54 __interrupt_vect:
      008000 82 00 80 83             55 	int s_GSINIT ;reset
      008004 82 00 00 00             56 	int 0x0000 ;trap
      008008 82 00 00 00             57 	int 0x0000 ;int0
      00800C 82 00 00 00             58 	int 0x0000 ;int1
      008010 82 00 00 00             59 	int 0x0000 ;int2
      008014 82 00 00 00             60 	int 0x0000 ;int3
      008018 82 00 00 00             61 	int 0x0000 ;int4
      00801C 82 00 00 00             62 	int 0x0000 ;int5
      008020 82 00 00 00             63 	int 0x0000 ;int6
      008024 82 00 00 00             64 	int 0x0000 ;int7
      008028 82 00 00 00             65 	int 0x0000 ;int8
      00802C 82 00 00 00             66 	int 0x0000 ;int9
      008030 82 00 00 00             67 	int 0x0000 ;int10
      008034 82 00 00 00             68 	int 0x0000 ;int11
      008038 82 00 00 00             69 	int 0x0000 ;int12
      00803C 82 00 00 00             70 	int 0x0000 ;int13
      008040 82 00 00 00             71 	int 0x0000 ;int14
      008044 82 00 00 00             72 	int 0x0000 ;int15
      008048 82 00 00 00             73 	int 0x0000 ;int16
      00804C 82 00 00 00             74 	int 0x0000 ;int17
      008050 82 00 00 00             75 	int 0x0000 ;int18
      008054 82 00 00 00             76 	int 0x0000 ;int19
      008058 82 00 00 00             77 	int 0x0000 ;int20
      00805C 82 00 00 00             78 	int 0x0000 ;int21
      008060 82 00 00 00             79 	int 0x0000 ;int22
      008064 82 00 81 10             80 	int _TIM4_UPD_OVF_IRQHandler ;int23
      008068 82 00 00 00             81 	int 0x0000 ;int24
      00806C 82 00 00 00             82 	int 0x0000 ;int25
      008070 82 00 00 00             83 	int 0x0000 ;int26
      008074 82 00 00 00             84 	int 0x0000 ;int27
      008078 82 00 00 00             85 	int 0x0000 ;int28
      00807C 82 00 00 00             86 	int 0x0000 ;int29
                                     87 ;--------------------------------------------------------
                                     88 ; global & static initialisations
                                     89 ;--------------------------------------------------------
                                     90 	.area HOME
                                     91 	.area GSINIT
                                     92 	.area GSFINAL
                                     93 	.area GSINIT
      008083                         94 __sdcc_gs_init_startup:
      008083                         95 __sdcc_init_data:
                                     96 ; stm8_genXINIT() start
      008083 AE 00 0F         [ 2]   97 	ldw x, #l_DATA
      008086 27 07            [ 1]   98 	jreq	00002$
      008088                         99 00001$:
      008088 72 4F 00 00      [ 1]  100 	clr (s_DATA - 1, x)
      00808C 5A               [ 2]  101 	decw x
      00808D 26 F9            [ 1]  102 	jrne	00001$
      00808F                        103 00002$:
      00808F AE 00 00         [ 2]  104 	ldw	x, #l_INITIALIZER
      008092 27 09            [ 1]  105 	jreq	00004$
      008094                        106 00003$:
      008094 D6 87 76         [ 1]  107 	ld	a, (s_INITIALIZER - 1, x)
      008097 D7 00 0F         [ 1]  108 	ld	(s_INITIALIZED - 1, x), a
      00809A 5A               [ 2]  109 	decw	x
      00809B 26 F7            [ 1]  110 	jrne	00003$
      00809D                        111 00004$:
                                    112 ; stm8_genXINIT() end
                                    113 	.area GSFINAL
      00809D CC 80 80         [ 2]  114 	jp	__sdcc_program_startup
                                    115 ;--------------------------------------------------------
                                    116 ; Home
                                    117 ;--------------------------------------------------------
                                    118 	.area HOME
                                    119 	.area HOME
      008080                        120 __sdcc_program_startup:
      008080 CC 81 27         [ 2]  121 	jp	_main
                                    122 ;	return from main will return to caller
                                    123 ;--------------------------------------------------------
                                    124 ; code
                                    125 ;--------------------------------------------------------
                                    126 	.area CODE
                                    127 ;	user/main.c: 23: void clock_setup(void)
                                    128 ;	-----------------------------------------
                                    129 ;	 function clock_setup
                                    130 ;	-----------------------------------------
      0080A0                        131 _clock_setup:
                                    132 ;	user/main.c: 25: CLK_DeInit();
      0080A0 CD 82 5D         [ 4]  133 	call	_CLK_DeInit
                                    134 ;	user/main.c: 26: CLK_HSECmd(DISABLE);
      0080A3 4B 00            [ 1]  135 	push	#0x00
      0080A5 CD 82 A9         [ 4]  136 	call	_CLK_HSECmd
      0080A8 84               [ 1]  137 	pop	a
                                    138 ;	user/main.c: 27: CLK_LSICmd(DISABLE);
      0080A9 4B 00            [ 1]  139 	push	#0x00
      0080AB CD 82 C5         [ 4]  140 	call	_CLK_LSICmd
      0080AE 84               [ 1]  141 	pop	a
                                    142 ;	user/main.c: 28: CLK_HSICmd(ENABLE);
      0080AF 4B 01            [ 1]  143 	push	#0x01
      0080B1 CD 82 B7         [ 4]  144 	call	_CLK_HSICmd
      0080B4 84               [ 1]  145 	pop	a
                                    146 ;	user/main.c: 29: while(CLK_GetFlagStatus(CLK_FLAG_HSIRDY) == FALSE);
      0080B5                        147 00101$:
      0080B5 4B 02            [ 1]  148 	push	#0x02
      0080B7 4B 01            [ 1]  149 	push	#0x01
      0080B9 CD 85 5B         [ 4]  150 	call	_CLK_GetFlagStatus
      0080BC 85               [ 2]  151 	popw	x
      0080BD 4D               [ 1]  152 	tnz	a
      0080BE 27 F5            [ 1]  153 	jreq	00101$
                                    154 ;	user/main.c: 30: CLK_ClockSwitchCmd(ENABLE);
      0080C0 4B 01            [ 1]  155 	push	#0x01
      0080C2 CD 82 E7         [ 4]  156 	call	_CLK_ClockSwitchCmd
      0080C5 84               [ 1]  157 	pop	a
                                    158 ;	user/main.c: 31: CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
      0080C6 4B 00            [ 1]  159 	push	#0x00
      0080C8 CD 84 2A         [ 4]  160 	call	_CLK_HSIPrescalerConfig
      0080CB 84               [ 1]  161 	pop	a
                                    162 ;	user/main.c: 32: CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV2);
      0080CC 4B 81            [ 1]  163 	push	#0x81
      0080CE CD 84 A1         [ 4]  164 	call	_CLK_SYSCLKConfig
      0080D1 84               [ 1]  165 	pop	a
                                    166 ;	user/main.c: 33: CLK_ClockSwitchConfig(CLK_SWITCHMODE_AUTO, CLK_SOURCE_HSI, DISABLE, CLK_CURRENTCLOCKSTATE_ENABLE);
      0080D2 4B 01            [ 1]  167 	push	#0x01
      0080D4 4B 00            [ 1]  168 	push	#0x00
      0080D6 4B E1            [ 1]  169 	push	#0xe1
      0080D8 4B 01            [ 1]  170 	push	#0x01
      0080DA CD 83 65         [ 4]  171 	call	_CLK_ClockSwitchConfig
      0080DD 5B 04            [ 2]  172 	addw	sp, #4
                                    173 ;	user/main.c: 35: CLK_PeripheralClockConfig(CLK_PERIPHERAL_ADC, DISABLE);
      0080DF 4B 00            [ 1]  174 	push	#0x00
      0080E1 4B 13            [ 1]  175 	push	#0x13
      0080E3 CD 83 0F         [ 4]  176 	call	_CLK_PeripheralClockConfig
      0080E6 85               [ 2]  177 	popw	x
                                    178 ;	user/main.c: 36: CLK_PeripheralClockConfig(CLK_PERIPHERAL_AWU, DISABLE);
      0080E7 4B 00            [ 1]  179 	push	#0x00
      0080E9 4B 12            [ 1]  180 	push	#0x12
      0080EB CD 83 0F         [ 4]  181 	call	_CLK_PeripheralClockConfig
      0080EE 85               [ 2]  182 	popw	x
                                    183 ;	user/main.c: 37: CLK_PeripheralClockConfig(CLK_PERIPHERAL_UART1, DISABLE);
      0080EF 4B 00            [ 1]  184 	push	#0x00
      0080F1 4B 03            [ 1]  185 	push	#0x03
      0080F3 CD 83 0F         [ 4]  186 	call	_CLK_PeripheralClockConfig
      0080F6 85               [ 2]  187 	popw	x
                                    188 ;	user/main.c: 38: CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER1, DISABLE);
      0080F7 4B 00            [ 1]  189 	push	#0x00
      0080F9 4B 07            [ 1]  190 	push	#0x07
      0080FB CD 83 0F         [ 4]  191 	call	_CLK_PeripheralClockConfig
      0080FE 85               [ 2]  192 	popw	x
                                    193 ;	user/main.c: 39: CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER2, DISABLE);
      0080FF 4B 00            [ 1]  194 	push	#0x00
      008101 4B 05            [ 1]  195 	push	#0x05
      008103 CD 83 0F         [ 4]  196 	call	_CLK_PeripheralClockConfig
      008106 85               [ 2]  197 	popw	x
                                    198 ;	user/main.c: 40: CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER4, ENABLE);
      008107 4B 01            [ 1]  199 	push	#0x01
      008109 4B 04            [ 1]  200 	push	#0x04
      00810B CD 83 0F         [ 4]  201 	call	_CLK_PeripheralClockConfig
      00810E 85               [ 2]  202 	popw	x
      00810F 81               [ 4]  203 	ret
                                    204 ;	user/main.c: 43: INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 23)
                                    205 ;	-----------------------------------------
                                    206 ;	 function TIM4_UPD_OVF_IRQHandler
                                    207 ;	-----------------------------------------
      008110                        208 _TIM4_UPD_OVF_IRQHandler:
      008110 62               [ 2]  209 	div	x, a
                                    210 ;	user/main.c: 45: TIM4_ClearITPendingBit(TIM4_IT_UPDATE);
      008111 4B 01            [ 1]  211 	push	#0x01
      008113 CD 87 15         [ 4]  212 	call	_TIM4_ClearITPendingBit
      008116 84               [ 1]  213 	pop	a
                                    214 ;	user/main.c: 46: TIMER_Inc();
      008117 CD 81 64         [ 4]  215 	call	_TIMER_Inc
      00811A 80               [11]  216 	iret
                                    217 ;	user/main.c: 69: void delay(uint16_t x)
                                    218 ;	-----------------------------------------
                                    219 ;	 function delay
                                    220 ;	-----------------------------------------
      00811B                        221 _delay:
      00811B 89               [ 2]  222 	pushw	x
                                    223 ;	user/main.c: 71: while(x--);
      00811C 1E 05            [ 2]  224 	ldw	x, (0x05, sp)
      00811E                        225 00101$:
      00811E 1F 01            [ 2]  226 	ldw	(0x01, sp), x
      008120 5A               [ 2]  227 	decw	x
      008121 16 01            [ 2]  228 	ldw	y, (0x01, sp)
      008123 26 F9            [ 1]  229 	jrne	00101$
      008125 85               [ 2]  230 	popw	x
      008126 81               [ 4]  231 	ret
                                    232 ;	user/main.c: 74: void main() 
                                    233 ;	-----------------------------------------
                                    234 ;	 function main
                                    235 ;	-----------------------------------------
      008127                        236 _main:
                                    237 ;	user/main.c: 77: clock_setup();
      008127 CD 80 A0         [ 4]  238 	call	_clock_setup
                                    239 ;	user/main.c: 79: TIMER_Init();
      00812A CD 81 31         [ 4]  240 	call	_TIMER_Init
                                    241 ;	user/main.c: 81: enableInterrupts();
      00812D 9A               [ 1]  242 	rim
                                    243 ;	user/main.c: 82: while(1)
      00812E                        244 00102$:
      00812E 20 FE            [ 2]  245 	jra	00102$
      008130 81               [ 4]  246 	ret
                                    247 	.area CODE
                                    248 	.area INITIALIZER
                                    249 	.area CABS (ABS)
