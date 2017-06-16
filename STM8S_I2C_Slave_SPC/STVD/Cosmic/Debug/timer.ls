   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
 181                     ; 21 void Init_Time4(void)
 181                     ; 22 {
 183                     .text:	section	.text,new
 184  0000               _Init_Time4:
 188                     ; 24 	TIM4->PSCR = 0x05;//分频值 8M/2^5 = 250K
 190  0000 35055347      	mov	21319,#5
 191                     ; 25 	TIM4->IER = 0x01;//使能触发中断
 193  0004 35015343      	mov	21315,#1
 194                     ; 26 	TIM4->CNTR = 250;//250*(1/250K) = 0.001s
 196  0008 35fa5346      	mov	21318,#250
 197                     ; 27 	TIM4->ARR = 249;//自动重装的值
 199  000c 35f95348      	mov	21320,#249
 200                     ; 31 	TIM4->IER = 0x01;     // Enable interrupt
 202  0010 35015343      	mov	21315,#1
 203                     ; 32   TIM4->CR1 = 0x01;     // Start timer
 205  0014 35015340      	mov	21312,#1
 206                     ; 33 }
 209  0018 81            	ret
 234                     ; 41 void Sys_Time_Manage(void)
 234                     ; 42 {
 235                     .text:	section	.text,new
 236  0000               _Sys_Time_Manage:
 240                     ; 43 	systime_count++;
 242  0000 be00          	ldw	x,_systime_count
 243  0002 1c0001        	addw	x,#1
 244  0005 bf00          	ldw	_systime_count,x
 245                     ; 44 	if (systime_count >= 1000)
 247  0007 be00          	ldw	x,_systime_count
 248  0009 a303e8        	cpw	x,#1000
 249  000c 2507          	jrult	L721
 250                     ; 46 		systime_count = 0;
 252  000e 5f            	clrw	x
 253  000f bf00          	ldw	_systime_count,x
 254                     ; 47 		f_1s = 1;
 256  0011 72160002      	bset	_Flag1_,#3
 257  0015               L721:
 258                     ; 49 }
 261  0015 81            	ret
 287                     ; 52 @far @interrupt void TIM4InterruptHandle (void) {
 289                     .text:	section	.text,new
 290  0000               f_TIM4InterruptHandle:
 293  0000 3b0002        	push	c_x+2
 294  0003 be00          	ldw	x,c_x
 295  0005 89            	pushw	x
 296  0006 3b0002        	push	c_y+2
 297  0009 be00          	ldw	x,c_y
 298  000b 89            	pushw	x
 301                     ; 56   f_1ms = 1;
 303  000c 72100002      	bset	_Flag1_,#0
 304                     ; 57   TIM4->SR1= 0;
 306  0010 725f5344      	clr	21316
 307                     ; 58 	Sys_Time_Manage();
 309  0014 cd0000        	call	_Sys_Time_Manage
 311                     ; 60 }
 314  0017 85            	popw	x
 315  0018 bf00          	ldw	c_y,x
 316  001a 320002        	pop	c_y+2
 317  001d 85            	popw	x
 318  001e bf00          	ldw	c_x,x
 319  0020 320002        	pop	c_x+2
 320  0023 80            	iret
 332                     	xdef	f_TIM4InterruptHandle
 333                     	xdef	_Sys_Time_Manage
 334                     	xdef	_Init_Time4
 335                     	switch	.ubsct
 336  0000               _systime_count:
 337  0000 0000          	ds.b	2
 338                     	xdef	_systime_count
 339  0002               _Flag1_:
 340  0002 00            	ds.b	1
 341                     	xdef	_Flag1_
 342                     	xref.b	c_x
 343                     	xref.b	c_y
 363                     	end
