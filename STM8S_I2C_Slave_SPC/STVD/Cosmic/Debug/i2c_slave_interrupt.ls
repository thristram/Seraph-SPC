   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
   4                     	bsct
   5  0000               _GetDataIndex:
   6  0000 00            	dc.b	0
   7  0001               _ReceiveState:
   8  0001 00            	dc.b	0
   9  0002               _SendDataIndex:
  10  0002 00            	dc.b	0
  91                     ; 39 void mymemcpy(void *des,void *src,u32 n)  
  91                     ; 40 {  
  93                     .text:	section	.text,new
  94  0000               _mymemcpy:
  96  0000 89            	pushw	x
  97  0001 5204          	subw	sp,#4
  98       00000004      OFST:	set	4
 101                     ; 41   u8 *xdes=des;
 103  0003 1f01          	ldw	(OFST-3,sp),x
 104                     ; 42 	u8 *xsrc=src; 
 106  0005 1e09          	ldw	x,(OFST+5,sp)
 107  0007 1f03          	ldw	(OFST-1,sp),x
 109  0009 2016          	jra	L35
 110  000b               L74:
 111                     ; 43   while(n--)*xdes++=*xsrc++;  
 113  000b 1e03          	ldw	x,(OFST-1,sp)
 114  000d 1c0001        	addw	x,#1
 115  0010 1f03          	ldw	(OFST-1,sp),x
 116  0012 1d0001        	subw	x,#1
 117  0015 f6            	ld	a,(x)
 118  0016 1e01          	ldw	x,(OFST-3,sp)
 119  0018 1c0001        	addw	x,#1
 120  001b 1f01          	ldw	(OFST-3,sp),x
 121  001d 1d0001        	subw	x,#1
 122  0020 f7            	ld	(x),a
 123  0021               L35:
 126  0021 96            	ldw	x,sp
 127  0022 1c000b        	addw	x,#OFST+7
 128  0025 cd0000        	call	c_ltor
 130  0028 96            	ldw	x,sp
 131  0029 1c000b        	addw	x,#OFST+7
 132  002c a601          	ld	a,#1
 133  002e cd0000        	call	c_lgsbc
 135  0031 cd0000        	call	c_lrzmp
 137  0034 26d5          	jrne	L74
 138                     ; 44 }  
 141  0036 5b06          	addw	sp,#6
 142  0038 81            	ret
 204                     ; 50 u8 Check_Sum(u8 *buf,u8 length)
 204                     ; 51 {
 205                     .text:	section	.text,new
 206  0000               _Check_Sum:
 208  0000 89            	pushw	x
 209  0001 89            	pushw	x
 210       00000002      OFST:	set	2
 213                     ; 53 	u8 result = *buf++;
 215  0002 1e03          	ldw	x,(OFST+1,sp)
 216  0004 1c0001        	addw	x,#1
 217  0007 1f03          	ldw	(OFST+1,sp),x
 218  0009 1d0001        	subw	x,#1
 219  000c f6            	ld	a,(x)
 220  000d 6b01          	ld	(OFST-1,sp),a
 221                     ; 54 	for(i = 1;i < length;i++)
 223  000f a601          	ld	a,#1
 224  0011 6b02          	ld	(OFST+0,sp),a
 226  0013 2011          	jra	L511
 227  0015               L111:
 228                     ; 56 		result ^= *buf++;
 230  0015 1e03          	ldw	x,(OFST+1,sp)
 231  0017 1c0001        	addw	x,#1
 232  001a 1f03          	ldw	(OFST+1,sp),x
 233  001c 1d0001        	subw	x,#1
 234  001f 7b01          	ld	a,(OFST-1,sp)
 235  0021 f8            	xor	a,	(x)
 236  0022 6b01          	ld	(OFST-1,sp),a
 237                     ; 54 	for(i = 1;i < length;i++)
 239  0024 0c02          	inc	(OFST+0,sp)
 240  0026               L511:
 243  0026 7b02          	ld	a,(OFST+0,sp)
 244  0028 1107          	cp	a,(OFST+5,sp)
 245  002a 25e9          	jrult	L111
 246                     ; 58 	return result;
 248  002c 7b01          	ld	a,(OFST-1,sp)
 251  002e 5b04          	addw	sp,#4
 252  0030 81            	ret
 339                     ; 62 u8 i2c_init_message(I2C_Message *tx,u8 payload_len)
 339                     ; 63 {
 340                     .text:	section	.text,new
 341  0000               _i2c_init_message:
 343  0000 89            	pushw	x
 344       00000000      OFST:	set	0
 347                     ; 64 	IIC_TxBuffer[0] = tx->frame_h1;
 349  0001 f6            	ld	a,(x)
 350  0002 b706          	ld	_IIC_TxBuffer,a
 351                     ; 65 	IIC_TxBuffer[1] = tx->frame_h2;
 353  0004 e601          	ld	a,(1,x)
 354  0006 b707          	ld	_IIC_TxBuffer+1,a
 355                     ; 66 	IIC_TxBuffer[2] = tx->message_id;
 357  0008 e602          	ld	a,(2,x)
 358  000a b708          	ld	_IIC_TxBuffer+2,a
 359                     ; 67 	IIC_TxBuffer[3] = 2+payload_len;
 361  000c 7b05          	ld	a,(OFST+5,sp)
 362  000e ab02          	add	a,#2
 363  0010 b709          	ld	_IIC_TxBuffer+3,a
 364                     ; 68 	mymemcpy(&IIC_TxBuffer[4],tx->payload,payload_len);
 366  0012 7b05          	ld	a,(OFST+5,sp)
 367  0014 b703          	ld	c_lreg+3,a
 368  0016 3f02          	clr	c_lreg+2
 369  0018 3f01          	clr	c_lreg+1
 370  001a 3f00          	clr	c_lreg
 371  001c be02          	ldw	x,c_lreg+2
 372  001e 89            	pushw	x
 373  001f be00          	ldw	x,c_lreg
 374  0021 89            	pushw	x
 375  0022 1e05          	ldw	x,(OFST+5,sp)
 376  0024 1c0003        	addw	x,#3
 377  0027 89            	pushw	x
 378  0028 ae000a        	ldw	x,#_IIC_TxBuffer+4
 379  002b cd0000        	call	_mymemcpy
 381  002e 5b06          	addw	sp,#6
 382                     ; 69 	IIC_TxBuffer[4+payload_len] = Check_Sum(&IIC_TxBuffer[2],IIC_TxBuffer[3]);
 384  0030 7b05          	ld	a,(OFST+5,sp)
 385  0032 5f            	clrw	x
 386  0033 97            	ld	xl,a
 387  0034 89            	pushw	x
 388  0035 3b0009        	push	_IIC_TxBuffer+3
 389  0038 ae0008        	ldw	x,#_IIC_TxBuffer+2
 390  003b cd0000        	call	_Check_Sum
 392  003e 5b01          	addw	sp,#1
 393  0040 85            	popw	x
 394  0041 e70a          	ld	(_IIC_TxBuffer+4,x),a
 395                     ; 71 }
 398  0043 85            	popw	x
 399  0044 81            	ret
 423                     ; 73 	void I2C_receive_begin(void)
 423                     ; 74 	{
 424                     .text:	section	.text,new
 425  0000               _I2C_receive_begin:
 429                     ; 75 		ReceiveState = IIC_STATE_BEGIN;
 431  0000 35010001      	mov	_ReceiveState,#1
 432                     ; 76 	}
 435  0004 81            	ret
 483                     ; 78 	void I2C_transaction_begin(void)
 483                     ; 79 	{
 484                     .text:	section	.text,new
 485  0000               _I2C_transaction_begin:
 487  0000 88            	push	a
 488       00000001      OFST:	set	1
 491                     ; 83 		SendDataIndex = 0;
 493  0001 3f02          	clr	_SendDataIndex
 494                     ; 84 		cmd = IIC_RxBuffer[4];
 496  0003 b62a          	ld	a,_IIC_RxBuffer+4
 497  0005 6b01          	ld	(OFST+0,sp),a
 498                     ; 86 		if((IIC_RxBuffer[0] == 0x7E) && (IIC_RxBuffer[1] == 0x7E)){
 500  0007 b626          	ld	a,_IIC_RxBuffer
 501  0009 a17e          	cp	a,#126
 502  000b 2703          	jreq	L61
 503  000d cc011d        	jp	L122
 504  0010               L61:
 506  0010 b627          	ld	a,_IIC_RxBuffer+1
 507  0012 a17e          	cp	a,#126
 508  0014 2703          	jreq	L02
 509  0016 cc011d        	jp	L122
 510  0019               L02:
 511                     ; 87 			switch(cmd){
 513  0019 7b01          	ld	a,(OFST+0,sp)
 515                     ; 123 				default:
 515                     ; 124 				break;
 516  001b a003          	sub	a,#3
 517  001d 2733          	jreq	L571
 518  001f a052          	sub	a,#82
 519  0021 275a          	jreq	L771
 520  0023 a0a9          	sub	a,#169
 521  0025 2703          	jreq	L22
 522  0027 cc011d        	jp	L122
 523  002a               L22:
 524                     ; 88 				case 0xFE:
 524                     ; 89 					if(IIC_RxBuffer[5] == 0x01)	init_device_info();
 526  002a b62b          	ld	a,_IIC_RxBuffer+5
 527  002c a101          	cp	a,#1
 528  002e 2607          	jrne	L722
 531  0030 cd0000        	call	_init_device_info
 534  0033 ac1d011d      	jpf	L122
 535  0037               L722:
 536                     ; 90 					else if(IIC_RxBuffer[5] == 0x02)	{spc.energy_consume = (u16)rtEG;init_energy_consume();}
 538  0037 b62b          	ld	a,_IIC_RxBuffer+5
 539  0039 a102          	cp	a,#2
 540  003b 2703          	jreq	L42
 541  003d cc011d        	jp	L122
 542  0040               L42:
 545  0040 ae0000        	ldw	x,#_rtEG
 546  0043 cd0000        	call	c_ltor
 548  0046 cd0000        	call	c_ftoi
 550  0049 bf61          	ldw	_spc+25,x
 553  004b cd0000        	call	_init_energy_consume
 555  004e ac1d011d      	jpf	L122
 556  0052               L571:
 557                     ; 92 				case 0x03:
 557                     ; 93 					if((IIC_RxBuffer[5] == 0x03)&&(IIC_RxBuffer[6] == slave_address)){
 559  0052 b62b          	ld	a,_IIC_RxBuffer+5
 560  0054 a103          	cp	a,#3
 561  0056 2703          	jreq	L62
 562  0058 cc011d        	jp	L122
 563  005b               L62:
 565  005b b62c          	ld	a,_IIC_RxBuffer+6
 566  005d b147          	cp	a,_slave_address
 567  005f 2703          	jreq	L03
 568  0061 cc011d        	jp	L122
 569  0064               L03:
 570                     ; 95 						if(Check_Sum(&IIC_RxBuffer[2],IIC_RxBuffer[3]) == IIC_RxBuffer[7]){
 572  0064 3b0029        	push	_IIC_RxBuffer+3
 573  0067 ae0028        	ldw	x,#_IIC_RxBuffer+2
 574  006a cd0000        	call	_Check_Sum
 576  006d 5b01          	addw	sp,#1
 577  006f b12d          	cp	a,_IIC_RxBuffer+7
 578  0071 2703          	jreq	L23
 579  0073 cc011d        	jp	L122
 580  0076               L23:
 581                     ; 96 							rev_heart_breat();
 583  0076 cd0000        	call	_rev_heart_breat
 585  0079 ac1d011d      	jpf	L122
 586  007d               L771:
 587                     ; 100 				case 0x55://´ò¿ª»ò¹Ø±Õ¿ª¹Ø
 587                     ; 101 					if((IIC_RxBuffer[5]&0xf0)>>4 == slave_address)	{//µØÖ·ÕýÈ
 589  007d b62b          	ld	a,_IIC_RxBuffer+5
 590  007f a4f0          	and	a,#240
 591  0081 4e            	swap	a
 592  0082 a40f          	and	a,#15
 593  0084 5f            	clrw	x
 594  0085 97            	ld	xl,a
 595  0086 b647          	ld	a,_slave_address
 596  0088 905f          	clrw	y
 597  008a 9097          	ld	yl,a
 598  008c 90bf01        	ldw	c_y+1,y
 599  008f b301          	cpw	x,c_y+1
 600  0091 2703          	jreq	L43
 601  0093 cc011d        	jp	L122
 602  0096               L43:
 603                     ; 102 						if(Check_Sum(&IIC_RxBuffer[2],IIC_RxBuffer[3]) == IIC_RxBuffer[8]){//Ð£ÑéÕýÈ·
 605  0096 3b0029        	push	_IIC_RxBuffer+3
 606  0099 ae0028        	ldw	x,#_IIC_RxBuffer+2
 607  009c cd0000        	call	_Check_Sum
 609  009f 5b01          	addw	sp,#1
 610  00a1 b12e          	cp	a,_IIC_RxBuffer+8
 611  00a3 2678          	jrne	L122
 612                     ; 103 							channel = IIC_RxBuffer[5]&0x0f;
 614  00a5 b62b          	ld	a,_IIC_RxBuffer+5
 615  00a7 a40f          	and	a,#15
 616  00a9 b705          	ld	_channel,a
 617                     ; 104 							if((channel & 0x01)==0x01)	{
 619  00ab b605          	ld	a,_channel
 620  00ad a401          	and	a,#1
 621  00af a101          	cp	a,#1
 622  00b1 261d          	jrne	L542
 623                     ; 105 								spc.ch1_status = IIC_RxBuffer[6];
 625  00b3 452c5d        	mov	_spc+21,_IIC_RxBuffer+6
 626                     ; 106 								if(spc.ch1_status == 0x63)	CH1_ON;
 628  00b6 b65d          	ld	a,_spc+21
 629  00b8 a163          	cp	a,#99
 630  00ba 260b          	jrne	L742
 633  00bc 4b08          	push	#8
 634  00be ae500a        	ldw	x,#20490
 635  00c1 cd0000        	call	_GPIO_WriteHigh
 637  00c4 84            	pop	a
 639  00c5 2009          	jra	L542
 640  00c7               L742:
 641                     ; 107 								else												CH1_OFF;
 643  00c7 4b08          	push	#8
 644  00c9 ae500a        	ldw	x,#20490
 645  00cc cd0000        	call	_GPIO_WriteLow
 647  00cf 84            	pop	a
 648  00d0               L542:
 649                     ; 109 							if((channel & 0x02)==0x02)	{
 651  00d0 b605          	ld	a,_channel
 652  00d2 a402          	and	a,#2
 653  00d4 a102          	cp	a,#2
 654  00d6 261d          	jrne	L352
 655                     ; 110 								spc.ch2_status = IIC_RxBuffer[6];
 657  00d8 452c5e        	mov	_spc+22,_IIC_RxBuffer+6
 658                     ; 111 								if(spc.ch2_status == 0x63)	CH2_ON;
 660  00db b65e          	ld	a,_spc+22
 661  00dd a163          	cp	a,#99
 662  00df 260b          	jrne	L552
 665  00e1 4b10          	push	#16
 666  00e3 ae500a        	ldw	x,#20490
 667  00e6 cd0000        	call	_GPIO_WriteHigh
 669  00e9 84            	pop	a
 671  00ea 2009          	jra	L352
 672  00ec               L552:
 673                     ; 112 								else												CH2_OFF;
 675  00ec 4b10          	push	#16
 676  00ee ae500a        	ldw	x,#20490
 677  00f1 cd0000        	call	_GPIO_WriteLow
 679  00f4 84            	pop	a
 680  00f5               L352:
 681                     ; 114 							if((channel & 0x04)==0x04)	{
 683  00f5 b605          	ld	a,_channel
 684  00f7 a404          	and	a,#4
 685  00f9 a104          	cp	a,#4
 686  00fb 261d          	jrne	L162
 687                     ; 115 								spc.ch3_status = IIC_RxBuffer[6];
 689  00fd 452c5f        	mov	_spc+23,_IIC_RxBuffer+6
 690                     ; 116 								if(spc.ch3_status == 0x63)	CH3_ON;
 692  0100 b65f          	ld	a,_spc+23
 693  0102 a163          	cp	a,#99
 694  0104 260b          	jrne	L362
 697  0106 4b08          	push	#8
 698  0108 ae5000        	ldw	x,#20480
 699  010b cd0000        	call	_GPIO_WriteHigh
 701  010e 84            	pop	a
 703  010f 2009          	jra	L162
 704  0111               L362:
 705                     ; 117 								else												CH3_OFF;
 707  0111 4b08          	push	#8
 708  0113 ae5000        	ldw	x,#20480
 709  0116 cd0000        	call	_GPIO_WriteLow
 711  0119 84            	pop	a
 712  011a               L162:
 713                     ; 119 							rev_action_plug_done();
 715  011a cd0000        	call	_rev_action_plug_done
 717  011d               L102:
 718                     ; 123 				default:
 718                     ; 124 				break;
 720  011d               L522:
 721  011d               L122:
 722                     ; 128 	}
 725  011d 84            	pop	a
 726  011e 81            	ret
 764                     ; 130 	void init_device_info(void)
 764                     ; 131 	{
 765                     .text:	section	.text,new
 766  0000               _init_device_info:
 768  0000 5221          	subw	sp,#33
 769       00000021      OFST:	set	33
 772                     ; 133 		di.frame_h1 = 0x7E;
 774  0002 a67e          	ld	a,#126
 775  0004 6b01          	ld	(OFST-32,sp),a
 776                     ; 134 		di.frame_h2 = 0x7E;
 778  0006 a67e          	ld	a,#126
 779  0008 6b02          	ld	(OFST-31,sp),a
 780                     ; 135 		di.message_id = IIC_RxBuffer[2];
 782  000a b628          	ld	a,_IIC_RxBuffer+2
 783  000c 6b03          	ld	(OFST-30,sp),a
 784                     ; 136 		di.payload[0] = 0xB3;
 786  000e a6b3          	ld	a,#179
 787  0010 6b04          	ld	(OFST-29,sp),a
 788                     ; 137 		di.payload[1] = 0x01;
 790  0012 a601          	ld	a,#1
 791  0014 6b05          	ld	(OFST-28,sp),a
 792                     ; 138 		di.payload[2] = 0x01;
 794  0016 a601          	ld	a,#1
 795  0018 6b06          	ld	(OFST-27,sp),a
 796                     ; 139 		di.payload[3] = 0x01;
 798  001a a601          	ld	a,#1
 799  001c 6b07          	ld	(OFST-26,sp),a
 800                     ; 140 		di.payload[4] = 0x01;
 802  001e a601          	ld	a,#1
 803  0020 6b08          	ld	(OFST-25,sp),a
 804                     ; 141 		di.payload[5] = 0x63;
 806  0022 a663          	ld	a,#99
 807  0024 6b09          	ld	(OFST-24,sp),a
 808                     ; 142 		di.payload[6] = 0x00;
 810  0026 0f0a          	clr	(OFST-23,sp)
 811                     ; 143 		di.payload[7] = 0xc0;
 813  0028 a6c0          	ld	a,#192
 814  002a 6b0b          	ld	(OFST-22,sp),a
 815                     ; 144 		di.payload[8] = slave_address;
 817  002c b647          	ld	a,_slave_address
 818  002e 6b0c          	ld	(OFST-21,sp),a
 819                     ; 145 		i2c_init_message(&di,9);
 821  0030 4b09          	push	#9
 822  0032 96            	ldw	x,sp
 823  0033 1c0002        	addw	x,#OFST-31
 824  0036 cd0000        	call	_i2c_init_message
 826  0039 84            	pop	a
 827                     ; 146 	}
 830  003a 5b21          	addw	sp,#33
 831  003c 81            	ret
 871                     ; 148 	void init_energy_consume(void)
 871                     ; 149 	{
 872                     .text:	section	.text,new
 873  0000               _init_energy_consume:
 875  0000 5221          	subw	sp,#33
 876       00000021      OFST:	set	33
 879                     ; 151 		eg.frame_h1 = 0x7E;
 881  0002 a67e          	ld	a,#126
 882  0004 6b01          	ld	(OFST-32,sp),a
 883                     ; 152 		eg.frame_h2 = 0x7E;
 885  0006 a67e          	ld	a,#126
 886  0008 6b02          	ld	(OFST-31,sp),a
 887                     ; 153 		eg.message_id = IIC_RxBuffer[2];
 889  000a b628          	ld	a,_IIC_RxBuffer+2
 890  000c 6b03          	ld	(OFST-30,sp),a
 891                     ; 154 		eg.payload[0] = 0x2A;
 893  000e a62a          	ld	a,#42
 894  0010 6b04          	ld	(OFST-29,sp),a
 895                     ; 155 		eg.payload[1] = (u8)((spc.energy_consume&0xff00)>>8);
 897  0012 b661          	ld	a,_spc+25
 898  0014 97            	ld	xl,a
 899  0015 b662          	ld	a,_spc+26
 900  0017 9f            	ld	a,xl
 901  0018 a4ff          	and	a,#255
 902  001a 97            	ld	xl,a
 903  001b 4f            	clr	a
 904  001c 02            	rlwa	x,a
 905  001d 4f            	clr	a
 906  001e 01            	rrwa	x,a
 907  001f 9f            	ld	a,xl
 908  0020 6b05          	ld	(OFST-28,sp),a
 909                     ; 156 		eg.payload[2] = (u8)(spc.energy_consume&0x00ff);
 911  0022 b662          	ld	a,_spc+26
 912  0024 a4ff          	and	a,#255
 913  0026 6b06          	ld	(OFST-27,sp),a
 914                     ; 157 		eg.payload[3] = spc.MDID;
 916  0028 b65c          	ld	a,_spc+20
 917  002a 6b07          	ld	(OFST-26,sp),a
 918                     ; 158 		i2c_init_message(&eg,4);
 920  002c 4b04          	push	#4
 921  002e 96            	ldw	x,sp
 922  002f 1c0002        	addw	x,#OFST-31
 923  0032 cd0000        	call	_i2c_init_message
 925  0035 84            	pop	a
 926                     ; 159 		spc.energy_consume = 0;
 928  0036 5f            	clrw	x
 929  0037 bf61          	ldw	_spc+25,x
 930                     ; 160 		rtEG = 0;
 932  0039 ae0000        	ldw	x,#0
 933  003c bf02          	ldw	_rtEG+2,x
 934  003e ae0000        	ldw	x,#0
 935  0041 bf00          	ldw	_rtEG,x
 936                     ; 161 	}
 939  0043 5b21          	addw	sp,#33
 940  0045 81            	ret
 978                     ; 165 	void rev_heart_breat(void)
 978                     ; 166 	{
 979                     .text:	section	.text,new
 980  0000               _rev_heart_breat:
 982  0000 5221          	subw	sp,#33
 983       00000021      OFST:	set	33
 986                     ; 168 		hb.frame_h1 = 0x7E;
 988  0002 a67e          	ld	a,#126
 989  0004 6b01          	ld	(OFST-32,sp),a
 990                     ; 169 		hb.frame_h2 = 0x7E;
 992  0006 a67e          	ld	a,#126
 993  0008 6b02          	ld	(OFST-31,sp),a
 994                     ; 170 		hb.message_id = IIC_RxBuffer[2];
 996  000a b628          	ld	a,_IIC_RxBuffer+2
 997  000c 6b03          	ld	(OFST-30,sp),a
 998                     ; 171 		hb.payload[0] = 0x06;
1000  000e a606          	ld	a,#6
1001  0010 6b04          	ld	(OFST-29,sp),a
1002                     ; 172 		hb.payload[1] = spc.MDID;
1004  0012 b65c          	ld	a,_spc+20
1005  0014 6b05          	ld	(OFST-28,sp),a
1006                     ; 173 		hb.payload[2] = spc.ch1_status;
1008  0016 b65d          	ld	a,_spc+21
1009  0018 6b06          	ld	(OFST-27,sp),a
1010                     ; 174 		hb.payload[3] = spc.ch2_status;
1012  001a b65e          	ld	a,_spc+22
1013  001c 6b07          	ld	(OFST-26,sp),a
1014                     ; 175 		hb.payload[4] = spc.ch3_status;
1016  001e b65f          	ld	a,_spc+23
1017  0020 6b08          	ld	(OFST-25,sp),a
1018                     ; 176 		hb.payload[5] = spc.ch4_status;
1020  0022 b660          	ld	a,_spc+24
1021  0024 6b09          	ld	(OFST-24,sp),a
1022                     ; 177 		i2c_init_message(&hb,6);
1024  0026 4b06          	push	#6
1025  0028 96            	ldw	x,sp
1026  0029 1c0002        	addw	x,#OFST-31
1027  002c cd0000        	call	_i2c_init_message
1029  002f 84            	pop	a
1030                     ; 178 	}
1033  0030 5b21          	addw	sp,#33
1034  0032 81            	ret
1073                     ; 180 	void rev_action_dimmer_OK(void)
1073                     ; 181 	{
1074                     .text:	section	.text,new
1075  0000               _rev_action_dimmer_OK:
1077  0000 5221          	subw	sp,#33
1078       00000021      OFST:	set	33
1081                     ; 183 		ad.frame_h1 = 0x7E;
1083  0002 a67e          	ld	a,#126
1084  0004 6b01          	ld	(OFST-32,sp),a
1085                     ; 184 		ad.frame_h2 = 0x7E;
1087  0006 a67e          	ld	a,#126
1088  0008 6b02          	ld	(OFST-31,sp),a
1089                     ; 185 		ad.message_id = IIC_RxBuffer[2];
1091  000a b628          	ld	a,_IIC_RxBuffer+2
1092  000c 6b03          	ld	(OFST-30,sp),a
1093                     ; 186 		ad.payload[0] = 0xAA;
1095  000e a6aa          	ld	a,#170
1096  0010 6b04          	ld	(OFST-29,sp),a
1097                     ; 187 		ad.payload[1] = 0x02;
1099  0012 a602          	ld	a,#2
1100  0014 6b05          	ld	(OFST-28,sp),a
1101                     ; 188 		ad.payload[2] = spc.MDID;
1103  0016 b65c          	ld	a,_spc+20
1104  0018 6b06          	ld	(OFST-27,sp),a
1105                     ; 189 		i2c_init_message(&ad,3);
1107  001a 4b03          	push	#3
1108  001c 96            	ldw	x,sp
1109  001d 1c0002        	addw	x,#OFST-31
1110  0020 cd0000        	call	_i2c_init_message
1112  0023 84            	pop	a
1113                     ; 190 	}
1116  0024 5b21          	addw	sp,#33
1117  0026 81            	ret
1155                     ; 193 	void rev_action_dimmer_done(void)
1155                     ; 194 	{
1156                     .text:	section	.text,new
1157  0000               _rev_action_dimmer_done:
1159  0000 5221          	subw	sp,#33
1160       00000021      OFST:	set	33
1163                     ; 196 		ad.frame_h1 = 0x7E;
1165  0002 a67e          	ld	a,#126
1166  0004 6b01          	ld	(OFST-32,sp),a
1167                     ; 197 		ad.frame_h2 = 0x7E;
1169  0006 a67e          	ld	a,#126
1170  0008 6b02          	ld	(OFST-31,sp),a
1171                     ; 198 		ad.message_id = 66;
1173  000a a642          	ld	a,#66
1174  000c 6b03          	ld	(OFST-30,sp),a
1175                     ; 199 		ad.payload[0] = 0xAA;
1177  000e a6aa          	ld	a,#170
1178  0010 6b04          	ld	(OFST-29,sp),a
1179                     ; 200 		ad.payload[1] = 0x05;
1181  0012 a605          	ld	a,#5
1182  0014 6b05          	ld	(OFST-28,sp),a
1183                     ; 201 		ad.payload[2] = spc.MDID;
1185  0016 b65c          	ld	a,_spc+20
1186  0018 6b06          	ld	(OFST-27,sp),a
1187                     ; 202 		ad.payload[3] = spc.ch1_status;
1189  001a b65d          	ld	a,_spc+21
1190  001c 6b07          	ld	(OFST-26,sp),a
1191                     ; 203 		ad.payload[4] = spc.ch2_status;
1193  001e b65e          	ld	a,_spc+22
1194  0020 6b08          	ld	(OFST-25,sp),a
1195                     ; 204 		ad.payload[5] = spc.ch3_status;
1197  0022 b65f          	ld	a,_spc+23
1198  0024 6b09          	ld	(OFST-24,sp),a
1199                     ; 205 		ad.payload[6] = spc.ch4_status;
1201  0026 b660          	ld	a,_spc+24
1202  0028 6b0a          	ld	(OFST-23,sp),a
1203                     ; 206 		i2c_init_message(&ad,7);
1205  002a 4b07          	push	#7
1206  002c 96            	ldw	x,sp
1207  002d 1c0002        	addw	x,#OFST-31
1208  0030 cd0000        	call	_i2c_init_message
1210  0033 84            	pop	a
1211                     ; 207 	}
1214  0034 5b21          	addw	sp,#33
1215  0036 81            	ret
1253                     ; 209 	void rev_action_plug_done(void)
1253                     ; 210 	{
1254                     .text:	section	.text,new
1255  0000               _rev_action_plug_done:
1257  0000 5221          	subw	sp,#33
1258       00000021      OFST:	set	33
1261                     ; 212 		ap.frame_h1 = 0x7E;
1263  0002 a67e          	ld	a,#126
1264  0004 6b01          	ld	(OFST-32,sp),a
1265                     ; 213 		ap.frame_h2 = 0x7E;
1267  0006 a67e          	ld	a,#126
1268  0008 6b02          	ld	(OFST-31,sp),a
1269                     ; 214 		ap.message_id = 66;
1271  000a a642          	ld	a,#66
1272  000c 6b03          	ld	(OFST-30,sp),a
1273                     ; 215 		ap.payload[0] = 0xAA;
1275  000e a6aa          	ld	a,#170
1276  0010 6b04          	ld	(OFST-29,sp),a
1277                     ; 216 		ap.payload[1] = 0x05;
1279  0012 a605          	ld	a,#5
1280  0014 6b05          	ld	(OFST-28,sp),a
1281                     ; 217 		ap.payload[2] = spc.MDID;
1283  0016 b65c          	ld	a,_spc+20
1284  0018 6b06          	ld	(OFST-27,sp),a
1285                     ; 218 		ap.payload[3] = spc.ch1_status;
1287  001a b65d          	ld	a,_spc+21
1288  001c 6b07          	ld	(OFST-26,sp),a
1289                     ; 219 		ap.payload[4] = spc.ch2_status;
1291  001e b65e          	ld	a,_spc+22
1292  0020 6b08          	ld	(OFST-25,sp),a
1293                     ; 220 		ap.payload[5] = spc.ch3_status;
1295  0022 b65f          	ld	a,_spc+23
1296  0024 6b09          	ld	(OFST-24,sp),a
1297                     ; 221 		ap.payload[6] = spc.ch4_status;
1299  0026 b660          	ld	a,_spc+24
1300  0028 6b0a          	ld	(OFST-23,sp),a
1301                     ; 222 		i2c_init_message(&ap,7);
1303  002a 4b07          	push	#7
1304  002c 96            	ldw	x,sp
1305  002d 1c0002        	addw	x,#OFST-31
1306  0030 cd0000        	call	_i2c_init_message
1308  0033 84            	pop	a
1309                     ; 223 	}
1312  0034 5b21          	addw	sp,#33
1313  0036 81            	ret
1338                     ; 225 	void I2C_transaction_end(void)
1338                     ; 226 	{
1339                     .text:	section	.text,new
1340  0000               _I2C_transaction_end:
1344                     ; 227 		ReceiveState = IIC_STATE_END;
1346  0000 35030001      	mov	_ReceiveState,#3
1347                     ; 228 	}	
1350  0004 81            	ret
1375                     ; 230 	void I2C_transaction_receive(void)
1375                     ; 231 	{
1376                     .text:	section	.text,new
1377  0000               _I2C_transaction_receive:
1381                     ; 232 		ReceiveState = IIC_STATE_RECEIVEING;
1383  0000 35020001      	mov	_ReceiveState,#2
1384                     ; 233 	}
1387  0004 81            	ret
1424                     ; 235 	void I2C_byte_received(uint8_t RxData)
1424                     ; 236 	{
1425                     .text:	section	.text,new
1426  0000               _I2C_byte_received:
1428  0000 88            	push	a
1429       00000000      OFST:	set	0
1432                     ; 237 		if(GetDataIndex < MAX_BUFFER) {
1434  0001 b600          	ld	a,_GetDataIndex
1435  0003 a120          	cp	a,#32
1436  0005 2410          	jruge	L154
1437                     ; 238 			IIC_RxBuffer[GetDataIndex++] = RxData;
1439  0007 b600          	ld	a,_GetDataIndex
1440  0009 97            	ld	xl,a
1441  000a 3c00          	inc	_GetDataIndex
1442  000c 9f            	ld	a,xl
1443  000d 5f            	clrw	x
1444  000e 97            	ld	xl,a
1445  000f 7b01          	ld	a,(OFST+1,sp)
1446  0011 e726          	ld	(_IIC_RxBuffer,x),a
1447                     ; 239 			ReceiveState = IIC_STATE_RECEIVEING;
1449  0013 35020001      	mov	_ReceiveState,#2
1450  0017               L154:
1451                     ; 241 	}
1454  0017 84            	pop	a
1455  0018 81            	ret
1480                     ; 243 	uint8_t I2C_byte_write(void)
1480                     ; 244 	{
1481                     .text:	section	.text,new
1482  0000               _I2C_byte_write:
1486                     ; 245 			return IIC_TxBuffer[SendDataIndex++];
1488  0000 b602          	ld	a,_SendDataIndex
1489  0002 97            	ld	xl,a
1490  0003 3c02          	inc	_SendDataIndex
1491  0005 9f            	ld	a,xl
1492  0006 5f            	clrw	x
1493  0007 97            	ld	xl,a
1494  0008 e606          	ld	a,(_IIC_TxBuffer,x)
1497  000a 81            	ret
1500                     	switch	.ubsct
1501  0000               L364_sr1:
1502  0000 00            	ds.b	1
1503  0001               L564_sr2:
1504  0001 00            	ds.b	1
1505  0002               L764_sr3:
1506  0002 00            	ds.b	1
1562                     ; 255 @far @interrupt void I2C_Slave_check_event(void) {
1564                     .text:	section	.text,new
1565  0000               f_I2C_Slave_check_event:
1568  0000 3b0002        	push	c_x+2
1569  0003 be00          	ldw	x,c_x
1570  0005 89            	pushw	x
1571  0006 3b0002        	push	c_y+2
1572  0009 be00          	ldw	x,c_y
1573  000b 89            	pushw	x
1576                     ; 262 	sr1 = I2C->SR1;
1578  000c 5552170000    	mov	L364_sr1,21015
1579                     ; 263 	sr2 = I2C->SR2;
1581  0011 5552180001    	mov	L564_sr2,21016
1582                     ; 264 	sr3 = I2C->SR3;
1584  0016 5552190002    	mov	L764_sr3,21017
1585                     ; 267   if (sr2 & (I2C_SR2_WUFH | I2C_SR2_OVR |I2C_SR2_ARLO |I2C_SR2_BERR))
1587  001b b601          	ld	a,L564_sr2
1588  001d a52b          	bcp	a,#43
1589  001f 2708          	jreq	L715
1590                     ; 269     I2C->CR2|= I2C_CR2_STOP;  // stop communication - release the lines
1592  0021 72125211      	bset	21009,#1
1593                     ; 270     I2C->SR2= 0;					    // clear all error flags
1595  0025 725f5218      	clr	21016
1596  0029               L715:
1597                     ; 273   if ((sr1 & (I2C_SR1_RXNE | I2C_SR1_BTF)) == (I2C_SR1_RXNE | I2C_SR1_BTF))
1599  0029 b600          	ld	a,L364_sr1
1600  002b a444          	and	a,#68
1601  002d a144          	cp	a,#68
1602  002f 2606          	jrne	L125
1603                     ; 275     I2C_byte_received(I2C->DR);
1605  0031 c65216        	ld	a,21014
1606  0034 cd0000        	call	_I2C_byte_received
1608  0037               L125:
1609                     ; 278   if (sr1 & I2C_SR1_RXNE)
1611  0037 b600          	ld	a,L364_sr1
1612  0039 a540          	bcp	a,#64
1613  003b 2706          	jreq	L325
1614                     ; 280     I2C_byte_received(I2C->DR);
1616  003d c65216        	ld	a,21014
1617  0040 cd0000        	call	_I2C_byte_received
1619  0043               L325:
1620                     ; 283   if (sr2 & I2C_SR2_AF)
1622  0043 b601          	ld	a,L564_sr2
1623  0045 a504          	bcp	a,#4
1624  0047 2707          	jreq	L525
1625                     ; 285     I2C->SR2 &= ~I2C_SR2_AF;	  // clear AF
1627  0049 72155218      	bres	21016,#2
1628                     ; 286 		I2C_transaction_end();
1630  004d cd0000        	call	_I2C_transaction_end
1632  0050               L525:
1633                     ; 289   if (sr1 & I2C_SR1_STOPF) 
1635  0050 b600          	ld	a,L364_sr1
1636  0052 a510          	bcp	a,#16
1637  0054 2707          	jreq	L725
1638                     ; 291     I2C->CR2 |= I2C_CR2_ACK;	  // CR2 write to clear STOPF
1640  0056 72145211      	bset	21009,#2
1641                     ; 292 		I2C_transaction_end();
1643  005a cd0000        	call	_I2C_transaction_end
1645  005d               L725:
1646                     ; 295   if (sr1 & I2C_SR1_ADDR)
1648  005d b600          	ld	a,L364_sr1
1649  005f a502          	bcp	a,#2
1650  0061 270e          	jreq	L135
1651                     ; 297 		if(sr3 & I2C_SR3_TRA){//´Ó»ú·¢ËÍÊý¾Ý
1653  0063 b602          	ld	a,L764_sr3
1654  0065 a504          	bcp	a,#4
1655  0067 2705          	jreq	L335
1656                     ; 298 			I2C_transaction_begin();
1658  0069 cd0000        	call	_I2C_transaction_begin
1661  006c 2003          	jra	L135
1662  006e               L335:
1663                     ; 300 			I2C_receive_begin();//´Ó»ú½ÓÊÕÊý¾Ý
1665  006e cd0000        	call	_I2C_receive_begin
1667  0071               L135:
1668                     ; 304   if ((sr1 & (I2C_SR1_TXE | I2C_SR1_BTF)) == (I2C_SR1_TXE | I2C_SR1_BTF))
1670  0071 b600          	ld	a,L364_sr1
1671  0073 a484          	and	a,#132
1672  0075 a184          	cp	a,#132
1673  0077 2606          	jrne	L735
1674                     ; 306 		I2C->DR = I2C_byte_write();
1676  0079 cd0000        	call	_I2C_byte_write
1678  007c c75216        	ld	21014,a
1679  007f               L735:
1680                     ; 309   if (sr1 & I2C_SR1_TXE)
1682  007f b600          	ld	a,L364_sr1
1683  0081 a580          	bcp	a,#128
1684  0083 2706          	jreq	L145
1685                     ; 311 		I2C->DR = I2C_byte_write();
1687  0085 cd0000        	call	_I2C_byte_write
1689  0088 c75216        	ld	21014,a
1690  008b               L145:
1691                     ; 314 }
1694  008b 85            	popw	x
1695  008c bf00          	ldw	c_y,x
1696  008e 320002        	pop	c_y+2
1697  0091 85            	popw	x
1698  0092 bf00          	ldw	c_x,x
1699  0094 320002        	pop	c_x+2
1700  0097 80            	iret
1723                     ; 319 void IIC_SlaveConfig (void)
1723                     ; 320 {
1725                     .text:	section	.text,new
1726  0000               _IIC_SlaveConfig:
1730                     ; 322 	GPIOD->DDR &= ~(0xF<<1);
1732  0000 c65011        	ld	a,20497
1733  0003 a4e1          	and	a,#225
1734  0005 c75011        	ld	20497,a
1735                     ; 323 	GPIOD->CR1 |= (0xF<<1);//ÉÏÀ­
1737  0008 c65012        	ld	a,20498
1738  000b aa1e          	or	a,#30
1739  000d c75012        	ld	20498,a
1740                     ; 324 	GPIOD->CR2 &= ~(0xF<<1);//External interrupt disabled
1742  0010 c65013        	ld	a,20499
1743  0013 a4e1          	and	a,#225
1744  0015 c75013        	ld	20499,a
1745                     ; 326   GPIOB->ODR |= (1<<4)|(1<<5);                //define SDA, SCL outputs, HiZ, Open drain, Fast
1747  0018 c65005        	ld	a,20485
1748  001b aa30          	or	a,#48
1749  001d c75005        	ld	20485,a
1750                     ; 327   GPIOB->DDR |= (1<<4)|(1<<5);
1752  0020 c65007        	ld	a,20487
1753  0023 aa30          	or	a,#48
1754  0025 c75007        	ld	20487,a
1755                     ; 328   GPIOB->CR2 |= (1<<4)|(1<<5);
1757  0028 c65009        	ld	a,20489
1758  002b aa30          	or	a,#48
1759  002d c75009        	ld	20489,a
1760                     ; 331 		I2C->CR1 |= 0x01;				        	// Enable I2C peripheral
1762  0030 72105210      	bset	21008,#0
1763                     ; 332 		I2C->CR2 = 0x04;					      		// Enable I2C acknowledgement
1765  0034 35045211      	mov	21009,#4
1766                     ; 334 		I2C->FREQR = 8;
1768  0038 35085212      	mov	21010,#8
1769                     ; 335 		I2C->OARL = (SLAVE_ADDRESS << 1) ;	// set slave address to 0x51 (put 0xA2 for the register dues to7bit address) 
1771  003c b647          	ld	a,_slave_address
1772  003e 48            	sll	a
1773  003f c75213        	ld	21011,a
1774                     ; 336 		I2C->OARH = 0x40;					      	// Set 7bit address mode
1776  0042 35405214      	mov	21012,#64
1777                     ; 349 	I2C->ITR	= 0x07;					      // all I2C interrupt enable  
1779  0046 3507521a      	mov	21018,#7
1780                     ; 350 }
1783  004a 81            	ret
2109                     	xdef	_I2C_byte_write
2110                     	xdef	_I2C_byte_received
2111                     	xdef	_I2C_transaction_receive
2112                     	xdef	_I2C_transaction_end
2113                     	xdef	_rev_action_dimmer_done
2114                     	xdef	_rev_action_dimmer_OK
2115                     	xdef	_I2C_transaction_begin
2116                     	xdef	_I2C_receive_begin
2117                     	xdef	_i2c_init_message
2118                     	xdef	_Check_Sum
2119                     	xdef	_mymemcpy
2120                     	switch	.ubsct
2121  0003               _action_flag:
2122  0003 00            	ds.b	1
2123                     	xdef	_action_flag
2124  0004               _ext:
2125  0004 00            	ds.b	1
2126                     	xdef	_ext
2127  0005               _channel:
2128  0005 00            	ds.b	1
2129                     	xdef	_channel
2130                     	xdef	_SendDataIndex
2131                     	xdef	_ReceiveState
2132                     	xdef	_GetDataIndex
2133  0006               _IIC_TxBuffer:
2134  0006 000000000000  	ds.b	32
2135                     	xdef	_IIC_TxBuffer
2136  0026               _IIC_RxBuffer:
2137  0026 000000000000  	ds.b	32
2138                     	xdef	_IIC_RxBuffer
2139  0046               _action_done:
2140  0046 00            	ds.b	1
2141                     	xdef	_action_done
2142  0047               _slave_address:
2143  0047 00            	ds.b	1
2144                     	xdef	_slave_address
2145  0048               _spc:
2146  0048 000000000000  	ds.b	27
2147                     	xdef	_spc
2148                     	xref.b	_rtEG
2149                     	xdef	_rev_action_plug_done
2150                     	xdef	_init_energy_consume
2151                     	xdef	_rev_heart_breat
2152                     	xdef	_init_device_info
2153                     	xdef	f_I2C_Slave_check_event
2154                     	xdef	_IIC_SlaveConfig
2155                     	xref	_GPIO_WriteLow
2156                     	xref	_GPIO_WriteHigh
2157                     	xref.b	c_lreg
2158                     	xref.b	c_x
2159                     	xref.b	c_y
2179                     	xref	c_ftoi
2180                     	xref	c_lrzmp
2181                     	xref	c_lgsbc
2182                     	xref	c_ltor
2183                     	end
