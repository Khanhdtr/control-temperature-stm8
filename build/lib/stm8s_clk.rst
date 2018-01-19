                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 3.6.0 #9615 (Mac OS X x86_64)
                                      4 ;--------------------------------------------------------
                                      5 	.module stm8s_clk
                                      6 	.optsdcc -mstm8
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _CLKPrescTable
                                     12 	.globl _HSIDivFactor
                                     13 	.globl _CLK_DeInit
                                     14 	.globl _CLK_FastHaltWakeUpCmd
                                     15 	.globl _CLK_HSECmd
                                     16 	.globl _CLK_HSICmd
                                     17 	.globl _CLK_LSICmd
                                     18 	.globl _CLK_CCOCmd
                                     19 	.globl _CLK_ClockSwitchCmd
                                     20 	.globl _CLK_SlowActiveHaltWakeUpCmd
                                     21 	.globl _CLK_PeripheralClockConfig
                                     22 	.globl _CLK_ClockSwitchConfig
                                     23 	.globl _CLK_HSIPrescalerConfig
                                     24 	.globl _CLK_CCOConfig
                                     25 	.globl _CLK_ITConfig
                                     26 	.globl _CLK_SYSCLKConfig
                                     27 	.globl _CLK_SWIMConfig
                                     28 	.globl _CLK_ClockSecuritySystemEnable
                                     29 	.globl _CLK_GetSYSCLKSource
                                     30 	.globl _CLK_GetClockFreq
                                     31 	.globl _CLK_AdjustHSICalibrationValue
                                     32 	.globl _CLK_SYSCLKEmergencyClear
                                     33 	.globl _CLK_GetFlagStatus
                                     34 	.globl _CLK_GetITStatus
                                     35 	.globl _CLK_ClearITPendingBit
                                     36 ;--------------------------------------------------------
                                     37 ; ram data
                                     38 ;--------------------------------------------------------
                                     39 	.area DATA
                                     40 ;--------------------------------------------------------
                                     41 ; ram data
                                     42 ;--------------------------------------------------------
                                     43 	.area INITIALIZED
                                     44 ;--------------------------------------------------------
                                     45 ; absolute external ram data
                                     46 ;--------------------------------------------------------
                                     47 	.area DABS (ABS)
                                     48 ;--------------------------------------------------------
                                     49 ; global & static initialisations
                                     50 ;--------------------------------------------------------
                                     51 	.area HOME
                                     52 	.area GSINIT
                                     53 	.area GSFINAL
                                     54 	.area GSINIT
                                     55 ;--------------------------------------------------------
                                     56 ; Home
                                     57 ;--------------------------------------------------------
                                     58 	.area HOME
                                     59 	.area HOME
                                     60 ;--------------------------------------------------------
                                     61 ; code
                                     62 ;--------------------------------------------------------
                                     63 	.area CODE
                                     64 ;	lib/stm8s_clk.c: 72: void CLK_DeInit(void)
                                     65 ;	-----------------------------------------
                                     66 ;	 function CLK_DeInit
                                     67 ;	-----------------------------------------
      0082A8                         68 _CLK_DeInit:
                                     69 ;	lib/stm8s_clk.c: 74: CLK->ICKR = CLK_ICKR_RESET_VALUE;
      0082A8 35 01 50 C0      [ 1]   70 	mov	0x50c0+0, #0x01
                                     71 ;	lib/stm8s_clk.c: 75: CLK->ECKR = CLK_ECKR_RESET_VALUE;
      0082AC 35 00 50 C1      [ 1]   72 	mov	0x50c1+0, #0x00
                                     73 ;	lib/stm8s_clk.c: 76: CLK->SWR  = CLK_SWR_RESET_VALUE;
      0082B0 35 E1 50 C4      [ 1]   74 	mov	0x50c4+0, #0xe1
                                     75 ;	lib/stm8s_clk.c: 77: CLK->SWCR = CLK_SWCR_RESET_VALUE;
      0082B4 35 00 50 C5      [ 1]   76 	mov	0x50c5+0, #0x00
                                     77 ;	lib/stm8s_clk.c: 78: CLK->CKDIVR = CLK_CKDIVR_RESET_VALUE;
      0082B8 35 18 50 C6      [ 1]   78 	mov	0x50c6+0, #0x18
                                     79 ;	lib/stm8s_clk.c: 79: CLK->PCKENR1 = CLK_PCKENR1_RESET_VALUE;
      0082BC 35 FF 50 C7      [ 1]   80 	mov	0x50c7+0, #0xff
                                     81 ;	lib/stm8s_clk.c: 80: CLK->PCKENR2 = CLK_PCKENR2_RESET_VALUE;
      0082C0 35 FF 50 CA      [ 1]   82 	mov	0x50ca+0, #0xff
                                     83 ;	lib/stm8s_clk.c: 81: CLK->CSSR = CLK_CSSR_RESET_VALUE;
      0082C4 35 00 50 C8      [ 1]   84 	mov	0x50c8+0, #0x00
                                     85 ;	lib/stm8s_clk.c: 82: CLK->CCOR = CLK_CCOR_RESET_VALUE;
      0082C8 35 00 50 C9      [ 1]   86 	mov	0x50c9+0, #0x00
                                     87 ;	lib/stm8s_clk.c: 83: while ((CLK->CCOR & CLK_CCOR_CCOEN)!= 0)
      0082CC                         88 00101$:
      0082CC AE 50 C9         [ 2]   89 	ldw	x, #0x50c9
      0082CF F6               [ 1]   90 	ld	a, (x)
      0082D0 44               [ 1]   91 	srl	a
      0082D1 25 F9            [ 1]   92 	jrc	00101$
                                     93 ;	lib/stm8s_clk.c: 85: CLK->CCOR = CLK_CCOR_RESET_VALUE;
      0082D3 35 00 50 C9      [ 1]   94 	mov	0x50c9+0, #0x00
                                     95 ;	lib/stm8s_clk.c: 86: CLK->HSITRIMR = CLK_HSITRIMR_RESET_VALUE;
      0082D7 35 00 50 CC      [ 1]   96 	mov	0x50cc+0, #0x00
                                     97 ;	lib/stm8s_clk.c: 87: CLK->SWIMCCR = CLK_SWIMCCR_RESET_VALUE;
      0082DB 35 00 50 CD      [ 1]   98 	mov	0x50cd+0, #0x00
      0082DF 81               [ 4]   99 	ret
                                    100 ;	lib/stm8s_clk.c: 99: void CLK_FastHaltWakeUpCmd(FunctionalState NewState)
                                    101 ;	-----------------------------------------
                                    102 ;	 function CLK_FastHaltWakeUpCmd
                                    103 ;	-----------------------------------------
      0082E0                        104 _CLK_FastHaltWakeUpCmd:
                                    105 ;	lib/stm8s_clk.c: 102: if (NewState != DISABLE)
      0082E0 0D 03            [ 1]  106 	tnz	(0x03, sp)
      0082E2 27 08            [ 1]  107 	jreq	00102$
                                    108 ;	lib/stm8s_clk.c: 105: CLK->ICKR |= CLK_ICKR_FHWU;
      0082E4 AE 50 C0         [ 2]  109 	ldw	x, #0x50c0
      0082E7 F6               [ 1]  110 	ld	a, (x)
      0082E8 AA 04            [ 1]  111 	or	a, #0x04
      0082EA F7               [ 1]  112 	ld	(x), a
      0082EB 81               [ 4]  113 	ret
      0082EC                        114 00102$:
                                    115 ;	lib/stm8s_clk.c: 110: CLK->ICKR &= (uint8_t)(~CLK_ICKR_FHWU);
      0082EC AE 50 C0         [ 2]  116 	ldw	x, #0x50c0
      0082EF F6               [ 1]  117 	ld	a, (x)
      0082F0 A4 FB            [ 1]  118 	and	a, #0xfb
      0082F2 F7               [ 1]  119 	ld	(x), a
      0082F3 81               [ 4]  120 	ret
                                    121 ;	lib/stm8s_clk.c: 119: void CLK_HSECmd(FunctionalState NewState)
                                    122 ;	-----------------------------------------
                                    123 ;	 function CLK_HSECmd
                                    124 ;	-----------------------------------------
      0082F4                        125 _CLK_HSECmd:
                                    126 ;	lib/stm8s_clk.c: 122: if (NewState != DISABLE)
      0082F4 0D 03            [ 1]  127 	tnz	(0x03, sp)
      0082F6 27 05            [ 1]  128 	jreq	00102$
                                    129 ;	lib/stm8s_clk.c: 125: CLK->ECKR |= CLK_ECKR_HSEEN;
      0082F8 72 10 50 C1      [ 1]  130 	bset	0x50c1, #0
      0082FC 81               [ 4]  131 	ret
      0082FD                        132 00102$:
                                    133 ;	lib/stm8s_clk.c: 130: CLK->ECKR &= (uint8_t)(~CLK_ECKR_HSEEN);
      0082FD 72 11 50 C1      [ 1]  134 	bres	0x50c1, #0
      008301 81               [ 4]  135 	ret
                                    136 ;	lib/stm8s_clk.c: 139: void CLK_HSICmd(FunctionalState NewState)
                                    137 ;	-----------------------------------------
                                    138 ;	 function CLK_HSICmd
                                    139 ;	-----------------------------------------
      008302                        140 _CLK_HSICmd:
                                    141 ;	lib/stm8s_clk.c: 142: if (NewState != DISABLE)
      008302 0D 03            [ 1]  142 	tnz	(0x03, sp)
      008304 27 05            [ 1]  143 	jreq	00102$
                                    144 ;	lib/stm8s_clk.c: 145: CLK->ICKR |= CLK_ICKR_HSIEN;
      008306 72 10 50 C0      [ 1]  145 	bset	0x50c0, #0
      00830A 81               [ 4]  146 	ret
      00830B                        147 00102$:
                                    148 ;	lib/stm8s_clk.c: 150: CLK->ICKR &= (uint8_t)(~CLK_ICKR_HSIEN);
      00830B 72 11 50 C0      [ 1]  149 	bres	0x50c0, #0
      00830F 81               [ 4]  150 	ret
                                    151 ;	lib/stm8s_clk.c: 160: void CLK_LSICmd(FunctionalState NewState)
                                    152 ;	-----------------------------------------
                                    153 ;	 function CLK_LSICmd
                                    154 ;	-----------------------------------------
      008310                        155 _CLK_LSICmd:
                                    156 ;	lib/stm8s_clk.c: 163: if (NewState != DISABLE)
      008310 0D 03            [ 1]  157 	tnz	(0x03, sp)
      008312 27 08            [ 1]  158 	jreq	00102$
                                    159 ;	lib/stm8s_clk.c: 166: CLK->ICKR |= CLK_ICKR_LSIEN;
      008314 AE 50 C0         [ 2]  160 	ldw	x, #0x50c0
      008317 F6               [ 1]  161 	ld	a, (x)
      008318 AA 08            [ 1]  162 	or	a, #0x08
      00831A F7               [ 1]  163 	ld	(x), a
      00831B 81               [ 4]  164 	ret
      00831C                        165 00102$:
                                    166 ;	lib/stm8s_clk.c: 171: CLK->ICKR &= (uint8_t)(~CLK_ICKR_LSIEN);
      00831C AE 50 C0         [ 2]  167 	ldw	x, #0x50c0
      00831F F6               [ 1]  168 	ld	a, (x)
      008320 A4 F7            [ 1]  169 	and	a, #0xf7
      008322 F7               [ 1]  170 	ld	(x), a
      008323 81               [ 4]  171 	ret
                                    172 ;	lib/stm8s_clk.c: 181: void CLK_CCOCmd(FunctionalState NewState)
                                    173 ;	-----------------------------------------
                                    174 ;	 function CLK_CCOCmd
                                    175 ;	-----------------------------------------
      008324                        176 _CLK_CCOCmd:
                                    177 ;	lib/stm8s_clk.c: 184: if (NewState != DISABLE)
      008324 0D 03            [ 1]  178 	tnz	(0x03, sp)
      008326 27 05            [ 1]  179 	jreq	00102$
                                    180 ;	lib/stm8s_clk.c: 187: CLK->CCOR |= CLK_CCOR_CCOEN;
      008328 72 10 50 C9      [ 1]  181 	bset	0x50c9, #0
      00832C 81               [ 4]  182 	ret
      00832D                        183 00102$:
                                    184 ;	lib/stm8s_clk.c: 192: CLK->CCOR &= (uint8_t)(~CLK_CCOR_CCOEN);
      00832D 72 11 50 C9      [ 1]  185 	bres	0x50c9, #0
      008331 81               [ 4]  186 	ret
                                    187 ;	lib/stm8s_clk.c: 203: void CLK_ClockSwitchCmd(FunctionalState NewState)
                                    188 ;	-----------------------------------------
                                    189 ;	 function CLK_ClockSwitchCmd
                                    190 ;	-----------------------------------------
      008332                        191 _CLK_ClockSwitchCmd:
                                    192 ;	lib/stm8s_clk.c: 206: if (NewState != DISABLE )
      008332 0D 03            [ 1]  193 	tnz	(0x03, sp)
      008334 27 08            [ 1]  194 	jreq	00102$
                                    195 ;	lib/stm8s_clk.c: 209: CLK->SWCR |= CLK_SWCR_SWEN;
      008336 AE 50 C5         [ 2]  196 	ldw	x, #0x50c5
      008339 F6               [ 1]  197 	ld	a, (x)
      00833A AA 02            [ 1]  198 	or	a, #0x02
      00833C F7               [ 1]  199 	ld	(x), a
      00833D 81               [ 4]  200 	ret
      00833E                        201 00102$:
                                    202 ;	lib/stm8s_clk.c: 214: CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWEN);
      00833E AE 50 C5         [ 2]  203 	ldw	x, #0x50c5
      008341 F6               [ 1]  204 	ld	a, (x)
      008342 A4 FD            [ 1]  205 	and	a, #0xfd
      008344 F7               [ 1]  206 	ld	(x), a
      008345 81               [ 4]  207 	ret
                                    208 ;	lib/stm8s_clk.c: 226: void CLK_SlowActiveHaltWakeUpCmd(FunctionalState NewState)
                                    209 ;	-----------------------------------------
                                    210 ;	 function CLK_SlowActiveHaltWakeUpCmd
                                    211 ;	-----------------------------------------
      008346                        212 _CLK_SlowActiveHaltWakeUpCmd:
                                    213 ;	lib/stm8s_clk.c: 229: if (NewState != DISABLE)
      008346 0D 03            [ 1]  214 	tnz	(0x03, sp)
      008348 27 08            [ 1]  215 	jreq	00102$
                                    216 ;	lib/stm8s_clk.c: 232: CLK->ICKR |= CLK_ICKR_SWUAH;
      00834A AE 50 C0         [ 2]  217 	ldw	x, #0x50c0
      00834D F6               [ 1]  218 	ld	a, (x)
      00834E AA 20            [ 1]  219 	or	a, #0x20
      008350 F7               [ 1]  220 	ld	(x), a
      008351 81               [ 4]  221 	ret
      008352                        222 00102$:
                                    223 ;	lib/stm8s_clk.c: 237: CLK->ICKR &= (uint8_t)(~CLK_ICKR_SWUAH);
      008352 AE 50 C0         [ 2]  224 	ldw	x, #0x50c0
      008355 F6               [ 1]  225 	ld	a, (x)
      008356 A4 DF            [ 1]  226 	and	a, #0xdf
      008358 F7               [ 1]  227 	ld	(x), a
      008359 81               [ 4]  228 	ret
                                    229 ;	lib/stm8s_clk.c: 249: void CLK_PeripheralClockConfig(CLK_Peripheral_TypeDef CLK_Peripheral, FunctionalState NewState)
                                    230 ;	-----------------------------------------
                                    231 ;	 function CLK_PeripheralClockConfig
                                    232 ;	-----------------------------------------
      00835A                        233 _CLK_PeripheralClockConfig:
      00835A 89               [ 2]  234 	pushw	x
                                    235 ;	lib/stm8s_clk.c: 257: CLK->PCKENR1 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
      00835B 7B 05            [ 1]  236 	ld	a, (0x05, sp)
      00835D A4 0F            [ 1]  237 	and	a, #0x0f
      00835F 88               [ 1]  238 	push	a
      008360 A6 01            [ 1]  239 	ld	a, #0x01
      008362 6B 03            [ 1]  240 	ld	(0x03, sp), a
      008364 84               [ 1]  241 	pop	a
      008365 4D               [ 1]  242 	tnz	a
      008366 27 05            [ 1]  243 	jreq	00125$
      008368                        244 00124$:
      008368 08 02            [ 1]  245 	sll	(0x02, sp)
      00836A 4A               [ 1]  246 	dec	a
      00836B 26 FB            [ 1]  247 	jrne	00124$
      00836D                        248 00125$:
                                    249 ;	lib/stm8s_clk.c: 262: CLK->PCKENR1 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
      00836D 7B 02            [ 1]  250 	ld	a, (0x02, sp)
      00836F 43               [ 1]  251 	cpl	a
      008370 6B 01            [ 1]  252 	ld	(0x01, sp), a
                                    253 ;	lib/stm8s_clk.c: 252: if (((uint8_t)CLK_Peripheral & (uint8_t)0x10) == 0x00)
      008372 7B 05            [ 1]  254 	ld	a, (0x05, sp)
      008374 A5 10            [ 1]  255 	bcp	a, #0x10
      008376 26 1C            [ 1]  256 	jrne	00108$
                                    257 ;	lib/stm8s_clk.c: 254: if (NewState != DISABLE)
      008378 0D 06            [ 1]  258 	tnz	(0x06, sp)
      00837A 27 0C            [ 1]  259 	jreq	00102$
                                    260 ;	lib/stm8s_clk.c: 257: CLK->PCKENR1 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
      00837C AE 50 C7         [ 2]  261 	ldw	x, #0x50c7
      00837F F6               [ 1]  262 	ld	a, (x)
      008380 1A 02            [ 1]  263 	or	a, (0x02, sp)
      008382 AE 50 C7         [ 2]  264 	ldw	x, #0x50c7
      008385 F7               [ 1]  265 	ld	(x), a
      008386 20 26            [ 2]  266 	jra	00110$
      008388                        267 00102$:
                                    268 ;	lib/stm8s_clk.c: 262: CLK->PCKENR1 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
      008388 AE 50 C7         [ 2]  269 	ldw	x, #0x50c7
      00838B F6               [ 1]  270 	ld	a, (x)
      00838C 14 01            [ 1]  271 	and	a, (0x01, sp)
      00838E AE 50 C7         [ 2]  272 	ldw	x, #0x50c7
      008391 F7               [ 1]  273 	ld	(x), a
      008392 20 1A            [ 2]  274 	jra	00110$
      008394                        275 00108$:
                                    276 ;	lib/stm8s_clk.c: 267: if (NewState != DISABLE)
      008394 0D 06            [ 1]  277 	tnz	(0x06, sp)
      008396 27 0C            [ 1]  278 	jreq	00105$
                                    279 ;	lib/stm8s_clk.c: 270: CLK->PCKENR2 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
      008398 AE 50 CA         [ 2]  280 	ldw	x, #0x50ca
      00839B F6               [ 1]  281 	ld	a, (x)
      00839C 1A 02            [ 1]  282 	or	a, (0x02, sp)
      00839E AE 50 CA         [ 2]  283 	ldw	x, #0x50ca
      0083A1 F7               [ 1]  284 	ld	(x), a
      0083A2 20 0A            [ 2]  285 	jra	00110$
      0083A4                        286 00105$:
                                    287 ;	lib/stm8s_clk.c: 275: CLK->PCKENR2 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
      0083A4 AE 50 CA         [ 2]  288 	ldw	x, #0x50ca
      0083A7 F6               [ 1]  289 	ld	a, (x)
      0083A8 14 01            [ 1]  290 	and	a, (0x01, sp)
      0083AA AE 50 CA         [ 2]  291 	ldw	x, #0x50ca
      0083AD F7               [ 1]  292 	ld	(x), a
      0083AE                        293 00110$:
      0083AE 85               [ 2]  294 	popw	x
      0083AF 81               [ 4]  295 	ret
                                    296 ;	lib/stm8s_clk.c: 292: ErrorStatus CLK_ClockSwitchConfig(CLK_SwitchMode_TypeDef CLK_SwitchMode, CLK_Source_TypeDef CLK_NewClock, FunctionalState ITState, CLK_CurrentClockState_TypeDef CLK_CurrentClockState)
                                    297 ;	-----------------------------------------
                                    298 ;	 function CLK_ClockSwitchConfig
                                    299 ;	-----------------------------------------
      0083B0                        300 _CLK_ClockSwitchConfig:
      0083B0 89               [ 2]  301 	pushw	x
                                    302 ;	lib/stm8s_clk.c: 299: clock_master = (CLK_Source_TypeDef)CLK->CMSR;
      0083B1 AE 50 C3         [ 2]  303 	ldw	x, #0x50c3
      0083B4 F6               [ 1]  304 	ld	a, (x)
      0083B5 6B 02            [ 1]  305 	ld	(0x02, sp), a
                                    306 ;	lib/stm8s_clk.c: 302: if (CLK_SwitchMode == CLK_SWITCHMODE_AUTO)
      0083B7 7B 05            [ 1]  307 	ld	a, (0x05, sp)
      0083B9 A1 01            [ 1]  308 	cp	a, #0x01
      0083BB 26 40            [ 1]  309 	jrne	00122$
                                    310 ;	lib/stm8s_clk.c: 305: CLK->SWCR |= CLK_SWCR_SWEN;
      0083BD AE 50 C5         [ 2]  311 	ldw	x, #0x50c5
      0083C0 F6               [ 1]  312 	ld	a, (x)
      0083C1 AA 02            [ 1]  313 	or	a, #0x02
      0083C3 F7               [ 1]  314 	ld	(x), a
                                    315 ;	lib/stm8s_clk.c: 308: if (ITState != DISABLE)
      0083C4 0D 07            [ 1]  316 	tnz	(0x07, sp)
      0083C6 27 09            [ 1]  317 	jreq	00102$
                                    318 ;	lib/stm8s_clk.c: 310: CLK->SWCR |= CLK_SWCR_SWIEN;
      0083C8 AE 50 C5         [ 2]  319 	ldw	x, #0x50c5
      0083CB F6               [ 1]  320 	ld	a, (x)
      0083CC AA 04            [ 1]  321 	or	a, #0x04
      0083CE F7               [ 1]  322 	ld	(x), a
      0083CF 20 07            [ 2]  323 	jra	00103$
      0083D1                        324 00102$:
                                    325 ;	lib/stm8s_clk.c: 314: CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIEN);
      0083D1 AE 50 C5         [ 2]  326 	ldw	x, #0x50c5
      0083D4 F6               [ 1]  327 	ld	a, (x)
      0083D5 A4 FB            [ 1]  328 	and	a, #0xfb
      0083D7 F7               [ 1]  329 	ld	(x), a
      0083D8                        330 00103$:
                                    331 ;	lib/stm8s_clk.c: 318: CLK->SWR = (uint8_t)CLK_NewClock;
      0083D8 AE 50 C4         [ 2]  332 	ldw	x, #0x50c4
      0083DB 7B 06            [ 1]  333 	ld	a, (0x06, sp)
      0083DD F7               [ 1]  334 	ld	(x), a
                                    335 ;	lib/stm8s_clk.c: 321: while((((CLK->SWCR & CLK_SWCR_SWBSY) != 0 )&& (DownCounter != 0)))
      0083DE AE FF FF         [ 2]  336 	ldw	x, #0xffff
      0083E1                        337 00105$:
      0083E1 90 AE 50 C5      [ 2]  338 	ldw	y, #0x50c5
      0083E5 90 F6            [ 1]  339 	ld	a, (y)
      0083E7 44               [ 1]  340 	srl	a
      0083E8 24 06            [ 1]  341 	jrnc	00107$
      0083EA 5D               [ 2]  342 	tnzw	x
      0083EB 27 03            [ 1]  343 	jreq	00107$
                                    344 ;	lib/stm8s_clk.c: 323: DownCounter--;
      0083ED 5A               [ 2]  345 	decw	x
      0083EE 20 F1            [ 2]  346 	jra	00105$
      0083F0                        347 00107$:
                                    348 ;	lib/stm8s_clk.c: 326: if(DownCounter != 0)
      0083F0 5D               [ 2]  349 	tnzw	x
      0083F1 27 06            [ 1]  350 	jreq	00109$
                                    351 ;	lib/stm8s_clk.c: 328: Swif = SUCCESS;
      0083F3 A6 01            [ 1]  352 	ld	a, #0x01
      0083F5 6B 01            [ 1]  353 	ld	(0x01, sp), a
      0083F7 20 43            [ 2]  354 	jra	00123$
      0083F9                        355 00109$:
                                    356 ;	lib/stm8s_clk.c: 332: Swif = ERROR;
      0083F9 0F 01            [ 1]  357 	clr	(0x01, sp)
      0083FB 20 3F            [ 2]  358 	jra	00123$
      0083FD                        359 00122$:
                                    360 ;	lib/stm8s_clk.c: 338: if (ITState != DISABLE)
      0083FD 0D 07            [ 1]  361 	tnz	(0x07, sp)
      0083FF 27 09            [ 1]  362 	jreq	00112$
                                    363 ;	lib/stm8s_clk.c: 340: CLK->SWCR |= CLK_SWCR_SWIEN;
      008401 AE 50 C5         [ 2]  364 	ldw	x, #0x50c5
      008404 F6               [ 1]  365 	ld	a, (x)
      008405 AA 04            [ 1]  366 	or	a, #0x04
      008407 F7               [ 1]  367 	ld	(x), a
      008408 20 07            [ 2]  368 	jra	00113$
      00840A                        369 00112$:
                                    370 ;	lib/stm8s_clk.c: 344: CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIEN);
      00840A AE 50 C5         [ 2]  371 	ldw	x, #0x50c5
      00840D F6               [ 1]  372 	ld	a, (x)
      00840E A4 FB            [ 1]  373 	and	a, #0xfb
      008410 F7               [ 1]  374 	ld	(x), a
      008411                        375 00113$:
                                    376 ;	lib/stm8s_clk.c: 348: CLK->SWR = (uint8_t)CLK_NewClock;
      008411 AE 50 C4         [ 2]  377 	ldw	x, #0x50c4
      008414 7B 06            [ 1]  378 	ld	a, (0x06, sp)
      008416 F7               [ 1]  379 	ld	(x), a
                                    380 ;	lib/stm8s_clk.c: 351: while((((CLK->SWCR & CLK_SWCR_SWIF) != 0 ) && (DownCounter != 0)))
      008417 AE FF FF         [ 2]  381 	ldw	x, #0xffff
      00841A                        382 00115$:
      00841A 90 AE 50 C5      [ 2]  383 	ldw	y, #0x50c5
      00841E 90 F6            [ 1]  384 	ld	a, (y)
      008420 A5 08            [ 1]  385 	bcp	a, #0x08
      008422 27 06            [ 1]  386 	jreq	00117$
      008424 5D               [ 2]  387 	tnzw	x
      008425 27 03            [ 1]  388 	jreq	00117$
                                    389 ;	lib/stm8s_clk.c: 353: DownCounter--;
      008427 5A               [ 2]  390 	decw	x
      008428 20 F0            [ 2]  391 	jra	00115$
      00842A                        392 00117$:
                                    393 ;	lib/stm8s_clk.c: 356: if(DownCounter != 0)
      00842A 5D               [ 2]  394 	tnzw	x
      00842B 27 0D            [ 1]  395 	jreq	00119$
                                    396 ;	lib/stm8s_clk.c: 359: CLK->SWCR |= CLK_SWCR_SWEN;
      00842D AE 50 C5         [ 2]  397 	ldw	x, #0x50c5
      008430 F6               [ 1]  398 	ld	a, (x)
      008431 AA 02            [ 1]  399 	or	a, #0x02
      008433 F7               [ 1]  400 	ld	(x), a
                                    401 ;	lib/stm8s_clk.c: 360: Swif = SUCCESS;
      008434 A6 01            [ 1]  402 	ld	a, #0x01
      008436 6B 01            [ 1]  403 	ld	(0x01, sp), a
      008438 20 02            [ 2]  404 	jra	00123$
      00843A                        405 00119$:
                                    406 ;	lib/stm8s_clk.c: 364: Swif = ERROR;
      00843A 0F 01            [ 1]  407 	clr	(0x01, sp)
      00843C                        408 00123$:
                                    409 ;	lib/stm8s_clk.c: 367: if(Swif != ERROR)
      00843C 0D 01            [ 1]  410 	tnz	(0x01, sp)
      00843E 27 31            [ 1]  411 	jreq	00136$
                                    412 ;	lib/stm8s_clk.c: 370: if((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_HSI))
      008440 0D 08            [ 1]  413 	tnz	(0x08, sp)
      008442 26 0C            [ 1]  414 	jrne	00132$
      008444 7B 02            [ 1]  415 	ld	a, (0x02, sp)
      008446 A1 E1            [ 1]  416 	cp	a, #0xe1
      008448 26 06            [ 1]  417 	jrne	00132$
                                    418 ;	lib/stm8s_clk.c: 372: CLK->ICKR &= (uint8_t)(~CLK_ICKR_HSIEN);
      00844A 72 11 50 C0      [ 1]  419 	bres	0x50c0, #0
      00844E 20 21            [ 2]  420 	jra	00136$
      008450                        421 00132$:
                                    422 ;	lib/stm8s_clk.c: 374: else if((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_LSI))
      008450 0D 08            [ 1]  423 	tnz	(0x08, sp)
      008452 26 0F            [ 1]  424 	jrne	00128$
      008454 7B 02            [ 1]  425 	ld	a, (0x02, sp)
      008456 A1 D2            [ 1]  426 	cp	a, #0xd2
      008458 26 09            [ 1]  427 	jrne	00128$
                                    428 ;	lib/stm8s_clk.c: 376: CLK->ICKR &= (uint8_t)(~CLK_ICKR_LSIEN);
      00845A AE 50 C0         [ 2]  429 	ldw	x, #0x50c0
      00845D F6               [ 1]  430 	ld	a, (x)
      00845E A4 F7            [ 1]  431 	and	a, #0xf7
      008460 F7               [ 1]  432 	ld	(x), a
      008461 20 0E            [ 2]  433 	jra	00136$
      008463                        434 00128$:
                                    435 ;	lib/stm8s_clk.c: 378: else if ((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_HSE))
      008463 0D 08            [ 1]  436 	tnz	(0x08, sp)
      008465 26 0A            [ 1]  437 	jrne	00136$
      008467 7B 02            [ 1]  438 	ld	a, (0x02, sp)
      008469 A1 B4            [ 1]  439 	cp	a, #0xb4
      00846B 26 04            [ 1]  440 	jrne	00136$
                                    441 ;	lib/stm8s_clk.c: 380: CLK->ECKR &= (uint8_t)(~CLK_ECKR_HSEEN);
      00846D 72 11 50 C1      [ 1]  442 	bres	0x50c1, #0
      008471                        443 00136$:
                                    444 ;	lib/stm8s_clk.c: 383: return(Swif);
      008471 7B 01            [ 1]  445 	ld	a, (0x01, sp)
      008473 85               [ 2]  446 	popw	x
      008474 81               [ 4]  447 	ret
                                    448 ;	lib/stm8s_clk.c: 392: void CLK_HSIPrescalerConfig(CLK_Prescaler_TypeDef HSIPrescaler)
                                    449 ;	-----------------------------------------
                                    450 ;	 function CLK_HSIPrescalerConfig
                                    451 ;	-----------------------------------------
      008475                        452 _CLK_HSIPrescalerConfig:
                                    453 ;	lib/stm8s_clk.c: 396: CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
      008475 AE 50 C6         [ 2]  454 	ldw	x, #0x50c6
      008478 F6               [ 1]  455 	ld	a, (x)
      008479 A4 E7            [ 1]  456 	and	a, #0xe7
      00847B F7               [ 1]  457 	ld	(x), a
                                    458 ;	lib/stm8s_clk.c: 399: CLK->CKDIVR |= (uint8_t)HSIPrescaler;
      00847C AE 50 C6         [ 2]  459 	ldw	x, #0x50c6
      00847F F6               [ 1]  460 	ld	a, (x)
      008480 1A 03            [ 1]  461 	or	a, (0x03, sp)
      008482 AE 50 C6         [ 2]  462 	ldw	x, #0x50c6
      008485 F7               [ 1]  463 	ld	(x), a
      008486 81               [ 4]  464 	ret
                                    465 ;	lib/stm8s_clk.c: 411: void CLK_CCOConfig(CLK_Output_TypeDef CLK_CCO)
                                    466 ;	-----------------------------------------
                                    467 ;	 function CLK_CCOConfig
                                    468 ;	-----------------------------------------
      008487                        469 _CLK_CCOConfig:
                                    470 ;	lib/stm8s_clk.c: 415: CLK->CCOR &= (uint8_t)(~CLK_CCOR_CCOSEL);
      008487 AE 50 C9         [ 2]  471 	ldw	x, #0x50c9
      00848A F6               [ 1]  472 	ld	a, (x)
      00848B A4 E1            [ 1]  473 	and	a, #0xe1
      00848D F7               [ 1]  474 	ld	(x), a
                                    475 ;	lib/stm8s_clk.c: 418: CLK->CCOR |= (uint8_t)CLK_CCO;
      00848E AE 50 C9         [ 2]  476 	ldw	x, #0x50c9
      008491 F6               [ 1]  477 	ld	a, (x)
      008492 1A 03            [ 1]  478 	or	a, (0x03, sp)
      008494 AE 50 C9         [ 2]  479 	ldw	x, #0x50c9
      008497 F7               [ 1]  480 	ld	(x), a
                                    481 ;	lib/stm8s_clk.c: 421: CLK->CCOR |= CLK_CCOR_CCOEN;
      008498 72 10 50 C9      [ 1]  482 	bset	0x50c9, #0
      00849C 81               [ 4]  483 	ret
                                    484 ;	lib/stm8s_clk.c: 432: void CLK_ITConfig(CLK_IT_TypeDef CLK_IT, FunctionalState NewState)
                                    485 ;	-----------------------------------------
                                    486 ;	 function CLK_ITConfig
                                    487 ;	-----------------------------------------
      00849D                        488 _CLK_ITConfig:
      00849D 88               [ 1]  489 	push	a
                                    490 ;	lib/stm8s_clk.c: 436: switch (CLK_IT)
      00849E 7B 04            [ 1]  491 	ld	a, (0x04, sp)
      0084A0 A1 0C            [ 1]  492 	cp	a, #0x0c
      0084A2 26 06            [ 1]  493 	jrne	00135$
      0084A4 A6 01            [ 1]  494 	ld	a, #0x01
      0084A6 6B 01            [ 1]  495 	ld	(0x01, sp), a
      0084A8 20 02            [ 2]  496 	jra	00136$
      0084AA                        497 00135$:
      0084AA 0F 01            [ 1]  498 	clr	(0x01, sp)
      0084AC                        499 00136$:
      0084AC 7B 04            [ 1]  500 	ld	a, (0x04, sp)
      0084AE A1 1C            [ 1]  501 	cp	a, #0x1c
      0084B0 26 03            [ 1]  502 	jrne	00138$
      0084B2 A6 01            [ 1]  503 	ld	a, #0x01
      0084B4 21                     504 	.byte 0x21
      0084B5                        505 00138$:
      0084B5 4F               [ 1]  506 	clr	a
      0084B6                        507 00139$:
                                    508 ;	lib/stm8s_clk.c: 434: if (NewState != DISABLE)
      0084B6 0D 05            [ 1]  509 	tnz	(0x05, sp)
      0084B8 27 19            [ 1]  510 	jreq	00110$
                                    511 ;	lib/stm8s_clk.c: 436: switch (CLK_IT)
      0084BA 0D 01            [ 1]  512 	tnz	(0x01, sp)
      0084BC 26 0C            [ 1]  513 	jrne	00102$
      0084BE 4D               [ 1]  514 	tnz	a
      0084BF 27 29            [ 1]  515 	jreq	00112$
                                    516 ;	lib/stm8s_clk.c: 439: CLK->SWCR |= CLK_SWCR_SWIEN;
      0084C1 AE 50 C5         [ 2]  517 	ldw	x, #0x50c5
      0084C4 F6               [ 1]  518 	ld	a, (x)
      0084C5 AA 04            [ 1]  519 	or	a, #0x04
      0084C7 F7               [ 1]  520 	ld	(x), a
                                    521 ;	lib/stm8s_clk.c: 440: break;
      0084C8 20 20            [ 2]  522 	jra	00112$
                                    523 ;	lib/stm8s_clk.c: 441: case CLK_IT_CSSD: /* Enable the clock security system detection interrupt */
      0084CA                        524 00102$:
                                    525 ;	lib/stm8s_clk.c: 442: CLK->CSSR |= CLK_CSSR_CSSDIE;
      0084CA AE 50 C8         [ 2]  526 	ldw	x, #0x50c8
      0084CD F6               [ 1]  527 	ld	a, (x)
      0084CE AA 04            [ 1]  528 	or	a, #0x04
      0084D0 F7               [ 1]  529 	ld	(x), a
                                    530 ;	lib/stm8s_clk.c: 443: break;
      0084D1 20 17            [ 2]  531 	jra	00112$
                                    532 ;	lib/stm8s_clk.c: 446: }
      0084D3                        533 00110$:
                                    534 ;	lib/stm8s_clk.c: 450: switch (CLK_IT)
      0084D3 0D 01            [ 1]  535 	tnz	(0x01, sp)
      0084D5 26 0C            [ 1]  536 	jrne	00106$
      0084D7 4D               [ 1]  537 	tnz	a
      0084D8 27 10            [ 1]  538 	jreq	00112$
                                    539 ;	lib/stm8s_clk.c: 453: CLK->SWCR  &= (uint8_t)(~CLK_SWCR_SWIEN);
      0084DA AE 50 C5         [ 2]  540 	ldw	x, #0x50c5
      0084DD F6               [ 1]  541 	ld	a, (x)
      0084DE A4 FB            [ 1]  542 	and	a, #0xfb
      0084E0 F7               [ 1]  543 	ld	(x), a
                                    544 ;	lib/stm8s_clk.c: 454: break;
      0084E1 20 07            [ 2]  545 	jra	00112$
                                    546 ;	lib/stm8s_clk.c: 455: case CLK_IT_CSSD: /* Disable the clock security system detection interrupt */
      0084E3                        547 00106$:
                                    548 ;	lib/stm8s_clk.c: 456: CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSDIE);
      0084E3 AE 50 C8         [ 2]  549 	ldw	x, #0x50c8
      0084E6 F6               [ 1]  550 	ld	a, (x)
      0084E7 A4 FB            [ 1]  551 	and	a, #0xfb
      0084E9 F7               [ 1]  552 	ld	(x), a
                                    553 ;	lib/stm8s_clk.c: 460: }
      0084EA                        554 00112$:
      0084EA 84               [ 1]  555 	pop	a
      0084EB 81               [ 4]  556 	ret
                                    557 ;	lib/stm8s_clk.c: 469: void CLK_SYSCLKConfig(CLK_Prescaler_TypeDef CLK_Prescaler)
                                    558 ;	-----------------------------------------
                                    559 ;	 function CLK_SYSCLKConfig
                                    560 ;	-----------------------------------------
      0084EC                        561 _CLK_SYSCLKConfig:
      0084EC 89               [ 2]  562 	pushw	x
                                    563 ;	lib/stm8s_clk.c: 472: if (((uint8_t)CLK_Prescaler & (uint8_t)0x80) == 0x00) /* Bit7 = 0 means HSI divider */
      0084ED 0D 05            [ 1]  564 	tnz	(0x05, sp)
      0084EF 2B 19            [ 1]  565 	jrmi	00102$
                                    566 ;	lib/stm8s_clk.c: 474: CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
      0084F1 AE 50 C6         [ 2]  567 	ldw	x, #0x50c6
      0084F4 F6               [ 1]  568 	ld	a, (x)
      0084F5 A4 E7            [ 1]  569 	and	a, #0xe7
      0084F7 F7               [ 1]  570 	ld	(x), a
                                    571 ;	lib/stm8s_clk.c: 475: CLK->CKDIVR |= (uint8_t)((uint8_t)CLK_Prescaler & (uint8_t)CLK_CKDIVR_HSIDIV);
      0084F8 AE 50 C6         [ 2]  572 	ldw	x, #0x50c6
      0084FB F6               [ 1]  573 	ld	a, (x)
      0084FC 6B 02            [ 1]  574 	ld	(0x02, sp), a
      0084FE 7B 05            [ 1]  575 	ld	a, (0x05, sp)
      008500 A4 18            [ 1]  576 	and	a, #0x18
      008502 1A 02            [ 1]  577 	or	a, (0x02, sp)
      008504 AE 50 C6         [ 2]  578 	ldw	x, #0x50c6
      008507 F7               [ 1]  579 	ld	(x), a
      008508 20 17            [ 2]  580 	jra	00104$
      00850A                        581 00102$:
                                    582 ;	lib/stm8s_clk.c: 479: CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_CPUDIV);
      00850A AE 50 C6         [ 2]  583 	ldw	x, #0x50c6
      00850D F6               [ 1]  584 	ld	a, (x)
      00850E A4 F8            [ 1]  585 	and	a, #0xf8
      008510 F7               [ 1]  586 	ld	(x), a
                                    587 ;	lib/stm8s_clk.c: 480: CLK->CKDIVR |= (uint8_t)((uint8_t)CLK_Prescaler & (uint8_t)CLK_CKDIVR_CPUDIV);
      008511 AE 50 C6         [ 2]  588 	ldw	x, #0x50c6
      008514 F6               [ 1]  589 	ld	a, (x)
      008515 6B 01            [ 1]  590 	ld	(0x01, sp), a
      008517 7B 05            [ 1]  591 	ld	a, (0x05, sp)
      008519 A4 07            [ 1]  592 	and	a, #0x07
      00851B 1A 01            [ 1]  593 	or	a, (0x01, sp)
      00851D AE 50 C6         [ 2]  594 	ldw	x, #0x50c6
      008520 F7               [ 1]  595 	ld	(x), a
      008521                        596 00104$:
      008521 85               [ 2]  597 	popw	x
      008522 81               [ 4]  598 	ret
                                    599 ;	lib/stm8s_clk.c: 490: void CLK_SWIMConfig(CLK_SWIMDivider_TypeDef CLK_SWIMDivider)
                                    600 ;	-----------------------------------------
                                    601 ;	 function CLK_SWIMConfig
                                    602 ;	-----------------------------------------
      008523                        603 _CLK_SWIMConfig:
                                    604 ;	lib/stm8s_clk.c: 493: if (CLK_SWIMDivider != CLK_SWIMDIVIDER_2)
      008523 0D 03            [ 1]  605 	tnz	(0x03, sp)
      008525 27 05            [ 1]  606 	jreq	00102$
                                    607 ;	lib/stm8s_clk.c: 496: CLK->SWIMCCR |= CLK_SWIMCCR_SWIMDIV;
      008527 72 10 50 CD      [ 1]  608 	bset	0x50cd, #0
      00852B 81               [ 4]  609 	ret
      00852C                        610 00102$:
                                    611 ;	lib/stm8s_clk.c: 501: CLK->SWIMCCR &= (uint8_t)(~CLK_SWIMCCR_SWIMDIV);
      00852C 72 11 50 CD      [ 1]  612 	bres	0x50cd, #0
      008530 81               [ 4]  613 	ret
                                    614 ;	lib/stm8s_clk.c: 512: void CLK_ClockSecuritySystemEnable(void)
                                    615 ;	-----------------------------------------
                                    616 ;	 function CLK_ClockSecuritySystemEnable
                                    617 ;	-----------------------------------------
      008531                        618 _CLK_ClockSecuritySystemEnable:
                                    619 ;	lib/stm8s_clk.c: 515: CLK->CSSR |= CLK_CSSR_CSSEN;
      008531 72 10 50 C8      [ 1]  620 	bset	0x50c8, #0
      008535 81               [ 4]  621 	ret
                                    622 ;	lib/stm8s_clk.c: 524: CLK_Source_TypeDef CLK_GetSYSCLKSource(void)
                                    623 ;	-----------------------------------------
                                    624 ;	 function CLK_GetSYSCLKSource
                                    625 ;	-----------------------------------------
      008536                        626 _CLK_GetSYSCLKSource:
                                    627 ;	lib/stm8s_clk.c: 526: return((CLK_Source_TypeDef)CLK->CMSR);
      008536 AE 50 C3         [ 2]  628 	ldw	x, #0x50c3
      008539 F6               [ 1]  629 	ld	a, (x)
      00853A 81               [ 4]  630 	ret
                                    631 ;	lib/stm8s_clk.c: 534: uint32_t CLK_GetClockFreq(void)
                                    632 ;	-----------------------------------------
                                    633 ;	 function CLK_GetClockFreq
                                    634 ;	-----------------------------------------
      00853B                        635 _CLK_GetClockFreq:
      00853B 52 07            [ 2]  636 	sub	sp, #7
                                    637 ;	lib/stm8s_clk.c: 541: clocksource = (CLK_Source_TypeDef)CLK->CMSR;
      00853D AE 50 C3         [ 2]  638 	ldw	x, #0x50c3
      008540 F6               [ 1]  639 	ld	a, (x)
      008541 6B 01            [ 1]  640 	ld	(0x01, sp), a
                                    641 ;	lib/stm8s_clk.c: 543: if (clocksource == CLK_SOURCE_HSI)
      008543 7B 01            [ 1]  642 	ld	a, (0x01, sp)
      008545 A1 E1            [ 1]  643 	cp	a, #0xe1
      008547 26 2C            [ 1]  644 	jrne	00105$
                                    645 ;	lib/stm8s_clk.c: 545: tmp = (uint8_t)(CLK->CKDIVR & CLK_CKDIVR_HSIDIV);
      008549 AE 50 C6         [ 2]  646 	ldw	x, #0x50c6
      00854C F6               [ 1]  647 	ld	a, (x)
      00854D A4 18            [ 1]  648 	and	a, #0x18
                                    649 ;	lib/stm8s_clk.c: 546: tmp = (uint8_t)(tmp >> 3);
      00854F 44               [ 1]  650 	srl	a
      008550 44               [ 1]  651 	srl	a
      008551 44               [ 1]  652 	srl	a
                                    653 ;	lib/stm8s_clk.c: 547: presc = HSIDivFactor[tmp];
      008552 AE 86 28         [ 2]  654 	ldw	x, #_HSIDivFactor+0
      008555 1F 06            [ 2]  655 	ldw	(0x06, sp), x
      008557 5F               [ 1]  656 	clrw	x
      008558 97               [ 1]  657 	ld	xl, a
      008559 72 FB 06         [ 2]  658 	addw	x, (0x06, sp)
      00855C F6               [ 1]  659 	ld	a, (x)
                                    660 ;	lib/stm8s_clk.c: 548: clockfrequency = HSI_VALUE / presc;
      00855D 5F               [ 1]  661 	clrw	x
      00855E 97               [ 1]  662 	ld	xl, a
      00855F 90 5F            [ 1]  663 	clrw	y
      008561 89               [ 2]  664 	pushw	x
      008562 90 89            [ 2]  665 	pushw	y
      008564 4B 00            [ 1]  666 	push	#0x00
      008566 4B 24            [ 1]  667 	push	#0x24
      008568 4B F4            [ 1]  668 	push	#0xf4
      00856A 4B 00            [ 1]  669 	push	#0x00
      00856C CD 87 68         [ 4]  670 	call	__divulong
      00856F 5B 08            [ 2]  671 	addw	sp, #8
      008571 1F 04            [ 2]  672 	ldw	(0x04, sp), x
      008573 20 1A            [ 2]  673 	jra	00106$
      008575                        674 00105$:
                                    675 ;	lib/stm8s_clk.c: 550: else if ( clocksource == CLK_SOURCE_LSI)
      008575 7B 01            [ 1]  676 	ld	a, (0x01, sp)
      008577 A1 D2            [ 1]  677 	cp	a, #0xd2
      008579 26 0B            [ 1]  678 	jrne	00102$
                                    679 ;	lib/stm8s_clk.c: 552: clockfrequency = LSI_VALUE;
      00857B AE F4 00         [ 2]  680 	ldw	x, #0xf400
      00857E 1F 04            [ 2]  681 	ldw	(0x04, sp), x
      008580 90 AE 00 01      [ 2]  682 	ldw	y, #0x0001
      008584 20 09            [ 2]  683 	jra	00106$
      008586                        684 00102$:
                                    685 ;	lib/stm8s_clk.c: 556: clockfrequency = HSE_VALUE;
      008586 AE 24 00         [ 2]  686 	ldw	x, #0x2400
      008589 1F 04            [ 2]  687 	ldw	(0x04, sp), x
      00858B 90 AE 00 F4      [ 2]  688 	ldw	y, #0x00f4
      00858F                        689 00106$:
                                    690 ;	lib/stm8s_clk.c: 559: return((uint32_t)clockfrequency);
      00858F 1E 04            [ 2]  691 	ldw	x, (0x04, sp)
      008591 5B 07            [ 2]  692 	addw	sp, #7
      008593 81               [ 4]  693 	ret
                                    694 ;	lib/stm8s_clk.c: 569: void CLK_AdjustHSICalibrationValue(CLK_HSITrimValue_TypeDef CLK_HSICalibrationValue)
                                    695 ;	-----------------------------------------
                                    696 ;	 function CLK_AdjustHSICalibrationValue
                                    697 ;	-----------------------------------------
      008594                        698 _CLK_AdjustHSICalibrationValue:
                                    699 ;	lib/stm8s_clk.c: 573: CLK->HSITRIMR = (uint8_t)( (uint8_t)(CLK->HSITRIMR & (uint8_t)(~CLK_HSITRIMR_HSITRIM))|((uint8_t)CLK_HSICalibrationValue));
      008594 AE 50 CC         [ 2]  700 	ldw	x, #0x50cc
      008597 F6               [ 1]  701 	ld	a, (x)
      008598 A4 F8            [ 1]  702 	and	a, #0xf8
      00859A 1A 03            [ 1]  703 	or	a, (0x03, sp)
      00859C AE 50 CC         [ 2]  704 	ldw	x, #0x50cc
      00859F F7               [ 1]  705 	ld	(x), a
      0085A0 81               [ 4]  706 	ret
                                    707 ;	lib/stm8s_clk.c: 585: void CLK_SYSCLKEmergencyClear(void)
                                    708 ;	-----------------------------------------
                                    709 ;	 function CLK_SYSCLKEmergencyClear
                                    710 ;	-----------------------------------------
      0085A1                        711 _CLK_SYSCLKEmergencyClear:
                                    712 ;	lib/stm8s_clk.c: 587: CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWBSY);
      0085A1 72 11 50 C5      [ 1]  713 	bres	0x50c5, #0
      0085A5 81               [ 4]  714 	ret
                                    715 ;	lib/stm8s_clk.c: 597: FlagStatus CLK_GetFlagStatus(CLK_Flag_TypeDef CLK_FLAG)
                                    716 ;	-----------------------------------------
                                    717 ;	 function CLK_GetFlagStatus
                                    718 ;	-----------------------------------------
      0085A6                        719 _CLK_GetFlagStatus:
      0085A6 88               [ 1]  720 	push	a
                                    721 ;	lib/stm8s_clk.c: 604: statusreg = (uint16_t)((uint16_t)CLK_FLAG & (uint16_t)0xFF00);
      0085A7 4F               [ 1]  722 	clr	a
      0085A8 97               [ 1]  723 	ld	xl, a
      0085A9 7B 04            [ 1]  724 	ld	a, (0x04, sp)
      0085AB 95               [ 1]  725 	ld	xh, a
                                    726 ;	lib/stm8s_clk.c: 607: if (statusreg == 0x0100) /* The flag to check is in ICKRregister */
      0085AC A3 01 00         [ 2]  727 	cpw	x, #0x0100
      0085AF 26 06            [ 1]  728 	jrne	00111$
                                    729 ;	lib/stm8s_clk.c: 609: tmpreg = CLK->ICKR;
      0085B1 AE 50 C0         [ 2]  730 	ldw	x, #0x50c0
      0085B4 F6               [ 1]  731 	ld	a, (x)
      0085B5 20 25            [ 2]  732 	jra	00112$
      0085B7                        733 00111$:
                                    734 ;	lib/stm8s_clk.c: 611: else if (statusreg == 0x0200) /* The flag to check is in ECKRregister */
      0085B7 A3 02 00         [ 2]  735 	cpw	x, #0x0200
      0085BA 26 06            [ 1]  736 	jrne	00108$
                                    737 ;	lib/stm8s_clk.c: 613: tmpreg = CLK->ECKR;
      0085BC AE 50 C1         [ 2]  738 	ldw	x, #0x50c1
      0085BF F6               [ 1]  739 	ld	a, (x)
      0085C0 20 1A            [ 2]  740 	jra	00112$
      0085C2                        741 00108$:
                                    742 ;	lib/stm8s_clk.c: 615: else if (statusreg == 0x0300) /* The flag to check is in SWIC register */
      0085C2 A3 03 00         [ 2]  743 	cpw	x, #0x0300
      0085C5 26 06            [ 1]  744 	jrne	00105$
                                    745 ;	lib/stm8s_clk.c: 617: tmpreg = CLK->SWCR;
      0085C7 AE 50 C5         [ 2]  746 	ldw	x, #0x50c5
      0085CA F6               [ 1]  747 	ld	a, (x)
      0085CB 20 0F            [ 2]  748 	jra	00112$
      0085CD                        749 00105$:
                                    750 ;	lib/stm8s_clk.c: 619: else if (statusreg == 0x0400) /* The flag to check is in CSS register */
      0085CD A3 04 00         [ 2]  751 	cpw	x, #0x0400
      0085D0 26 06            [ 1]  752 	jrne	00102$
                                    753 ;	lib/stm8s_clk.c: 621: tmpreg = CLK->CSSR;
      0085D2 AE 50 C8         [ 2]  754 	ldw	x, #0x50c8
      0085D5 F6               [ 1]  755 	ld	a, (x)
      0085D6 20 04            [ 2]  756 	jra	00112$
      0085D8                        757 00102$:
                                    758 ;	lib/stm8s_clk.c: 625: tmpreg = CLK->CCOR;
      0085D8 AE 50 C9         [ 2]  759 	ldw	x, #0x50c9
      0085DB F6               [ 1]  760 	ld	a, (x)
      0085DC                        761 00112$:
                                    762 ;	lib/stm8s_clk.c: 628: if ((tmpreg & (uint8_t)CLK_FLAG) != (uint8_t)RESET)
      0085DC 88               [ 1]  763 	push	a
      0085DD 7B 06            [ 1]  764 	ld	a, (0x06, sp)
      0085DF 6B 02            [ 1]  765 	ld	(0x02, sp), a
      0085E1 84               [ 1]  766 	pop	a
      0085E2 14 01            [ 1]  767 	and	a, (0x01, sp)
      0085E4 4D               [ 1]  768 	tnz	a
      0085E5 27 03            [ 1]  769 	jreq	00114$
                                    770 ;	lib/stm8s_clk.c: 630: bitstatus = SET;
      0085E7 A6 01            [ 1]  771 	ld	a, #0x01
                                    772 ;	lib/stm8s_clk.c: 634: bitstatus = RESET;
      0085E9 21                     773 	.byte 0x21
      0085EA                        774 00114$:
      0085EA 4F               [ 1]  775 	clr	a
      0085EB                        776 00115$:
                                    777 ;	lib/stm8s_clk.c: 638: return((FlagStatus)bitstatus);
      0085EB 5B 01            [ 2]  778 	addw	sp, #1
      0085ED 81               [ 4]  779 	ret
                                    780 ;	lib/stm8s_clk.c: 647: ITStatus CLK_GetITStatus(CLK_IT_TypeDef CLK_IT)
                                    781 ;	-----------------------------------------
                                    782 ;	 function CLK_GetITStatus
                                    783 ;	-----------------------------------------
      0085EE                        784 _CLK_GetITStatus:
                                    785 ;	lib/stm8s_clk.c: 651: if (CLK_IT == CLK_IT_SWIF)
      0085EE 7B 03            [ 1]  786 	ld	a, (0x03, sp)
      0085F0 A1 1C            [ 1]  787 	cp	a, #0x1c
      0085F2 26 0F            [ 1]  788 	jrne	00108$
                                    789 ;	lib/stm8s_clk.c: 654: if ((CLK->SWCR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
      0085F4 AE 50 C5         [ 2]  790 	ldw	x, #0x50c5
      0085F7 F6               [ 1]  791 	ld	a, (x)
      0085F8 14 03            [ 1]  792 	and	a, (0x03, sp)
      0085FA A1 0C            [ 1]  793 	cp	a, #0x0c
      0085FC 26 03            [ 1]  794 	jrne	00102$
                                    795 ;	lib/stm8s_clk.c: 656: bitstatus = SET;
      0085FE A6 01            [ 1]  796 	ld	a, #0x01
      008600 81               [ 4]  797 	ret
      008601                        798 00102$:
                                    799 ;	lib/stm8s_clk.c: 660: bitstatus = RESET;
      008601 4F               [ 1]  800 	clr	a
      008602 81               [ 4]  801 	ret
      008603                        802 00108$:
                                    803 ;	lib/stm8s_clk.c: 666: if ((CLK->CSSR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
      008603 AE 50 C8         [ 2]  804 	ldw	x, #0x50c8
      008606 F6               [ 1]  805 	ld	a, (x)
      008607 14 03            [ 1]  806 	and	a, (0x03, sp)
      008609 A1 0C            [ 1]  807 	cp	a, #0x0c
      00860B 26 03            [ 1]  808 	jrne	00105$
                                    809 ;	lib/stm8s_clk.c: 668: bitstatus = SET;
      00860D A6 01            [ 1]  810 	ld	a, #0x01
      00860F 81               [ 4]  811 	ret
      008610                        812 00105$:
                                    813 ;	lib/stm8s_clk.c: 672: bitstatus = RESET;
      008610 4F               [ 1]  814 	clr	a
                                    815 ;	lib/stm8s_clk.c: 677: return bitstatus;
      008611 81               [ 4]  816 	ret
                                    817 ;	lib/stm8s_clk.c: 686: void CLK_ClearITPendingBit(CLK_IT_TypeDef CLK_IT)
                                    818 ;	-----------------------------------------
                                    819 ;	 function CLK_ClearITPendingBit
                                    820 ;	-----------------------------------------
      008612                        821 _CLK_ClearITPendingBit:
                                    822 ;	lib/stm8s_clk.c: 689: if (CLK_IT == (uint8_t)CLK_IT_CSSD)
      008612 7B 03            [ 1]  823 	ld	a, (0x03, sp)
      008614 A1 0C            [ 1]  824 	cp	a, #0x0c
      008616 26 08            [ 1]  825 	jrne	00102$
                                    826 ;	lib/stm8s_clk.c: 692: CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSD);
      008618 AE 50 C8         [ 2]  827 	ldw	x, #0x50c8
      00861B F6               [ 1]  828 	ld	a, (x)
      00861C A4 F7            [ 1]  829 	and	a, #0xf7
      00861E F7               [ 1]  830 	ld	(x), a
      00861F 81               [ 4]  831 	ret
      008620                        832 00102$:
                                    833 ;	lib/stm8s_clk.c: 697: CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIF);
      008620 AE 50 C5         [ 2]  834 	ldw	x, #0x50c5
      008623 F6               [ 1]  835 	ld	a, (x)
      008624 A4 F7            [ 1]  836 	and	a, #0xf7
      008626 F7               [ 1]  837 	ld	(x), a
      008627 81               [ 4]  838 	ret
                                    839 	.area CODE
      008628                        840 _HSIDivFactor:
      008628 01                     841 	.db #0x01	; 1
      008629 02                     842 	.db #0x02	; 2
      00862A 04                     843 	.db #0x04	; 4
      00862B 08                     844 	.db #0x08	; 8
      00862C                        845 _CLKPrescTable:
      00862C 01                     846 	.db #0x01	; 1
      00862D 02                     847 	.db #0x02	; 2
      00862E 04                     848 	.db #0x04	; 4
      00862F 08                     849 	.db #0x08	; 8
      008630 0A                     850 	.db #0x0a	; 10
      008631 10                     851 	.db #0x10	; 16
      008632 14                     852 	.db #0x14	; 20
      008633 28                     853 	.db #0x28	; 40
                                    854 	.area INITIALIZER
                                    855 	.area CABS (ABS)
