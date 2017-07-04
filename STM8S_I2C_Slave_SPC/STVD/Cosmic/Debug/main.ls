   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
  61                     ; 61 void delay(u16 Count)
  61                     ; 62 {
  63                     .text:	section	.text,new
  64  0000               _delay:
  66  0000 89            	pushw	x
  67  0001 89            	pushw	x
  68       00000002      OFST:	set	2
  71  0002 2014          	jra	L14
  72  0004               L73:
  73                     ; 66     for(i=0;i<100;i++)
  75  0004 0f01          	clr	(OFST-1,sp)
  76  0006               L54:
  77                     ; 67     for(j=0;j<50;j++);
  79  0006 0f02          	clr	(OFST+0,sp)
  80  0008               L35:
  84  0008 0c02          	inc	(OFST+0,sp)
  87  000a 7b02          	ld	a,(OFST+0,sp)
  88  000c a132          	cp	a,#50
  89  000e 25f8          	jrult	L35
  90                     ; 66     for(i=0;i<100;i++)
  92  0010 0c01          	inc	(OFST-1,sp)
  95  0012 7b01          	ld	a,(OFST-1,sp)
  96  0014 a164          	cp	a,#100
  97  0016 25ee          	jrult	L54
  98  0018               L14:
  99                     ; 64   while (Count--)//Count形参控制延时次数
 101  0018 1e03          	ldw	x,(OFST+1,sp)
 102  001a 1d0001        	subw	x,#1
 103  001d 1f03          	ldw	(OFST+1,sp),x
 104  001f 1c0001        	addw	x,#1
 105  0022 a30000        	cpw	x,#0
 106  0025 26dd          	jrne	L73
 107                     ; 69 }
 110  0027 5b04          	addw	sp,#4
 111  0029 81            	ret
 166                     ; 77 void main(void)
 166                     ; 78 {
 167                     .text:	section	.text,new
 168  0000               _main:
 170  0000 88            	push	a
 171       00000001      OFST:	set	1
 174                     ; 82 	CLK->SWCR |= 0x02; //开启切换
 176  0001 721250c5      	bset	20677,#1
 177                     ; 83   CLK->SWR   = 0xb4;       //选择时钟为外部8M
 179  0005 35b450c4      	mov	20676,#180
 181  0009               L301:
 182                     ; 84   while((CLK->SWCR & 0x01)==0x01);
 184  0009 c650c5        	ld	a,20677
 185  000c a401          	and	a,#1
 186  000e a101          	cp	a,#1
 187  0010 27f7          	jreq	L301
 188                     ; 85   CLK->CKDIVR = 0x80;    //不分频
 190  0012 358050c6      	mov	20678,#128
 191                     ; 86   CLK->SWCR  &= ~0x02; //关闭切换
 193  0016 721350c5      	bres	20677,#1
 194                     ; 89 	GPIO_Init(GPIOD, (GPIO_Pin_TypeDef)GPIO_PIN_2, GPIO_MODE_IN_PU_NO_IT);
 196  001a 4b40          	push	#64
 197  001c 4b04          	push	#4
 198  001e ae500f        	ldw	x,#20495
 199  0021 cd0000        	call	_GPIO_Init
 201  0024 85            	popw	x
 202                     ; 90 	GPIO_Init(GPIOC, (GPIO_Pin_TypeDef)GPIO_PIN_5, GPIO_MODE_IN_PU_NO_IT);
 204  0025 4b40          	push	#64
 205  0027 4b20          	push	#32
 206  0029 ae500a        	ldw	x,#20490
 207  002c cd0000        	call	_GPIO_Init
 209  002f 85            	popw	x
 210                     ; 91 	GPIO_Init(GPIOC, (GPIO_Pin_TypeDef)GPIO_PIN_6, GPIO_MODE_IN_PU_NO_IT);
 212  0030 4b40          	push	#64
 213  0032 4b40          	push	#64
 214  0034 ae500a        	ldw	x,#20490
 215  0037 cd0000        	call	_GPIO_Init
 217  003a 85            	popw	x
 218                     ; 92 	GPIO_Init(GPIOC, (GPIO_Pin_TypeDef)GPIO_PIN_7, GPIO_MODE_IN_PU_NO_IT);
 220  003b 4b40          	push	#64
 221  003d 4b80          	push	#128
 222  003f ae500a        	ldw	x,#20490
 223  0042 cd0000        	call	_GPIO_Init
 225  0045 85            	popw	x
 226                     ; 94 	GPIO_Init(GPIOC, (GPIO_Pin_TypeDef)GPIO_PIN_3, GPIO_MODE_OUT_PP_LOW_SLOW);
 228  0046 4bc0          	push	#192
 229  0048 4b08          	push	#8
 230  004a ae500a        	ldw	x,#20490
 231  004d cd0000        	call	_GPIO_Init
 233  0050 85            	popw	x
 234                     ; 95 	GPIO_Init(GPIOC, (GPIO_Pin_TypeDef)GPIO_PIN_4, GPIO_MODE_OUT_PP_LOW_SLOW);
 236  0051 4bc0          	push	#192
 237  0053 4b10          	push	#16
 238  0055 ae500a        	ldw	x,#20490
 239  0058 cd0000        	call	_GPIO_Init
 241  005b 85            	popw	x
 242                     ; 96 	GPIO_Init(GPIOA, (GPIO_Pin_TypeDef)GPIO_PIN_3, GPIO_MODE_OUT_PP_LOW_SLOW);
 244  005c 4bc0          	push	#192
 245  005e 4b08          	push	#8
 246  0060 ae5000        	ldw	x,#20480
 247  0063 cd0000        	call	_GPIO_Init
 249  0066 85            	popw	x
 250                     ; 97 	delay(100);
 252  0067 ae0064        	ldw	x,#100
 253  006a cd0000        	call	_delay
 255                     ; 98 	if(GPIO_ReadInputData(GPIOD) & 0x04)	slave_address |= 0x08;
 257  006d ae500f        	ldw	x,#20495
 258  0070 cd0000        	call	_GPIO_ReadInputData
 260  0073 a504          	bcp	a,#4
 261  0075 2704          	jreq	L701
 264  0077 72160000      	bset	_slave_address,#3
 265  007b               L701:
 266                     ; 99 	if(GPIO_ReadInputData(GPIOC) & 0x20)	slave_address |= 0x04;
 268  007b ae500a        	ldw	x,#20490
 269  007e cd0000        	call	_GPIO_ReadInputData
 271  0081 a520          	bcp	a,#32
 272  0083 2704          	jreq	L111
 275  0085 72140000      	bset	_slave_address,#2
 276  0089               L111:
 277                     ; 100 	if(GPIO_ReadInputData(GPIOC) & 0x40)	slave_address |= 0x02;
 279  0089 ae500a        	ldw	x,#20490
 280  008c cd0000        	call	_GPIO_ReadInputData
 282  008f a540          	bcp	a,#64
 283  0091 2704          	jreq	L311
 286  0093 72120000      	bset	_slave_address,#1
 287  0097               L311:
 288                     ; 101 	if(GPIO_ReadInputData(GPIOC) & 0x80)	slave_address |= 0x01;
 290  0097 ae500a        	ldw	x,#20490
 291  009a cd0000        	call	_GPIO_ReadInputData
 293  009d a580          	bcp	a,#128
 294  009f 2704          	jreq	L511
 297  00a1 72100000      	bset	_slave_address,#0
 298  00a5               L511:
 299                     ; 102 	spc.MDID = slave_address;
 301  00a5 b600          	ld	a,_slave_address
 302  00a7 5f            	clrw	x
 303  00a8 97            	ld	xl,a
 304  00a9 bf13          	ldw	_spc+19,x
 305                     ; 103 	ADC_init();
 307  00ab cd0000        	call	_ADC_init
 309                     ; 105 	UART_Init(115200);
 311  00ae aec200        	ldw	x,#49664
 312  00b1 89            	pushw	x
 313  00b2 ae0001        	ldw	x,#1
 314  00b5 89            	pushw	x
 315  00b6 cd0000        	call	_UART_Init
 317  00b9 5b04          	addw	sp,#4
 318                     ; 106 	Init_Time4();
 320  00bb cd0000        	call	_Init_Time4
 322                     ; 107 	printf("Hello World!\n");
 324  00be ae0008        	ldw	x,#L711
 325  00c1 cd0000        	call	_printf
 327                     ; 109 	IIC_SlaveConfig();
 329  00c4 cd0000        	call	_IIC_SlaveConfig
 331                     ; 112 	enableInterrupts();
 334  00c7 9a            rim
 336  00c8               L121:
 337                     ; 118 		if(ReceiveState == IIC_STATE_END)
 339  00c8 b600          	ld	a,_ReceiveState
 340  00ca a103          	cp	a,#3
 341  00cc 2626          	jrne	L521
 342                     ; 120 			for(i=0;i<GetDataIndex;i++){
 344  00ce 0f01          	clr	(OFST+0,sp)
 346  00d0 2012          	jra	L331
 347  00d2               L721:
 348                     ; 121 				printf("%02X ",IIC_RxBuffer[i]&0xFF);
 350  00d2 7b01          	ld	a,(OFST+0,sp)
 351  00d4 5f            	clrw	x
 352  00d5 97            	ld	xl,a
 353  00d6 e600          	ld	a,(_IIC_RxBuffer,x)
 354  00d8 5f            	clrw	x
 355  00d9 97            	ld	xl,a
 356  00da 89            	pushw	x
 357  00db ae0002        	ldw	x,#L731
 358  00de cd0000        	call	_printf
 360  00e1 85            	popw	x
 361                     ; 120 			for(i=0;i<GetDataIndex;i++){
 363  00e2 0c01          	inc	(OFST+0,sp)
 364  00e4               L331:
 367  00e4 7b01          	ld	a,(OFST+0,sp)
 368  00e6 b100          	cp	a,_GetDataIndex
 369  00e8 25e8          	jrult	L721
 370                     ; 123 			printf("\n");
 372  00ea ae0000        	ldw	x,#L141
 373  00ed cd0000        	call	_printf
 375                     ; 124 			ReceiveState = IIC_STATE_UNKNOWN;
 377  00f0 3f00          	clr	_ReceiveState
 378                     ; 125 			GetDataIndex = 0;
 380  00f2 3f00          	clr	_GetDataIndex
 381  00f4               L521:
 382                     ; 127 		if(f_100ms){
 384  00f4 b600          	ld	a,_Flag1_
 385  00f6 a502          	bcp	a,#2
 386  00f8 2744          	jreq	L341
 387                     ; 128 			f_100ms = 0;
 389  00fa 72130000      	bres	_Flag1_,#1
 390                     ; 129 			if(ch1_status_change){
 392  00fe 3d00          	tnz	_ch1_status_change
 393  0100 271c          	jreq	L541
 394                     ; 130 				if(spc.ch1_status == 0x63)	CH1_ON;
 396  0102 b615          	ld	a,_spc+21
 397  0104 a163          	cp	a,#99
 398  0106 260b          	jrne	L741
 401  0108 4b08          	push	#8
 402  010a ae500a        	ldw	x,#20490
 403  010d cd0000        	call	_GPIO_WriteHigh
 405  0110 84            	pop	a
 407  0111 2009          	jra	L151
 408  0113               L741:
 409                     ; 131 				else												CH1_OFF;
 411  0113 4b08          	push	#8
 412  0115 ae500a        	ldw	x,#20490
 413  0118 cd0000        	call	_GPIO_WriteLow
 415  011b 84            	pop	a
 416  011c               L151:
 417                     ; 132 				ch1_status_change = 0;
 419  011c 3f00          	clr	_ch1_status_change
 420  011e               L541:
 421                     ; 134 			if(ch2_status_change){
 423  011e 3d00          	tnz	_ch2_status_change
 424  0120 271c          	jreq	L341
 425                     ; 135 				if(spc.ch2_status == 0x63)	CH2_ON;
 427  0122 b616          	ld	a,_spc+22
 428  0124 a163          	cp	a,#99
 429  0126 260b          	jrne	L551
 432  0128 4b10          	push	#16
 433  012a ae500a        	ldw	x,#20490
 434  012d cd0000        	call	_GPIO_WriteHigh
 436  0130 84            	pop	a
 438  0131 2009          	jra	L751
 439  0133               L551:
 440                     ; 136 				else												CH2_OFF;
 442  0133 4b10          	push	#16
 443  0135 ae500a        	ldw	x,#20490
 444  0138 cd0000        	call	_GPIO_WriteLow
 446  013b 84            	pop	a
 447  013c               L751:
 448                     ; 137 				ch2_status_change = 0;
 450  013c 3f00          	clr	_ch2_status_change
 451  013e               L341:
 452                     ; 140 		if(f_1s){
 454  013e b600          	ld	a,_Flag1_
 455  0140 a504          	bcp	a,#4
 456  0142 2784          	jreq	L121
 457                     ; 141 			f_1s = 0;
 459  0144 72150000      	bres	_Flag1_,#2
 460                     ; 142 			Tick10s++;
 462  0148 3c00          	inc	_Tick10s
 463                     ; 143 			if(Tick10s >= 10){
 465  014a b600          	ld	a,_Tick10s
 466  014c a10a          	cp	a,#10
 467  014e 2403cc00c8    	jrult	L121
 468                     ; 144 				Tick10s = 0;
 470  0153 3f00          	clr	_Tick10s
 471                     ; 145 				AcquireEG();
 473  0155 cd0000        	call	_AcquireEG
 475                     ; 146 				printf("Hello World!\n");
 477  0158 ae0008        	ldw	x,#L711
 478  015b cd0000        	call	_printf
 480  015e acc800c8      	jpf	L121
 515                     ; 161 void assert_failed(uint8_t* file, uint32_t line)
 515                     ; 162 { 
 516                     .text:	section	.text,new
 517  0000               _assert_failed:
 521  0000               L302:
 522  0000 20fe          	jra	L302
 546                     	xdef	_main
 547                     	xdef	_delay
 548                     	switch	.ubsct
 549  0000               _Tick10s:
 550  0000 00            	ds.b	1
 551                     	xdef	_Tick10s
 552                     	xref.b	_ch2_status_change
 553                     	xref.b	_ch1_status_change
 554                     	xref.b	_ReceiveState
 555                     	xref.b	_GetDataIndex
 556                     	xref.b	_IIC_RxBuffer
 557                     	xref.b	_slave_address
 558                     	xref.b	_spc
 559                     	xref	_AcquireEG
 560                     	xref	_ADC_init
 561                     	xref	_Init_Time4
 562                     	xref.b	_Flag1_
 563                     	xref	_UART_Init
 564                     	xref	_printf
 565                     	xref	_IIC_SlaveConfig
 566                     	xdef	_assert_failed
 567                     	xref	_GPIO_ReadInputData
 568                     	xref	_GPIO_WriteLow
 569                     	xref	_GPIO_WriteHigh
 570                     	xref	_GPIO_Init
 571                     .const:	section	.text
 572  0000               L141:
 573  0000 0a00          	dc.b	10,0
 574  0002               L731:
 575  0002 253032582000  	dc.b	"%02X ",0
 576  0008               L711:
 577  0008 48656c6c6f20  	dc.b	"Hello World!",10,0
 597                     	end
