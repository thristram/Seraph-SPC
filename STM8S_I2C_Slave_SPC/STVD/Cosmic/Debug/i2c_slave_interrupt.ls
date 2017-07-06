   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
   4                     	bsct
   5  0000               _GetDataIndex:
   6  0000 00            	dc.b	0
   7  0001               _ReceiveState:
   8  0001 00            	dc.b	0
   9  0002               _SendDataIndex:
  10  0002 00            	dc.b	0
  91                     ; 35 void mymemcpy(void *des,void *src,u32 n)  
  91                     ; 36 {  
  93                     .text:	section	.text,new
  94  0000               _mymemcpy:
  96  0000 89            	pushw	x
  97  0001 5204          	subw	sp,#4
  98       00000004      OFST:	set	4
 101                     ; 37   u8 *xdes=des;
 103  0003 1f01          	ldw	(OFST-3,sp),x
 104                     ; 38 	u8 *xsrc=src; 
 106  0005 1e09          	ldw	x,(OFST+5,sp)
 107  0007 1f03          	ldw	(OFST-1,sp),x
 109  0009 2016          	jra	L35
 110  000b               L74:
 111                     ; 39   while(n--)*xdes++=*xsrc++;  
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
 138                     ; 40 }  
 141  0036 5b06          	addw	sp,#6
 142  0038 81            	ret
 204                     ; 46 u8 Check_Sum(u8 *buf,u8 length)
 204                     ; 47 {
 205                     .text:	section	.text,new
 206  0000               _Check_Sum:
 208  0000 89            	pushw	x
 209  0001 89            	pushw	x
 210       00000002      OFST:	set	2
 213                     ; 49 	u8 result = *buf++;
 215  0002 1e03          	ldw	x,(OFST+1,sp)
 216  0004 1c0001        	addw	x,#1
 217  0007 1f03          	ldw	(OFST+1,sp),x
 218  0009 1d0001        	subw	x,#1
 219  000c f6            	ld	a,(x)
 220  000d 6b01          	ld	(OFST-1,sp),a
 221                     ; 50 	for(i = 1;i < length;i++)
 223  000f a601          	ld	a,#1
 224  0011 6b02          	ld	(OFST+0,sp),a
 226  0013 2011          	jra	L511
 227  0015               L111:
 228                     ; 52 		result ^= *buf++;
 230  0015 1e03          	ldw	x,(OFST+1,sp)
 231  0017 1c0001        	addw	x,#1
 232  001a 1f03          	ldw	(OFST+1,sp),x
 233  001c 1d0001        	subw	x,#1
 234  001f 7b01          	ld	a,(OFST-1,sp)
 235  0021 f8            	xor	a,	(x)
 236  0022 6b01          	ld	(OFST-1,sp),a
 237                     ; 50 	for(i = 1;i < length;i++)
 239  0024 0c02          	inc	(OFST+0,sp)
 240  0026               L511:
 243  0026 7b02          	ld	a,(OFST+0,sp)
 244  0028 1107          	cp	a,(OFST+5,sp)
 245  002a 25e9          	jrult	L111
 246                     ; 54 	return result;
 248  002c 7b01          	ld	a,(OFST-1,sp)
 251  002e 5b04          	addw	sp,#4
 252  0030 81            	ret
 339                     ; 58 u8 i2c_init_message(I2C_Message *tx,u8 payload_len)
 339                     ; 59 {
 340                     .text:	section	.text,new
 341  0000               _i2c_init_message:
 343  0000 89            	pushw	x
 344       00000000      OFST:	set	0
 347                     ; 60 	IIC_TxBuffer[0] = tx->frame_h1;
 349  0001 f6            	ld	a,(x)
 350  0002 b709          	ld	_IIC_TxBuffer,a
 351                     ; 61 	IIC_TxBuffer[1] = tx->frame_h2;
 353  0004 e601          	ld	a,(1,x)
 354  0006 b70a          	ld	_IIC_TxBuffer+1,a
 355                     ; 62 	IIC_TxBuffer[2] = tx->message_id;
 357  0008 e602          	ld	a,(2,x)
 358  000a b70b          	ld	_IIC_TxBuffer+2,a
 359                     ; 63 	IIC_TxBuffer[3] = 2+payload_len;
 361  000c 7b05          	ld	a,(OFST+5,sp)
 362  000e ab02          	add	a,#2
 363  0010 b70c          	ld	_IIC_TxBuffer+3,a
 364                     ; 64 	mymemcpy(&IIC_TxBuffer[4],tx->payload,payload_len);
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
 378  0028 ae000d        	ldw	x,#_IIC_TxBuffer+4
 379  002b cd0000        	call	_mymemcpy
 381  002e 5b06          	addw	sp,#6
 382                     ; 65 	IIC_TxBuffer[4+payload_len] = Check_Sum(&IIC_TxBuffer[2],IIC_TxBuffer[3]);
 384  0030 7b05          	ld	a,(OFST+5,sp)
 385  0032 5f            	clrw	x
 386  0033 97            	ld	xl,a
 387  0034 89            	pushw	x
 388  0035 3b000c        	push	_IIC_TxBuffer+3
 389  0038 ae000b        	ldw	x,#_IIC_TxBuffer+2
 390  003b cd0000        	call	_Check_Sum
 392  003e 5b01          	addw	sp,#1
 393  0040 85            	popw	x
 394  0041 e70d          	ld	(_IIC_TxBuffer+4,x),a
 395                     ; 67 }
 398  0043 85            	popw	x
 399  0044 81            	ret
 423                     ; 69 	void I2C_receive_begin(void)
 423                     ; 70 	{
 424                     .text:	section	.text,new
 425  0000               _I2C_receive_begin:
 429                     ; 71 		ReceiveState = IIC_STATE_BEGIN;
 431  0000 35010001      	mov	_ReceiveState,#1
 432                     ; 72 	}
 435  0004 81            	ret
 486                     ; 74 	void I2C_transaction_begin(void)
 486                     ; 75 	{
 487                     .text:	section	.text,new
 488  0000               _I2C_transaction_begin:
 490  0000 88            	push	a
 491       00000001      OFST:	set	1
 494                     ; 79 		SendDataIndex = 0;
 496  0001 3f02          	clr	_SendDataIndex
 497                     ; 80 		cmd = IIC_RxBuffer[4];
 499  0003 b62d          	ld	a,_IIC_RxBuffer+4
 500  0005 6b01          	ld	(OFST+0,sp),a
 501                     ; 82 		if((IIC_RxBuffer[0] == 0x7E) && (IIC_RxBuffer[1] == 0x7E)){
 503  0007 b629          	ld	a,_IIC_RxBuffer
 504  0009 a17e          	cp	a,#126
 505  000b 2703          	jreq	L61
 506  000d cc013b        	jp	L122
 507  0010               L61:
 509  0010 b62a          	ld	a,_IIC_RxBuffer+1
 510  0012 a17e          	cp	a,#126
 511  0014 2703          	jreq	L02
 512  0016 cc013b        	jp	L122
 513  0019               L02:
 514                     ; 83 			switch(cmd){
 516  0019 7b01          	ld	a,(OFST+0,sp)
 518                     ; 134 				default:
 518                     ; 135 				break;
 519  001b a003          	sub	a,#3
 520  001d 2733          	jreq	L571
 521  001f a052          	sub	a,#82
 522  0021 275a          	jreq	L771
 523  0023 a0a9          	sub	a,#169
 524  0025 2703          	jreq	L22
 525  0027 cc013b        	jp	L122
 526  002a               L22:
 527                     ; 84 				case 0xFE:
 527                     ; 85 					if(IIC_RxBuffer[5] == 0x01)	init_device_info();
 529  002a b62e          	ld	a,_IIC_RxBuffer+5
 530  002c a101          	cp	a,#1
 531  002e 2607          	jrne	L722
 534  0030 cd0000        	call	_init_device_info
 537  0033 ac3b013b      	jpf	L122
 538  0037               L722:
 539                     ; 86 					else if(IIC_RxBuffer[5] == 0x02)	{spc.energy_consume = (u16)rtEG;init_energy_consume();}
 541  0037 b62e          	ld	a,_IIC_RxBuffer+5
 542  0039 a102          	cp	a,#2
 543  003b 2703          	jreq	L42
 544  003d cc013b        	jp	L122
 545  0040               L42:
 548  0040 ae0000        	ldw	x,#_rtEG
 549  0043 cd0000        	call	c_ltor
 551  0046 cd0000        	call	c_ftoi
 553  0049 bf64          	ldw	_spc+25,x
 556  004b cd0000        	call	_init_energy_consume
 558  004e ac3b013b      	jpf	L122
 559  0052               L571:
 560                     ; 88 				case 0x03:
 560                     ; 89 					if((IIC_RxBuffer[5] == 0x03)&&(IIC_RxBuffer[6] == slave_address)){
 562  0052 b62e          	ld	a,_IIC_RxBuffer+5
 563  0054 a103          	cp	a,#3
 564  0056 2703          	jreq	L62
 565  0058 cc013b        	jp	L122
 566  005b               L62:
 568  005b b62f          	ld	a,_IIC_RxBuffer+6
 569  005d b14a          	cp	a,_slave_address
 570  005f 2703          	jreq	L03
 571  0061 cc013b        	jp	L122
 572  0064               L03:
 573                     ; 91 						if(Check_Sum(&IIC_RxBuffer[2],IIC_RxBuffer[3]) == IIC_RxBuffer[7]){
 575  0064 3b002c        	push	_IIC_RxBuffer+3
 576  0067 ae002b        	ldw	x,#_IIC_RxBuffer+2
 577  006a cd0000        	call	_Check_Sum
 579  006d 5b01          	addw	sp,#1
 580  006f b130          	cp	a,_IIC_RxBuffer+7
 581  0071 2703          	jreq	L23
 582  0073 cc013b        	jp	L122
 583  0076               L23:
 584                     ; 92 							rev_heart_breat();
 586  0076 cd0000        	call	_rev_heart_breat
 588  0079 ac3b013b      	jpf	L122
 589  007d               L771:
 590                     ; 96 				case 0x55://´ò¿ª»ò¹Ø±Õ¿ª¹Ø
 590                     ; 97 					if((IIC_RxBuffer[5]&0xf0)>>4 == slave_address)	{//µØÖ·ÕýÈ
 592  007d b62e          	ld	a,_IIC_RxBuffer+5
 593  007f a4f0          	and	a,#240
 594  0081 4e            	swap	a
 595  0082 a40f          	and	a,#15
 596  0084 5f            	clrw	x
 597  0085 97            	ld	xl,a
 598  0086 b64a          	ld	a,_slave_address
 599  0088 905f          	clrw	y
 600  008a 9097          	ld	yl,a
 601  008c 90bf01        	ldw	c_y+1,y
 602  008f b301          	cpw	x,c_y+1
 603  0091 2703          	jreq	L43
 604  0093 cc013b        	jp	L122
 605  0096               L43:
 606                     ; 98 						if(Check_Sum(&IIC_RxBuffer[2],IIC_RxBuffer[3]) == IIC_RxBuffer[8]){//Ð£ÑéÕýÈ·
 608  0096 3b002c        	push	_IIC_RxBuffer+3
 609  0099 ae002b        	ldw	x,#_IIC_RxBuffer+2
 610  009c cd0000        	call	_Check_Sum
 612  009f 5b01          	addw	sp,#1
 613  00a1 b131          	cp	a,_IIC_RxBuffer+8
 614  00a3 2703          	jreq	L63
 615  00a5 cc013b        	jp	L122
 616  00a8               L63:
 617                     ; 99 							channel = IIC_RxBuffer[5]&0x0f;
 619  00a8 b62e          	ld	a,_IIC_RxBuffer+5
 620  00aa a40f          	and	a,#15
 621  00ac b708          	ld	_channel,a
 622                     ; 100 							if((channel & 0x01)==0x01)	{
 624  00ae b608          	ld	a,_channel
 625  00b0 a401          	and	a,#1
 626  00b2 a101          	cp	a,#1
 627  00b4 2626          	jrne	L542
 628                     ; 101 								spc.ch1_status = IIC_RxBuffer[6];
 630  00b6 452f60        	mov	_spc+21,_IIC_RxBuffer+6
 631                     ; 102 								if(spc.ch1_status != last_ch1_status)	{
 633  00b9 b660          	ld	a,_spc+21
 634  00bb b106          	cp	a,_last_ch1_status
 635  00bd 271a          	jreq	L742
 636                     ; 103 									if(spc.ch1_status == 0x63)	CH1_ON;
 638  00bf b660          	ld	a,_spc+21
 639  00c1 a163          	cp	a,#99
 640  00c3 260b          	jrne	L152
 643  00c5 4b08          	push	#8
 644  00c7 ae500a        	ldw	x,#20490
 645  00ca cd0000        	call	_GPIO_WriteHigh
 647  00cd 84            	pop	a
 649  00ce 2009          	jra	L742
 650  00d0               L152:
 651                     ; 104 									else												CH1_OFF;
 653  00d0 4b08          	push	#8
 654  00d2 ae500a        	ldw	x,#20490
 655  00d5 cd0000        	call	_GPIO_WriteLow
 657  00d8 84            	pop	a
 658  00d9               L742:
 659                     ; 106 								last_ch1_status = spc.ch1_status;
 661  00d9 456006        	mov	_last_ch1_status,_spc+21
 662  00dc               L542:
 663                     ; 110 							if((channel & 0x02)==0x02)	{
 665  00dc b608          	ld	a,_channel
 666  00de a402          	and	a,#2
 667  00e0 a102          	cp	a,#2
 668  00e2 2626          	jrne	L552
 669                     ; 111 								spc.ch2_status = IIC_RxBuffer[6];
 671  00e4 452f61        	mov	_spc+22,_IIC_RxBuffer+6
 672                     ; 112 								if(spc.ch2_status != last_ch2_status)	{
 674  00e7 b661          	ld	a,_spc+22
 675  00e9 b105          	cp	a,_last_ch2_status
 676  00eb 271a          	jreq	L752
 677                     ; 113 									if(spc.ch2_status == 0x63)	CH2_ON;
 679  00ed b661          	ld	a,_spc+22
 680  00ef a163          	cp	a,#99
 681  00f1 260b          	jrne	L162
 684  00f3 4b10          	push	#16
 685  00f5 ae500a        	ldw	x,#20490
 686  00f8 cd0000        	call	_GPIO_WriteHigh
 688  00fb 84            	pop	a
 690  00fc 2009          	jra	L752
 691  00fe               L162:
 692                     ; 114 									else												CH2_OFF;
 694  00fe 4b10          	push	#16
 695  0100 ae500a        	ldw	x,#20490
 696  0103 cd0000        	call	_GPIO_WriteLow
 698  0106 84            	pop	a
 699  0107               L752:
 700                     ; 116 								last_ch2_status = spc.ch2_status;
 702  0107 456105        	mov	_last_ch2_status,_spc+22
 703  010a               L552:
 704                     ; 120 							if((channel & 0x04)==0x04)	{
 706  010a b608          	ld	a,_channel
 707  010c a404          	and	a,#4
 708  010e a104          	cp	a,#4
 709  0110 2626          	jrne	L562
 710                     ; 121 								spc.ch3_status = IIC_RxBuffer[6];
 712  0112 452f62        	mov	_spc+23,_IIC_RxBuffer+6
 713                     ; 122 								if(spc.ch3_status != last_ch3_status)	{
 715  0115 b662          	ld	a,_spc+23
 716  0117 b104          	cp	a,_last_ch3_status
 717  0119 271a          	jreq	L762
 718                     ; 123 									if(spc.ch3_status == 0x63)	CH3_ON;
 720  011b b662          	ld	a,_spc+23
 721  011d a163          	cp	a,#99
 722  011f 260b          	jrne	L172
 725  0121 4b08          	push	#8
 726  0123 ae5000        	ldw	x,#20480
 727  0126 cd0000        	call	_GPIO_WriteHigh
 729  0129 84            	pop	a
 731  012a 2009          	jra	L762
 732  012c               L172:
 733                     ; 124 									else												CH3_OFF;
 735  012c 4b08          	push	#8
 736  012e ae5000        	ldw	x,#20480
 737  0131 cd0000        	call	_GPIO_WriteLow
 739  0134 84            	pop	a
 740  0135               L762:
 741                     ; 126 								last_ch3_status = spc.ch3_status;
 743  0135 456204        	mov	_last_ch3_status,_spc+23
 744  0138               L562:
 745                     ; 130 							rev_action_plug_done();
 747  0138 cd0000        	call	_rev_action_plug_done
 749  013b               L102:
 750                     ; 134 				default:
 750                     ; 135 				break;
 752  013b               L522:
 753  013b               L122:
 754                     ; 139 	}
 757  013b 84            	pop	a
 758  013c 81            	ret
 796                     ; 141 	void init_device_info(void)
 796                     ; 142 	{
 797                     .text:	section	.text,new
 798  0000               _init_device_info:
 800  0000 5221          	subw	sp,#33
 801       00000021      OFST:	set	33
 804                     ; 144 		di.frame_h1 = 0x7E;
 806  0002 a67e          	ld	a,#126
 807  0004 6b01          	ld	(OFST-32,sp),a
 808                     ; 145 		di.frame_h2 = 0x7E;
 810  0006 a67e          	ld	a,#126
 811  0008 6b02          	ld	(OFST-31,sp),a
 812                     ; 146 		di.message_id = IIC_RxBuffer[2];
 814  000a b62b          	ld	a,_IIC_RxBuffer+2
 815  000c 6b03          	ld	(OFST-30,sp),a
 816                     ; 147 		di.payload[0] = 0xB3;
 818  000e a6b3          	ld	a,#179
 819  0010 6b04          	ld	(OFST-29,sp),a
 820                     ; 148 		di.payload[1] = 0xAA;
 822  0012 a6aa          	ld	a,#170
 823  0014 6b05          	ld	(OFST-28,sp),a
 824                     ; 149 		di.payload[2] = 0x55;
 826  0016 a655          	ld	a,#85
 827  0018 6b06          	ld	(OFST-27,sp),a
 828                     ; 150 		di.payload[3] = 0xAB;
 830  001a a6ab          	ld	a,#171
 831  001c 6b07          	ld	(OFST-26,sp),a
 832                     ; 151 		di.payload[4] = 0x58;
 834  001e a658          	ld	a,#88
 835  0020 6b08          	ld	(OFST-25,sp),a
 836                     ; 152 		di.payload[5] = 0x63;
 838  0022 a663          	ld	a,#99
 839  0024 6b09          	ld	(OFST-24,sp),a
 840                     ; 153 		di.payload[6] = 0x00;
 842  0026 0f0a          	clr	(OFST-23,sp)
 843                     ; 154 		di.payload[7] = 0xc0;
 845  0028 a6c0          	ld	a,#192
 846  002a 6b0b          	ld	(OFST-22,sp),a
 847                     ; 155 		di.payload[8] = slave_address;
 849  002c b64a          	ld	a,_slave_address
 850  002e 6b0c          	ld	(OFST-21,sp),a
 851                     ; 156 		i2c_init_message(&di,9);
 853  0030 4b09          	push	#9
 854  0032 96            	ldw	x,sp
 855  0033 1c0002        	addw	x,#OFST-31
 856  0036 cd0000        	call	_i2c_init_message
 858  0039 84            	pop	a
 859                     ; 157 	}
 862  003a 5b21          	addw	sp,#33
 863  003c 81            	ret
 903                     ; 159 	void init_energy_consume(void)
 903                     ; 160 	{
 904                     .text:	section	.text,new
 905  0000               _init_energy_consume:
 907  0000 5221          	subw	sp,#33
 908       00000021      OFST:	set	33
 911                     ; 162 		eg.frame_h1 = 0x7E;
 913  0002 a67e          	ld	a,#126
 914  0004 6b01          	ld	(OFST-32,sp),a
 915                     ; 163 		eg.frame_h2 = 0x7E;
 917  0006 a67e          	ld	a,#126
 918  0008 6b02          	ld	(OFST-31,sp),a
 919                     ; 164 		eg.message_id = IIC_RxBuffer[2];
 921  000a b62b          	ld	a,_IIC_RxBuffer+2
 922  000c 6b03          	ld	(OFST-30,sp),a
 923                     ; 165 		eg.payload[0] = 0x2A;
 925  000e a62a          	ld	a,#42
 926  0010 6b04          	ld	(OFST-29,sp),a
 927                     ; 166 		eg.payload[1] = (u8)((spc.energy_consume&0xff00)>>8);
 929  0012 b664          	ld	a,_spc+25
 930  0014 97            	ld	xl,a
 931  0015 b665          	ld	a,_spc+26
 932  0017 9f            	ld	a,xl
 933  0018 a4ff          	and	a,#255
 934  001a 97            	ld	xl,a
 935  001b 4f            	clr	a
 936  001c 02            	rlwa	x,a
 937  001d 4f            	clr	a
 938  001e 01            	rrwa	x,a
 939  001f 9f            	ld	a,xl
 940  0020 6b05          	ld	(OFST-28,sp),a
 941                     ; 167 		eg.payload[2] = (u8)(spc.energy_consume&0x00ff);
 943  0022 b665          	ld	a,_spc+26
 944  0024 a4ff          	and	a,#255
 945  0026 6b06          	ld	(OFST-27,sp),a
 946                     ; 168 		eg.payload[3] = spc.MDID;
 948  0028 b65f          	ld	a,_spc+20
 949  002a 6b07          	ld	(OFST-26,sp),a
 950                     ; 169 		i2c_init_message(&eg,4);
 952  002c 4b04          	push	#4
 953  002e 96            	ldw	x,sp
 954  002f 1c0002        	addw	x,#OFST-31
 955  0032 cd0000        	call	_i2c_init_message
 957  0035 84            	pop	a
 958                     ; 170 		spc.energy_consume = 0;
 960  0036 5f            	clrw	x
 961  0037 bf64          	ldw	_spc+25,x
 962                     ; 171 		rtEG = 0;
 964  0039 ae0000        	ldw	x,#0
 965  003c bf02          	ldw	_rtEG+2,x
 966  003e ae0000        	ldw	x,#0
 967  0041 bf00          	ldw	_rtEG,x
 968                     ; 172 	}
 971  0043 5b21          	addw	sp,#33
 972  0045 81            	ret
1010                     ; 176 	void rev_heart_breat(void)
1010                     ; 177 	{
1011                     .text:	section	.text,new
1012  0000               _rev_heart_breat:
1014  0000 5221          	subw	sp,#33
1015       00000021      OFST:	set	33
1018                     ; 179 		hb.frame_h1 = 0x7E;
1020  0002 a67e          	ld	a,#126
1021  0004 6b01          	ld	(OFST-32,sp),a
1022                     ; 180 		hb.frame_h2 = 0x7E;
1024  0006 a67e          	ld	a,#126
1025  0008 6b02          	ld	(OFST-31,sp),a
1026                     ; 181 		hb.message_id = IIC_RxBuffer[2];
1028  000a b62b          	ld	a,_IIC_RxBuffer+2
1029  000c 6b03          	ld	(OFST-30,sp),a
1030                     ; 182 		hb.payload[0] = 0x06;
1032  000e a606          	ld	a,#6
1033  0010 6b04          	ld	(OFST-29,sp),a
1034                     ; 183 		hb.payload[1] = spc.MDID;
1036  0012 b65f          	ld	a,_spc+20
1037  0014 6b05          	ld	(OFST-28,sp),a
1038                     ; 184 		hb.payload[2] = spc.ch1_status;
1040  0016 b660          	ld	a,_spc+21
1041  0018 6b06          	ld	(OFST-27,sp),a
1042                     ; 185 		hb.payload[3] = spc.ch2_status;
1044  001a b661          	ld	a,_spc+22
1045  001c 6b07          	ld	(OFST-26,sp),a
1046                     ; 186 		hb.payload[4] = spc.ch3_status;
1048  001e b662          	ld	a,_spc+23
1049  0020 6b08          	ld	(OFST-25,sp),a
1050                     ; 187 		hb.payload[5] = spc.ch4_status;
1052  0022 b663          	ld	a,_spc+24
1053  0024 6b09          	ld	(OFST-24,sp),a
1054                     ; 188 		i2c_init_message(&hb,6);
1056  0026 4b06          	push	#6
1057  0028 96            	ldw	x,sp
1058  0029 1c0002        	addw	x,#OFST-31
1059  002c cd0000        	call	_i2c_init_message
1061  002f 84            	pop	a
1062                     ; 189 	}
1065  0030 5b21          	addw	sp,#33
1066  0032 81            	ret
1104                     ; 193 	void rev_action_plug_done(void)
1104                     ; 194 	{
1105                     .text:	section	.text,new
1106  0000               _rev_action_plug_done:
1108  0000 5221          	subw	sp,#33
1109       00000021      OFST:	set	33
1112                     ; 196 		ap.frame_h1 = 0x7E;
1114  0002 a67e          	ld	a,#126
1115  0004 6b01          	ld	(OFST-32,sp),a
1116                     ; 197 		ap.frame_h2 = 0x7E;
1118  0006 a67e          	ld	a,#126
1119  0008 6b02          	ld	(OFST-31,sp),a
1120                     ; 198 		ap.message_id = 66;
1122  000a a642          	ld	a,#66
1123  000c 6b03          	ld	(OFST-30,sp),a
1124                     ; 199 		ap.payload[0] = 0xAA;
1126  000e a6aa          	ld	a,#170
1127  0010 6b04          	ld	(OFST-29,sp),a
1128                     ; 200 		ap.payload[1] = 0x05;
1130  0012 a605          	ld	a,#5
1131  0014 6b05          	ld	(OFST-28,sp),a
1132                     ; 201 		ap.payload[2] = spc.MDID;
1134  0016 b65f          	ld	a,_spc+20
1135  0018 6b06          	ld	(OFST-27,sp),a
1136                     ; 202 		ap.payload[3] = spc.ch1_status;
1138  001a b660          	ld	a,_spc+21
1139  001c 6b07          	ld	(OFST-26,sp),a
1140                     ; 203 		ap.payload[4] = spc.ch2_status;
1142  001e b661          	ld	a,_spc+22
1143  0020 6b08          	ld	(OFST-25,sp),a
1144                     ; 204 		ap.payload[5] = spc.ch3_status;
1146  0022 b662          	ld	a,_spc+23
1147  0024 6b09          	ld	(OFST-24,sp),a
1148                     ; 205 		ap.payload[6] = spc.ch4_status;
1150  0026 b663          	ld	a,_spc+24
1151  0028 6b0a          	ld	(OFST-23,sp),a
1152                     ; 206 		i2c_init_message(&ap,7);
1154  002a 4b07          	push	#7
1155  002c 96            	ldw	x,sp
1156  002d 1c0002        	addw	x,#OFST-31
1157  0030 cd0000        	call	_i2c_init_message
1159  0033 84            	pop	a
1160                     ; 207 	}
1163  0034 5b21          	addw	sp,#33
1164  0036 81            	ret
1189                     ; 209 	void I2C_transaction_end(void)
1189                     ; 210 	{
1190                     .text:	section	.text,new
1191  0000               _I2C_transaction_end:
1195                     ; 211 		ReceiveState = IIC_STATE_END;
1197  0000 35030001      	mov	_ReceiveState,#3
1198                     ; 212 	}	
1201  0004 81            	ret
1226                     ; 214 	void I2C_transaction_receive(void)
1226                     ; 215 	{
1227                     .text:	section	.text,new
1228  0000               _I2C_transaction_receive:
1232                     ; 216 		ReceiveState = IIC_STATE_RECEIVEING;
1234  0000 35020001      	mov	_ReceiveState,#2
1235                     ; 217 	}
1238  0004 81            	ret
1275                     ; 219 	void I2C_byte_received(uint8_t RxData)
1275                     ; 220 	{
1276                     .text:	section	.text,new
1277  0000               _I2C_byte_received:
1279  0000 88            	push	a
1280       00000000      OFST:	set	0
1283                     ; 221 		if(GetDataIndex < MAX_BUFFER) {
1285  0001 b600          	ld	a,_GetDataIndex
1286  0003 a120          	cp	a,#32
1287  0005 2410          	jruge	L324
1288                     ; 222 			IIC_RxBuffer[GetDataIndex++] = RxData;
1290  0007 b600          	ld	a,_GetDataIndex
1291  0009 97            	ld	xl,a
1292  000a 3c00          	inc	_GetDataIndex
1293  000c 9f            	ld	a,xl
1294  000d 5f            	clrw	x
1295  000e 97            	ld	xl,a
1296  000f 7b01          	ld	a,(OFST+1,sp)
1297  0011 e729          	ld	(_IIC_RxBuffer,x),a
1298                     ; 223 			ReceiveState = IIC_STATE_RECEIVEING;
1300  0013 35020001      	mov	_ReceiveState,#2
1301  0017               L324:
1302                     ; 225 	}
1305  0017 84            	pop	a
1306  0018 81            	ret
1331                     ; 227 	uint8_t I2C_byte_write(void)
1331                     ; 228 	{
1332                     .text:	section	.text,new
1333  0000               _I2C_byte_write:
1337                     ; 229 			return IIC_TxBuffer[SendDataIndex++];
1339  0000 b602          	ld	a,_SendDataIndex
1340  0002 97            	ld	xl,a
1341  0003 3c02          	inc	_SendDataIndex
1342  0005 9f            	ld	a,xl
1343  0006 5f            	clrw	x
1344  0007 97            	ld	xl,a
1345  0008 e609          	ld	a,(_IIC_TxBuffer,x)
1348  000a 81            	ret
1351                     	switch	.ubsct
1352  0000               L534_sr1:
1353  0000 00            	ds.b	1
1354  0001               L734_sr2:
1355  0001 00            	ds.b	1
1356  0002               L144_sr3:
1357  0002 00            	ds.b	1
1413                     ; 239 @far @interrupt void I2C_Slave_check_event(void) {
1415                     .text:	section	.text,new
1416  0000               f_I2C_Slave_check_event:
1419  0000 3b0002        	push	c_x+2
1420  0003 be00          	ldw	x,c_x
1421  0005 89            	pushw	x
1422  0006 3b0002        	push	c_y+2
1423  0009 be00          	ldw	x,c_y
1424  000b 89            	pushw	x
1427                     ; 246 	sr1 = I2C->SR1;
1429  000c 5552170000    	mov	L534_sr1,21015
1430                     ; 247 	sr2 = I2C->SR2;
1432  0011 5552180001    	mov	L734_sr2,21016
1433                     ; 248 	sr3 = I2C->SR3;
1435  0016 5552190002    	mov	L144_sr3,21017
1436                     ; 251   if (sr2 & (I2C_SR2_WUFH | I2C_SR2_OVR |I2C_SR2_ARLO |I2C_SR2_BERR))
1438  001b b601          	ld	a,L734_sr2
1439  001d a52b          	bcp	a,#43
1440  001f 2708          	jreq	L174
1441                     ; 253     I2C->CR2|= I2C_CR2_STOP;  // stop communication - release the lines
1443  0021 72125211      	bset	21009,#1
1444                     ; 254     I2C->SR2= 0;					    // clear all error flags
1446  0025 725f5218      	clr	21016
1447  0029               L174:
1448                     ; 257   if ((sr1 & (I2C_SR1_RXNE | I2C_SR1_BTF)) == (I2C_SR1_RXNE | I2C_SR1_BTF))
1450  0029 b600          	ld	a,L534_sr1
1451  002b a444          	and	a,#68
1452  002d a144          	cp	a,#68
1453  002f 2606          	jrne	L374
1454                     ; 259     I2C_byte_received(I2C->DR);
1456  0031 c65216        	ld	a,21014
1457  0034 cd0000        	call	_I2C_byte_received
1459  0037               L374:
1460                     ; 262   if (sr1 & I2C_SR1_RXNE)
1462  0037 b600          	ld	a,L534_sr1
1463  0039 a540          	bcp	a,#64
1464  003b 2706          	jreq	L574
1465                     ; 264     I2C_byte_received(I2C->DR);
1467  003d c65216        	ld	a,21014
1468  0040 cd0000        	call	_I2C_byte_received
1470  0043               L574:
1471                     ; 267   if (sr2 & I2C_SR2_AF)
1473  0043 b601          	ld	a,L734_sr2
1474  0045 a504          	bcp	a,#4
1475  0047 2707          	jreq	L774
1476                     ; 269     I2C->SR2 &= ~I2C_SR2_AF;	  // clear AF
1478  0049 72155218      	bres	21016,#2
1479                     ; 270 		I2C_transaction_end();
1481  004d cd0000        	call	_I2C_transaction_end
1483  0050               L774:
1484                     ; 273   if (sr1 & I2C_SR1_STOPF) 
1486  0050 b600          	ld	a,L534_sr1
1487  0052 a510          	bcp	a,#16
1488  0054 2707          	jreq	L105
1489                     ; 275     I2C->CR2 |= I2C_CR2_ACK;	  // CR2 write to clear STOPF
1491  0056 72145211      	bset	21009,#2
1492                     ; 276 		I2C_transaction_end();
1494  005a cd0000        	call	_I2C_transaction_end
1496  005d               L105:
1497                     ; 279   if (sr1 & I2C_SR1_ADDR)
1499  005d b600          	ld	a,L534_sr1
1500  005f a502          	bcp	a,#2
1501  0061 270e          	jreq	L305
1502                     ; 281 		if(sr3 & I2C_SR3_TRA){//´Ó»ú·¢ËÍÊý¾Ý
1504  0063 b602          	ld	a,L144_sr3
1505  0065 a504          	bcp	a,#4
1506  0067 2705          	jreq	L505
1507                     ; 282 			I2C_transaction_begin();
1509  0069 cd0000        	call	_I2C_transaction_begin
1512  006c 2003          	jra	L305
1513  006e               L505:
1514                     ; 284 			I2C_receive_begin();//´Ó»ú½ÓÊÕÊý¾Ý
1516  006e cd0000        	call	_I2C_receive_begin
1518  0071               L305:
1519                     ; 288   if ((sr1 & (I2C_SR1_TXE | I2C_SR1_BTF)) == (I2C_SR1_TXE | I2C_SR1_BTF))
1521  0071 b600          	ld	a,L534_sr1
1522  0073 a484          	and	a,#132
1523  0075 a184          	cp	a,#132
1524  0077 2606          	jrne	L115
1525                     ; 290 		I2C->DR = I2C_byte_write();
1527  0079 cd0000        	call	_I2C_byte_write
1529  007c c75216        	ld	21014,a
1530  007f               L115:
1531                     ; 293   if (sr1 & I2C_SR1_TXE)
1533  007f b600          	ld	a,L534_sr1
1534  0081 a580          	bcp	a,#128
1535  0083 2706          	jreq	L315
1536                     ; 295 		I2C->DR = I2C_byte_write();
1538  0085 cd0000        	call	_I2C_byte_write
1540  0088 c75216        	ld	21014,a
1541  008b               L315:
1542                     ; 298 }
1545  008b 85            	popw	x
1546  008c bf00          	ldw	c_y,x
1547  008e 320002        	pop	c_y+2
1548  0091 85            	popw	x
1549  0092 bf00          	ldw	c_x,x
1550  0094 320002        	pop	c_x+2
1551  0097 80            	iret
1574                     ; 303 void IIC_SlaveConfig (void)
1574                     ; 304 {
1576                     .text:	section	.text,new
1577  0000               _IIC_SlaveConfig:
1581                     ; 315 		I2C->CR1 |= 0x01;				        	// Enable I2C peripheral
1583  0000 72105210      	bset	21008,#0
1584                     ; 316 		I2C->CR2 = 0x04;					      		// Enable I2C acknowledgement
1586  0004 35045211      	mov	21009,#4
1587                     ; 317 		I2C->FREQR = 16; 					      	// Set I2C Freq value (16MHz)
1589  0008 35105212      	mov	21010,#16
1590                     ; 319 		I2C->OARL = (SLAVE_ADDRESS << 1) ;	// set slave address to 0x51 (put 0xA2 for the register dues to7bit address) 
1592  000c b64a          	ld	a,_slave_address
1593  000e 48            	sll	a
1594  000f c75213        	ld	21011,a
1595                     ; 320 		I2C->OARH = 0x40;					      	// Set 7bit address mode
1597  0012 35405214      	mov	21012,#64
1598                     ; 333 	I2C->ITR	= 0x07;					      // all I2C interrupt enable  
1600  0016 3507521a      	mov	21018,#7
1601                     ; 334 }
1604  001a 81            	ret
1957                     	xdef	_I2C_byte_write
1958                     	xdef	_I2C_byte_received
1959                     	xdef	_I2C_transaction_receive
1960                     	xdef	_I2C_transaction_end
1961                     	xdef	_I2C_transaction_begin
1962                     	xdef	_I2C_receive_begin
1963                     	xdef	_i2c_init_message
1964                     	xdef	_Check_Sum
1965                     	xdef	_mymemcpy
1966                     	switch	.ubsct
1967  0003               _action_flag:
1968  0003 00            	ds.b	1
1969                     	xdef	_action_flag
1970  0004               _last_ch3_status:
1971  0004 00            	ds.b	1
1972                     	xdef	_last_ch3_status
1973  0005               _last_ch2_status:
1974  0005 00            	ds.b	1
1975                     	xdef	_last_ch2_status
1976  0006               _last_ch1_status:
1977  0006 00            	ds.b	1
1978                     	xdef	_last_ch1_status
1979  0007               _ext:
1980  0007 00            	ds.b	1
1981                     	xdef	_ext
1982  0008               _channel:
1983  0008 00            	ds.b	1
1984                     	xdef	_channel
1985                     	xdef	_SendDataIndex
1986                     	xdef	_ReceiveState
1987                     	xdef	_GetDataIndex
1988  0009               _IIC_TxBuffer:
1989  0009 000000000000  	ds.b	32
1990                     	xdef	_IIC_TxBuffer
1991  0029               _IIC_RxBuffer:
1992  0029 000000000000  	ds.b	32
1993                     	xdef	_IIC_RxBuffer
1994  0049               _action_done:
1995  0049 00            	ds.b	1
1996                     	xdef	_action_done
1997  004a               _slave_address:
1998  004a 00            	ds.b	1
1999                     	xdef	_slave_address
2000  004b               _spc:
2001  004b 000000000000  	ds.b	27
2002                     	xdef	_spc
2003                     	xref.b	_rtEG
2004                     	xdef	_rev_action_plug_done
2005                     	xdef	_init_energy_consume
2006                     	xdef	_rev_heart_breat
2007                     	xdef	_init_device_info
2008                     	xdef	f_I2C_Slave_check_event
2009                     	xdef	_IIC_SlaveConfig
2010                     	xref	_GPIO_WriteLow
2011                     	xref	_GPIO_WriteHigh
2012                     	xref.b	c_lreg
2013                     	xref.b	c_x
2014                     	xref.b	c_y
2034                     	xref	c_ftoi
2035                     	xref	c_lrzmp
2036                     	xref	c_lgsbc
2037                     	xref	c_ltor
2038                     	end
