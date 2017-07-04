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
 244                     ; 41 void Sys_Time_Manage(void)
 244                     ; 42 {
 245                     .text:	section	.text,new
 246  0000               _Sys_Time_Manage:
 250                     ; 43 	systime_count2++;
 252  0000 3c02          	inc	_systime_count2
 253                     ; 44 	if(systime_count2 >= 100)
 255  0002 b602          	ld	a,_systime_count2
 256  0004 a164          	cp	a,#100
 257  0006 2506          	jrult	L331
 258                     ; 46 		systime_count2 = 0;
 260  0008 3f02          	clr	_systime_count2
 261                     ; 47 		f_100ms = 1;
 263  000a 72120003      	bset	_Flag1_,#1
 264  000e               L331:
 265                     ; 51 	systime_count++;
 267  000e be00          	ldw	x,_systime_count
 268  0010 1c0001        	addw	x,#1
 269  0013 bf00          	ldw	_systime_count,x
 270                     ; 52 	if (systime_count >= 1000)
 272  0015 be00          	ldw	x,_systime_count
 273  0017 a303e8        	cpw	x,#1000
 274  001a 2507          	jrult	L531
 275                     ; 54 		systime_count = 0;
 277  001c 5f            	clrw	x
 278  001d bf00          	ldw	_systime_count,x
 279                     ; 55 		f_1s = 1;
 281  001f 72140003      	bset	_Flag1_,#2
 282  0023               L531:
 283                     ; 57 }
 286  0023 81            	ret
 312                     ; 60 @far @interrupt void TIM4InterruptHandle (void) {
 314                     .text:	section	.text,new
 315  0000               f_TIM4InterruptHandle:
 318  0000 3b0002        	push	c_x+2
 319  0003 be00          	ldw	x,c_x
 320  0005 89            	pushw	x
 321  0006 3b0002        	push	c_y+2
 322  0009 be00          	ldw	x,c_y
 323  000b 89            	pushw	x
 326                     ; 64   f_1ms = 1;
 328  000c 72100003      	bset	_Flag1_,#0
 329                     ; 65   TIM4->SR1= 0;
 331  0010 725f5344      	clr	21316
 332                     ; 66 	Sys_Time_Manage();
 334  0014 cd0000        	call	_Sys_Time_Manage
 336                     ; 68 }
 339  0017 85            	popw	x
 340  0018 bf00          	ldw	c_y,x
 341  001a 320002        	pop	c_y+2
 342  001d 85            	popw	x
 343  001e bf00          	ldw	c_x,x
 344  0020 320002        	pop	c_x+2
 345  0023 80            	iret
 357                     	xdef	f_TIM4InterruptHandle
 358                     	xdef	_Sys_Time_Manage
 359                     	xdef	_Init_Time4
 360                     	switch	.ubsct
 361  0000               _systime_count:
 362  0000 0000          	ds.b	2
 363                     	xdef	_systime_count
 364  0002               _systime_count2:
 365  0002 00            	ds.b	1
 366                     	xdef	_systime_count2
 367  0003               _Flag1_:
 368  0003 00            	ds.b	1
 369                     	xdef	_Flag1_
 370                     	xref.b	c_x
 371                     	xref.b	c_y
 391                     	end
