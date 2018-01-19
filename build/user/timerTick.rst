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
      008131                         67 _TIMER_Init:
                                     68 ;	user/timerTick.c: 20: CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER4 , ENABLE); 
      008131 4B 01            [ 1]   69 	push	#0x01
      008133 4B 04            [ 1]   70 	push	#0x04
      008135 CD 83 0F         [ 4]   71 	call	_CLK_PeripheralClockConfig
      008138 85               [ 2]   72 	popw	x
                                     73 ;	user/timerTick.c: 21: TIM4_DeInit(); 
      008139 CD 86 C4         [ 4]   74 	call	_TIM4_DeInit
                                     75 ;	user/timerTick.c: 23: TIM4_TimeBaseInit(TIM4_PRESCALER_16, CYCLE_US);
      00813C 4B C8            [ 1]   76 	push	#0xc8
      00813E 4B 04            [ 1]   77 	push	#0x04
      008140 CD 86 DD         [ 4]   78 	call	_TIM4_TimeBaseInit
      008143 85               [ 2]   79 	popw	x
                                     80 ;	user/timerTick.c: 24: TIM4_ClearFlag(TIM4_FLAG_UPDATE); 
      008144 4B 01            [ 1]   81 	push	#0x01
      008146 CD 87 0D         [ 4]   82 	call	_TIM4_ClearFlag
      008149 84               [ 1]   83 	pop	a
                                     84 ;	user/timerTick.c: 25: TIM4_ITConfig(TIM4_IT_UPDATE, ENABLE);
      00814A 4B 01            [ 1]   85 	push	#0x01
      00814C 4B 01            [ 1]   86 	push	#0x01
      00814E CD 86 EF         [ 4]   87 	call	_TIM4_ITConfig
      008151 85               [ 2]   88 	popw	x
                                     89 ;	user/timerTick.c: 26: TIM4_Cmd(ENABLE);    // Enable TIM4 
      008152 4B 01            [ 1]   90 	push	#0x01
      008154 CD 86 EA         [ 4]   91 	call	_TIM4_Cmd
      008157 84               [ 1]   92 	pop	a
                                     93 ;	user/timerTick.c: 27: timeTickMs = 0;
      008158 5F               [ 1]   94 	clrw	x
      008159 CF 00 0D         [ 2]   95 	ldw	_timeTickMs+2, x
      00815C CF 00 0B         [ 2]   96 	ldw	_timeTickMs+0, x
                                     97 ;	user/timerTick.c: 28: timeTickUs = 0;
      00815F 72 5F 00 0F      [ 1]   98 	clr	_timeTickUs+0
      008163 81               [ 4]   99 	ret
                                    100 ;	user/timerTick.c: 31: void TIMER_Inc(void)
                                    101 ;	-----------------------------------------
                                    102 ;	 function TIMER_Inc
                                    103 ;	-----------------------------------------
      008164                        104 _TIMER_Inc:
                                    105 ;	user/timerTick.c: 33: timeTickUs++;
      008164 72 5C 00 0F      [ 1]  106 	inc	_timeTickUs+0
                                    107 ;	user/timerTick.c: 34: if(timeTickUs%5 == 0){
      008168 5F               [ 1]  108 	clrw	x
      008169 C6 00 0F         [ 1]  109 	ld	a, _timeTickUs+0
      00816C 97               [ 1]  110 	ld	xl, a
      00816D A6 05            [ 1]  111 	ld	a, #0x05
      00816F 62               [ 2]  112 	div	x, a
      008170 4D               [ 1]  113 	tnz	a
      008171 27 01            [ 1]  114 	jreq	00109$
      008173 81               [ 4]  115 	ret
      008174                        116 00109$:
                                    117 ;	user/timerTick.c: 35: timeTickMs++;
      008174 CE 00 0D         [ 2]  118 	ldw	x, _timeTickMs+2
      008177 1C 00 01         [ 2]  119 	addw	x, #0x0001
      00817A C6 00 0C         [ 1]  120 	ld	a, _timeTickMs+1
      00817D A9 00            [ 1]  121 	adc	a, #0x00
      00817F 90 97            [ 1]  122 	ld	yl, a
      008181 C6 00 0B         [ 1]  123 	ld	a, _timeTickMs+0
      008184 A9 00            [ 1]  124 	adc	a, #0x00
      008186 90 95            [ 1]  125 	ld	yh, a
      008188 CF 00 0D         [ 2]  126 	ldw	_timeTickMs+2, x
      00818B 90 CF 00 0B      [ 2]  127 	ldw	_timeTickMs+0, y
      00818F 81               [ 4]  128 	ret
                                    129 ;	user/timerTick.c: 39: void TIMER_InitTime(TIME *pTime)
                                    130 ;	-----------------------------------------
                                    131 ;	 function TIMER_InitTime
                                    132 ;	-----------------------------------------
      008190                        133 _TIMER_InitTime:
                                    134 ;	user/timerTick.c: 41: pTime->timeMS = timeTickMs;
      008190 1E 03            [ 2]  135 	ldw	x, (0x03, sp)
      008192 5C               [ 2]  136 	incw	x
      008193 5C               [ 2]  137 	incw	x
      008194 90 CE 00 0D      [ 2]  138 	ldw	y, _timeTickMs+2
      008198 EF 02            [ 2]  139 	ldw	(0x2, x), y
      00819A 90 CE 00 0B      [ 2]  140 	ldw	y, _timeTickMs+0
      00819E FF               [ 2]  141 	ldw	(x), y
      00819F 81               [ 4]  142 	ret
                                    143 ;	user/timerTick.c: 44: uint8_t TIMER_CheckTimeUS(TIME *pTime, uint16_t time)
                                    144 ;	-----------------------------------------
                                    145 ;	 function TIMER_CheckTimeUS
                                    146 ;	-----------------------------------------
      0081A0                        147 _TIMER_CheckTimeUS:
      0081A0 52 04            [ 2]  148 	sub	sp, #4
                                    149 ;	user/timerTick.c: 46: timeGet = TIM4_GetCounter();
      0081A2 CD 86 FA         [ 4]  150 	call	_TIM4_GetCounter
      0081A5 5F               [ 1]  151 	clrw	x
      0081A6 97               [ 1]  152 	ld	xl, a
      0081A7 CF 00 07         [ 2]  153 	ldw	_timeGet+0, x
                                    154 ;	user/timerTick.c: 47: if(((timeGet > pTime->timeUS)&&((timeGet - pTime->timeUS) >= time))||((timeGet < pTime->timeUS)&&(((CYCLE_US -  pTime->timeUS) + timeGet + 1) >= time))){
      0081AA 16 07            [ 2]  155 	ldw	y, (0x07, sp)
      0081AC 17 03            [ 2]  156 	ldw	(0x03, sp), y
      0081AE 1E 03            [ 2]  157 	ldw	x, (0x03, sp)
      0081B0 FE               [ 2]  158 	ldw	x, (x)
      0081B1 1F 01            [ 2]  159 	ldw	(0x01, sp), x
      0081B3 1E 01            [ 2]  160 	ldw	x, (0x01, sp)
      0081B5 C3 00 07         [ 2]  161 	cpw	x, _timeGet+0
      0081B8 24 0A            [ 1]  162 	jrnc	00105$
      0081BA CE 00 07         [ 2]  163 	ldw	x, _timeGet+0
      0081BD 72 F0 01         [ 2]  164 	subw	x, (0x01, sp)
      0081C0 13 09            [ 2]  165 	cpw	x, (0x09, sp)
      0081C2 24 14            [ 1]  166 	jrnc	00101$
      0081C4                        167 00105$:
      0081C4 1E 01            [ 2]  168 	ldw	x, (0x01, sp)
      0081C6 C3 00 07         [ 2]  169 	cpw	x, _timeGet+0
      0081C9 23 17            [ 2]  170 	jrule	00102$
      0081CB CE 00 07         [ 2]  171 	ldw	x, _timeGet+0
      0081CE 1C 00 C9         [ 2]  172 	addw	x, #0x00c9
      0081D1 72 F0 01         [ 2]  173 	subw	x, (0x01, sp)
      0081D4 13 09            [ 2]  174 	cpw	x, (0x09, sp)
      0081D6 25 0A            [ 1]  175 	jrc	00102$
      0081D8                        176 00101$:
                                    177 ;	user/timerTick.c: 48: pTime->timeUS = timeGet;
      0081D8 1E 03            [ 2]  178 	ldw	x, (0x03, sp)
      0081DA 90 CE 00 07      [ 2]  179 	ldw	y, _timeGet+0
      0081DE FF               [ 2]  180 	ldw	(x), y
                                    181 ;	user/timerTick.c: 49: return 0;
      0081DF 4F               [ 1]  182 	clr	a
      0081E0 20 02            [ 2]  183 	jra	00106$
      0081E2                        184 00102$:
                                    185 ;	user/timerTick.c: 51: return 1;
      0081E2 A6 01            [ 1]  186 	ld	a, #0x01
      0081E4                        187 00106$:
      0081E4 5B 04            [ 2]  188 	addw	sp, #4
      0081E6 81               [ 4]  189 	ret
                                    190 ;	user/timerTick.c: 54: uint8_t TIMER_CheckTimeMS(TIME *pTime, uint32_t time)
                                    191 ;	-----------------------------------------
                                    192 ;	 function TIMER_CheckTimeMS
                                    193 ;	-----------------------------------------
      0081E7                        194 _TIMER_CheckTimeMS:
      0081E7 52 0B            [ 2]  195 	sub	sp, #11
                                    196 ;	user/timerTick.c: 56: if(((timeTickMs > pTime->timeMS)&&((timeTickMs - pTime->timeMS) >= time))||((timeTickMs < pTime->timeMS)&&(((CYCLE_MS -  pTime->timeMS) + timeTickMs + 1) >= time))){
      0081E9 1E 0E            [ 2]  197 	ldw	x, (0x0e, sp)
      0081EB 5C               [ 2]  198 	incw	x
      0081EC 5C               [ 2]  199 	incw	x
      0081ED 1F 0A            [ 2]  200 	ldw	(0x0a, sp), x
      0081EF 1E 0A            [ 2]  201 	ldw	x, (0x0a, sp)
      0081F1 E6 03            [ 1]  202 	ld	a, (0x3, x)
      0081F3 6B 09            [ 1]  203 	ld	(0x09, sp), a
      0081F5 E6 02            [ 1]  204 	ld	a, (0x2, x)
      0081F7 6B 08            [ 1]  205 	ld	(0x08, sp), a
      0081F9 FE               [ 2]  206 	ldw	x, (x)
      0081FA 1F 06            [ 2]  207 	ldw	(0x06, sp), x
      0081FC CE 00 0D         [ 2]  208 	ldw	x, _timeTickMs+2
      0081FF 72 F0 08         [ 2]  209 	subw	x, (0x08, sp)
      008202 C6 00 0C         [ 1]  210 	ld	a, _timeTickMs+1
      008205 12 07            [ 1]  211 	sbc	a, (0x07, sp)
      008207 88               [ 1]  212 	push	a
      008208 C6 00 0B         [ 1]  213 	ld	a, _timeTickMs+0
      00820B 12 07            [ 1]  214 	sbc	a, (0x07, sp)
      00820D 6B 03            [ 1]  215 	ld	(0x03, sp), a
      00820F 84               [ 1]  216 	pop	a
      008210 88               [ 1]  217 	push	a
      008211 13 13            [ 2]  218 	cpw	x, (0x13, sp)
      008213 84               [ 1]  219 	pop	a
      008214 12 11            [ 1]  220 	sbc	a, (0x11, sp)
      008216 7B 02            [ 1]  221 	ld	a, (0x02, sp)
      008218 12 10            [ 1]  222 	sbc	a, (0x10, sp)
      00821A 4F               [ 1]  223 	clr	a
      00821B 49               [ 1]  224 	rlc	a
      00821C 6B 01            [ 1]  225 	ld	(0x01, sp), a
      00821E 1E 08            [ 2]  226 	ldw	x, (0x08, sp)
      008220 C3 00 0D         [ 2]  227 	cpw	x, _timeTickMs+2
      008223 7B 07            [ 1]  228 	ld	a, (0x07, sp)
      008225 C2 00 0C         [ 1]  229 	sbc	a, _timeTickMs+1
      008228 7B 06            [ 1]  230 	ld	a, (0x06, sp)
      00822A C2 00 0B         [ 1]  231 	sbc	a, _timeTickMs+0
      00822D 24 04            [ 1]  232 	jrnc	00105$
      00822F 0D 01            [ 1]  233 	tnz	(0x01, sp)
      008231 27 15            [ 1]  234 	jreq	00101$
      008233                        235 00105$:
      008233 CE 00 0D         [ 2]  236 	ldw	x, _timeTickMs+2
      008236 13 08            [ 2]  237 	cpw	x, (0x08, sp)
      008238 C6 00 0C         [ 1]  238 	ld	a, _timeTickMs+1
      00823B 12 07            [ 1]  239 	sbc	a, (0x07, sp)
      00823D C6 00 0B         [ 1]  240 	ld	a, _timeTickMs+0
      008240 12 06            [ 1]  241 	sbc	a, (0x06, sp)
      008242 24 14            [ 1]  242 	jrnc	00102$
      008244 0D 01            [ 1]  243 	tnz	(0x01, sp)
      008246 26 10            [ 1]  244 	jrne	00102$
      008248                        245 00101$:
                                    246 ;	user/timerTick.c: 57: pTime->timeMS = timeTickMs;
      008248 1E 0A            [ 2]  247 	ldw	x, (0x0a, sp)
      00824A 90 CE 00 0D      [ 2]  248 	ldw	y, _timeTickMs+2
      00824E EF 02            [ 2]  249 	ldw	(0x2, x), y
      008250 90 CE 00 0B      [ 2]  250 	ldw	y, _timeTickMs+0
      008254 FF               [ 2]  251 	ldw	(x), y
                                    252 ;	user/timerTick.c: 58: return 0;
      008255 4F               [ 1]  253 	clr	a
      008256 20 02            [ 2]  254 	jra	00106$
      008258                        255 00102$:
                                    256 ;	user/timerTick.c: 60: return 1;
      008258 A6 01            [ 1]  257 	ld	a, #0x01
      00825A                        258 00106$:
      00825A 5B 0B            [ 2]  259 	addw	sp, #11
      00825C 81               [ 4]  260 	ret
                                    261 	.area CODE
                                    262 	.area INITIALIZER
                                    263 	.area CABS (ABS)
