/**
  ******************************************************************************
  * @file    timer.c
  * @author  Seraph
  * @version  V1.0
  * @date     2017-03
  * @brief   This file contains the main function for STM8S003F3 timer operation.
**/

#define  _TIMER_GLOBAL
#include "stm8s.h"
#include "timer.h"



/**
  * @brief  initializion for time4
  * @param  None.
  * @retval None
  */
void Init_Time4(void)
{

	TIM4->PSCR = 0x06;//分频值 8M/2^5 = 250K 
	TIM4->IER = 0x01;//使能触发中断
	TIM4->CNTR = 250;//250*(1/250K) = 0.001s
	TIM4->ARR = 249;//自动重装的值
	
	//enableInterrupts();
	//TIM4->CR1 |= 0x01;//使能计数器
	TIM4->IER = 0x01;     // Enable interrupt
  TIM4->CR1 = 0x01;     // Start timer
}


/**
  * @brief  System time manage,set all the time flag used
  * @param  None.
  * @retval None
  */
void Sys_Time_Manage(void)
{
	/*systime_count2++;
	if(systime_count2 >= 100)
	{
		systime_count2 = 0;
		f_100ms = 1;
	}
	*/
	
	systime_count++;
	if (systime_count >= 1000)
	{
		systime_count = 0;
		f_1s = 1;
	}
}

#ifdef _COSMIC_
@far @interrupt void TIM4InterruptHandle (void) {
#else
void TIM4InterruptHandle (void) interrupt 23 {
#endif
  f_1ms = 1;
  TIM4->SR1= 0;
	Sys_Time_Manage();
	 
}
