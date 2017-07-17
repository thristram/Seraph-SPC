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
ADC_EXT float rtEG;//实时采集到的功率值，每10s更新一次

ADC_EXT u8 	sample_cnt;//采样次数，半个工频(50Hz)周期10ms采样20次
ADC_EXT u8 	sample_num;//每10s采样3次，再计算平均值
ADC_EXT u16 adc_value[20];
ADC_EXT u16 adc_result[3];//保存3次采样到的幅值
ADC_EXT u16 avr_adc_result;//保存3次采样的幅值平均值
ADC_EXT union  FLAG 						Flag2_;
#define single_sample_finish		Flag2_._flag_bit.bit0



ADC_EXT void ADC_init(void);
ADC_EXT void AcquireEG(void);
ADC_EXT u16 deal_adc_value(void);
ADC_EXT u16 get_adc_value(void);
ADC_EXT float calcEG_60s(u8 voltage,float current);
ADC_EXT u16 avrADCValue(void);
#endif