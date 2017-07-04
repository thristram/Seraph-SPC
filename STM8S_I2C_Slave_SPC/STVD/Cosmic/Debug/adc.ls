   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
 101                     ; 6 void ADC_init(void)
 101                     ; 7 {
 103                     .text:	section	.text,new
 104  0000               _ADC_init:
 108                     ; 8 	ADC1_DeInit();
 110  0000 cd0000        	call	_ADC1_DeInit
 112                     ; 10 	ADC1_Init(ADC1_CONVERSIONMODE_CONTINUOUS, ADC1_CHANNEL_4, ADC1_PRESSEL_FCPU_D2,
 112                     ; 11 	ADC1_EXTTRIG_TIM, DISABLE, ADC1_ALIGN_RIGHT, ADC1_SCHMITTTRIG_CHANNEL8,
 112                     ; 12 	ENABLE);
 114  0003 4b01          	push	#1
 115  0005 4b08          	push	#8
 116  0007 4b08          	push	#8
 117  0009 4b00          	push	#0
 118  000b 4b00          	push	#0
 119  000d 4b00          	push	#0
 120  000f ae0004        	ldw	x,#4
 121  0012 a601          	ld	a,#1
 122  0014 95            	ld	xh,a
 123  0015 cd0000        	call	_ADC1_Init
 125  0018 5b06          	addw	sp,#6
 126                     ; 13 	ADC1_Cmd(ENABLE);//使能 ADC
 128  001a a601          	ld	a,#1
 129  001c cd0000        	call	_ADC1_Cmd
 131                     ; 14 }
 134  001f 81            	ret
 196                     ; 18 void AcquireEG(void)
 196                     ; 19 {
 197                     .text:	section	.text,new
 198  0000               _AcquireEG:
 200  0000 5207          	subw	sp,#7
 201       00000007      OFST:	set	7
 204                     ; 21 	u8 num = 0;
 206  0002 0f07          	clr	(OFST+0,sp)
 207                     ; 22 	u16 adc_value = 0;
 209  0004 1e01          	ldw	x,(OFST-6,sp)
 210                     ; 24 	ADC1_StartConversion();//启动转换
 212  0006 cd0000        	call	_ADC1_StartConversion
 215  0009 2018          	jra	L501
 216  000b               L311:
 217                     ; 26 		while(ADC1_GetFlagStatus(ADC1_FLAG_EOC)==RESET);//等待转换结束
 219  000b a680          	ld	a,#128
 220  000d cd0000        	call	_ADC1_GetFlagStatus
 222  0010 4d            	tnz	a
 223  0011 27f8          	jreq	L311
 224                     ; 27 		u16_adc1_value[num] = ADC1_GetConversionValue();//获取采样值
 226  0013 cd0000        	call	_ADC1_GetConversionValue
 228  0016 7b07          	ld	a,(OFST+0,sp)
 229  0018 905f          	clrw	y
 230  001a 9097          	ld	yl,a
 231  001c 9058          	sllw	y
 232  001e 90ef20        	ldw	(_u16_adc1_value,y),x
 233                     ; 28 		num++;
 235  0021 0c07          	inc	(OFST+0,sp)
 236  0023               L501:
 237                     ; 25 	while(num < 6){
 239  0023 7b07          	ld	a,(OFST+0,sp)
 240  0025 a106          	cp	a,#6
 241  0027 25e2          	jrult	L311
 242                     ; 30 	adc_value = avrADCValue();
 244  0029 cd0000        	call	_avrADCValue
 246  002c 1f01          	ldw	(OFST-6,sp),x
 247                     ; 31 	AD_Data = (float)(adc_value*3.2258 - 1919.3548);//595*3300/1023
 249  002e 1e01          	ldw	x,(OFST-6,sp)
 250  0030 cd0000        	call	c_uitof
 252  0033 ae0010        	ldw	x,#L321
 253  0036 cd0000        	call	c_fmul
 255  0039 ae000c        	ldw	x,#L331
 256  003c cd0000        	call	c_fsub
 258  003f 96            	ldw	x,sp
 259  0040 1c0003        	addw	x,#OFST-4
 260  0043 cd0000        	call	c_rtol
 262                     ; 32 	current[count++] = AD_Data*0.01;	//1mV对应0.01A
 264  0046 96            	ldw	x,sp
 265  0047 1c0003        	addw	x,#OFST-4
 266  004a cd0000        	call	c_ltor
 268  004d ae0008        	ldw	x,#L341
 269  0050 cd0000        	call	c_fmul
 271  0053 b62c          	ld	a,_count
 272  0055 3c2c          	inc	_count
 273  0057 97            	ld	xl,a
 274  0058 a604          	ld	a,#4
 275  005a 42            	mul	x,a
 276  005b 1c0008        	addw	x,#_current
 277  005e cd0000        	call	c_rtol
 279                     ; 33 	if(count >= 6){
 281  0061 b62c          	ld	a,_count
 282  0063 a106          	cp	a,#6
 283  0065 2545          	jrult	L741
 284                     ; 34 		count = 0;
 286  0067 3f2c          	clr	_count
 287                     ; 35 		avr_current = (current[0]+current[1]+current[2]+current[3]+current[4]+current[5])/6;
 289  0069 ae0008        	ldw	x,#_current
 290  006c cd0000        	call	c_ltor
 292  006f ae000c        	ldw	x,#_current+4
 293  0072 cd0000        	call	c_fadd
 295  0075 ae0010        	ldw	x,#_current+8
 296  0078 cd0000        	call	c_fadd
 298  007b ae0014        	ldw	x,#_current+12
 299  007e cd0000        	call	c_fadd
 301  0081 ae0018        	ldw	x,#_current+16
 302  0084 cd0000        	call	c_fadd
 304  0087 ae001c        	ldw	x,#_current+20
 305  008a cd0000        	call	c_fadd
 307  008d ae0004        	ldw	x,#L551
 308  0090 cd0000        	call	c_fdiv
 310  0093 ae0004        	ldw	x,#_avr_current
 311  0096 cd0000        	call	c_rtol
 313                     ; 36 		rtEG += calcEG_60s(220,avr_current);//电压默认220V
 315  0099 be06          	ldw	x,_avr_current+2
 316  009b 89            	pushw	x
 317  009c be04          	ldw	x,_avr_current
 318  009e 89            	pushw	x
 319  009f a6dc          	ld	a,#220
 320  00a1 cd0000        	call	_calcEG_60s
 322  00a4 5b04          	addw	sp,#4
 323  00a6 ae0000        	ldw	x,#_rtEG
 324  00a9 cd0000        	call	c_fgadd
 326  00ac               L741:
 327                     ; 39 }
 330  00ac 5b07          	addw	sp,#7
 331  00ae 81            	ret
 393                     ; 41 u16 avrADCValue(void)
 393                     ; 42 {
 394                     .text:	section	.text,new
 395  0000               _avrADCValue:
 397  0000 5204          	subw	sp,#4
 398       00000004      OFST:	set	4
 401                     ; 46   for(i=6;i>=1;i--)//外层循环
 403  0002 a606          	ld	a,#6
 404  0004 6b01          	ld	(OFST-3,sp),a
 405  0006               L312:
 406                     ; 48     for(j=0;j<(i-1);j++)//内层循环
 408  0006 0f04          	clr	(OFST+0,sp)
 410  0008 2034          	jra	L522
 411  000a               L122:
 412                     ; 50       if(u16_adc1_value[j]>u16_adc1_value[j+1])//数值比较
 414  000a 7b04          	ld	a,(OFST+0,sp)
 415  000c 5f            	clrw	x
 416  000d 97            	ld	xl,a
 417  000e 58            	sllw	x
 418  000f 7b04          	ld	a,(OFST+0,sp)
 419  0011 905f          	clrw	y
 420  0013 9097          	ld	yl,a
 421  0015 9058          	sllw	y
 422  0017 ee20          	ldw	x,(_u16_adc1_value,x)
 423  0019 90e322        	cpw	x,(_u16_adc1_value+2,y)
 424  001c 231e          	jrule	L132
 425                     ; 52         temp=u16_adc1_value[j];//数值换位
 427  001e 7b04          	ld	a,(OFST+0,sp)
 428  0020 5f            	clrw	x
 429  0021 97            	ld	xl,a
 430  0022 58            	sllw	x
 431  0023 ee20          	ldw	x,(_u16_adc1_value,x)
 432  0025 1f02          	ldw	(OFST-2,sp),x
 433                     ; 53         u16_adc1_value[j]=u16_adc1_value[j+1];
 435  0027 7b04          	ld	a,(OFST+0,sp)
 436  0029 5f            	clrw	x
 437  002a 97            	ld	xl,a
 438  002b 58            	sllw	x
 439  002c 9093          	ldw	y,x
 440  002e 90ee22        	ldw	y,(_u16_adc1_value+2,y)
 441  0031 ef20          	ldw	(_u16_adc1_value,x),y
 442                     ; 54         u16_adc1_value[j+1]=temp;
 444  0033 7b04          	ld	a,(OFST+0,sp)
 445  0035 5f            	clrw	x
 446  0036 97            	ld	xl,a
 447  0037 58            	sllw	x
 448  0038 1602          	ldw	y,(OFST-2,sp)
 449  003a ef22          	ldw	(_u16_adc1_value+2,x),y
 450  003c               L132:
 451                     ; 48     for(j=0;j<(i-1);j++)//内层循环
 453  003c 0c04          	inc	(OFST+0,sp)
 454  003e               L522:
 457  003e 9c            	rvf
 458  003f 7b01          	ld	a,(OFST-3,sp)
 459  0041 5f            	clrw	x
 460  0042 97            	ld	xl,a
 461  0043 5a            	decw	x
 462  0044 7b04          	ld	a,(OFST+0,sp)
 463  0046 905f          	clrw	y
 464  0048 9097          	ld	yl,a
 465  004a 90bf01        	ldw	c_y+1,y
 466  004d b301          	cpw	x,c_y+1
 467  004f 2cb9          	jrsgt	L122
 468                     ; 46   for(i=6;i>=1;i--)//外层循环
 470  0051 0a01          	dec	(OFST-3,sp)
 473  0053 0d01          	tnz	(OFST-3,sp)
 474  0055 26af          	jrne	L312
 475                     ; 60   result=((u16_adc1_value[1]+u16_adc1_value[2]+u16_adc1_value[3]+u16_adc1_value[4])/4);//累加和求平均值
 477  0057 be22          	ldw	x,_u16_adc1_value+2
 478  0059 72bb0024      	addw	x,_u16_adc1_value+4
 479  005d 72bb0026      	addw	x,_u16_adc1_value+6
 480  0061 72bb0028      	addw	x,_u16_adc1_value+8
 481  0065 54            	srlw	x
 482  0066 54            	srlw	x
 483  0067 1f02          	ldw	(OFST-2,sp),x
 484                     ; 61 	return result;
 486  0069 1e02          	ldw	x,(OFST-2,sp)
 489  006b 5b04          	addw	sp,#4
 490  006d 81            	ret
 533                     ; 65 float calcEG_60s(u8 voltage,float current)
 533                     ; 66 {
 534                     .text:	section	.text,new
 535  0000               _calcEG_60s:
 537  0000 88            	push	a
 538       00000000      OFST:	set	0
 541                     ; 67 	return (float)(voltage*current/60);
 543  0001 5f            	clrw	x
 544  0002 97            	ld	xl,a
 545  0003 cd0000        	call	c_itof
 547  0006 96            	ldw	x,sp
 548  0007 1c0004        	addw	x,#OFST+4
 549  000a cd0000        	call	c_fmul
 551  000d ae0000        	ldw	x,#L162
 552  0010 cd0000        	call	c_fdiv
 556  0013 84            	pop	a
 557  0014 81            	ret
 570                     	xdef	_avrADCValue
 571                     	xdef	_calcEG_60s
 572                     	xdef	_AcquireEG
 573                     	xdef	_ADC_init
 574                     	switch	.ubsct
 575  0000               _rtEG:
 576  0000 00000000      	ds.b	4
 577                     	xdef	_rtEG
 578  0004               _avr_current:
 579  0004 00000000      	ds.b	4
 580                     	xdef	_avr_current
 581  0008               _current:
 582  0008 000000000000  	ds.b	24
 583                     	xdef	_current
 584  0020               _u16_adc1_value:
 585  0020 000000000000  	ds.b	12
 586                     	xdef	_u16_adc1_value
 587  002c               _count:
 588  002c 00            	ds.b	1
 589                     	xdef	_count
 590                     	xref	_ADC1_GetFlagStatus
 591                     	xref	_ADC1_GetConversionValue
 592                     	xref	_ADC1_StartConversion
 593                     	xref	_ADC1_Cmd
 594                     	xref	_ADC1_Init
 595                     	xref	_ADC1_DeInit
 596                     .const:	section	.text
 597  0000               L162:
 598  0000 42700000      	dc.w	17008,0
 599  0004               L551:
 600  0004 40c00000      	dc.w	16576,0
 601  0008               L341:
 602  0008 3c23d70a      	dc.w	15395,-10486
 603  000c               L331:
 604  000c 44efeb5a      	dc.w	17647,-5286
 605  0010               L321:
 606  0010 404e7381      	dc.w	16462,29569
 607                     	xref.b	c_y
 627                     	xref	c_itof
 628                     	xref	c_fgadd
 629                     	xref	c_fdiv
 630                     	xref	c_fadd
 631                     	xref	c_ltor
 632                     	xref	c_rtol
 633                     	xref	c_fsub
 634                     	xref	c_fmul
 635                     	xref	c_uitof
 636                     	end
