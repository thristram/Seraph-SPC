#ifndef __I2C_SLAVE_H
#define __I2C_SLAVE_H
#include "stm8s.h"

#define	IIC_STATE_UNKNOWN			0
#define IIC_STATE_BEGIN				1
#define IIC_STATE_RECEIVEING	2
#define	IIC_STATE_END					3

#define linear_begin		action_flag._flag_bit.bit0//接收到Linear调光指令
#define linear_done			action_flag._flag_bit.bit1//Linear调光指令执行完成标志
#define eraseIn_begin		action_flag._flag_bit.bit2//接收到Linear调光指令
#define eraseIn_done		action_flag._flag_bit.bit3
#define eraseOut_begin	action_flag._flag_bit.bit4//接收到Linear调光指令
#define eraseOut_done		action_flag._flag_bit.bit5
#define swing_begin			action_flag._flag_bit.bit6//接收到Linear调光指令
#define swing_done			action_flag._flag_bit.bit7


typedef struct
{
	u8 frame_h1;
	u8 frame_h2;
	u8 message_id;
	u8 payload[30];
}I2C_Message;

typedef struct
{
	u16				meshid;
	u8 				deviceid[4];
	u8				firmware;
	u8				HWTtest;
	u8				model;//设备型号
	char			coord[10];//设备在房间的位置
	int				MDID;//用于汇报SLC/SPC的信息，模块ID
	u8				ch1_status;
	u8				ch2_status;
	u8				ch3_status;
	u8				ch4_status;
	u16       energy_consume;
}SPC;




/********************** EXTERNAL FUNCTION **********************************/  
	void transaction_begin(void);
	void transaction_end(void);
	void byte_received(u8 u8_RxData);
	u8 byte_write(void);
	void IIC_SlaveConfig(void);
	#ifdef _RAISONANCE_
		void I2C_Slave_check_event(void) interrupt 19;
	#endif
	#ifdef _COSMIC_ 
			@far @interrupt void I2C_Slave_check_event(void);
	#endif
	
	void init_device_info(void);
	void rev_heart_breat(void);
	void init_energy_consume(void);
	void rev_action_plug_done(void);
/********************** I2C configuration variables *****************************/  
	/* Define I2C Address mode ---------------------------------------------------*/
	#define I2C_slave_7Bits_Address

	/* Define Slave Address  -----------------------------------------------------*/
	#ifdef I2C_slave_10Bits_Address
		#define SLAVE_ADDRESS 0x3F0
	#endif 

	#ifdef I2C_slave_7Bits_Address
		//#define SLAVE_ADDRESS (((GPIOD->IDR>>1)&0xF)|0x60)
		#define SLAVE_ADDRESS slave_address
	#endif

	
#endif /*__I2C_SLAVE_H*/


/******************* (C) COPYRIGHT 2009 STMicroelectronics *****END OF FILE****/
