/**
*******************************************
* @file     main.c
* @author   nhantt
* @version  V1.0.0
* @date     25-March-2017
* @brief    This file brief for save memory used build with SDCC
*********************************************
*/

/* Includes ------------------------------------------------------------------*/
#include "stm8s.h"
#include "main.h"
#include "stm8s_gpio.h"
#include "stm8s_clk.h"
#include "stm8s_conf.h"
#include <string.h>
#include "timerTick.h"


TIME tick;

void clock_setup(void)
{
   CLK_DeInit();
   CLK_HSECmd(DISABLE);
   CLK_LSICmd(DISABLE);
   CLK_HSICmd(ENABLE);
   while(CLK_GetFlagStatus(CLK_FLAG_HSIRDY) == FALSE);
   CLK_ClockSwitchCmd(ENABLE);
   CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
   CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV2);
   CLK_ClockSwitchConfig(CLK_SWITCHMODE_AUTO, CLK_SOURCE_HSI, DISABLE, CLK_CURRENTCLOCKSTATE_ENABLE);
   
   CLK_PeripheralClockConfig(CLK_PERIPHERAL_ADC, DISABLE);
   CLK_PeripheralClockConfig(CLK_PERIPHERAL_AWU, DISABLE);
   CLK_PeripheralClockConfig(CLK_PERIPHERAL_UART1, DISABLE);
   CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER1, DISABLE);
   CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER2, DISABLE);
   CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER4, ENABLE);
}

INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 23)
{
  TIM4_ClearITPendingBit(TIM4_IT_UPDATE);
  TIMER_Inc();
  //IWDG_ReloadCounter();
}



// void IWDG_Config(void)
// {
//   /* IWDG timeout equal to 500 ms (the timeout may varies due to LSI frequency dispersion) */
//   /* Enable write access to IWDG_PR and IWDG_RLR registers */
//   IWDG_WriteAccessCmd(IWDG_WriteAccess_Enable);
//   /* IWDG counter clock: LSI 128KHz/256 */
//   IWDG_SetPrescaler(IWDG_Prescaler_256);
//   //Set counter reload value to obtain 0.5s IWDG TimeOut.
//   //Counter Reload Value = 0.5s/IWDG counter clock period
//   //                       = 0.5s*LsiFreq/(256) 
//   IWDG_SetReload(250);
//   /* Reload IWDG counter */
//   IWDG_ReloadCounter();
//   /* Enable IWDG (the LSI oscillator will be enabled by hardware) */
//   IWDG_Enable();
// 
void delay(uint16_t x)
{
  while(x--);
}
void delay_ms(int time){
  while(time--){
    delay(1000);
  }
}


void main() 
{
  GPIO_Init(GPIOA,GPIO_PIN_1,GPIO_MODE_OUT_PP_LOW_SLOW);
 
  clock_setup();

  TIMER_Init();
  //IWDG_Config();
  enableInterrupts();
  while(1)
  {
    GPIO_WriteHigh(GPIOA,GPIO_PIN_1);
    delay_ms(1000);
    GPIO_WriteLow(GPIOA,GPIO_PIN_1);
    delay_ms(1000);
  }
  
  
}
