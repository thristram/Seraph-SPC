#define  _ADC_GLOBAL
#include "stm8s.h"
#include "adc.h"


void ADC_init(void)
{
	ADC1_DeInit();
	//初始化 ADC:单次转换/通道 4/时钟分频/关闭事件/数据右对齐/使能施密特触发器
	ADC1_Init(ADC1_CONVERSIONMODE_SINGLE, ADC1_CHANNEL_4, ADC1_PRESSEL_FCPU_D2,
	ADC1_EXTTRIG_TIM, DISABLE, ADC1_ALIGN_RIGHT, ADC1_SCHMITTTRIG_CHANNEL8,
	ENABLE);
	ADC1_Cmd(ENABLE);//使能 ADC
}

//采集电流传感器ACS712电流值，单位A
//每10s采集1次，1min计算电流平均值，再返回功率值
void AcquireEG(void)
{
	static u8 count = 0;
	u16 u16_adc1_value = 0;
	float AD_Data;
	ADC1_StartConversion();//启动转换
	while(ADC1_GetFlagStatus(ADC1_FLAG_EOC)==RESET);//等待转换结束
	u16_adc1_value = ADC1_GetConversionValue();//获取采样值
	AD_Data = ((float)u16_adc1_value)*JiZhun_AD*2/1024+0.15005;	//经过实测需要加0.15以减少误差
	current[count++] =((AD_Data-2.68)/0.185)*1000;
	if(count >= 6){
		count = 0;
		avr_current = (current[0]+current[1]+current[2]+current[3]+current[4]+current[5])/6;
		rtEG += calcEG_60s(220,avr_current);//电压默认220V
	}
}

//计算1min功耗
float calcEG_60s(u8 voltage,float current)
{
	return (float)(voltage*current/60);
}













