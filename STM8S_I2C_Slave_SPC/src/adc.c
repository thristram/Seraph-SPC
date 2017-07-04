#define  _ADC_GLOBAL
#include "stm8s.h"
#include "adc.h"


void ADC_init(void)
{
	ADC1_DeInit();
	//��ʼ�� ADC:����ת��/ͨ�� 4/ʱ�ӷ�Ƶ/�ر��¼�/�����Ҷ���/ʹ��ʩ���ش�����
	ADC1_Init(ADC1_CONVERSIONMODE_CONTINUOUS, ADC1_CHANNEL_4, ADC1_PRESSEL_FCPU_D2,
	ADC1_EXTTRIG_TIM, DISABLE, ADC1_ALIGN_RIGHT, ADC1_SCHMITTTRIG_CHANNEL8,
	ENABLE);
	ADC1_Cmd(ENABLE);//ʹ�� ADC
}

//�ɼ�����������ACS712����ֵ����λA
//ÿ10s�ɼ�1�Σ�1min�������ƽ��ֵ���ٷ��ع���ֵ
void AcquireEG(void)
{

	u8 num = 0;
	u16 adc_value = 0;
	float AD_Data;
	ADC1_StartConversion();//����ת��
	while(num < 6){
		while(ADC1_GetFlagStatus(ADC1_FLAG_EOC)==RESET);//�ȴ�ת������
		u16_adc1_value[num] = ADC1_GetConversionValue();//��ȡ����ֵ
		num++;
	}
	adc_value = avrADCValue();
	AD_Data = (float)(adc_value*3.2258 - 1919.3548);//595*3300/1023
	current[count++] = AD_Data*0.01;	//1mV��Ӧ0.01A 
	if(count >= 6){
		count = 0;
		avr_current = (current[0]+current[1]+current[2]+current[3]+current[4]+current[5])/6;
		rtEG += calcEG_60s(220,avr_current);//��ѹĬ��220V
		//nop();
	}
}
//ƽ��ֵ�˲�,ȥ��1�����ȥ��1�����,���м�4��ֵ��ƽ��
u16 avrADCValue(void)
{
	u8 i,j;//���������������ѭ������i��j
  u16 temp;//�����м䡰�ݴ桱����temp
	u16 result;
  for(i=6;i>=1;i--)//���ѭ��
  {
    for(j=0;j<(i-1);j++)//�ڲ�ѭ��
    {
      if(u16_adc1_value[j]>u16_adc1_value[j+1])//��ֵ�Ƚ�
      {
        temp=u16_adc1_value[j];//��ֵ��λ
        u16_adc1_value[j]=u16_adc1_value[j+1];
        u16_adc1_value[j+1]=temp;
      }
    }
  }
  //for(i=1;i<=4;i++)//ȥ��1�����ȥ��1�����
    //result += u16_adc1_value[i];//���м�4����ֵ�ۼ�
  result=((u16_adc1_value[1]+u16_adc1_value[2]+u16_adc1_value[3]+u16_adc1_value[4])/4);//�ۼӺ���ƽ��ֵ
	return result;
}

//����1min����
float calcEG_60s(u8 voltage,float current)
{
	return (float)(voltage*current/60);
}













