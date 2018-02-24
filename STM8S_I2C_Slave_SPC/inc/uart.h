#ifndef __UART_H
#define __UART_H

#include "stm8s.h"

#ifndef _UART_GLOBAL
#define UART_EXT	extern
#else
#define UART_EXT
#endif



#define MAX              255             	//��������ֵ  
#define MIN              1              	//�������Сֵ 

#define Uart2_Send_Len	 40
#define Uart2_Rec_Len	 	 40

#define UART1_SEND_LEN	 40
#define UART1_RECV_LEN	 40


typedef struct
{
	u8	addr;
	u16 	rxlen;		//�ѽ��յ��ֽ���
	u16 	txlen;		//����Ҫ���͵��ֽ���
	u16 	txhas;		//�ѷ��͵��ֽ���
	
	u8 	rxbuf[UART1_RECV_LEN];
	u8 	txbuf[UART1_SEND_LEN];
	
}uart1_frame_t;	//SICP�����ݽṹ


typedef struct
{
	u8 	frame_h1;
	u8 	frame_h2;
	u8	addr;
	u8 	msg_id;
	u8 	msg_len;
	u8 	*payload;
	
}uart1_msg_t;



#define MAX_BUFFER  32


#define	IIC_STATE_UNKNOWN			0
#define 	IIC_STATE_BEGIN				1
#define 	IIC_STATE_RECEIVEING		2
#define	IIC_STATE_END				3


//#define CH3_ON			GPIO_WriteHigh(GPIOC, (GPIO_Pin_TypeDef)GPIO_PIN_3)
//#define CH3_OFF			GPIO_WriteLow(GPIOC, (GPIO_Pin_TypeDef)GPIO_PIN_3)
//#define CH2_ON			GPIO_WriteHigh(GPIOC, (GPIO_Pin_TypeDef)GPIO_PIN_4)
//#define CH2_OFF			GPIO_WriteLow(GPIOC, (GPIO_Pin_TypeDef)GPIO_PIN_4)
//#define CH1_ON			GPIO_WriteHigh(GPIOA, (GPIO_Pin_TypeDef)GPIO_PIN_3)
//#define CH1_OFF			GPIO_WriteLow(GPIOA, (GPIO_Pin_TypeDef)GPIO_PIN_3)

#define CH3_OFF			GPIO_WriteHigh(GPIOC, (GPIO_Pin_TypeDef)GPIO_PIN_3)
#define CH3_ON			GPIO_WriteLow(GPIOC, (GPIO_Pin_TypeDef)GPIO_PIN_3)
#define CH2_OFF			GPIO_WriteHigh(GPIOC, (GPIO_Pin_TypeDef)GPIO_PIN_4)
#define CH2_ON			GPIO_WriteLow(GPIOC, (GPIO_Pin_TypeDef)GPIO_PIN_4)
#define CH1_OFF			GPIO_WriteHigh(GPIOA, (GPIO_Pin_TypeDef)GPIO_PIN_3)
#define CH1_ON			GPIO_WriteLow(GPIOA, (GPIO_Pin_TypeDef)GPIO_PIN_3)




#define linear_begin		action_flag._flag_bit.bit0//���յ�Linear����ָ��
#define linear_done			action_flag._flag_bit.bit1//Linear����ָ��ִ����ɱ�־
#define eraseIn_begin		action_flag._flag_bit.bit2//���յ�EraseIn����ָ��
#define eraseIn_done		action_flag._flag_bit.bit3//Erase In����ָ��ִ����ɱ�־
#define eraseOut_begin		action_flag._flag_bit.bit4//���յ�Erase Out����ָ��
#define eraseOut_done		action_flag._flag_bit.bit5//Erase Out����ָ��ִ����ɱ�־
#define swing_begin		action_flag._flag_bit.bit6//���յ�Swing����ָ��
#define swing_done			action_flag._flag_bit.bit7//Swing ����ָ��ִ����ɱ�־


typedef struct
{
	u8 frame_h1;
	u8 frame_h2;
	u8 message_id;
	u8 payload[30];
	
}I2C_Message;








extern uart1_frame_t uart1_frame;


#define UART1_POSITION_LENGTH	 	4
#define UART1_POSITION_COMMAND	 	5
#define UART1_POSITION_TYPE			6

#define UART1_AFTER_LENGTH_BYTES	 5


void uart1_init(void);

@interrupt void UART1_TX_ISR(void);
@interrupt void UART1_RX_ISR(void);



#endif


