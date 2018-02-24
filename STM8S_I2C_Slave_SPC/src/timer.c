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
#include "adc.h"
#include "main.h"




/*----------------------------------------------------------------------------
	定时10ms
-----------------------------------------------------------------------------*/
void timer2_init(void)
{    
	TIM2_TimeBaseInit(TIM2_PRESCALER_64, 2500);
	TIM2_ClearFlag(TIM2_FLAG_UPDATE);
	TIM2_ITConfig(TIM2_IT_UPDATE, ENABLE);	
	TIM2_Cmd(ENABLE);	

	Flag1 = 0;
	c_30ms = 0;
	c_1s = 0;
	c_100ms = 0;
	
}


/*----------------------------------------------------------------------------
	定时250us
-----------------------------------------------------------------------------*/
void timer4_init(void)
{    
	TIM4_TimeBaseInit(TIM4_PRESCALER_16, 250);
	TIM4_ClearFlag(TIM4_FLAG_UPDATE);
	TIM4_ITConfig(TIM4_IT_UPDATE, ENABLE);	
	TIM4_Cmd(ENABLE);	
	
}




/*----------------------------------------------------------------------------
	实时转化
-----------------------------------------------------------------------------*/
#ifdef _RAISONANCE_
void Timer2_ISR(void) interrupt 13 {
#endif
#ifdef _COSMIC_
@far @interrupt void Timer2_ISR(void) {
#endif

	/* 清除标志 */
	TIM2->SR1 = 0;

	c_30ms++;	
	if(c_30ms >= 3){
		f_30ms = 1;
		c_30ms = 0;
	}

	c_1s++;	
	if(c_1s >= 100){
		f_1s = 1;
		c_1s = 0;
	}

	c_100ms++; 
	if(c_100ms >= 10){
		f_100ms = 1;
		c_100ms = 0;
	}



}




/*----------------------------------------------------------------------------
	实时转化
-----------------------------------------------------------------------------*/

#ifdef _COSMIC_
@far @interrupt void TIM4InterruptHandle (void) {
#else
void TIM4InterruptHandle (void) interrupt 23 {
#endif

  	TIM4->SR1 = 0;
	
	ADC1_StartConversion(); 	//启动转换
	while(ADC1_GetFlagStatus(ADC1_FLAG_EOC) == RESET);	//等待转换结束
	adc_sample.valSmp = ADC1_GetConversionValue();		//获取采样值

	if(adc_sample.valSmp > adc_sample.valMax){	
		adc_sample.valMax = adc_sample.valSmp;
	}

	if(adc_sample.valSmp < adc_sample.valMin){	
		adc_sample.valMin = adc_sample.valSmp;
	}
	
}





