#include "stm8s.h"
#include "stm8s_uart1.h"

void SetupSerialPort(void)
{
	//  Clear the Idle Line Detected bit in the status register by a read
	//  to the UART1_SR register followed by a Read to the UART1_DR register.
	(void) UART1->SR;
	(void) UART1->DR;

	UART1->CR2 = UART1_CR2_RESET_VALUE;
	UART1->CR4 = UART1_CR4_RESET_VALUE;
	UART1->CR5 = UART1_CR5_RESET_VALUE;
	UART1->GTR = UART1_GTR_RESET_VALUE;
	UART1->PSCR = UART1_PSCR_RESET_VALUE;
	//  Setup the port.
	UART1->CR1 = (u8) UART1_WORDLENGTH_8D | (u8) UART1_PARITY_NO;   // Word length = 8, no parity.
	UART1->CR3 = (u8) UART1_STOPBITS_1;                             // 1 stop bit.
	UART1->BRR1 &= (uint8_t) (~UART1_BRR1_DIVM);
	UART1->BRR2 &= (uint8_t) (~UART1_BRR2_DIVM);
	UART1->BRR2 &= (uint8_t) (~UART1_BRR2_DIVF);
	//  Set the clock prescaler for 11520 baud.  This assumes a 16 MHz clock speed.
	UART1->BRR2 = 0x0b;
	UART1->BRR1 = 0x08;
	//  Disable the Transmitter and Receiver before seting the LBCL, CPOL and CPHA bits
	UART1->CR2 &= (u8) ~(UART1_CR2_TEN | UART1_CR2_REN);
	//  Clear the Clock Polarity, lock Phase, Last Bit Clock pulse
	UART1->CR3 &= (u8)~(UART1_CR3_CPOL | UART1_CR3_CPHA | UART1_CR3_LBCL);
	//  Set the Clock Polarity, lock Phase, Last Bit Clock pulse
	UART1->CR3 |= (u8)((u8) UART1_SYNCMODE_CLOCK_ENABLE &
	(u8) (UART1_CR3_CPOL | UART1_CR3_CPHA | UART1_CR3_LBCL));
	//  Set the Tx and Rx state
	UART1->CR2 |= (u8) ((u8) UART1_CR2_TEN | (u8) UART1_CR2_REN);
	UART1->CR3 &= (u8) (~UART1_CR3_CKEN);
}

//  Send a message to the debug port (UART1).
void Printf(char *message)
{
	char *ch = message;
	while (*ch)
	{
		UART1->DR = (u8) (*ch);
		while ((UART1->SR & (u8) UART1_FLAG_TXE) == RESET);
		ch++;
	}
}



