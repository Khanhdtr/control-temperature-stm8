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
      008514                         68 _CLK_DeInit:
                                     69 ;	lib/stm8s_clk.c: 74: CLK->ICKR = CLK_ICKR_RESET_VALUE;
      008514 35 01 50 C0      [ 1]   70 	mov	0x50c0+0, #0x01
                                     71 ;	lib/stm8s_clk.c: 75: CLK->ECKR = CLK_ECKR_RESET_VALUE;
      008518 35 00 50 C1      [ 1]   72 	mov	0x50c1+0, #0x00
                                     73 ;	lib/stm8s_clk.c: 76: CLK->SWR  = CLK_SWR_RESET_VALUE;
      00851C 35 E1 50 C4      [ 1]   74 	mov	0x50c4+0, #0xe1
                                     75 ;	lib/stm8s_clk.c: 77: CLK->SWCR = CLK_SWCR_RESET_VALUE;
      008520 35 00 50 C5      [ 1]   76 	mov	0x50c5+0, #0x00
                                     77 ;	lib/stm8s_clk.c: 78: CLK->CKDIVR = CLK_CKDIVR_RESET_VALUE;
      008524 35 18 50 C6      [ 1]   78 	mov	0x50c6+0, #0x18
                                     79 ;	lib/stm8s_clk.c: 79: CLK->PCKENR1 = CLK_PCKENR1_RESET_VALUE;
      008528 35 FF 50 C7      [ 1]   80 	mov	0x50c7+0, #0xff
                                     81 ;	lib/stm8s_clk.c: 80: CLK->PCKENR2 = CLK_PCKENR2_RESET_VALUE;
      00852C 35 FF 50 CA      [ 1]   82 	mov	0x50ca+0, #0xff
                                     83 ;	lib/stm8s_clk.c: 81: CLK->CSSR = CLK_CSSR_RESET_VALUE;
      008530 35 00 50 C8      [ 1]   84 	mov	0x50c8+0, #0x00
                                     85 ;	lib/stm8s_clk.c: 82: CLK->CCOR = CLK_CCOR_RESET_VALUE;
      008534 35 00 50 C9      [ 1]   86 	mov	0x50c9+0, #0x00
                                     87 ;	lib/stm8s_clk.c: 83: while ((CLK->CCOR & CLK_CCOR_CCOEN)!= 0)
      008538                         88 00101$:
      008538 AE 50 C9         [ 2]   89 	ldw	x, #0x50c9
      00853B F6               [ 1]   90 	ld	a, (x)
      00853C 44               [ 1]   91 	srl	a
      00853D 25 F9            [ 1]   92 	jrc	00101$
                                     93 ;	lib/stm8s_clk.c: 85: CLK->CCOR = CLK_CCOR_RESET_VALUE;
      00853F 35 00 50 C9      [ 1]   94 	mov	0x50c9+0, #0x00
                                     95 ;	lib/stm8s_clk.c: 86: CLK->HSITRIMR = CLK_HSITRIMR_RESET_VALUE;
      008543 35 00 50 CC      [ 1]   96 	mov	0x50cc+0, #0x00
                                     97 ;	lib/stm8s_clk.c: 87: CLK->SWIMCCR = CLK_SWIMCCR_RESET_VALUE;
      008547 35 00 50 CD      [ 1]   98 	mov	0x50cd+0, #0x00
      00854B 81               [ 4]   99 	ret
                                    100 ;	lib/stm8s_clk.c: 99: void CLK_FastHaltWakeUpCmd(FunctionalState NewState)
                                    101 ;	-----------------------------------------
                                    102 ;	 function CLK_FastHaltWakeUpCmd
                                    103 ;	-----------------------------------------
      00854C                        104 _CLK_FastHaltWakeUpCmd:
                                    105 ;	lib/stm8s_clk.c: 102: if (NewState != DISABLE)
      00854C 0D 03            [ 1]  106 	tnz	(0x03, sp)
      00854E 27 08            [ 1]  107 	jreq	00102$
                                    108 ;	lib/stm8s_clk.c: 105: CLK->ICKR |= CLK_ICKR_FHWU;
      008550 AE 50 C0         [ 2]  109 	ldw	x, #0x50c0
      008553 F6               [ 1]  110 	ld	a, (x)
      008554 AA 04            [ 1]  111 	or	a, #0x04
      008556 F7               [ 1]  112 	ld	(x), a
      008557 81               [ 4]  113 	ret
      008558                        114 00102$:
                                    115 ;	lib/stm8s_clk.c: 110: CLK->ICKR &= (uint8_t)(~CLK_ICKR_FHWU);
      008558 AE 50 C0         [ 2]  116 	ldw	x, #0x50c0
      00855B F6               [ 1]  117 	ld	a, (x)
      00855C A4 FB            [ 1]  118 	and	a, #0xfb
      00855E F7               [ 1]  119 	ld	(x), a
      00855F 81               [ 4]  120 	ret
                                    121 ;	lib/stm8s_clk.c: 119: void CLK_HSECmd(FunctionalState NewState)
                                    122 ;	-----------------------------------------
                                    123 ;	 function CLK_HSECmd
                                    124 ;	-----------------------------------------
      008560                        125 _CLK_HSECmd:
                                    126 ;	lib/stm8s_clk.c: 122: if (NewState != DISABLE)
      008560 0D 03            [ 1]  127 	tnz	(0x03, sp)
      008562 27 05            [ 1]  128 	jreq	00102$
                                    129 ;	lib/stm8s_clk.c: 125: CLK->ECKR |= CLK_ECKR_HSEEN;
      008564 72 10 50 C1      [ 1]  130 	bset	0x50c1, #0
      008568 81               [ 4]  131 	ret
      008569                        132 00102$:
                                    133 ;	lib/stm8s_clk.c: 130: CLK->ECKR &= (uint8_t)(~CLK_ECKR_HSEEN);
      008569 72 11 50 C1      [ 1]  134 	bres	0x50c1, #0
      00856D 81               [ 4]  135 	ret
                                    136 ;	lib/stm8s_clk.c: 139: void CLK_HSICmd(FunctionalState NewState)
                                    137 ;	-----------------------------------------
                                    138 ;	 function CLK_HSICmd
                                    139 ;	-----------------------------------------
      00856E                        140 _CLK_HSICmd:
                                    141 ;	lib/stm8s_clk.c: 142: if (NewState != DISABLE)
      00856E 0D 03            [ 1]  142 	tnz	(0x03, sp)
      008570 27 05            [ 1]  143 	jreq	00102$
                                    144 ;	lib/stm8s_clk.c: 145: CLK->ICKR |= CLK_ICKR_HSIEN;
      008572 72 10 50 C0      [ 1]  145 	bset	0x50c0, #0
      008576 81               [ 4]  146 	ret
      008577                        147 00102$:
                                    148 ;	lib/stm8s_clk.c: 150: CLK->ICKR &= (uint8_t)(~CLK_ICKR_HSIEN);
      008577 72 11 50 C0      [ 1]  149 	bres	0x50c0, #0
      00857B 81               [ 4]  150 	ret
                                    151 ;	lib/stm8s_clk.c: 160: void CLK_LSICmd(FunctionalState NewState)
                                    152 ;	-----------------------------------------
                                    153 ;	 function CLK_LSICmd
                                    154 ;	-----------------------------------------
      00857C                        155 _CLK_LSICmd:
                                    156 ;	lib/stm8s_clk.c: 163: if (NewState != DISABLE)
      00857C 0D 03            [ 1]  157 	tnz	(0x03, sp)
      00857E 27 08            [ 1]  158 	jreq	00102$
                                    159 ;	lib/stm8s_clk.c: 166: CLK->ICKR |= CLK_ICKR_LSIEN;
      008580 AE 50 C0         [ 2]  160 	ldw	x, #0x50c0
      008583 F6               [ 1]  161 	ld	a, (x)
      008584 AA 08            [ 1]  162 	or	a, #0x08
      008586 F7               [ 1]  163 	ld	(x), a
      008587 81               [ 4]  164 	ret
      008588                        165 00102$:
                                    166 ;	lib/stm8s_clk.c: 171: CLK->ICKR &= (uint8_t)(~CLK_ICKR_LSIEN);
      008588 AE 50 C0         [ 2]  167 	ldw	x, #0x50c0
      00858B F6               [ 1]  168 	ld	a, (x)
      00858C A4 F7            [ 1]  169 	and	a, #0xf7
      00858E F7               [ 1]  170 	ld	(x), a
      00858F 81               [ 4]  171 	ret
                                    172 ;	lib/stm8s_clk.c: 181: void CLK_CCOCmd(FunctionalState NewState)
                                    173 ;	-----------------------------------------
                                    174 ;	 function CLK_CCOCmd
                                    175 ;	-----------------------------------------
      008590                        176 _CLK_CCOCmd:
                                    177 ;	lib/stm8s_clk.c: 184: if (NewState != DISABLE)
      008590 0D 03            [ 1]  178 	tnz	(0x03, sp)
      008592 27 05            [ 1]  179 	jreq	00102$
                                    180 ;	lib/stm8s_clk.c: 187: CLK->CCOR |= CLK_CCOR_CCOEN;
      008594 72 10 50 C9      [ 1]  181 	bset	0x50c9, #0
      008598 81               [ 4]  182 	ret
      008599                        183 00102$:
                                    184 ;	lib/stm8s_clk.c: 192: CLK->CCOR &= (uint8_t)(~CLK_CCOR_CCOEN);
      008599 72 11 50 C9      [ 1]  185 	bres	0x50c9, #0
      00859D 81               [ 4]  186 	ret
                                    187 ;	lib/stm8s_clk.c: 203: void CLK_ClockSwitchCmd(FunctionalState NewState)
                                    188 ;	-----------------------------------------
                                    189 ;	 function CLK_ClockSwitchCmd
                                    190 ;	-----------------------------------------
      00859E                        191 _CLK_ClockSwitchCmd:
                                    192 ;	lib/stm8s_clk.c: 206: if (NewState != DISABLE )
      00859E 0D 03            [ 1]  193 	tnz	(0x03, sp)
      0085A0 27 08            [ 1]  194 	jreq	00102$
                                    195 ;	lib/stm8s_clk.c: 209: CLK->SWCR |= CLK_SWCR_SWEN;
      0085A2 AE 50 C5         [ 2]  196 	ldw	x, #0x50c5
      0085A5 F6               [ 1]  197 	ld	a, (x)
      0085A6 AA 02            [ 1]  198 	or	a, #0x02
      0085A8 F7               [ 1]  199 	ld	(x), a
      0085A9 81               [ 4]  200 	ret
      0085AA                        201 00102$:
                                    202 ;	lib/stm8s_clk.c: 214: CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWEN);
      0085AA AE 50 C5         [ 2]  203 	ldw	x, #0x50c5
      0085AD F6               [ 1]  204 	ld	a, (x)
      0085AE A4 FD            [ 1]  205 	and	a, #0xfd
      0085B0 F7               [ 1]  206 	ld	(x), a
      0085B1 81               [ 4]  207 	ret
                                    208 ;	lib/stm8s_clk.c: 226: void CLK_SlowActiveHaltWakeUpCmd(FunctionalState NewState)
                                    209 ;	-----------------------------------------
                                    210 ;	 function CLK_SlowActiveHaltWakeUpCmd
                                    211 ;	-----------------------------------------
      0085B2                        212 _CLK_SlowActiveHaltWakeUpCmd:
                                    213 ;	lib/stm8s_clk.c: 229: if (NewState != DISABLE)
      0085B2 0D 03            [ 1]  214 	tnz	(0x03, sp)
      0085B4 27 08            [ 1]  215 	jreq	00102$
                                    216 ;	lib/stm8s_clk.c: 232: CLK->ICKR |= CLK_ICKR_SWUAH;
      0085B6 AE 50 C0         [ 2]  217 	ldw	x, #0x50c0
      0085B9 F6               [ 1]  218 	ld	a, (x)
      0085BA AA 20            [ 1]  219 	or	a, #0x20
      0085BC F7               [ 1]  220 	ld	(x), a
      0085BD 81               [ 4]  221 	ret
      0085BE                        222 00102$:
                                    223 ;	lib/stm8s_clk.c: 237: CLK->ICKR &= (uint8_t)(~CLK_ICKR_SWUAH);
      0085BE AE 50 C0         [ 2]  224 	ldw	x, #0x50c0
      0085C1 F6               [ 1]  225 	ld	a, (x)
      0085C2 A4 DF            [ 1]  226 	and	a, #0xdf
      0085C4 F7               [ 1]  227 	ld	(x), a
      0085C5 81               [ 4]  228 	ret
                                    229 ;	lib/stm8s_clk.c: 249: void CLK_PeripheralClockConfig(CLK_Peripheral_TypeDef CLK_Peripheral, FunctionalState NewState)
                                    230 ;	-----------------------------------------
                                    231 ;	 function CLK_PeripheralClockConfig
                                    232 ;	-----------------------------------------
      0085C6                        233 _CLK_PeripheralClockConfig:
      0085C6 89               [ 2]  234 	pushw	x
                                    235 ;	lib/stm8s_clk.c: 257: CLK->PCKENR1 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
      0085C7 7B 05            [ 1]  236 	ld	a, (0x05, sp)
      0085C9 A4 0F            [ 1]  237 	and	a, #0x0f
      0085CB 88               [ 1]  238 	push	a
      0085CC A6 01            [ 1]  239 	ld	a, #0x01
      0085CE 6B 03            [ 1]  240 	ld	(0x03, sp), a
      0085D0 84               [ 1]  241 	pop	a
      0085D1 4D               [ 1]  242 	tnz	a
      0085D2 27 05            [ 1]  243 	jreq	00125$
      0085D4                        244 00124$:
      0085D4 08 02            [ 1]  245 	sll	(0x02, sp)
      0085D6 4A               [ 1]  246 	dec	a
      0085D7 26 FB            [ 1]  247 	jrne	00124$
      0085D9                        248 00125$:
                                    249 ;	lib/stm8s_clk.c: 262: CLK->PCKENR1 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
      0085D9 7B 02            [ 1]  250 	ld	a, (0x02, sp)
      0085DB 43               [ 1]  251 	cpl	a
      0085DC 6B 01            [ 1]  252 	ld	(0x01, sp), a
                                    253 ;	lib/stm8s_clk.c: 252: if (((uint8_t)CLK_Peripheral & (uint8_t)0x10) == 0x00)
      0085DE 7B 05            [ 1]  254 	ld	a, (0x05, sp)
      0085E0 A5 10            [ 1]  255 	bcp	a, #0x10
      0085E2 26 1C            [ 1]  256 	jrne	00108$
                                    257 ;	lib/stm8s_clk.c: 254: if (NewState != DISABLE)
      0085E4 0D 06            [ 1]  258 	tnz	(0x06, sp)
      0085E6 27 0C            [ 1]  259 	jreq	00102$
                                    260 ;	lib/stm8s_clk.c: 257: CLK->PCKENR1 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
      0085E8 AE 50 C7         [ 2]  261 	ldw	x, #0x50c7
      0085EB F6               [ 1]  262 	ld	a, (x)
      0085EC 1A 02            [ 1]  263 	or	a, (0x02, sp)
      0085EE AE 50 C7         [ 2]  264 	ldw	x, #0x50c7
      0085F1 F7               [ 1]  265 	ld	(x), a
      0085F2 20 26            [ 2]  266 	jra	00110$
      0085F4                        267 00102$:
                                    268 ;	lib/stm8s_clk.c: 262: CLK->PCKENR1 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
      0085F4 AE 50 C7         [ 2]  269 	ldw	x, #0x50c7
      0085F7 F6               [ 1]  270 	ld	a, (x)
      0085F8 14 01            [ 1]  271 	and	a, (0x01, sp)
      0085FA AE 50 C7         [ 2]  272 	ldw	x, #0x50c7
      0085FD F7               [ 1]  273 	ld	(x), a
      0085FE 20 1A            [ 2]  274 	jra	00110$
      008600                        275 00108$:
                                    276 ;	lib/stm8s_clk.c: 267: if (NewState != DISABLE)
      008600 0D 06            [ 1]  277 	tnz	(0x06, sp)
      008602 27 0C            [ 1]  278 	jreq	00105$
                                    279 ;	lib/stm8s_clk.c: 270: CLK->PCKENR2 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
      008604 AE 50 CA         [ 2]  280 	ldw	x, #0x50ca
      008607 F6               [ 1]  281 	ld	a, (x)
      008608 1A 02            [ 1]  282 	or	a, (0x02, sp)
      00860A AE 50 CA         [ 2]  283 	ldw	x, #0x50ca
      00860D F7               [ 1]  284 	ld	(x), a
      00860E 20 0A            [ 2]  285 	jra	00110$
      008610                        286 00105$:
                                    287 ;	lib/stm8s_clk.c: 275: CLK->PCKENR2 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
      008610 AE 50 CA         [ 2]  288 	ldw	x, #0x50ca
      008613 F6               [ 1]  289 	ld	a, (x)
      008614 14 01            [ 1]  290 	and	a, (0x01, sp)
      008616 AE 50 CA         [ 2]  291 	ldw	x, #0x50ca
      008619 F7               [ 1]  292 	ld	(x), a
      00861A                        293 00110$:
      00861A 85               [ 2]  294 	popw	x
      00861B 81               [ 4]  295 	ret
                                    296 ;	lib/stm8s_clk.c: 292: ErrorStatus CLK_ClockSwitchConfig(CLK_SwitchMode_TypeDef CLK_SwitchMode, CLK_Source_TypeDef CLK_NewClock, FunctionalState ITState, CLK_CurrentClockState_TypeDef CLK_CurrentClockState)
                                    297 ;	-----------------------------------------
                                    298 ;	 function CLK_ClockSwitchConfig
                                    299 ;	-----------------------------------------
      00861C                        300 _CLK_ClockSwitchConfig:
      00861C 89               [ 2]  301 	pushw	x
                                    302 ;	lib/stm8s_clk.c: 299: clock_master = (CLK_Source_TypeDef)CLK->CMSR;
      00861D AE 50 C3         [ 2]  303 	ldw	x, #0x50c3
      008620 F6               [ 1]  304 	ld	a, (x)
      008621 6B 02            [ 1]  305 	ld	(0x02, sp), a
                                    306 ;	lib/stm8s_clk.c: 302: if (CLK_SwitchMode == CLK_SWITCHMODE_AUTO)
      008623 7B 05            [ 1]  307 	ld	a, (0x05, sp)
      008625 A1 01            [ 1]  308 	cp	a, #0x01
      008627 26 40            [ 1]  309 	jrne	00122$
                                    310 ;	lib/stm8s_clk.c: 305: CLK->SWCR |= CLK_SWCR_SWEN;
      008629 AE 50 C5         [ 2]  311 	ldw	x, #0x50c5
      00862C F6               [ 1]  312 	ld	a, (x)
      00862D AA 02            [ 1]  313 	or	a, #0x02
      00862F F7               [ 1]  314 	ld	(x), a
                                    315 ;	lib/stm8s_clk.c: 308: if (ITState != DISABLE)
      008630 0D 07            [ 1]  316 	tnz	(0x07, sp)
      008632 27 09            [ 1]  317 	jreq	00102$
                                    318 ;	lib/stm8s_clk.c: 310: CLK->SWCR |= CLK_SWCR_SWIEN;
      008634 AE 50 C5         [ 2]  319 	ldw	x, #0x50c5
      008637 F6               [ 1]  320 	ld	a, (x)
      008638 AA 04            [ 1]  321 	or	a, #0x04
      00863A F7               [ 1]  322 	ld	(x), a
      00863B 20 07            [ 2]  323 	jra	00103$
      00863D                        324 00102$:
                                    325 ;	lib/stm8s_clk.c: 314: CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIEN);
      00863D AE 50 C5         [ 2]  326 	ldw	x, #0x50c5
      008640 F6               [ 1]  327 	ld	a, (x)
      008641 A4 FB            [ 1]  328 	and	a, #0xfb
      008643 F7               [ 1]  329 	ld	(x), a
      008644                        330 00103$:
                                    331 ;	lib/stm8s_clk.c: 318: CLK->SWR = (uint8_t)CLK_NewClock;
      008644 AE 50 C4         [ 2]  332 	ldw	x, #0x50c4
      008647 7B 06            [ 1]  333 	ld	a, (0x06, sp)
      008649 F7               [ 1]  334 	ld	(x), a
                                    335 ;	lib/stm8s_clk.c: 321: while((((CLK->SWCR & CLK_SWCR_SWBSY) != 0 )&& (DownCounter != 0)))
      00864A AE FF FF         [ 2]  336 	ldw	x, #0xffff
      00864D                        337 00105$:
      00864D 90 AE 50 C5      [ 2]  338 	ldw	y, #0x50c5
      008651 90 F6            [ 1]  339 	ld	a, (y)
      008653 44               [ 1]  340 	srl	a
      008654 24 06            [ 1]  341 	jrnc	00107$
      008656 5D               [ 2]  342 	tnzw	x
      008657 27 03            [ 1]  343 	jreq	00107$
                                    344 ;	lib/stm8s_clk.c: 323: DownCounter--;
      008659 5A               [ 2]  345 	decw	x
      00865A 20 F1            [ 2]  346 	jra	00105$
      00865C                        347 00107$:
                                    348 ;	lib/stm8s_clk.c: 326: if(DownCounter != 0)
      00865C 5D               [ 2]  349 	tnzw	x
      00865D 27 06            [ 1]  350 	jreq	00109$
                                    351 ;	lib/stm8s_clk.c: 328: Swif = SUCCESS;
      00865F A6 01            [ 1]  352 	ld	a, #0x01
      008661 6B 01            [ 1]  353 	ld	(0x01, sp), a
      008663 20 43            [ 2]  354 	jra	00123$
      008665                        355 00109$:
                                    356 ;	lib/stm8s_clk.c: 332: Swif = ERROR;
      008665 0F 01            [ 1]  357 	clr	(0x01, sp)
      008667 20 3F            [ 2]  358 	jra	00123$
      008669                        359 00122$:
                                    360 ;	lib/stm8s_clk.c: 338: if (ITState != DISABLE)
      008669 0D 07            [ 1]  361 	tnz	(0x07, sp)
      00866B 27 09            [ 1]  362 	jreq	00112$
                                    363 ;	lib/stm8s_clk.c: 340: CLK->SWCR |= CLK_SWCR_SWIEN;
      00866D AE 50 C5         [ 2]  364 	ldw	x, #0x50c5
      008670 F6               [ 1]  365 	ld	a, (x)
      008671 AA 04            [ 1]  366 	or	a, #0x04
      008673 F7               [ 1]  367 	ld	(x), a
      008674 20 07            [ 2]  368 	jra	00113$
      008676                        369 00112$:
                                    370 ;	lib/stm8s_clk.c: 344: CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIEN);
      008676 AE 50 C5         [ 2]  371 	ldw	x, #0x50c5
      008679 F6               [ 1]  372 	ld	a, (x)
      00867A A4 FB            [ 1]  373 	and	a, #0xfb
      00867C F7               [ 1]  374 	ld	(x), a
      00867D                        375 00113$:
                                    376 ;	lib/stm8s_clk.c: 348: CLK->SWR = (uint8_t)CLK_NewClock;
      00867D AE 50 C4         [ 2]  377 	ldw	x, #0x50c4
      008680 7B 06            [ 1]  378 	ld	a, (0x06, sp)
      008682 F7               [ 1]  379 	ld	(x), a
                                    380 ;	lib/stm8s_clk.c: 351: while((((CLK->SWCR & CLK_SWCR_SWIF) != 0 ) && (DownCounter != 0)))
      008683 AE FF FF         [ 2]  381 	ldw	x, #0xffff
      008686                        382 00115$:
      008686 90 AE 50 C5      [ 2]  383 	ldw	y, #0x50c5
      00868A 90 F6            [ 1]  384 	ld	a, (y)
      00868C A5 08            [ 1]  385 	bcp	a, #0x08
      00868E 27 06            [ 1]  386 	jreq	00117$
      008690 5D               [ 2]  387 	tnzw	x
      008691 27 03            [ 1]  388 	jreq	00117$
                                    389 ;	lib/stm8s_clk.c: 353: DownCounter--;
      008693 5A               [ 2]  390 	decw	x
      008694 20 F0            [ 2]  391 	jra	00115$
      008696                        392 00117$:
                                    393 ;	lib/stm8s_clk.c: 356: if(DownCounter != 0)
      008696 5D               [ 2]  394 	tnzw	x
      008697 27 0D            [ 1]  395 	jreq	00119$
                                    396 ;	lib/stm8s_clk.c: 359: CLK->SWCR |= CLK_SWCR_SWEN;
      008699 AE 50 C5         [ 2]  397 	ldw	x, #0x50c5
      00869C F6               [ 1]  398 	ld	a, (x)
      00869D AA 02            [ 1]  399 	or	a, #0x02
      00869F F7               [ 1]  400 	ld	(x), a
                                    401 ;	lib/stm8s_clk.c: 360: Swif = SUCCESS;
      0086A0 A6 01            [ 1]  402 	ld	a, #0x01
      0086A2 6B 01            [ 1]  403 	ld	(0x01, sp), a
      0086A4 20 02            [ 2]  404 	jra	00123$
      0086A6                        405 00119$:
                                    406 ;	lib/stm8s_clk.c: 364: Swif = ERROR;
      0086A6 0F 01            [ 1]  407 	clr	(0x01, sp)
      0086A8                        408 00123$:
                                    409 ;	lib/stm8s_clk.c: 367: if(Swif != ERROR)
      0086A8 0D 01            [ 1]  410 	tnz	(0x01, sp)
      0086AA 27 31            [ 1]  411 	jreq	00136$
                                    412 ;	lib/stm8s_clk.c: 370: if((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_HSI))
      0086AC 0D 08            [ 1]  413 	tnz	(0x08, sp)
      0086AE 26 0C            [ 1]  414 	jrne	00132$
      0086B0 7B 02            [ 1]  415 	ld	a, (0x02, sp)
      0086B2 A1 E1            [ 1]  416 	cp	a, #0xe1
      0086B4 26 06            [ 1]  417 	jrne	00132$
                                    418 ;	lib/stm8s_clk.c: 372: CLK->ICKR &= (uint8_t)(~CLK_ICKR_HSIEN);
      0086B6 72 11 50 C0      [ 1]  419 	bres	0x50c0, #0
      0086BA 20 21            [ 2]  420 	jra	00136$
      0086BC                        421 00132$:
                                    422 ;	lib/stm8s_clk.c: 374: else if((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_LSI))
      0086BC 0D 08            [ 1]  423 	tnz	(0x08, sp)
      0086BE 26 0F            [ 1]  424 	jrne	00128$
      0086C0 7B 02            [ 1]  425 	ld	a, (0x02, sp)
      0086C2 A1 D2            [ 1]  426 	cp	a, #0xd2
      0086C4 26 09            [ 1]  427 	jrne	00128$
                                    428 ;	lib/stm8s_clk.c: 376: CLK->ICKR &= (uint8_t)(~CLK_ICKR_LSIEN);
      0086C6 AE 50 C0         [ 2]  429 	ldw	x, #0x50c0
      0086C9 F6               [ 1]  430 	ld	a, (x)
      0086CA A4 F7            [ 1]  431 	and	a, #0xf7
      0086CC F7               [ 1]  432 	ld	(x), a
      0086CD 20 0E            [ 2]  433 	jra	00136$
      0086CF                        434 00128$:
                                    435 ;	lib/stm8s_clk.c: 378: else if ((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_HSE))
      0086CF 0D 08            [ 1]  436 	tnz	(0x08, sp)
      0086D1 26 0A            [ 1]  437 	jrne	00136$
      0086D3 7B 02            [ 1]  438 	ld	a, (0x02, sp)
      0086D5 A1 B4            [ 1]  439 	cp	a, #0xb4
      0086D7 26 04            [ 1]  440 	jrne	00136$
                                    441 ;	lib/stm8s_clk.c: 380: CLK->ECKR &= (uint8_t)(~CLK_ECKR_HSEEN);
      0086D9 72 11 50 C1      [ 1]  442 	bres	0x50c1, #0
      0086DD                        443 00136$:
                                    444 ;	lib/stm8s_clk.c: 383: return(Swif);
      0086DD 7B 01            [ 1]  445 	ld	a, (0x01, sp)
      0086DF 85               [ 2]  446 	popw	x
      0086E0 81               [ 4]  447 	ret
                                    448 ;	lib/stm8s_clk.c: 392: void CLK_HSIPrescalerConfig(CLK_Prescaler_TypeDef HSIPrescaler)
                                    449 ;	-----------------------------------------
                                    450 ;	 function CLK_HSIPrescalerConfig
                                    451 ;	-----------------------------------------
      0086E1                        452 _CLK_HSIPrescalerConfig:
                                    453 ;	lib/stm8s_clk.c: 396: CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
      0086E1 AE 50 C6         [ 2]  454 	ldw	x, #0x50c6
      0086E4 F6               [ 1]  455 	ld	a, (x)
      0086E5 A4 E7            [ 1]  456 	and	a, #0xe7
      0086E7 F7               [ 1]  457 	ld	(x), a
                                    458 ;	lib/stm8s_clk.c: 399: CLK->CKDIVR |= (uint8_t)HSIPrescaler;
      0086E8 AE 50 C6         [ 2]  459 	ldw	x, #0x50c6
      0086EB F6               [ 1]  460 	ld	a, (x)
      0086EC 1A 03            [ 1]  461 	or	a, (0x03, sp)
      0086EE AE 50 C6         [ 2]  462 	ldw	x, #0x50c6
      0086F1 F7               [ 1]  463 	ld	(x), a
      0086F2 81               [ 4]  464 	ret
                                    465 ;	lib/stm8s_clk.c: 411: void CLK_CCOConfig(CLK_Output_TypeDef CLK_CCO)
                                    466 ;	-----------------------------------------
                                    467 ;	 function CLK_CCOConfig
                                    468 ;	-----------------------------------------
      0086F3                        469 _CLK_CCOConfig:
                                    470 ;	lib/stm8s_clk.c: 415: CLK->CCOR &= (uint8_t)(~CLK_CCOR_CCOSEL);
      0086F3 AE 50 C9         [ 2]  471 	ldw	x, #0x50c9
      0086F6 F6               [ 1]  472 	ld	a, (x)
      0086F7 A4 E1            [ 1]  473 	and	a, #0xe1
      0086F9 F7               [ 1]  474 	ld	(x), a
                                    475 ;	lib/stm8s_clk.c: 418: CLK->CCOR |= (uint8_t)CLK_CCO;
      0086FA AE 50 C9         [ 2]  476 	ldw	x, #0x50c9
      0086FD F6               [ 1]  477 	ld	a, (x)
      0086FE 1A 03            [ 1]  478 	or	a, (0x03, sp)
      008700 AE 50 C9         [ 2]  479 	ldw	x, #0x50c9
      008703 F7               [ 1]  480 	ld	(x), a
                                    481 ;	lib/stm8s_clk.c: 421: CLK->CCOR |= CLK_CCOR_CCOEN;
      008704 72 10 50 C9      [ 1]  482 	bset	0x50c9, #0
      008708 81               [ 4]  483 	ret
                                    484 ;	lib/stm8s_clk.c: 432: void CLK_ITConfig(CLK_IT_TypeDef CLK_IT, FunctionalState NewState)
                                    485 ;	-----------------------------------------
                                    486 ;	 function CLK_ITConfig
                                    487 ;	-----------------------------------------
      008709                        488 _CLK_ITConfig:
      008709 88               [ 1]  489 	push	a
                                    490 ;	lib/stm8s_clk.c: 436: switch (CLK_IT)
      00870A 7B 04            [ 1]  491 	ld	a, (0x04, sp)
      00870C A1 0C            [ 1]  492 	cp	a, #0x0c
      00870E 26 06            [ 1]  493 	jrne	00135$
      008710 A6 01            [ 1]  494 	ld	a, #0x01
      008712 6B 01            [ 1]  495 	ld	(0x01, sp), a
      008714 20 02            [ 2]  496 	jra	00136$
      008716                        497 00135$:
      008716 0F 01            [ 1]  498 	clr	(0x01, sp)
      008718                        499 00136$:
      008718 7B 04            [ 1]  500 	ld	a, (0x04, sp)
      00871A A1 1C            [ 1]  501 	cp	a, #0x1c
      00871C 26 03            [ 1]  502 	jrne	00138$
      00871E A6 01            [ 1]  503 	ld	a, #0x01
      008720 21                     504 	.byte 0x21
      008721                        505 00138$:
      008721 4F               [ 1]  506 	clr	a
      008722                        507 00139$:
                                    508 ;	lib/stm8s_clk.c: 434: if (NewState != DISABLE)
      008722 0D 05            [ 1]  509 	tnz	(0x05, sp)
      008724 27 19            [ 1]  510 	jreq	00110$
                                    511 ;	lib/stm8s_clk.c: 436: switch (CLK_IT)
      008726 0D 01            [ 1]  512 	tnz	(0x01, sp)
      008728 26 0C            [ 1]  513 	jrne	00102$
      00872A 4D               [ 1]  514 	tnz	a
      00872B 27 29            [ 1]  515 	jreq	00112$
                                    516 ;	lib/stm8s_clk.c: 439: CLK->SWCR |= CLK_SWCR_SWIEN;
      00872D AE 50 C5         [ 2]  517 	ldw	x, #0x50c5
      008730 F6               [ 1]  518 	ld	a, (x)
      008731 AA 04            [ 1]  519 	or	a, #0x04
      008733 F7               [ 1]  520 	ld	(x), a
                                    521 ;	lib/stm8s_clk.c: 440: break;
      008734 20 20            [ 2]  522 	jra	00112$
                                    523 ;	lib/stm8s_clk.c: 441: case CLK_IT_CSSD: /* Enable the clock security system detection interrupt */
      008736                        524 00102$:
                                    525 ;	lib/stm8s_clk.c: 442: CLK->CSSR |= CLK_CSSR_CSSDIE;
      008736 AE 50 C8         [ 2]  526 	ldw	x, #0x50c8
      008739 F6               [ 1]  527 	ld	a, (x)
      00873A AA 04            [ 1]  528 	or	a, #0x04
      00873C F7               [ 1]  529 	ld	(x), a
                                    530 ;	lib/stm8s_clk.c: 443: break;
      00873D 20 17            [ 2]  531 	jra	00112$
                                    532 ;	lib/stm8s_clk.c: 446: }
      00873F                        533 00110$:
                                    534 ;	lib/stm8s_clk.c: 450: switch (CLK_IT)
      00873F 0D 01            [ 1]  535 	tnz	(0x01, sp)
      008741 26 0C            [ 1]  536 	jrne	00106$
      008743 4D               [ 1]  537 	tnz	a
      008744 27 10            [ 1]  538 	jreq	00112$
                                    539 ;	lib/stm8s_clk.c: 453: CLK->SWCR  &= (uint8_t)(~CLK_SWCR_SWIEN);
      008746 AE 50 C5         [ 2]  540 	ldw	x, #0x50c5
      008749 F6               [ 1]  541 	ld	a, (x)
      00874A A4 FB            [ 1]  542 	and	a, #0xfb
      00874C F7               [ 1]  543 	ld	(x), a
                                    544 ;	lib/stm8s_clk.c: 454: break;
      00874D 20 07            [ 2]  545 	jra	00112$
                                    546 ;	lib/stm8s_clk.c: 455: case CLK_IT_CSSD: /* Disable the clock security system detection interrupt */
      00874F                        547 00106$:
                                    548 ;	lib/stm8s_clk.c: 456: CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSDIE);
      00874F AE 50 C8         [ 2]  549 	ldw	x, #0x50c8
      008752 F6               [ 1]  550 	ld	a, (x)
      008753 A4 FB            [ 1]  551 	and	a, #0xfb
      008755 F7               [ 1]  552 	ld	(x), a
                                    553 ;	lib/stm8s_clk.c: 460: }
      008756                        554 00112$:
      008756 84               [ 1]  555 	pop	a
      008757 81               [ 4]  556 	ret
                                    557 ;	lib/stm8s_clk.c: 469: void CLK_SYSCLKConfig(CLK_Prescaler_TypeDef CLK_Prescaler)
                                    558 ;	-----------------------------------------
                                    559 ;	 function CLK_SYSCLKConfig
                                    560 ;	-----------------------------------------
      008758                        561 _CLK_SYSCLKConfig:
      008758 89               [ 2]  562 	pushw	x
                                    563 ;	lib/stm8s_clk.c: 472: if (((uint8_t)CLK_Prescaler & (uint8_t)0x80) == 0x00) /* Bit7 = 0 means HSI divider */
      008759 0D 05            [ 1]  564 	tnz	(0x05, sp)
      00875B 2B 19            [ 1]  565 	jrmi	00102$
                                    566 ;	lib/stm8s_clk.c: 474: CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
      00875D AE 50 C6         [ 2]  567 	ldw	x, #0x50c6
      008760 F6               [ 1]  568 	ld	a, (x)
      008761 A4 E7            [ 1]  569 	and	a, #0xe7
      008763 F7               [ 1]  570 	ld	(x), a
                                    571 ;	lib/stm8s_clk.c: 475: CLK->CKDIVR |= (uint8_t)((uint8_t)CLK_Prescaler & (uint8_t)CLK_CKDIVR_HSIDIV);
      008764 AE 50 C6         [ 2]  572 	ldw	x, #0x50c6
      008767 F6               [ 1]  573 	ld	a, (x)
      008768 6B 02            [ 1]  574 	ld	(0x02, sp), a
      00876A 7B 05            [ 1]  575 	ld	a, (0x05, sp)
      00876C A4 18            [ 1]  576 	and	a, #0x18
      00876E 1A 02            [ 1]  577 	or	a, (0x02, sp)
      008770 AE 50 C6         [ 2]  578 	ldw	x, #0x50c6
      008773 F7               [ 1]  579 	ld	(x), a
      008774 20 17            [ 2]  580 	jra	00104$
      008776                        581 00102$:
                                    582 ;	lib/stm8s_clk.c: 479: CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_CPUDIV);
      008776 AE 50 C6         [ 2]  583 	ldw	x, #0x50c6
      008779 F6               [ 1]  584 	ld	a, (x)
      00877A A4 F8            [ 1]  585 	and	a, #0xf8
      00877C F7               [ 1]  586 	ld	(x), a
                                    587 ;	lib/stm8s_clk.c: 480: CLK->CKDIVR |= (uint8_t)((uint8_t)CLK_Prescaler & (uint8_t)CLK_CKDIVR_CPUDIV);
      00877D AE 50 C6         [ 2]  588 	ldw	x, #0x50c6
      008780 F6               [ 1]  589 	ld	a, (x)
      008781 6B 01            [ 1]  590 	ld	(0x01, sp), a
      008783 7B 05            [ 1]  591 	ld	a, (0x05, sp)
      008785 A4 07            [ 1]  592 	and	a, #0x07
      008787 1A 01            [ 1]  593 	or	a, (0x01, sp)
      008789 AE 50 C6         [ 2]  594 	ldw	x, #0x50c6
      00878C F7               [ 1]  595 	ld	(x), a
      00878D                        596 00104$:
      00878D 85               [ 2]  597 	popw	x
      00878E 81               [ 4]  598 	ret
                                    599 ;	lib/stm8s_clk.c: 490: void CLK_SWIMConfig(CLK_SWIMDivider_TypeDef CLK_SWIMDivider)
                                    600 ;	-----------------------------------------
                                    601 ;	 function CLK_SWIMConfig
                                    602 ;	-----------------------------------------
      00878F                        603 _CLK_SWIMConfig:
                                    604 ;	lib/stm8s_clk.c: 493: if (CLK_SWIMDivider != CLK_SWIMDIVIDER_2)
      00878F 0D 03            [ 1]  605 	tnz	(0x03, sp)
      008791 27 05            [ 1]  606 	jreq	00102$
                                    607 ;	lib/stm8s_clk.c: 496: CLK->SWIMCCR |= CLK_SWIMCCR_SWIMDIV;
      008793 72 10 50 CD      [ 1]  608 	bset	0x50cd, #0
      008797 81               [ 4]  609 	ret
      008798                        610 00102$:
                                    611 ;	lib/stm8s_clk.c: 501: CLK->SWIMCCR &= (uint8_t)(~CLK_SWIMCCR_SWIMDIV);
      008798 72 11 50 CD      [ 1]  612 	bres	0x50cd, #0
      00879C 81               [ 4]  613 	ret
                                    614 ;	lib/stm8s_clk.c: 512: void CLK_ClockSecuritySystemEnable(void)
                                    615 ;	-----------------------------------------
                                    616 ;	 function CLK_ClockSecuritySystemEnable
                                    617 ;	-----------------------------------------
      00879D                        618 _CLK_ClockSecuritySystemEnable:
                                    619 ;	lib/stm8s_clk.c: 515: CLK->CSSR |= CLK_CSSR_CSSEN;
      00879D 72 10 50 C8      [ 1]  620 	bset	0x50c8, #0
      0087A1 81               [ 4]  621 	ret
                                    622 ;	lib/stm8s_clk.c: 524: CLK_Source_TypeDef CLK_GetSYSCLKSource(void)
                                    623 ;	-----------------------------------------
                                    624 ;	 function CLK_GetSYSCLKSource
                                    625 ;	-----------------------------------------
      0087A2                        626 _CLK_GetSYSCLKSource:
                                    627 ;	lib/stm8s_clk.c: 526: return((CLK_Source_TypeDef)CLK->CMSR);
      0087A2 AE 50 C3         [ 2]  628 	ldw	x, #0x50c3
      0087A5 F6               [ 1]  629 	ld	a, (x)
      0087A6 81               [ 4]  630 	ret
                                    631 ;	lib/stm8s_clk.c: 534: uint32_t CLK_GetClockFreq(void)
                                    632 ;	-----------------------------------------
                                    633 ;	 function CLK_GetClockFreq
                                    634 ;	-----------------------------------------
      0087A7                        635 _CLK_GetClockFreq:
      0087A7 52 07            [ 2]  636 	sub	sp, #7
                                    637 ;	lib/stm8s_clk.c: 541: clocksource = (CLK_Source_TypeDef)CLK->CMSR;
      0087A9 AE 50 C3         [ 2]  638 	ldw	x, #0x50c3
      0087AC F6               [ 1]  639 	ld	a, (x)
      0087AD 6B 01            [ 1]  640 	ld	(0x01, sp), a
                                    641 ;	lib/stm8s_clk.c: 543: if (clocksource == CLK_SOURCE_HSI)
      0087AF 7B 01            [ 1]  642 	ld	a, (0x01, sp)
      0087B1 A1 E1            [ 1]  643 	cp	a, #0xe1
      0087B3 26 2C            [ 1]  644 	jrne	00105$
                                    645 ;	lib/stm8s_clk.c: 545: tmp = (uint8_t)(CLK->CKDIVR & CLK_CKDIVR_HSIDIV);
      0087B5 AE 50 C6         [ 2]  646 	ldw	x, #0x50c6
      0087B8 F6               [ 1]  647 	ld	a, (x)
      0087B9 A4 18            [ 1]  648 	and	a, #0x18
                                    649 ;	lib/stm8s_clk.c: 546: tmp = (uint8_t)(tmp >> 3);
      0087BB 44               [ 1]  650 	srl	a
      0087BC 44               [ 1]  651 	srl	a
      0087BD 44               [ 1]  652 	srl	a
                                    653 ;	lib/stm8s_clk.c: 547: presc = HSIDivFactor[tmp];
      0087BE AE 88 94         [ 2]  654 	ldw	x, #_HSIDivFactor+0
      0087C1 1F 06            [ 2]  655 	ldw	(0x06, sp), x
      0087C3 5F               [ 1]  656 	clrw	x
      0087C4 97               [ 1]  657 	ld	xl, a
      0087C5 72 FB 06         [ 2]  658 	addw	x, (0x06, sp)
      0087C8 F6               [ 1]  659 	ld	a, (x)
                                    660 ;	lib/stm8s_clk.c: 548: clockfrequency = HSI_VALUE / presc;
      0087C9 5F               [ 1]  661 	clrw	x
      0087CA 97               [ 1]  662 	ld	xl, a
      0087CB 90 5F            [ 1]  663 	clrw	y
      0087CD 89               [ 2]  664 	pushw	x
      0087CE 90 89            [ 2]  665 	pushw	y
      0087D0 4B 00            [ 1]  666 	push	#0x00
      0087D2 4B 24            [ 1]  667 	push	#0x24
      0087D4 4B F4            [ 1]  668 	push	#0xf4
      0087D6 4B 00            [ 1]  669 	push	#0x00
      0087D8 CD 91 27         [ 4]  670 	call	__divulong
      0087DB 5B 08            [ 2]  671 	addw	sp, #8
      0087DD 1F 04            [ 2]  672 	ldw	(0x04, sp), x
      0087DF 20 1A            [ 2]  673 	jra	00106$
      0087E1                        674 00105$:
                                    675 ;	lib/stm8s_clk.c: 550: else if ( clocksource == CLK_SOURCE_LSI)
      0087E1 7B 01            [ 1]  676 	ld	a, (0x01, sp)
      0087E3 A1 D2            [ 1]  677 	cp	a, #0xd2
      0087E5 26 0B            [ 1]  678 	jrne	00102$
                                    679 ;	lib/stm8s_clk.c: 552: clockfrequency = LSI_VALUE;
      0087E7 AE F4 00         [ 2]  680 	ldw	x, #0xf400
      0087EA 1F 04            [ 2]  681 	ldw	(0x04, sp), x
      0087EC 90 AE 00 01      [ 2]  682 	ldw	y, #0x0001
      0087F0 20 09            [ 2]  683 	jra	00106$
      0087F2                        684 00102$:
                                    685 ;	lib/stm8s_clk.c: 556: clockfrequency = HSE_VALUE;
      0087F2 AE 24 00         [ 2]  686 	ldw	x, #0x2400
      0087F5 1F 04            [ 2]  687 	ldw	(0x04, sp), x
      0087F7 90 AE 00 F4      [ 2]  688 	ldw	y, #0x00f4
      0087FB                        689 00106$:
                                    690 ;	lib/stm8s_clk.c: 559: return((uint32_t)clockfrequency);
      0087FB 1E 04            [ 2]  691 	ldw	x, (0x04, sp)
      0087FD 5B 07            [ 2]  692 	addw	sp, #7
      0087FF 81               [ 4]  693 	ret
                                    694 ;	lib/stm8s_clk.c: 569: void CLK_AdjustHSICalibrationValue(CLK_HSITrimValue_TypeDef CLK_HSICalibrationValue)
                                    695 ;	-----------------------------------------
                                    696 ;	 function CLK_AdjustHSICalibrationValue
                                    697 ;	-----------------------------------------
      008800                        698 _CLK_AdjustHSICalibrationValue:
                                    699 ;	lib/stm8s_clk.c: 573: CLK->HSITRIMR = (uint8_t)( (uint8_t)(CLK->HSITRIMR & (uint8_t)(~CLK_HSITRIMR_HSITRIM))|((uint8_t)CLK_HSICalibrationValue));
      008800 AE 50 CC         [ 2]  700 	ldw	x, #0x50cc
      008803 F6               [ 1]  701 	ld	a, (x)
      008804 A4 F8            [ 1]  702 	and	a, #0xf8
      008806 1A 03            [ 1]  703 	or	a, (0x03, sp)
      008808 AE 50 CC         [ 2]  704 	ldw	x, #0x50cc
      00880B F7               [ 1]  705 	ld	(x), a
      00880C 81               [ 4]  706 	ret
                                    707 ;	lib/stm8s_clk.c: 585: void CLK_SYSCLKEmergencyClear(void)
                                    708 ;	-----------------------------------------
                                    709 ;	 function CLK_SYSCLKEmergencyClear
                                    710 ;	-----------------------------------------
      00880D                        711 _CLK_SYSCLKEmergencyClear:
                                    712 ;	lib/stm8s_clk.c: 587: CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWBSY);
      00880D 72 11 50 C5      [ 1]  713 	bres	0x50c5, #0
      008811 81               [ 4]  714 	ret
                                    715 ;	lib/stm8s_clk.c: 597: FlagStatus CLK_GetFlagStatus(CLK_Flag_TypeDef CLK_FLAG)
                                    716 ;	-----------------------------------------
                                    717 ;	 function CLK_GetFlagStatus
                                    718 ;	-----------------------------------------
      008812                        719 _CLK_GetFlagStatus:
      008812 88               [ 1]  720 	push	a
                                    721 ;	lib/stm8s_clk.c: 604: statusreg = (uint16_t)((uint16_t)CLK_FLAG & (uint16_t)0xFF00);
      008813 4F               [ 1]  722 	clr	a
      008814 97               [ 1]  723 	ld	xl, a
      008815 7B 04            [ 1]  724 	ld	a, (0x04, sp)
      008817 95               [ 1]  725 	ld	xh, a
                                    726 ;	lib/stm8s_clk.c: 607: if (statusreg == 0x0100) /* The flag to check is in ICKRregister */
      008818 A3 01 00         [ 2]  727 	cpw	x, #0x0100
      00881B 26 06            [ 1]  728 	jrne	00111$
                                    729 ;	lib/stm8s_clk.c: 609: tmpreg = CLK->ICKR;
      00881D AE 50 C0         [ 2]  730 	ldw	x, #0x50c0
      008820 F6               [ 1]  731 	ld	a, (x)
      008821 20 25            [ 2]  732 	jra	00112$
      008823                        733 00111$:
                                    734 ;	lib/stm8s_clk.c: 611: else if (statusreg == 0x0200) /* The flag to check is in ECKRregister */
      008823 A3 02 00         [ 2]  735 	cpw	x, #0x0200
      008826 26 06            [ 1]  736 	jrne	00108$
                                    737 ;	lib/stm8s_clk.c: 613: tmpreg = CLK->ECKR;
      008828 AE 50 C1         [ 2]  738 	ldw	x, #0x50c1
      00882B F6               [ 1]  739 	ld	a, (x)
      00882C 20 1A            [ 2]  740 	jra	00112$
      00882E                        741 00108$:
                                    742 ;	lib/stm8s_clk.c: 615: else if (statusreg == 0x0300) /* The flag to check is in SWIC register */
      00882E A3 03 00         [ 2]  743 	cpw	x, #0x0300
      008831 26 06            [ 1]  744 	jrne	00105$
                                    745 ;	lib/stm8s_clk.c: 617: tmpreg = CLK->SWCR;
      008833 AE 50 C5         [ 2]  746 	ldw	x, #0x50c5
      008836 F6               [ 1]  747 	ld	a, (x)
      008837 20 0F            [ 2]  748 	jra	00112$
      008839                        749 00105$:
                                    750 ;	lib/stm8s_clk.c: 619: else if (statusreg == 0x0400) /* The flag to check is in CSS register */
      008839 A3 04 00         [ 2]  751 	cpw	x, #0x0400
      00883C 26 06            [ 1]  752 	jrne	00102$
                                    753 ;	lib/stm8s_clk.c: 621: tmpreg = CLK->CSSR;
      00883E AE 50 C8         [ 2]  754 	ldw	x, #0x50c8
      008841 F6               [ 1]  755 	ld	a, (x)
      008842 20 04            [ 2]  756 	jra	00112$
      008844                        757 00102$:
                                    758 ;	lib/stm8s_clk.c: 625: tmpreg = CLK->CCOR;
      008844 AE 50 C9         [ 2]  759 	ldw	x, #0x50c9
      008847 F6               [ 1]  760 	ld	a, (x)
      008848                        761 00112$:
                                    762 ;	lib/stm8s_clk.c: 628: if ((tmpreg & (uint8_t)CLK_FLAG) != (uint8_t)RESET)
      008848 88               [ 1]  763 	push	a
      008849 7B 06            [ 1]  764 	ld	a, (0x06, sp)
      00884B 6B 02            [ 1]  765 	ld	(0x02, sp), a
      00884D 84               [ 1]  766 	pop	a
      00884E 14 01            [ 1]  767 	and	a, (0x01, sp)
      008850 4D               [ 1]  768 	tnz	a
      008851 27 03            [ 1]  769 	jreq	00114$
                                    770 ;	lib/stm8s_clk.c: 630: bitstatus = SET;
      008853 A6 01            [ 1]  771 	ld	a, #0x01
                                    772 ;	lib/stm8s_clk.c: 634: bitstatus = RESET;
      008855 21                     773 	.byte 0x21
      008856                        774 00114$:
      008856 4F               [ 1]  775 	clr	a
      008857                        776 00115$:
                                    777 ;	lib/stm8s_clk.c: 638: return((FlagStatus)bitstatus);
      008857 5B 01            [ 2]  778 	addw	sp, #1
      008859 81               [ 4]  779 	ret
                                    780 ;	lib/stm8s_clk.c: 647: ITStatus CLK_GetITStatus(CLK_IT_TypeDef CLK_IT)
                                    781 ;	-----------------------------------------
                                    782 ;	 function CLK_GetITStatus
                                    783 ;	-----------------------------------------
      00885A                        784 _CLK_GetITStatus:
                                    785 ;	lib/stm8s_clk.c: 651: if (CLK_IT == CLK_IT_SWIF)
      00885A 7B 03            [ 1]  786 	ld	a, (0x03, sp)
      00885C A1 1C            [ 1]  787 	cp	a, #0x1c
      00885E 26 0F            [ 1]  788 	jrne	00108$
                                    789 ;	lib/stm8s_clk.c: 654: if ((CLK->SWCR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
      008860 AE 50 C5         [ 2]  790 	ldw	x, #0x50c5
      008863 F6               [ 1]  791 	ld	a, (x)
      008864 14 03            [ 1]  792 	and	a, (0x03, sp)
      008866 A1 0C            [ 1]  793 	cp	a, #0x0c
      008868 26 03            [ 1]  794 	jrne	00102$
                                    795 ;	lib/stm8s_clk.c: 656: bitstatus = SET;
      00886A A6 01            [ 1]  796 	ld	a, #0x01
      00886C 81               [ 4]  797 	ret
      00886D                        798 00102$:
                                    799 ;	lib/stm8s_clk.c: 660: bitstatus = RESET;
      00886D 4F               [ 1]  800 	clr	a
      00886E 81               [ 4]  801 	ret
      00886F                        802 00108$:
                                    803 ;	lib/stm8s_clk.c: 666: if ((CLK->CSSR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
      00886F AE 50 C8         [ 2]  804 	ldw	x, #0x50c8
      008872 F6               [ 1]  805 	ld	a, (x)
      008873 14 03            [ 1]  806 	and	a, (0x03, sp)
      008875 A1 0C            [ 1]  807 	cp	a, #0x0c
      008877 26 03            [ 1]  808 	jrne	00105$
                                    809 ;	lib/stm8s_clk.c: 668: bitstatus = SET;
      008879 A6 01            [ 1]  810 	ld	a, #0x01
      00887B 81               [ 4]  811 	ret
      00887C                        812 00105$:
                                    813 ;	lib/stm8s_clk.c: 672: bitstatus = RESET;
      00887C 4F               [ 1]  814 	clr	a
                                    815 ;	lib/stm8s_clk.c: 677: return bitstatus;
      00887D 81               [ 4]  816 	ret
                                    817 ;	lib/stm8s_clk.c: 686: void CLK_ClearITPendingBit(CLK_IT_TypeDef CLK_IT)
                                    818 ;	-----------------------------------------
                                    819 ;	 function CLK_ClearITPendingBit
                                    820 ;	-----------------------------------------
      00887E                        821 _CLK_ClearITPendingBit:
                                    822 ;	lib/stm8s_clk.c: 689: if (CLK_IT == (uint8_t)CLK_IT_CSSD)
      00887E 7B 03            [ 1]  823 	ld	a, (0x03, sp)
      008880 A1 0C            [ 1]  824 	cp	a, #0x0c
      008882 26 08            [ 1]  825 	jrne	00102$
                                    826 ;	lib/stm8s_clk.c: 692: CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSD);
      008884 AE 50 C8         [ 2]  827 	ldw	x, #0x50c8
      008887 F6               [ 1]  828 	ld	a, (x)
      008888 A4 F7            [ 1]  829 	and	a, #0xf7
      00888A F7               [ 1]  830 	ld	(x), a
      00888B 81               [ 4]  831 	ret
      00888C                        832 00102$:
                                    833 ;	lib/stm8s_clk.c: 697: CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIF);
      00888C AE 50 C5         [ 2]  834 	ldw	x, #0x50c5
      00888F F6               [ 1]  835 	ld	a, (x)
      008890 A4 F7            [ 1]  836 	and	a, #0xf7
      008892 F7               [ 1]  837 	ld	(x), a
      008893 81               [ 4]  838 	ret
                                    839 	.area CODE
      008894                        840 _HSIDivFactor:
      008894 01                     841 	.db #0x01	; 1
      008895 02                     842 	.db #0x02	; 2
      008896 04                     843 	.db #0x04	; 4
      008897 08                     844 	.db #0x08	; 8
      008898                        845 _CLKPrescTable:
      008898 01                     846 	.db #0x01	; 1
      008899 02                     847 	.db #0x02	; 2
      00889A 04                     848 	.db #0x04	; 4
      00889B 08                     849 	.db #0x08	; 8
      00889C 0A                     850 	.db #0x0a	; 10
      00889D 10                     851 	.db #0x10	; 16
      00889E 14                     852 	.db #0x14	; 20
      00889F 28                     853 	.db #0x28	; 40
                                    854 	.area INITIALIZER
                                    855 	.area CABS (ABS)
