   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
  82                     ; 6 void ADC_init(void)
  82                     ; 7 {
  84                     .text:	section	.text,new
  85  0000               _ADC_init:
  89                     ; 8 	ADC1_DeInit();
  91  0000 cd0000        	call	_ADC1_DeInit
  93                     ; 10 	ADC1_Init(ADC1_CONVERSIONMODE_SINGLE, ADC1_CHANNEL_4, ADC1_PRESSEL_FCPU_D2,
  93                     ; 11 	ADC1_EXTTRIG_TIM, DISABLE, ADC1_ALIGN_RIGHT, ADC1_SCHMITTTRIG_CHANNEL8,
  93                     ; 12 	ENABLE);
  95  0003 4b01          	push	#1
  96  0005 4b08          	push	#8
  97  0007 4b08          	push	#8
  98  0009 4b00          	push	#0
  99  000b 4b00          	push	#0
 100  000d 4b00          	push	#0
 101  000f ae0004        	ldw	x,#4
 102  0012 4f            	clr	a
 103  0013 95            	ld	xh,a
 104  0014 cd0000        	call	_ADC1_Init
 106  0017 5b06          	addw	sp,#6
 107                     ; 13 	ADC1_Cmd(ENABLE);//使能 ADC
 109  0019 a601          	ld	a,#1
 110  001b cd0000        	call	_ADC1_Cmd
 112                     ; 14 }
 115  001e 81            	ret
 118                     	bsct
 119  0000               L54_count:
 120  0000 00            	dc.b	0
 177                     ; 18 void AcquireEG(void)
 177                     ; 19 {
 178                     .text:	section	.text,new
 179  0000               _AcquireEG:
 181  0000 5206          	subw	sp,#6
 182       00000006      OFST:	set	6
 185                     ; 21 	u16 u16_adc1_value = 0;
 187  0002 1e01          	ldw	x,(OFST-5,sp)
 188                     ; 23 	ADC1_StartConversion();//启动转换
 190  0004 cd0000        	call	_ADC1_StartConversion
 193  0007               L77:
 194                     ; 24 	while(ADC1_GetFlagStatus(ADC1_FLAG_EOC)==RESET);//等待转换结束
 196  0007 a680          	ld	a,#128
 197  0009 cd0000        	call	_ADC1_GetFlagStatus
 199  000c 4d            	tnz	a
 200  000d 27f8          	jreq	L77
 201                     ; 25 	u16_adc1_value = ADC1_GetConversionValue();//获取采样值
 203  000f cd0000        	call	_ADC1_GetConversionValue
 205  0012 1f01          	ldw	(OFST-5,sp),x
 206                     ; 26 	AD_Data = ((float)u16_adc1_value)*JiZhun_AD*2/1024+0.15005;	//经过实测需要加0.15以减少误差
 208  0014 1e01          	ldw	x,(OFST-5,sp)
 209  0016 cd0000        	call	c_uitof
 211  0019 ae0020        	ldw	x,#L701
 212  001c cd0000        	call	c_fmul
 214  001f ae001c        	ldw	x,#L711
 215  0022 cd0000        	call	c_fmul
 217  0025 ae0018        	ldw	x,#L721
 218  0028 cd0000        	call	c_fdiv
 220  002b ae0014        	ldw	x,#L731
 221  002e cd0000        	call	c_fadd
 223  0031 96            	ldw	x,sp
 224  0032 1c0003        	addw	x,#OFST-3
 225  0035 cd0000        	call	c_rtol
 227                     ; 27 	current[count++] =((AD_Data-2.68)/0.185)*1000;
 229  0038 96            	ldw	x,sp
 230  0039 1c0003        	addw	x,#OFST-3
 231  003c cd0000        	call	c_ltor
 233  003f ae0010        	ldw	x,#L741
 234  0042 cd0000        	call	c_fsub
 236  0045 ae000c        	ldw	x,#L751
 237  0048 cd0000        	call	c_fdiv
 239  004b ae0008        	ldw	x,#L761
 240  004e cd0000        	call	c_fmul
 242  0051 b600          	ld	a,L54_count
 243  0053 3c00          	inc	L54_count
 244  0055 97            	ld	xl,a
 245  0056 a604          	ld	a,#4
 246  0058 42            	mul	x,a
 247  0059 1c0008        	addw	x,#_current
 248  005c cd0000        	call	c_rtol
 250                     ; 28 	if(count >= 6){
 252  005f b600          	ld	a,L54_count
 253  0061 a106          	cp	a,#6
 254  0063 2545          	jrult	L371
 255                     ; 29 		count = 0;
 257  0065 3f00          	clr	L54_count
 258                     ; 30 		avr_current = (current[0]+current[1]+current[2]+current[3]+current[4]+current[5])/6;
 260  0067 ae0008        	ldw	x,#_current
 261  006a cd0000        	call	c_ltor
 263  006d ae000c        	ldw	x,#_current+4
 264  0070 cd0000        	call	c_fadd
 266  0073 ae0010        	ldw	x,#_current+8
 267  0076 cd0000        	call	c_fadd
 269  0079 ae0014        	ldw	x,#_current+12
 270  007c cd0000        	call	c_fadd
 272  007f ae0018        	ldw	x,#_current+16
 273  0082 cd0000        	call	c_fadd
 275  0085 ae001c        	ldw	x,#_current+20
 276  0088 cd0000        	call	c_fadd
 278  008b ae0004        	ldw	x,#L102
 279  008e cd0000        	call	c_fdiv
 281  0091 ae0004        	ldw	x,#_avr_current
 282  0094 cd0000        	call	c_rtol
 284                     ; 31 		rtEG += calcEG_60s(220,avr_current);//电压默认220V
 286  0097 be06          	ldw	x,_avr_current+2
 287  0099 89            	pushw	x
 288  009a be04          	ldw	x,_avr_current
 289  009c 89            	pushw	x
 290  009d a6dc          	ld	a,#220
 291  009f cd0000        	call	_calcEG_60s
 293  00a2 5b04          	addw	sp,#4
 294  00a4 ae0000        	ldw	x,#_rtEG
 295  00a7 cd0000        	call	c_fgadd
 297  00aa               L371:
 298                     ; 33 }
 301  00aa 5b06          	addw	sp,#6
 302  00ac 81            	ret
 345                     ; 36 float calcEG_60s(u8 voltage,float current)
 345                     ; 37 {
 346                     .text:	section	.text,new
 347  0000               _calcEG_60s:
 349  0000 88            	push	a
 350       00000000      OFST:	set	0
 353                     ; 38 	return (float)(voltage*current/60);
 355  0001 5f            	clrw	x
 356  0002 97            	ld	xl,a
 357  0003 cd0000        	call	c_itof
 359  0006 96            	ldw	x,sp
 360  0007 1c0004        	addw	x,#OFST+4
 361  000a cd0000        	call	c_fmul
 363  000d ae0000        	ldw	x,#L332
 364  0010 cd0000        	call	c_fdiv
 368  0013 84            	pop	a
 369  0014 81            	ret
 382                     	xdef	_calcEG_60s
 383                     	xdef	_AcquireEG
 384                     	xdef	_ADC_init
 385                     	switch	.ubsct
 386  0000               _rtEG:
 387  0000 00000000      	ds.b	4
 388                     	xdef	_rtEG
 389  0004               _avr_current:
 390  0004 00000000      	ds.b	4
 391                     	xdef	_avr_current
 392  0008               _current:
 393  0008 000000000000  	ds.b	24
 394                     	xdef	_current
 395                     	xref	_ADC1_GetFlagStatus
 396                     	xref	_ADC1_GetConversionValue
 397                     	xref	_ADC1_StartConversion
 398                     	xref	_ADC1_Cmd
 399                     	xref	_ADC1_Init
 400                     	xref	_ADC1_DeInit
 401                     .const:	section	.text
 402  0000               L332:
 403  0000 42700000      	dc.w	17008,0
 404  0004               L102:
 405  0004 40c00000      	dc.w	16576,0
 406  0008               L761:
 407  0008 447a0000      	dc.w	17530,0
 408  000c               L751:
 409  000c 3e3d70a3      	dc.w	15933,28835
 410  0010               L741:
 411  0010 402b851e      	dc.w	16427,-31458
 412  0014               L731:
 413  0014 3e19a6b5      	dc.w	15897,-22859
 414  0018               L721:
 415  0018 44800000      	dc.w	17536,0
 416  001c               L711:
 417  001c 40000000      	dc.w	16384,0
 418  0020               L701:
 419  0020 40200000      	dc.w	16416,0
 439                     	xref	c_itof
 440                     	xref	c_fgadd
 441                     	xref	c_fsub
 442                     	xref	c_ltor
 443                     	xref	c_rtol
 444                     	xref	c_fadd
 445                     	xref	c_fdiv
 446                     	xref	c_fmul
 447                     	xref	c_uitof
 448                     	end
