                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 3.6.0 #9615 (Mac OS X x86_64)
                                      4 ;--------------------------------------------------------
                                      5 	.module timerTick
                                      6 	.optsdcc -mstm8
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _TIM4_ClearFlag
                                     12 	.globl _TIM4_GetCounter
                                     13 	.globl _TIM4_ITConfig
                                     14 	.globl _TIM4_Cmd
                                     15 	.globl _TIM4_TimeBaseInit
                                     16 	.globl _TIM4_DeInit
                                     17 	.globl _CLK_PeripheralClockConfig
                                     18 	.globl _timeTickUs
                                     19 	.globl _timeTickMs
                                     20 	.globl _timeBack
                                     21 	.globl _timeGet
                                     22 	.globl _TIMER_Init
                                     23 	.globl _TIMER_Inc
                                     24 	.globl _TIMER_InitTime
                                     25 	.globl _TIMER_CheckTimeUS
                                     26 	.globl _TIMER_CheckTimeMS
                                     27 ;--------------------------------------------------------
                                     28 ; ram data
                                     29 ;--------------------------------------------------------
                                     30 	.area DATA
      000007                         31 _timeGet::
      000007                         32 	.ds 2
      000009                         33 _timeBack::
      000009                         34 	.ds 2
      00000B                         35 _timeTickMs::
      00000B                         36 	.ds 4
      00000F                         37 _timeTickUs::
      00000F                         38 	.ds 1
                                     39 ;--------------------------------------------------------
                                     40 ; ram data
                                     41 ;--------------------------------------------------------
                                     42 	.area INITIALIZED
                                     43 ;--------------------------------------------------------
                                     44 ; absolute external ram data
                                     45 ;--------------------------------------------------------
                                     46 	.area DABS (ABS)
                                     47 ;--------------------------------------------------------
                                     48 ; global & static initialisations
                                     49 ;--------------------------------------------------------
                                     50 	.area HOME
                                     51 	.area GSINIT
                                     52 	.area GSFINAL
                                     53 	.area GSINIT
                                     54 ;--------------------------------------------------------
                                     55 ; Home
                                     56 ;--------------------------------------------------------
                                     57 	.area HOME
                                     58 	.area HOME
                                     59 ;--------------------------------------------------------
                                     60 ; code
                                     61 ;--------------------------------------------------------
                                     62 	.area CODE
                                     63 ;	user/timerTick.c: 18: void TIMER_Init(void)
                                     64 ;	-----------------------------------------
                                     65 ;	 function TIMER_Init
                                     66 ;	-----------------------------------------
      008369                         67 _TIMER_Init:
                                     68 ;	user/timerTick.c: 20: CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER4 , ENABLE); 
      008369 4B 01            [ 1]   69 	push	#0x01
      00836B 4B 04            [ 1]   70 	push	#0x04
      00836D CD 85 C6         [ 4]   71 	call	_CLK_PeripheralClockConfig
      008370 85               [ 2]   72 	popw	x
                                     73 ;	user/timerTick.c: 21: TIM4_DeInit(); 
      008371 CD 90 CE         [ 4]   74 	call	_TIM4_DeInit
                                     75 ;	user/timerTick.c: 23: TIM4_TimeBaseInit(TIM4_PRESCALER_16, CYCLE_US);
      008374 4B E8            [ 1]   76 	push	#0xe8
      008376 4B 04            [ 1]   77 	push	#0x04
      008378 CD 90 E7         [ 4]   78 	call	_TIM4_TimeBaseInit
      00837B 85               [ 2]   79 	popw	x
                                     80 ;	user/timerTick.c: 24: TIM4_ClearFlag(TIM4_FLAG_UPDATE); 
      00837C 4B 01            [ 1]   81 	push	#0x01
      00837E CD 91 17         [ 4]   82 	call	_TIM4_ClearFlag
      008381 84               [ 1]   83 	pop	a
                                     84 ;	user/timerTick.c: 25: TIM4_ITConfig(TIM4_IT_UPDATE, ENABLE);
      008382 4B 01            [ 1]   85 	push	#0x01
      008384 4B 01            [ 1]   86 	push	#0x01
      008386 CD 90 F9         [ 4]   87 	call	_TIM4_ITConfig
      008389 85               [ 2]   88 	popw	x
                                     89 ;	user/timerTick.c: 26: TIM4_Cmd(ENABLE);    // Enable TIM4 
      00838A 4B 01            [ 1]   90 	push	#0x01
      00838C CD 90 F4         [ 4]   91 	call	_TIM4_Cmd
      00838F 84               [ 1]   92 	pop	a
                                     93 ;	user/timerTick.c: 27: timeTickMs = 0;
      008390 5F               [ 1]   94 	clrw	x
      008391 CF 00 0D         [ 2]   95 	ldw	_timeTickMs+2, x
      008394 CF 00 0B         [ 2]   96 	ldw	_timeTickMs+0, x
                                     97 ;	user/timerTick.c: 28: timeTickUs = 0;
      008397 72 5F 00 0F      [ 1]   98 	clr	_timeTickUs+0
      00839B 81               [ 4]   99 	ret
                                    100 ;	user/timerTick.c: 31: void TIMER_Inc(void)
                                    101 ;	-----------------------------------------
                                    102 ;	 function TIMER_Inc
                                    103 ;	-----------------------------------------
      00839C                        104 _TIMER_Inc:
                                    105 ;	user/timerTick.c: 33: timeTickUs++;
      00839C 72 5C 00 0F      [ 1]  106 	inc	_timeTickUs+0
                                    107 ;	user/timerTick.c: 35: if(timeTickUs%5 == 0){
      0083A0 5F               [ 1]  108 	clrw	x
      0083A1 C6 00 0F         [ 1]  109 	ld	a, _timeTickUs+0
      0083A4 97               [ 1]  110 	ld	xl, a
      0083A5 A6 05            [ 1]  111 	ld	a, #0x05
      0083A7 62               [ 2]  112 	div	x, a
      0083A8 4D               [ 1]  113 	tnz	a
      0083A9 27 01            [ 1]  114 	jreq	00109$
      0083AB 81               [ 4]  115 	ret
      0083AC                        116 00109$:
                                    117 ;	user/timerTick.c: 36: timeTickMs++;
      0083AC CE 00 0D         [ 2]  118 	ldw	x, _timeTickMs+2
      0083AF 1C 00 01         [ 2]  119 	addw	x, #0x0001
      0083B2 C6 00 0C         [ 1]  120 	ld	a, _timeTickMs+1
      0083B5 A9 00            [ 1]  121 	adc	a, #0x00
      0083B7 90 97            [ 1]  122 	ld	yl, a
      0083B9 C6 00 0B         [ 1]  123 	ld	a, _timeTickMs+0
      0083BC A9 00            [ 1]  124 	adc	a, #0x00
      0083BE 90 95            [ 1]  125 	ld	yh, a
      0083C0 CF 00 0D         [ 2]  126 	ldw	_timeTickMs+2, x
      0083C3 90 CF 00 0B      [ 2]  127 	ldw	_timeTickMs+0, y
      0083C7 81               [ 4]  128 	ret
                                    129 ;	user/timerTick.c: 40: void TIMER_InitTime(TIME *pTime)
                                    130 ;	-----------------------------------------
                                    131 ;	 function TIMER_InitTime
                                    132 ;	-----------------------------------------
      0083C8                        133 _TIMER_InitTime:
                                    134 ;	user/timerTick.c: 42: pTime->timeMS = timeTickMs;
      0083C8 1E 03            [ 2]  135 	ldw	x, (0x03, sp)
      0083CA 5C               [ 2]  136 	incw	x
      0083CB 5C               [ 2]  137 	incw	x
      0083CC 90 CE 00 0D      [ 2]  138 	ldw	y, _timeTickMs+2
      0083D0 EF 02            [ 2]  139 	ldw	(0x2, x), y
      0083D2 90 CE 00 0B      [ 2]  140 	ldw	y, _timeTickMs+0
      0083D6 FF               [ 2]  141 	ldw	(x), y
      0083D7 81               [ 4]  142 	ret
                                    143 ;	user/timerTick.c: 45: uint8_t TIMER_CheckTimeUS(TIME *pTime, uint16_t time)
                                    144 ;	-----------------------------------------
                                    145 ;	 function TIMER_CheckTimeUS
                                    146 ;	-----------------------------------------
      0083D8                        147 _TIMER_CheckTimeUS:
      0083D8 52 04            [ 2]  148 	sub	sp, #4
                                    149 ;	user/timerTick.c: 47: timeGet = TIM4_GetCounter();
      0083DA CD 91 04         [ 4]  150 	call	_TIM4_GetCounter
      0083DD 5F               [ 1]  151 	clrw	x
      0083DE 97               [ 1]  152 	ld	xl, a
      0083DF CF 00 07         [ 2]  153 	ldw	_timeGet+0, x
                                    154 ;	user/timerTick.c: 48: if(((timeGet > pTime->timeUS)&&((timeGet - pTime->timeUS) >= time))||((timeGet < pTime->timeUS)&&(((CYCLE_US -  pTime->timeUS) + timeGet + 1) >= time))){
      0083E2 16 07            [ 2]  155 	ldw	y, (0x07, sp)
      0083E4 17 03            [ 2]  156 	ldw	(0x03, sp), y
      0083E6 1E 03            [ 2]  157 	ldw	x, (0x03, sp)
      0083E8 FE               [ 2]  158 	ldw	x, (x)
      0083E9 1F 01            [ 2]  159 	ldw	(0x01, sp), x
      0083EB 1E 01            [ 2]  160 	ldw	x, (0x01, sp)
      0083ED C3 00 07         [ 2]  161 	cpw	x, _timeGet+0
      0083F0 24 0A            [ 1]  162 	jrnc	00105$
      0083F2 CE 00 07         [ 2]  163 	ldw	x, _timeGet+0
      0083F5 72 F0 01         [ 2]  164 	subw	x, (0x01, sp)
      0083F8 13 09            [ 2]  165 	cpw	x, (0x09, sp)
      0083FA 24 14            [ 1]  166 	jrnc	00101$
      0083FC                        167 00105$:
      0083FC 1E 01            [ 2]  168 	ldw	x, (0x01, sp)
      0083FE C3 00 07         [ 2]  169 	cpw	x, _timeGet+0
      008401 23 17            [ 2]  170 	jrule	00102$
      008403 CE 00 07         [ 2]  171 	ldw	x, _timeGet+0
      008406 1C 03 E9         [ 2]  172 	addw	x, #0x03e9
      008409 72 F0 01         [ 2]  173 	subw	x, (0x01, sp)
      00840C 13 09            [ 2]  174 	cpw	x, (0x09, sp)
      00840E 25 0A            [ 1]  175 	jrc	00102$
      008410                        176 00101$:
                                    177 ;	user/timerTick.c: 49: pTime->timeUS = timeGet;
      008410 1E 03            [ 2]  178 	ldw	x, (0x03, sp)
      008412 90 CE 00 07      [ 2]  179 	ldw	y, _timeGet+0
      008416 FF               [ 2]  180 	ldw	(x), y
                                    181 ;	user/timerTick.c: 50: return 0;
      008417 4F               [ 1]  182 	clr	a
      008418 20 02            [ 2]  183 	jra	00106$
      00841A                        184 00102$:
                                    185 ;	user/timerTick.c: 52: return 1;
      00841A A6 01            [ 1]  186 	ld	a, #0x01
      00841C                        187 00106$:
      00841C 5B 04            [ 2]  188 	addw	sp, #4
      00841E 81               [ 4]  189 	ret
                                    190 ;	user/timerTick.c: 55: uint8_t TIMER_CheckTimeMS(TIME *pTime, uint32_t time)
                                    191 ;	-----------------------------------------
                                    192 ;	 function TIMER_CheckTimeMS
                                    193 ;	-----------------------------------------
      00841F                        194 _TIMER_CheckTimeMS:
      00841F 52 0B            [ 2]  195 	sub	sp, #11
                                    196 ;	user/timerTick.c: 57: if(((timeTickMs > pTime->timeMS)&&((timeTickMs - pTime->timeMS) >= time))||((timeTickMs < pTime->timeMS)&&(((CYCLE_MS -  pTime->timeMS) + timeTickMs + 1) >= time))){
      008421 1E 0E            [ 2]  197 	ldw	x, (0x0e, sp)
      008423 5C               [ 2]  198 	incw	x
      008424 5C               [ 2]  199 	incw	x
      008425 1F 01            [ 2]  200 	ldw	(0x01, sp), x
      008427 1E 01            [ 2]  201 	ldw	x, (0x01, sp)
      008429 E6 03            [ 1]  202 	ld	a, (0x3, x)
      00842B 6B 0B            [ 1]  203 	ld	(0x0b, sp), a
      00842D E6 02            [ 1]  204 	ld	a, (0x2, x)
      00842F 6B 0A            [ 1]  205 	ld	(0x0a, sp), a
      008431 FE               [ 2]  206 	ldw	x, (x)
      008432 1F 08            [ 2]  207 	ldw	(0x08, sp), x
      008434 CE 00 0D         [ 2]  208 	ldw	x, _timeTickMs+2
      008437 72 F0 0A         [ 2]  209 	subw	x, (0x0a, sp)
      00843A C6 00 0C         [ 1]  210 	ld	a, _timeTickMs+1
      00843D 12 09            [ 1]  211 	sbc	a, (0x09, sp)
      00843F 88               [ 1]  212 	push	a
      008440 C6 00 0B         [ 1]  213 	ld	a, _timeTickMs+0
      008443 12 09            [ 1]  214 	sbc	a, (0x09, sp)
      008445 6B 05            [ 1]  215 	ld	(0x05, sp), a
      008447 84               [ 1]  216 	pop	a
      008448 88               [ 1]  217 	push	a
      008449 13 13            [ 2]  218 	cpw	x, (0x13, sp)
      00844B 84               [ 1]  219 	pop	a
      00844C 12 11            [ 1]  220 	sbc	a, (0x11, sp)
      00844E 7B 04            [ 1]  221 	ld	a, (0x04, sp)
      008450 12 10            [ 1]  222 	sbc	a, (0x10, sp)
      008452 4F               [ 1]  223 	clr	a
      008453 49               [ 1]  224 	rlc	a
      008454 6B 03            [ 1]  225 	ld	(0x03, sp), a
      008456 1E 0A            [ 2]  226 	ldw	x, (0x0a, sp)
      008458 C3 00 0D         [ 2]  227 	cpw	x, _timeTickMs+2
      00845B 7B 09            [ 1]  228 	ld	a, (0x09, sp)
      00845D C2 00 0C         [ 1]  229 	sbc	a, _timeTickMs+1
      008460 7B 08            [ 1]  230 	ld	a, (0x08, sp)
      008462 C2 00 0B         [ 1]  231 	sbc	a, _timeTickMs+0
      008465 24 04            [ 1]  232 	jrnc	00105$
      008467 0D 03            [ 1]  233 	tnz	(0x03, sp)
      008469 27 15            [ 1]  234 	jreq	00101$
      00846B                        235 00105$:
      00846B CE 00 0D         [ 2]  236 	ldw	x, _timeTickMs+2
      00846E 13 0A            [ 2]  237 	cpw	x, (0x0a, sp)
      008470 C6 00 0C         [ 1]  238 	ld	a, _timeTickMs+1
      008473 12 09            [ 1]  239 	sbc	a, (0x09, sp)
      008475 C6 00 0B         [ 1]  240 	ld	a, _timeTickMs+0
      008478 12 08            [ 1]  241 	sbc	a, (0x08, sp)
      00847A 24 14            [ 1]  242 	jrnc	00102$
      00847C 0D 03            [ 1]  243 	tnz	(0x03, sp)
      00847E 26 10            [ 1]  244 	jrne	00102$
      008480                        245 00101$:
                                    246 ;	user/timerTick.c: 58: pTime->timeMS = timeTickMs;
      008480 1E 01            [ 2]  247 	ldw	x, (0x01, sp)
      008482 90 CE 00 0D      [ 2]  248 	ldw	y, _timeTickMs+2
      008486 EF 02            [ 2]  249 	ldw	(0x2, x), y
      008488 90 CE 00 0B      [ 2]  250 	ldw	y, _timeTickMs+0
      00848C FF               [ 2]  251 	ldw	(x), y
                                    252 ;	user/timerTick.c: 59: return 0;
      00848D 4F               [ 1]  253 	clr	a
      00848E 20 02            [ 2]  254 	jra	00106$
      008490                        255 00102$:
                                    256 ;	user/timerTick.c: 61: return 1;
      008490 A6 01            [ 1]  257 	ld	a, #0x01
      008492                        258 00106$:
      008492 5B 0B            [ 2]  259 	addw	sp, #11
      008494 81               [ 4]  260 	ret
                                    261 	.area CODE
                                    262 	.area INITIALIZER
                                    263 	.area CABS (ABS)
