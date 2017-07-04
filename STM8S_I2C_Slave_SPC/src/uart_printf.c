/*
*********************************************************************************************************
*
*	�ļ����� : uart_printf.c
*	��    �� : V2.0
*	˵    �� : ʵ��printf��scanf�����ض��򵽴���1����֧��printf��Ϣ��UART1
*				ʵ���ض���ֻ��Ҫ���2������:
*				int fputc(int ch, FILE *f);
*				int fgetc(FILE *f);
*
*				�����ҪӦ�ó���֧�� printf ������ֻ�ý� uart_printf.c ����ļ���ӵ����̼��ɡ�
*
*
*********************************************************************************************************
*/
#include "stm8s.h"
#include <stdio.h>

/*
	���ڲ�ͬ�ı����� putcha �� getchar �βκͷ���ֵ���в�ͬ��
	��˴˴����ú궨��ķ�ʽ����

	_RAISONANCE_ �� _COSMIC_ ��2�������ɱ������Զ���ӵ�Ԥ�����
*/
#ifdef _RAISONANCE_
	#define PUTCHAR_PROTOTYPE int putchar (char c)
	#define GETCHAR_PROTOTYPE int getchar (void)
#elif defined (_COSMIC_)
	#define PUTCHAR_PROTOTYPE char putchar (char c)
	#define GETCHAR_PROTOTYPE char getchar (void)
#else /* _IAR_ */
	#define PUTCHAR_PROTOTYPE int putchar (int c)
	#define GETCHAR_PROTOTYPE int getchar (void)
#endif /* _RAISONANCE_ */

/*
*********************************************************************************************************
*	�� �� ��: putchar
*	����˵��: �ض��� putchar ������ ��������ʹ��printf�����Ӵ���1��ӡ���
*	��    ��: �ȴ����͵��ַ�
*	�� �� ֵ: �����ѷ��͵��ַ�
*********************************************************************************************************
*/
PUTCHAR_PROTOTYPE
{
	/* ����һ���ַ� c ��UART1 */
	UART1_SendData8(c);

	/* �ȴ�������� */
	while (UART1_GetFlagStatus(UART1_FLAG_TXE) == RESET);

	return (c);
}

/*
*********************************************************************************************************
*	�� �� ��: getchar
*	����˵��: �ض���C���е� getchar ����,��������ʹ��scanff�����Ӵ���1��������
*	��    ��: ��
*	�� �� ֵ: �����Ѷ������ַ�
*********************************************************************************************************
*/
GETCHAR_PROTOTYPE
{
	#ifdef _COSMIC_
		char c = 0;
	#else
		int c = 0;
	#endif

	/* �ȴ������ݵ���  */
	while (UART1_GetFlagStatus(UART1_FLAG_RXNE) == RESET);

	/* ��ȡ���ݼĴ��� */
	c = UART1_ReceiveData8();

	return (c);
}

/*
*********************************************************************************************************
*	�� �� ��: bsp_InitUart
*	����˵��: ��ʼ��CPU��USART1����Ӳ���豸��δ�����жϡ�
*	��    �Σ����ڲ�����
*	�� �� ֵ: ��
*********************************************************************************************************
*/
void UART_Init(uint32_t BaudRate)
{
	UART1_DeInit();

	/* ���� UART1
	    - BaudRate = 115200 baud
	    - Word Length = 8 Bits
	    - One Stop Bit
	    - No parity
	    - Receive and transmit enabled
	    - UART1 Clock disabled
	*/
	UART1_Init((uint32_t)BaudRate, UART1_WORDLENGTH_8D, UART1_STOPBITS_1, UART1_PARITY_NO,
	          UART1_SYNCMODE_CLOCK_DISABLE, UART1_MODE_TXRX_ENABLE);
}


/********************************************* (END OF FILE) ********************************************/