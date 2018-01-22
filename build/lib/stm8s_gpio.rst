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
      00889D                         52 _GPIO_Init:
      00889D 52 07            [ 2]   53 	sub	sp, #7
                                     54 ;	lib/stm8s_gpio.c: 16: GPIOx->ODR = GPIO_ODR_RESET_VALUE; /* Reset Output Data Register */
      00889F 16 0A            [ 2]   55 	ldw	y, (0x0a, sp)
      0088A1 17 06            [ 2]   56 	ldw	(0x06, sp), y
      0088A3 1E 06            [ 2]   57 	ldw	x, (0x06, sp)
      0088A5 7F               [ 1]   58 	clr	(x)
                                     59 ;	lib/stm8s_gpio.c: 17: GPIOx->DDR = GPIO_DDR_RESET_VALUE; /* Reset Data Direction Register */
      0088A6 1E 06            [ 2]   60 	ldw	x, (0x06, sp)
      0088A8 5C               [ 2]   61 	incw	x
      0088A9 5C               [ 2]   62 	incw	x
      0088AA 1F 04            [ 2]   63 	ldw	(0x04, sp), x
      0088AC 1E 04            [ 2]   64 	ldw	x, (0x04, sp)
      0088AE 7F               [ 1]   65 	clr	(x)
                                     66 ;	lib/stm8s_gpio.c: 18: GPIOx->CR1 = GPIO_CR1_RESET_VALUE; /* Reset Control Register 1 */
      0088AF 1E 06            [ 2]   67 	ldw	x, (0x06, sp)
      0088B1 1C 00 03         [ 2]   68 	addw	x, #0x0003
      0088B4 1F 02            [ 2]   69 	ldw	(0x02, sp), x
      0088B6 1E 02            [ 2]   70 	ldw	x, (0x02, sp)
      0088B8 7F               [ 1]   71 	clr	(x)
                                     72 ;	lib/stm8s_gpio.c: 19: GPIOx->CR2 = GPIO_CR2_RESET_VALUE; /* Reset Control Register 2 */
      0088B9 16 06            [ 2]   73 	ldw	y, (0x06, sp)
      0088BB 72 A9 00 04      [ 2]   74 	addw	y, #0x0004
      0088BF 90 7F            [ 1]   75 	clr	(y)
                                     76 ;	lib/stm8s_gpio.c: 22: GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin)); /* Reset corresponding bit to GPIO_Pin in CR2 register */
      0088C1 90 F6            [ 1]   77 	ld	a, (y)
      0088C3 88               [ 1]   78 	push	a
      0088C4 7B 0D            [ 1]   79 	ld	a, (0x0d, sp)
      0088C6 43               [ 1]   80 	cpl	a
      0088C7 6B 02            [ 1]   81 	ld	(0x02, sp), a
      0088C9 84               [ 1]   82 	pop	a
      0088CA 14 01            [ 1]   83 	and	a, (0x01, sp)
      0088CC 90 F7            [ 1]   84 	ld	(y), a
                                     85 ;	lib/stm8s_gpio.c: 27: if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x80) != (uint8_t)0x00) /* Output mode */
      0088CE 0D 0D            [ 1]   86 	tnz	(0x0d, sp)
      0088D0 2A 22            [ 1]   87 	jrpl	00105$
                                     88 ;	lib/stm8s_gpio.c: 29: if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x10) != (uint8_t)0x00) /* High level */
      0088D2 7B 0D            [ 1]   89 	ld	a, (0x0d, sp)
      0088D4 A5 10            [ 1]   90 	bcp	a, #0x10
      0088D6 27 0A            [ 1]   91 	jreq	00102$
                                     92 ;	lib/stm8s_gpio.c: 31: GPIOx->ODR |= (uint8_t)GPIO_Pin;
      0088D8 1E 06            [ 2]   93 	ldw	x, (0x06, sp)
      0088DA F6               [ 1]   94 	ld	a, (x)
      0088DB 1A 0C            [ 1]   95 	or	a, (0x0c, sp)
      0088DD 1E 06            [ 2]   96 	ldw	x, (0x06, sp)
      0088DF F7               [ 1]   97 	ld	(x), a
      0088E0 20 08            [ 2]   98 	jra	00103$
      0088E2                         99 00102$:
                                    100 ;	lib/stm8s_gpio.c: 35: GPIOx->ODR &= (uint8_t)(~(GPIO_Pin));
      0088E2 1E 06            [ 2]  101 	ldw	x, (0x06, sp)
      0088E4 F6               [ 1]  102 	ld	a, (x)
      0088E5 14 01            [ 1]  103 	and	a, (0x01, sp)
      0088E7 1E 06            [ 2]  104 	ldw	x, (0x06, sp)
      0088E9 F7               [ 1]  105 	ld	(x), a
      0088EA                        106 00103$:
                                    107 ;	lib/stm8s_gpio.c: 38: GPIOx->DDR |= (uint8_t)GPIO_Pin;
      0088EA 1E 04            [ 2]  108 	ldw	x, (0x04, sp)
      0088EC F6               [ 1]  109 	ld	a, (x)
      0088ED 1A 0C            [ 1]  110 	or	a, (0x0c, sp)
      0088EF 1E 04            [ 2]  111 	ldw	x, (0x04, sp)
      0088F1 F7               [ 1]  112 	ld	(x), a
      0088F2 20 08            [ 2]  113 	jra	00106$
      0088F4                        114 00105$:
                                    115 ;	lib/stm8s_gpio.c: 43: GPIOx->DDR &= (uint8_t)(~(GPIO_Pin));
      0088F4 1E 04            [ 2]  116 	ldw	x, (0x04, sp)
      0088F6 F6               [ 1]  117 	ld	a, (x)
      0088F7 14 01            [ 1]  118 	and	a, (0x01, sp)
      0088F9 1E 04            [ 2]  119 	ldw	x, (0x04, sp)
      0088FB F7               [ 1]  120 	ld	(x), a
      0088FC                        121 00106$:
                                    122 ;	lib/stm8s_gpio.c: 48: if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x40) != (uint8_t)0x00) /* Pull-Up or Push-Pull */
      0088FC 7B 0D            [ 1]  123 	ld	a, (0x0d, sp)
      0088FE A5 40            [ 1]  124 	bcp	a, #0x40
      008900 27 0A            [ 1]  125 	jreq	00108$
                                    126 ;	lib/stm8s_gpio.c: 50: GPIOx->CR1 |= (uint8_t)GPIO_Pin;
      008902 1E 02            [ 2]  127 	ldw	x, (0x02, sp)
      008904 F6               [ 1]  128 	ld	a, (x)
      008905 1A 0C            [ 1]  129 	or	a, (0x0c, sp)
      008907 1E 02            [ 2]  130 	ldw	x, (0x02, sp)
      008909 F7               [ 1]  131 	ld	(x), a
      00890A 20 08            [ 2]  132 	jra	00109$
      00890C                        133 00108$:
                                    134 ;	lib/stm8s_gpio.c: 54: GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
      00890C 1E 02            [ 2]  135 	ldw	x, (0x02, sp)
      00890E F6               [ 1]  136 	ld	a, (x)
      00890F 14 01            [ 1]  137 	and	a, (0x01, sp)
      008911 1E 02            [ 2]  138 	ldw	x, (0x02, sp)
      008913 F7               [ 1]  139 	ld	(x), a
      008914                        140 00109$:
                                    141 ;	lib/stm8s_gpio.c: 59: if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x20) != (uint8_t)0x00) /* Interrupt or Slow slope */
      008914 7B 0D            [ 1]  142 	ld	a, (0x0d, sp)
      008916 A5 20            [ 1]  143 	bcp	a, #0x20
      008918 27 08            [ 1]  144 	jreq	00111$
                                    145 ;	lib/stm8s_gpio.c: 61: GPIOx->CR2 |= (uint8_t)GPIO_Pin;
      00891A 90 F6            [ 1]  146 	ld	a, (y)
      00891C 1A 0C            [ 1]  147 	or	a, (0x0c, sp)
      00891E 90 F7            [ 1]  148 	ld	(y), a
      008920 20 06            [ 2]  149 	jra	00113$
      008922                        150 00111$:
                                    151 ;	lib/stm8s_gpio.c: 65: GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
      008922 90 F6            [ 1]  152 	ld	a, (y)
      008924 14 01            [ 1]  153 	and	a, (0x01, sp)
      008926 90 F7            [ 1]  154 	ld	(y), a
      008928                        155 00113$:
      008928 5B 07            [ 2]  156 	addw	sp, #7
      00892A 81               [ 4]  157 	ret
                                    158 ;	lib/stm8s_gpio.c: 69: void GPIO_Write(GPIO_TypeDef* GPIOx, uint8_t PortVal)
                                    159 ;	-----------------------------------------
                                    160 ;	 function GPIO_Write
                                    161 ;	-----------------------------------------
      00892B                        162 _GPIO_Write:
                                    163 ;	lib/stm8s_gpio.c: 71: GPIOx->ODR = PortVal;
      00892B 1E 03            [ 2]  164 	ldw	x, (0x03, sp)
      00892D 7B 05            [ 1]  165 	ld	a, (0x05, sp)
      00892F F7               [ 1]  166 	ld	(x), a
      008930 81               [ 4]  167 	ret
                                    168 ;	lib/stm8s_gpio.c: 74: void GPIO_WriteHigh(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
                                    169 ;	-----------------------------------------
                                    170 ;	 function GPIO_WriteHigh
                                    171 ;	-----------------------------------------
      008931                        172 _GPIO_WriteHigh:
                                    173 ;	lib/stm8s_gpio.c: 76: GPIOx->ODR |= (uint8_t)PortPins;
      008931 1E 03            [ 2]  174 	ldw	x, (0x03, sp)
      008933 F6               [ 1]  175 	ld	a, (x)
      008934 1A 05            [ 1]  176 	or	a, (0x05, sp)
      008936 F7               [ 1]  177 	ld	(x), a
      008937 81               [ 4]  178 	ret
                                    179 ;	lib/stm8s_gpio.c: 79: void GPIO_WriteLow(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
                                    180 ;	-----------------------------------------
                                    181 ;	 function GPIO_WriteLow
                                    182 ;	-----------------------------------------
      008938                        183 _GPIO_WriteLow:
      008938 88               [ 1]  184 	push	a
                                    185 ;	lib/stm8s_gpio.c: 81: GPIOx->ODR &= (uint8_t)(~PortPins);
      008939 1E 04            [ 2]  186 	ldw	x, (0x04, sp)
      00893B F6               [ 1]  187 	ld	a, (x)
      00893C 6B 01            [ 1]  188 	ld	(0x01, sp), a
      00893E 7B 06            [ 1]  189 	ld	a, (0x06, sp)
      008940 43               [ 1]  190 	cpl	a
      008941 14 01            [ 1]  191 	and	a, (0x01, sp)
      008943 F7               [ 1]  192 	ld	(x), a
      008944 84               [ 1]  193 	pop	a
      008945 81               [ 4]  194 	ret
                                    195 ;	lib/stm8s_gpio.c: 84: void GPIO_WriteReverse(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
                                    196 ;	-----------------------------------------
                                    197 ;	 function GPIO_WriteReverse
                                    198 ;	-----------------------------------------
      008946                        199 _GPIO_WriteReverse:
                                    200 ;	lib/stm8s_gpio.c: 86: GPIOx->ODR ^= (uint8_t)PortPins;
      008946 1E 03            [ 2]  201 	ldw	x, (0x03, sp)
      008948 F6               [ 1]  202 	ld	a, (x)
      008949 18 05            [ 1]  203 	xor	a, (0x05, sp)
      00894B F7               [ 1]  204 	ld	(x), a
      00894C 81               [ 4]  205 	ret
                                    206 ;	lib/stm8s_gpio.c: 89: uint8_t GPIO_ReadOutputData(GPIO_TypeDef* GPIOx)
                                    207 ;	-----------------------------------------
                                    208 ;	 function GPIO_ReadOutputData
                                    209 ;	-----------------------------------------
      00894D                        210 _GPIO_ReadOutputData:
                                    211 ;	lib/stm8s_gpio.c: 91: return ((uint8_t)GPIOx->ODR);
      00894D 1E 03            [ 2]  212 	ldw	x, (0x03, sp)
      00894F F6               [ 1]  213 	ld	a, (x)
      008950 81               [ 4]  214 	ret
                                    215 ;	lib/stm8s_gpio.c: 94: uint8_t GPIO_ReadInputData(GPIO_TypeDef* GPIOx)
                                    216 ;	-----------------------------------------
                                    217 ;	 function GPIO_ReadInputData
                                    218 ;	-----------------------------------------
      008951                        219 _GPIO_ReadInputData:
                                    220 ;	lib/stm8s_gpio.c: 96: return ((uint8_t)GPIOx->IDR);
      008951 1E 03            [ 2]  221 	ldw	x, (0x03, sp)
      008953 E6 01            [ 1]  222 	ld	a, (0x1, x)
      008955 81               [ 4]  223 	ret
                                    224 ;	lib/stm8s_gpio.c: 99: BitStatus GPIO_ReadInputPin(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin)
                                    225 ;	-----------------------------------------
                                    226 ;	 function GPIO_ReadInputPin
                                    227 ;	-----------------------------------------
      008956                        228 _GPIO_ReadInputPin:
                                    229 ;	lib/stm8s_gpio.c: 101: return ((BitStatus)(GPIOx->IDR & (uint8_t)GPIO_Pin));
      008956 1E 03            [ 2]  230 	ldw	x, (0x03, sp)
      008958 E6 01            [ 1]  231 	ld	a, (0x1, x)
      00895A 14 05            [ 1]  232 	and	a, (0x05, sp)
      00895C 81               [ 4]  233 	ret
                                    234 ;	lib/stm8s_gpio.c: 104: void GPIO_ExternalPullUpConfig(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin, FunctionalState NewState)
                                    235 ;	-----------------------------------------
                                    236 ;	 function GPIO_ExternalPullUpConfig
                                    237 ;	-----------------------------------------
      00895D                        238 _GPIO_ExternalPullUpConfig:
      00895D 88               [ 1]  239 	push	a
                                    240 ;	lib/stm8s_gpio.c: 108: GPIOx->CR1 |= (uint8_t)GPIO_Pin;
      00895E 1E 04            [ 2]  241 	ldw	x, (0x04, sp)
      008960 1C 00 03         [ 2]  242 	addw	x, #0x0003
                                    243 ;	lib/stm8s_gpio.c: 106: if (NewState != DISABLE) /* External Pull-Up Set*/
      008963 0D 07            [ 1]  244 	tnz	(0x07, sp)
      008965 27 06            [ 1]  245 	jreq	00102$
                                    246 ;	lib/stm8s_gpio.c: 108: GPIOx->CR1 |= (uint8_t)GPIO_Pin;
      008967 F6               [ 1]  247 	ld	a, (x)
      008968 1A 06            [ 1]  248 	or	a, (0x06, sp)
      00896A F7               [ 1]  249 	ld	(x), a
      00896B 20 09            [ 2]  250 	jra	00104$
      00896D                        251 00102$:
                                    252 ;	lib/stm8s_gpio.c: 111: GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
      00896D F6               [ 1]  253 	ld	a, (x)
      00896E 6B 01            [ 1]  254 	ld	(0x01, sp), a
      008970 7B 06            [ 1]  255 	ld	a, (0x06, sp)
      008972 43               [ 1]  256 	cpl	a
      008973 14 01            [ 1]  257 	and	a, (0x01, sp)
      008975 F7               [ 1]  258 	ld	(x), a
      008976                        259 00104$:
      008976 84               [ 1]  260 	pop	a
      008977 81               [ 4]  261 	ret
                                    262 	.area CODE
                                    263 	.area INITIALIZER
                                    264 	.area CABS (ABS)
