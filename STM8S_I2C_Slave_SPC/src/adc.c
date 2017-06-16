#define  _ADC_GLOBAL
#include "stm8s.h"
#include "adc.h"


void ADC_init(void)
{
	ADC1_DeInit();
	//��ʼ�� ADC:����ת��/ͨ�� 4/ʱ�ӷ�Ƶ/�ر��¼�/�����Ҷ���/ʹ��ʩ���ش�����
	ADC1_Init(ADC1_CONVERSIONMODE_SINGLE, ADC1_CHANNEL_4, ADC1_PRESSEL_FCPU_D2,
	ADC1_EXTTRIG_TIM, DISABLE, ADC1_ALIGN_RIGHT, ADC1_SCHMITTTRIG_CHANNEL8,
	ENABLE);
	ADC1_Cmd(ENABLE);//ʹ�� ADC
}

//�ɼ�����������ACS712����ֵ����λA
//ÿ10s�ɼ�1�Σ�1min�������ƽ��ֵ���ٷ��ع���ֵ
void AcquireEG(void)
{
	static u8 count = 0;
	u16 u16_adc1_value = 0;
	float AD_Data;
	ADC1_StartConversion();//����ת��
	while(ADC1_GetFlagStatus(ADC1_FLAG_EOC)==RESET);//�ȴ�ת������
	u16_adc1_value = ADC1_GetConversionValue();//��ȡ����ֵ
	AD_Data = ((float)u16_adc1_value)*JiZhun_AD*2/1024+0.15005;	//����ʵ����Ҫ��0.15�Լ������
	current[count++] =((AD_Data-2.68)/0.185)*1000;
	if(count >= 6){
		count = 0;
		avr_current = (current[0]+current[1]+current[2]+current[3]+current[4]+current[5])/6;
		rtEG += calcEG_60s(220,avr_current);//��ѹĬ��220V
	}
}

//����1min����
float calcEG_60s(u8 voltage,float current)
{
	return (float)(voltage*current/60);
}













