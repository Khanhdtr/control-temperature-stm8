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
      00817C                         67 _TIMER_Init:
                                     68 ;	user/timerTick.c: 20: CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER4 , ENABLE); 
      00817C 4B 01            [ 1]   69 	push	#0x01
      00817E 4B 04            [ 1]   70 	push	#0x04
      008180 CD 83 5A         [ 4]   71 	call	_CLK_PeripheralClockConfig
      008183 85               [ 2]   72 	popw	x
                                     73 ;	user/timerTick.c: 21: TIM4_DeInit(); 
      008184 CD 87 0F         [ 4]   74 	call	_TIM4_DeInit
                                     75 ;	user/timerTick.c: 23: TIM4_TimeBaseInit(TIM4_PRESCALER_16, CYCLE_US);
      008187 4B C8            [ 1]   76 	push	#0xc8
      008189 4B 04            [ 1]   77 	push	#0x04
      00818B CD 87 28         [ 4]   78 	call	_TIM4_TimeBaseInit
      00818E 85               [ 2]   79 	popw	x
                                     80 ;	user/timerTick.c: 24: TIM4_ClearFlag(TIM4_FLAG_UPDATE); 
      00818F 4B 01            [ 1]   81 	push	#0x01
      008191 CD 87 58         [ 4]   82 	call	_TIM4_ClearFlag
      008194 84               [ 1]   83 	pop	a
                                     84 ;	user/timerTick.c: 25: TIM4_ITConfig(TIM4_IT_UPDATE, ENABLE);
      008195 4B 01            [ 1]   85 	push	#0x01
      008197 4B 01            [ 1]   86 	push	#0x01
      008199 CD 87 3A         [ 4]   87 	call	_TIM4_ITConfig
      00819C 85               [ 2]   88 	popw	x
                                     89 ;	user/timerTick.c: 26: TIM4_Cmd(ENABLE);    // Enable TIM4 
      00819D 4B 01            [ 1]   90 	push	#0x01
      00819F CD 87 35         [ 4]   91 	call	_TIM4_Cmd
      0081A2 84               [ 1]   92 	pop	a
                                     93 ;	user/timerTick.c: 27: timeTickMs = 0;
      0081A3 5F               [ 1]   94 	clrw	x
      0081A4 CF 00 0D         [ 2]   95 	ldw	_timeTickMs+2, x
      0081A7 CF 00 0B         [ 2]   96 	ldw	_timeTickMs+0, x
                                     97 ;	user/timerTick.c: 28: timeTickUs = 0;
      0081AA 72 5F 00 0F      [ 1]   98 	clr	_timeTickUs+0
      0081AE 81               [ 4]   99 	ret
                                    100 ;	user/timerTick.c: 31: void TIMER_Inc(void)
                                    101 ;	-----------------------------------------
                                    102 ;	 function TIMER_Inc
                                    103 ;	-----------------------------------------
      0081AF                        104 _TIMER_Inc:
                                    105 ;	user/timerTick.c: 33: timeTickUs++;
      0081AF 72 5C 00 0F      [ 1]  106 	inc	_timeTickUs+0
                                    107 ;	user/timerTick.c: 34: if(timeTickUs%5 == 0){
      0081B3 5F               [ 1]  108 	clrw	x
      0081B4 C6 00 0F         [ 1]  109 	ld	a, _timeTickUs+0
      0081B7 97               [ 1]  110 	ld	xl, a
      0081B8 A6 05            [ 1]  111 	ld	a, #0x05
      0081BA 62               [ 2]  112 	div	x, a
      0081BB 4D               [ 1]  113 	tnz	a
      0081BC 27 01            [ 1]  114 	jreq	00109$
      0081BE 81               [ 4]  115 	ret
      0081BF                        116 00109$:
                                    117 ;	user/timerTick.c: 35: timeTickMs++;
      0081BF CE 00 0D         [ 2]  118 	ldw	x, _timeTickMs+2
      0081C2 1C 00 01         [ 2]  119 	addw	x, #0x0001
      0081C5 C6 00 0C         [ 1]  120 	ld	a, _timeTickMs+1
      0081C8 A9 00            [ 1]  121 	adc	a, #0x00
      0081CA 90 97            [ 1]  122 	ld	yl, a
      0081CC C6 00 0B         [ 1]  123 	ld	a, _timeTickMs+0
      0081CF A9 00            [ 1]  124 	adc	a, #0x00
      0081D1 90 95            [ 1]  125 	ld	yh, a
      0081D3 CF 00 0D         [ 2]  126 	ldw	_timeTickMs+2, x
      0081D6 90 CF 00 0B      [ 2]  127 	ldw	_timeTickMs+0, y
      0081DA 81               [ 4]  128 	ret
                                    129 ;	user/timerTick.c: 39: void TIMER_InitTime(TIME *pTime)
                                    130 ;	-----------------------------------------
                                    131 ;	 function TIMER_InitTime
                                    132 ;	-----------------------------------------
      0081DB                        133 _TIMER_InitTime:
                                    134 ;	user/timerTick.c: 41: pTime->timeMS = timeTickMs;
      0081DB 1E 03            [ 2]  135 	ldw	x, (0x03, sp)
      0081DD 5C               [ 2]  136 	incw	x
      0081DE 5C               [ 2]  137 	incw	x
      0081DF 90 CE 00 0D      [ 2]  138 	ldw	y, _timeTickMs+2
      0081E3 EF 02            [ 2]  139 	ldw	(0x2, x), y
      0081E5 90 CE 00 0B      [ 2]  140 	ldw	y, _timeTickMs+0
      0081E9 FF               [ 2]  141 	ldw	(x), y
      0081EA 81               [ 4]  142 	ret
                                    143 ;	user/timerTick.c: 44: uint8_t TIMER_CheckTimeUS(TIME *pTime, uint16_t time)
                                    144 ;	-----------------------------------------
                                    145 ;	 function TIMER_CheckTimeUS
                                    146 ;	-----------------------------------------
      0081EB                        147 _TIMER_CheckTimeUS:
      0081EB 52 04            [ 2]  148 	sub	sp, #4
                                    149 ;	user/timerTick.c: 46: timeGet = TIM4_GetCounter();
      0081ED CD 87 45         [ 4]  150 	call	_TIM4_GetCounter
      0081F0 5F               [ 1]  151 	clrw	x
      0081F1 97               [ 1]  152 	ld	xl, a
      0081F2 CF 00 07         [ 2]  153 	ldw	_timeGet+0, x
                                    154 ;	user/timerTick.c: 47: if(((timeGet > pTime->timeUS)&&((timeGet - pTime->timeUS) >= time))||((timeGet < pTime->timeUS)&&(((CYCLE_US -  pTime->timeUS) + timeGet + 1) >= time))){
      0081F5 16 07            [ 2]  155 	ldw	y, (0x07, sp)
      0081F7 17 01            [ 2]  156 	ldw	(0x01, sp), y
      0081F9 1E 01            [ 2]  157 	ldw	x, (0x01, sp)
      0081FB FE               [ 2]  158 	ldw	x, (x)
      0081FC 1F 03            [ 2]  159 	ldw	(0x03, sp), x
      0081FE 1E 03            [ 2]  160 	ldw	x, (0x03, sp)
      008200 C3 00 07         [ 2]  161 	cpw	x, _timeGet+0
      008203 24 0A            [ 1]  162 	jrnc	00105$
      008205 CE 00 07         [ 2]  163 	ldw	x, _timeGet+0
      008208 72 F0 03         [ 2]  164 	subw	x, (0x03, sp)
      00820B 13 09            [ 2]  165 	cpw	x, (0x09, sp)
      00820D 24 14            [ 1]  166 	jrnc	00101$
      00820F                        167 00105$:
      00820F 1E 03            [ 2]  168 	ldw	x, (0x03, sp)
      008211 C3 00 07         [ 2]  169 	cpw	x, _timeGet+0
      008214 23 17            [ 2]  170 	jrule	00102$
      008216 CE 00 07         [ 2]  171 	ldw	x, _timeGet+0
      008219 1C 00 C9         [ 2]  172 	addw	x, #0x00c9
      00821C 72 F0 03         [ 2]  173 	subw	x, (0x03, sp)
      00821F 13 09            [ 2]  174 	cpw	x, (0x09, sp)
      008221 25 0A            [ 1]  175 	jrc	00102$
      008223                        176 00101$:
                                    177 ;	user/timerTick.c: 48: pTime->timeUS = timeGet;
      008223 1E 01            [ 2]  178 	ldw	x, (0x01, sp)
      008225 90 CE 00 07      [ 2]  179 	ldw	y, _timeGet+0
      008229 FF               [ 2]  180 	ldw	(x), y
                                    181 ;	user/timerTick.c: 49: return 0;
      00822A 4F               [ 1]  182 	clr	a
      00822B 20 02            [ 2]  183 	jra	00106$
      00822D                        184 00102$:
                                    185 ;	user/timerTick.c: 51: return 1;
      00822D A6 01            [ 1]  186 	ld	a, #0x01
      00822F                        187 00106$:
      00822F 5B 04            [ 2]  188 	addw	sp, #4
      008231 81               [ 4]  189 	ret
                                    190 ;	user/timerTick.c: 54: uint8_t TIMER_CheckTimeMS(TIME *pTime, uint32_t time)
                                    191 ;	-----------------------------------------
                                    192 ;	 function TIMER_CheckTimeMS
                                    193 ;	-----------------------------------------
      008232                        194 _TIMER_CheckTimeMS:
      008232 52 0B            [ 2]  195 	sub	sp, #11
                                    196 ;	user/timerTick.c: 56: if(((timeTickMs > pTime->timeMS)&&((timeTickMs - pTime->timeMS) >= time))||((timeTickMs < pTime->timeMS)&&(((CYCLE_MS -  pTime->timeMS) + timeTickMs + 1) >= time))){
      008234 1E 0E            [ 2]  197 	ldw	x, (0x0e, sp)
      008236 5C               [ 2]  198 	incw	x
      008237 5C               [ 2]  199 	incw	x
      008238 1F 0A            [ 2]  200 	ldw	(0x0a, sp), x
      00823A 1E 0A            [ 2]  201 	ldw	x, (0x0a, sp)
      00823C E6 03            [ 1]  202 	ld	a, (0x3, x)
      00823E 6B 09            [ 1]  203 	ld	(0x09, sp), a
      008240 E6 02            [ 1]  204 	ld	a, (0x2, x)
      008242 6B 08            [ 1]  205 	ld	(0x08, sp), a
      008244 FE               [ 2]  206 	ldw	x, (x)
      008245 1F 06            [ 2]  207 	ldw	(0x06, sp), x
      008247 CE 00 0D         [ 2]  208 	ldw	x, _timeTickMs+2
      00824A 72 F0 08         [ 2]  209 	subw	x, (0x08, sp)
      00824D C6 00 0C         [ 1]  210 	ld	a, _timeTickMs+1
      008250 12 07            [ 1]  211 	sbc	a, (0x07, sp)
      008252 88               [ 1]  212 	push	a
      008253 C6 00 0B         [ 1]  213 	ld	a, _timeTickMs+0
      008256 12 07            [ 1]  214 	sbc	a, (0x07, sp)
      008258 6B 03            [ 1]  215 	ld	(0x03, sp), a
      00825A 84               [ 1]  216 	pop	a
      00825B 88               [ 1]  217 	push	a
      00825C 13 13            [ 2]  218 	cpw	x, (0x13, sp)
      00825E 84               [ 1]  219 	pop	a
      00825F 12 11            [ 1]  220 	sbc	a, (0x11, sp)
      008261 7B 02            [ 1]  221 	ld	a, (0x02, sp)
      008263 12 10            [ 1]  222 	sbc	a, (0x10, sp)
      008265 4F               [ 1]  223 	clr	a
      008266 49               [ 1]  224 	rlc	a
      008267 6B 01            [ 1]  225 	ld	(0x01, sp), a
      008269 1E 08            [ 2]  226 	ldw	x, (0x08, sp)
      00826B C3 00 0D         [ 2]  227 	cpw	x, _timeTickMs+2
      00826E 7B 07            [ 1]  228 	ld	a, (0x07, sp)
      008270 C2 00 0C         [ 1]  229 	sbc	a, _timeTickMs+1
      008273 7B 06            [ 1]  230 	ld	a, (0x06, sp)
      008275 C2 00 0B         [ 1]  231 	sbc	a, _timeTickMs+0
      008278 24 04            [ 1]  232 	jrnc	00105$
      00827A 0D 01            [ 1]  233 	tnz	(0x01, sp)
      00827C 27 15            [ 1]  234 	jreq	00101$
      00827E                        235 00105$:
      00827E CE 00 0D         [ 2]  236 	ldw	x, _timeTickMs+2
      008281 13 08            [ 2]  237 	cpw	x, (0x08, sp)
      008283 C6 00 0C         [ 1]  238 	ld	a, _timeTickMs+1
      008286 12 07            [ 1]  239 	sbc	a, (0x07, sp)
      008288 C6 00 0B         [ 1]  240 	ld	a, _timeTickMs+0
      00828B 12 06            [ 1]  241 	sbc	a, (0x06, sp)
      00828D 24 14            [ 1]  242 	jrnc	00102$
      00828F 0D 01            [ 1]  243 	tnz	(0x01, sp)
      008291 26 10            [ 1]  244 	jrne	00102$
      008293                        245 00101$:
                                    246 ;	user/timerTick.c: 57: pTime->timeMS = timeTickMs;
      008293 1E 0A            [ 2]  247 	ldw	x, (0x0a, sp)
      008295 90 CE 00 0D      [ 2]  248 	ldw	y, _timeTickMs+2
      008299 EF 02            [ 2]  249 	ldw	(0x2, x), y
      00829B 90 CE 00 0B      [ 2]  250 	ldw	y, _timeTickMs+0
      00829F FF               [ 2]  251 	ldw	(x), y
                                    252 ;	user/timerTick.c: 58: return 0;
      0082A0 4F               [ 1]  253 	clr	a
      0082A1 20 02            [ 2]  254 	jra	00106$
      0082A3                        255 00102$:
                                    256 ;	user/timerTick.c: 60: return 1;
      0082A3 A6 01            [ 1]  257 	ld	a, #0x01
      0082A5                        258 00106$:
      0082A5 5B 0B            [ 2]  259 	addw	sp, #11
      0082A7 81               [ 4]  260 	ret
                                    261 	.area CODE
                                    262 	.area INITIALIZER
                                    263 	.area CABS (ABS)
