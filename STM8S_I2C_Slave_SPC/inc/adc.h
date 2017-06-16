#ifndef __ADC_H
#define __ADC_H

#ifndef _ADC_GLOBAL
#define ADC_EXT	extern
#else
#define ADC_EXT
#endif

#define JiZhun_AD 	2.5
ADC_EXT float current[6];
ADC_EXT float avr_current;
ADC_EXT float rtEG;//ʵʱ�ɼ����Ĺ���ֵ��ÿ10s����һ��

ADC_EXT void ADC_init(void);
ADC_EXT void AcquireEG(void);
ADC_EXT float calcEG_60s(u8 voltage,float current);
#endif