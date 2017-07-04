#define  _ADC_GLOBAL
#include "stm8s.h"
#include "adc.h"


void ADC_init(void)
{
	ADC1_DeInit();
	//初始化 ADC:单次转换/通道 4/时钟分频/关闭事件/数据右对齐/使能施密特触发器
	ADC1_Init(ADC1_CONVERSIONMODE_CONTINUOUS, ADC1_CHANNEL_4, ADC1_PRESSEL_FCPU_D2,
	ADC1_EXTTRIG_TIM, DISABLE, ADC1_ALIGN_RIGHT, ADC1_SCHMITTTRIG_CHANNEL8,
	ENABLE);
	ADC1_Cmd(ENABLE);//使能 ADC
}

//采集电流传感器ACS712电流值，单位A
//每10s采集1次，1min计算电流平均值，再返回功率值
void AcquireEG(void)
{

	u8 num = 0;
	u16 adc_value = 0;
	float AD_Data;
	ADC1_StartConversion();//启动转换
	while(num < 6){
		while(ADC1_GetFlagStatus(ADC1_FLAG_EOC)==RESET);//等待转换结束
		u16_adc1_value[num] = ADC1_GetConversionValue();//获取采样值
		num++;
	}
	adc_value = avrADCValue();
	AD_Data = (float)(adc_value*3.2258 - 1919.3548);//595*3300/1023
	current[count++] = AD_Data*0.01;	//1mV对应0.01A 
	if(count >= 6){
		count = 0;
		avr_current = (current[0]+current[1]+current[2]+current[3]+current[4]+current[5])/6;
		rtEG += calcEG_60s(220,avr_current);//电压默认220V
		//nop();
	}
}
//平均值滤波,去掉1个最低去掉1个最高,将中间4个值求平均
u16 avrADCValue(void)
{
	u8 i,j;//定义排序用内外层循环变量i和j
  u16 temp;//定义中间“暂存”变量temp
	u16 result;
  for(i=6;i>=1;i--)//外层循环
  {
    for(j=0;j<(i-1);j++)//内层循环
    {
      if(u16_adc1_value[j]>u16_adc1_value[j+1])//数值比较
      {
        temp=u16_adc1_value[j];//数值换位
        u16_adc1_value[j]=u16_adc1_value[j+1];
        u16_adc1_value[j+1]=temp;
      }
    }
  }
  //for(i=1;i<=4;i++)//去掉1个最低去掉1个最高
    //result += u16_adc1_value[i];//将中间4个数值累加
  result=((u16_adc1_value[1]+u16_adc1_value[2]+u16_adc1_value[3]+u16_adc1_value[4])/4);//累加和求平均值
	return result;
}

//计算1min功耗
float calcEG_60s(u8 voltage,float current)
{
	return (float)(voltage*current/60);
}













