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
 369                     ; 67 void AcquireEG(void)
 369                     ; 68 {
 370                     .text:	section	.text,new
 371  0000               _AcquireEG:
 373  0000 520c          	subw	sp,#12
 374       0000000c      OFST:	set	12
 377                     ; 69 	u8 i,j=0;
 379  0002 0f0b          	clr	(OFST-1,sp)
 380                     ; 70 	u16 adc_value = 0;
 382  0004 5f            	clrw	x
 383  0005 1f05          	ldw	(OFST-7,sp),x
 384                     ; 72 	AD_Data = (float)((get_adc_value()-588)*3.2258);//get_adc_value()*3300/1023 单位为mV
 386  0007 cd0000        	call	_get_adc_value
 388  000a 1d024c        	subw	x,#588
 389  000d cd0000        	call	c_uitof
 391  0010 ae000c        	ldw	x,#L122
 392  0013 cd0000        	call	c_fmul
 394  0016 96            	ldw	x,sp
 395  0017 1c0007        	addw	x,#OFST-5
 396  001a cd0000        	call	c_rtol
 398                     ; 73 	current[count++] = AD_Data*0.0122;	//1mV对应0.01A，因采样到的电压是已经分压的了，要乘以12.2/10，单位为A
 400  001d 96            	ldw	x,sp
 401  001e 1c0007        	addw	x,#OFST-5
 402  0021 cd0000        	call	c_ltor
 404  0024 ae0008        	ldw	x,#L132
 405  0027 cd0000        	call	c_fmul
 407  002a b65f          	ld	a,_count
 408  002c 3c5f          	inc	_count
 409  002e 97            	ld	xl,a
 410  002f a604          	ld	a,#4
 411  0031 42            	mul	x,a
 412  0032 1c003b        	addw	x,#_current
 413  0035 cd0000        	call	c_rtol
 415                     ; 74 	if(count >= 6){
 417  0038 b65f          	ld	a,_count
 418  003a a106          	cp	a,#6
 419  003c 2403          	jruge	L01
 420  003e cc00c8        	jp	L532
 421  0041               L01:
 422                     ; 75 		count = 0;
 424  0041 3f5f          	clr	_count
 425                     ; 76 		for(i = 0; i < 6; i++){
 427  0043 0f0c          	clr	(OFST+0,sp)
 428  0045               L732:
 429                     ; 77 			if((current[i] > 0.1)&&(current[i] < 20)) {//做保护,当电流超过0.1A且小于量程20A才认为有负载
 431  0045 9c            	rvf
 432  0046 7b0c          	ld	a,(OFST+0,sp)
 433  0048 97            	ld	xl,a
 434  0049 a604          	ld	a,#4
 435  004b 42            	mul	x,a
 436  004c 1c003b        	addw	x,#_current
 437  004f cd0000        	call	c_ltor
 439  0052 ae0004        	ldw	x,#L352
 440  0055 cd0000        	call	c_fcmp
 442  0058 2d36          	jrsle	L542
 444  005a 9c            	rvf
 445  005b a614          	ld	a,#20
 446  005d cd0000        	call	c_ctof
 448  0060 96            	ldw	x,sp
 449  0061 1c0001        	addw	x,#OFST-11
 450  0064 cd0000        	call	c_rtol
 452  0067 7b0c          	ld	a,(OFST+0,sp)
 453  0069 97            	ld	xl,a
 454  006a a604          	ld	a,#4
 455  006c 42            	mul	x,a
 456  006d 1c003b        	addw	x,#_current
 457  0070 cd0000        	call	c_ltor
 459  0073 96            	ldw	x,sp
 460  0074 1c0001        	addw	x,#OFST-11
 461  0077 cd0000        	call	c_fcmp
 463  007a 2e14          	jrsge	L542
 464                     ; 78 				avr_current += current[i];
 466  007c 7b0c          	ld	a,(OFST+0,sp)
 467  007e 97            	ld	xl,a
 468  007f a604          	ld	a,#4
 469  0081 42            	mul	x,a
 470  0082 1c003b        	addw	x,#_current
 471  0085 cd0000        	call	c_ltor
 473  0088 ae0037        	ldw	x,#_avr_current
 474  008b cd0000        	call	c_fgadd
 476                     ; 79 				j++;
 478  008e 0c0b          	inc	(OFST-1,sp)
 479  0090               L542:
 480                     ; 76 		for(i = 0; i < 6; i++){
 482  0090 0c0c          	inc	(OFST+0,sp)
 485  0092 7b0c          	ld	a,(OFST+0,sp)
 486  0094 a106          	cp	a,#6
 487  0096 25ad          	jrult	L732
 488                     ; 82 		if(j == 0)
 490  0098 0d0b          	tnz	(OFST-1,sp)
 491  009a 260c          	jrne	L752
 492                     ; 83 			avr_current = 0;
 494  009c ae0000        	ldw	x,#0
 495  009f bf39          	ldw	_avr_current+2,x
 496  00a1 ae0000        	ldw	x,#0
 497  00a4 bf37          	ldw	_avr_current,x
 499  00a6 200d          	jra	L162
 500  00a8               L752:
 501                     ; 85 			avr_current = avr_current / j;
 503  00a8 7b0b          	ld	a,(OFST-1,sp)
 504  00aa 5f            	clrw	x
 505  00ab 97            	ld	xl,a
 506  00ac cd0000        	call	c_itof
 508  00af ae0037        	ldw	x,#_avr_current
 509  00b2 cd0000        	call	c_fgdiv
 511  00b5               L162:
 512                     ; 86 		rtEG += calcEG_60s(220,avr_current);//电压默认220V
 514  00b5 be39          	ldw	x,_avr_current+2
 515  00b7 89            	pushw	x
 516  00b8 be37          	ldw	x,_avr_current
 517  00ba 89            	pushw	x
 518  00bb a6dc          	ld	a,#220
 519  00bd cd0000        	call	_calcEG_60s
 521  00c0 5b04          	addw	sp,#4
 522  00c2 ae0033        	ldw	x,#_rtEG
 523  00c5 cd0000        	call	c_fgadd
 525  00c8               L532:
 526                     ; 89 }
 529  00c8 5b0c          	addw	sp,#12
 530  00ca 81            	ret
 571                     ; 99 u16 get_adc_value(void)
 571                     ; 100 {
 572                     .text:	section	.text,new
 573  0000               _get_adc_value:
 575  0000 89            	pushw	x
 576       00000002      OFST:	set	2
 579                     ; 101 	u16 adc_value = 0;
 581  0001 5f            	clrw	x
 582  0002 1f01          	ldw	(OFST-1,sp),x
 584  0004 2033          	jra	L503
 585  0006               L113:
 586                     ; 106 			ADC1_StartConversion();//启动转换
 588  0006 cd0000        	call	_ADC1_StartConversion
 591  0009               L713:
 592                     ; 107 			while(ADC1_GetFlagStatus(ADC1_FLAG_EOC)==RESET);//等待转换结束
 594  0009 a680          	ld	a,#128
 595  000b cd0000        	call	_ADC1_GetFlagStatus
 597  000e 4d            	tnz	a
 598  000f 27f8          	jreq	L713
 599                     ; 108 			adc_value = ADC1_GetConversionValue();//获取采样值
 601  0011 cd0000        	call	_ADC1_GetConversionValue
 603  0014 1f01          	ldw	(OFST-1,sp),x
 604                     ; 109 			if((adc_value >= 550)&&(adc_value <= 600))	//说明采样到的值在零点582附近，认为刚过零点
 606  0016 1e01          	ldw	x,(OFST-1,sp)
 607  0018 a30226        	cpw	x,#550
 608  001b 25e9          	jrult	L113
 610  001d 1e01          	ldw	x,(OFST-1,sp)
 611  001f a30259        	cpw	x,#601
 612  0022 24e2          	jruge	L113
 613                     ; 110 				break;
 614                     ; 112 		TIM2_Cmd(ENABLE);//开启TIM2定时器，每500us进入一次中断
 616  0024 a601          	ld	a,#1
 617  0026 cd0000        	call	_TIM2_Cmd
 619                     ; 113 		adc_result[sample_num] = deal_adc_value();
 621  0029 cd0000        	call	_deal_adc_value
 623  002c b631          	ld	a,_sample_num
 624  002e 905f          	clrw	y
 625  0030 9097          	ld	yl,a
 626  0032 9058          	sllw	y
 627  0034 90ef03        	ldw	(_adc_result,y),x
 628                     ; 114 		sample_num++;
 630  0037 3c31          	inc	_sample_num
 631  0039               L503:
 632                     ; 102 	while(sample_num < 3){
 634  0039 b631          	ld	a,_sample_num
 635  003b a103          	cp	a,#3
 636  003d 25c7          	jrult	L113
 637                     ; 116 	sample_num = 0;
 639  003f 3f31          	clr	_sample_num
 640                     ; 117 	return ((adc_result[0] + adc_result[1] + adc_result[2]) / 3);
 642  0041 be03          	ldw	x,_adc_result
 643  0043 72bb0005      	addw	x,_adc_result+2
 644  0047 72bb0007      	addw	x,_adc_result+4
 645  004b a603          	ld	a,#3
 646  004d 62            	div	x,a
 649  004e 5b02          	addw	sp,#2
 650  0050 81            	ret
 704                     ; 122 u16 deal_adc_value(void)
 704                     ; 123 {
 705                     .text:	section	.text,new
 706  0000               _deal_adc_value:
 708  0000 5204          	subw	sp,#4
 709       00000004      OFST:	set	4
 712  0002               L553:
 713                     ; 126 	while(!single_sample_finish);//等待采样结束
 715  0002 b600          	ld	a,_Flag2_
 716  0004 a501          	bcp	a,#1
 717  0006 27fa          	jreq	L553
 718                     ; 127 	single_sample_finish = 0;
 720  0008 72110000      	bres	_Flag2_,#0
 721                     ; 128 	for(i=20;i>=1;i--)//外层循环
 723  000c a614          	ld	a,#20
 724  000e 6b03          	ld	(OFST-1,sp),a
 725  0010               L163:
 726                     ; 130 		for(j=0;j<(i-1);j++)//内层循环
 728  0010 0f04          	clr	(OFST+0,sp)
 730  0012 2034          	jra	L373
 731  0014               L763:
 732                     ; 132 			if(adc_value[j]>adc_value[j+1])//数值比较
 734  0014 7b04          	ld	a,(OFST+0,sp)
 735  0016 5f            	clrw	x
 736  0017 97            	ld	xl,a
 737  0018 58            	sllw	x
 738  0019 7b04          	ld	a,(OFST+0,sp)
 739  001b 905f          	clrw	y
 740  001d 9097          	ld	yl,a
 741  001f 9058          	sllw	y
 742  0021 ee09          	ldw	x,(_adc_value,x)
 743  0023 90e30b        	cpw	x,(_adc_value+2,y)
 744  0026 231e          	jrule	L773
 745                     ; 134 				temp=adc_value[j];//数值换位
 747  0028 7b04          	ld	a,(OFST+0,sp)
 748  002a 5f            	clrw	x
 749  002b 97            	ld	xl,a
 750  002c 58            	sllw	x
 751  002d ee09          	ldw	x,(_adc_value,x)
 752  002f 1f01          	ldw	(OFST-3,sp),x
 753                     ; 135 				adc_value[j]=adc_value[j+1];
 755  0031 7b04          	ld	a,(OFST+0,sp)
 756  0033 5f            	clrw	x
 757  0034 97            	ld	xl,a
 758  0035 58            	sllw	x
 759  0036 9093          	ldw	y,x
 760  0038 90ee0b        	ldw	y,(_adc_value+2,y)
 761  003b ef09          	ldw	(_adc_value,x),y
 762                     ; 136 				adc_value[j+1]=temp;
 764  003d 7b04          	ld	a,(OFST+0,sp)
 765  003f 5f            	clrw	x
 766  0040 97            	ld	xl,a
 767  0041 58            	sllw	x
 768  0042 1601          	ldw	y,(OFST-3,sp)
 769  0044 ef0b          	ldw	(_adc_value+2,x),y
 770  0046               L773:
 771                     ; 130 		for(j=0;j<(i-1);j++)//内层循环
 773  0046 0c04          	inc	(OFST+0,sp)
 774  0048               L373:
 777  0048 9c            	rvf
 778  0049 7b03          	ld	a,(OFST-1,sp)
 779  004b 5f            	clrw	x
 780  004c 97            	ld	xl,a
 781  004d 5a            	decw	x
 782  004e 7b04          	ld	a,(OFST+0,sp)
 783  0050 905f          	clrw	y
 784  0052 9097          	ld	yl,a
 785  0054 90bf01        	ldw	c_y+1,y
 786  0057 b301          	cpw	x,c_y+1
 787  0059 2cb9          	jrsgt	L763
 788                     ; 128 	for(i=20;i>=1;i--)//外层循环
 790  005b 0a03          	dec	(OFST-1,sp)
 793  005d 0d03          	tnz	(OFST-1,sp)
 794  005f 26af          	jrne	L163
 795                     ; 140 	return((adc_value[19]+adc_value[0])/2);//返回幅值
 797  0061 be2f          	ldw	x,_adc_value+38
 798  0063 72bb0009      	addw	x,_adc_value
 799  0067 54            	srlw	x
 802  0068 5b04          	addw	sp,#4
 803  006a 81            	ret
 846                     ; 144 float calcEG_60s(u8 voltage,float current)
 846                     ; 145 {
 847                     .text:	section	.text,new
 848  0000               _calcEG_60s:
 850  0000 88            	push	a
 851       00000000      OFST:	set	0
 854                     ; 146 	return (float)(voltage*current/60);
 856  0001 5f            	clrw	x
 857  0002 97            	ld	xl,a
 858  0003 cd0000        	call	c_itof
 860  0006 96            	ldw	x,sp
 861  0007 1c0004        	addw	x,#OFST+4
 862  000a cd0000        	call	c_fmul
 864  000d ae0000        	ldw	x,#L724
 865  0010 cd0000        	call	c_fdiv
 869  0013 84            	pop	a
 870  0014 81            	ret
 883                     	xdef	_calcEG_60s
 884                     	xdef	_get_adc_value
 885                     	xdef	_deal_adc_value
 886                     	xdef	_AcquireEG
 887                     	xdef	_ADC_init
 888                     	switch	.ubsct
 889  0000               _Flag2_:
 890  0000 00            	ds.b	1
 891                     	xdef	_Flag2_
 892  0001               _avr_adc_result:
 893  0001 0000          	ds.b	2
 894                     	xdef	_avr_adc_result
 895  0003               _adc_result:
 896  0003 000000000000  	ds.b	6
 897                     	xdef	_adc_result
 898  0009               _adc_value:
 899  0009 000000000000  	ds.b	40
 900                     	xdef	_adc_value
 901  0031               _sample_num:
 902  0031 00            	ds.b	1
 903                     	xdef	_sample_num
 904  0032               _sample_cnt:
 905  0032 00            	ds.b	1
 906                     	xdef	_sample_cnt
 907  0033               _rtEG:
 908  0033 00000000      	ds.b	4
 909                     	xdef	_rtEG
 910  0037               _avr_current:
 911  0037 00000000      	ds.b	4
 912                     	xdef	_avr_current
 913  003b               _current:
 914  003b 000000000000  	ds.b	24
 915                     	xdef	_current
 916  0053               _u16_adc1_value:
 917  0053 000000000000  	ds.b	12
 918                     	xdef	_u16_adc1_value
 919  005f               _count:
 920  005f 00            	ds.b	1
 921                     	xdef	_count
 922                     	xref	_TIM2_Cmd
 923                     	xref	_ADC1_GetFlagStatus
 924                     	xref	_ADC1_GetConversionValue
 925                     	xref	_ADC1_StartConversion
 926                     	xref	_ADC1_Cmd
 927                     	xref	_ADC1_Init
 928                     	xref	_ADC1_DeInit
 929                     .const:	section	.text
 930  0000               L724:
 931  0000 42700000      	dc.w	17008,0
 932  0004               L352:
 933  0004 3dcccccc      	dc.w	15820,-13108
 934  0008               L132:
 935  0008 3c47e282      	dc.w	15431,-7550
 936  000c               L122:
 937  000c 404e7381      	dc.w	16462,29569
 938                     	xref.b	c_y
 958                     	xref	c_fdiv
 959                     	xref	c_fgdiv
 960                     	xref	c_itof
 961                     	xref	c_fgadd
 962                     	xref	c_ctof
 963                     	xref	c_fcmp
 964                     	xref	c_ltor
 965                     	xref	c_rtol
 966                     	xref	c_fmul
 967                     	xref	c_uitof
 968                     	end
