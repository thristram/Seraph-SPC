#ifndef __MAIN_H
#define __MAIN_H



union f_malfunction   
{
	struct
	{
		uint8_t f_uart:1;
		uint8_t bit1:1;
		uint8_t bit2:1;
		uint8_t f_ac:1;
		uint8_t bit4:1;
		uint8_t bit5:1;
		uint8_t f_chl2:1;
		uint8_t f_chl1:1;
	}bit;
	
	uint8_t byte;
};


typedef struct
{ 
	u8 				deviceID[4];
	
	u8				model;		//设备型号
	
	u8				firmware_version;
	u8				HW_version;

	union f_malfunction f_mal;

	u8				manaYear;
	u8				manaMonth;
	u8				manaDay;

	u16				bash;		//生产批次号
	u16				meshID;
	u16				GATTmeshID;
	
	
	char				coord[12];	//设备在房间的位置

	u8				MDID;		//用于汇报SLC/SPC的信息，模块ID
	
	u8				savFlag;		//保存状态到eeprom的标志

	u8				ch1_status;
	u8				ch2_status;
	u8				ch3_status;
	u8				ch4_status;
	
	u16       			energy_consume;	/* 消耗的电量 */
	
}SPC;



extern SPC spc;


extern uint8_t 	channel;
extern uint8_t  last_ch1_status;
extern uint8_t  last_ch2_status;
extern uint8_t  last_ch3_status;
/*****action dimmer用标志位********/
extern union FLAG action_flag;




#define EEPROM_INIT_FLAG				0x55

#define EEPROM_INIT_ADDRESS			0
#define EEPROM_DEVICEID_ADDRESS		1
#define EEPROM_MODEL_ADDRESS		11

#define EEPROM_FW_VERSION_ADDRESS	13
#define EEPROM_HW_VERSION_ADDRESS	15

#define EEPROM_BASH_ADDRESS			17


#define EEPROM_MANA_YEAR_ADDRESS	19
#define EEPROM_MANA_MONTH_ADDRESS	20
#define EEPROM_MANA_DAY_ADDRESS	21


#define EEPROM_CH1_STATUS_ADDRESS	45
#define EEPROM_CH2_STATUS_ADDRESS	46
#define EEPROM_CH3_STATUS_ADDRESS	47
#define EEPROM_CH4_STATUS_ADDRESS	48





















#endif
