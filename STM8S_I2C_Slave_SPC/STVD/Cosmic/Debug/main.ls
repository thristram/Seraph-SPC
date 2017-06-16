   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
  61                     ; 51 void delay(u16 Count)
  61                     ; 52 {
  63                     .text:	section	.text,new
  64  0000               _delay:
  66  0000 89            	pushw	x
  67  0001 89            	pushw	x
  68       00000002      OFST:	set	2
  71  0002 2014          	jra	L14
  72  0004               L73:
  73                     ; 56     for(i=0;i<100;i++)
  75  0004 0f01          	clr	(OFST-1,sp)
  76  0006               L54:
  77                     ; 57     for(j=0;j<50;j++);
  79  0006 0f02          	clr	(OFST+0,sp)
  80  0008               L35:
  84  0008 0c02          	inc	(OFST+0,sp)
  87  000a 7b02          	ld	a,(OFST+0,sp)
  88  000c a132          	cp	a,#50
  89  000e 25f8          	jrult	L35
  90                     ; 56     for(i=0;i<100;i++)
  92  0010 0c01          	inc	(OFST-1,sp)
  95  0012 7b01          	ld	a,(OFST-1,sp)
  96  0014 a164          	cp	a,#100
  97  0016 25ee          	jrult	L54
  98  0018               L14:
  99                     ; 54   while (Count--)//Count形参控制延时次数
 101  0018 1e03          	ldw	x,(OFST+1,sp)
 102  001a 1d0001        	subw	x,#1
 103  001d 1f03          	ldw	(OFST+1,sp),x
 104  001f 1c0001        	addw	x,#1
 105  0022 a30000        	cpw	x,#0
 106  0025 26dd          	jrne	L73
 107                     ; 59 }
 110  0027 5b04          	addw	sp,#4
 111  0029 81            	ret
 161                     ; 67 void main(void)
 161                     ; 68 {
 162                     .text:	section	.text,new
 163  0000               _main:
 165  0000 88            	push	a
 166       00000001      OFST:	set	1
 169                     ; 72 	CLK->SWCR |= 0x02; //开启切换
 171  0001 721250c5      	bset	20677,#1
 172                     ; 73   CLK->SWR   = 0xb4;       //选择时钟为外部8M
 174  0005 35b450c4      	mov	20676,#180
 176  0009               L301:
 177                     ; 74   while((CLK->SWCR & 0x01)==0x01);
 179  0009 c650c5        	ld	a,20677
 180  000c a401          	and	a,#1
 181  000e a101          	cp	a,#1
 182  0010 27f7          	jreq	L301
 183                     ; 75   CLK->CKDIVR = 0x80;    //不分频
 185  0012 358050c6      	mov	20678,#128
 186                     ; 76   CLK->SWCR  &= ~0x02; //关闭切换
 188  0016 721350c5      	bres	20677,#1
 189                     ; 82 	GPIO_Init(GPIOD, (GPIO_Pin_TypeDef)GPIO_PIN_2, GPIO_MODE_IN_PU_NO_IT);
 191  001a 4b40          	push	#64
 192  001c 4b04          	push	#4
 193  001e ae500f        	ldw	x,#20495
 194  0021 cd0000        	call	_GPIO_Init
 196  0024 85            	popw	x
 197                     ; 83 	GPIO_Init(GPIOC, (GPIO_Pin_TypeDef)GPIO_PIN_5, GPIO_MODE_IN_PU_NO_IT);
 199  0025 4b40          	push	#64
 200  0027 4b20          	push	#32
 201  0029 ae500a        	ldw	x,#20490
 202  002c cd0000        	call	_GPIO_Init
 204  002f 85            	popw	x
 205                     ; 84 	GPIO_Init(GPIOC, (GPIO_Pin_TypeDef)GPIO_PIN_6, GPIO_MODE_IN_PU_NO_IT);
 207  0030 4b40          	push	#64
 208  0032 4b40          	push	#64
 209  0034 ae500a        	ldw	x,#20490
 210  0037 cd0000        	call	_GPIO_Init
 212  003a 85            	popw	x
 213                     ; 85 	GPIO_Init(GPIOC, (GPIO_Pin_TypeDef)GPIO_PIN_7, GPIO_MODE_IN_PU_NO_IT);
 215  003b 4b40          	push	#64
 216  003d 4b80          	push	#128
 217  003f ae500a        	ldw	x,#20490
 218  0042 cd0000        	call	_GPIO_Init
 220  0045 85            	popw	x
 221                     ; 87 	GPIO_Init(GPIOC, (GPIO_Pin_TypeDef)GPIO_PIN_3, GPIO_MODE_OUT_PP_LOW_SLOW);
 223  0046 4bc0          	push	#192
 224  0048 4b08          	push	#8
 225  004a ae500a        	ldw	x,#20490
 226  004d cd0000        	call	_GPIO_Init
 228  0050 85            	popw	x
 229                     ; 88 	GPIO_Init(GPIOC, (GPIO_Pin_TypeDef)GPIO_PIN_4, GPIO_MODE_OUT_PP_LOW_SLOW);
 231  0051 4bc0          	push	#192
 232  0053 4b10          	push	#16
 233  0055 ae500a        	ldw	x,#20490
 234  0058 cd0000        	call	_GPIO_Init
 236  005b 85            	popw	x
 237                     ; 89 	GPIO_Init(GPIOA, (GPIO_Pin_TypeDef)GPIO_PIN_3, GPIO_MODE_OUT_PP_LOW_SLOW);
 239  005c 4bc0          	push	#192
 240  005e 4b08          	push	#8
 241  0060 ae5000        	ldw	x,#20480
 242  0063 cd0000        	call	_GPIO_Init
 244  0066 85            	popw	x
 245                     ; 90 	delay(100);
 247  0067 ae0064        	ldw	x,#100
 248  006a cd0000        	call	_delay
 250                     ; 91 	if(GPIO_ReadInputData(GPIOD) & 0x04)	slave_address |= 0x08;
 252  006d ae500f        	ldw	x,#20495
 253  0070 cd0000        	call	_GPIO_ReadInputData
 255  0073 a504          	bcp	a,#4
 256  0075 2704          	jreq	L701
 259  0077 72160000      	bset	_slave_address,#3
 260  007b               L701:
 261                     ; 92 	if(GPIO_ReadInputData(GPIOC) & 0x20)	slave_address |= 0x04;
 263  007b ae500a        	ldw	x,#20490
 264  007e cd0000        	call	_GPIO_ReadInputData
 266  0081 a520          	bcp	a,#32
 267  0083 2704          	jreq	L111
 270  0085 72140000      	bset	_slave_address,#2
 271  0089               L111:
 272                     ; 93 	if(GPIO_ReadInputData(GPIOC) & 0x40)	slave_address |= 0x02;
 274  0089 ae500a        	ldw	x,#20490
 275  008c cd0000        	call	_GPIO_ReadInputData
 277  008f a540          	bcp	a,#64
 278  0091 2704          	jreq	L311
 281  0093 72120000      	bset	_slave_address,#1
 282  0097               L311:
 283                     ; 94 	if(GPIO_ReadInputData(GPIOC) & 0x80)	slave_address |= 0x01;
 285  0097 ae500a        	ldw	x,#20490
 286  009a cd0000        	call	_GPIO_ReadInputData
 288  009d a580          	bcp	a,#128
 289  009f 2704          	jreq	L511
 292  00a1 72100000      	bset	_slave_address,#0
 293  00a5               L511:
 294                     ; 95 	spc.MDID = slave_address;
 296  00a5 b600          	ld	a,_slave_address
 297  00a7 5f            	clrw	x
 298  00a8 97            	ld	xl,a
 299  00a9 bf13          	ldw	_spc+19,x
 300                     ; 96 	ADC_init();
 302  00ab cd0000        	call	_ADC_init
 304                     ; 98 	UART_Init(115200);
 306  00ae aec200        	ldw	x,#49664
 307  00b1 89            	pushw	x
 308  00b2 ae0001        	ldw	x,#1
 309  00b5 89            	pushw	x
 310  00b6 cd0000        	call	_UART_Init
 312  00b9 5b04          	addw	sp,#4
 313                     ; 100 	printf("Hello World!\n");
 315  00bb ae0008        	ldw	x,#L711
 316  00be cd0000        	call	_printf
 318                     ; 102 	IIC_SlaveConfig();
 320  00c1 cd0000        	call	_IIC_SlaveConfig
 322                     ; 105 	enableInterrupts();
 325  00c4 9a            rim
 327  00c5               L121:
 328                     ; 111 		if(ReceiveState == IIC_STATE_END)
 330  00c5 b600          	ld	a,_ReceiveState
 331  00c7 a103          	cp	a,#3
 332  00c9 2626          	jrne	L521
 333                     ; 113 			for(i=0;i<GetDataIndex;i++){
 335  00cb 0f01          	clr	(OFST+0,sp)
 337  00cd 2012          	jra	L331
 338  00cf               L721:
 339                     ; 114 				printf("%02X ",IIC_RxBuffer[i]&0xFF);
 341  00cf 7b01          	ld	a,(OFST+0,sp)
 342  00d1 5f            	clrw	x
 343  00d2 97            	ld	xl,a
 344  00d3 e600          	ld	a,(_IIC_RxBuffer,x)
 345  00d5 5f            	clrw	x
 346  00d6 97            	ld	xl,a
 347  00d7 89            	pushw	x
 348  00d8 ae0002        	ldw	x,#L731
 349  00db cd0000        	call	_printf
 351  00de 85            	popw	x
 352                     ; 113 			for(i=0;i<GetDataIndex;i++){
 354  00df 0c01          	inc	(OFST+0,sp)
 355  00e1               L331:
 358  00e1 7b01          	ld	a,(OFST+0,sp)
 359  00e3 b100          	cp	a,_GetDataIndex
 360  00e5 25e8          	jrult	L721
 361                     ; 116 			printf("\n");
 363  00e7 ae0000        	ldw	x,#L141
 364  00ea cd0000        	call	_printf
 366                     ; 117 			ReceiveState = IIC_STATE_UNKNOWN;
 368  00ed 3f00          	clr	_ReceiveState
 369                     ; 118 			GetDataIndex = 0;
 371  00ef 3f00          	clr	_GetDataIndex
 372  00f1               L521:
 373                     ; 120 		if(f_1s){
 375  00f1 b600          	ld	a,_Flag1_
 376  00f3 a508          	bcp	a,#8
 377  00f5 27ce          	jreq	L121
 378                     ; 121 			f_1s = 0;
 380  00f7 72170000      	bres	_Flag1_,#3
 381                     ; 122 			Tick10s++;
 383  00fb 3c00          	inc	_Tick10s
 384                     ; 123 			if(Tick10s >= 10){
 386  00fd b600          	ld	a,_Tick10s
 387  00ff a10a          	cp	a,#10
 388  0101 25c2          	jrult	L121
 389                     ; 124 				Tick10s = 0;
 391  0103 3f00          	clr	_Tick10s
 392                     ; 125 				AcquireEG();
 394  0105 cd0000        	call	_AcquireEG
 396  0108 20bb          	jra	L121
 431                     ; 140 void assert_failed(uint8_t* file, uint32_t line)
 431                     ; 141 { 
 432                     .text:	section	.text,new
 433  0000               _assert_failed:
 437  0000               L561:
 438  0000 20fe          	jra	L561
 462                     	xdef	_main
 463                     	xdef	_delay
 464                     	switch	.ubsct
 465  0000               _Tick10s:
 466  0000 00            	ds.b	1
 467                     	xdef	_Tick10s
 468                     	xref.b	_ReceiveState
 469                     	xref.b	_GetDataIndex
 470                     	xref.b	_IIC_RxBuffer
 471                     	xref.b	_slave_address
 472                     	xref.b	_spc
 473                     	xref	_AcquireEG
 474                     	xref	_ADC_init
 475                     	xref.b	_Flag1_
 476                     	xref	_UART_Init
 477                     	xref	_printf
 478                     	xref	_IIC_SlaveConfig
 479                     	xdef	_assert_failed
 480                     	xref	_GPIO_ReadInputData
 481                     	xref	_GPIO_Init
 482                     .const:	section	.text
 483  0000               L141:
 484  0000 0a00          	dc.b	10,0
 485  0002               L731:
 486  0002 253032582000  	dc.b	"%02X ",0
 487  0008               L711:
 488  0008 48656c6c6f20  	dc.b	"Hello World!",10,0
 508                     	end
