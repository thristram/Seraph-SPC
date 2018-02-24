#define  _ADC_GLOBAL
#include "stm8s.h"
#include "adc.h"
#include "uart.h"
#include "main.h"


adc_sample_t adc_sample = {0};



/*----------------------------------------------------------------------------
	��ʼ�� 
-----------------------------------------------------------------------------*/
void ADC_init(void)
{
	ADC1_DeInit();
	//��ʼ�� ADC:����ת��/ͨ�� 4/ʱ�ӷ�Ƶ/�ر��¼�/�����Ҷ���/ʹ��ʩ���ش�����
	ADC1_Init(ADC1_CONVERSIONMODE_CONTINUOUS, ADC1_CHANNEL_4, ADC1_PRESSEL_FCPU_D2,
			ADC1_EXTTRIG_TIM, DISABLE, ADC1_ALIGN_RIGHT, ADC1_SCHMITTTRIG_CHANNEL8, ENABLE);
	
	ADC1_Cmd(ENABLE);//ʹ�� ADC

	/* ��ʼ������ */
	adc_sample.current = 0;
	adc_sample.valMax = 0;
	adc_sample.valMin = 1023;
	adc_sample.current_cnt = 0;
	adc_sample.total_energy = 0;
	adc_sample.power = 0;
	
}



/*----------------------------------------------------------------------------
	ÿ30msת��һ�� ��֤�ռ���һ����������20ms�ڵ����ֵ����Сֵ 
-----------------------------------------------------------------------------*/
void adc_turn_once(void)
{

	adc_sample.vpp = ((float)(adc_sample.valMax - adc_sample.valMin) / ADC_MAX) * VOLTAGE_MAX;
	adc_sample.current = adc_sample.vpp * VOLTAGE_AND_CURRENT_RATIO;

	/* �ָ�Ĭ�ϣ�׼���´�ת�� */
	adc_sample.valMax = 0;
	adc_sample.valMin = 1023;

}


/*----------------------------------------------------------------------------
	ÿ100ms����һ������ֵ��ÿ1s����һ�ι��ģ�����ʹ��10��������ƽ��ֵ
-----------------------------------------------------------------------------*/
void calculate_power_1s(void)
{
	u8 i, j = 0;
	float current = 0.0;
	
	adc_sample.current_sav[adc_sample.current_cnt] = adc_sample.current;
	adc_sample.current_cnt++;

	if(adc_sample.current_cnt >= CURRENT_SAVE_MAX){
		adc_sample.current_cnt = 0;	
		
		current = 0.0;
		j = 0;
		for(i=0; i<CURRENT_SAVE_MAX; i++ ){
			if((0.1 <= adc_sample.current_sav[i]) && (adc_sample.current_sav[i] < CURRENT_VALUE_MAX)){
				j++;
				current += adc_sample.current_sav[i];
			}	
//			current += adc_sample.current_sav[i];
		}
		
		/* ȡƽ��ֵ */
		if(j > 0){
			current = current / j;
			adc_sample.power += current * AC_ACTUAL_VOLTAGE;
//			adc_sample.power += current * AC_ACTUAL_VOLTAGE;		
//			adc_sample.energy += current * AC_ACTUAL_VOLTAGE;			
		}

				
	}

}


/*----------------------------------------------------------------------------
	ÿ1min����һ�ε�����ÿ����ִ��һ��
-----------------------------------------------------------------------------*/
void calculate_energy_1min(void)
{
	static u8 i = 0;

	u16 	temp = 0;
	
	u32	power = (u32)adc_sample.power;

	i++;
	if(i >= 60){		/* 1min */
		i = 0;

		temp = power / 3600;			// ����Ϊÿ���ӵ�ֵ�ۼ�������

//		temp = (u16)(adc_sample.power / 3600.0);	// ����Ϊÿ���ӵ�ֵ�ۼ�������
		
		adc_sample.power = (float)(power % 3600);	

//		adc_sample.power = (u16)adc_sample.power - (temp * 3600);		
//		adc_sample.power = 0;

		adc_sample.total_energy += temp;


		
	} 


	
}






