   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
 190                     ; 21 void Init_Time4(void)
 190                     ; 22 {
 192                     .text:	section	.text,new
 193  0000               _Init_Time4:
 197                     ; 24 	TIM4->PSCR = 0x06;//分频值 8M/2^5 = 250K 
 199  0000 35065347      	mov	21319,#6
 200                     ; 25 	TIM4->IER = 0x01;//使能触发中断
 202  0004 35015343      	mov	21315,#1
 203                     ; 26 	TIM4->CNTR = 250;//250*(1/250K) = 0.001s
 205  0008 35fa5346      	mov	21318,#250
 206                     ; 27 	TIM4->ARR = 249;//自动重装的值
 208  000c 35f95348      	mov	21320,#249
 209                     ; 31 	TIM4->IER = 0x01;     // Enable interrupt
 211  0010 35015343      	mov	21315,#1
 212                     ; 32   TIM4->CR1 = 0x01;     // Start timer
 214  0014 35015340      	mov	21312,#1
 215                     ; 33 }
 218  0018 81            	ret
 244                     ; 36 void TIMER2_Init(void)
 244                     ; 37 {    
 245                     .text:	section	.text,new
 246  0000               _TIMER2_Init:
 250                     ; 38 	TIM2_TimeBaseInit(TIM2_PRESCALER_16, 500);
 252  0000 ae01f4        	ldw	x,#500
 253  0003 89            	pushw	x
 254  0004 a604          	ld	a,#4
 255  0006 cd0000        	call	_TIM2_TimeBaseInit
 257  0009 85            	popw	x
 258                     ; 39 	TIM2_ClearFlag(TIM2_FLAG_UPDATE);
 260  000a ae0001        	ldw	x,#1
 261  000d cd0000        	call	_TIM2_ClearFlag
 263                     ; 40 	TIM2_ITConfig(TIM2_IT_UPDATE, ENABLE);	   
 265  0010 ae0001        	ldw	x,#1
 266  0013 a601          	ld	a,#1
 267  0015 95            	ld	xh,a
 268  0016 cd0000        	call	_TIM2_ITConfig
 270                     ; 41 }
 273  0019 81            	ret
 298                     ; 49 void Sys_Time_Manage(void)
 298                     ; 50 {
 299                     .text:	section	.text,new
 300  0000               _Sys_Time_Manage:
 304                     ; 59 	systime_count++;
 306  0000 be00          	ldw	x,_systime_count
 307  0002 1c0001        	addw	x,#1
 308  0005 bf00          	ldw	_systime_count,x
 309                     ; 60 	if (systime_count >= 1000)
 311  0007 be00          	ldw	x,_systime_count
 312  0009 a303e8        	cpw	x,#1000
 313  000c 2507          	jrult	L341
 314                     ; 62 		systime_count = 0;
 316  000e 5f            	clrw	x
 317  000f bf00          	ldw	_systime_count,x
 318                     ; 63 		f_1s = 1;
 320  0011 72140003      	bset	_Flag1_,#2
 321  0015               L341:
 322                     ; 65 }
 325  0015 81            	ret
 355                     ; 71 @far @interrupt void Timer2_ISR(void) {
 357                     .text:	section	.text,new
 358  0000               f_Timer2_ISR:
 361  0000 3b0002        	push	c_x+2
 362  0003 be00          	ldw	x,c_x
 363  0005 89            	pushw	x
 364  0006 3b0002        	push	c_y+2
 365  0009 be00          	ldw	x,c_y
 366  000b 89            	pushw	x
 369                     ; 73 	TIM2->SR1 = 0;
 371  000c 725f5304      	clr	21252
 372                     ; 74 	if(sample_cnt <= 19){
 374  0010 b600          	ld	a,_sample_cnt
 375  0012 a114          	cp	a,#20
 376  0014 241d          	jruge	L551
 377                     ; 75 		ADC1_StartConversion();//启动转换
 379  0016 cd0000        	call	_ADC1_StartConversion
 382  0019               L161:
 383                     ; 76 		while(ADC1_GetFlagStatus(ADC1_FLAG_EOC)==RESET);//等待转换结束
 385  0019 a680          	ld	a,#128
 386  001b cd0000        	call	_ADC1_GetFlagStatus
 388  001e 4d            	tnz	a
 389  001f 27f8          	jreq	L161
 390                     ; 77 		adc_value[sample_cnt] = ADC1_GetConversionValue();//获取采样值
 392  0021 cd0000        	call	_ADC1_GetConversionValue
 394  0024 b600          	ld	a,_sample_cnt
 395  0026 905f          	clrw	y
 396  0028 9097          	ld	yl,a
 397  002a 9058          	sllw	y
 398  002c 90ef00        	ldw	(_adc_value,y),x
 399                     ; 78 		sample_cnt++;
 401  002f 3c00          	inc	_sample_cnt
 403  0031 200a          	jra	L561
 404  0033               L551:
 405                     ; 81 		TIM2_Cmd(DISABLE);
 407  0033 4f            	clr	a
 408  0034 cd0000        	call	_TIM2_Cmd
 410                     ; 82 		single_sample_finish = 1;
 412  0037 72100000      	bset	_Flag2_,#0
 413                     ; 83 		sample_cnt = 0;
 415  003b 3f00          	clr	_sample_cnt
 416  003d               L561:
 417                     ; 86 }
 420  003d 85            	popw	x
 421  003e bf00          	ldw	c_y,x
 422  0040 320002        	pop	c_y+2
 423  0043 85            	popw	x
 424  0044 bf00          	ldw	c_x,x
 425  0046 320002        	pop	c_x+2
 426  0049 80            	iret
 451                     ; 90 @far @interrupt void TIM4InterruptHandle (void) {
 452                     .text:	section	.text,new
 453  0000               f_TIM4InterruptHandle:
 456  0000 3b0002        	push	c_x+2
 457  0003 be00          	ldw	x,c_x
 458  0005 89            	pushw	x
 459  0006 3b0002        	push	c_y+2
 460  0009 be00          	ldw	x,c_y
 461  000b 89            	pushw	x
 464                     ; 94   f_1ms = 1;
 466  000c 72100003      	bset	_Flag1_,#0
 467                     ; 95   TIM4->SR1= 0;
 469  0010 725f5344      	clr	21316
 470                     ; 96 	Sys_Time_Manage();
 472  0014 cd0000        	call	_Sys_Time_Manage
 474                     ; 98 }
 477  0017 85            	popw	x
 478  0018 bf00          	ldw	c_y,x
 479  001a 320002        	pop	c_y+2
 480  001d 85            	popw	x
 481  001e bf00          	ldw	c_x,x
 482  0020 320002        	pop	c_x+2
 483  0023 80            	iret
 495                     	xref.b	_Flag2_
 496                     	xref.b	_adc_value
 497                     	xref.b	_sample_cnt
 498                     	xdef	f_Timer2_ISR
 499                     	xdef	f_TIM4InterruptHandle
 500                     	xdef	_Sys_Time_Manage
 501                     	xdef	_Init_Time4
 502                     	xdef	_TIMER2_Init
 503                     	switch	.ubsct
 504  0000               _systime_count:
 505  0000 0000          	ds.b	2
 506                     	xdef	_systime_count
 507  0002               _systime_count2:
 508  0002 00            	ds.b	1
 509                     	xdef	_systime_count2
 510  0003               _Flag1_:
 511  0003 00            	ds.b	1
 512                     	xdef	_Flag1_
 513                     	xref	_TIM2_ClearFlag
 514                     	xref	_TIM2_ITConfig
 515                     	xref	_TIM2_Cmd
 516                     	xref	_TIM2_TimeBaseInit
 517                     	xref	_ADC1_GetFlagStatus
 518                     	xref	_ADC1_GetConversionValue
 519                     	xref	_ADC1_StartConversion
 520                     	xref.b	c_x
 521                     	xref.b	c_y
 541                     	end
