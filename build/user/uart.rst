                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 3.6.0 #9615 (Mac OS X x86_64)
                                      4 ;--------------------------------------------------------
                                      5 	.module uart
                                      6 	.optsdcc -mstm8
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _Printf
                                     12 	.globl _SetupSerialPort
                                     13 ;--------------------------------------------------------
                                     14 ; ram data
                                     15 ;--------------------------------------------------------
                                     16 	.area DATA
                                     17 ;--------------------------------------------------------
                                     18 ; ram data
                                     19 ;--------------------------------------------------------
                                     20 	.area INITIALIZED
                                     21 ;--------------------------------------------------------
                                     22 ; absolute external ram data
                                     23 ;--------------------------------------------------------
                                     24 	.area DABS (ABS)
                                     25 ;--------------------------------------------------------
                                     26 ; global & static initialisations
                                     27 ;--------------------------------------------------------
                                     28 	.area HOME
                                     29 	.area GSINIT
                                     30 	.area GSFINAL
                                     31 	.area GSINIT
                                     32 ;--------------------------------------------------------
                                     33 ; Home
                                     34 ;--------------------------------------------------------
                                     35 	.area HOME
                                     36 	.area HOME
                                     37 ;--------------------------------------------------------
                                     38 ; code
                                     39 ;--------------------------------------------------------
                                     40 	.area CODE
                                     41 ;	user/uart.c: 4: void SetupSerialPort(void)
                                     42 ;	-----------------------------------------
                                     43 ;	 function SetupSerialPort
                                     44 ;	-----------------------------------------
      008495                         45 _SetupSerialPort:
                                     46 ;	user/uart.c: 8: (void) UART1->SR;
      008495 AE 52 30         [ 2]   47 	ldw	x, #0x5230
      008498 F6               [ 1]   48 	ld	a, (x)
                                     49 ;	user/uart.c: 9: (void) UART1->DR;
      008499 AE 52 31         [ 2]   50 	ldw	x, #0x5231
      00849C F6               [ 1]   51 	ld	a, (x)
                                     52 ;	user/uart.c: 11: UART1->CR2 = UART1_CR2_RESET_VALUE;
      00849D 35 00 52 35      [ 1]   53 	mov	0x5235+0, #0x00
                                     54 ;	user/uart.c: 12: UART1->CR4 = UART1_CR4_RESET_VALUE;
      0084A1 35 00 52 37      [ 1]   55 	mov	0x5237+0, #0x00
                                     56 ;	user/uart.c: 13: UART1->CR5 = UART1_CR5_RESET_VALUE;
      0084A5 35 00 52 38      [ 1]   57 	mov	0x5238+0, #0x00
                                     58 ;	user/uart.c: 14: UART1->GTR = UART1_GTR_RESET_VALUE;
      0084A9 35 00 52 39      [ 1]   59 	mov	0x5239+0, #0x00
                                     60 ;	user/uart.c: 15: UART1->PSCR = UART1_PSCR_RESET_VALUE;
      0084AD 35 00 52 3A      [ 1]   61 	mov	0x523a+0, #0x00
                                     62 ;	user/uart.c: 17: UART1->CR1 = (u8) UART1_WORDLENGTH_8D | (u8) UART1_PARITY_NO;   // Word length = 8, no parity.
      0084B1 35 00 52 34      [ 1]   63 	mov	0x5234+0, #0x00
                                     64 ;	user/uart.c: 18: UART1->CR3 = (u8) UART1_STOPBITS_1;                             // 1 stop bit.
      0084B5 35 00 52 36      [ 1]   65 	mov	0x5236+0, #0x00
                                     66 ;	user/uart.c: 19: UART1->BRR1 &= (uint8_t) (~UART1_BRR1_DIVM);
      0084B9 AE 52 32         [ 2]   67 	ldw	x, #0x5232
      0084BC F6               [ 1]   68 	ld	a, (x)
      0084BD 35 00 52 32      [ 1]   69 	mov	0x5232+0, #0x00
                                     70 ;	user/uart.c: 20: UART1->BRR2 &= (uint8_t) (~UART1_BRR2_DIVM);
      0084C1 AE 52 33         [ 2]   71 	ldw	x, #0x5233
      0084C4 F6               [ 1]   72 	ld	a, (x)
      0084C5 A4 0F            [ 1]   73 	and	a, #0x0f
      0084C7 F7               [ 1]   74 	ld	(x), a
                                     75 ;	user/uart.c: 21: UART1->BRR2 &= (uint8_t) (~UART1_BRR2_DIVF);
      0084C8 AE 52 33         [ 2]   76 	ldw	x, #0x5233
      0084CB F6               [ 1]   77 	ld	a, (x)
      0084CC A4 F0            [ 1]   78 	and	a, #0xf0
      0084CE F7               [ 1]   79 	ld	(x), a
                                     80 ;	user/uart.c: 23: UART1->BRR2 = 0x0b;
      0084CF 35 0B 52 33      [ 1]   81 	mov	0x5233+0, #0x0b
                                     82 ;	user/uart.c: 24: UART1->BRR1 = 0x08;
      0084D3 35 08 52 32      [ 1]   83 	mov	0x5232+0, #0x08
                                     84 ;	user/uart.c: 26: UART1->CR2 &= (u8) ~(UART1_CR2_TEN | UART1_CR2_REN);
      0084D7 AE 52 35         [ 2]   85 	ldw	x, #0x5235
      0084DA F6               [ 1]   86 	ld	a, (x)
      0084DB A4 F3            [ 1]   87 	and	a, #0xf3
      0084DD F7               [ 1]   88 	ld	(x), a
                                     89 ;	user/uart.c: 28: UART1->CR3 &= (u8)~(UART1_CR3_CPOL | UART1_CR3_CPHA | UART1_CR3_LBCL);
      0084DE AE 52 36         [ 2]   90 	ldw	x, #0x5236
      0084E1 F6               [ 1]   91 	ld	a, (x)
      0084E2 A4 F8            [ 1]   92 	and	a, #0xf8
      0084E4 F7               [ 1]   93 	ld	(x), a
                                     94 ;	user/uart.c: 30: UART1->CR3 |= (u8)((u8) UART1_SYNCMODE_CLOCK_ENABLE &
      0084E5 AE 52 36         [ 2]   95 	ldw	x, #0x5236
      0084E8 F6               [ 1]   96 	ld	a, (x)
      0084E9 AE 52 36         [ 2]   97 	ldw	x, #0x5236
      0084EC F7               [ 1]   98 	ld	(x), a
                                     99 ;	user/uart.c: 33: UART1->CR2 |= (u8) ((u8) UART1_CR2_TEN | (u8) UART1_CR2_REN);
      0084ED AE 52 35         [ 2]  100 	ldw	x, #0x5235
      0084F0 F6               [ 1]  101 	ld	a, (x)
      0084F1 AA 0C            [ 1]  102 	or	a, #0x0c
      0084F3 F7               [ 1]  103 	ld	(x), a
                                    104 ;	user/uart.c: 34: UART1->CR3 &= (u8) (~UART1_CR3_CKEN);
      0084F4 AE 52 36         [ 2]  105 	ldw	x, #0x5236
      0084F7 F6               [ 1]  106 	ld	a, (x)
      0084F8 A4 F7            [ 1]  107 	and	a, #0xf7
      0084FA F7               [ 1]  108 	ld	(x), a
      0084FB 81               [ 4]  109 	ret
                                    110 ;	user/uart.c: 38: void Printf(char *message)
                                    111 ;	-----------------------------------------
                                    112 ;	 function Printf
                                    113 ;	-----------------------------------------
      0084FC                        114 _Printf:
                                    115 ;	user/uart.c: 40: char *ch = message;
      0084FC 16 03            [ 2]  116 	ldw	y, (0x03, sp)
                                    117 ;	user/uart.c: 41: while (*ch)
      0084FE                        118 00104$:
      0084FE 90 F6            [ 1]  119 	ld	a, (y)
      008500 4D               [ 1]  120 	tnz	a
      008501 26 01            [ 1]  121 	jrne	00126$
      008503 81               [ 4]  122 	ret
      008504                        123 00126$:
                                    124 ;	user/uart.c: 43: UART1->DR = (u8) (*ch);
      008504 AE 52 31         [ 2]  125 	ldw	x, #0x5231
      008507 F7               [ 1]  126 	ld	(x), a
                                    127 ;	user/uart.c: 44: while ((UART1->SR & (u8) UART1_FLAG_TXE) == RESET);
      008508                        128 00101$:
      008508 AE 52 30         [ 2]  129 	ldw	x, #0x5230
      00850B F6               [ 1]  130 	ld	a, (x)
      00850C 4D               [ 1]  131 	tnz	a
      00850D 2A F9            [ 1]  132 	jrpl	00101$
                                    133 ;	user/uart.c: 45: ch++;
      00850F 90 5C            [ 2]  134 	incw	y
      008511 20 EB            [ 2]  135 	jra	00104$
      008513 81               [ 4]  136 	ret
                                    137 	.area CODE
                                    138 	.area INITIALIZER
                                    139 	.area CABS (ABS)
