/*
*********************************************************************************************************
*
*	文件名称 : uart_printf.c
*	版    本 : V2.0
*	说    明 : 实现printf和scanf函数重定向到串口1，即支持printf信息到UART1
*				实现重定向，只需要添加2个函数:
*				int fputc(int ch, FILE *f);
*				int fgetc(FILE *f);
*
*				如果需要应用程序支持 printf 函数，只用将 uart_printf.c 这个文件添加到工程即可。
*
*
*********************************************************************************************************
*/
#include "stm8s.h"
#include <stdio.h>

/*
	由于不同的编译器 putcha 和 getchar 形参和返回值略有不同。
	因此此处采用宏定义的方式区别。

	_RAISONANCE_ 和 _COSMIC_ 这2个宏是由编译器自动添加的预编译宏
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
*	函 数 名: putchar
*	功能说明: 重定义 putchar 函数， 这样可以使用printf函数从串口1打印输出
*	形    参: 等待发送的字符
*	返 回 值: 返回已发送的字符
*********************************************************************************************************
*/
PUTCHAR_PROTOTYPE
{
	/* 发送一个字符 c 到UART1 */
	UART1_SendData8(c);

	/* 等待发送完毕 */
	while (UART1_GetFlagStatus(UART1_FLAG_TXE) == RESET);

	return (c);
}

/*
*********************************************************************************************************
*	函 数 名: getchar
*	功能说明: 重定义C库中的 getchar 函数,这样可以使用scanff函数从串口1输入数据
*	形    参: 无
*	返 回 值: 返回已读到的字符
*********************************************************************************************************
*/
GETCHAR_PROTOTYPE
{
	#ifdef _COSMIC_
		char c = 0;
	#else
		int c = 0;
	#endif

	/* 等待新数据到达  */
	while (UART1_GetFlagStatus(UART1_FLAG_RXNE) == RESET);

	/* 读取数据寄存器 */
	c = UART1_ReceiveData8();

	return (c);
}

/*
*********************************************************************************************************
*	函 数 名: bsp_InitUart
*	功能说明: 初始化CPU的USART1串口硬件设备。未启用中断。
*	形    参：串口波特率
*	返 回 值: 无
*********************************************************************************************************
*/
void UART_Init(uint32_t BaudRate)
{
	UART1_DeInit();

	/* 配置 UART1
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