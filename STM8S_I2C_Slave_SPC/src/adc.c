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
/*
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
*/

//�ɼ�����������ACS712����ֵ����λA
//ÿ10s�ɼ�1�Σ����ɼ�6�Σ�1min�������ƽ��ֵ���ٷ��ع���ֵ
void AcquireEG(void)
{
	u8 i,j=0;
	u16 adc_value = 0;
	float AD_Data;
	AD_Data = (float)((get_adc_value()-588)*3.2258);//get_adc_value()*3300/1023 ��λΪmV
	current[count++] = AD_Data*0.0122;	//1mV��Ӧ0.01A����������ĵ�ѹ���Ѿ���ѹ���ˣ�Ҫ����12.2/10����λΪA
	if(count >= 6){
		count = 0;
		for(i = 0; i < 6; i++){
			if((current[i] > 0.1)&&(current[i] < 20)) {//������,����������0.1A��С������20A����Ϊ�и���
				avr_current += current[i];
				j++;
			}
		}
		if(j == 0)
			avr_current = 0;
		else
			avr_current = avr_current / j;
		rtEG += calcEG_60s(220,avr_current);//��ѹĬ��220V
		//nop();
	}
}



/***********************************************
ÿ10s��������3�Σ�1�β��������²���
1.�����������ȴ����ι����
2.���ι���㣬������ʱ����ÿ500us����һ��ֵ��������adc_value[20]
3.sample_cnt����20�κ���������������ҵ����ֵ��
***********************************************/
u16 get_adc_value(void)
{
	u16 adc_value = 0;
	while(sample_num < 3){
		//�ȴ����ι����
		while(1)
		{
			ADC1_StartConversion();//����ת��
			while(ADC1_GetFlagStatus(ADC1_FLAG_EOC)==RESET);//�ȴ�ת������
			adc_value = ADC1_GetConversionValue();//��ȡ����ֵ
			if((adc_value >= 550)&&(adc_value <= 600))	//˵����������ֵ�����582��������Ϊ�չ����
				break;
		}
		TIM2_Cmd(ENABLE);//����TIM2��ʱ����ÿ500us����һ���ж�
		adc_result[sample_num] = deal_adc_value();
		sample_num++;
	}
	sample_num = 0;
	return ((adc_result[0] + adc_result[1] + adc_result[2]) / 3);
}
/***********************************************
1.adc_value[20]ð�������ҵ����ӽ����ķ�ֵ
************************************************/
u16 deal_adc_value(void)
{
	u8 i,j;//���������������ѭ������i��j
  u16 temp;//�����м䡰�ݴ桱����temp
	while(!single_sample_finish);//�ȴ���������
	single_sample_finish = 0;
	for(i=20;i>=1;i--)//���ѭ��
	{
		for(j=0;j<(i-1);j++)//�ڲ�ѭ��
		{
			if(adc_value[j]>adc_value[j+1])//��ֵ�Ƚ�
			{
				temp=adc_value[j];//��ֵ��λ
				adc_value[j]=adc_value[j+1];
				adc_value[j+1]=temp;
			}
		}
	}//adc_value[19]�������ֵ��adc_value[0]������Сֵ
	return((adc_value[19]+adc_value[0])/2);//���ط�ֵ
}

//����1min����
float calcEG_60s(u8 voltage,float current)
{
	return (float)(voltage*current/60);
}













