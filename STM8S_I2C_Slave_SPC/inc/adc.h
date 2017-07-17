#ifndef __ADC_H
#define __ADC_H

#ifndef _ADC_GLOBAL
#define ADC_EXT	extern
#else
#define ADC_EXT
#endif

#define JiZhun_AD 	2.5
ADC_EXT u8 count;
ADC_EXT u16 u16_adc1_value[6];
ADC_EXT float current[6];
ADC_EXT float avr_current;
ADC_EXT float rtEG;//ʵʱ�ɼ����Ĺ���ֵ��ÿ10s����һ��

ADC_EXT u8 	sample_cnt;//���������������Ƶ(50Hz)����10ms����20��
ADC_EXT u8 	sample_num;//ÿ10s����3�Σ��ټ���ƽ��ֵ
ADC_EXT u16 adc_value[20];
ADC_EXT u16 adc_result[3];//����3�β������ķ�ֵ
ADC_EXT u16 avr_adc_result;//����3�β����ķ�ֵƽ��ֵ
ADC_EXT union  FLAG 						Flag2_;
#define single_sample_finish		Flag2_._flag_bit.bit0



ADC_EXT void ADC_init(void);
ADC_EXT void AcquireEG(void);
ADC_EXT u16 deal_adc_value(void);
ADC_EXT u16 get_adc_value(void);
ADC_EXT float calcEG_60s(u8 voltage,float current);
ADC_EXT u16 avrADCValue(void);
#endif