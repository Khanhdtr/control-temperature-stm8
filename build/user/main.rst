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
                                     12 	.globl _delay_ms
                                     13 	.globl _delay
                                     14 	.globl _TIM4_UPD_OVF_IRQHandler
                                     15 	.globl _clock_setup
                                     16 	.globl _TIMER_Inc
                                     17 	.globl _TIMER_Init
                                     18 	.globl _TIM4_ClearITPendingBit
                                     19 	.globl _GPIO_WriteLow
                                     20 	.globl _GPIO_WriteHigh
                                     21 	.globl _GPIO_Init
                                     22 	.globl _CLK_GetFlagStatus
                                     23 	.globl _CLK_SYSCLKConfig
                                     24 	.globl _CLK_HSIPrescalerConfig
                                     25 	.globl _CLK_ClockSwitchConfig
                                     26 	.globl _CLK_PeripheralClockConfig
                                     27 	.globl _CLK_ClockSwitchCmd
                                     28 	.globl _CLK_LSICmd
                                     29 	.globl _CLK_HSICmd
                                     30 	.globl _CLK_HSECmd
                                     31 	.globl _CLK_DeInit
                                     32 	.globl _tick
                                     33 ;--------------------------------------------------------
                                     34 ; ram data
                                     35 ;--------------------------------------------------------
                                     36 	.area DATA
      000001                         37 _tick::
      000001                         38 	.ds 6
                                     39 ;--------------------------------------------------------
                                     40 ; ram data
                                     41 ;--------------------------------------------------------
                                     42 	.area INITIALIZED
                                     43 ;--------------------------------------------------------
                                     44 ; Stack segment in internal ram 
                                     45 ;--------------------------------------------------------
                                     46 	.area	SSEG
      000010                         47 __start__stack:
      000010                         48 	.ds	1
                                     49 
                                     50 ;--------------------------------------------------------
                                     51 ; absolute external ram data
                                     52 ;--------------------------------------------------------
                                     53 	.area DABS (ABS)
                                     54 ;--------------------------------------------------------
                                     55 ; interrupt vector 
                                     56 ;--------------------------------------------------------
                                     57 	.area HOME
      008000                         58 __interrupt_vect:
      008000 82 00 80 83             59 	int s_GSINIT ;reset
      008004 82 00 00 00             60 	int 0x0000 ;trap
      008008 82 00 00 00             61 	int 0x0000 ;int0
      00800C 82 00 00 00             62 	int 0x0000 ;int1
      008010 82 00 00 00             63 	int 0x0000 ;int2
      008014 82 00 00 00             64 	int 0x0000 ;int3
      008018 82 00 00 00             65 	int 0x0000 ;int4
      00801C 82 00 00 00             66 	int 0x0000 ;int5
      008020 82 00 00 00             67 	int 0x0000 ;int6
      008024 82 00 00 00             68 	int 0x0000 ;int7
      008028 82 00 00 00             69 	int 0x0000 ;int8
      00802C 82 00 00 00             70 	int 0x0000 ;int9
      008030 82 00 00 00             71 	int 0x0000 ;int10
      008034 82 00 00 00             72 	int 0x0000 ;int11
      008038 82 00 00 00             73 	int 0x0000 ;int12
      00803C 82 00 00 00             74 	int 0x0000 ;int13
      008040 82 00 00 00             75 	int 0x0000 ;int14
      008044 82 00 00 00             76 	int 0x0000 ;int15
      008048 82 00 00 00             77 	int 0x0000 ;int16
      00804C 82 00 00 00             78 	int 0x0000 ;int17
      008050 82 00 00 00             79 	int 0x0000 ;int18
      008054 82 00 00 00             80 	int 0x0000 ;int19
      008058 82 00 00 00             81 	int 0x0000 ;int20
      00805C 82 00 00 00             82 	int 0x0000 ;int21
      008060 82 00 00 00             83 	int 0x0000 ;int22
      008064 82 00 81 10             84 	int _TIM4_UPD_OVF_IRQHandler ;int23
      008068 82 00 00 00             85 	int 0x0000 ;int24
      00806C 82 00 00 00             86 	int 0x0000 ;int25
      008070 82 00 00 00             87 	int 0x0000 ;int26
      008074 82 00 00 00             88 	int 0x0000 ;int27
      008078 82 00 00 00             89 	int 0x0000 ;int28
      00807C 82 00 00 00             90 	int 0x0000 ;int29
                                     91 ;--------------------------------------------------------
                                     92 ; global & static initialisations
                                     93 ;--------------------------------------------------------
                                     94 	.area HOME
                                     95 	.area GSINIT
                                     96 	.area GSFINAL
                                     97 	.area GSINIT
      008083                         98 __sdcc_gs_init_startup:
      008083                         99 __sdcc_init_data:
                                    100 ; stm8_genXINIT() start
      008083 AE 00 0F         [ 2]  101 	ldw x, #l_DATA
      008086 27 07            [ 1]  102 	jreq	00002$
      008088                        103 00001$:
      008088 72 4F 00 00      [ 1]  104 	clr (s_DATA - 1, x)
      00808C 5A               [ 2]  105 	decw x
      00808D 26 F9            [ 1]  106 	jrne	00001$
      00808F                        107 00002$:
      00808F AE 00 00         [ 2]  108 	ldw	x, #l_INITIALIZER
      008092 27 09            [ 1]  109 	jreq	00004$
      008094                        110 00003$:
      008094 D6 87 C1         [ 1]  111 	ld	a, (s_INITIALIZER - 1, x)
      008097 D7 00 0F         [ 1]  112 	ld	(s_INITIALIZED - 1, x), a
      00809A 5A               [ 2]  113 	decw	x
      00809B 26 F7            [ 1]  114 	jrne	00003$
      00809D                        115 00004$:
                                    116 ; stm8_genXINIT() end
                                    117 	.area GSFINAL
      00809D CC 80 80         [ 2]  118 	jp	__sdcc_program_startup
                                    119 ;--------------------------------------------------------
                                    120 ; Home
                                    121 ;--------------------------------------------------------
                                    122 	.area HOME
                                    123 	.area HOME
      008080                        124 __sdcc_program_startup:
      008080 CC 81 3F         [ 2]  125 	jp	_main
                                    126 ;	return from main will return to caller
                                    127 ;--------------------------------------------------------
                                    128 ; code
                                    129 ;--------------------------------------------------------
                                    130 	.area CODE
                                    131 ;	user/main.c: 23: void clock_setup(void)
                                    132 ;	-----------------------------------------
                                    133 ;	 function clock_setup
                                    134 ;	-----------------------------------------
      0080A0                        135 _clock_setup:
                                    136 ;	user/main.c: 25: CLK_DeInit();
      0080A0 CD 82 A8         [ 4]  137 	call	_CLK_DeInit
                                    138 ;	user/main.c: 26: CLK_HSECmd(DISABLE);
      0080A3 4B 00            [ 1]  139 	push	#0x00
      0080A5 CD 82 F4         [ 4]  140 	call	_CLK_HSECmd
      0080A8 84               [ 1]  141 	pop	a
                                    142 ;	user/main.c: 27: CLK_LSICmd(DISABLE);
      0080A9 4B 00            [ 1]  143 	push	#0x00
      0080AB CD 83 10         [ 4]  144 	call	_CLK_LSICmd
      0080AE 84               [ 1]  145 	pop	a
                                    146 ;	user/main.c: 28: CLK_HSICmd(ENABLE);
      0080AF 4B 01            [ 1]  147 	push	#0x01
      0080B1 CD 83 02         [ 4]  148 	call	_CLK_HSICmd
      0080B4 84               [ 1]  149 	pop	a
                                    150 ;	user/main.c: 29: while(CLK_GetFlagStatus(CLK_FLAG_HSIRDY) == FALSE);
      0080B5                        151 00101$:
      0080B5 4B 02            [ 1]  152 	push	#0x02
      0080B7 4B 01            [ 1]  153 	push	#0x01
      0080B9 CD 85 A6         [ 4]  154 	call	_CLK_GetFlagStatus
      0080BC 85               [ 2]  155 	popw	x
      0080BD 4D               [ 1]  156 	tnz	a
      0080BE 27 F5            [ 1]  157 	jreq	00101$
                                    158 ;	user/main.c: 30: CLK_ClockSwitchCmd(ENABLE);
      0080C0 4B 01            [ 1]  159 	push	#0x01
      0080C2 CD 83 32         [ 4]  160 	call	_CLK_ClockSwitchCmd
      0080C5 84               [ 1]  161 	pop	a
                                    162 ;	user/main.c: 31: CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
      0080C6 4B 00            [ 1]  163 	push	#0x00
      0080C8 CD 84 75         [ 4]  164 	call	_CLK_HSIPrescalerConfig
      0080CB 84               [ 1]  165 	pop	a
                                    166 ;	user/main.c: 32: CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV2);
      0080CC 4B 81            [ 1]  167 	push	#0x81
      0080CE CD 84 EC         [ 4]  168 	call	_CLK_SYSCLKConfig
      0080D1 84               [ 1]  169 	pop	a
                                    170 ;	user/main.c: 33: CLK_ClockSwitchConfig(CLK_SWITCHMODE_AUTO, CLK_SOURCE_HSI, DISABLE, CLK_CURRENTCLOCKSTATE_ENABLE);
      0080D2 4B 01            [ 1]  171 	push	#0x01
      0080D4 4B 00            [ 1]  172 	push	#0x00
      0080D6 4B E1            [ 1]  173 	push	#0xe1
      0080D8 4B 01            [ 1]  174 	push	#0x01
      0080DA CD 83 B0         [ 4]  175 	call	_CLK_ClockSwitchConfig
      0080DD 5B 04            [ 2]  176 	addw	sp, #4
                                    177 ;	user/main.c: 35: CLK_PeripheralClockConfig(CLK_PERIPHERAL_ADC, DISABLE);
      0080DF 4B 00            [ 1]  178 	push	#0x00
      0080E1 4B 13            [ 1]  179 	push	#0x13
      0080E3 CD 83 5A         [ 4]  180 	call	_CLK_PeripheralClockConfig
      0080E6 85               [ 2]  181 	popw	x
                                    182 ;	user/main.c: 36: CLK_PeripheralClockConfig(CLK_PERIPHERAL_AWU, DISABLE);
      0080E7 4B 00            [ 1]  183 	push	#0x00
      0080E9 4B 12            [ 1]  184 	push	#0x12
      0080EB CD 83 5A         [ 4]  185 	call	_CLK_PeripheralClockConfig
      0080EE 85               [ 2]  186 	popw	x
                                    187 ;	user/main.c: 37: CLK_PeripheralClockConfig(CLK_PERIPHERAL_UART1, DISABLE);
      0080EF 4B 00            [ 1]  188 	push	#0x00
      0080F1 4B 03            [ 1]  189 	push	#0x03
      0080F3 CD 83 5A         [ 4]  190 	call	_CLK_PeripheralClockConfig
      0080F6 85               [ 2]  191 	popw	x
                                    192 ;	user/main.c: 38: CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER1, DISABLE);
      0080F7 4B 00            [ 1]  193 	push	#0x00
      0080F9 4B 07            [ 1]  194 	push	#0x07
      0080FB CD 83 5A         [ 4]  195 	call	_CLK_PeripheralClockConfig
      0080FE 85               [ 2]  196 	popw	x
                                    197 ;	user/main.c: 39: CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER2, DISABLE);
      0080FF 4B 00            [ 1]  198 	push	#0x00
      008101 4B 05            [ 1]  199 	push	#0x05
      008103 CD 83 5A         [ 4]  200 	call	_CLK_PeripheralClockConfig
      008106 85               [ 2]  201 	popw	x
                                    202 ;	user/main.c: 40: CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER4, ENABLE);
      008107 4B 01            [ 1]  203 	push	#0x01
      008109 4B 04            [ 1]  204 	push	#0x04
      00810B CD 83 5A         [ 4]  205 	call	_CLK_PeripheralClockConfig
      00810E 85               [ 2]  206 	popw	x
      00810F 81               [ 4]  207 	ret
                                    208 ;	user/main.c: 43: INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 23)
                                    209 ;	-----------------------------------------
                                    210 ;	 function TIM4_UPD_OVF_IRQHandler
                                    211 ;	-----------------------------------------
      008110                        212 _TIM4_UPD_OVF_IRQHandler:
      008110 62               [ 2]  213 	div	x, a
                                    214 ;	user/main.c: 45: TIM4_ClearITPendingBit(TIM4_IT_UPDATE);
      008111 4B 01            [ 1]  215 	push	#0x01
      008113 CD 87 60         [ 4]  216 	call	_TIM4_ClearITPendingBit
      008116 84               [ 1]  217 	pop	a
                                    218 ;	user/main.c: 46: TIMER_Inc();
      008117 CD 81 AF         [ 4]  219 	call	_TIMER_Inc
      00811A 80               [11]  220 	iret
                                    221 ;	user/main.c: 68: void delay(uint16_t x)
                                    222 ;	-----------------------------------------
                                    223 ;	 function delay
                                    224 ;	-----------------------------------------
      00811B                        225 _delay:
      00811B 89               [ 2]  226 	pushw	x
                                    227 ;	user/main.c: 70: while(x--);
      00811C 1E 05            [ 2]  228 	ldw	x, (0x05, sp)
      00811E                        229 00101$:
      00811E 1F 01            [ 2]  230 	ldw	(0x01, sp), x
      008120 5A               [ 2]  231 	decw	x
      008121 16 01            [ 2]  232 	ldw	y, (0x01, sp)
      008123 26 F9            [ 1]  233 	jrne	00101$
      008125 85               [ 2]  234 	popw	x
      008126 81               [ 4]  235 	ret
                                    236 ;	user/main.c: 72: void delay_ms(int time){
                                    237 ;	-----------------------------------------
                                    238 ;	 function delay_ms
                                    239 ;	-----------------------------------------
      008127                        240 _delay_ms:
      008127 89               [ 2]  241 	pushw	x
                                    242 ;	user/main.c: 73: while(time--){
      008128 1E 05            [ 2]  243 	ldw	x, (0x05, sp)
      00812A                        244 00101$:
      00812A 1F 01            [ 2]  245 	ldw	(0x01, sp), x
      00812C 5A               [ 2]  246 	decw	x
      00812D 16 01            [ 2]  247 	ldw	y, (0x01, sp)
      00812F 27 0C            [ 1]  248 	jreq	00104$
                                    249 ;	user/main.c: 74: delay(1000);
      008131 89               [ 2]  250 	pushw	x
      008132 4B E8            [ 1]  251 	push	#0xe8
      008134 4B 03            [ 1]  252 	push	#0x03
      008136 CD 81 1B         [ 4]  253 	call	_delay
      008139 85               [ 2]  254 	popw	x
      00813A 85               [ 2]  255 	popw	x
      00813B 20 ED            [ 2]  256 	jra	00101$
      00813D                        257 00104$:
      00813D 85               [ 2]  258 	popw	x
      00813E 81               [ 4]  259 	ret
                                    260 ;	user/main.c: 79: void main() 
                                    261 ;	-----------------------------------------
                                    262 ;	 function main
                                    263 ;	-----------------------------------------
      00813F                        264 _main:
                                    265 ;	user/main.c: 81: GPIO_Init(GPIOA,GPIO_PIN_1,GPIO_MODE_OUT_PP_LOW_SLOW);
      00813F 4B C0            [ 1]  266 	push	#0xc0
      008141 4B 02            [ 1]  267 	push	#0x02
      008143 4B 00            [ 1]  268 	push	#0x00
      008145 4B 50            [ 1]  269 	push	#0x50
      008147 CD 86 34         [ 4]  270 	call	_GPIO_Init
      00814A 5B 04            [ 2]  271 	addw	sp, #4
                                    272 ;	user/main.c: 83: clock_setup();
      00814C CD 80 A0         [ 4]  273 	call	_clock_setup
                                    274 ;	user/main.c: 85: TIMER_Init();
      00814F CD 81 7C         [ 4]  275 	call	_TIMER_Init
                                    276 ;	user/main.c: 87: enableInterrupts();
      008152 9A               [ 1]  277 	rim
                                    278 ;	user/main.c: 88: while(1)
      008153                        279 00102$:
                                    280 ;	user/main.c: 90: GPIO_WriteHigh(GPIOA,GPIO_PIN_1);
      008153 4B 02            [ 1]  281 	push	#0x02
      008155 4B 00            [ 1]  282 	push	#0x00
      008157 4B 50            [ 1]  283 	push	#0x50
      008159 CD 86 C8         [ 4]  284 	call	_GPIO_WriteHigh
      00815C 5B 03            [ 2]  285 	addw	sp, #3
                                    286 ;	user/main.c: 91: delay_ms(1000);
      00815E 4B E8            [ 1]  287 	push	#0xe8
      008160 4B 03            [ 1]  288 	push	#0x03
      008162 CD 81 27         [ 4]  289 	call	_delay_ms
      008165 85               [ 2]  290 	popw	x
                                    291 ;	user/main.c: 92: GPIO_WriteLow(GPIOA,GPIO_PIN_1);
      008166 4B 02            [ 1]  292 	push	#0x02
      008168 4B 00            [ 1]  293 	push	#0x00
      00816A 4B 50            [ 1]  294 	push	#0x50
      00816C CD 86 CF         [ 4]  295 	call	_GPIO_WriteLow
      00816F 5B 03            [ 2]  296 	addw	sp, #3
                                    297 ;	user/main.c: 93: delay_ms(1000);
      008171 4B E8            [ 1]  298 	push	#0xe8
      008173 4B 03            [ 1]  299 	push	#0x03
      008175 CD 81 27         [ 4]  300 	call	_delay_ms
      008178 85               [ 2]  301 	popw	x
      008179 20 D8            [ 2]  302 	jra	00102$
      00817B 81               [ 4]  303 	ret
                                    304 	.area CODE
                                    305 	.area INITIALIZER
                                    306 	.area CABS (ABS)
