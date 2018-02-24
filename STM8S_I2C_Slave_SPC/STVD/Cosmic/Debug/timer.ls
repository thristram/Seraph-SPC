   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
 207                     ; 22 void timer2_init(void)
 207                     ; 23 {    
 209                     .text:	section	.text,new
 210  0000               _timer2_init:
 214                     ; 24 	TIM2_TimeBaseInit(TIM2_PRESCALER_64, 2500);
 216  0000 ae09c4        	ldw	x,#2500
 217  0003 89            	pushw	x
 218  0004 a606          	ld	a,#6
 219  0006 cd0000        	call	_TIM2_TimeBaseInit
 221  0009 85            	popw	x
 222                     ; 25 	TIM2_ClearFlag(TIM2_FLAG_UPDATE);
 224  000a ae0001        	ldw	x,#1
 225  000d cd0000        	call	_TIM2_ClearFlag
 227                     ; 26 	TIM2_ITConfig(TIM2_IT_UPDATE, ENABLE);	
 229  0010 ae0001        	ldw	x,#1
 230  0013 a601          	ld	a,#1
 231  0015 95            	ld	xh,a
 232  0016 cd0000        	call	_TIM2_ITConfig
 234                     ; 27 	TIM2_Cmd(ENABLE);	
 236  0019 a601          	ld	a,#1
 237  001b cd0000        	call	_TIM2_Cmd
 239                     ; 29 	Flag1 = 0;
 241  001e 3f03          	clr	_Flag1_
 242                     ; 30 	c_30ms = 0;
 244  0020 3f02          	clr	_c_30ms
 245                     ; 31 	c_1s = 0;
 247  0022 3f00          	clr	_c_1s
 248                     ; 32 	c_100ms = 0;
 250  0024 3f01          	clr	_c_100ms
 251                     ; 34 }
 254  0026 81            	ret
 281                     ; 40 void timer4_init(void)
 281                     ; 41 {    
 282                     .text:	section	.text,new
 283  0000               _timer4_init:
 287                     ; 42 	TIM4_TimeBaseInit(TIM4_PRESCALER_16, 250);
 289  0000 ae00fa        	ldw	x,#250
 290  0003 a604          	ld	a,#4
 291  0005 95            	ld	xh,a
 292  0006 cd0000        	call	_TIM4_TimeBaseInit
 294                     ; 43 	TIM4_ClearFlag(TIM4_FLAG_UPDATE);
 296  0009 a601          	ld	a,#1
 297  000b cd0000        	call	_TIM4_ClearFlag
 299                     ; 44 	TIM4_ITConfig(TIM4_IT_UPDATE, ENABLE);	
 301  000e ae0001        	ldw	x,#1
 302  0011 a601          	ld	a,#1
 303  0013 95            	ld	xh,a
 304  0014 cd0000        	call	_TIM4_ITConfig
 306                     ; 45 	TIM4_Cmd(ENABLE);	
 308  0017 a601          	ld	a,#1
 309  0019 cd0000        	call	_TIM4_Cmd
 311                     ; 47 }
 314  001c 81            	ret
 341                     ; 59 @far @interrupt void Timer2_ISR(void) {
 343                     .text:	section	.text,new
 344  0000               f_Timer2_ISR:
 349                     ; 63 	TIM2->SR1 = 0;
 351  0000 725f5304      	clr	21252
 352                     ; 65 	c_30ms++;	
 354  0004 3c02          	inc	_c_30ms
 355                     ; 66 	if(c_30ms >= 3){
 357  0006 b602          	ld	a,_c_30ms
 358  0008 a103          	cp	a,#3
 359  000a 2506          	jrult	L741
 360                     ; 67 		f_30ms = 1;
 362  000c 72100003      	bset	_Flag1_,#0
 363                     ; 68 		c_30ms = 0;
 365  0010 3f02          	clr	_c_30ms
 366  0012               L741:
 367                     ; 71 	c_1s++;	
 369  0012 3c00          	inc	_c_1s
 370                     ; 72 	if(c_1s >= 100){
 372  0014 b600          	ld	a,_c_1s
 373  0016 a164          	cp	a,#100
 374  0018 2506          	jrult	L151
 375                     ; 73 		f_1s = 1;
 377  001a 72120003      	bset	_Flag1_,#1
 378                     ; 74 		c_1s = 0;
 380  001e 3f00          	clr	_c_1s
 381  0020               L151:
 382                     ; 77 	c_100ms++; 
 384  0020 3c01          	inc	_c_100ms
 385                     ; 78 	if(c_100ms >= 10){
 387  0022 b601          	ld	a,_c_100ms
 388  0024 a10a          	cp	a,#10
 389  0026 2506          	jrult	L351
 390                     ; 79 		f_100ms = 1;
 392  0028 72160003      	bset	_Flag1_,#3
 393                     ; 80 		c_100ms = 0;
 395  002c 3f01          	clr	_c_100ms
 396  002e               L351:
 397                     ; 85 }
 400  002e 80            	iret
 427                     ; 95 @far @interrupt void TIM4InterruptHandle (void) {
 428                     .text:	section	.text,new
 429  0000               f_TIM4InterruptHandle:
 432  0000 3b0002        	push	c_x+2
 433  0003 be00          	ldw	x,c_x
 434  0005 89            	pushw	x
 435  0006 3b0002        	push	c_y+2
 436  0009 be00          	ldw	x,c_y
 437  000b 89            	pushw	x
 440                     ; 100   	TIM4->SR1 = 0;
 442  000c 725f5344      	clr	21316
 443                     ; 102 	ADC1_StartConversion(); 	//启动转换
 445  0010 cd0000        	call	_ADC1_StartConversion
 448  0013               L761:
 449                     ; 103 	while(ADC1_GetFlagStatus(ADC1_FLAG_EOC) == RESET);	//等待转换结束
 451  0013 a680          	ld	a,#128
 452  0015 cd0000        	call	_ADC1_GetFlagStatus
 454  0018 4d            	tnz	a
 455  0019 27f8          	jreq	L761
 456                     ; 104 	adc_sample.valSmp = ADC1_GetConversionValue();		//获取采样值
 458  001b cd0000        	call	_ADC1_GetConversionValue
 460  001e bf00          	ldw	_adc_sample,x
 461                     ; 106 	if(adc_sample.valSmp > adc_sample.valMax){	
 463  0020 be00          	ldw	x,_adc_sample
 464  0022 b302          	cpw	x,_adc_sample+2
 465  0024 2304          	jrule	L371
 466                     ; 107 		adc_sample.valMax = adc_sample.valSmp;
 468  0026 be00          	ldw	x,_adc_sample
 469  0028 bf02          	ldw	_adc_sample+2,x
 470  002a               L371:
 471                     ; 110 	if(adc_sample.valSmp < adc_sample.valMin){	
 473  002a be00          	ldw	x,_adc_sample
 474  002c b304          	cpw	x,_adc_sample+4
 475  002e 2404          	jruge	L571
 476                     ; 111 		adc_sample.valMin = adc_sample.valSmp;
 478  0030 be00          	ldw	x,_adc_sample
 479  0032 bf04          	ldw	_adc_sample+4,x
 480  0034               L571:
 481                     ; 114 }
 484  0034 85            	popw	x
 485  0035 bf00          	ldw	c_y,x
 486  0037 320002        	pop	c_y+2
 487  003a 85            	popw	x
 488  003b bf00          	ldw	c_x,x
 489  003d 320002        	pop	c_x+2
 490  0040 80            	iret
 502                     	xref.b	_adc_sample
 503                     	xdef	f_Timer2_ISR
 504                     	xdef	f_TIM4InterruptHandle
 505                     	xdef	_timer4_init
 506                     	xdef	_timer2_init
 507                     	switch	.ubsct
 508  0000               _c_1s:
 509  0000 00            	ds.b	1
 510                     	xdef	_c_1s
 511  0001               _c_100ms:
 512  0001 00            	ds.b	1
 513                     	xdef	_c_100ms
 514  0002               _c_30ms:
 515  0002 00            	ds.b	1
 516                     	xdef	_c_30ms
 517  0003               _Flag1_:
 518  0003 00            	ds.b	1
 519                     	xdef	_Flag1_
 520                     	xref	_TIM4_ClearFlag
 521                     	xref	_TIM4_ITConfig
 522                     	xref	_TIM4_Cmd
 523                     	xref	_TIM4_TimeBaseInit
 524                     	xref	_TIM2_ClearFlag
 525                     	xref	_TIM2_ITConfig
 526                     	xref	_TIM2_Cmd
 527                     	xref	_TIM2_TimeBaseInit
 528                     	xref	_ADC1_GetFlagStatus
 529                     	xref	_ADC1_GetConversionValue
 530                     	xref	_ADC1_StartConversion
 531                     	xref.b	c_x
 532                     	xref.b	c_y
 552                     	end
