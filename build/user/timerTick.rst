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
      008366                         67 _TIMER_Init:
                                     68 ;	user/timerTick.c: 20: CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER4 , ENABLE); 
      008366 4B 01            [ 1]   69 	push	#0x01
      008368 4B 04            [ 1]   70 	push	#0x04
      00836A CD 85 C3         [ 4]   71 	call	_CLK_PeripheralClockConfig
      00836D 85               [ 2]   72 	popw	x
                                     73 ;	user/timerTick.c: 21: TIM4_DeInit(); 
      00836E CD 89 78         [ 4]   74 	call	_TIM4_DeInit
                                     75 ;	user/timerTick.c: 23: TIM4_TimeBaseInit(TIM4_PRESCALER_16, CYCLE_US);
      008371 4B E8            [ 1]   76 	push	#0xe8
      008373 4B 04            [ 1]   77 	push	#0x04
      008375 CD 89 91         [ 4]   78 	call	_TIM4_TimeBaseInit
      008378 85               [ 2]   79 	popw	x
                                     80 ;	user/timerTick.c: 24: TIM4_ClearFlag(TIM4_FLAG_UPDATE); 
      008379 4B 01            [ 1]   81 	push	#0x01
      00837B CD 89 C1         [ 4]   82 	call	_TIM4_ClearFlag
      00837E 84               [ 1]   83 	pop	a
                                     84 ;	user/timerTick.c: 25: TIM4_ITConfig(TIM4_IT_UPDATE, ENABLE);
      00837F 4B 01            [ 1]   85 	push	#0x01
      008381 4B 01            [ 1]   86 	push	#0x01
      008383 CD 89 A3         [ 4]   87 	call	_TIM4_ITConfig
      008386 85               [ 2]   88 	popw	x
                                     89 ;	user/timerTick.c: 26: TIM4_Cmd(ENABLE);    // Enable TIM4 
      008387 4B 01            [ 1]   90 	push	#0x01
      008389 CD 89 9E         [ 4]   91 	call	_TIM4_Cmd
      00838C 84               [ 1]   92 	pop	a
                                     93 ;	user/timerTick.c: 27: timeTickMs = 0;
      00838D 5F               [ 1]   94 	clrw	x
      00838E CF 00 0D         [ 2]   95 	ldw	_timeTickMs+2, x
      008391 CF 00 0B         [ 2]   96 	ldw	_timeTickMs+0, x
                                     97 ;	user/timerTick.c: 28: timeTickUs = 0;
      008394 72 5F 00 0F      [ 1]   98 	clr	_timeTickUs+0
      008398 81               [ 4]   99 	ret
                                    100 ;	user/timerTick.c: 31: void TIMER_Inc(void)
                                    101 ;	-----------------------------------------
                                    102 ;	 function TIMER_Inc
                                    103 ;	-----------------------------------------
      008399                        104 _TIMER_Inc:
                                    105 ;	user/timerTick.c: 33: timeTickUs++;
      008399 72 5C 00 0F      [ 1]  106 	inc	_timeTickUs+0
                                    107 ;	user/timerTick.c: 35: if(timeTickUs%5 == 0){
      00839D 5F               [ 1]  108 	clrw	x
      00839E C6 00 0F         [ 1]  109 	ld	a, _timeTickUs+0
      0083A1 97               [ 1]  110 	ld	xl, a
      0083A2 A6 05            [ 1]  111 	ld	a, #0x05
      0083A4 62               [ 2]  112 	div	x, a
      0083A5 4D               [ 1]  113 	tnz	a
      0083A6 27 01            [ 1]  114 	jreq	00109$
      0083A8 81               [ 4]  115 	ret
      0083A9                        116 00109$:
                                    117 ;	user/timerTick.c: 36: timeTickMs++;
      0083A9 CE 00 0D         [ 2]  118 	ldw	x, _timeTickMs+2
      0083AC 1C 00 01         [ 2]  119 	addw	x, #0x0001
      0083AF C6 00 0C         [ 1]  120 	ld	a, _timeTickMs+1
      0083B2 A9 00            [ 1]  121 	adc	a, #0x00
      0083B4 90 97            [ 1]  122 	ld	yl, a
      0083B6 C6 00 0B         [ 1]  123 	ld	a, _timeTickMs+0
      0083B9 A9 00            [ 1]  124 	adc	a, #0x00
      0083BB 90 95            [ 1]  125 	ld	yh, a
      0083BD CF 00 0D         [ 2]  126 	ldw	_timeTickMs+2, x
      0083C0 90 CF 00 0B      [ 2]  127 	ldw	_timeTickMs+0, y
      0083C4 81               [ 4]  128 	ret
                                    129 ;	user/timerTick.c: 40: void TIMER_InitTime(TIME *pTime)
                                    130 ;	-----------------------------------------
                                    131 ;	 function TIMER_InitTime
                                    132 ;	-----------------------------------------
      0083C5                        133 _TIMER_InitTime:
                                    134 ;	user/timerTick.c: 42: pTime->timeMS = timeTickMs;
      0083C5 1E 03            [ 2]  135 	ldw	x, (0x03, sp)
      0083C7 5C               [ 2]  136 	incw	x
      0083C8 5C               [ 2]  137 	incw	x
      0083C9 90 CE 00 0D      [ 2]  138 	ldw	y, _timeTickMs+2
      0083CD EF 02            [ 2]  139 	ldw	(0x2, x), y
      0083CF 90 CE 00 0B      [ 2]  140 	ldw	y, _timeTickMs+0
      0083D3 FF               [ 2]  141 	ldw	(x), y
      0083D4 81               [ 4]  142 	ret
                                    143 ;	user/timerTick.c: 45: uint8_t TIMER_CheckTimeUS(TIME *pTime, uint16_t time)
                                    144 ;	-----------------------------------------
                                    145 ;	 function TIMER_CheckTimeUS
                                    146 ;	-----------------------------------------
      0083D5                        147 _TIMER_CheckTimeUS:
      0083D5 52 04            [ 2]  148 	sub	sp, #4
                                    149 ;	user/timerTick.c: 47: timeGet = TIM4_GetCounter();
      0083D7 CD 89 AE         [ 4]  150 	call	_TIM4_GetCounter
      0083DA 5F               [ 1]  151 	clrw	x
      0083DB 97               [ 1]  152 	ld	xl, a
      0083DC CF 00 07         [ 2]  153 	ldw	_timeGet+0, x
                                    154 ;	user/timerTick.c: 48: if(((timeGet > pTime->timeUS)&&((timeGet - pTime->timeUS) >= time))||((timeGet < pTime->timeUS)&&(((CYCLE_US -  pTime->timeUS) + timeGet + 1) >= time))){
      0083DF 16 07            [ 2]  155 	ldw	y, (0x07, sp)
      0083E1 17 03            [ 2]  156 	ldw	(0x03, sp), y
      0083E3 1E 03            [ 2]  157 	ldw	x, (0x03, sp)
      0083E5 FE               [ 2]  158 	ldw	x, (x)
      0083E6 1F 01            [ 2]  159 	ldw	(0x01, sp), x
      0083E8 1E 01            [ 2]  160 	ldw	x, (0x01, sp)
      0083EA C3 00 07         [ 2]  161 	cpw	x, _timeGet+0
      0083ED 24 0A            [ 1]  162 	jrnc	00105$
      0083EF CE 00 07         [ 2]  163 	ldw	x, _timeGet+0
      0083F2 72 F0 01         [ 2]  164 	subw	x, (0x01, sp)
      0083F5 13 09            [ 2]  165 	cpw	x, (0x09, sp)
      0083F7 24 14            [ 1]  166 	jrnc	00101$
      0083F9                        167 00105$:
      0083F9 1E 01            [ 2]  168 	ldw	x, (0x01, sp)
      0083FB C3 00 07         [ 2]  169 	cpw	x, _timeGet+0
      0083FE 23 17            [ 2]  170 	jrule	00102$
      008400 CE 00 07         [ 2]  171 	ldw	x, _timeGet+0
      008403 1C 03 E9         [ 2]  172 	addw	x, #0x03e9
      008406 72 F0 01         [ 2]  173 	subw	x, (0x01, sp)
      008409 13 09            [ 2]  174 	cpw	x, (0x09, sp)
      00840B 25 0A            [ 1]  175 	jrc	00102$
      00840D                        176 00101$:
                                    177 ;	user/timerTick.c: 49: pTime->timeUS = timeGet;
      00840D 1E 03            [ 2]  178 	ldw	x, (0x03, sp)
      00840F 90 CE 00 07      [ 2]  179 	ldw	y, _timeGet+0
      008413 FF               [ 2]  180 	ldw	(x), y
                                    181 ;	user/timerTick.c: 50: return 0;
      008414 4F               [ 1]  182 	clr	a
      008415 20 02            [ 2]  183 	jra	00106$
      008417                        184 00102$:
                                    185 ;	user/timerTick.c: 52: return 1;
      008417 A6 01            [ 1]  186 	ld	a, #0x01
      008419                        187 00106$:
      008419 5B 04            [ 2]  188 	addw	sp, #4
      00841B 81               [ 4]  189 	ret
                                    190 ;	user/timerTick.c: 55: uint8_t TIMER_CheckTimeMS(TIME *pTime, uint32_t time)
                                    191 ;	-----------------------------------------
                                    192 ;	 function TIMER_CheckTimeMS
                                    193 ;	-----------------------------------------
      00841C                        194 _TIMER_CheckTimeMS:
      00841C 52 0B            [ 2]  195 	sub	sp, #11
                                    196 ;	user/timerTick.c: 57: if(((timeTickMs > pTime->timeMS)&&((timeTickMs - pTime->timeMS) >= time))||((timeTickMs < pTime->timeMS)&&(((CYCLE_MS -  pTime->timeMS) + timeTickMs + 1) >= time))){
      00841E 1E 0E            [ 2]  197 	ldw	x, (0x0e, sp)
      008420 5C               [ 2]  198 	incw	x
      008421 5C               [ 2]  199 	incw	x
      008422 1F 0A            [ 2]  200 	ldw	(0x0a, sp), x
      008424 1E 0A            [ 2]  201 	ldw	x, (0x0a, sp)
      008426 E6 03            [ 1]  202 	ld	a, (0x3, x)
      008428 6B 09            [ 1]  203 	ld	(0x09, sp), a
      00842A E6 02            [ 1]  204 	ld	a, (0x2, x)
      00842C 6B 08            [ 1]  205 	ld	(0x08, sp), a
      00842E FE               [ 2]  206 	ldw	x, (x)
      00842F 1F 06            [ 2]  207 	ldw	(0x06, sp), x
      008431 CE 00 0D         [ 2]  208 	ldw	x, _timeTickMs+2
      008434 72 F0 08         [ 2]  209 	subw	x, (0x08, sp)
      008437 C6 00 0C         [ 1]  210 	ld	a, _timeTickMs+1
      00843A 12 07            [ 1]  211 	sbc	a, (0x07, sp)
      00843C 88               [ 1]  212 	push	a
      00843D C6 00 0B         [ 1]  213 	ld	a, _timeTickMs+0
      008440 12 07            [ 1]  214 	sbc	a, (0x07, sp)
      008442 6B 03            [ 1]  215 	ld	(0x03, sp), a
      008444 84               [ 1]  216 	pop	a
      008445 88               [ 1]  217 	push	a
      008446 13 13            [ 2]  218 	cpw	x, (0x13, sp)
      008448 84               [ 1]  219 	pop	a
      008449 12 11            [ 1]  220 	sbc	a, (0x11, sp)
      00844B 7B 02            [ 1]  221 	ld	a, (0x02, sp)
      00844D 12 10            [ 1]  222 	sbc	a, (0x10, sp)
      00844F 4F               [ 1]  223 	clr	a
      008450 49               [ 1]  224 	rlc	a
      008451 6B 01            [ 1]  225 	ld	(0x01, sp), a
      008453 1E 08            [ 2]  226 	ldw	x, (0x08, sp)
      008455 C3 00 0D         [ 2]  227 	cpw	x, _timeTickMs+2
      008458 7B 07            [ 1]  228 	ld	a, (0x07, sp)
      00845A C2 00 0C         [ 1]  229 	sbc	a, _timeTickMs+1
      00845D 7B 06            [ 1]  230 	ld	a, (0x06, sp)
      00845F C2 00 0B         [ 1]  231 	sbc	a, _timeTickMs+0
      008462 24 04            [ 1]  232 	jrnc	00105$
      008464 0D 01            [ 1]  233 	tnz	(0x01, sp)
      008466 27 15            [ 1]  234 	jreq	00101$
      008468                        235 00105$:
      008468 CE 00 0D         [ 2]  236 	ldw	x, _timeTickMs+2
      00846B 13 08            [ 2]  237 	cpw	x, (0x08, sp)
      00846D C6 00 0C         [ 1]  238 	ld	a, _timeTickMs+1
      008470 12 07            [ 1]  239 	sbc	a, (0x07, sp)
      008472 C6 00 0B         [ 1]  240 	ld	a, _timeTickMs+0
      008475 12 06            [ 1]  241 	sbc	a, (0x06, sp)
      008477 24 14            [ 1]  242 	jrnc	00102$
      008479 0D 01            [ 1]  243 	tnz	(0x01, sp)
      00847B 26 10            [ 1]  244 	jrne	00102$
      00847D                        245 00101$:
                                    246 ;	user/timerTick.c: 58: pTime->timeMS = timeTickMs;
      00847D 1E 0A            [ 2]  247 	ldw	x, (0x0a, sp)
      00847F 90 CE 00 0D      [ 2]  248 	ldw	y, _timeTickMs+2
      008483 EF 02            [ 2]  249 	ldw	(0x2, x), y
      008485 90 CE 00 0B      [ 2]  250 	ldw	y, _timeTickMs+0
      008489 FF               [ 2]  251 	ldw	(x), y
                                    252 ;	user/timerTick.c: 59: return 0;
      00848A 4F               [ 1]  253 	clr	a
      00848B 20 02            [ 2]  254 	jra	00106$
      00848D                        255 00102$:
                                    256 ;	user/timerTick.c: 61: return 1;
      00848D A6 01            [ 1]  257 	ld	a, #0x01
      00848F                        258 00106$:
      00848F 5B 0B            [ 2]  259 	addw	sp, #11
      008491 81               [ 4]  260 	ret
                                    261 	.area CODE
                                    262 	.area INITIALIZER
                                    263 	.area CABS (ABS)
