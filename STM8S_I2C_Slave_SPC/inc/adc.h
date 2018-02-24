#ifndef __ADC_H
#define __ADC_H

#ifndef _ADC_GLOBAL
#define ADC_EXT	extern
#else
#define ADC_EXT
#endif










/*----------------------------------------------------------------------------
	Vout，芯片端采集的电压
	Viout，电流采集芯片输出电压
	Vd，二极管压降
	
	Viout2 = Vout2 * (12 / 12.2) + Vd
	Viout1 = Vout1 * (12 / 12.2) + Vd	
	Viout2 - Viout1 = (Vout2 - Vout1) * (12 / 12.2)
	

	
-----------------------------------------------------------------------------*/


/* ADC采样的电压差与实际的电流差之比为 6.469 取6.47 */
#define VOLTAGE_AND_CURRENT_RATIO		6.47

/* ADC采样最大值 */
#define ADC_MAX			1023

/* ADC采样最大值对应的电压 */
#define VOLTAGE_MAX		3.3


/* 实际交流电压值 */
#define AC_ACTUAL_VOLTAGE		234

/* 保存的电流个数最大值  */
#define CURRENT_SAVE_MAX	10



/* 电流最大值  */
#define CURRENT_VALUE_MAX	30.0


typedef struct
{
	
	u16 	valSmp;		/* 采集到当前值  */
	u16 	valMax;		/* 采集到的最大值 */
	u16	valMin;		/* 采集到的最小值 */

	float vpp;			/* 采集到的电压差 */
	float current;		/* 有效电流 */
	float power;		/* 总功率，每秒的功率累加 */
	u16	total_energy;	/* 总功耗 */


	u8	current_cnt;			/* */
	float current_sav[CURRENT_SAVE_MAX];		/* 有效电流 */

	
}adc_sample_t;



extern  adc_sample_t adc_sample;





void ADC_init(void);

void adc_turn_once(void);
void calculate_power_1s(void);
void calculate_energy_1min(void);




#endif
