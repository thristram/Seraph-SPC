#define  _ADC_GLOBAL
#include "stm8s.h"
#include "adc.h"
#include "uart.h"
#include "main.h"


adc_sample_t adc_sample = {0};



/*----------------------------------------------------------------------------
	初始化 
-----------------------------------------------------------------------------*/
void ADC_init(void)
{
	ADC1_DeInit();
	//初始化 ADC:单次转换/通道 4/时钟分频/关闭事件/数据右对齐/使能施密特触发器
	ADC1_Init(ADC1_CONVERSIONMODE_CONTINUOUS, ADC1_CHANNEL_4, ADC1_PRESSEL_FCPU_D2,
			ADC1_EXTTRIG_TIM, DISABLE, ADC1_ALIGN_RIGHT, ADC1_SCHMITTTRIG_CHANNEL8, ENABLE);
	
	ADC1_Cmd(ENABLE);//使能 ADC

	/* 初始化变量 */
	adc_sample.current = 0;
	adc_sample.valMax = 0;
	adc_sample.valMin = 1023;
	adc_sample.current_cnt = 0;
	adc_sample.total_energy = 0;
	adc_sample.power = 0;
	
}



/*----------------------------------------------------------------------------
	每30ms转化一次 保证收集到一个完整周期20ms内的最大值和最小值 
-----------------------------------------------------------------------------*/
void adc_turn_once(void)
{

	adc_sample.vpp = ((float)(adc_sample.valMax - adc_sample.valMin) / ADC_MAX) * VOLTAGE_MAX;
	adc_sample.current = adc_sample.vpp * VOLTAGE_AND_CURRENT_RATIO;

	/* 恢复默认，准备下次转化 */
	adc_sample.valMax = 0;
	adc_sample.valMin = 1023;

}


/*----------------------------------------------------------------------------
	每100ms保存一个电流值，每1s计算一次功耗，电流使用10个电流的平均值
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
		
		/* 取平均值 */
		if(j > 0){
			current = current / j;
			adc_sample.power += current * AC_ACTUAL_VOLTAGE;
//			adc_sample.power += current * AC_ACTUAL_VOLTAGE;		
//			adc_sample.energy += current * AC_ACTUAL_VOLTAGE;			
		}

				
	}

}


/*----------------------------------------------------------------------------
	每1min计算一次电量，每秒钟执行一次
-----------------------------------------------------------------------------*/
void calculate_energy_1min(void)
{
	static u8 i = 0;

	u16 	temp = 0;
	
	u32	power = (u32)adc_sample.power;

	i++;
	if(i >= 60){		/* 1min */
		i = 0;

		temp = power / 3600;			// 功率为每秒钟的值累加起来的

//		temp = (u16)(adc_sample.power / 3600.0);	// 功率为每秒钟的值累加起来的
		
		adc_sample.power = (float)(power % 3600);	

//		adc_sample.power = (u16)adc_sample.power - (temp * 3600);		
//		adc_sample.power = 0;

		adc_sample.total_energy += temp;


		
	} 


	
}






