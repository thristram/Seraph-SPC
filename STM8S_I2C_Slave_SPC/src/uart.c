/**
  ******************************************************************************
  * @file    uart.c
  * @author  Seraph
  * @version  V1.0
  * @date     2017-03
  * @brief   This file contains the main function for STM8S003F3 timer operation.
**/


#define  _UART_GLOBAL

#include <stdlib.h>
//#include <string.h>
//#include <stdio.h>
#include "stm8s.h"
#include "uart.h"
#include "adc.h"
#include "main.h"




uart1_frame_t uart1_frame;



/**
  * @brief  产生随机数 1~255
  * @param  None.
  * @retval None
  */

u8 random(u8 xxx)  
{  
	u8 value, iii;  
	for(iii=0; iii<xxx; iii++)  
	{  
		value = rand() % (MAX + 1- MIN) + MIN; //获取一个随机数1~255
	}  
	return value;  
} 


//复制内存
//*des:目的地址
//*src:源地址
//n:需要复制的内存长度(字节为单位)
void mymemcpy(void *des,void *src,u32 n)  
{  
  u8 *xdes=des;
	u8 *xsrc=src; 
  while(n--)*xdes++=*xsrc++;  
}  


/**
  * @brief  check sum(cumulative sum)
  * @param  u8 *sendbuf,u8 length.
  * @retval u8 result
  */
u8 uart1_check_sum(u8 *buf, u8 length)
{
	u8 i;
	u8 result = *buf++;
	
	for(i = 1; i < length; i++)
	{
		result ^= *buf++;
	}
	
	return result;
}


/**
  * @brief  initializion for uart1
  * @param  None.
  * @retval None
  */
void uart1_init(void)
{
	UART1_DeInit();
	//波特率115200，8位数据位，1位停止位，无校验位，禁用同步模式，允许接收和发送
	UART1_Init((u32)19200, UART1_WORDLENGTH_8D, UART1_STOPBITS_1, UART1_PARITY_NO, UART1_SYNCMODE_CLOCK_DISABLE, UART1_MODE_TXRX_ENABLE);
	UART1_ITConfig(UART1_IT_TC, ENABLE);//发送完成中断
	UART1_ITConfig(UART1_IT_RXNE_OR, ENABLE);//接收非空中断
	UART1_Cmd(ENABLE);//启用uart1接口
}



/**
  * @brief  uart1 send data start
  * @param  none.
  * @retval None
  */
void Uart1_Send(u8 *buf, u16 len)
{
	if(len >= UART1_SEND_LEN)	
		len = UART1_SEND_LEN;
	
	mymemcpy(uart1_frame.txbuf, buf, len);
	
	uart1_frame.txlen = len;
	uart1_frame.txhas = 1;
	UART1->DR = uart1_frame.txbuf[0];
	
}


/**
  * @brief  uart1 init_device_info
  * @param  none.
  * @retval None
  */
void uart1_init_device_info(void)
{
	uart1_frame.txbuf[0] = 0x7e;
	uart1_frame.txbuf[1] = 0x7e;
	uart1_frame.txbuf[2] = spc.MDID;		//addr
	uart1_frame.txbuf[3] = uart1_frame.rxbuf[3];	//message id
	uart1_frame.txbuf[4] = 12;	//len
	uart1_frame.txbuf[5] = 0xB3;	//payload
	uart1_frame.txbuf[6] = spc.deviceID[0];
	uart1_frame.txbuf[7] = spc.deviceID[1];
	uart1_frame.txbuf[8] = spc.deviceID[2];
	uart1_frame.txbuf[9] = spc.deviceID[3];
	uart1_frame.txbuf[10] = spc.model;
	uart1_frame.txbuf[11] = spc.firmware_version;
	uart1_frame.txbuf[12] = spc.f_mal.byte;
	uart1_frame.txbuf[13] = spc.MDID;	
	uart1_frame.txbuf[14] = uart1_check_sum(&uart1_frame.txbuf[2], uart1_frame.txbuf[4]);

	uart1_frame.txlen = uart1_frame.txbuf[4] + 3;
	uart1_frame.txhas = 1;
	UART1->DR = uart1_frame.txbuf[0];

	
}

/**
  * @brief  uart1 
  * @param  none.
  * @retval None
  */
void uart1_init_energy_consume(void)
{

	uart1_frame.txbuf[0] = 0x7e;
	uart1_frame.txbuf[1] = 0x7e;
	uart1_frame.txbuf[2] = spc.MDID;		//addr
	uart1_frame.txbuf[3] = uart1_frame.rxbuf[3];	//message id
	uart1_frame.txbuf[4] = 7;	//len
	uart1_frame.txbuf[5] = 0x2a;	//payload
	
	uart1_frame.txbuf[6] = (u8)((spc.energy_consume >> 8) & 0xff);
	uart1_frame.txbuf[7] = (u8)(spc.energy_consume & 0xff);

	uart1_frame.txbuf[8] = spc.MDID;
	uart1_frame.txbuf[9] = uart1_check_sum(&uart1_frame.txbuf[2], uart1_frame.txbuf[4]);

	uart1_frame.txlen = uart1_frame.txbuf[4] + 3;
	uart1_frame.txhas = 1;
	UART1->DR = uart1_frame.txbuf[0];
	
}






/**
  * @brief  
  * @param  none.
  * @retval None
  */
void uart1_rev_heart_breat(void)
{
	uart1_frame.txbuf[0] = 0x7e;
	uart1_frame.txbuf[1] = 0x7e;
	uart1_frame.txbuf[2] = spc.MDID;		//addr
	uart1_frame.txbuf[3] = uart1_frame.rxbuf[3];	//message id
	uart1_frame.txbuf[4] = 10;	//len
	uart1_frame.txbuf[5] = 0x06;	//payload
	uart1_frame.txbuf[6] = spc.MDID;
	uart1_frame.txbuf[7] = spc.ch1_status;
	uart1_frame.txbuf[8] = spc.ch2_status;
	uart1_frame.txbuf[9] = spc.ch3_status;
	uart1_frame.txbuf[10] = spc.ch4_status;
	uart1_frame.txbuf[11] = spc.f_mal.byte;
	uart1_frame.txbuf[12] = uart1_check_sum(&uart1_frame.txbuf[2], uart1_frame.txbuf[4]);

	uart1_frame.txlen = uart1_frame.txbuf[4] + 3;
	uart1_frame.txhas = 1;
	UART1->DR = uart1_frame.txbuf[0];
	
}

/**
  * 
  * @param  none.
  * @retval None
  */
void uart1_rev_action_plug_done(void)
{
	uart1_frame.txbuf[0] = 0x7e;
	uart1_frame.txbuf[1] = 0x7e;
	uart1_frame.txbuf[2] = spc.MDID;			//addr
	uart1_frame.txbuf[3] = uart1_frame.rxbuf[3];	//message id
	uart1_frame.txbuf[4] = 10;	//len
	uart1_frame.txbuf[5] = 0xaa;	//payload

	uart1_frame.txbuf[6] = 0x05;	//payload
	uart1_frame.txbuf[7] = spc.MDID;
	uart1_frame.txbuf[8] = spc.ch1_status;
	uart1_frame.txbuf[9] = spc.ch2_status;
	uart1_frame.txbuf[10] = spc.ch3_status;
	uart1_frame.txbuf[11] = spc.ch4_status;
	uart1_frame.txbuf[12] = uart1_check_sum(&uart1_frame.txbuf[2], uart1_frame.txbuf[4]);

	uart1_frame.txlen = uart1_frame.txbuf[4] + 3;
	uart1_frame.txhas = 1;
	UART1->DR = uart1_frame.txbuf[0];

}



/**
  * @brief  uart1 recv handle
  * @param  none.
  * @retval None
  */
void uart1_recv_handle(void)
{
	
	//判断指令
	switch(uart1_frame.rxbuf[UART1_POSITION_COMMAND]){
		case 0xFE:
			if(uart1_frame.rxbuf[6] == 0x01){
				uart1_init_device_info();
			}			
			else if(uart1_frame.rxbuf[6] == 0x02){
				spc.energy_consume = adc_sample.total_energy;
				uart1_init_energy_consume();
				adc_sample.total_energy = 0;
	
			}
			break;
		case 0x03:
			if((uart1_frame.rxbuf[6] == 0x03) && (uart1_frame.rxbuf[7] == spc.MDID)){
				//校验正确
				if(uart1_check_sum(&uart1_frame.rxbuf[2], uart1_frame.rxbuf[4]) == uart1_frame.rxbuf[8]){
					uart1_rev_heart_breat();
				}
			}
			break;
		case 0x55://打开或关闭开关
		
			if((uart1_frame.rxbuf[6] >> 4) == spc.MDID){
				
				channel = uart1_frame.rxbuf[6] & 0x0f;
				if((channel & 0x01)==0x01)	{
					spc.ch1_status = uart1_frame.rxbuf[7];
					if(spc.ch1_status != last_ch1_status)	{						
						spc.savFlag = 1;		/* 保存状态数据 */
						if(spc.ch1_status)
							CH1_ON;
						else	
							CH1_OFF;
					}
					last_ch1_status = spc.ch1_status;
				}
				if((channel & 0x02)==0x02)	{
					spc.ch2_status = uart1_frame.rxbuf[7];
					if(spc.ch2_status != last_ch2_status)	{
						spc.savFlag = 1;		/* 保存状态数据 */
						if(spc.ch2_status)
							CH2_ON;
						else
							CH2_OFF;
					}
					last_ch2_status = spc.ch2_status;
									
				}
				if((channel & 0x04)==0x04)	{
					spc.ch3_status = uart1_frame.rxbuf[7];
					if(spc.ch3_status != last_ch3_status)	{
						spc.savFlag = 1;		/* 保存状态数据 */
						if(spc.ch3_status)
							CH3_ON;
						else
							CH3_OFF;
					}
					last_ch3_status = spc.ch3_status;
				}
				uart1_rev_action_plug_done();
	
				
			}
			
			break;
			
		default:
			break;
		
	}

}


/**
  * @brief  uart1tx isr
  * @param  none.
  * @retval None
  */
@interrupt void UART1_TX_ISR(void) 
{
	/* In order to detect unexpected events during development,
	it is recommended to set a breakpoint on the following instruction.
	*/
	
	UART1->SR &= ~0x40; 	//清除发送完成标志位

	if (uart1_frame.txhas < uart1_frame.txlen){
		
		UART1->DR = uart1_frame.txbuf[uart1_frame.txhas];
		uart1_frame.txhas++;
	  
	}else{

		uart1_frame.txhas = 0;
		uart1_frame.txlen = 0;
		
		if(spc.savFlag == 1){
			spc.savFlag = 2;
		}

	}

	
}



/**
  * @brief  uart1 rx isr
  * @param  none.
  * @retval None
  */

@interrupt void UART1_RX_ISR(void)
{
	u8 temp, i, check_sum;
	
	temp = (u8)UART1->DR;
	uart1_frame.rxbuf[uart1_frame.rxlen] = temp;
	uart1_frame.rxlen++;

	switch(uart1_frame.rxlen){
		
		case 1:
			if (temp != 0x7e) uart1_frame.rxlen = 0;
			break;
			
		case 2:
			if (temp != 0x7e) uart1_frame.rxlen = 0;
			break;
			
		case 3:
			if (temp != spc.MDID) uart1_frame.rxlen = 0;
			break;
			
		default:
			//防止接收错误后溢出
			if (uart1_frame.rxlen >= UART1_RECV_LEN){
				uart1_frame.rxlen = 0;
			}

			//接收到长度以后再判断数据是否接收完成
			if(uart1_frame.rxlen > UART1_AFTER_LENGTH_BYTES){	

				if (uart1_frame.rxlen >= uart1_frame.rxbuf[UART1_POSITION_LENGTH] + 3)//接收数据完成
				{
					
					check_sum = uart1_check_sum(uart1_frame.rxbuf + 2, uart1_frame.rxbuf[UART1_POSITION_LENGTH]);
		
					//校验正确	
					if (check_sum == uart1_frame.rxbuf[uart1_frame.rxlen - 1]){
					
						//直接处理
						uart1_recv_handle();
					}
					
					uart1_frame.rxlen = 0;
				}


			}

			break;
			
	}
	
	if (UART1->SR & 0x20) //|| (UART1->SR & UART2_SR_OR))
	{
		temp = UART1->DR;
	}	
	
}

























