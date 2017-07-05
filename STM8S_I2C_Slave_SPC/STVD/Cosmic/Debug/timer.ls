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
 243                     ; 41 void Sys_Time_Manage(void)
 243                     ; 42 {
 244                     .text:	section	.text,new
 245  0000               _Sys_Time_Manage:
 249                     ; 51 	systime_count++;
 251  0000 be00          	ldw	x,_systime_count
 252  0002 1c0001        	addw	x,#1
 253  0005 bf00          	ldw	_systime_count,x
 254                     ; 52 	if (systime_count >= 1000)
 256  0007 be00          	ldw	x,_systime_count
 257  0009 a303e8        	cpw	x,#1000
 258  000c 2507          	jrult	L331
 259                     ; 54 		systime_count = 0;
 261  000e 5f            	clrw	x
 262  000f bf00          	ldw	_systime_count,x
 263                     ; 55 		f_1s = 1;
 265  0011 72140003      	bset	_Flag1_,#2
 266  0015               L331:
 267                     ; 57 }
 270  0015 81            	ret
 296                     ; 60 @far @interrupt void TIM4InterruptHandle (void) {
 298                     .text:	section	.text,new
 299  0000               f_TIM4InterruptHandle:
 302  0000 3b0002        	push	c_x+2
 303  0003 be00          	ldw	x,c_x
 304  0005 89            	pushw	x
 305  0006 3b0002        	push	c_y+2
 306  0009 be00          	ldw	x,c_y
 307  000b 89            	pushw	x
 310                     ; 64   f_1ms = 1;
 312  000c 72100003      	bset	_Flag1_,#0
 313                     ; 65   TIM4->SR1= 0;
 315  0010 725f5344      	clr	21316
 316                     ; 66 	Sys_Time_Manage();
 318  0014 cd0000        	call	_Sys_Time_Manage
 320                     ; 68 }
 323  0017 85            	popw	x
 324  0018 bf00          	ldw	c_y,x
 325  001a 320002        	pop	c_y+2
 326  001d 85            	popw	x
 327  001e bf00          	ldw	c_x,x
 328  0020 320002        	pop	c_x+2
 329  0023 80            	iret
 341                     	xdef	f_TIM4InterruptHandle
 342                     	xdef	_Sys_Time_Manage
 343                     	xdef	_Init_Time4
 344                     	switch	.ubsct
 345  0000               _systime_count:
 346  0000 0000          	ds.b	2
 347                     	xdef	_systime_count
 348  0002               _systime_count2:
 349  0002 00            	ds.b	1
 350                     	xdef	_systime_count2
 351  0003               _Flag1_:
 352  0003 00            	ds.b	1
 353                     	xdef	_Flag1_
 354                     	xref.b	c_x
 355                     	xref.b	c_y
 375                     	end
