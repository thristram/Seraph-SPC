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
#include "timer.h"
#include "adc.h"
#include <string.h>
#include <stdio.h>
#include "uart.h"
#include "main.h"

SPC spc = {0};


volatile uint8_t 	channel;
uint8_t  last_ch1_status = 0;
uint8_t  last_ch2_status = 0;
uint8_t  last_ch3_status = 0;

/*****action dimmer�ñ�־λ********/

union FLAG action_flag;



/* Private variables ---------------------------------------------------------*/ 
/* Private function prototypes -----------------------------------------------*/
/* Private functions ---------------------------------------------------------*/
/* Public functions ----------------------------------------------------------*/



/*----------------------------------------------------------------------------
	//��ʱ����delay()�����β�Count���ڿ�����ʱ����ִ�д������޷���ֵ
-----------------------------------------------------------------------------*/
void delay(u16 Count)
{
	u8 i, j;
	
	while (Count--)		//Count�βο�����ʱ����
	{
		for(i=0;i<100;i++)
		for(j=0;j<50;j++);
	}
	
}

 /*----------------------------------------------------------------------------
 	EEPROM��д��һ���ֽ�
 	dLocal_Addr:EEPROM�еĵ�ַ����0x4000
	dLocal_Data:Ҫд��EEPOM�е�����
 -----------------------------------------------------------------------------*/
 void MEEPROM_WriteByte(u16 dLocal_Addr, u8 dLocal_Data)
 {
	FLASH_Unlock(FLASH_MEMTYPE_DATA);
	while (FLASH_GetFlagStatus(FLASH_FLAG_DUL) == RESET);
	
	FLASH_ProgramByte(FLASH_DATA_START_PHYSICAL_ADDRESS + dLocal_Addr, dLocal_Data);
	FLASH_Lock(FLASH_MEMTYPE_DATA);

 }


 /*----------------------------------------------------------------------------
	��EEPROM�ж�ȡһ���ֽ�
	ֱ��ʹ��FLASH_ReadByte(FLASH_DATA_START_PHYSICAL_ADDRESS + dLocal_Addr);
-----------------------------------------------------------------------------*/
 u8 MEEPROM_ReadByte(u16 dLocal_Addr)
 {
	 u8 dLocal_1;
	 dLocal_1 = FLASH_ReadByte(FLASH_DATA_START_PHYSICAL_ADDRESS + dLocal_Addr);
	 return dLocal_1;
 }
 


 /*----------------------------------------------------------------------------
	  ��ȡ�豸��Ϣ 
 -----------------------------------------------------------------------------*/
 void device_info_read(void)
 {
	u8 temp = 0;

	spc.savFlag = 0;
 
	spc.model = FLASH_ReadByte(FLASH_DATA_START_PHYSICAL_ADDRESS + EEPROM_MODEL_ADDRESS);
 	spc.firmware_version = FLASH_ReadByte(FLASH_DATA_START_PHYSICAL_ADDRESS + EEPROM_FW_VERSION_ADDRESS);	
	if(spc.firmware_version == 1){		/* ��һ�汾��device ID 4���ֽ�  */		
		spc.deviceID[0] = FLASH_ReadByte(FLASH_DATA_START_PHYSICAL_ADDRESS + EEPROM_DEVICEID_ADDRESS + 3);
		spc.deviceID[1] = FLASH_ReadByte(FLASH_DATA_START_PHYSICAL_ADDRESS + EEPROM_DEVICEID_ADDRESS + 2);
		spc.deviceID[2] = FLASH_ReadByte(FLASH_DATA_START_PHYSICAL_ADDRESS + EEPROM_DEVICEID_ADDRESS + 1);
		spc.deviceID[3] = FLASH_ReadByte(FLASH_DATA_START_PHYSICAL_ADDRESS + EEPROM_DEVICEID_ADDRESS + 0);
	}
	spc.HW_version = FLASH_ReadByte(FLASH_DATA_START_PHYSICAL_ADDRESS + EEPROM_HW_VERSION_ADDRESS);

	temp = FLASH_ReadByte(FLASH_DATA_START_PHYSICAL_ADDRESS + EEPROM_BASH_ADDRESS + 0);
	spc.bash = temp + 256 * FLASH_ReadByte(FLASH_DATA_START_PHYSICAL_ADDRESS + EEPROM_BASH_ADDRESS + 1);
	
	spc.manaYear = FLASH_ReadByte(FLASH_DATA_START_PHYSICAL_ADDRESS + EEPROM_MANA_YEAR_ADDRESS);
	spc.manaMonth = FLASH_ReadByte(FLASH_DATA_START_PHYSICAL_ADDRESS + EEPROM_MANA_MONTH_ADDRESS);
	spc.manaDay = FLASH_ReadByte(FLASH_DATA_START_PHYSICAL_ADDRESS + EEPROM_MANA_DAY_ADDRESS);

	spc.ch1_status = FLASH_ReadByte(FLASH_DATA_START_PHYSICAL_ADDRESS + EEPROM_CH1_STATUS_ADDRESS);
	spc.ch2_status = FLASH_ReadByte(FLASH_DATA_START_PHYSICAL_ADDRESS + EEPROM_CH2_STATUS_ADDRESS);
	spc.ch3_status = FLASH_ReadByte(FLASH_DATA_START_PHYSICAL_ADDRESS + EEPROM_CH3_STATUS_ADDRESS);
	spc.ch4_status = FLASH_ReadByte(FLASH_DATA_START_PHYSICAL_ADDRESS + EEPROM_CH4_STATUS_ADDRESS);

	last_ch1_status = spc.ch1_status;
	last_ch2_status = spc.ch2_status;
	last_ch3_status = spc.ch3_status;

	/* �ϵ�ִ�п��� */
	 if(spc.ch1_status){
		CH1_ON;
	 }else{
		CH1_OFF;
	 }
		 
	 if(spc.ch2_status){
		CH2_ON;
	 }else{
		CH2_OFF;
	 }

	 if(spc.ch3_status){
		CH3_ON;
	 }else{
		CH3_OFF;
	 }		 
 
 }



 /*----------------------------------------------------------------------------
	  ����״̬����
 -----------------------------------------------------------------------------*/
 void channel_status_save(void)
 {
	 FLASH_Unlock(FLASH_MEMTYPE_DATA);
	 while (FLASH_GetFlagStatus(FLASH_FLAG_DUL) == RESET);
	 
	 FLASH_ProgramByte(FLASH_DATA_START_PHYSICAL_ADDRESS + EEPROM_CH1_STATUS_ADDRESS, spc.ch1_status);
	 FLASH_ProgramByte(FLASH_DATA_START_PHYSICAL_ADDRESS + EEPROM_CH2_STATUS_ADDRESS, spc.ch2_status);
	 FLASH_ProgramByte(FLASH_DATA_START_PHYSICAL_ADDRESS + EEPROM_CH3_STATUS_ADDRESS, spc.ch3_status);
//	 FLASH_ProgramByte(FLASH_DATA_START_PHYSICAL_ADDRESS + EEPROM_CH4_STATUS_ADDRESS, spc.ch4_status);

	 FLASH_Lock(FLASH_MEMTYPE_DATA);
	 
 }



 /*----------------------------------------------------------------------------
	  ����Ĭ�ϵ���Ϣ
 -----------------------------------------------------------------------------*/
 void default_info_set(void)
 {	 
	//PCĬ�ϴ� 20171121
	 spc.ch1_status = 100;
	 spc.ch2_status = 100;
	 spc.ch3_status = 100;
	 spc.ch4_status = 100;

	 spc.energy_consume = 0;

	channel_status_save();
	
 }
 

 /*----------------------------------------------------------------------------
	 ��ʼ��EEPROM
 -----------------------------------------------------------------------------*/
 void MEEPROM_Init(void)
 {
	u8 temp = 0;
 
	FLASH_DeInit();
	temp = MEEPROM_ReadByte(EEPROM_INIT_ADDRESS);
	
	//�����ϵ�����Ĭ������
	if(temp == EEPROM_INIT_FLAG) {		
		MEEPROM_WriteByte(EEPROM_INIT_ADDRESS, EEPROM_INIT_FLAG);
		default_info_set();
	}
	
	device_info_read();

 }


 
 /*----------------------------------------------------------------------------
	 ����ϵͳʱ�� 
 -----------------------------------------------------------------------------*/
 void system_clock_set(void)
 {

	 //CLK->CKDIVR = 0; 			   // sys clock /1
	 CLK->SWCR |= 0x02; //�����л�
	 
	 CLK->SWR	= 0xb4; 	  //ѡ��ʱ��Ϊ�ⲿ16M
	 while((CLK->SWCR & 0x01) == 0x01);
	 CLK->CKDIVR = 0x80;	//����Ƶ
	 
	 CLK->SWCR	&= ~0x02; //�ر��л�

 }


 /*----------------------------------------------------------------------------
	 ��ȡ��ַ 
 -----------------------------------------------------------------------------*/
 u8 system_addr_get(void)
 {
	uint8_t slave_address = 0;

	 //��ַIO��ʼ��
	 slave_address = 0; 
	 GPIO_Init(GPIOD, (GPIO_Pin_TypeDef)GPIO_PIN_2, GPIO_MODE_IN_FL_NO_IT);
	 GPIO_Init(GPIOC, (GPIO_Pin_TypeDef)GPIO_PIN_5, GPIO_MODE_IN_FL_NO_IT);
	 GPIO_Init(GPIOC, (GPIO_Pin_TypeDef)GPIO_PIN_6, GPIO_MODE_IN_FL_NO_IT);
	 GPIO_Init(GPIOC, (GPIO_Pin_TypeDef)GPIO_PIN_7, GPIO_MODE_IN_FL_NO_IT);
//	 GPIO_Init(GPIOA, (GPIO_Pin_TypeDef)GPIO_PIN_3, GPIO_MODE_IN_FL_NO_IT);
	 
	 delay(100);
	 
	 if(GPIO_ReadInputData(GPIOD) & 0x04)	 slave_address |= 0x08;
	 if(GPIO_ReadInputData(GPIOC) & 0x20)	 slave_address |= 0x04;
	 if(GPIO_ReadInputData(GPIOC) & 0x40)	 slave_address |= 0x02;
	 if(GPIO_ReadInputData(GPIOC) & 0x80)	 slave_address |= 0x01;

	return slave_address;

 }

/*----------------------------------------------------------------------------
	�����ж����ȼ�
-----------------------------------------------------------------------------*/
void interrupt_priority_set(void)
{

//	//�ж����ȼ�����
	disableInterrupts();

	ITC_DeInit();
	ITC_SetSoftwarePriority(ITC_IRQ_TIM2_OVF, ITC_PRIORITYLEVEL_3);
	ITC_SetSoftwarePriority(ITC_IRQ_TIM4_OVF, ITC_PRIORITYLEVEL_1);

	ITC_SetSoftwarePriority(ITC_IRQ_UART1_TX, ITC_PRIORITYLEVEL_2);
	ITC_SetSoftwarePriority(ITC_IRQ_UART1_RX, ITC_PRIORITYLEVEL_2);

	/* Enable general interrupts */
	enableInterrupts();


}


 
/*----------------------------------------------------------------------------
	main
-----------------------------------------------------------------------------*/
void main(void)
{

	system_clock_set();
	
	//�̵���IO��ʼ��
	GPIO_Init(GPIOC, (GPIO_Pin_TypeDef)GPIO_PIN_3, GPIO_MODE_OUT_PP_LOW_SLOW);
	GPIO_Init(GPIOC, (GPIO_Pin_TypeDef)GPIO_PIN_4, GPIO_MODE_OUT_PP_LOW_SLOW);
	GPIO_Init(GPIOA, (GPIO_Pin_TypeDef)GPIO_PIN_3, GPIO_MODE_OUT_PP_LOW_SLOW);
	
	spc.MDID = system_addr_get();

	ADC_init();
	
	//���ڳ�ʼ��	
	uart1_init();
	
	/* 10ms timer */
	timer2_init();

	/* adc sample timer 250us */
	timer4_init();

	/* �����ж����ȼ� */
	interrupt_priority_set();


	MEEPROM_Init();

	/*Main Loop */
 	 while(1)
	{		
		if(spc.savFlag == 2){
			spc.savFlag = 0;
			channel_status_save();
		}

		/* ÿ30msת��һ�β���һ��adc�����ֵ����Сֵ */
		if(f_30ms){
			f_30ms = 0;
			adc_turn_once();
		}

		if(f_100ms){
			f_100ms = 0;
			calculate_power_1s();
		}

		if(f_1s){
			f_1s = 0;
			calculate_energy_1min();
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
