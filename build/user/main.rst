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
                                     12 	.globl _TIM4_UPD_OVF_IRQHandler
                                     13 	.globl _Printf
                                     14 	.globl _SetupSerialPort
                                     15 	.globl _TIMER_CheckTimeMS
                                     16 	.globl _TIMER_InitTime
                                     17 	.globl _TIMER_Inc
                                     18 	.globl _TIMER_Init
                                     19 	.globl _TIM4_ClearITPendingBit
                                     20 	.globl _I2C_Cmd
                                     21 	.globl _I2C_Init
                                     22 	.globl _I2C_DeInit
                                     23 	.globl _GPIO_WriteLow
                                     24 	.globl _GPIO_WriteHigh
                                     25 	.globl _GPIO_Init
                                     26 	.globl _CLK_GetFlagStatus
                                     27 	.globl _CLK_GetClockFreq
                                     28 	.globl _CLK_SYSCLKConfig
                                     29 	.globl _CLK_HSIPrescalerConfig
                                     30 	.globl _CLK_ClockSwitchConfig
                                     31 	.globl _CLK_PeripheralClockConfig
                                     32 	.globl _CLK_ClockSwitchCmd
                                     33 	.globl _CLK_LSICmd
                                     34 	.globl _CLK_HSICmd
                                     35 	.globl _CLK_HSECmd
                                     36 	.globl _CLK_DeInit
                                     37 	.globl _ToggleVar
                                     38 	.globl _tick
                                     39 	.globl _clock_setup
                                     40 	.globl _I2C_setup
                                     41 	.globl _GPIO_setup
                                     42 	.globl _Led_manager
                                     43 ;--------------------------------------------------------
                                     44 ; ram data
                                     45 ;--------------------------------------------------------
                                     46 	.area DATA
      000001                         47 _tick::
      000001                         48 	.ds 6
                                     49 ;--------------------------------------------------------
                                     50 ; ram data
                                     51 ;--------------------------------------------------------
                                     52 	.area INITIALIZED
      000010                         53 _ToggleVar::
      000010                         54 	.ds 1
                                     55 ;--------------------------------------------------------
                                     56 ; Stack segment in internal ram 
                                     57 ;--------------------------------------------------------
                                     58 	.area	SSEG
      009212                         59 __start__stack:
      009212                         60 	.ds	1
                                     61 
                                     62 ;--------------------------------------------------------
                                     63 ; absolute external ram data
                                     64 ;--------------------------------------------------------
                                     65 	.area DABS (ABS)
                                     66 ;--------------------------------------------------------
                                     67 ; interrupt vector 
                                     68 ;--------------------------------------------------------
                                     69 	.area HOME
      008000                         70 __interrupt_vect:
      008000 82 00 80 83             71 	int s_GSINIT ;reset
      008004 82 00 00 00             72 	int 0x0000 ;trap
      008008 82 00 00 00             73 	int 0x0000 ;int0
      00800C 82 00 00 00             74 	int 0x0000 ;int1
      008010 82 00 00 00             75 	int 0x0000 ;int2
      008014 82 00 00 00             76 	int 0x0000 ;int3
      008018 82 00 00 00             77 	int 0x0000 ;int4
      00801C 82 00 00 00             78 	int 0x0000 ;int5
      008020 82 00 00 00             79 	int 0x0000 ;int6
      008024 82 00 00 00             80 	int 0x0000 ;int7
      008028 82 00 00 00             81 	int 0x0000 ;int8
      00802C 82 00 00 00             82 	int 0x0000 ;int9
      008030 82 00 00 00             83 	int 0x0000 ;int10
      008034 82 00 00 00             84 	int 0x0000 ;int11
      008038 82 00 00 00             85 	int 0x0000 ;int12
      00803C 82 00 00 00             86 	int 0x0000 ;int13
      008040 82 00 00 00             87 	int 0x0000 ;int14
      008044 82 00 00 00             88 	int 0x0000 ;int15
      008048 82 00 00 00             89 	int 0x0000 ;int16
      00804C 82 00 00 00             90 	int 0x0000 ;int17
      008050 82 00 00 00             91 	int 0x0000 ;int18
      008054 82 00 00 00             92 	int 0x0000 ;int19
      008058 82 00 00 00             93 	int 0x0000 ;int20
      00805C 82 00 00 00             94 	int 0x0000 ;int21
      008060 82 00 00 00             95 	int 0x0000 ;int22
      008064 82 00 82 8A             96 	int _TIM4_UPD_OVF_IRQHandler ;int23
      008068 82 00 00 00             97 	int 0x0000 ;int24
      00806C 82 00 00 00             98 	int 0x0000 ;int25
      008070 82 00 00 00             99 	int 0x0000 ;int26
      008074 82 00 00 00            100 	int 0x0000 ;int27
      008078 82 00 00 00            101 	int 0x0000 ;int28
      00807C 82 00 00 00            102 	int 0x0000 ;int29
                                    103 ;--------------------------------------------------------
                                    104 ; global & static initialisations
                                    105 ;--------------------------------------------------------
                                    106 	.area HOME
                                    107 	.area GSINIT
                                    108 	.area GSFINAL
                                    109 	.area GSINIT
      008083                        110 __sdcc_gs_init_startup:
      008083                        111 __sdcc_init_data:
                                    112 ; stm8_genXINIT() start
      008083 AE 00 0F         [ 2]  113 	ldw x, #l_DATA
      008086 27 07            [ 1]  114 	jreq	00002$
      008088                        115 00001$:
      008088 72 4F 00 00      [ 1]  116 	clr (s_DATA - 1, x)
      00808C 5A               [ 2]  117 	decw x
      00808D 26 F9            [ 1]  118 	jrne	00001$
      00808F                        119 00002$:
      00808F AE 00 01         [ 2]  120 	ldw	x, #l_INITIALIZER
      008092 27 09            [ 1]  121 	jreq	00004$
      008094                        122 00003$:
      008094 D6 92 10         [ 1]  123 	ld	a, (s_INITIALIZER - 1, x)
      008097 D7 00 0F         [ 1]  124 	ld	(s_INITIALIZED - 1, x), a
      00809A 5A               [ 2]  125 	decw	x
      00809B 26 F7            [ 1]  126 	jrne	00003$
      00809D                        127 00004$:
                                    128 ; stm8_genXINIT() end
                                    129 	.area GSFINAL
      00809D CC 80 80         [ 2]  130 	jp	__sdcc_program_startup
                                    131 ;--------------------------------------------------------
                                    132 ; Home
                                    133 ;--------------------------------------------------------
                                    134 	.area HOME
                                    135 	.area HOME
      008080                        136 __sdcc_program_startup:
      008080 CC 83 2D         [ 2]  137 	jp	_main
                                    138 ;	return from main will return to caller
                                    139 ;--------------------------------------------------------
                                    140 ; code
                                    141 ;--------------------------------------------------------
                                    142 	.area CODE
                                    143 ;	user/main.c: 27: void clock_setup(void)
                                    144 ;	-----------------------------------------
                                    145 ;	 function clock_setup
                                    146 ;	-----------------------------------------
      00820A                        147 _clock_setup:
                                    148 ;	user/main.c: 29: CLK_DeInit();
      00820A CD 85 14         [ 4]  149 	call	_CLK_DeInit
                                    150 ;	user/main.c: 30: CLK_HSECmd(DISABLE);
      00820D 4B 00            [ 1]  151 	push	#0x00
      00820F CD 85 60         [ 4]  152 	call	_CLK_HSECmd
      008212 84               [ 1]  153 	pop	a
                                    154 ;	user/main.c: 31: CLK_LSICmd(DISABLE);
      008213 4B 00            [ 1]  155 	push	#0x00
      008215 CD 85 7C         [ 4]  156 	call	_CLK_LSICmd
      008218 84               [ 1]  157 	pop	a
                                    158 ;	user/main.c: 32: CLK_HSICmd(ENABLE);
      008219 4B 01            [ 1]  159 	push	#0x01
      00821B CD 85 6E         [ 4]  160 	call	_CLK_HSICmd
      00821E 84               [ 1]  161 	pop	a
                                    162 ;	user/main.c: 33: while(CLK_GetFlagStatus(CLK_FLAG_HSIRDY) == FALSE);
      00821F                        163 00101$:
      00821F 4B 02            [ 1]  164 	push	#0x02
      008221 4B 01            [ 1]  165 	push	#0x01
      008223 CD 88 12         [ 4]  166 	call	_CLK_GetFlagStatus
      008226 85               [ 2]  167 	popw	x
      008227 4D               [ 1]  168 	tnz	a
      008228 27 F5            [ 1]  169 	jreq	00101$
                                    170 ;	user/main.c: 34: CLK_ClockSwitchCmd(ENABLE);
      00822A 4B 01            [ 1]  171 	push	#0x01
      00822C CD 85 9E         [ 4]  172 	call	_CLK_ClockSwitchCmd
      00822F 84               [ 1]  173 	pop	a
                                    174 ;	user/main.c: 36: CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
      008230 4B 00            [ 1]  175 	push	#0x00
      008232 CD 86 E1         [ 4]  176 	call	_CLK_HSIPrescalerConfig
      008235 84               [ 1]  177 	pop	a
                                    178 ;	user/main.c: 39: CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV1 );
      008236 4B 80            [ 1]  179 	push	#0x80
      008238 CD 87 58         [ 4]  180 	call	_CLK_SYSCLKConfig
      00823B 84               [ 1]  181 	pop	a
                                    182 ;	user/main.c: 40: CLK_ClockSwitchConfig(CLK_SWITCHMODE_AUTO, CLK_SOURCE_HSI, DISABLE, CLK_CURRENTCLOCKSTATE_ENABLE);
      00823C 4B 01            [ 1]  183 	push	#0x01
      00823E 4B 00            [ 1]  184 	push	#0x00
      008240 4B E1            [ 1]  185 	push	#0xe1
      008242 4B 01            [ 1]  186 	push	#0x01
      008244 CD 86 1C         [ 4]  187 	call	_CLK_ClockSwitchConfig
      008247 5B 04            [ 2]  188 	addw	sp, #4
                                    189 ;	user/main.c: 42: CLK_PeripheralClockConfig(CLK_PERIPHERAL_SPI, DISABLE);
      008249 4B 00            [ 1]  190 	push	#0x00
      00824B 4B 01            [ 1]  191 	push	#0x01
      00824D CD 85 C6         [ 4]  192 	call	_CLK_PeripheralClockConfig
      008250 85               [ 2]  193 	popw	x
                                    194 ;	user/main.c: 43: CLK_PeripheralClockConfig(CLK_PERIPHERAL_I2C, ENABLE);
      008251 4B 01            [ 1]  195 	push	#0x01
      008253 4B 00            [ 1]  196 	push	#0x00
      008255 CD 85 C6         [ 4]  197 	call	_CLK_PeripheralClockConfig
      008258 85               [ 2]  198 	popw	x
                                    199 ;	user/main.c: 44: CLK_PeripheralClockConfig(CLK_PERIPHERAL_ADC, DISABLE);
      008259 4B 00            [ 1]  200 	push	#0x00
      00825B 4B 13            [ 1]  201 	push	#0x13
      00825D CD 85 C6         [ 4]  202 	call	_CLK_PeripheralClockConfig
      008260 85               [ 2]  203 	popw	x
                                    204 ;	user/main.c: 45: CLK_PeripheralClockConfig(CLK_PERIPHERAL_AWU, DISABLE);
      008261 4B 00            [ 1]  205 	push	#0x00
      008263 4B 12            [ 1]  206 	push	#0x12
      008265 CD 85 C6         [ 4]  207 	call	_CLK_PeripheralClockConfig
      008268 85               [ 2]  208 	popw	x
                                    209 ;	user/main.c: 46: CLK_PeripheralClockConfig(CLK_PERIPHERAL_UART1, ENABLE);
      008269 4B 01            [ 1]  210 	push	#0x01
      00826B 4B 03            [ 1]  211 	push	#0x03
      00826D CD 85 C6         [ 4]  212 	call	_CLK_PeripheralClockConfig
      008270 85               [ 2]  213 	popw	x
                                    214 ;	user/main.c: 47: CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER1, DISABLE);
      008271 4B 00            [ 1]  215 	push	#0x00
      008273 4B 07            [ 1]  216 	push	#0x07
      008275 CD 85 C6         [ 4]  217 	call	_CLK_PeripheralClockConfig
      008278 85               [ 2]  218 	popw	x
                                    219 ;	user/main.c: 48: CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER2, DISABLE);
      008279 4B 00            [ 1]  220 	push	#0x00
      00827B 4B 05            [ 1]  221 	push	#0x05
      00827D CD 85 C6         [ 4]  222 	call	_CLK_PeripheralClockConfig
      008280 85               [ 2]  223 	popw	x
                                    224 ;	user/main.c: 49: CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER4, ENABLE);
      008281 4B 01            [ 1]  225 	push	#0x01
      008283 4B 04            [ 1]  226 	push	#0x04
      008285 CD 85 C6         [ 4]  227 	call	_CLK_PeripheralClockConfig
      008288 85               [ 2]  228 	popw	x
      008289 81               [ 4]  229 	ret
                                    230 ;	user/main.c: 52: INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 23)
                                    231 ;	-----------------------------------------
                                    232 ;	 function TIM4_UPD_OVF_IRQHandler
                                    233 ;	-----------------------------------------
      00828A                        234 _TIM4_UPD_OVF_IRQHandler:
      00828A 62               [ 2]  235 	div	x, a
                                    236 ;	user/main.c: 54: TIM4_ClearITPendingBit(TIM4_IT_UPDATE);
      00828B 4B 01            [ 1]  237 	push	#0x01
      00828D CD 91 1F         [ 4]  238 	call	_TIM4_ClearITPendingBit
      008290 84               [ 1]  239 	pop	a
                                    240 ;	user/main.c: 55: TIMER_Inc();
      008291 CD 83 9C         [ 4]  241 	call	_TIMER_Inc
      008294 80               [11]  242 	iret
                                    243 ;	user/main.c: 59: void I2C_setup(void)
                                    244 ;	-----------------------------------------
                                    245 ;	 function I2C_setup
                                    246 ;	-----------------------------------------
      008295                        247 _I2C_setup:
                                    248 ;	user/main.c: 61: I2C_DeInit();
      008295 CD 89 7B         [ 4]  249 	call	_I2C_DeInit
                                    250 ;	user/main.c: 67: (CLK_GetClockFreq() / 1000000));
      008298 CD 87 A7         [ 4]  251 	call	_CLK_GetClockFreq
      00829B 4B 40            [ 1]  252 	push	#0x40
      00829D 4B 42            [ 1]  253 	push	#0x42
      00829F 4B 0F            [ 1]  254 	push	#0x0f
      0082A1 4B 00            [ 1]  255 	push	#0x00
      0082A3 89               [ 2]  256 	pushw	x
      0082A4 90 89            [ 2]  257 	pushw	y
      0082A6 CD 91 27         [ 4]  258 	call	__divulong
      0082A9 5B 08            [ 2]  259 	addw	sp, #8
      0082AB 9F               [ 1]  260 	ld	a, xl
                                    261 ;	user/main.c: 62: I2C_Init(100000, 
      0082AC 88               [ 1]  262 	push	a
      0082AD 4B 00            [ 1]  263 	push	#0x00
      0082AF 4B 01            [ 1]  264 	push	#0x01
      0082B1 4B 00            [ 1]  265 	push	#0x00
      0082B3 4B 46            [ 1]  266 	push	#0x46
      0082B5 4B 00            [ 1]  267 	push	#0x00
      0082B7 4B A0            [ 1]  268 	push	#0xa0
      0082B9 4B 86            [ 1]  269 	push	#0x86
      0082BB 4B 01            [ 1]  270 	push	#0x01
      0082BD 4B 00            [ 1]  271 	push	#0x00
      0082BF CD 89 A0         [ 4]  272 	call	_I2C_Init
      0082C2 5B 0A            [ 2]  273 	addw	sp, #10
                                    274 ;	user/main.c: 68: I2C_Cmd(ENABLE);
      0082C4 4B 01            [ 1]  275 	push	#0x01
      0082C6 CD 8B 8B         [ 4]  276 	call	_I2C_Cmd
      0082C9 84               [ 1]  277 	pop	a
      0082CA 81               [ 4]  278 	ret
                                    279 ;	user/main.c: 71: void GPIO_setup(void)
                                    280 ;	-----------------------------------------
                                    281 ;	 function GPIO_setup
                                    282 ;	-----------------------------------------
      0082CB                        283 _GPIO_setup:
                                    284 ;	user/main.c: 73: GPIO_Init(GPIOB, GPIO_PIN_4, GPIO_MODE_OUT_OD_HIZ_FAST);
      0082CB 4B B0            [ 1]  285 	push	#0xb0
      0082CD 4B 10            [ 1]  286 	push	#0x10
      0082CF 4B 05            [ 1]  287 	push	#0x05
      0082D1 4B 50            [ 1]  288 	push	#0x50
      0082D3 CD 88 A0         [ 4]  289 	call	_GPIO_Init
      0082D6 5B 04            [ 2]  290 	addw	sp, #4
                                    291 ;	user/main.c: 74: GPIO_Init(GPIOB, GPIO_PIN_5, GPIO_MODE_OUT_OD_HIZ_FAST);
      0082D8 4B B0            [ 1]  292 	push	#0xb0
      0082DA 4B 20            [ 1]  293 	push	#0x20
      0082DC 4B 05            [ 1]  294 	push	#0x05
      0082DE 4B 50            [ 1]  295 	push	#0x50
      0082E0 CD 88 A0         [ 4]  296 	call	_GPIO_Init
      0082E3 5B 04            [ 2]  297 	addw	sp, #4
                                    298 ;	user/main.c: 75: GPIO_Init(GPIOA,GPIO_PIN_1,GPIO_MODE_OUT_PP_LOW_SLOW);
      0082E5 4B C0            [ 1]  299 	push	#0xc0
      0082E7 4B 02            [ 1]  300 	push	#0x02
      0082E9 4B 00            [ 1]  301 	push	#0x00
      0082EB 4B 50            [ 1]  302 	push	#0x50
      0082ED CD 88 A0         [ 4]  303 	call	_GPIO_Init
      0082F0 5B 04            [ 2]  304 	addw	sp, #4
      0082F2 81               [ 4]  305 	ret
                                    306 ;	user/main.c: 95: void Led_manager (void)
                                    307 ;	-----------------------------------------
                                    308 ;	 function Led_manager
                                    309 ;	-----------------------------------------
      0082F3                        310 _Led_manager:
                                    311 ;	user/main.c: 97: if(TIMER_CheckTimeMS(&tick, 1000) == 0) ToggleVar = ~ToggleVar;  
      0082F3 AE 00 01         [ 2]  312 	ldw	x, #_tick+0
      0082F6 4B E8            [ 1]  313 	push	#0xe8
      0082F8 4B 03            [ 1]  314 	push	#0x03
      0082FA 4B 00            [ 1]  315 	push	#0x00
      0082FC 4B 00            [ 1]  316 	push	#0x00
      0082FE 89               [ 2]  317 	pushw	x
      0082FF CD 84 1F         [ 4]  318 	call	_TIMER_CheckTimeMS
      008302 5B 06            [ 2]  319 	addw	sp, #6
      008304 4D               [ 1]  320 	tnz	a
      008305 26 07            [ 1]  321 	jrne	00102$
      008307 C6 00 10         [ 1]  322 	ld	a, _ToggleVar+0
      00830A 43               [ 1]  323 	cpl	a
      00830B C7 00 10         [ 1]  324 	ld	_ToggleVar+0, a
      00830E                        325 00102$:
                                    326 ;	user/main.c: 98: if(ToggleVar == 0x01)   
      00830E C6 00 10         [ 1]  327 	ld	a, _ToggleVar+0
      008311 A1 01            [ 1]  328 	cp	a, #0x01
      008313 26 0C            [ 1]  329 	jrne	00104$
                                    330 ;	user/main.c: 99: GPIO_WriteHigh(GPIOA,GPIO_PIN_1);   
      008315 4B 02            [ 1]  331 	push	#0x02
      008317 4B 00            [ 1]  332 	push	#0x00
      008319 4B 50            [ 1]  333 	push	#0x50
      00831B CD 89 34         [ 4]  334 	call	_GPIO_WriteHigh
      00831E 5B 03            [ 2]  335 	addw	sp, #3
      008320 81               [ 4]  336 	ret
      008321                        337 00104$:
                                    338 ;	user/main.c: 101: GPIO_WriteLow(GPIOA,GPIO_PIN_1);
      008321 4B 02            [ 1]  339 	push	#0x02
      008323 4B 00            [ 1]  340 	push	#0x00
      008325 4B 50            [ 1]  341 	push	#0x50
      008327 CD 89 3B         [ 4]  342 	call	_GPIO_WriteLow
      00832A 5B 03            [ 2]  343 	addw	sp, #3
      00832C 81               [ 4]  344 	ret
                                    345 ;	user/main.c: 105: void main() 
                                    346 ;	-----------------------------------------
                                    347 ;	 function main
                                    348 ;	-----------------------------------------
      00832D                        349 _main:
                                    350 ;	user/main.c: 109: clock_setup();
      00832D CD 82 0A         [ 4]  351 	call	_clock_setup
                                    352 ;	user/main.c: 110: GPIO_setup();
      008330 CD 82 CB         [ 4]  353 	call	_GPIO_setup
                                    354 ;	user/main.c: 111: I2C_setup();
      008333 CD 82 95         [ 4]  355 	call	_I2C_setup
                                    356 ;	user/main.c: 113: TIMER_Init();
      008336 CD 83 69         [ 4]  357 	call	_TIMER_Init
                                    358 ;	user/main.c: 114: SetupSerialPort();
      008339 CD 84 95         [ 4]  359 	call	_SetupSerialPort
                                    360 ;	user/main.c: 116: enableInterrupts();
      00833C 9A               [ 1]  361 	rim
                                    362 ;	user/main.c: 117: TIMER_InitTime(&tick);
      00833D AE 00 01         [ 2]  363 	ldw	x, #_tick+0
      008340 89               [ 2]  364 	pushw	x
      008341 CD 83 C8         [ 4]  365 	call	_TIMER_InitTime
      008344 85               [ 2]  366 	popw	x
                                    367 ;	user/main.c: 118: while(1)
      008345                        368 00102$:
                                    369 ;	user/main.c: 120: Led_manager ();
      008345 CD 82 F3         [ 4]  370 	call	_Led_manager
                                    371 ;	user/main.c: 121: Printf("Hello from my program");
      008348 AE 83 53         [ 2]  372 	ldw	x, #___str_0+0
      00834B 89               [ 2]  373 	pushw	x
      00834C CD 84 FC         [ 4]  374 	call	_Printf
      00834F 85               [ 2]  375 	popw	x
      008350 20 F3            [ 2]  376 	jra	00102$
      008352 81               [ 4]  377 	ret
                                    378 	.area CODE
      008353                        379 ___str_0:
      008353 48 65 6C 6C 6F 20 66   380 	.ascii "Hello from my program"
             72 6F 6D 20 6D 79 20
             70 72 6F 67 72 61 6D
      008368 00                     381 	.db 0x00
                                    382 	.area INITIALIZER
      009211                        383 __xinit__ToggleVar:
      009211 01                     384 	.db #0x01	; 1
                                    385 	.area CABS (ABS)
