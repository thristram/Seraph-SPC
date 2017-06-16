   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
  45                     ; 44 PUTCHAR_PROTOTYPE
  45                     ; 45 {
  47                     .text:	section	.text,new
  48  0000               _putchar:
  50  0000 88            	push	a
  51       00000000      OFST:	set	0
  54                     ; 47 	UART1_SendData8(c);
  56  0001 cd0000        	call	_UART1_SendData8
  59  0004               L13:
  60                     ; 50 	while (UART1_GetFlagStatus(UART1_FLAG_TXE) == RESET);
  62  0004 ae0080        	ldw	x,#128
  63  0007 cd0000        	call	_UART1_GetFlagStatus
  65  000a 4d            	tnz	a
  66  000b 27f7          	jreq	L13
  67                     ; 52 	return (c);
  69  000d 7b01          	ld	a,(OFST+1,sp)
  72  000f 5b01          	addw	sp,#1
  73  0011 81            	ret
 109                     ; 63 GETCHAR_PROTOTYPE
 109                     ; 64 {
 110                     .text:	section	.text,new
 111  0000               _getchar:
 113  0000 88            	push	a
 114       00000001      OFST:	set	1
 117                     ; 66 		char c = 0;
 119  0001 0f01          	clr	(OFST+0,sp)
 121  0003               L75:
 122                     ; 72 	while (UART1_GetFlagStatus(UART1_FLAG_RXNE) == RESET);
 124  0003 ae0020        	ldw	x,#32
 125  0006 cd0000        	call	_UART1_GetFlagStatus
 127  0009 4d            	tnz	a
 128  000a 27f7          	jreq	L75
 129                     ; 75 	c = UART1_ReceiveData8();
 131  000c cd0000        	call	_UART1_ReceiveData8
 133  000f 6b01          	ld	(OFST+0,sp),a
 134                     ; 77 	return (c);
 136  0011 7b01          	ld	a,(OFST+0,sp)
 139  0013 5b01          	addw	sp,#1
 140  0015 81            	ret
 176                     ; 88 void UART_Init(uint32_t BaudRate)
 176                     ; 89 {
 177                     .text:	section	.text,new
 178  0000               _UART_Init:
 180       00000000      OFST:	set	0
 183                     ; 90 	UART1_DeInit();
 185  0000 cd0000        	call	_UART1_DeInit
 187                     ; 100 	UART1_Init((uint32_t)BaudRate, UART1_WORDLENGTH_8D, UART1_STOPBITS_1, UART1_PARITY_NO,
 187                     ; 101 	          UART1_SYNCMODE_CLOCK_DISABLE, UART1_MODE_TXRX_ENABLE);
 189  0003 4b0c          	push	#12
 190  0005 4b80          	push	#128
 191  0007 4b00          	push	#0
 192  0009 4b00          	push	#0
 193  000b 4b00          	push	#0
 194  000d 1e0a          	ldw	x,(OFST+10,sp)
 195  000f 89            	pushw	x
 196  0010 1e0a          	ldw	x,(OFST+10,sp)
 197  0012 89            	pushw	x
 198  0013 cd0000        	call	_UART1_Init
 200  0016 5b09          	addw	sp,#9
 201                     ; 102 }
 204  0018 81            	ret
 217                     	xdef	_UART_Init
 218                     	xdef	_putchar
 219                     	xdef	_getchar
 220                     	xref	_UART1_GetFlagStatus
 221                     	xref	_UART1_SendData8
 222                     	xref	_UART1_ReceiveData8
 223                     	xref	_UART1_Init
 224                     	xref	_UART1_DeInit
 243                     	end
