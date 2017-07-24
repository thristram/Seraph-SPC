   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
  61                     ; 55 void delay(u16 Count)
  61                     ; 56 {
  63                     .text:	section	.text,new
  64  0000               _delay:
  66  0000 89            	pushw	x
  67  0001 89            	pushw	x
  68       00000002      OFST:	set	2
  71  0002 2014          	jra	L14
  72  0004               L73:
  73                     ; 60     for(i=0;i<100;i++)
  75  0004 0f01          	clr	(OFST-1,sp)
  76  0006               L54:
  77                     ; 61     for(j=0;j<50;j++);
  79  0006 0f02          	clr	(OFST+0,sp)
  80  0008               L35:
  84  0008 0c02          	inc	(OFST+0,sp)
  87  000a 7b02          	ld	a,(OFST+0,sp)
  88  000c a132          	cp	a,#50
  89  000e 25f8          	jrult	L35
  90                     ; 60     for(i=0;i<100;i++)
  92  0010 0c01          	inc	(OFST-1,sp)
  95  0012 7b01          	ld	a,(OFST-1,sp)
  96  0014 a164          	cp	a,#100
  97  0016 25ee          	jrult	L54
  98  0018               L14:
  99                     ; 58   while (Count--)//Count形参控制延时次数
 101  0018 1e03          	ldw	x,(OFST+1,sp)
 102  001a 1d0001        	subw	x,#1
 103  001d 1f03          	ldw	(OFST+1,sp),x
 104  001f 1c0001        	addw	x,#1
 105  0022 a30000        	cpw	x,#0
 106  0025 26dd          	jrne	L73
 107                     ; 63 }
 110  0027 5b04          	addw	sp,#4
 111  0029 81            	ret
 152                     ; 71 void main(void)
 152                     ; 72 {
 153                     .text:	section	.text,new
 154  0000               _main:
 158                     ; 76 	CLK->SWCR |= 0x02; //开启切换
 160  0000 721250c5      	bset	20677,#1
 161                     ; 77   CLK->SWR   = 0xb4;       //选择时钟为外部8M
 163  0004 35b450c4      	mov	20676,#180
 165  0008               L57:
 166                     ; 78   while((CLK->SWCR & 0x01)==0x01);
 168  0008 c650c5        	ld	a,20677
 169  000b a401          	and	a,#1
 170  000d a101          	cp	a,#1
 171  000f 27f7          	jreq	L57
 172                     ; 79   CLK->CKDIVR = 0x80;    //不分频
 174  0011 358050c6      	mov	20678,#128
 175                     ; 80   CLK->SWCR  &= ~0x02; //关闭切换
 177  0015 721350c5      	bres	20677,#1
 178                     ; 83 	GPIO_Init(GPIOD, (GPIO_Pin_TypeDef)GPIO_PIN_2, GPIO_MODE_IN_PU_NO_IT);
 180  0019 4b40          	push	#64
 181  001b 4b04          	push	#4
 182  001d ae500f        	ldw	x,#20495
 183  0020 cd0000        	call	_GPIO_Init
 185  0023 85            	popw	x
 186                     ; 84 	GPIO_Init(GPIOC, (GPIO_Pin_TypeDef)GPIO_PIN_5, GPIO_MODE_IN_PU_NO_IT);
 188  0024 4b40          	push	#64
 189  0026 4b20          	push	#32
 190  0028 ae500a        	ldw	x,#20490
 191  002b cd0000        	call	_GPIO_Init
 193  002e 85            	popw	x
 194                     ; 85 	GPIO_Init(GPIOC, (GPIO_Pin_TypeDef)GPIO_PIN_6, GPIO_MODE_IN_PU_NO_IT);
 196  002f 4b40          	push	#64
 197  0031 4b40          	push	#64
 198  0033 ae500a        	ldw	x,#20490
 199  0036 cd0000        	call	_GPIO_Init
 201  0039 85            	popw	x
 202                     ; 86 	GPIO_Init(GPIOC, (GPIO_Pin_TypeDef)GPIO_PIN_7, GPIO_MODE_IN_PU_NO_IT);
 204  003a 4b40          	push	#64
 205  003c 4b80          	push	#128
 206  003e ae500a        	ldw	x,#20490
 207  0041 cd0000        	call	_GPIO_Init
 209  0044 85            	popw	x
 210                     ; 88 	GPIO_Init(GPIOC, (GPIO_Pin_TypeDef)GPIO_PIN_3, GPIO_MODE_OUT_PP_LOW_SLOW);
 212  0045 4bc0          	push	#192
 213  0047 4b08          	push	#8
 214  0049 ae500a        	ldw	x,#20490
 215  004c cd0000        	call	_GPIO_Init
 217  004f 85            	popw	x
 218                     ; 89 	GPIO_Init(GPIOC, (GPIO_Pin_TypeDef)GPIO_PIN_4, GPIO_MODE_OUT_PP_LOW_SLOW);
 220  0050 4bc0          	push	#192
 221  0052 4b10          	push	#16
 222  0054 ae500a        	ldw	x,#20490
 223  0057 cd0000        	call	_GPIO_Init
 225  005a 85            	popw	x
 226                     ; 90 	GPIO_Init(GPIOA, (GPIO_Pin_TypeDef)GPIO_PIN_3, GPIO_MODE_OUT_PP_LOW_SLOW);
 228  005b 4bc0          	push	#192
 229  005d 4b08          	push	#8
 230  005f ae5000        	ldw	x,#20480
 231  0062 cd0000        	call	_GPIO_Init
 233  0065 85            	popw	x
 234                     ; 91 	delay(100);
 236  0066 ae0064        	ldw	x,#100
 237  0069 cd0000        	call	_delay
 239                     ; 92 	if(GPIO_ReadInputData(GPIOD) & 0x04)	slave_address |= 0x08;
 241  006c ae500f        	ldw	x,#20495
 242  006f cd0000        	call	_GPIO_ReadInputData
 244  0072 a504          	bcp	a,#4
 245  0074 2704          	jreq	L101
 248  0076 72160000      	bset	_slave_address,#3
 249  007a               L101:
 250                     ; 93 	if(GPIO_ReadInputData(GPIOC) & 0x20)	slave_address |= 0x04;
 252  007a ae500a        	ldw	x,#20490
 253  007d cd0000        	call	_GPIO_ReadInputData
 255  0080 a520          	bcp	a,#32
 256  0082 2704          	jreq	L301
 259  0084 72140000      	bset	_slave_address,#2
 260  0088               L301:
 261                     ; 94 	if(GPIO_ReadInputData(GPIOC) & 0x40)	slave_address |= 0x02;
 263  0088 ae500a        	ldw	x,#20490
 264  008b cd0000        	call	_GPIO_ReadInputData
 266  008e a540          	bcp	a,#64
 267  0090 2704          	jreq	L501
 270  0092 72120000      	bset	_slave_address,#1
 271  0096               L501:
 272                     ; 95 	if(GPIO_ReadInputData(GPIOC) & 0x80)	slave_address |= 0x01;
 274  0096 ae500a        	ldw	x,#20490
 275  0099 cd0000        	call	_GPIO_ReadInputData
 277  009c a580          	bcp	a,#128
 278  009e 2704          	jreq	L701
 281  00a0 72100000      	bset	_slave_address,#0
 282  00a4               L701:
 283                     ; 96 	spc.MDID = slave_address;
 285  00a4 b600          	ld	a,_slave_address
 286  00a6 5f            	clrw	x
 287  00a7 97            	ld	xl,a
 288  00a8 bf13          	ldw	_spc+19,x
 289                     ; 97 	ADC_init();
 291  00aa cd0000        	call	_ADC_init
 293                     ; 100 	Init_Time4();TIMER2_Init();
 295  00ad cd0000        	call	_Init_Time4
 299  00b0 cd0000        	call	_TIMER2_Init
 301                     ; 103 	IIC_SlaveConfig();
 303  00b3 cd0000        	call	_IIC_SlaveConfig
 305                     ; 105 	disableInterrupts();
 308  00b6 9b            sim
 310                     ; 106 	ITC_DeInit();
 313  00b7 cd0000        	call	_ITC_DeInit
 315                     ; 107 	ITC_SetSoftwarePriority(ITC_IRQ_TIM4_OVF,ITC_PRIORITYLEVEL_2);
 317  00ba 5f            	clrw	x
 318  00bb a617          	ld	a,#23
 319  00bd 95            	ld	xh,a
 320  00be cd0000        	call	_ITC_SetSoftwarePriority
 322                     ; 108 	ITC_SetSoftwarePriority(ITC_IRQ_I2C,ITC_PRIORITYLEVEL_3);
 324  00c1 ae0003        	ldw	x,#3
 325  00c4 a613          	ld	a,#19
 326  00c6 95            	ld	xh,a
 327  00c7 cd0000        	call	_ITC_SetSoftwarePriority
 329                     ; 109 	enableInterrupts();
 332  00ca 9a            rim
 334  00cb               L111:
 335                     ; 115 		if(ReceiveState == IIC_STATE_END)
 337  00cb b600          	ld	a,_ReceiveState
 338  00cd a103          	cp	a,#3
 339  00cf 2604          	jrne	L511
 340                     ; 121 			ReceiveState = IIC_STATE_UNKNOWN;
 342  00d1 3f00          	clr	_ReceiveState
 343                     ; 122 			GetDataIndex = 0;
 345  00d3 3f00          	clr	_GetDataIndex
 346  00d5               L511:
 347                     ; 125 		if(f_1s){
 349  00d5 b600          	ld	a,_Flag1_
 350  00d7 a504          	bcp	a,#4
 351  00d9 27f0          	jreq	L111
 352                     ; 126 			f_1s = 0;
 354  00db 72150000      	bres	_Flag1_,#2
 355                     ; 127 			Tick10s++;
 357  00df 3c00          	inc	_Tick10s
 358                     ; 128 			if(Tick10s >= 10){
 360  00e1 b600          	ld	a,_Tick10s
 361  00e3 a10a          	cp	a,#10
 362  00e5 25e4          	jrult	L111
 363                     ; 129 				Tick10s = 0;
 365  00e7 3f00          	clr	_Tick10s
 366                     ; 130 				AcquireEG();
 368  00e9 cd0000        	call	_AcquireEG
 370  00ec 20dd          	jra	L111
 405                     ; 146 void assert_failed(uint8_t* file, uint32_t line)
 405                     ; 147 { 
 406                     .text:	section	.text,new
 407  0000               _assert_failed:
 411  0000               L141:
 412  0000 20fe          	jra	L141
 436                     	xdef	_main
 437                     	xdef	_delay
 438                     	switch	.ubsct
 439  0000               _Tick10s:
 440  0000 00            	ds.b	1
 441                     	xdef	_Tick10s
 442                     	xref.b	_ReceiveState
 443                     	xref.b	_GetDataIndex
 444                     	xref.b	_slave_address
 445                     	xref.b	_spc
 446                     	xref	_AcquireEG
 447                     	xref	_ADC_init
 448                     	xref	_Init_Time4
 449                     	xref	_TIMER2_Init
 450                     	xref.b	_Flag1_
 451                     	xref	_IIC_SlaveConfig
 452                     	xdef	_assert_failed
 453                     	xref	_ITC_SetSoftwarePriority
 454                     	xref	_ITC_DeInit
 455                     	xref	_GPIO_ReadInputData
 456                     	xref	_GPIO_Init
 476                     	end
