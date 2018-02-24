#ifndef __ADC_H
#define __ADC_H

#ifndef _ADC_GLOBAL
#define ADC_EXT	extern
#else
#define ADC_EXT
#endif










/*----------------------------------------------------------------------------
	Vout��оƬ�˲ɼ��ĵ�ѹ
	Viout�������ɼ�оƬ�����ѹ
	Vd��������ѹ��
	
	Viout2 = Vout2 * (12 / 12.2) + Vd
	Viout1 = Vout1 * (12 / 12.2) + Vd	
	Viout2 - Viout1 = (Vout2 - Vout1) * (12 / 12.2)
	

	
-----------------------------------------------------------------------------*/


/* ADC�����ĵ�ѹ����ʵ�ʵĵ�����֮��Ϊ 6.469 ȡ6.47 */
#define VOLTAGE_AND_CURRENT_RATIO		6.47

/* ADC�������ֵ */
#define ADC_MAX			1023

/* ADC�������ֵ��Ӧ�ĵ�ѹ */
#define VOLTAGE_MAX		3.3


/* ʵ�ʽ�����ѹֵ */
#define AC_ACTUAL_VOLTAGE		234

/* ����ĵ����������ֵ  */
#define CURRENT_SAVE_MAX	10



/* �������ֵ  */
#define CURRENT_VALUE_MAX	30.0


typedef struct
{
	
	u16 	valSmp;		/* �ɼ�����ǰֵ  */
	u16 	valMax;		/* �ɼ��������ֵ */
	u16	valMin;		/* �ɼ�������Сֵ */

	float vpp;			/* �ɼ����ĵ�ѹ�� */
	float current;		/* ��Ч���� */
	float power;		/* �ܹ��ʣ�ÿ��Ĺ����ۼ� */
	u16	total_energy;	/* �ܹ��� */


	u8	current_cnt;			/* */
	float current_sav[CURRENT_SAVE_MAX];		/* ��Ч���� */

	
}adc_sample_t;



extern  adc_sample_t adc_sample;





void ADC_init(void);

void adc_turn_once(void);
void calculate_power_1s(void);
void calculate_energy_1min(void);




#endif
