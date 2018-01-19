                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 3.6.0 #9615 (Mac OS X x86_64)
                                      4 ;--------------------------------------------------------
                                      5 	.module stm8s_gpio
                                      6 	.optsdcc -mstm8
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _GPIO_Init
                                     12 	.globl _GPIO_Write
                                     13 	.globl _GPIO_WriteHigh
                                     14 	.globl _GPIO_WriteLow
                                     15 	.globl _GPIO_WriteReverse
                                     16 	.globl _GPIO_ReadOutputData
                                     17 	.globl _GPIO_ReadInputData
                                     18 	.globl _GPIO_ReadInputPin
                                     19 	.globl _GPIO_ExternalPullUpConfig
                                     20 ;--------------------------------------------------------
                                     21 ; ram data
                                     22 ;--------------------------------------------------------
                                     23 	.area DATA
                                     24 ;--------------------------------------------------------
                                     25 ; ram data
                                     26 ;--------------------------------------------------------
                                     27 	.area INITIALIZED
                                     28 ;--------------------------------------------------------
                                     29 ; absolute external ram data
                                     30 ;--------------------------------------------------------
                                     31 	.area DABS (ABS)
                                     32 ;--------------------------------------------------------
                                     33 ; global & static initialisations
                                     34 ;--------------------------------------------------------
                                     35 	.area HOME
                                     36 	.area GSINIT
                                     37 	.area GSFINAL
                                     38 	.area GSINIT
                                     39 ;--------------------------------------------------------
                                     40 ; Home
                                     41 ;--------------------------------------------------------
                                     42 	.area HOME
                                     43 	.area HOME
                                     44 ;--------------------------------------------------------
                                     45 ; code
                                     46 ;--------------------------------------------------------
                                     47 	.area CODE
                                     48 ;	lib/stm8s_gpio.c: 13: void GPIO_Init(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin, GPIO_Mode_TypeDef GPIO_Mode)
                                     49 ;	-----------------------------------------
                                     50 ;	 function GPIO_Init
                                     51 ;	-----------------------------------------
      008634                         52 _GPIO_Init:
      008634 52 07            [ 2]   53 	sub	sp, #7
                                     54 ;	lib/stm8s_gpio.c: 16: GPIOx->ODR = GPIO_ODR_RESET_VALUE; /* Reset Output Data Register */
      008636 16 0A            [ 2]   55 	ldw	y, (0x0a, sp)
      008638 17 06            [ 2]   56 	ldw	(0x06, sp), y
      00863A 1E 06            [ 2]   57 	ldw	x, (0x06, sp)
      00863C 7F               [ 1]   58 	clr	(x)
                                     59 ;	lib/stm8s_gpio.c: 17: GPIOx->DDR = GPIO_DDR_RESET_VALUE; /* Reset Data Direction Register */
      00863D 1E 06            [ 2]   60 	ldw	x, (0x06, sp)
      00863F 5C               [ 2]   61 	incw	x
      008640 5C               [ 2]   62 	incw	x
      008641 1F 04            [ 2]   63 	ldw	(0x04, sp), x
      008643 1E 04            [ 2]   64 	ldw	x, (0x04, sp)
      008645 7F               [ 1]   65 	clr	(x)
                                     66 ;	lib/stm8s_gpio.c: 18: GPIOx->CR1 = GPIO_CR1_RESET_VALUE; /* Reset Control Register 1 */
      008646 1E 06            [ 2]   67 	ldw	x, (0x06, sp)
      008648 1C 00 03         [ 2]   68 	addw	x, #0x0003
      00864B 1F 02            [ 2]   69 	ldw	(0x02, sp), x
      00864D 1E 02            [ 2]   70 	ldw	x, (0x02, sp)
      00864F 7F               [ 1]   71 	clr	(x)
                                     72 ;	lib/stm8s_gpio.c: 19: GPIOx->CR2 = GPIO_CR2_RESET_VALUE; /* Reset Control Register 2 */
      008650 16 06            [ 2]   73 	ldw	y, (0x06, sp)
      008652 72 A9 00 04      [ 2]   74 	addw	y, #0x0004
      008656 90 7F            [ 1]   75 	clr	(y)
                                     76 ;	lib/stm8s_gpio.c: 22: GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin)); /* Reset corresponding bit to GPIO_Pin in CR2 register */
      008658 90 F6            [ 1]   77 	ld	a, (y)
      00865A 88               [ 1]   78 	push	a
      00865B 7B 0D            [ 1]   79 	ld	a, (0x0d, sp)
      00865D 43               [ 1]   80 	cpl	a
      00865E 6B 02            [ 1]   81 	ld	(0x02, sp), a
      008660 84               [ 1]   82 	pop	a
      008661 14 01            [ 1]   83 	and	a, (0x01, sp)
      008663 90 F7            [ 1]   84 	ld	(y), a
                                     85 ;	lib/stm8s_gpio.c: 27: if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x80) != (uint8_t)0x00) /* Output mode */
      008665 0D 0D            [ 1]   86 	tnz	(0x0d, sp)
      008667 2A 22            [ 1]   87 	jrpl	00105$
                                     88 ;	lib/stm8s_gpio.c: 29: if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x10) != (uint8_t)0x00) /* High level */
      008669 7B 0D            [ 1]   89 	ld	a, (0x0d, sp)
      00866B A5 10            [ 1]   90 	bcp	a, #0x10
      00866D 27 0A            [ 1]   91 	jreq	00102$
                                     92 ;	lib/stm8s_gpio.c: 31: GPIOx->ODR |= (uint8_t)GPIO_Pin;
      00866F 1E 06            [ 2]   93 	ldw	x, (0x06, sp)
      008671 F6               [ 1]   94 	ld	a, (x)
      008672 1A 0C            [ 1]   95 	or	a, (0x0c, sp)
      008674 1E 06            [ 2]   96 	ldw	x, (0x06, sp)
      008676 F7               [ 1]   97 	ld	(x), a
      008677 20 08            [ 2]   98 	jra	00103$
      008679                         99 00102$:
                                    100 ;	lib/stm8s_gpio.c: 35: GPIOx->ODR &= (uint8_t)(~(GPIO_Pin));
      008679 1E 06            [ 2]  101 	ldw	x, (0x06, sp)
      00867B F6               [ 1]  102 	ld	a, (x)
      00867C 14 01            [ 1]  103 	and	a, (0x01, sp)
      00867E 1E 06            [ 2]  104 	ldw	x, (0x06, sp)
      008680 F7               [ 1]  105 	ld	(x), a
      008681                        106 00103$:
                                    107 ;	lib/stm8s_gpio.c: 38: GPIOx->DDR |= (uint8_t)GPIO_Pin;
      008681 1E 04            [ 2]  108 	ldw	x, (0x04, sp)
      008683 F6               [ 1]  109 	ld	a, (x)
      008684 1A 0C            [ 1]  110 	or	a, (0x0c, sp)
      008686 1E 04            [ 2]  111 	ldw	x, (0x04, sp)
      008688 F7               [ 1]  112 	ld	(x), a
      008689 20 08            [ 2]  113 	jra	00106$
      00868B                        114 00105$:
                                    115 ;	lib/stm8s_gpio.c: 43: GPIOx->DDR &= (uint8_t)(~(GPIO_Pin));
      00868B 1E 04            [ 2]  116 	ldw	x, (0x04, sp)
      00868D F6               [ 1]  117 	ld	a, (x)
      00868E 14 01            [ 1]  118 	and	a, (0x01, sp)
      008690 1E 04            [ 2]  119 	ldw	x, (0x04, sp)
      008692 F7               [ 1]  120 	ld	(x), a
      008693                        121 00106$:
                                    122 ;	lib/stm8s_gpio.c: 48: if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x40) != (uint8_t)0x00) /* Pull-Up or Push-Pull */
      008693 7B 0D            [ 1]  123 	ld	a, (0x0d, sp)
      008695 A5 40            [ 1]  124 	bcp	a, #0x40
      008697 27 0A            [ 1]  125 	jreq	00108$
                                    126 ;	lib/stm8s_gpio.c: 50: GPIOx->CR1 |= (uint8_t)GPIO_Pin;
      008699 1E 02            [ 2]  127 	ldw	x, (0x02, sp)
      00869B F6               [ 1]  128 	ld	a, (x)
      00869C 1A 0C            [ 1]  129 	or	a, (0x0c, sp)
      00869E 1E 02            [ 2]  130 	ldw	x, (0x02, sp)
      0086A0 F7               [ 1]  131 	ld	(x), a
      0086A1 20 08            [ 2]  132 	jra	00109$
      0086A3                        133 00108$:
                                    134 ;	lib/stm8s_gpio.c: 54: GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
      0086A3 1E 02            [ 2]  135 	ldw	x, (0x02, sp)
      0086A5 F6               [ 1]  136 	ld	a, (x)
      0086A6 14 01            [ 1]  137 	and	a, (0x01, sp)
      0086A8 1E 02            [ 2]  138 	ldw	x, (0x02, sp)
      0086AA F7               [ 1]  139 	ld	(x), a
      0086AB                        140 00109$:
                                    141 ;	lib/stm8s_gpio.c: 59: if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x20) != (uint8_t)0x00) /* Interrupt or Slow slope */
      0086AB 7B 0D            [ 1]  142 	ld	a, (0x0d, sp)
      0086AD A5 20            [ 1]  143 	bcp	a, #0x20
      0086AF 27 08            [ 1]  144 	jreq	00111$
                                    145 ;	lib/stm8s_gpio.c: 61: GPIOx->CR2 |= (uint8_t)GPIO_Pin;
      0086B1 90 F6            [ 1]  146 	ld	a, (y)
      0086B3 1A 0C            [ 1]  147 	or	a, (0x0c, sp)
      0086B5 90 F7            [ 1]  148 	ld	(y), a
      0086B7 20 06            [ 2]  149 	jra	00113$
      0086B9                        150 00111$:
                                    151 ;	lib/stm8s_gpio.c: 65: GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
      0086B9 90 F6            [ 1]  152 	ld	a, (y)
      0086BB 14 01            [ 1]  153 	and	a, (0x01, sp)
      0086BD 90 F7            [ 1]  154 	ld	(y), a
      0086BF                        155 00113$:
      0086BF 5B 07            [ 2]  156 	addw	sp, #7
      0086C1 81               [ 4]  157 	ret
                                    158 ;	lib/stm8s_gpio.c: 69: void GPIO_Write(GPIO_TypeDef* GPIOx, uint8_t PortVal)
                                    159 ;	-----------------------------------------
                                    160 ;	 function GPIO_Write
                                    161 ;	-----------------------------------------
      0086C2                        162 _GPIO_Write:
                                    163 ;	lib/stm8s_gpio.c: 71: GPIOx->ODR = PortVal;
      0086C2 1E 03            [ 2]  164 	ldw	x, (0x03, sp)
      0086C4 7B 05            [ 1]  165 	ld	a, (0x05, sp)
      0086C6 F7               [ 1]  166 	ld	(x), a
      0086C7 81               [ 4]  167 	ret
                                    168 ;	lib/stm8s_gpio.c: 74: void GPIO_WriteHigh(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
                                    169 ;	-----------------------------------------
                                    170 ;	 function GPIO_WriteHigh
                                    171 ;	-----------------------------------------
      0086C8                        172 _GPIO_WriteHigh:
                                    173 ;	lib/stm8s_gpio.c: 76: GPIOx->ODR |= (uint8_t)PortPins;
      0086C8 1E 03            [ 2]  174 	ldw	x, (0x03, sp)
      0086CA F6               [ 1]  175 	ld	a, (x)
      0086CB 1A 05            [ 1]  176 	or	a, (0x05, sp)
      0086CD F7               [ 1]  177 	ld	(x), a
      0086CE 81               [ 4]  178 	ret
                                    179 ;	lib/stm8s_gpio.c: 79: void GPIO_WriteLow(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
                                    180 ;	-----------------------------------------
                                    181 ;	 function GPIO_WriteLow
                                    182 ;	-----------------------------------------
      0086CF                        183 _GPIO_WriteLow:
      0086CF 88               [ 1]  184 	push	a
                                    185 ;	lib/stm8s_gpio.c: 81: GPIOx->ODR &= (uint8_t)(~PortPins);
      0086D0 1E 04            [ 2]  186 	ldw	x, (0x04, sp)
      0086D2 F6               [ 1]  187 	ld	a, (x)
      0086D3 6B 01            [ 1]  188 	ld	(0x01, sp), a
      0086D5 7B 06            [ 1]  189 	ld	a, (0x06, sp)
      0086D7 43               [ 1]  190 	cpl	a
      0086D8 14 01            [ 1]  191 	and	a, (0x01, sp)
      0086DA F7               [ 1]  192 	ld	(x), a
      0086DB 84               [ 1]  193 	pop	a
      0086DC 81               [ 4]  194 	ret
                                    195 ;	lib/stm8s_gpio.c: 84: void GPIO_WriteReverse(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
                                    196 ;	-----------------------------------------
                                    197 ;	 function GPIO_WriteReverse
                                    198 ;	-----------------------------------------
      0086DD                        199 _GPIO_WriteReverse:
                                    200 ;	lib/stm8s_gpio.c: 86: GPIOx->ODR ^= (uint8_t)PortPins;
      0086DD 1E 03            [ 2]  201 	ldw	x, (0x03, sp)
      0086DF F6               [ 1]  202 	ld	a, (x)
      0086E0 18 05            [ 1]  203 	xor	a, (0x05, sp)
      0086E2 F7               [ 1]  204 	ld	(x), a
      0086E3 81               [ 4]  205 	ret
                                    206 ;	lib/stm8s_gpio.c: 89: uint8_t GPIO_ReadOutputData(GPIO_TypeDef* GPIOx)
                                    207 ;	-----------------------------------------
                                    208 ;	 function GPIO_ReadOutputData
                                    209 ;	-----------------------------------------
      0086E4                        210 _GPIO_ReadOutputData:
                                    211 ;	lib/stm8s_gpio.c: 91: return ((uint8_t)GPIOx->ODR);
      0086E4 1E 03            [ 2]  212 	ldw	x, (0x03, sp)
      0086E6 F6               [ 1]  213 	ld	a, (x)
      0086E7 81               [ 4]  214 	ret
                                    215 ;	lib/stm8s_gpio.c: 94: uint8_t GPIO_ReadInputData(GPIO_TypeDef* GPIOx)
                                    216 ;	-----------------------------------------
                                    217 ;	 function GPIO_ReadInputData
                                    218 ;	-----------------------------------------
      0086E8                        219 _GPIO_ReadInputData:
                                    220 ;	lib/stm8s_gpio.c: 96: return ((uint8_t)GPIOx->IDR);
      0086E8 1E 03            [ 2]  221 	ldw	x, (0x03, sp)
      0086EA E6 01            [ 1]  222 	ld	a, (0x1, x)
      0086EC 81               [ 4]  223 	ret
                                    224 ;	lib/stm8s_gpio.c: 99: BitStatus GPIO_ReadInputPin(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin)
                                    225 ;	-----------------------------------------
                                    226 ;	 function GPIO_ReadInputPin
                                    227 ;	-----------------------------------------
      0086ED                        228 _GPIO_ReadInputPin:
                                    229 ;	lib/stm8s_gpio.c: 101: return ((BitStatus)(GPIOx->IDR & (uint8_t)GPIO_Pin));
      0086ED 1E 03            [ 2]  230 	ldw	x, (0x03, sp)
      0086EF E6 01            [ 1]  231 	ld	a, (0x1, x)
      0086F1 14 05            [ 1]  232 	and	a, (0x05, sp)
      0086F3 81               [ 4]  233 	ret
                                    234 ;	lib/stm8s_gpio.c: 104: void GPIO_ExternalPullUpConfig(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin, FunctionalState NewState)
                                    235 ;	-----------------------------------------
                                    236 ;	 function GPIO_ExternalPullUpConfig
                                    237 ;	-----------------------------------------
      0086F4                        238 _GPIO_ExternalPullUpConfig:
      0086F4 88               [ 1]  239 	push	a
                                    240 ;	lib/stm8s_gpio.c: 108: GPIOx->CR1 |= (uint8_t)GPIO_Pin;
      0086F5 1E 04            [ 2]  241 	ldw	x, (0x04, sp)
      0086F7 1C 00 03         [ 2]  242 	addw	x, #0x0003
                                    243 ;	lib/stm8s_gpio.c: 106: if (NewState != DISABLE) /* External Pull-Up Set*/
      0086FA 0D 07            [ 1]  244 	tnz	(0x07, sp)
      0086FC 27 06            [ 1]  245 	jreq	00102$
                                    246 ;	lib/stm8s_gpio.c: 108: GPIOx->CR1 |= (uint8_t)GPIO_Pin;
      0086FE F6               [ 1]  247 	ld	a, (x)
      0086FF 1A 06            [ 1]  248 	or	a, (0x06, sp)
      008701 F7               [ 1]  249 	ld	(x), a
      008702 20 09            [ 2]  250 	jra	00104$
      008704                        251 00102$:
                                    252 ;	lib/stm8s_gpio.c: 111: GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
      008704 F6               [ 1]  253 	ld	a, (x)
      008705 6B 01            [ 1]  254 	ld	(0x01, sp), a
      008707 7B 06            [ 1]  255 	ld	a, (0x06, sp)
      008709 43               [ 1]  256 	cpl	a
      00870A 14 01            [ 1]  257 	and	a, (0x01, sp)
      00870C F7               [ 1]  258 	ld	(x), a
      00870D                        259 00104$:
      00870D 84               [ 1]  260 	pop	a
      00870E 81               [ 4]  261 	ret
                                    262 	.area CODE
                                    263 	.area INITIALIZER
                                    264 	.area CABS (ABS)
