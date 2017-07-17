   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
 269                     ; 6 void ADC_init(void)
 269                     ; 7 {
 271                     .text:	section	.text,new
 272  0000               _ADC_init:
 276                     ; 8 	ADC1_DeInit();
 278  0000 cd0000        	call	_ADC1_DeInit
 280                     ; 10 	ADC1_Init(ADC1_CONVERSIONMODE_CONTINUOUS, ADC1_CHANNEL_4, ADC1_PRESSEL_FCPU_D2,
 280                     ; 11 	ADC1_EXTTRIG_TIM, DISABLE, ADC1_ALIGN_RIGHT, ADC1_SCHMITTTRIG_CHANNEL8,
 280                     ; 12 	ENABLE);
 282  0003 4b01          	push	#1
 283  0005 4b08          	push	#8
 284  0007 4b08          	push	#8
 285  0009 4b00          	push	#0
 286  000b 4b00          	push	#0
 287  000d 4b00          	push	#0
 288  000f ae0004        	ldw	x,#4
 289  0012 a601          	ld	a,#1
 290  0014 95            	ld	xh,a
 291  0015 cd0000        	call	_ADC1_Init
 293  0018 5b06          	addw	sp,#6
 294                     ; 13 	ADC1_Cmd(ENABLE);//使能 ADC
 296  001a a601          	ld	a,#1
 297  001c cd0000        	call	_ADC1_Cmd
 299                     ; 14 }
 302  001f 81            	ret
 351                     ; 67 void AcquireEG(void)
 351                     ; 68 {
 352                     .text:	section	.text,new
 353  0000               _AcquireEG:
 355  0000 5206          	subw	sp,#6
 356       00000006      OFST:	set	6
 359                     ; 70 	u16 adc_value = 0;
 361  0002 5f            	clrw	x
 362  0003 1f01          	ldw	(OFST-5,sp),x
 363                     ; 72 	AD_Data = (float)(get_adc_value()*3.2258);//get_adc_value()*3300/1023 单位为mV
 365  0005 cd0000        	call	_get_adc_value
 367  0008 cd0000        	call	c_uitof
 369  000b ae000c        	ldw	x,#L112
 370  000e cd0000        	call	c_fmul
 372  0011 96            	ldw	x,sp
 373  0012 1c0003        	addw	x,#OFST-3
 374  0015 cd0000        	call	c_rtol
 376                     ; 73 	current[count++] = AD_Data*0.0122;	//1mV对应0.01A，因采样到的电压是已经分压的了，要乘以12.2/10，单位为A
 378  0018 96            	ldw	x,sp
 379  0019 1c0003        	addw	x,#OFST-3
 380  001c cd0000        	call	c_ltor
 382  001f ae0008        	ldw	x,#L122
 383  0022 cd0000        	call	c_fmul
 385  0025 b65f          	ld	a,_count
 386  0027 3c5f          	inc	_count
 387  0029 97            	ld	xl,a
 388  002a a604          	ld	a,#4
 389  002c 42            	mul	x,a
 390  002d 1c003b        	addw	x,#_current
 391  0030 cd0000        	call	c_rtol
 393                     ; 74 	if(count >= 6){
 395  0033 b65f          	ld	a,_count
 396  0035 a106          	cp	a,#6
 397  0037 2545          	jrult	L522
 398                     ; 75 		count = 0;
 400  0039 3f5f          	clr	_count
 401                     ; 76 		avr_current = (current[0]+current[1]+current[2]+current[3]+current[4]+current[5])/6;
 403  003b ae003b        	ldw	x,#_current
 404  003e cd0000        	call	c_ltor
 406  0041 ae003f        	ldw	x,#_current+4
 407  0044 cd0000        	call	c_fadd
 409  0047 ae0043        	ldw	x,#_current+8
 410  004a cd0000        	call	c_fadd
 412  004d ae0047        	ldw	x,#_current+12
 413  0050 cd0000        	call	c_fadd
 415  0053 ae004b        	ldw	x,#_current+16
 416  0056 cd0000        	call	c_fadd
 418  0059 ae004f        	ldw	x,#_current+20
 419  005c cd0000        	call	c_fadd
 421  005f ae0004        	ldw	x,#L332
 422  0062 cd0000        	call	c_fdiv
 424  0065 ae0037        	ldw	x,#_avr_current
 425  0068 cd0000        	call	c_rtol
 427                     ; 77 		rtEG += calcEG_60s(220,avr_current);//电压默认220V
 429  006b be39          	ldw	x,_avr_current+2
 430  006d 89            	pushw	x
 431  006e be37          	ldw	x,_avr_current
 432  0070 89            	pushw	x
 433  0071 a6dc          	ld	a,#220
 434  0073 cd0000        	call	_calcEG_60s
 436  0076 5b04          	addw	sp,#4
 437  0078 ae0033        	ldw	x,#_rtEG
 438  007b cd0000        	call	c_fgadd
 440  007e               L522:
 441                     ; 80 }
 444  007e 5b06          	addw	sp,#6
 445  0080 81            	ret
 486                     ; 90 u16 get_adc_value(void)
 486                     ; 91 {
 487                     .text:	section	.text,new
 488  0000               _get_adc_value:
 490  0000 89            	pushw	x
 491       00000002      OFST:	set	2
 494                     ; 92 	u16 adc_value = 0;
 496  0001 5f            	clrw	x
 497  0002 1f01          	ldw	(OFST-1,sp),x
 499  0004 2033          	jra	L162
 500  0006               L562:
 501                     ; 97 			ADC1_StartConversion();//启动转换
 503  0006 cd0000        	call	_ADC1_StartConversion
 506  0009               L372:
 507                     ; 98 			while(ADC1_GetFlagStatus(ADC1_FLAG_EOC)==RESET);//等待转换结束
 509  0009 a680          	ld	a,#128
 510  000b cd0000        	call	_ADC1_GetFlagStatus
 512  000e 4d            	tnz	a
 513  000f 27f8          	jreq	L372
 514                     ; 99 			adc_value = ADC1_GetConversionValue();//获取采样值
 516  0011 cd0000        	call	_ADC1_GetConversionValue
 518  0014 1f01          	ldw	(OFST-1,sp),x
 519                     ; 100 			if((adc_value >= 550)&&(adc_value <= 600))	//说明采样到的值在零点582附近，认为刚过零点
 521  0016 1e01          	ldw	x,(OFST-1,sp)
 522  0018 a30226        	cpw	x,#550
 523  001b 25e9          	jrult	L562
 525  001d 1e01          	ldw	x,(OFST-1,sp)
 526  001f a30259        	cpw	x,#601
 527  0022 24e2          	jruge	L562
 528                     ; 101 				break;
 529                     ; 103 		TIM2_Cmd(ENABLE);//开启TIM2定时器，每500us进入一次中断
 531  0024 a601          	ld	a,#1
 532  0026 cd0000        	call	_TIM2_Cmd
 534                     ; 104 		adc_result[sample_num] = deal_adc_value();
 536  0029 cd0000        	call	_deal_adc_value
 538  002c b631          	ld	a,_sample_num
 539  002e 905f          	clrw	y
 540  0030 9097          	ld	yl,a
 541  0032 9058          	sllw	y
 542  0034 90ef03        	ldw	(_adc_result,y),x
 543                     ; 105 		sample_num++;
 545  0037 3c31          	inc	_sample_num
 546  0039               L162:
 547                     ; 93 	while(sample_num < 3){
 549  0039 b631          	ld	a,_sample_num
 550  003b a103          	cp	a,#3
 551  003d 25c7          	jrult	L562
 552                     ; 107 	sample_num = 0;
 554  003f 3f31          	clr	_sample_num
 555                     ; 108 	return (adc_result[0] + adc_result[1] + adc_result[2]) / 3;
 557  0041 be03          	ldw	x,_adc_result
 558  0043 72bb0005      	addw	x,_adc_result+2
 559  0047 72bb0007      	addw	x,_adc_result+4
 560  004b a603          	ld	a,#3
 561  004d 62            	div	x,a
 564  004e 5b02          	addw	sp,#2
 565  0050 81            	ret
 619                     ; 113 u16 deal_adc_value(void)
 619                     ; 114 {
 620                     .text:	section	.text,new
 621  0000               _deal_adc_value:
 623  0000 5204          	subw	sp,#4
 624       00000004      OFST:	set	4
 627  0002               L133:
 628                     ; 117 	while(!single_sample_finish);//等待采样结束
 630  0002 b600          	ld	a,_Flag2_
 631  0004 a501          	bcp	a,#1
 632  0006 27fa          	jreq	L133
 633                     ; 118 	single_sample_finish = 0;
 635  0008 72110000      	bres	_Flag2_,#0
 636                     ; 119 	for(i=20;i>=1;i--)//外层循环
 638  000c a614          	ld	a,#20
 639  000e 6b03          	ld	(OFST-1,sp),a
 640  0010               L533:
 641                     ; 121 		for(j=0;j<(i-1);j++)//内层循环
 643  0010 0f04          	clr	(OFST+0,sp)
 645  0012 2034          	jra	L743
 646  0014               L343:
 647                     ; 123 			if(adc_value[j]>adc_value[j+1])//数值比较
 649  0014 7b04          	ld	a,(OFST+0,sp)
 650  0016 5f            	clrw	x
 651  0017 97            	ld	xl,a
 652  0018 58            	sllw	x
 653  0019 7b04          	ld	a,(OFST+0,sp)
 654  001b 905f          	clrw	y
 655  001d 9097          	ld	yl,a
 656  001f 9058          	sllw	y
 657  0021 ee09          	ldw	x,(_adc_value,x)
 658  0023 90e30b        	cpw	x,(_adc_value+2,y)
 659  0026 231e          	jrule	L353
 660                     ; 125 				temp=adc_value[j];//数值换位
 662  0028 7b04          	ld	a,(OFST+0,sp)
 663  002a 5f            	clrw	x
 664  002b 97            	ld	xl,a
 665  002c 58            	sllw	x
 666  002d ee09          	ldw	x,(_adc_value,x)
 667  002f 1f01          	ldw	(OFST-3,sp),x
 668                     ; 126 				adc_value[j]=adc_value[j+1];
 670  0031 7b04          	ld	a,(OFST+0,sp)
 671  0033 5f            	clrw	x
 672  0034 97            	ld	xl,a
 673  0035 58            	sllw	x
 674  0036 9093          	ldw	y,x
 675  0038 90ee0b        	ldw	y,(_adc_value+2,y)
 676  003b ef09          	ldw	(_adc_value,x),y
 677                     ; 127 				adc_value[j+1]=temp;
 679  003d 7b04          	ld	a,(OFST+0,sp)
 680  003f 5f            	clrw	x
 681  0040 97            	ld	xl,a
 682  0041 58            	sllw	x
 683  0042 1601          	ldw	y,(OFST-3,sp)
 684  0044 ef0b          	ldw	(_adc_value+2,x),y
 685  0046               L353:
 686                     ; 121 		for(j=0;j<(i-1);j++)//内层循环
 688  0046 0c04          	inc	(OFST+0,sp)
 689  0048               L743:
 692  0048 9c            	rvf
 693  0049 7b03          	ld	a,(OFST-1,sp)
 694  004b 5f            	clrw	x
 695  004c 97            	ld	xl,a
 696  004d 5a            	decw	x
 697  004e 7b04          	ld	a,(OFST+0,sp)
 698  0050 905f          	clrw	y
 699  0052 9097          	ld	yl,a
 700  0054 90bf01        	ldw	c_y+1,y
 701  0057 b301          	cpw	x,c_y+1
 702  0059 2cb9          	jrsgt	L343
 703                     ; 119 	for(i=20;i>=1;i--)//外层循环
 705  005b 0a03          	dec	(OFST-1,sp)
 708  005d 0d03          	tnz	(OFST-1,sp)
 709  005f 26af          	jrne	L533
 710                     ; 131 	return((adc_value[19]+adc_value[0])/2);//返回幅值
 712  0061 be2f          	ldw	x,_adc_value+38
 713  0063 72bb0009      	addw	x,_adc_value
 714  0067 54            	srlw	x
 717  0068 5b04          	addw	sp,#4
 718  006a 81            	ret
 761                     ; 135 float calcEG_60s(u8 voltage,float current)
 761                     ; 136 {
 762                     .text:	section	.text,new
 763  0000               _calcEG_60s:
 765  0000 88            	push	a
 766       00000000      OFST:	set	0
 769                     ; 137 	return (float)(voltage*current/60);
 771  0001 5f            	clrw	x
 772  0002 97            	ld	xl,a
 773  0003 cd0000        	call	c_itof
 775  0006 96            	ldw	x,sp
 776  0007 1c0004        	addw	x,#OFST+4
 777  000a cd0000        	call	c_fmul
 779  000d ae0000        	ldw	x,#L304
 780  0010 cd0000        	call	c_fdiv
 784  0013 84            	pop	a
 785  0014 81            	ret
 798                     	xdef	_calcEG_60s
 799                     	xdef	_get_adc_value
 800                     	xdef	_deal_adc_value
 801                     	xdef	_AcquireEG
 802                     	xdef	_ADC_init
 803                     	switch	.ubsct
 804  0000               _Flag2_:
 805  0000 00            	ds.b	1
 806                     	xdef	_Flag2_
 807  0001               _avr_adc_result:
 808  0001 0000          	ds.b	2
 809                     	xdef	_avr_adc_result
 810  0003               _adc_result:
 811  0003 000000000000  	ds.b	6
 812                     	xdef	_adc_result
 813  0009               _adc_value:
 814  0009 000000000000  	ds.b	40
 815                     	xdef	_adc_value
 816  0031               _sample_num:
 817  0031 00            	ds.b	1
 818                     	xdef	_sample_num
 819  0032               _sample_cnt:
 820  0032 00            	ds.b	1
 821                     	xdef	_sample_cnt
 822  0033               _rtEG:
 823  0033 00000000      	ds.b	4
 824                     	xdef	_rtEG
 825  0037               _avr_current:
 826  0037 00000000      	ds.b	4
 827                     	xdef	_avr_current
 828  003b               _current:
 829  003b 000000000000  	ds.b	24
 830                     	xdef	_current
 831  0053               _u16_adc1_value:
 832  0053 000000000000  	ds.b	12
 833                     	xdef	_u16_adc1_value
 834  005f               _count:
 835  005f 00            	ds.b	1
 836                     	xdef	_count
 837                     	xref	_TIM2_Cmd
 838                     	xref	_ADC1_GetFlagStatus
 839                     	xref	_ADC1_GetConversionValue
 840                     	xref	_ADC1_StartConversion
 841                     	xref	_ADC1_Cmd
 842                     	xref	_ADC1_Init
 843                     	xref	_ADC1_DeInit
 844                     .const:	section	.text
 845  0000               L304:
 846  0000 42700000      	dc.w	17008,0
 847  0004               L332:
 848  0004 40c00000      	dc.w	16576,0
 849  0008               L122:
 850  0008 3c47e282      	dc.w	15431,-7550
 851  000c               L112:
 852  000c 404e7381      	dc.w	16462,29569
 853                     	xref.b	c_y
 873                     	xref	c_itof
 874                     	xref	c_fgadd
 875                     	xref	c_fdiv
 876                     	xref	c_fadd
 877                     	xref	c_ltor
 878                     	xref	c_rtol
 879                     	xref	c_fmul
 880                     	xref	c_uitof
 881                     	end
