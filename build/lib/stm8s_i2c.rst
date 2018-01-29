                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 3.6.0 #9615 (Mac OS X x86_64)
                                      4 ;--------------------------------------------------------
                                      5 	.module stm8s_i2c
                                      6 	.optsdcc -mstm8
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _assert_failed
                                     12 	.globl _I2C_DeInit
                                     13 	.globl _I2C_Init
                                     14 	.globl _I2C_Cmd
                                     15 	.globl _I2C_GeneralCallCmd
                                     16 	.globl _I2C_GenerateSTART
                                     17 	.globl _I2C_GenerateSTOP
                                     18 	.globl _I2C_SoftwareResetCmd
                                     19 	.globl _I2C_StretchClockCmd
                                     20 	.globl _I2C_AcknowledgeConfig
                                     21 	.globl _I2C_ITConfig
                                     22 	.globl _I2C_FastModeDutyCycleConfig
                                     23 	.globl _I2C_ReceiveData
                                     24 	.globl _I2C_Send7bitAddress
                                     25 	.globl _I2C_SendData
                                     26 	.globl _I2C_CheckEvent
                                     27 	.globl _I2C_GetLastEvent
                                     28 	.globl _I2C_GetFlagStatus
                                     29 	.globl _I2C_ClearFlag
                                     30 	.globl _I2C_GetITStatus
                                     31 	.globl _I2C_ClearITPendingBit
                                     32 ;--------------------------------------------------------
                                     33 ; ram data
                                     34 ;--------------------------------------------------------
                                     35 	.area DATA
                                     36 ;--------------------------------------------------------
                                     37 ; ram data
                                     38 ;--------------------------------------------------------
                                     39 	.area INITIALIZED
                                     40 ;--------------------------------------------------------
                                     41 ; absolute external ram data
                                     42 ;--------------------------------------------------------
                                     43 	.area DABS (ABS)
                                     44 ;--------------------------------------------------------
                                     45 ; global & static initialisations
                                     46 ;--------------------------------------------------------
                                     47 	.area HOME
                                     48 	.area GSINIT
                                     49 	.area GSFINAL
                                     50 	.area GSINIT
                                     51 ;--------------------------------------------------------
                                     52 ; Home
                                     53 ;--------------------------------------------------------
                                     54 	.area HOME
                                     55 	.area HOME
                                     56 ;--------------------------------------------------------
                                     57 ; code
                                     58 ;--------------------------------------------------------
                                     59 	.area CODE
                                     60 ;	lib/stm8s_i2c.c: 67: void I2C_DeInit(void)
                                     61 ;	-----------------------------------------
                                     62 ;	 function I2C_DeInit
                                     63 ;	-----------------------------------------
      00897B                         64 _I2C_DeInit:
                                     65 ;	lib/stm8s_i2c.c: 69: I2C->CR1 = I2C_CR1_RESET_VALUE;
      00897B 35 00 52 10      [ 1]   66 	mov	0x5210+0, #0x00
                                     67 ;	lib/stm8s_i2c.c: 70: I2C->CR2 = I2C_CR2_RESET_VALUE;
      00897F 35 00 52 11      [ 1]   68 	mov	0x5211+0, #0x00
                                     69 ;	lib/stm8s_i2c.c: 71: I2C->FREQR = I2C_FREQR_RESET_VALUE;
      008983 35 00 52 12      [ 1]   70 	mov	0x5212+0, #0x00
                                     71 ;	lib/stm8s_i2c.c: 72: I2C->OARL = I2C_OARL_RESET_VALUE;
      008987 35 00 52 13      [ 1]   72 	mov	0x5213+0, #0x00
                                     73 ;	lib/stm8s_i2c.c: 73: I2C->OARH = I2C_OARH_RESET_VALUE;
      00898B 35 00 52 14      [ 1]   74 	mov	0x5214+0, #0x00
                                     75 ;	lib/stm8s_i2c.c: 74: I2C->ITR = I2C_ITR_RESET_VALUE;
      00898F 35 00 52 1A      [ 1]   76 	mov	0x521a+0, #0x00
                                     77 ;	lib/stm8s_i2c.c: 75: I2C->CCRL = I2C_CCRL_RESET_VALUE;
      008993 35 00 52 1B      [ 1]   78 	mov	0x521b+0, #0x00
                                     79 ;	lib/stm8s_i2c.c: 76: I2C->CCRH = I2C_CCRH_RESET_VALUE;
      008997 35 00 52 1C      [ 1]   80 	mov	0x521c+0, #0x00
                                     81 ;	lib/stm8s_i2c.c: 77: I2C->TRISER = I2C_TRISER_RESET_VALUE;
      00899B 35 02 52 1D      [ 1]   82 	mov	0x521d+0, #0x02
      00899F 81               [ 4]   83 	ret
                                     84 ;	lib/stm8s_i2c.c: 96: void I2C_Init(uint32_t OutputClockFrequencyHz, uint16_t OwnAddress, 
                                     85 ;	-----------------------------------------
                                     86 ;	 function I2C_Init
                                     87 ;	-----------------------------------------
      0089A0                         88 _I2C_Init:
      0089A0 52 0E            [ 2]   89 	sub	sp, #14
                                     90 ;	lib/stm8s_i2c.c: 102: uint8_t tmpccrh = 0;
      0089A2 0F 03            [ 1]   91 	clr	(0x03, sp)
                                     92 ;	lib/stm8s_i2c.c: 105: assert_param(IS_I2C_ACK_OK(Ack));
      0089A4 0D 18            [ 1]   93 	tnz	(0x18, sp)
      0089A6 27 1D            [ 1]   94 	jreq	00114$
      0089A8 7B 18            [ 1]   95 	ld	a, (0x18, sp)
      0089AA A1 01            [ 1]   96 	cp	a, #0x01
      0089AC 27 17            [ 1]   97 	jreq	00114$
      0089AE 7B 18            [ 1]   98 	ld	a, (0x18, sp)
      0089B0 A1 02            [ 1]   99 	cp	a, #0x02
      0089B2 27 11            [ 1]  100 	jreq	00114$
      0089B4 AE 90 BE         [ 2]  101 	ldw	x, #___str_0+0
      0089B7 4B 69            [ 1]  102 	push	#0x69
      0089B9 4B 00            [ 1]  103 	push	#0x00
      0089BB 4B 00            [ 1]  104 	push	#0x00
      0089BD 4B 00            [ 1]  105 	push	#0x00
      0089BF 89               [ 2]  106 	pushw	x
      0089C0 CD 00 00         [ 4]  107 	call	_assert_failed
      0089C3 5B 06            [ 2]  108 	addw	sp, #6
      0089C5                        109 00114$:
                                    110 ;	lib/stm8s_i2c.c: 106: assert_param(IS_I2C_ADDMODE_OK(AddMode));
      0089C5 0D 19            [ 1]  111 	tnz	(0x19, sp)
      0089C7 27 17            [ 1]  112 	jreq	00122$
      0089C9 7B 19            [ 1]  113 	ld	a, (0x19, sp)
      0089CB A1 80            [ 1]  114 	cp	a, #0x80
      0089CD 27 11            [ 1]  115 	jreq	00122$
      0089CF AE 90 BE         [ 2]  116 	ldw	x, #___str_0+0
      0089D2 4B 6A            [ 1]  117 	push	#0x6a
      0089D4 4B 00            [ 1]  118 	push	#0x00
      0089D6 4B 00            [ 1]  119 	push	#0x00
      0089D8 4B 00            [ 1]  120 	push	#0x00
      0089DA 89               [ 2]  121 	pushw	x
      0089DB CD 00 00         [ 4]  122 	call	_assert_failed
      0089DE 5B 06            [ 2]  123 	addw	sp, #6
      0089E0                        124 00122$:
                                    125 ;	lib/stm8s_i2c.c: 107: assert_param(IS_I2C_OWN_ADDRESS_OK(OwnAddress));
      0089E0 1E 15            [ 2]  126 	ldw	x, (0x15, sp)
      0089E2 A3 03 FF         [ 2]  127 	cpw	x, #0x03ff
      0089E5 23 11            [ 2]  128 	jrule	00127$
      0089E7 AE 90 BE         [ 2]  129 	ldw	x, #___str_0+0
      0089EA 4B 6B            [ 1]  130 	push	#0x6b
      0089EC 4B 00            [ 1]  131 	push	#0x00
      0089EE 4B 00            [ 1]  132 	push	#0x00
      0089F0 4B 00            [ 1]  133 	push	#0x00
      0089F2 89               [ 2]  134 	pushw	x
      0089F3 CD 00 00         [ 4]  135 	call	_assert_failed
      0089F6 5B 06            [ 2]  136 	addw	sp, #6
      0089F8                        137 00127$:
                                    138 ;	lib/stm8s_i2c.c: 108: assert_param(IS_I2C_DUTYCYCLE_OK(I2C_DutyCycle));  
      0089F8 0D 17            [ 1]  139 	tnz	(0x17, sp)
      0089FA 27 17            [ 1]  140 	jreq	00129$
      0089FC 7B 17            [ 1]  141 	ld	a, (0x17, sp)
      0089FE A1 40            [ 1]  142 	cp	a, #0x40
      008A00 27 11            [ 1]  143 	jreq	00129$
      008A02 AE 90 BE         [ 2]  144 	ldw	x, #___str_0+0
      008A05 4B 6C            [ 1]  145 	push	#0x6c
      008A07 4B 00            [ 1]  146 	push	#0x00
      008A09 4B 00            [ 1]  147 	push	#0x00
      008A0B 4B 00            [ 1]  148 	push	#0x00
      008A0D 89               [ 2]  149 	pushw	x
      008A0E CD 00 00         [ 4]  150 	call	_assert_failed
      008A11 5B 06            [ 2]  151 	addw	sp, #6
      008A13                        152 00129$:
                                    153 ;	lib/stm8s_i2c.c: 109: assert_param(IS_I2C_INPUT_CLOCK_FREQ_OK(InputClockFrequencyMHz));
      008A13 7B 1A            [ 1]  154 	ld	a, (0x1a, sp)
      008A15 A1 01            [ 1]  155 	cp	a, #0x01
      008A17 25 06            [ 1]  156 	jrc	00133$
      008A19 7B 1A            [ 1]  157 	ld	a, (0x1a, sp)
      008A1B A1 10            [ 1]  158 	cp	a, #0x10
      008A1D 23 11            [ 2]  159 	jrule	00134$
      008A1F                        160 00133$:
      008A1F AE 90 BE         [ 2]  161 	ldw	x, #___str_0+0
      008A22 4B 6D            [ 1]  162 	push	#0x6d
      008A24 4B 00            [ 1]  163 	push	#0x00
      008A26 4B 00            [ 1]  164 	push	#0x00
      008A28 4B 00            [ 1]  165 	push	#0x00
      008A2A 89               [ 2]  166 	pushw	x
      008A2B CD 00 00         [ 4]  167 	call	_assert_failed
      008A2E 5B 06            [ 2]  168 	addw	sp, #6
      008A30                        169 00134$:
                                    170 ;	lib/stm8s_i2c.c: 110: assert_param(IS_I2C_OUTPUT_CLOCK_FREQ_OK(OutputClockFrequencyHz));
      008A30 1E 13            [ 2]  171 	ldw	x, (0x13, sp)
      008A32 A3 00 01         [ 2]  172 	cpw	x, #0x0001
      008A35 7B 12            [ 1]  173 	ld	a, (0x12, sp)
      008A37 A2 00            [ 1]  174 	sbc	a, #0x00
      008A39 7B 11            [ 1]  175 	ld	a, (0x11, sp)
      008A3B A2 00            [ 1]  176 	sbc	a, #0x00
      008A3D 25 0E            [ 1]  177 	jrc	00138$
      008A3F AE 1A 80         [ 2]  178 	ldw	x, #0x1a80
      008A42 13 13            [ 2]  179 	cpw	x, (0x13, sp)
      008A44 A6 06            [ 1]  180 	ld	a, #0x06
      008A46 12 12            [ 1]  181 	sbc	a, (0x12, sp)
      008A48 4F               [ 1]  182 	clr	a
      008A49 12 11            [ 1]  183 	sbc	a, (0x11, sp)
      008A4B 24 11            [ 1]  184 	jrnc	00139$
      008A4D                        185 00138$:
      008A4D AE 90 BE         [ 2]  186 	ldw	x, #___str_0+0
      008A50 4B 6E            [ 1]  187 	push	#0x6e
      008A52 4B 00            [ 1]  188 	push	#0x00
      008A54 4B 00            [ 1]  189 	push	#0x00
      008A56 4B 00            [ 1]  190 	push	#0x00
      008A58 89               [ 2]  191 	pushw	x
      008A59 CD 00 00         [ 4]  192 	call	_assert_failed
      008A5C 5B 06            [ 2]  193 	addw	sp, #6
      008A5E                        194 00139$:
                                    195 ;	lib/stm8s_i2c.c: 115: I2C->FREQR &= (uint8_t)(~I2C_FREQR_FREQ);
      008A5E AE 52 12         [ 2]  196 	ldw	x, #0x5212
      008A61 F6               [ 1]  197 	ld	a, (x)
      008A62 A4 C0            [ 1]  198 	and	a, #0xc0
      008A64 F7               [ 1]  199 	ld	(x), a
                                    200 ;	lib/stm8s_i2c.c: 117: I2C->FREQR |= InputClockFrequencyMHz;
      008A65 AE 52 12         [ 2]  201 	ldw	x, #0x5212
      008A68 F6               [ 1]  202 	ld	a, (x)
      008A69 1A 1A            [ 1]  203 	or	a, (0x1a, sp)
      008A6B AE 52 12         [ 2]  204 	ldw	x, #0x5212
      008A6E F7               [ 1]  205 	ld	(x), a
                                    206 ;	lib/stm8s_i2c.c: 121: I2C->CR1 &= (uint8_t)(~I2C_CR1_PE);
      008A6F 72 11 52 10      [ 1]  207 	bres	0x5210, #0
                                    208 ;	lib/stm8s_i2c.c: 124: I2C->CCRH &= (uint8_t)(~(I2C_CCRH_FS | I2C_CCRH_DUTY | I2C_CCRH_CCR));
      008A73 AE 52 1C         [ 2]  209 	ldw	x, #0x521c
      008A76 F6               [ 1]  210 	ld	a, (x)
      008A77 A4 30            [ 1]  211 	and	a, #0x30
      008A79 F7               [ 1]  212 	ld	(x), a
                                    213 ;	lib/stm8s_i2c.c: 125: I2C->CCRL &= (uint8_t)(~I2C_CCRL_CCR);
      008A7A AE 52 1B         [ 2]  214 	ldw	x, #0x521b
      008A7D F6               [ 1]  215 	ld	a, (x)
      008A7E 35 00 52 1B      [ 1]  216 	mov	0x521b+0, #0x00
                                    217 ;	lib/stm8s_i2c.c: 136: result = (uint16_t) ((InputClockFrequencyMHz * 1000000) / (OutputClockFrequencyHz * 3));
      008A82 5F               [ 1]  218 	clrw	x
      008A83 7B 1A            [ 1]  219 	ld	a, (0x1a, sp)
      008A85 97               [ 1]  220 	ld	xl, a
      008A86 90 5F            [ 1]  221 	clrw	y
      008A88 89               [ 2]  222 	pushw	x
      008A89 90 89            [ 2]  223 	pushw	y
      008A8B 4B 40            [ 1]  224 	push	#0x40
      008A8D 4B 42            [ 1]  225 	push	#0x42
      008A8F 4B 0F            [ 1]  226 	push	#0x0f
      008A91 4B 00            [ 1]  227 	push	#0x00
      008A93 CD 91 81         [ 4]  228 	call	__mullong
      008A96 5B 08            [ 2]  229 	addw	sp, #8
      008A98 1F 0D            [ 2]  230 	ldw	(0x0d, sp), x
      008A9A 17 0B            [ 2]  231 	ldw	(0x0b, sp), y
                                    232 ;	lib/stm8s_i2c.c: 128: if (OutputClockFrequencyHz > I2C_MAX_STANDARD_FREQ) /* FAST MODE */
      008A9C AE 86 A0         [ 2]  233 	ldw	x, #0x86a0
      008A9F 13 13            [ 2]  234 	cpw	x, (0x13, sp)
      008AA1 A6 01            [ 1]  235 	ld	a, #0x01
      008AA3 12 12            [ 1]  236 	sbc	a, (0x12, sp)
      008AA5 4F               [ 1]  237 	clr	a
      008AA6 12 11            [ 1]  238 	sbc	a, (0x11, sp)
      008AA8 24 7A            [ 1]  239 	jrnc	00109$
                                    240 ;	lib/stm8s_i2c.c: 131: tmpccrh = I2C_CCRH_FS;
      008AAA A6 80            [ 1]  241 	ld	a, #0x80
      008AAC 6B 03            [ 1]  242 	ld	(0x03, sp), a
                                    243 ;	lib/stm8s_i2c.c: 133: if (I2C_DutyCycle == I2C_DUTYCYCLE_2)
      008AAE 0D 17            [ 1]  244 	tnz	(0x17, sp)
      008AB0 26 23            [ 1]  245 	jrne	00102$
                                    246 ;	lib/stm8s_i2c.c: 136: result = (uint16_t) ((InputClockFrequencyMHz * 1000000) / (OutputClockFrequencyHz * 3));
      008AB2 1E 13            [ 2]  247 	ldw	x, (0x13, sp)
      008AB4 89               [ 2]  248 	pushw	x
      008AB5 1E 13            [ 2]  249 	ldw	x, (0x13, sp)
      008AB7 89               [ 2]  250 	pushw	x
      008AB8 4B 03            [ 1]  251 	push	#0x03
      008ABA 5F               [ 1]  252 	clrw	x
      008ABB 89               [ 2]  253 	pushw	x
      008ABC 4B 00            [ 1]  254 	push	#0x00
      008ABE CD 91 81         [ 4]  255 	call	__mullong
      008AC1 5B 08            [ 2]  256 	addw	sp, #8
      008AC3 89               [ 2]  257 	pushw	x
      008AC4 90 89            [ 2]  258 	pushw	y
      008AC6 1E 11            [ 2]  259 	ldw	x, (0x11, sp)
      008AC8 89               [ 2]  260 	pushw	x
      008AC9 1E 11            [ 2]  261 	ldw	x, (0x11, sp)
      008ACB 89               [ 2]  262 	pushw	x
      008ACC CD 91 27         [ 4]  263 	call	__divulong
      008ACF 5B 08            [ 2]  264 	addw	sp, #8
      008AD1 1F 01            [ 2]  265 	ldw	(0x01, sp), x
      008AD3 20 2B            [ 2]  266 	jra	00103$
      008AD5                        267 00102$:
                                    268 ;	lib/stm8s_i2c.c: 141: result = (uint16_t) ((InputClockFrequencyMHz * 1000000) / (OutputClockFrequencyHz * 25));
      008AD5 1E 13            [ 2]  269 	ldw	x, (0x13, sp)
      008AD7 89               [ 2]  270 	pushw	x
      008AD8 1E 13            [ 2]  271 	ldw	x, (0x13, sp)
      008ADA 89               [ 2]  272 	pushw	x
      008ADB 4B 19            [ 1]  273 	push	#0x19
      008ADD 5F               [ 1]  274 	clrw	x
      008ADE 89               [ 2]  275 	pushw	x
      008ADF 4B 00            [ 1]  276 	push	#0x00
      008AE1 CD 91 81         [ 4]  277 	call	__mullong
      008AE4 5B 08            [ 2]  278 	addw	sp, #8
      008AE6 17 06            [ 2]  279 	ldw	(0x06, sp), y
      008AE8 9F               [ 1]  280 	ld	a, xl
      008AE9 88               [ 1]  281 	push	a
      008AEA 9E               [ 1]  282 	ld	a, xh
      008AEB 88               [ 1]  283 	push	a
      008AEC 1E 08            [ 2]  284 	ldw	x, (0x08, sp)
      008AEE 89               [ 2]  285 	pushw	x
      008AEF 1E 11            [ 2]  286 	ldw	x, (0x11, sp)
      008AF1 89               [ 2]  287 	pushw	x
      008AF2 1E 11            [ 2]  288 	ldw	x, (0x11, sp)
      008AF4 89               [ 2]  289 	pushw	x
      008AF5 CD 91 27         [ 4]  290 	call	__divulong
      008AF8 5B 08            [ 2]  291 	addw	sp, #8
      008AFA 1F 01            [ 2]  292 	ldw	(0x01, sp), x
                                    293 ;	lib/stm8s_i2c.c: 143: tmpccrh |= I2C_CCRH_DUTY;
      008AFC A6 C0            [ 1]  294 	ld	a, #0xc0
      008AFE 6B 03            [ 1]  295 	ld	(0x03, sp), a
      008B00                        296 00103$:
                                    297 ;	lib/stm8s_i2c.c: 147: if (result < (uint16_t)0x01)
      008B00 1E 01            [ 2]  298 	ldw	x, (0x01, sp)
      008B02 A3 00 01         [ 2]  299 	cpw	x, #0x0001
      008B05 24 05            [ 1]  300 	jrnc	00105$
                                    301 ;	lib/stm8s_i2c.c: 150: result = (uint16_t)0x0001;
      008B07 AE 00 01         [ 2]  302 	ldw	x, #0x0001
      008B0A 1F 01            [ 2]  303 	ldw	(0x01, sp), x
      008B0C                        304 00105$:
                                    305 ;	lib/stm8s_i2c.c: 156: tmpval = ((InputClockFrequencyMHz * 3) / 10) + 1;
      008B0C 7B 1A            [ 1]  306 	ld	a, (0x1a, sp)
      008B0E 97               [ 1]  307 	ld	xl, a
      008B0F A6 03            [ 1]  308 	ld	a, #0x03
      008B11 42               [ 4]  309 	mul	x, a
      008B12 4B 0A            [ 1]  310 	push	#0x0a
      008B14 4B 00            [ 1]  311 	push	#0x00
      008B16 89               [ 2]  312 	pushw	x
      008B17 CD 91 FD         [ 4]  313 	call	__divsint
      008B1A 5B 04            [ 2]  314 	addw	sp, #4
      008B1C 5C               [ 2]  315 	incw	x
      008B1D 9F               [ 1]  316 	ld	a, xl
                                    317 ;	lib/stm8s_i2c.c: 157: I2C->TRISER = (uint8_t)tmpval;
      008B1E AE 52 1D         [ 2]  318 	ldw	x, #0x521d
      008B21 F7               [ 1]  319 	ld	(x), a
      008B22 20 2A            [ 2]  320 	jra	00110$
      008B24                        321 00109$:
                                    322 ;	lib/stm8s_i2c.c: 164: result = (uint16_t)((InputClockFrequencyMHz * 1000000) / (OutputClockFrequencyHz << (uint8_t)1));
      008B24 1E 13            [ 2]  323 	ldw	x, (0x13, sp)
      008B26 16 11            [ 2]  324 	ldw	y, (0x11, sp)
      008B28 58               [ 2]  325 	sllw	x
      008B29 90 59            [ 2]  326 	rlcw	y
      008B2B 89               [ 2]  327 	pushw	x
      008B2C 90 89            [ 2]  328 	pushw	y
      008B2E 1E 11            [ 2]  329 	ldw	x, (0x11, sp)
      008B30 89               [ 2]  330 	pushw	x
      008B31 1E 11            [ 2]  331 	ldw	x, (0x11, sp)
      008B33 89               [ 2]  332 	pushw	x
      008B34 CD 91 27         [ 4]  333 	call	__divulong
      008B37 5B 08            [ 2]  334 	addw	sp, #8
      008B39 1F 01            [ 2]  335 	ldw	(0x01, sp), x
                                    336 ;	lib/stm8s_i2c.c: 167: if (result < (uint16_t)0x0004)
      008B3B 1E 01            [ 2]  337 	ldw	x, (0x01, sp)
      008B3D A3 00 04         [ 2]  338 	cpw	x, #0x0004
      008B40 24 05            [ 1]  339 	jrnc	00107$
                                    340 ;	lib/stm8s_i2c.c: 170: result = (uint16_t)0x0004;
      008B42 AE 00 04         [ 2]  341 	ldw	x, #0x0004
      008B45 1F 01            [ 2]  342 	ldw	(0x01, sp), x
      008B47                        343 00107$:
                                    344 ;	lib/stm8s_i2c.c: 176: I2C->TRISER = (uint8_t)(InputClockFrequencyMHz + (uint8_t)1);
      008B47 7B 1A            [ 1]  345 	ld	a, (0x1a, sp)
      008B49 4C               [ 1]  346 	inc	a
      008B4A AE 52 1D         [ 2]  347 	ldw	x, #0x521d
      008B4D F7               [ 1]  348 	ld	(x), a
      008B4E                        349 00110$:
                                    350 ;	lib/stm8s_i2c.c: 181: I2C->CCRL = (uint8_t)result;
      008B4E 7B 02            [ 1]  351 	ld	a, (0x02, sp)
      008B50 AE 52 1B         [ 2]  352 	ldw	x, #0x521b
      008B53 F7               [ 1]  353 	ld	(x), a
                                    354 ;	lib/stm8s_i2c.c: 182: I2C->CCRH = (uint8_t)((uint8_t)((uint8_t)(result >> 8) & I2C_CCRH_CCR) | tmpccrh);
      008B54 7B 01            [ 1]  355 	ld	a, (0x01, sp)
      008B56 0F 04            [ 1]  356 	clr	(0x04, sp)
      008B58 A4 0F            [ 1]  357 	and	a, #0x0f
      008B5A 1A 03            [ 1]  358 	or	a, (0x03, sp)
      008B5C AE 52 1C         [ 2]  359 	ldw	x, #0x521c
      008B5F F7               [ 1]  360 	ld	(x), a
                                    361 ;	lib/stm8s_i2c.c: 185: I2C->CR1 |= I2C_CR1_PE;
      008B60 72 10 52 10      [ 1]  362 	bset	0x5210, #0
                                    363 ;	lib/stm8s_i2c.c: 188: I2C_AcknowledgeConfig(Ack);
      008B64 7B 18            [ 1]  364 	ld	a, (0x18, sp)
      008B66 88               [ 1]  365 	push	a
      008B67 CD 8C 8D         [ 4]  366 	call	_I2C_AcknowledgeConfig
      008B6A 84               [ 1]  367 	pop	a
                                    368 ;	lib/stm8s_i2c.c: 191: I2C->OARL = (uint8_t)(OwnAddress);
      008B6B 7B 16            [ 1]  369 	ld	a, (0x16, sp)
      008B6D AE 52 13         [ 2]  370 	ldw	x, #0x5213
      008B70 F7               [ 1]  371 	ld	(x), a
                                    372 ;	lib/stm8s_i2c.c: 192: I2C->OARH = (uint8_t)((uint8_t)(AddMode | I2C_OARH_ADDCONF) |
      008B71 7B 19            [ 1]  373 	ld	a, (0x19, sp)
      008B73 AA 40            [ 1]  374 	or	a, #0x40
      008B75 6B 0A            [ 1]  375 	ld	(0x0a, sp), a
                                    376 ;	lib/stm8s_i2c.c: 193: (uint8_t)((OwnAddress & (uint16_t)0x0300) >> (uint8_t)7));
      008B77 4F               [ 1]  377 	clr	a
      008B78 97               [ 1]  378 	ld	xl, a
      008B79 7B 15            [ 1]  379 	ld	a, (0x15, sp)
      008B7B A4 03            [ 1]  380 	and	a, #0x03
      008B7D 95               [ 1]  381 	ld	xh, a
      008B7E A6 80            [ 1]  382 	ld	a, #0x80
      008B80 62               [ 2]  383 	div	x, a
      008B81 9F               [ 1]  384 	ld	a, xl
      008B82 1A 0A            [ 1]  385 	or	a, (0x0a, sp)
      008B84 AE 52 14         [ 2]  386 	ldw	x, #0x5214
      008B87 F7               [ 1]  387 	ld	(x), a
      008B88 5B 0E            [ 2]  388 	addw	sp, #14
      008B8A 81               [ 4]  389 	ret
                                    390 ;	lib/stm8s_i2c.c: 202: void I2C_Cmd(FunctionalState NewState)
                                    391 ;	-----------------------------------------
                                    392 ;	 function I2C_Cmd
                                    393 ;	-----------------------------------------
      008B8B                        394 _I2C_Cmd:
                                    395 ;	lib/stm8s_i2c.c: 205: assert_param(IS_FUNCTIONALSTATE_OK(NewState));
      008B8B 0D 03            [ 1]  396 	tnz	(0x03, sp)
      008B8D 27 17            [ 1]  397 	jreq	00107$
      008B8F 7B 03            [ 1]  398 	ld	a, (0x03, sp)
      008B91 A1 01            [ 1]  399 	cp	a, #0x01
      008B93 27 11            [ 1]  400 	jreq	00107$
      008B95 AE 90 BE         [ 2]  401 	ldw	x, #___str_0+0
      008B98 4B CD            [ 1]  402 	push	#0xcd
      008B9A 4B 00            [ 1]  403 	push	#0x00
      008B9C 4B 00            [ 1]  404 	push	#0x00
      008B9E 4B 00            [ 1]  405 	push	#0x00
      008BA0 89               [ 2]  406 	pushw	x
      008BA1 CD 00 00         [ 4]  407 	call	_assert_failed
      008BA4 5B 06            [ 2]  408 	addw	sp, #6
      008BA6                        409 00107$:
                                    410 ;	lib/stm8s_i2c.c: 207: if (NewState != DISABLE)
      008BA6 0D 03            [ 1]  411 	tnz	(0x03, sp)
      008BA8 27 05            [ 1]  412 	jreq	00102$
                                    413 ;	lib/stm8s_i2c.c: 210: I2C->CR1 |= I2C_CR1_PE;
      008BAA 72 10 52 10      [ 1]  414 	bset	0x5210, #0
      008BAE 81               [ 4]  415 	ret
      008BAF                        416 00102$:
                                    417 ;	lib/stm8s_i2c.c: 215: I2C->CR1 &= (uint8_t)(~I2C_CR1_PE);
      008BAF 72 11 52 10      [ 1]  418 	bres	0x5210, #0
      008BB3 81               [ 4]  419 	ret
                                    420 ;	lib/stm8s_i2c.c: 225: void I2C_GeneralCallCmd(FunctionalState NewState)
                                    421 ;	-----------------------------------------
                                    422 ;	 function I2C_GeneralCallCmd
                                    423 ;	-----------------------------------------
      008BB4                        424 _I2C_GeneralCallCmd:
                                    425 ;	lib/stm8s_i2c.c: 228: assert_param(IS_FUNCTIONALSTATE_OK(NewState));
      008BB4 0D 03            [ 1]  426 	tnz	(0x03, sp)
      008BB6 27 17            [ 1]  427 	jreq	00107$
      008BB8 7B 03            [ 1]  428 	ld	a, (0x03, sp)
      008BBA A1 01            [ 1]  429 	cp	a, #0x01
      008BBC 27 11            [ 1]  430 	jreq	00107$
      008BBE AE 90 BE         [ 2]  431 	ldw	x, #___str_0+0
      008BC1 4B E4            [ 1]  432 	push	#0xe4
      008BC3 4B 00            [ 1]  433 	push	#0x00
      008BC5 4B 00            [ 1]  434 	push	#0x00
      008BC7 4B 00            [ 1]  435 	push	#0x00
      008BC9 89               [ 2]  436 	pushw	x
      008BCA CD 00 00         [ 4]  437 	call	_assert_failed
      008BCD 5B 06            [ 2]  438 	addw	sp, #6
      008BCF                        439 00107$:
                                    440 ;	lib/stm8s_i2c.c: 230: if (NewState != DISABLE)
      008BCF 0D 03            [ 1]  441 	tnz	(0x03, sp)
      008BD1 27 08            [ 1]  442 	jreq	00102$
                                    443 ;	lib/stm8s_i2c.c: 233: I2C->CR1 |= I2C_CR1_ENGC;
      008BD3 AE 52 10         [ 2]  444 	ldw	x, #0x5210
      008BD6 F6               [ 1]  445 	ld	a, (x)
      008BD7 AA 40            [ 1]  446 	or	a, #0x40
      008BD9 F7               [ 1]  447 	ld	(x), a
      008BDA 81               [ 4]  448 	ret
      008BDB                        449 00102$:
                                    450 ;	lib/stm8s_i2c.c: 238: I2C->CR1 &= (uint8_t)(~I2C_CR1_ENGC);
      008BDB AE 52 10         [ 2]  451 	ldw	x, #0x5210
      008BDE F6               [ 1]  452 	ld	a, (x)
      008BDF A4 BF            [ 1]  453 	and	a, #0xbf
      008BE1 F7               [ 1]  454 	ld	(x), a
      008BE2 81               [ 4]  455 	ret
                                    456 ;	lib/stm8s_i2c.c: 250: void I2C_GenerateSTART(FunctionalState NewState)
                                    457 ;	-----------------------------------------
                                    458 ;	 function I2C_GenerateSTART
                                    459 ;	-----------------------------------------
      008BE3                        460 _I2C_GenerateSTART:
                                    461 ;	lib/stm8s_i2c.c: 253: assert_param(IS_FUNCTIONALSTATE_OK(NewState));
      008BE3 0D 03            [ 1]  462 	tnz	(0x03, sp)
      008BE5 27 17            [ 1]  463 	jreq	00107$
      008BE7 7B 03            [ 1]  464 	ld	a, (0x03, sp)
      008BE9 A1 01            [ 1]  465 	cp	a, #0x01
      008BEB 27 11            [ 1]  466 	jreq	00107$
      008BED AE 90 BE         [ 2]  467 	ldw	x, #___str_0+0
      008BF0 4B FD            [ 1]  468 	push	#0xfd
      008BF2 4B 00            [ 1]  469 	push	#0x00
      008BF4 4B 00            [ 1]  470 	push	#0x00
      008BF6 4B 00            [ 1]  471 	push	#0x00
      008BF8 89               [ 2]  472 	pushw	x
      008BF9 CD 00 00         [ 4]  473 	call	_assert_failed
      008BFC 5B 06            [ 2]  474 	addw	sp, #6
      008BFE                        475 00107$:
                                    476 ;	lib/stm8s_i2c.c: 255: if (NewState != DISABLE)
      008BFE 0D 03            [ 1]  477 	tnz	(0x03, sp)
      008C00 27 05            [ 1]  478 	jreq	00102$
                                    479 ;	lib/stm8s_i2c.c: 258: I2C->CR2 |= I2C_CR2_START;
      008C02 72 10 52 11      [ 1]  480 	bset	0x5211, #0
      008C06 81               [ 4]  481 	ret
      008C07                        482 00102$:
                                    483 ;	lib/stm8s_i2c.c: 263: I2C->CR2 &= (uint8_t)(~I2C_CR2_START);
      008C07 72 11 52 11      [ 1]  484 	bres	0x5211, #0
      008C0B 81               [ 4]  485 	ret
                                    486 ;	lib/stm8s_i2c.c: 273: void I2C_GenerateSTOP(FunctionalState NewState)
                                    487 ;	-----------------------------------------
                                    488 ;	 function I2C_GenerateSTOP
                                    489 ;	-----------------------------------------
      008C0C                        490 _I2C_GenerateSTOP:
                                    491 ;	lib/stm8s_i2c.c: 276: assert_param(IS_FUNCTIONALSTATE_OK(NewState));
      008C0C 0D 03            [ 1]  492 	tnz	(0x03, sp)
      008C0E 27 17            [ 1]  493 	jreq	00107$
      008C10 7B 03            [ 1]  494 	ld	a, (0x03, sp)
      008C12 A1 01            [ 1]  495 	cp	a, #0x01
      008C14 27 11            [ 1]  496 	jreq	00107$
      008C16 AE 90 BE         [ 2]  497 	ldw	x, #___str_0+0
      008C19 4B 14            [ 1]  498 	push	#0x14
      008C1B 4B 01            [ 1]  499 	push	#0x01
      008C1D 4B 00            [ 1]  500 	push	#0x00
      008C1F 4B 00            [ 1]  501 	push	#0x00
      008C21 89               [ 2]  502 	pushw	x
      008C22 CD 00 00         [ 4]  503 	call	_assert_failed
      008C25 5B 06            [ 2]  504 	addw	sp, #6
      008C27                        505 00107$:
                                    506 ;	lib/stm8s_i2c.c: 278: if (NewState != DISABLE)
      008C27 0D 03            [ 1]  507 	tnz	(0x03, sp)
      008C29 27 08            [ 1]  508 	jreq	00102$
                                    509 ;	lib/stm8s_i2c.c: 281: I2C->CR2 |= I2C_CR2_STOP;
      008C2B AE 52 11         [ 2]  510 	ldw	x, #0x5211
      008C2E F6               [ 1]  511 	ld	a, (x)
      008C2F AA 02            [ 1]  512 	or	a, #0x02
      008C31 F7               [ 1]  513 	ld	(x), a
      008C32 81               [ 4]  514 	ret
      008C33                        515 00102$:
                                    516 ;	lib/stm8s_i2c.c: 286: I2C->CR2 &= (uint8_t)(~I2C_CR2_STOP);
      008C33 AE 52 11         [ 2]  517 	ldw	x, #0x5211
      008C36 F6               [ 1]  518 	ld	a, (x)
      008C37 A4 FD            [ 1]  519 	and	a, #0xfd
      008C39 F7               [ 1]  520 	ld	(x), a
      008C3A 81               [ 4]  521 	ret
                                    522 ;	lib/stm8s_i2c.c: 296: void I2C_SoftwareResetCmd(FunctionalState NewState)
                                    523 ;	-----------------------------------------
                                    524 ;	 function I2C_SoftwareResetCmd
                                    525 ;	-----------------------------------------
      008C3B                        526 _I2C_SoftwareResetCmd:
                                    527 ;	lib/stm8s_i2c.c: 299: assert_param(IS_FUNCTIONALSTATE_OK(NewState));
      008C3B 0D 03            [ 1]  528 	tnz	(0x03, sp)
      008C3D 27 17            [ 1]  529 	jreq	00107$
      008C3F 7B 03            [ 1]  530 	ld	a, (0x03, sp)
      008C41 A1 01            [ 1]  531 	cp	a, #0x01
      008C43 27 11            [ 1]  532 	jreq	00107$
      008C45 AE 90 BE         [ 2]  533 	ldw	x, #___str_0+0
      008C48 4B 2B            [ 1]  534 	push	#0x2b
      008C4A 4B 01            [ 1]  535 	push	#0x01
      008C4C 4B 00            [ 1]  536 	push	#0x00
      008C4E 4B 00            [ 1]  537 	push	#0x00
      008C50 89               [ 2]  538 	pushw	x
      008C51 CD 00 00         [ 4]  539 	call	_assert_failed
      008C54 5B 06            [ 2]  540 	addw	sp, #6
      008C56                        541 00107$:
                                    542 ;	lib/stm8s_i2c.c: 301: if (NewState != DISABLE)
      008C56 0D 03            [ 1]  543 	tnz	(0x03, sp)
      008C58 27 05            [ 1]  544 	jreq	00102$
                                    545 ;	lib/stm8s_i2c.c: 304: I2C->CR2 |= I2C_CR2_SWRST;
      008C5A 72 1E 52 11      [ 1]  546 	bset	0x5211, #7
      008C5E 81               [ 4]  547 	ret
      008C5F                        548 00102$:
                                    549 ;	lib/stm8s_i2c.c: 309: I2C->CR2 &= (uint8_t)(~I2C_CR2_SWRST);
      008C5F 72 1F 52 11      [ 1]  550 	bres	0x5211, #7
      008C63 81               [ 4]  551 	ret
                                    552 ;	lib/stm8s_i2c.c: 320: void I2C_StretchClockCmd(FunctionalState NewState)
                                    553 ;	-----------------------------------------
                                    554 ;	 function I2C_StretchClockCmd
                                    555 ;	-----------------------------------------
      008C64                        556 _I2C_StretchClockCmd:
                                    557 ;	lib/stm8s_i2c.c: 323: assert_param(IS_FUNCTIONALSTATE_OK(NewState));
      008C64 0D 03            [ 1]  558 	tnz	(0x03, sp)
      008C66 27 17            [ 1]  559 	jreq	00107$
      008C68 7B 03            [ 1]  560 	ld	a, (0x03, sp)
      008C6A A1 01            [ 1]  561 	cp	a, #0x01
      008C6C 27 11            [ 1]  562 	jreq	00107$
      008C6E AE 90 BE         [ 2]  563 	ldw	x, #___str_0+0
      008C71 4B 43            [ 1]  564 	push	#0x43
      008C73 4B 01            [ 1]  565 	push	#0x01
      008C75 4B 00            [ 1]  566 	push	#0x00
      008C77 4B 00            [ 1]  567 	push	#0x00
      008C79 89               [ 2]  568 	pushw	x
      008C7A CD 00 00         [ 4]  569 	call	_assert_failed
      008C7D 5B 06            [ 2]  570 	addw	sp, #6
      008C7F                        571 00107$:
                                    572 ;	lib/stm8s_i2c.c: 325: if (NewState != DISABLE)
      008C7F 0D 03            [ 1]  573 	tnz	(0x03, sp)
      008C81 27 05            [ 1]  574 	jreq	00102$
                                    575 ;	lib/stm8s_i2c.c: 328: I2C->CR1 &= (uint8_t)(~I2C_CR1_NOSTRETCH);
      008C83 72 1F 52 10      [ 1]  576 	bres	0x5210, #7
      008C87 81               [ 4]  577 	ret
      008C88                        578 00102$:
                                    579 ;	lib/stm8s_i2c.c: 334: I2C->CR1 |= I2C_CR1_NOSTRETCH;
      008C88 72 1E 52 10      [ 1]  580 	bset	0x5210, #7
      008C8C 81               [ 4]  581 	ret
                                    582 ;	lib/stm8s_i2c.c: 345: void I2C_AcknowledgeConfig(I2C_Ack_TypeDef Ack)
                                    583 ;	-----------------------------------------
                                    584 ;	 function I2C_AcknowledgeConfig
                                    585 ;	-----------------------------------------
      008C8D                        586 _I2C_AcknowledgeConfig:
      008C8D 88               [ 1]  587 	push	a
                                    588 ;	lib/stm8s_i2c.c: 348: assert_param(IS_I2C_ACK_OK(Ack));
      008C8E 7B 04            [ 1]  589 	ld	a, (0x04, sp)
      008C90 A1 01            [ 1]  590 	cp	a, #0x01
      008C92 26 06            [ 1]  591 	jrne	00138$
      008C94 A6 01            [ 1]  592 	ld	a, #0x01
      008C96 6B 01            [ 1]  593 	ld	(0x01, sp), a
      008C98 20 02            [ 2]  594 	jra	00139$
      008C9A                        595 00138$:
      008C9A 0F 01            [ 1]  596 	clr	(0x01, sp)
      008C9C                        597 00139$:
      008C9C 0D 04            [ 1]  598 	tnz	(0x04, sp)
      008C9E 27 1B            [ 1]  599 	jreq	00110$
      008CA0 0D 01            [ 1]  600 	tnz	(0x01, sp)
      008CA2 26 17            [ 1]  601 	jrne	00110$
      008CA4 7B 04            [ 1]  602 	ld	a, (0x04, sp)
      008CA6 A1 02            [ 1]  603 	cp	a, #0x02
      008CA8 27 11            [ 1]  604 	jreq	00110$
      008CAA AE 90 BE         [ 2]  605 	ldw	x, #___str_0+0
      008CAD 4B 5C            [ 1]  606 	push	#0x5c
      008CAF 4B 01            [ 1]  607 	push	#0x01
      008CB1 4B 00            [ 1]  608 	push	#0x00
      008CB3 4B 00            [ 1]  609 	push	#0x00
      008CB5 89               [ 2]  610 	pushw	x
      008CB6 CD 00 00         [ 4]  611 	call	_assert_failed
      008CB9 5B 06            [ 2]  612 	addw	sp, #6
      008CBB                        613 00110$:
                                    614 ;	lib/stm8s_i2c.c: 350: if (Ack == I2C_ACK_NONE)
      008CBB 0D 04            [ 1]  615 	tnz	(0x04, sp)
      008CBD 26 09            [ 1]  616 	jrne	00105$
                                    617 ;	lib/stm8s_i2c.c: 353: I2C->CR2 &= (uint8_t)(~I2C_CR2_ACK);
      008CBF AE 52 11         [ 2]  618 	ldw	x, #0x5211
      008CC2 F6               [ 1]  619 	ld	a, (x)
      008CC3 A4 FB            [ 1]  620 	and	a, #0xfb
      008CC5 F7               [ 1]  621 	ld	(x), a
      008CC6 20 1B            [ 2]  622 	jra	00107$
      008CC8                        623 00105$:
                                    624 ;	lib/stm8s_i2c.c: 358: I2C->CR2 |= I2C_CR2_ACK;
      008CC8 AE 52 11         [ 2]  625 	ldw	x, #0x5211
      008CCB F6               [ 1]  626 	ld	a, (x)
      008CCC AA 04            [ 1]  627 	or	a, #0x04
      008CCE F7               [ 1]  628 	ld	(x), a
                                    629 ;	lib/stm8s_i2c.c: 360: if (Ack == I2C_ACK_CURR)
      008CCF 0D 01            [ 1]  630 	tnz	(0x01, sp)
      008CD1 27 09            [ 1]  631 	jreq	00102$
                                    632 ;	lib/stm8s_i2c.c: 363: I2C->CR2 &= (uint8_t)(~I2C_CR2_POS);
      008CD3 AE 52 11         [ 2]  633 	ldw	x, #0x5211
      008CD6 F6               [ 1]  634 	ld	a, (x)
      008CD7 A4 F7            [ 1]  635 	and	a, #0xf7
      008CD9 F7               [ 1]  636 	ld	(x), a
      008CDA 20 07            [ 2]  637 	jra	00107$
      008CDC                        638 00102$:
                                    639 ;	lib/stm8s_i2c.c: 368: I2C->CR2 |= I2C_CR2_POS;
      008CDC AE 52 11         [ 2]  640 	ldw	x, #0x5211
      008CDF F6               [ 1]  641 	ld	a, (x)
      008CE0 AA 08            [ 1]  642 	or	a, #0x08
      008CE2 F7               [ 1]  643 	ld	(x), a
      008CE3                        644 00107$:
      008CE3 84               [ 1]  645 	pop	a
      008CE4 81               [ 4]  646 	ret
                                    647 ;	lib/stm8s_i2c.c: 381: void I2C_ITConfig(I2C_IT_TypeDef I2C_IT, FunctionalState NewState)
                                    648 ;	-----------------------------------------
                                    649 ;	 function I2C_ITConfig
                                    650 ;	-----------------------------------------
      008CE5                        651 _I2C_ITConfig:
      008CE5 88               [ 1]  652 	push	a
                                    653 ;	lib/stm8s_i2c.c: 384: assert_param(IS_I2C_INTERRUPT_OK(I2C_IT));
      008CE6 7B 04            [ 1]  654 	ld	a, (0x04, sp)
      008CE8 A1 01            [ 1]  655 	cp	a, #0x01
      008CEA 27 35            [ 1]  656 	jreq	00107$
      008CEC 7B 04            [ 1]  657 	ld	a, (0x04, sp)
      008CEE A1 02            [ 1]  658 	cp	a, #0x02
      008CF0 27 2F            [ 1]  659 	jreq	00107$
      008CF2 7B 04            [ 1]  660 	ld	a, (0x04, sp)
      008CF4 A1 04            [ 1]  661 	cp	a, #0x04
      008CF6 27 29            [ 1]  662 	jreq	00107$
      008CF8 7B 04            [ 1]  663 	ld	a, (0x04, sp)
      008CFA A1 03            [ 1]  664 	cp	a, #0x03
      008CFC 27 23            [ 1]  665 	jreq	00107$
      008CFE 7B 04            [ 1]  666 	ld	a, (0x04, sp)
      008D00 A1 05            [ 1]  667 	cp	a, #0x05
      008D02 27 1D            [ 1]  668 	jreq	00107$
      008D04 7B 04            [ 1]  669 	ld	a, (0x04, sp)
      008D06 A1 06            [ 1]  670 	cp	a, #0x06
      008D08 27 17            [ 1]  671 	jreq	00107$
      008D0A 7B 04            [ 1]  672 	ld	a, (0x04, sp)
      008D0C A1 07            [ 1]  673 	cp	a, #0x07
      008D0E 27 11            [ 1]  674 	jreq	00107$
      008D10 AE 90 BE         [ 2]  675 	ldw	x, #___str_0+0
      008D13 4B 80            [ 1]  676 	push	#0x80
      008D15 4B 01            [ 1]  677 	push	#0x01
      008D17 4B 00            [ 1]  678 	push	#0x00
      008D19 4B 00            [ 1]  679 	push	#0x00
      008D1B 89               [ 2]  680 	pushw	x
      008D1C CD 00 00         [ 4]  681 	call	_assert_failed
      008D1F 5B 06            [ 2]  682 	addw	sp, #6
      008D21                        683 00107$:
                                    684 ;	lib/stm8s_i2c.c: 385: assert_param(IS_FUNCTIONALSTATE_OK(NewState));
      008D21 0D 05            [ 1]  685 	tnz	(0x05, sp)
      008D23 27 17            [ 1]  686 	jreq	00127$
      008D25 7B 05            [ 1]  687 	ld	a, (0x05, sp)
      008D27 A1 01            [ 1]  688 	cp	a, #0x01
      008D29 27 11            [ 1]  689 	jreq	00127$
      008D2B AE 90 BE         [ 2]  690 	ldw	x, #___str_0+0
      008D2E 4B 81            [ 1]  691 	push	#0x81
      008D30 4B 01            [ 1]  692 	push	#0x01
      008D32 4B 00            [ 1]  693 	push	#0x00
      008D34 4B 00            [ 1]  694 	push	#0x00
      008D36 89               [ 2]  695 	pushw	x
      008D37 CD 00 00         [ 4]  696 	call	_assert_failed
      008D3A 5B 06            [ 2]  697 	addw	sp, #6
      008D3C                        698 00127$:
                                    699 ;	lib/stm8s_i2c.c: 387: if (NewState != DISABLE)
      008D3C 0D 05            [ 1]  700 	tnz	(0x05, sp)
      008D3E 27 0C            [ 1]  701 	jreq	00102$
                                    702 ;	lib/stm8s_i2c.c: 390: I2C->ITR |= (uint8_t)I2C_IT;
      008D40 AE 52 1A         [ 2]  703 	ldw	x, #0x521a
      008D43 F6               [ 1]  704 	ld	a, (x)
      008D44 1A 04            [ 1]  705 	or	a, (0x04, sp)
      008D46 AE 52 1A         [ 2]  706 	ldw	x, #0x521a
      008D49 F7               [ 1]  707 	ld	(x), a
      008D4A 20 0F            [ 2]  708 	jra	00104$
      008D4C                        709 00102$:
                                    710 ;	lib/stm8s_i2c.c: 395: I2C->ITR &= (uint8_t)(~(uint8_t)I2C_IT);
      008D4C AE 52 1A         [ 2]  711 	ldw	x, #0x521a
      008D4F F6               [ 1]  712 	ld	a, (x)
      008D50 6B 01            [ 1]  713 	ld	(0x01, sp), a
      008D52 7B 04            [ 1]  714 	ld	a, (0x04, sp)
      008D54 43               [ 1]  715 	cpl	a
      008D55 14 01            [ 1]  716 	and	a, (0x01, sp)
      008D57 AE 52 1A         [ 2]  717 	ldw	x, #0x521a
      008D5A F7               [ 1]  718 	ld	(x), a
      008D5B                        719 00104$:
      008D5B 84               [ 1]  720 	pop	a
      008D5C 81               [ 4]  721 	ret
                                    722 ;	lib/stm8s_i2c.c: 405: void I2C_FastModeDutyCycleConfig(I2C_DutyCycle_TypeDef I2C_DutyCycle)
                                    723 ;	-----------------------------------------
                                    724 ;	 function I2C_FastModeDutyCycleConfig
                                    725 ;	-----------------------------------------
      008D5D                        726 _I2C_FastModeDutyCycleConfig:
      008D5D 88               [ 1]  727 	push	a
                                    728 ;	lib/stm8s_i2c.c: 408: assert_param(IS_I2C_DUTYCYCLE_OK(I2C_DutyCycle));
      008D5E 7B 04            [ 1]  729 	ld	a, (0x04, sp)
      008D60 A1 40            [ 1]  730 	cp	a, #0x40
      008D62 26 06            [ 1]  731 	jrne	00124$
      008D64 A6 01            [ 1]  732 	ld	a, #0x01
      008D66 6B 01            [ 1]  733 	ld	(0x01, sp), a
      008D68 20 02            [ 2]  734 	jra	00125$
      008D6A                        735 00124$:
      008D6A 0F 01            [ 1]  736 	clr	(0x01, sp)
      008D6C                        737 00125$:
      008D6C 0D 04            [ 1]  738 	tnz	(0x04, sp)
      008D6E 27 15            [ 1]  739 	jreq	00107$
      008D70 0D 01            [ 1]  740 	tnz	(0x01, sp)
      008D72 26 11            [ 1]  741 	jrne	00107$
      008D74 AE 90 BE         [ 2]  742 	ldw	x, #___str_0+0
      008D77 4B 98            [ 1]  743 	push	#0x98
      008D79 4B 01            [ 1]  744 	push	#0x01
      008D7B 4B 00            [ 1]  745 	push	#0x00
      008D7D 4B 00            [ 1]  746 	push	#0x00
      008D7F 89               [ 2]  747 	pushw	x
      008D80 CD 00 00         [ 4]  748 	call	_assert_failed
      008D83 5B 06            [ 2]  749 	addw	sp, #6
      008D85                        750 00107$:
                                    751 ;	lib/stm8s_i2c.c: 410: if (I2C_DutyCycle == I2C_DUTYCYCLE_16_9)
      008D85 0D 01            [ 1]  752 	tnz	(0x01, sp)
      008D87 27 09            [ 1]  753 	jreq	00102$
                                    754 ;	lib/stm8s_i2c.c: 413: I2C->CCRH |= I2C_CCRH_DUTY;
      008D89 AE 52 1C         [ 2]  755 	ldw	x, #0x521c
      008D8C F6               [ 1]  756 	ld	a, (x)
      008D8D AA 40            [ 1]  757 	or	a, #0x40
      008D8F F7               [ 1]  758 	ld	(x), a
      008D90 20 07            [ 2]  759 	jra	00104$
      008D92                        760 00102$:
                                    761 ;	lib/stm8s_i2c.c: 418: I2C->CCRH &= (uint8_t)(~I2C_CCRH_DUTY);
      008D92 AE 52 1C         [ 2]  762 	ldw	x, #0x521c
      008D95 F6               [ 1]  763 	ld	a, (x)
      008D96 A4 BF            [ 1]  764 	and	a, #0xbf
      008D98 F7               [ 1]  765 	ld	(x), a
      008D99                        766 00104$:
      008D99 84               [ 1]  767 	pop	a
      008D9A 81               [ 4]  768 	ret
                                    769 ;	lib/stm8s_i2c.c: 427: uint8_t I2C_ReceiveData(void)
                                    770 ;	-----------------------------------------
                                    771 ;	 function I2C_ReceiveData
                                    772 ;	-----------------------------------------
      008D9B                        773 _I2C_ReceiveData:
                                    774 ;	lib/stm8s_i2c.c: 430: return ((uint8_t)I2C->DR);
      008D9B AE 52 16         [ 2]  775 	ldw	x, #0x5216
      008D9E F6               [ 1]  776 	ld	a, (x)
      008D9F 81               [ 4]  777 	ret
                                    778 ;	lib/stm8s_i2c.c: 440: void I2C_Send7bitAddress(uint8_t Address, I2C_Direction_TypeDef Direction)
                                    779 ;	-----------------------------------------
                                    780 ;	 function I2C_Send7bitAddress
                                    781 ;	-----------------------------------------
      008DA0                        782 _I2C_Send7bitAddress:
                                    783 ;	lib/stm8s_i2c.c: 443: assert_param(IS_I2C_ADDRESS_OK(Address));
      008DA0 7B 03            [ 1]  784 	ld	a, (0x03, sp)
      008DA2 44               [ 1]  785 	srl	a
      008DA3 24 11            [ 1]  786 	jrnc	00104$
      008DA5 AE 90 BE         [ 2]  787 	ldw	x, #___str_0+0
      008DA8 4B BB            [ 1]  788 	push	#0xbb
      008DAA 4B 01            [ 1]  789 	push	#0x01
      008DAC 4B 00            [ 1]  790 	push	#0x00
      008DAE 4B 00            [ 1]  791 	push	#0x00
      008DB0 89               [ 2]  792 	pushw	x
      008DB1 CD 00 00         [ 4]  793 	call	_assert_failed
      008DB4 5B 06            [ 2]  794 	addw	sp, #6
      008DB6                        795 00104$:
                                    796 ;	lib/stm8s_i2c.c: 444: assert_param(IS_I2C_DIRECTION_OK(Direction));
      008DB6 0D 04            [ 1]  797 	tnz	(0x04, sp)
      008DB8 27 17            [ 1]  798 	jreq	00106$
      008DBA 7B 04            [ 1]  799 	ld	a, (0x04, sp)
      008DBC A1 01            [ 1]  800 	cp	a, #0x01
      008DBE 27 11            [ 1]  801 	jreq	00106$
      008DC0 AE 90 BE         [ 2]  802 	ldw	x, #___str_0+0
      008DC3 4B BC            [ 1]  803 	push	#0xbc
      008DC5 4B 01            [ 1]  804 	push	#0x01
      008DC7 4B 00            [ 1]  805 	push	#0x00
      008DC9 4B 00            [ 1]  806 	push	#0x00
      008DCB 89               [ 2]  807 	pushw	x
      008DCC CD 00 00         [ 4]  808 	call	_assert_failed
      008DCF 5B 06            [ 2]  809 	addw	sp, #6
      008DD1                        810 00106$:
                                    811 ;	lib/stm8s_i2c.c: 447: Address &= (uint8_t)0xFE;
      008DD1 7B 03            [ 1]  812 	ld	a, (0x03, sp)
      008DD3 A4 FE            [ 1]  813 	and	a, #0xfe
      008DD5 6B 03            [ 1]  814 	ld	(0x03, sp), a
                                    815 ;	lib/stm8s_i2c.c: 450: I2C->DR = (uint8_t)(Address | (uint8_t)Direction);
      008DD7 7B 03            [ 1]  816 	ld	a, (0x03, sp)
      008DD9 1A 04            [ 1]  817 	or	a, (0x04, sp)
      008DDB AE 52 16         [ 2]  818 	ldw	x, #0x5216
      008DDE F7               [ 1]  819 	ld	(x), a
      008DDF 81               [ 4]  820 	ret
                                    821 ;	lib/stm8s_i2c.c: 458: void I2C_SendData(uint8_t Data)
                                    822 ;	-----------------------------------------
                                    823 ;	 function I2C_SendData
                                    824 ;	-----------------------------------------
      008DE0                        825 _I2C_SendData:
                                    826 ;	lib/stm8s_i2c.c: 461: I2C->DR = Data;
      008DE0 AE 52 16         [ 2]  827 	ldw	x, #0x5216
      008DE3 7B 03            [ 1]  828 	ld	a, (0x03, sp)
      008DE5 F7               [ 1]  829 	ld	(x), a
      008DE6 81               [ 4]  830 	ret
                                    831 ;	lib/stm8s_i2c.c: 578: ErrorStatus I2C_CheckEvent(I2C_Event_TypeDef I2C_Event)
                                    832 ;	-----------------------------------------
                                    833 ;	 function I2C_CheckEvent
                                    834 ;	-----------------------------------------
      008DE7                        835 _I2C_CheckEvent:
      008DE7 52 08            [ 2]  836 	sub	sp, #8
                                    837 ;	lib/stm8s_i2c.c: 580: __IO uint16_t lastevent = 0x00;
      008DE9 5F               [ 1]  838 	clrw	x
      008DEA 1F 02            [ 2]  839 	ldw	(0x02, sp), x
                                    840 ;	lib/stm8s_i2c.c: 586: assert_param(IS_I2C_EVENT_OK(I2C_Event));
      008DEC 1E 0B            [ 2]  841 	ldw	x, (0x0b, sp)
      008DEE A3 00 04         [ 2]  842 	cpw	x, #0x0004
      008DF1 26 06            [ 1]  843 	jrne	00229$
      008DF3 A6 01            [ 1]  844 	ld	a, #0x01
      008DF5 6B 04            [ 1]  845 	ld	(0x04, sp), a
      008DF7 20 02            [ 2]  846 	jra	00230$
      008DF9                        847 00229$:
      008DF9 0F 04            [ 1]  848 	clr	(0x04, sp)
      008DFB                        849 00230$:
      008DFB 1E 0B            [ 2]  850 	ldw	x, (0x0b, sp)
      008DFD A3 06 82         [ 2]  851 	cpw	x, #0x0682
      008E00 27 77            [ 1]  852 	jreq	00110$
      008E02 1E 0B            [ 2]  853 	ldw	x, (0x0b, sp)
      008E04 A3 02 02         [ 2]  854 	cpw	x, #0x0202
      008E07 27 70            [ 1]  855 	jreq	00110$
      008E09 1E 0B            [ 2]  856 	ldw	x, (0x0b, sp)
      008E0B A3 12 00         [ 2]  857 	cpw	x, #0x1200
      008E0E 27 69            [ 1]  858 	jreq	00110$
      008E10 1E 0B            [ 2]  859 	ldw	x, (0x0b, sp)
      008E12 A3 02 40         [ 2]  860 	cpw	x, #0x0240
      008E15 27 62            [ 1]  861 	jreq	00110$
      008E17 1E 0B            [ 2]  862 	ldw	x, (0x0b, sp)
      008E19 A3 03 50         [ 2]  863 	cpw	x, #0x0350
      008E1C 27 5B            [ 1]  864 	jreq	00110$
      008E1E 1E 0B            [ 2]  865 	ldw	x, (0x0b, sp)
      008E20 A3 06 84         [ 2]  866 	cpw	x, #0x0684
      008E23 27 54            [ 1]  867 	jreq	00110$
      008E25 1E 0B            [ 2]  868 	ldw	x, (0x0b, sp)
      008E27 A3 07 94         [ 2]  869 	cpw	x, #0x0794
      008E2A 27 4D            [ 1]  870 	jreq	00110$
      008E2C 0D 04            [ 1]  871 	tnz	(0x04, sp)
      008E2E 26 49            [ 1]  872 	jrne	00110$
      008E30 1E 0B            [ 2]  873 	ldw	x, (0x0b, sp)
      008E32 A3 00 10         [ 2]  874 	cpw	x, #0x0010
      008E35 27 42            [ 1]  875 	jreq	00110$
      008E37 1E 0B            [ 2]  876 	ldw	x, (0x0b, sp)
      008E39 A3 03 01         [ 2]  877 	cpw	x, #0x0301
      008E3C 27 3B            [ 1]  878 	jreq	00110$
      008E3E 1E 0B            [ 2]  879 	ldw	x, (0x0b, sp)
      008E40 A3 07 82         [ 2]  880 	cpw	x, #0x0782
      008E43 27 34            [ 1]  881 	jreq	00110$
      008E45 1E 0B            [ 2]  882 	ldw	x, (0x0b, sp)
      008E47 A3 03 02         [ 2]  883 	cpw	x, #0x0302
      008E4A 27 2D            [ 1]  884 	jreq	00110$
      008E4C 1E 0B            [ 2]  885 	ldw	x, (0x0b, sp)
      008E4E A3 03 40         [ 2]  886 	cpw	x, #0x0340
      008E51 27 26            [ 1]  887 	jreq	00110$
      008E53 1E 0B            [ 2]  888 	ldw	x, (0x0b, sp)
      008E55 A3 07 84         [ 2]  889 	cpw	x, #0x0784
      008E58 27 1F            [ 1]  890 	jreq	00110$
      008E5A 1E 0B            [ 2]  891 	ldw	x, (0x0b, sp)
      008E5C A3 07 80         [ 2]  892 	cpw	x, #0x0780
      008E5F 27 18            [ 1]  893 	jreq	00110$
      008E61 1E 0B            [ 2]  894 	ldw	x, (0x0b, sp)
      008E63 A3 03 08         [ 2]  895 	cpw	x, #0x0308
      008E66 27 11            [ 1]  896 	jreq	00110$
      008E68 AE 90 BE         [ 2]  897 	ldw	x, #___str_0+0
      008E6B 4B 4A            [ 1]  898 	push	#0x4a
      008E6D 4B 02            [ 1]  899 	push	#0x02
      008E6F 4B 00            [ 1]  900 	push	#0x00
      008E71 4B 00            [ 1]  901 	push	#0x00
      008E73 89               [ 2]  902 	pushw	x
      008E74 CD 00 00         [ 4]  903 	call	_assert_failed
      008E77 5B 06            [ 2]  904 	addw	sp, #6
      008E79                        905 00110$:
                                    906 ;	lib/stm8s_i2c.c: 588: if (I2C_Event == I2C_EVENT_SLAVE_ACK_FAILURE)
      008E79 0D 04            [ 1]  907 	tnz	(0x04, sp)
      008E7B 27 0C            [ 1]  908 	jreq	00102$
                                    909 ;	lib/stm8s_i2c.c: 590: lastevent = I2C->SR2 & I2C_SR2_AF;
      008E7D AE 52 18         [ 2]  910 	ldw	x, #0x5218
      008E80 F6               [ 1]  911 	ld	a, (x)
      008E81 A4 04            [ 1]  912 	and	a, #0x04
      008E83 5F               [ 1]  913 	clrw	x
      008E84 97               [ 1]  914 	ld	xl, a
      008E85 1F 02            [ 2]  915 	ldw	(0x02, sp), x
      008E87 20 1A            [ 2]  916 	jra	00103$
      008E89                        917 00102$:
                                    918 ;	lib/stm8s_i2c.c: 594: flag1 = I2C->SR1;
      008E89 AE 52 17         [ 2]  919 	ldw	x, #0x5217
      008E8C F6               [ 1]  920 	ld	a, (x)
      008E8D 6B 01            [ 1]  921 	ld	(0x01, sp), a
                                    922 ;	lib/stm8s_i2c.c: 595: flag2 = I2C->SR3;
      008E8F AE 52 19         [ 2]  923 	ldw	x, #0x5219
      008E92 F6               [ 1]  924 	ld	a, (x)
                                    925 ;	lib/stm8s_i2c.c: 596: lastevent = ((uint16_t)((uint16_t)flag2 << (uint16_t)8) | (uint16_t)flag1);
      008E93 95               [ 1]  926 	ld	xh, a
      008E94 4F               [ 1]  927 	clr	a
      008E95 0F 08            [ 1]  928 	clr	(0x08, sp)
      008E97 7B 01            [ 1]  929 	ld	a, (0x01, sp)
      008E99 0F 05            [ 1]  930 	clr	(0x05, sp)
      008E9B 1A 08            [ 1]  931 	or	a, (0x08, sp)
      008E9D 02               [ 1]  932 	rlwa	x
      008E9E 1A 05            [ 1]  933 	or	a, (0x05, sp)
      008EA0 95               [ 1]  934 	ld	xh, a
      008EA1 1F 02            [ 2]  935 	ldw	(0x02, sp), x
      008EA3                        936 00103$:
                                    937 ;	lib/stm8s_i2c.c: 599: if (((uint16_t)lastevent & (uint16_t)I2C_Event) == (uint16_t)I2C_Event)
      008EA3 7B 03            [ 1]  938 	ld	a, (0x03, sp)
      008EA5 14 0C            [ 1]  939 	and	a, (0x0c, sp)
      008EA7 97               [ 1]  940 	ld	xl, a
      008EA8 7B 02            [ 1]  941 	ld	a, (0x02, sp)
      008EAA 14 0B            [ 1]  942 	and	a, (0x0b, sp)
      008EAC 95               [ 1]  943 	ld	xh, a
      008EAD 13 0B            [ 2]  944 	cpw	x, (0x0b, sp)
      008EAF 26 03            [ 1]  945 	jrne	00105$
                                    946 ;	lib/stm8s_i2c.c: 602: status = SUCCESS;
      008EB1 A6 01            [ 1]  947 	ld	a, #0x01
                                    948 ;	lib/stm8s_i2c.c: 607: status = ERROR;
      008EB3 21                     949 	.byte 0x21
      008EB4                        950 00105$:
      008EB4 4F               [ 1]  951 	clr	a
      008EB5                        952 00106$:
                                    953 ;	lib/stm8s_i2c.c: 611: return status;
      008EB5 5B 08            [ 2]  954 	addw	sp, #8
      008EB7 81               [ 4]  955 	ret
                                    956 ;	lib/stm8s_i2c.c: 628: I2C_Event_TypeDef I2C_GetLastEvent(void)
                                    957 ;	-----------------------------------------
                                    958 ;	 function I2C_GetLastEvent
                                    959 ;	-----------------------------------------
      008EB8                        960 _I2C_GetLastEvent:
      008EB8 52 04            [ 2]  961 	sub	sp, #4
                                    962 ;	lib/stm8s_i2c.c: 630: __IO uint16_t lastevent = 0;
      008EBA 5F               [ 1]  963 	clrw	x
      008EBB 1F 03            [ 2]  964 	ldw	(0x03, sp), x
                                    965 ;	lib/stm8s_i2c.c: 634: if ((I2C->SR2 & I2C_SR2_AF) != 0x00)
      008EBD AE 52 18         [ 2]  966 	ldw	x, #0x5218
      008EC0 F6               [ 1]  967 	ld	a, (x)
      008EC1 A5 04            [ 1]  968 	bcp	a, #0x04
      008EC3 27 07            [ 1]  969 	jreq	00102$
                                    970 ;	lib/stm8s_i2c.c: 636: lastevent = I2C_EVENT_SLAVE_ACK_FAILURE;
      008EC5 AE 00 04         [ 2]  971 	ldw	x, #0x0004
      008EC8 1F 03            [ 2]  972 	ldw	(0x03, sp), x
      008ECA 20 17            [ 2]  973 	jra	00103$
      008ECC                        974 00102$:
                                    975 ;	lib/stm8s_i2c.c: 641: flag1 = I2C->SR1;
      008ECC AE 52 17         [ 2]  976 	ldw	x, #0x5217
      008ECF F6               [ 1]  977 	ld	a, (x)
      008ED0 5F               [ 1]  978 	clrw	x
      008ED1 97               [ 1]  979 	ld	xl, a
      008ED2 1F 01            [ 2]  980 	ldw	(0x01, sp), x
                                    981 ;	lib/stm8s_i2c.c: 642: flag2 = I2C->SR3;
      008ED4 AE 52 19         [ 2]  982 	ldw	x, #0x5219
      008ED7 F6               [ 1]  983 	ld	a, (x)
      008ED8 95               [ 1]  984 	ld	xh, a
      008ED9 4F               [ 1]  985 	clr	a
                                    986 ;	lib/stm8s_i2c.c: 645: lastevent = ((uint16_t)((uint16_t)flag2 << 8) | (uint16_t)flag1);
      008EDA 4F               [ 1]  987 	clr	a
      008EDB 1A 02            [ 1]  988 	or	a, (0x02, sp)
      008EDD 02               [ 1]  989 	rlwa	x
      008EDE 1A 01            [ 1]  990 	or	a, (0x01, sp)
      008EE0 95               [ 1]  991 	ld	xh, a
      008EE1 1F 03            [ 2]  992 	ldw	(0x03, sp), x
      008EE3                        993 00103$:
                                    994 ;	lib/stm8s_i2c.c: 648: return (I2C_Event_TypeDef)lastevent;
      008EE3 1E 03            [ 2]  995 	ldw	x, (0x03, sp)
      008EE5 5B 04            [ 2]  996 	addw	sp, #4
      008EE7 81               [ 4]  997 	ret
                                    998 ;	lib/stm8s_i2c.c: 679: FlagStatus I2C_GetFlagStatus(I2C_Flag_TypeDef I2C_Flag)
                                    999 ;	-----------------------------------------
                                   1000 ;	 function I2C_GetFlagStatus
                                   1001 ;	-----------------------------------------
      008EE8                       1002 _I2C_GetFlagStatus:
      008EE8 52 03            [ 2] 1003 	sub	sp, #3
                                   1004 ;	lib/stm8s_i2c.c: 681: uint8_t tempreg = 0;
      008EEA 0F 03            [ 1] 1005 	clr	(0x03, sp)
                                   1006 ;	lib/stm8s_i2c.c: 686: assert_param(IS_I2C_FLAG_OK(I2C_Flag));
      008EEC 1E 06            [ 2] 1007 	ldw	x, (0x06, sp)
      008EEE A3 01 80         [ 2] 1008 	cpw	x, #0x0180
      008EF1 27 7A            [ 1] 1009 	jreq	00112$
      008EF3 1E 06            [ 2] 1010 	ldw	x, (0x06, sp)
      008EF5 A3 01 40         [ 2] 1011 	cpw	x, #0x0140
      008EF8 27 73            [ 1] 1012 	jreq	00112$
      008EFA 1E 06            [ 2] 1013 	ldw	x, (0x06, sp)
      008EFC A3 01 10         [ 2] 1014 	cpw	x, #0x0110
      008EFF 27 6C            [ 1] 1015 	jreq	00112$
      008F01 1E 06            [ 2] 1016 	ldw	x, (0x06, sp)
      008F03 A3 01 08         [ 2] 1017 	cpw	x, #0x0108
      008F06 27 65            [ 1] 1018 	jreq	00112$
      008F08 1E 06            [ 2] 1019 	ldw	x, (0x06, sp)
      008F0A A3 01 04         [ 2] 1020 	cpw	x, #0x0104
      008F0D 27 5E            [ 1] 1021 	jreq	00112$
      008F0F 1E 06            [ 2] 1022 	ldw	x, (0x06, sp)
      008F11 A3 01 02         [ 2] 1023 	cpw	x, #0x0102
      008F14 27 57            [ 1] 1024 	jreq	00112$
      008F16 1E 06            [ 2] 1025 	ldw	x, (0x06, sp)
      008F18 A3 01 01         [ 2] 1026 	cpw	x, #0x0101
      008F1B 27 50            [ 1] 1027 	jreq	00112$
      008F1D 1E 06            [ 2] 1028 	ldw	x, (0x06, sp)
      008F1F A3 02 20         [ 2] 1029 	cpw	x, #0x0220
      008F22 27 49            [ 1] 1030 	jreq	00112$
      008F24 1E 06            [ 2] 1031 	ldw	x, (0x06, sp)
      008F26 A3 02 08         [ 2] 1032 	cpw	x, #0x0208
      008F29 27 42            [ 1] 1033 	jreq	00112$
      008F2B 1E 06            [ 2] 1034 	ldw	x, (0x06, sp)
      008F2D A3 02 04         [ 2] 1035 	cpw	x, #0x0204
      008F30 27 3B            [ 1] 1036 	jreq	00112$
      008F32 1E 06            [ 2] 1037 	ldw	x, (0x06, sp)
      008F34 A3 02 02         [ 2] 1038 	cpw	x, #0x0202
      008F37 27 34            [ 1] 1039 	jreq	00112$
      008F39 1E 06            [ 2] 1040 	ldw	x, (0x06, sp)
      008F3B A3 02 01         [ 2] 1041 	cpw	x, #0x0201
      008F3E 27 2D            [ 1] 1042 	jreq	00112$
      008F40 1E 06            [ 2] 1043 	ldw	x, (0x06, sp)
      008F42 A3 03 10         [ 2] 1044 	cpw	x, #0x0310
      008F45 27 26            [ 1] 1045 	jreq	00112$
      008F47 1E 06            [ 2] 1046 	ldw	x, (0x06, sp)
      008F49 A3 03 04         [ 2] 1047 	cpw	x, #0x0304
      008F4C 27 1F            [ 1] 1048 	jreq	00112$
      008F4E 1E 06            [ 2] 1049 	ldw	x, (0x06, sp)
      008F50 A3 03 02         [ 2] 1050 	cpw	x, #0x0302
      008F53 27 18            [ 1] 1051 	jreq	00112$
      008F55 1E 06            [ 2] 1052 	ldw	x, (0x06, sp)
      008F57 A3 03 01         [ 2] 1053 	cpw	x, #0x0301
      008F5A 27 11            [ 1] 1054 	jreq	00112$
      008F5C AE 90 BE         [ 2] 1055 	ldw	x, #___str_0+0
      008F5F 4B AE            [ 1] 1056 	push	#0xae
      008F61 4B 02            [ 1] 1057 	push	#0x02
      008F63 4B 00            [ 1] 1058 	push	#0x00
      008F65 4B 00            [ 1] 1059 	push	#0x00
      008F67 89               [ 2] 1060 	pushw	x
      008F68 CD 00 00         [ 4] 1061 	call	_assert_failed
      008F6B 5B 06            [ 2] 1062 	addw	sp, #6
      008F6D                       1063 00112$:
                                   1064 ;	lib/stm8s_i2c.c: 689: regindex = (uint8_t)((uint16_t)I2C_Flag >> 8);
      008F6D 7B 06            [ 1] 1065 	ld	a, (0x06, sp)
      008F6F 0F 01            [ 1] 1066 	clr	(0x01, sp)
                                   1067 ;	lib/stm8s_i2c.c: 691: switch (regindex)
      008F71 A1 01            [ 1] 1068 	cp	a, #0x01
      008F73 27 0A            [ 1] 1069 	jreq	00101$
      008F75 A1 02            [ 1] 1070 	cp	a, #0x02
      008F77 27 0E            [ 1] 1071 	jreq	00102$
      008F79 A1 03            [ 1] 1072 	cp	a, #0x03
      008F7B 27 12            [ 1] 1073 	jreq	00103$
      008F7D 20 16            [ 2] 1074 	jra	00105$
                                   1075 ;	lib/stm8s_i2c.c: 694: case 0x01:
      008F7F                       1076 00101$:
                                   1077 ;	lib/stm8s_i2c.c: 695: tempreg = (uint8_t)I2C->SR1;
      008F7F AE 52 17         [ 2] 1078 	ldw	x, #0x5217
      008F82 F6               [ 1] 1079 	ld	a, (x)
      008F83 6B 03            [ 1] 1080 	ld	(0x03, sp), a
                                   1081 ;	lib/stm8s_i2c.c: 696: break;
      008F85 20 0E            [ 2] 1082 	jra	00105$
                                   1083 ;	lib/stm8s_i2c.c: 699: case 0x02:
      008F87                       1084 00102$:
                                   1085 ;	lib/stm8s_i2c.c: 700: tempreg = (uint8_t)I2C->SR2;
      008F87 AE 52 18         [ 2] 1086 	ldw	x, #0x5218
      008F8A F6               [ 1] 1087 	ld	a, (x)
      008F8B 6B 03            [ 1] 1088 	ld	(0x03, sp), a
                                   1089 ;	lib/stm8s_i2c.c: 701: break;
      008F8D 20 06            [ 2] 1090 	jra	00105$
                                   1091 ;	lib/stm8s_i2c.c: 704: case 0x03:
      008F8F                       1092 00103$:
                                   1093 ;	lib/stm8s_i2c.c: 705: tempreg = (uint8_t)I2C->SR3;
      008F8F AE 52 19         [ 2] 1094 	ldw	x, #0x5219
      008F92 F6               [ 1] 1095 	ld	a, (x)
      008F93 6B 03            [ 1] 1096 	ld	(0x03, sp), a
                                   1097 ;	lib/stm8s_i2c.c: 710: }
      008F95                       1098 00105$:
                                   1099 ;	lib/stm8s_i2c.c: 713: if ((tempreg & (uint8_t)I2C_Flag ) != 0)
      008F95 7B 07            [ 1] 1100 	ld	a, (0x07, sp)
      008F97 14 03            [ 1] 1101 	and	a, (0x03, sp)
      008F99 4D               [ 1] 1102 	tnz	a
      008F9A 27 03            [ 1] 1103 	jreq	00107$
                                   1104 ;	lib/stm8s_i2c.c: 716: bitstatus = SET;
      008F9C A6 01            [ 1] 1105 	ld	a, #0x01
                                   1106 ;	lib/stm8s_i2c.c: 721: bitstatus = RESET;
      008F9E 21                    1107 	.byte 0x21
      008F9F                       1108 00107$:
      008F9F 4F               [ 1] 1109 	clr	a
      008FA0                       1110 00108$:
                                   1111 ;	lib/stm8s_i2c.c: 724: return bitstatus;
      008FA0 5B 03            [ 2] 1112 	addw	sp, #3
      008FA2 81               [ 4] 1113 	ret
                                   1114 ;	lib/stm8s_i2c.c: 759: void I2C_ClearFlag(I2C_Flag_TypeDef I2C_FLAG)
                                   1115 ;	-----------------------------------------
                                   1116 ;	 function I2C_ClearFlag
                                   1117 ;	-----------------------------------------
      008FA3                       1118 _I2C_ClearFlag:
                                   1119 ;	lib/stm8s_i2c.c: 763: assert_param(IS_I2C_CLEAR_FLAG_OK(I2C_FLAG));
      008FA3 7B 03            [ 1] 1120 	ld	a, (0x03, sp)
      008FA5 A5 FD            [ 1] 1121 	bcp	a, #0xfd
      008FA7 26 04            [ 1] 1122 	jrne	00103$
      008FA9 1E 03            [ 2] 1123 	ldw	x, (0x03, sp)
      008FAB 26 11            [ 1] 1124 	jrne	00104$
      008FAD                       1125 00103$:
      008FAD AE 90 BE         [ 2] 1126 	ldw	x, #___str_0+0
      008FB0 4B FB            [ 1] 1127 	push	#0xfb
      008FB2 4B 02            [ 1] 1128 	push	#0x02
      008FB4 4B 00            [ 1] 1129 	push	#0x00
      008FB6 4B 00            [ 1] 1130 	push	#0x00
      008FB8 89               [ 2] 1131 	pushw	x
      008FB9 CD 00 00         [ 4] 1132 	call	_assert_failed
      008FBC 5B 06            [ 2] 1133 	addw	sp, #6
      008FBE                       1134 00104$:
                                   1135 ;	lib/stm8s_i2c.c: 766: flagpos = (uint16_t)I2C_FLAG & FLAG_Mask;
      008FBE 7B 04            [ 1] 1136 	ld	a, (0x04, sp)
      008FC0 97               [ 1] 1137 	ld	xl, a
      008FC1 4F               [ 1] 1138 	clr	a
                                   1139 ;	lib/stm8s_i2c.c: 768: I2C->SR2 = (uint8_t)((uint16_t)(~flagpos));
      008FC2 95               [ 1] 1140 	ld	xh, a
      008FC3 53               [ 2] 1141 	cplw	x
      008FC4 9F               [ 1] 1142 	ld	a, xl
      008FC5 AE 52 18         [ 2] 1143 	ldw	x, #0x5218
      008FC8 F7               [ 1] 1144 	ld	(x), a
      008FC9 81               [ 4] 1145 	ret
                                   1146 ;	lib/stm8s_i2c.c: 791: ITStatus I2C_GetITStatus(I2C_ITPendingBit_TypeDef I2C_ITPendingBit)
                                   1147 ;	-----------------------------------------
                                   1148 ;	 function I2C_GetITStatus
                                   1149 ;	-----------------------------------------
      008FCA                       1150 _I2C_GetITStatus:
      008FCA 89               [ 2] 1151 	pushw	x
                                   1152 ;	lib/stm8s_i2c.c: 794: __IO uint8_t enablestatus = 0;
      008FCB 0F 01            [ 1] 1153 	clr	(0x01, sp)
                                   1154 ;	lib/stm8s_i2c.c: 798: assert_param(IS_I2C_ITPENDINGBIT_OK(I2C_ITPendingBit));
      008FCD 1E 05            [ 2] 1155 	ldw	x, (0x05, sp)
      008FCF A3 16 80         [ 2] 1156 	cpw	x, #0x1680
      008FD2 27 5E            [ 1] 1157 	jreq	00115$
      008FD4 1E 05            [ 2] 1158 	ldw	x, (0x05, sp)
      008FD6 A3 16 40         [ 2] 1159 	cpw	x, #0x1640
      008FD9 27 57            [ 1] 1160 	jreq	00115$
      008FDB 1E 05            [ 2] 1161 	ldw	x, (0x05, sp)
      008FDD A3 12 10         [ 2] 1162 	cpw	x, #0x1210
      008FE0 27 50            [ 1] 1163 	jreq	00115$
      008FE2 1E 05            [ 2] 1164 	ldw	x, (0x05, sp)
      008FE4 A3 12 08         [ 2] 1165 	cpw	x, #0x1208
      008FE7 27 49            [ 1] 1166 	jreq	00115$
      008FE9 1E 05            [ 2] 1167 	ldw	x, (0x05, sp)
      008FEB A3 12 04         [ 2] 1168 	cpw	x, #0x1204
      008FEE 27 42            [ 1] 1169 	jreq	00115$
      008FF0 1E 05            [ 2] 1170 	ldw	x, (0x05, sp)
      008FF2 A3 12 02         [ 2] 1171 	cpw	x, #0x1202
      008FF5 27 3B            [ 1] 1172 	jreq	00115$
      008FF7 1E 05            [ 2] 1173 	ldw	x, (0x05, sp)
      008FF9 A3 12 01         [ 2] 1174 	cpw	x, #0x1201
      008FFC 27 34            [ 1] 1175 	jreq	00115$
      008FFE 1E 05            [ 2] 1176 	ldw	x, (0x05, sp)
      009000 A3 22 20         [ 2] 1177 	cpw	x, #0x2220
      009003 27 2D            [ 1] 1178 	jreq	00115$
      009005 1E 05            [ 2] 1179 	ldw	x, (0x05, sp)
      009007 A3 21 08         [ 2] 1180 	cpw	x, #0x2108
      00900A 27 26            [ 1] 1181 	jreq	00115$
      00900C 1E 05            [ 2] 1182 	ldw	x, (0x05, sp)
      00900E A3 21 04         [ 2] 1183 	cpw	x, #0x2104
      009011 27 1F            [ 1] 1184 	jreq	00115$
      009013 1E 05            [ 2] 1185 	ldw	x, (0x05, sp)
      009015 A3 21 02         [ 2] 1186 	cpw	x, #0x2102
      009018 27 18            [ 1] 1187 	jreq	00115$
      00901A 1E 05            [ 2] 1188 	ldw	x, (0x05, sp)
      00901C A3 21 01         [ 2] 1189 	cpw	x, #0x2101
      00901F 27 11            [ 1] 1190 	jreq	00115$
      009021 AE 90 BE         [ 2] 1191 	ldw	x, #___str_0+0
      009024 4B 1E            [ 1] 1192 	push	#0x1e
      009026 4B 03            [ 1] 1193 	push	#0x03
      009028 4B 00            [ 1] 1194 	push	#0x00
      00902A 4B 00            [ 1] 1195 	push	#0x00
      00902C 89               [ 2] 1196 	pushw	x
      00902D CD 00 00         [ 4] 1197 	call	_assert_failed
      009030 5B 06            [ 2] 1198 	addw	sp, #6
      009032                       1199 00115$:
                                   1200 ;	lib/stm8s_i2c.c: 800: tempregister = (uint8_t)( ((uint16_t)((uint16_t)I2C_ITPendingBit & ITEN_Mask)) >> 8);
      009032 4F               [ 1] 1201 	clr	a
      009033 7B 05            [ 1] 1202 	ld	a, (0x05, sp)
      009035 A4 07            [ 1] 1203 	and	a, #0x07
      009037 97               [ 1] 1204 	ld	xl, a
      009038 4F               [ 1] 1205 	clr	a
      009039 4F               [ 1] 1206 	clr	a
      00903A 95               [ 1] 1207 	ld	xh, a
                                   1208 ;	lib/stm8s_i2c.c: 803: enablestatus = (uint8_t)(I2C->ITR & ( uint8_t)tempregister);
      00903B 90 AE 52 1A      [ 2] 1209 	ldw	y, #0x521a
      00903F 90 F6            [ 1] 1210 	ld	a, (y)
      009041 89               [ 2] 1211 	pushw	x
      009042 14 02            [ 1] 1212 	and	a, (2, sp)
      009044 85               [ 2] 1213 	popw	x
      009045 6B 01            [ 1] 1214 	ld	(0x01, sp), a
                                   1215 ;	lib/stm8s_i2c.c: 805: if ((uint16_t)((uint16_t)I2C_ITPendingBit & REGISTER_Mask) == REGISTER_SR1_Index)
      009047 4F               [ 1] 1216 	clr	a
      009048 97               [ 1] 1217 	ld	xl, a
      009049 7B 05            [ 1] 1218 	ld	a, (0x05, sp)
      00904B A4 30            [ 1] 1219 	and	a, #0x30
      00904D 95               [ 1] 1220 	ld	xh, a
                                   1221 ;	lib/stm8s_i2c.c: 808: if (((I2C->SR1 & (uint8_t)I2C_ITPendingBit) != RESET) && enablestatus)
      00904E 7B 06            [ 1] 1222 	ld	a, (0x06, sp)
      009050 6B 02            [ 1] 1223 	ld	(0x02, sp), a
                                   1224 ;	lib/stm8s_i2c.c: 805: if ((uint16_t)((uint16_t)I2C_ITPendingBit & REGISTER_Mask) == REGISTER_SR1_Index)
      009052 A3 01 00         [ 2] 1225 	cpw	x, #0x0100
      009055 26 14            [ 1] 1226 	jrne	00110$
                                   1227 ;	lib/stm8s_i2c.c: 808: if (((I2C->SR1 & (uint8_t)I2C_ITPendingBit) != RESET) && enablestatus)
      009057 AE 52 17         [ 2] 1228 	ldw	x, #0x5217
      00905A F6               [ 1] 1229 	ld	a, (x)
      00905B 14 02            [ 1] 1230 	and	a, (0x02, sp)
      00905D 4D               [ 1] 1231 	tnz	a
      00905E 27 08            [ 1] 1232 	jreq	00102$
      009060 0D 01            [ 1] 1233 	tnz	(0x01, sp)
      009062 27 04            [ 1] 1234 	jreq	00102$
                                   1235 ;	lib/stm8s_i2c.c: 811: bitstatus = SET;
      009064 A6 01            [ 1] 1236 	ld	a, #0x01
      009066 20 14            [ 2] 1237 	jra	00111$
      009068                       1238 00102$:
                                   1239 ;	lib/stm8s_i2c.c: 816: bitstatus = RESET;
      009068 4F               [ 1] 1240 	clr	a
      009069 20 11            [ 2] 1241 	jra	00111$
      00906B                       1242 00110$:
                                   1243 ;	lib/stm8s_i2c.c: 822: if (((I2C->SR2 & (uint8_t)I2C_ITPendingBit) != RESET) && enablestatus)
      00906B AE 52 18         [ 2] 1244 	ldw	x, #0x5218
      00906E F6               [ 1] 1245 	ld	a, (x)
      00906F 14 02            [ 1] 1246 	and	a, (0x02, sp)
      009071 4D               [ 1] 1247 	tnz	a
      009072 27 07            [ 1] 1248 	jreq	00106$
      009074 0D 01            [ 1] 1249 	tnz	(0x01, sp)
      009076 27 03            [ 1] 1250 	jreq	00106$
                                   1251 ;	lib/stm8s_i2c.c: 825: bitstatus = SET;
      009078 A6 01            [ 1] 1252 	ld	a, #0x01
                                   1253 ;	lib/stm8s_i2c.c: 830: bitstatus = RESET;
      00907A 21                    1254 	.byte 0x21
      00907B                       1255 00106$:
      00907B 4F               [ 1] 1256 	clr	a
      00907C                       1257 00111$:
                                   1258 ;	lib/stm8s_i2c.c: 834: return  bitstatus;
      00907C 85               [ 2] 1259 	popw	x
      00907D 81               [ 4] 1260 	ret
                                   1261 ;	lib/stm8s_i2c.c: 871: void I2C_ClearITPendingBit(I2C_ITPendingBit_TypeDef I2C_ITPendingBit)
                                   1262 ;	-----------------------------------------
                                   1263 ;	 function I2C_ClearITPendingBit
                                   1264 ;	-----------------------------------------
      00907E                       1265 _I2C_ClearITPendingBit:
                                   1266 ;	lib/stm8s_i2c.c: 876: assert_param(IS_I2C_CLEAR_ITPENDINGBIT_OK(I2C_ITPendingBit));
      00907E 1E 03            [ 2] 1267 	ldw	x, (0x03, sp)
      009080 A3 22 20         [ 2] 1268 	cpw	x, #0x2220
      009083 27 2D            [ 1] 1269 	jreq	00104$
      009085 1E 03            [ 2] 1270 	ldw	x, (0x03, sp)
      009087 A3 21 08         [ 2] 1271 	cpw	x, #0x2108
      00908A 27 26            [ 1] 1272 	jreq	00104$
      00908C 1E 03            [ 2] 1273 	ldw	x, (0x03, sp)
      00908E A3 21 04         [ 2] 1274 	cpw	x, #0x2104
      009091 27 1F            [ 1] 1275 	jreq	00104$
      009093 1E 03            [ 2] 1276 	ldw	x, (0x03, sp)
      009095 A3 21 02         [ 2] 1277 	cpw	x, #0x2102
      009098 27 18            [ 1] 1278 	jreq	00104$
      00909A 1E 03            [ 2] 1279 	ldw	x, (0x03, sp)
      00909C A3 21 01         [ 2] 1280 	cpw	x, #0x2101
      00909F 27 11            [ 1] 1281 	jreq	00104$
      0090A1 AE 90 BE         [ 2] 1282 	ldw	x, #___str_0+0
      0090A4 4B 6C            [ 1] 1283 	push	#0x6c
      0090A6 4B 03            [ 1] 1284 	push	#0x03
      0090A8 4B 00            [ 1] 1285 	push	#0x00
      0090AA 4B 00            [ 1] 1286 	push	#0x00
      0090AC 89               [ 2] 1287 	pushw	x
      0090AD CD 00 00         [ 4] 1288 	call	_assert_failed
      0090B0 5B 06            [ 2] 1289 	addw	sp, #6
      0090B2                       1290 00104$:
                                   1291 ;	lib/stm8s_i2c.c: 879: flagpos = (uint16_t)I2C_ITPendingBit & FLAG_Mask;
      0090B2 7B 04            [ 1] 1292 	ld	a, (0x04, sp)
      0090B4 97               [ 1] 1293 	ld	xl, a
      0090B5 4F               [ 1] 1294 	clr	a
                                   1295 ;	lib/stm8s_i2c.c: 882: I2C->SR2 = (uint8_t)((uint16_t)~flagpos);
      0090B6 95               [ 1] 1296 	ld	xh, a
      0090B7 53               [ 2] 1297 	cplw	x
      0090B8 9F               [ 1] 1298 	ld	a, xl
      0090B9 AE 52 18         [ 2] 1299 	ldw	x, #0x5218
      0090BC F7               [ 1] 1300 	ld	(x), a
      0090BD 81               [ 4] 1301 	ret
                                   1302 	.area CODE
      0090BE                       1303 ___str_0:
      0090BE 6C 69 62 2F 73 74 6D  1304 	.ascii "lib/stm8s_i2c.c"
             38 73 5F 69 32 63 2E
             63
      0090CD 00                    1305 	.db 0x00
                                   1306 	.area INITIALIZER
                                   1307 	.area CABS (ABS)
