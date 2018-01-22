/**
*******************************************
* @file     main.c
* @author   khanhdtr93
* @version  V1.0.0
* @date     22-January-2018
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
#include "BH1750.h"
#include "uart.h"

TIME tick;

//Initialize a variable to keep current LED state
uint8_t ToggleVar = 1;

void clock_setup(void)
{
   CLK_DeInit();
   CLK_HSECmd(DISABLE);
   CLK_LSICmd(DISABLE);
   CLK_HSICmd(ENABLE);
   while(CLK_GetFlagStatus(CLK_FLAG_HSIRDY) == FALSE);
   CLK_ClockSwitchCmd(ENABLE);

   CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
 //  CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV8);

   CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV1 );
   CLK_ClockSwitchConfig(CLK_SWITCHMODE_AUTO, CLK_SOURCE_HSI, DISABLE, CLK_CURRENTCLOCKSTATE_ENABLE);
   
   CLK_PeripheralClockConfig(CLK_PERIPHERAL_SPI, DISABLE);
   CLK_PeripheralClockConfig(CLK_PERIPHERAL_I2C, ENABLE);
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

void I2C_setup(void)
{
    I2C_DeInit();
    I2C_Init(100000, 
             BH1750_addr, 
             I2C_DUTYCYCLE_2, 
             I2C_ACK_CURR, 
             I2C_ADDMODE_7BIT, 
             (CLK_GetClockFreq() / 1000000));
     I2C_Cmd(ENABLE);
}
 
void GPIO_setup(void)
{   
    GPIO_Init(GPIOB, GPIO_PIN_4, GPIO_MODE_OUT_OD_HIZ_FAST);
    GPIO_Init(GPIOB, GPIO_PIN_5, GPIO_MODE_OUT_OD_HIZ_FAST);
    GPIO_Init(GPIOA,GPIO_PIN_1,GPIO_MODE_OUT_PP_LOW_SLOW);
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

void Led_manager (void)
{ 
  if(TIMER_CheckTimeMS(&tick, 1000) == 0) ToggleVar = ~ToggleVar;  
     if(ToggleVar == 0x01)   
       GPIO_WriteHigh(GPIOA,GPIO_PIN_1);   
     else 
       GPIO_WriteLow(GPIOA,GPIO_PIN_1);
}


void main() 
{
  unsigned int LX = 0x0000;
  unsigned int tmp = 0x0000;
  clock_setup();
  GPIO_setup();
//  I2C_setup();
 // BH1750_init();
  TIMER_Init();
  SetupSerialPort();
  //IWDG_Config();
  enableInterrupts();
  TIMER_InitTime(&tick);
  while(1)
  {
         Led_manager ();
         Printf("Hello from my program");
  /*       tmp = get_lux_value(cont_L_res_mode, 20);
        
         if(tmp > 10)
         {
             LX = tmp;
         }
         else
         {
             LX = get_lux_value(cont_H_res_mode1, 140);
         }
         */
  }
  
}
