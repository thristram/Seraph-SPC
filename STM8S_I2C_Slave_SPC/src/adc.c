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
/*
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
*/

//采集电流传感器ACS712电流值，单位A
//每10s采集1次，共采集6次，1min计算电流平均值，再返回功率值
void AcquireEG(void)
{
	u8 i,j=0;
	u16 adc_value = 0;
	float AD_Data;
	AD_Data = (float)((get_adc_value()-588)*3.2258);//get_adc_value()*3300/1023 单位为mV
	current[count++] = AD_Data*0.0122;	//1mV对应0.01A，因采样到的电压是已经分压的了，要乘以12.2/10，单位为A
	if(count >= 6){
		count = 0;
		for(i = 0; i < 6; i++){
			if((current[i] > 0.1)&&(current[i] < 20)) {//做保护,当电流超过0.1A且小于量程20A才认为有负载
				avr_current += current[i];
				j++;
			}
		}
		if(j == 0)
			avr_current = 0;
		else
			avr_current = avr_current / j;
		rtEG += calcEG_60s(220,avr_current);//电压默认220V
		//nop();
	}
}



/***********************************************
每10s连续采样3次，1次采样分以下步骤
1.开启采样，等待波形过零点
2.波形过零点，启动定时器，每500us采样一次值并保存在adc_value[20]
3.sample_cnt到达20次后采样结束，排序找到最大值。
***********************************************/
u16 get_adc_value(void)
{
	u16 adc_value = 0;
	while(sample_num < 3){
		//等待波形过零点
		while(1)
		{
			ADC1_StartConversion();//启动转换
			while(ADC1_GetFlagStatus(ADC1_FLAG_EOC)==RESET);//等待转换结束
			adc_value = ADC1_GetConversionValue();//获取采样值
			if((adc_value >= 550)&&(adc_value <= 600))	//说明采样到的值在零点582附近，认为刚过零点
				break;
		}
		TIM2_Cmd(ENABLE);//开启TIM2定时器，每500us进入一次中断
		adc_result[sample_num] = deal_adc_value();
		sample_num++;
	}
	sample_num = 0;
	return ((adc_result[0] + adc_result[1] + adc_result[2]) / 3);
}
/***********************************************
1.adc_value[20]冒泡排序，找到叠加交流的幅值
************************************************/
u16 deal_adc_value(void)
{
	u8 i,j;//定义排序用内外层循环变量i和j
  u16 temp;//定义中间“暂存”变量temp
	while(!single_sample_finish);//等待采样结束
	single_sample_finish = 0;
	for(i=20;i>=1;i--)//外层循环
	{
		for(j=0;j<(i-1);j++)//内层循环
		{
			if(adc_value[j]>adc_value[j+1])//数值比较
			{
				temp=adc_value[j];//数值换位
				adc_value[j]=adc_value[j+1];
				adc_value[j+1]=temp;
			}
		}
	}//adc_value[19]保存最大值，adc_value[0]保存最小值
	return((adc_value[19]+adc_value[0])/2);//返回幅值
}

//计算1min功耗
float calcEG_60s(u8 voltage,float current)
{
	return (float)(voltage*current/60);
}













