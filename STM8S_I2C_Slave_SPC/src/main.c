/**
  ******************************************************************************
  * file main.c
  * brief This file contains the main function for I2C interrupt mode example.
  * author STMicroelectronics - MCD Application Team
  * version V1.0.0
  * date 01/03/2010
  ******************************************************************************
  *
  * THE PRESENT FIRMWARE WHICH IS FOR GUIDANCE ONLY AIMS AT PROVIDING CUSTOMERS
  * WITH CODING INFORMATION REGARDING THEIR PRODUCTS IN ORDER FOR THEM TO SAVE
  * TIME. AS A RESULT, STMICROELECTRONICS SHALL NOT BE HELD LIABLE FOR ANY
  * DIRECT, INDIRECT OR CONSEQUENTIAL DAMAGES WITH RESPECT TO ANY CLAIMS ARISING
  * FROM THE CONTENT OF SUCH FIRMWARE AND/OR THE USE MADE BY CUSTOMERS OF THE
  * CODING INFORMATION CONTAINED HEREIN IN CONNECTION WITH THEIR PRODUCTS.
  *
  *                    COPYRIGHT 2009 STMicroelectronics
  ******************************************************************************
  */

/* Includes ------------------------------------------------------------------*/
#include "stm8s.h"
#include "I2c_slave_interrupt.h"
#include "uart_printf.h"
#include "timer.h"
#include "adc.h"
#include <string.h>
#include <stdio.h>

#define CH1_ON			GPIO_WriteHigh(GPIOC, (GPIO_Pin_TypeDef)GPIO_PIN_3)
#define CH1_OFF			GPIO_WriteLow(GPIOC, (GPIO_Pin_TypeDef)GPIO_PIN_3)
#define CH2_ON			GPIO_WriteHigh(GPIOC, (GPIO_Pin_TypeDef)GPIO_PIN_4)
#define CH2_OFF			GPIO_WriteLow(GPIOC, (GPIO_Pin_TypeDef)GPIO_PIN_4)
#define CH3_ON			GPIO_WriteHigh(GPIOA, (GPIO_Pin_TypeDef)GPIO_PIN_3)
#define CH3_OFF			GPIO_WriteLow(GPIOA, (GPIO_Pin_TypeDef)GPIO_PIN_3)

/* Private typedef -----------------------------------------------------------*/
/* Private define ------------------------------------------------------------*/
/* Private macro -------------------------------------------------------------*/
extern SPC spc;
extern uint8_t slave_address;
extern uint8_t IIC_RxBuffer[];
extern uint8_t GetDataIndex;
extern uint8_t ReceiveState;
extern uint8_t SendDataIndex;
extern uint8_t IIC_TxBuffer[];

extern uint8_t  ch1_status_change;
extern uint8_t  ch2_status_change;

u8 Tick10s;

/* Private variables ---------------------------------------------------------*/ 
/* Private function prototypes -----------------------------------------------*/
/* Private functions ---------------------------------------------------------*/
/* Public functions ----------------------------------------------------------*/

/****************************************************************/
//延时函数delay()，有形参Count用于控制延时函数执行次数，无返回值
/****************************************************************/
void delay(u16 Count)
{
  u8 i,j;
  while (Count--)//Count形参控制延时次数
  {
    for(i=0;i<100;i++)
    for(j=0;j<50;j++);
  }
}

 /*
  * Example firmware main entry point.
  * Parameters: None
  * Retval . None
  */
	
void main(void)
{
	uint8_t i;
	uint16_t cmd;
	//CLK->CKDIVR = 0;                // sys clock /1
	CLK->SWCR |= 0x02; //开启切换
  CLK->SWR   = 0xb4;       //选择时钟为外部8M
  while((CLK->SWCR & 0x01)==0x01);
  CLK->CKDIVR = 0x80;    //不分频
  CLK->SWCR  &= ~0x02; //关闭切换

	//地址IO初始化
	GPIO_Init(GPIOD, (GPIO_Pin_TypeDef)GPIO_PIN_2, GPIO_MODE_IN_PU_NO_IT);
	GPIO_Init(GPIOC, (GPIO_Pin_TypeDef)GPIO_PIN_5, GPIO_MODE_IN_PU_NO_IT);
	GPIO_Init(GPIOC, (GPIO_Pin_TypeDef)GPIO_PIN_6, GPIO_MODE_IN_PU_NO_IT);
	GPIO_Init(GPIOC, (GPIO_Pin_TypeDef)GPIO_PIN_7, GPIO_MODE_IN_PU_NO_IT);
	//继电器IO初始化
	GPIO_Init(GPIOC, (GPIO_Pin_TypeDef)GPIO_PIN_3, GPIO_MODE_OUT_PP_LOW_SLOW);
	GPIO_Init(GPIOC, (GPIO_Pin_TypeDef)GPIO_PIN_4, GPIO_MODE_OUT_PP_LOW_SLOW);
	GPIO_Init(GPIOA, (GPIO_Pin_TypeDef)GPIO_PIN_3, GPIO_MODE_OUT_PP_LOW_SLOW);
	delay(100);
	if(GPIO_ReadInputData(GPIOD) & 0x04)	slave_address |= 0x08;
	if(GPIO_ReadInputData(GPIOC) & 0x20)	slave_address |= 0x04;
	if(GPIO_ReadInputData(GPIOC) & 0x40)	slave_address |= 0x02;
	if(GPIO_ReadInputData(GPIOC) & 0x80)	slave_address |= 0x01;
	spc.MDID = slave_address;
	ADC_init();
	//串口初始化
	UART_Init(115200);
	Init_Time4();
	printf("Hello World!\n");
	/* Initialise I2C for communication */
	IIC_SlaveConfig();
	
	
	enableInterrupts();
	 

	/*Main Loop */
  while(1)
	{		
		if(ReceiveState == IIC_STATE_END)
		{
			for(i=0;i<GetDataIndex;i++){
				printf("%02X ",IIC_RxBuffer[i]&0xFF);
			}
			printf("\n");
			ReceiveState = IIC_STATE_UNKNOWN;
			GetDataIndex = 0;
		}
		if(f_100ms){
			f_100ms = 0;
			if(ch1_status_change){
				if(spc.ch1_status == 0x63)	CH1_ON;
				else												CH1_OFF;
				ch1_status_change = 0;
			}
			if(ch2_status_change){
				if(spc.ch2_status == 0x63)	CH2_ON;
				else												CH2_OFF;
				ch2_status_change = 0;
			}
		}
		if(f_1s){
			f_1s = 0;
			Tick10s++;
			if(Tick10s >= 10){
				Tick10s = 0;
				AcquireEG();
				printf("Hello World!\n");
			}
		}
	}
}

#ifdef USE_FULL_ASSERT

/**
  * @brief  Reports the name of the source file and the source line number
  *   where the assert_param error has occurred.
  * @param file: pointer to the source file name
  * @param line: assert_param error line source number
  * @retval None
  */
void assert_failed(uint8_t* file, uint32_t line)
{ 
  /* User can add his own implementation to report the file name and line number,
     ex: printf("Wrong parameters value: file %s on line %d\r\n", file, line) */

  /* Infinite loop */
  while (1)
  {
  }
}
#endif




/******************* (C) COPYRIGHT 2009 STMicroelectronics *****END OF FILE****/
