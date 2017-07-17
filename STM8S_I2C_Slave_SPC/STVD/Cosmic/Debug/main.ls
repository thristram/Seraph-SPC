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
 151                     ; 71 void main(void)
 151                     ; 72 {
 152                     .text:	section	.text,new
 153  0000               _main:
 157                     ; 76 	CLK->SWCR |= 0x02; //开启切换
 159  0000 721250c5      	bset	20677,#1
 160                     ; 77   CLK->SWR   = 0xb4;       //选择时钟为外部8M
 162  0004 35b450c4      	mov	20676,#180
 164  0008               L57:
 165                     ; 78   while((CLK->SWCR & 0x01)==0x01);
 167  0008 c650c5        	ld	a,20677
 168  000b a401          	and	a,#1
 169  000d a101          	cp	a,#1
 170  000f 27f7          	jreq	L57
 171                     ; 79   CLK->CKDIVR = 0x80;    //不分频
 173  0011 358050c6      	mov	20678,#128
 174                     ; 80   CLK->SWCR  &= ~0x02; //关闭切换
 176  0015 721350c5      	bres	20677,#1
 177                     ; 83 	GPIO_Init(GPIOD, (GPIO_Pin_TypeDef)GPIO_PIN_2, GPIO_MODE_IN_PU_NO_IT);
 179  0019 4b40          	push	#64
 180  001b 4b04          	push	#4
 181  001d ae500f        	ldw	x,#20495
 182  0020 cd0000        	call	_GPIO_Init
 184  0023 85            	popw	x
 185                     ; 84 	GPIO_Init(GPIOC, (GPIO_Pin_TypeDef)GPIO_PIN_5, GPIO_MODE_IN_PU_NO_IT);
 187  0024 4b40          	push	#64
 188  0026 4b20          	push	#32
 189  0028 ae500a        	ldw	x,#20490
 190  002b cd0000        	call	_GPIO_Init
 192  002e 85            	popw	x
 193                     ; 85 	GPIO_Init(GPIOC, (GPIO_Pin_TypeDef)GPIO_PIN_6, GPIO_MODE_IN_PU_NO_IT);
 195  002f 4b40          	push	#64
 196  0031 4b40          	push	#64
 197  0033 ae500a        	ldw	x,#20490
 198  0036 cd0000        	call	_GPIO_Init
 200  0039 85            	popw	x
 201                     ; 86 	GPIO_Init(GPIOC, (GPIO_Pin_TypeDef)GPIO_PIN_7, GPIO_MODE_IN_PU_NO_IT);
 203  003a 4b40          	push	#64
 204  003c 4b80          	push	#128
 205  003e ae500a        	ldw	x,#20490
 206  0041 cd0000        	call	_GPIO_Init
 208  0044 85            	popw	x
 209                     ; 88 	GPIO_Init(GPIOC, (GPIO_Pin_TypeDef)GPIO_PIN_3, GPIO_MODE_OUT_PP_LOW_SLOW);
 211  0045 4bc0          	push	#192
 212  0047 4b08          	push	#8
 213  0049 ae500a        	ldw	x,#20490
 214  004c cd0000        	call	_GPIO_Init
 216  004f 85            	popw	x
 217                     ; 89 	GPIO_Init(GPIOC, (GPIO_Pin_TypeDef)GPIO_PIN_4, GPIO_MODE_OUT_PP_LOW_SLOW);
 219  0050 4bc0          	push	#192
 220  0052 4b10          	push	#16
 221  0054 ae500a        	ldw	x,#20490
 222  0057 cd0000        	call	_GPIO_Init
 224  005a 85            	popw	x
 225                     ; 90 	GPIO_Init(GPIOA, (GPIO_Pin_TypeDef)GPIO_PIN_3, GPIO_MODE_OUT_PP_LOW_SLOW);
 227  005b 4bc0          	push	#192
 228  005d 4b08          	push	#8
 229  005f ae5000        	ldw	x,#20480
 230  0062 cd0000        	call	_GPIO_Init
 232  0065 85            	popw	x
 233                     ; 91 	delay(100);
 235  0066 ae0064        	ldw	x,#100
 236  0069 cd0000        	call	_delay
 238                     ; 92 	if(GPIO_ReadInputData(GPIOD) & 0x04)	slave_address |= 0x08;
 240  006c ae500f        	ldw	x,#20495
 241  006f cd0000        	call	_GPIO_ReadInputData
 243  0072 a504          	bcp	a,#4
 244  0074 2704          	jreq	L101
 247  0076 72160000      	bset	_slave_address,#3
 248  007a               L101:
 249                     ; 93 	if(GPIO_ReadInputData(GPIOC) & 0x20)	slave_address |= 0x04;
 251  007a ae500a        	ldw	x,#20490
 252  007d cd0000        	call	_GPIO_ReadInputData
 254  0080 a520          	bcp	a,#32
 255  0082 2704          	jreq	L301
 258  0084 72140000      	bset	_slave_address,#2
 259  0088               L301:
 260                     ; 94 	if(GPIO_ReadInputData(GPIOC) & 0x40)	slave_address |= 0x02;
 262  0088 ae500a        	ldw	x,#20490
 263  008b cd0000        	call	_GPIO_ReadInputData
 265  008e a540          	bcp	a,#64
 266  0090 2704          	jreq	L501
 269  0092 72120000      	bset	_slave_address,#1
 270  0096               L501:
 271                     ; 95 	if(GPIO_ReadInputData(GPIOC) & 0x80)	slave_address |= 0x01;
 273  0096 ae500a        	ldw	x,#20490
 274  0099 cd0000        	call	_GPIO_ReadInputData
 276  009c a580          	bcp	a,#128
 277  009e 2704          	jreq	L701
 280  00a0 72100000      	bset	_slave_address,#0
 281  00a4               L701:
 282                     ; 96 	spc.MDID = slave_address;
 284  00a4 b600          	ld	a,_slave_address
 285  00a6 5f            	clrw	x
 286  00a7 97            	ld	xl,a
 287  00a8 bf13          	ldw	_spc+19,x
 288                     ; 97 	ADC_init();
 290  00aa cd0000        	call	_ADC_init
 292                     ; 100 	Init_Time4();
 294  00ad cd0000        	call	_Init_Time4
 296                     ; 103 	IIC_SlaveConfig();
 298  00b0 cd0000        	call	_IIC_SlaveConfig
 300                     ; 105 	disableInterrupts();
 303  00b3 9b            sim
 305                     ; 106 	ITC_DeInit();
 308  00b4 cd0000        	call	_ITC_DeInit
 310                     ; 107 	ITC_SetSoftwarePriority(ITC_IRQ_TIM4_OVF,ITC_PRIORITYLEVEL_2);
 312  00b7 5f            	clrw	x
 313  00b8 a617          	ld	a,#23
 314  00ba 95            	ld	xh,a
 315  00bb cd0000        	call	_ITC_SetSoftwarePriority
 317                     ; 108 	ITC_SetSoftwarePriority(ITC_IRQ_I2C,ITC_PRIORITYLEVEL_3);
 319  00be ae0003        	ldw	x,#3
 320  00c1 a613          	ld	a,#19
 321  00c3 95            	ld	xh,a
 322  00c4 cd0000        	call	_ITC_SetSoftwarePriority
 324                     ; 109 	enableInterrupts();
 327  00c7 9a            rim
 329  00c8               L111:
 330                     ; 115 		if(ReceiveState == IIC_STATE_END)
 332  00c8 b600          	ld	a,_ReceiveState
 333  00ca a103          	cp	a,#3
 334  00cc 2604          	jrne	L511
 335                     ; 121 			ReceiveState = IIC_STATE_UNKNOWN;
 337  00ce 3f00          	clr	_ReceiveState
 338                     ; 122 			GetDataIndex = 0;
 340  00d0 3f00          	clr	_GetDataIndex
 341  00d2               L511:
 342                     ; 125 		if(f_1s){
 344  00d2 b600          	ld	a,_Flag1_
 345  00d4 a504          	bcp	a,#4
 346  00d6 27f0          	jreq	L111
 347                     ; 126 			f_1s = 0;
 349  00d8 72150000      	bres	_Flag1_,#2
 350                     ; 127 			Tick10s++;
 352  00dc 3c00          	inc	_Tick10s
 353                     ; 128 			if(Tick10s >= 10){
 355  00de b600          	ld	a,_Tick10s
 356  00e0 a10a          	cp	a,#10
 357  00e2 25e4          	jrult	L111
 358                     ; 129 				Tick10s = 0;
 360  00e4 3f00          	clr	_Tick10s
 361                     ; 130 				AcquireEG();
 363  00e6 cd0000        	call	_AcquireEG
 365  00e9 20dd          	jra	L111
 400                     ; 146 void assert_failed(uint8_t* file, uint32_t line)
 400                     ; 147 { 
 401                     .text:	section	.text,new
 402  0000               _assert_failed:
 406  0000               L141:
 407  0000 20fe          	jra	L141
 431                     	xdef	_main
 432                     	xdef	_delay
 433                     	switch	.ubsct
 434  0000               _Tick10s:
 435  0000 00            	ds.b	1
 436                     	xdef	_Tick10s
 437                     	xref.b	_ReceiveState
 438                     	xref.b	_GetDataIndex
 439                     	xref.b	_slave_address
 440                     	xref.b	_spc
 441                     	xref	_AcquireEG
 442                     	xref	_ADC_init
 443                     	xref	_Init_Time4
 444                     	xref.b	_Flag1_
 445                     	xref	_IIC_SlaveConfig
 446                     	xdef	_assert_failed
 447                     	xref	_ITC_SetSoftwarePriority
 448                     	xref	_ITC_DeInit
 449                     	xref	_GPIO_ReadInputData
 450                     	xref	_GPIO_Init
 470                     	end
