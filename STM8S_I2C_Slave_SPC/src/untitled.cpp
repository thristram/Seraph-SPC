#define CH1_ON			GPIO_WriteHigh(GPIOC, (GPIO_Pin_TypeDef)GPIO_PIN_3)
#define CH1_OFF			GPIO_WriteLow(GPIOC, (GPIO_Pin_TypeDef) GPIO_PIN_3)
#define CH2_ON			GPIO_WriteHigh(GPIOC, (GPIO_Pin_TypeDef)GPIO_PIN_4)
#define CH2_OFF			GPIO_WriteLow(GPIOC, (GPIO_Pin_TypeDef)GPIO_PIN_4)
#define CH3_ON			GPIO_WriteHigh(GPIOA, (GPIO_Pin_TypeDef)GPIO_PIN_3)
#define CH3_OFF			GPIO_WriteLow(GPIOA, (GPIO_Pin_TypeDef)GPIO_PIN_3)

GPIO_Init(GPIOC, (GPIO_Pin_TypeDef)GPIO_PIN_1, GPIO_MODE_OUT_PP_LOW_SLOW);
GPIO_Init(GPIOC, (GPIO_Pin_TypeDef)GPIO_PIN_2, GPIO_MODE_OUT_PP_LOW_SLOW);
GPIO_Init(GPIOC, (GPIO_Pin_TypeDef)GPIO_PIN_3, GPIO_MODE_OUT_PP_LOW_SLOW);
GPIO_Init(GPIOC, (GPIO_Pin_TypeDef)GPIO_PIN_4, GPIO_MODE_OUT_PP_LOW_SLOW);
GPIO_Init(GPIOC, (GPIO_Pin_TypeDef)GPIO_PIN_5, GPIO_MODE_OUT_PP_LOW_SLOW);

void UARTOpenTX(u8 address){
	
	resetUARTSelect();
	
	if(address & 0x01){
		GPIO_WriteHigh(GPIOC, (GPIO_Pin_TypeDef)GPIO_PIN_1);
	}
	if(address & 0x02){
		GPIO_WriteHigh(GPIOC, (GPIO_Pin_TypeDef)GPIO_PIN_2);
	}
	if(address & 0x04){
		GPIO_WriteHigh(GPIOC, (GPIO_Pin_TypeDef)GPIO_PIN_3);
	}

	if(address & 0x08){
		GPIO_WriteLow(GPIOC, (GPIO_Pin_TypeDef) GPIO_PIN_5);
	}	else	{
		GPIO_WriteLow(GPIOC, (GPIO_Pin_TypeDef) GPIO_PIN_4);
	}

}

void resetUARTSelect(void){
	GPIO_WriteLow(GPIOC, (GPIO_Pin_TypeDef) GPIO_PIN_1);
	GPIO_WriteLow(GPIOC, (GPIO_Pin_TypeDef) GPIO_PIN_2);
	GPIO_WriteLow(GPIOC, (GPIO_Pin_TypeDef) GPIO_PIN_3);
	GPIO_WriteLow(GPIOC, (GPIO_Pin_TypeDef) GPIO_PIN_4);
	GPIO_WriteLow(GPIOC, (GPIO_Pin_TypeDef) GPIO_PIN_5);

}