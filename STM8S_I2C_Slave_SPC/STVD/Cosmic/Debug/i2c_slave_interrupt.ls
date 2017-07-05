   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
   4                     	bsct
   5  0000               _GetDataIndex:
   6  0000 00            	dc.b	0
   7  0001               _ReceiveState:
   8  0001 00            	dc.b	0
   9  0002               _SendDataIndex:
  10  0002 00            	dc.b	0
  91                     ; 36 void mymemcpy(void *des,void *src,u32 n)  
  91                     ; 37 {  
  93                     .text:	section	.text,new
  94  0000               _mymemcpy:
  96  0000 89            	pushw	x
  97  0001 5204          	subw	sp,#4
  98       00000004      OFST:	set	4
 101                     ; 38   u8 *xdes=des;
 103  0003 1f01          	ldw	(OFST-3,sp),x
 104                     ; 39 	u8 *xsrc=src; 
 106  0005 1e09          	ldw	x,(OFST+5,sp)
 107  0007 1f03          	ldw	(OFST-1,sp),x
 109  0009 2016          	jra	L35
 110  000b               L74:
 111                     ; 40   while(n--)*xdes++=*xsrc++;  
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
 138                     ; 41 }  
 141  0036 5b06          	addw	sp,#6
 142  0038 81            	ret
 204                     ; 47 u8 Check_Sum(u8 *buf,u8 length)
 204                     ; 48 {
 205                     .text:	section	.text,new
 206  0000               _Check_Sum:
 208  0000 89            	pushw	x
 209  0001 89            	pushw	x
 210       00000002      OFST:	set	2
 213                     ; 50 	u8 result = *buf++;
 215  0002 1e03          	ldw	x,(OFST+1,sp)
 216  0004 1c0001        	addw	x,#1
 217  0007 1f03          	ldw	(OFST+1,sp),x
 218  0009 1d0001        	subw	x,#1
 219  000c f6            	ld	a,(x)
 220  000d 6b01          	ld	(OFST-1,sp),a
 221                     ; 51 	for(i = 1;i < length;i++)
 223  000f a601          	ld	a,#1
 224  0011 6b02          	ld	(OFST+0,sp),a
 226  0013 2011          	jra	L511
 227  0015               L111:
 228                     ; 53 		result ^= *buf++;
 230  0015 1e03          	ldw	x,(OFST+1,sp)
 231  0017 1c0001        	addw	x,#1
 232  001a 1f03          	ldw	(OFST+1,sp),x
 233  001c 1d0001        	subw	x,#1
 234  001f 7b01          	ld	a,(OFST-1,sp)
 235  0021 f8            	xor	a,	(x)
 236  0022 6b01          	ld	(OFST-1,sp),a
 237                     ; 51 	for(i = 1;i < length;i++)
 239  0024 0c02          	inc	(OFST+0,sp)
 240  0026               L511:
 243  0026 7b02          	ld	a,(OFST+0,sp)
 244  0028 1107          	cp	a,(OFST+5,sp)
 245  002a 25e9          	jrult	L111
 246                     ; 55 	return result;
 248  002c 7b01          	ld	a,(OFST-1,sp)
 251  002e 5b04          	addw	sp,#4
 252  0030 81            	ret
 339                     ; 59 u8 i2c_init_message(I2C_Message *tx,u8 payload_len)
 339                     ; 60 {
 340                     .text:	section	.text,new
 341  0000               _i2c_init_message:
 343  0000 89            	pushw	x
 344       00000000      OFST:	set	0
 347                     ; 61 	IIC_TxBuffer[0] = tx->frame_h1;
 349  0001 f6            	ld	a,(x)
 350  0002 b70a          	ld	_IIC_TxBuffer,a
 351                     ; 62 	IIC_TxBuffer[1] = tx->frame_h2;
 353  0004 e601          	ld	a,(1,x)
 354  0006 b70b          	ld	_IIC_TxBuffer+1,a
 355                     ; 63 	IIC_TxBuffer[2] = tx->message_id;
 357  0008 e602          	ld	a,(2,x)
 358  000a b70c          	ld	_IIC_TxBuffer+2,a
 359                     ; 64 	IIC_TxBuffer[3] = 2+payload_len;
 361  000c 7b05          	ld	a,(OFST+5,sp)
 362  000e ab02          	add	a,#2
 363  0010 b70d          	ld	_IIC_TxBuffer+3,a
 364                     ; 65 	mymemcpy(&IIC_TxBuffer[4],tx->payload,payload_len);
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
 378  0028 ae000e        	ldw	x,#_IIC_TxBuffer+4
 379  002b cd0000        	call	_mymemcpy
 381  002e 5b06          	addw	sp,#6
 382                     ; 66 	IIC_TxBuffer[4+payload_len] = Check_Sum(&IIC_TxBuffer[2],IIC_TxBuffer[3]);
 384  0030 7b05          	ld	a,(OFST+5,sp)
 385  0032 5f            	clrw	x
 386  0033 97            	ld	xl,a
 387  0034 89            	pushw	x
 388  0035 3b000d        	push	_IIC_TxBuffer+3
 389  0038 ae000c        	ldw	x,#_IIC_TxBuffer+2
 390  003b cd0000        	call	_Check_Sum
 392  003e 5b01          	addw	sp,#1
 393  0040 85            	popw	x
 394  0041 e70e          	ld	(_IIC_TxBuffer+4,x),a
 395                     ; 68 }
 398  0043 85            	popw	x
 399  0044 81            	ret
 423                     ; 70 	void I2C_receive_begin(void)
 423                     ; 71 	{
 424                     .text:	section	.text,new
 425  0000               _I2C_receive_begin:
 429                     ; 72 		ReceiveState = IIC_STATE_BEGIN;
 431  0000 35010001      	mov	_ReceiveState,#1
 432                     ; 73 	}
 435  0004 81            	ret
 485                     ; 75 	void I2C_transaction_begin(void)
 485                     ; 76 	{
 486                     .text:	section	.text,new
 487  0000               _I2C_transaction_begin:
 489  0000 88            	push	a
 490       00000001      OFST:	set	1
 493                     ; 80 		SendDataIndex = 0;
 495  0001 3f02          	clr	_SendDataIndex
 496                     ; 81 		cmd = IIC_RxBuffer[4];
 498  0003 b62e          	ld	a,_IIC_RxBuffer+4
 499  0005 6b01          	ld	(OFST+0,sp),a
 500                     ; 83 		if((IIC_RxBuffer[0] == 0x7E) && (IIC_RxBuffer[1] == 0x7E)){
 502  0007 b62a          	ld	a,_IIC_RxBuffer
 503  0009 a17e          	cp	a,#126
 504  000b 2703          	jreq	L61
 505  000d cc0112        	jp	L122
 506  0010               L61:
 508  0010 b62b          	ld	a,_IIC_RxBuffer+1
 509  0012 a17e          	cp	a,#126
 510  0014 2703          	jreq	L02
 511  0016 cc0112        	jp	L122
 512  0019               L02:
 513                     ; 84 			switch(cmd){
 515  0019 7b01          	ld	a,(OFST+0,sp)
 517                     ; 130 				default:
 517                     ; 131 				break;
 518  001b a003          	sub	a,#3
 519  001d 2733          	jreq	L571
 520  001f a052          	sub	a,#82
 521  0021 275a          	jreq	L771
 522  0023 a0a9          	sub	a,#169
 523  0025 2703          	jreq	L22
 524  0027 cc0112        	jp	L122
 525  002a               L22:
 526                     ; 85 				case 0xFE:
 526                     ; 86 					if(IIC_RxBuffer[5] == 0x01)	init_device_info();
 528  002a b62f          	ld	a,_IIC_RxBuffer+5
 529  002c a101          	cp	a,#1
 530  002e 2607          	jrne	L722
 533  0030 cd0000        	call	_init_device_info
 536  0033 ac120112      	jpf	L122
 537  0037               L722:
 538                     ; 87 					else if(IIC_RxBuffer[5] == 0x02)	{spc.energy_consume = (u16)rtEG;init_energy_consume();}
 540  0037 b62f          	ld	a,_IIC_RxBuffer+5
 541  0039 a102          	cp	a,#2
 542  003b 2703          	jreq	L42
 543  003d cc0112        	jp	L122
 544  0040               L42:
 547  0040 ae0000        	ldw	x,#_rtEG
 548  0043 cd0000        	call	c_ltor
 550  0046 cd0000        	call	c_ftoi
 552  0049 bf65          	ldw	_spc+25,x
 555  004b cd0000        	call	_init_energy_consume
 557  004e ac120112      	jpf	L122
 558  0052               L571:
 559                     ; 89 				case 0x03:
 559                     ; 90 					if((IIC_RxBuffer[5] == 0x03)&&(IIC_RxBuffer[6] == slave_address)){
 561  0052 b62f          	ld	a,_IIC_RxBuffer+5
 562  0054 a103          	cp	a,#3
 563  0056 2703          	jreq	L62
 564  0058 cc0112        	jp	L122
 565  005b               L62:
 567  005b b630          	ld	a,_IIC_RxBuffer+6
 568  005d b14b          	cp	a,_slave_address
 569  005f 2703          	jreq	L03
 570  0061 cc0112        	jp	L122
 571  0064               L03:
 572                     ; 92 						if(Check_Sum(&IIC_RxBuffer[2],IIC_RxBuffer[3]) == IIC_RxBuffer[7]){
 574  0064 3b002d        	push	_IIC_RxBuffer+3
 575  0067 ae002c        	ldw	x,#_IIC_RxBuffer+2
 576  006a cd0000        	call	_Check_Sum
 578  006d 5b01          	addw	sp,#1
 579  006f b131          	cp	a,_IIC_RxBuffer+7
 580  0071 2703          	jreq	L23
 581  0073 cc0112        	jp	L122
 582  0076               L23:
 583                     ; 93 							rev_heart_breat();
 585  0076 cd0000        	call	_rev_heart_breat
 587  0079 ac120112      	jpf	L122
 588  007d               L771:
 589                     ; 97 				case 0x55://´ò¿ª»ò¹Ø±Õ¿ª¹Ø
 589                     ; 98 					if((IIC_RxBuffer[5]&0xf0)>>4 == slave_address)	{//µØÖ·ÕýÈ
 591  007d b62f          	ld	a,_IIC_RxBuffer+5
 592  007f a4f0          	and	a,#240
 593  0081 4e            	swap	a
 594  0082 a40f          	and	a,#15
 595  0084 5f            	clrw	x
 596  0085 97            	ld	xl,a
 597  0086 b64b          	ld	a,_slave_address
 598  0088 905f          	clrw	y
 599  008a 9097          	ld	yl,a
 600  008c 90bf01        	ldw	c_y+1,y
 601  008f b301          	cpw	x,c_y+1
 602  0091 267f          	jrne	L122
 603                     ; 99 						if(Check_Sum(&IIC_RxBuffer[2],IIC_RxBuffer[3]) == IIC_RxBuffer[8]){//Ð£ÑéÕýÈ·
 605  0093 3b002d        	push	_IIC_RxBuffer+3
 606  0096 ae002c        	ldw	x,#_IIC_RxBuffer+2
 607  0099 cd0000        	call	_Check_Sum
 609  009c 5b01          	addw	sp,#1
 610  009e b132          	cp	a,_IIC_RxBuffer+8
 611  00a0 2670          	jrne	L122
 612                     ; 100 							channel = IIC_RxBuffer[5]&0x0f;
 614  00a2 b62f          	ld	a,_IIC_RxBuffer+5
 615  00a4 a40f          	and	a,#15
 616  00a6 b709          	ld	_channel,a
 617                     ; 101 							if((channel & 0x01)==0x01)	{
 619  00a8 b609          	ld	a,_channel
 620  00aa a401          	and	a,#1
 621  00ac a101          	cp	a,#1
 622  00ae 2626          	jrne	L542
 623                     ; 102 								spc.ch1_status = IIC_RxBuffer[6];
 625  00b0 453061        	mov	_spc+21,_IIC_RxBuffer+6
 626                     ; 103 								if(spc.ch1_status != last_ch1_status)	{
 628  00b3 b661          	ld	a,_spc+21
 629  00b5 b107          	cp	a,_last_ch1_status
 630  00b7 271a          	jreq	L742
 631                     ; 104 									if(spc.ch1_status == 0x63)	CH1_ON;
 633  00b9 b661          	ld	a,_spc+21
 634  00bb a163          	cp	a,#99
 635  00bd 260b          	jrne	L152
 638  00bf 4b08          	push	#8
 639  00c1 ae500a        	ldw	x,#20490
 640  00c4 cd0000        	call	_GPIO_WriteHigh
 642  00c7 84            	pop	a
 644  00c8 2009          	jra	L742
 645  00ca               L152:
 646                     ; 105 									else												CH1_OFF;
 648  00ca 4b08          	push	#8
 649  00cc ae500a        	ldw	x,#20490
 650  00cf cd0000        	call	_GPIO_WriteLow
 652  00d2 84            	pop	a
 653  00d3               L742:
 654                     ; 107 								last_ch1_status = spc.ch1_status;
 656  00d3 456107        	mov	_last_ch1_status,_spc+21
 657  00d6               L542:
 658                     ; 111 							if((channel & 0x02)==0x02)	{
 660  00d6 b609          	ld	a,_channel
 661  00d8 a402          	and	a,#2
 662  00da a102          	cp	a,#2
 663  00dc 2626          	jrne	L552
 664                     ; 112 								spc.ch2_status = IIC_RxBuffer[6];
 666  00de 453062        	mov	_spc+22,_IIC_RxBuffer+6
 667                     ; 113 								if(spc.ch2_status != last_ch2_status)	{
 669  00e1 b662          	ld	a,_spc+22
 670  00e3 b106          	cp	a,_last_ch2_status
 671  00e5 271a          	jreq	L752
 672                     ; 114 									if(spc.ch2_status == 0x63)	CH2_ON;
 674  00e7 b662          	ld	a,_spc+22
 675  00e9 a163          	cp	a,#99
 676  00eb 260b          	jrne	L162
 679  00ed 4b10          	push	#16
 680  00ef ae500a        	ldw	x,#20490
 681  00f2 cd0000        	call	_GPIO_WriteHigh
 683  00f5 84            	pop	a
 685  00f6 2009          	jra	L752
 686  00f8               L162:
 687                     ; 115 									else												CH2_OFF;
 689  00f8 4b10          	push	#16
 690  00fa ae500a        	ldw	x,#20490
 691  00fd cd0000        	call	_GPIO_WriteLow
 693  0100 84            	pop	a
 694  0101               L752:
 695                     ; 117 								last_ch2_status = spc.ch2_status;
 697  0101 456206        	mov	_last_ch2_status,_spc+22
 698  0104               L552:
 699                     ; 121 							if((channel & 0x04)==0x04)	{
 701  0104 b609          	ld	a,_channel
 702  0106 a404          	and	a,#4
 703  0108 a104          	cp	a,#4
 704  010a 2603          	jrne	L562
 705                     ; 122 								spc.ch3_status = IIC_RxBuffer[6];
 707  010c 453063        	mov	_spc+23,_IIC_RxBuffer+6
 708  010f               L562:
 709                     ; 126 							rev_action_plug_done();
 711  010f cd0000        	call	_rev_action_plug_done
 713  0112               L102:
 714                     ; 130 				default:
 714                     ; 131 				break;
 716  0112               L522:
 717  0112               L122:
 718                     ; 135 	}
 721  0112 84            	pop	a
 722  0113 81            	ret
 760                     ; 137 	void init_device_info(void)
 760                     ; 138 	{
 761                     .text:	section	.text,new
 762  0000               _init_device_info:
 764  0000 5221          	subw	sp,#33
 765       00000021      OFST:	set	33
 768                     ; 140 		di.frame_h1 = 0x7E;
 770  0002 a67e          	ld	a,#126
 771  0004 6b01          	ld	(OFST-32,sp),a
 772                     ; 141 		di.frame_h2 = 0x7E;
 774  0006 a67e          	ld	a,#126
 775  0008 6b02          	ld	(OFST-31,sp),a
 776                     ; 142 		di.message_id = IIC_RxBuffer[2];
 778  000a b62c          	ld	a,_IIC_RxBuffer+2
 779  000c 6b03          	ld	(OFST-30,sp),a
 780                     ; 143 		di.payload[0] = 0xB3;
 782  000e a6b3          	ld	a,#179
 783  0010 6b04          	ld	(OFST-29,sp),a
 784                     ; 144 		di.payload[1] = 0x01;
 786  0012 a601          	ld	a,#1
 787  0014 6b05          	ld	(OFST-28,sp),a
 788                     ; 145 		di.payload[2] = 0x01;
 790  0016 a601          	ld	a,#1
 791  0018 6b06          	ld	(OFST-27,sp),a
 792                     ; 146 		di.payload[3] = 0x01;
 794  001a a601          	ld	a,#1
 795  001c 6b07          	ld	(OFST-26,sp),a
 796                     ; 147 		di.payload[4] = 0x01;
 798  001e a601          	ld	a,#1
 799  0020 6b08          	ld	(OFST-25,sp),a
 800                     ; 148 		di.payload[5] = 0x63;
 802  0022 a663          	ld	a,#99
 803  0024 6b09          	ld	(OFST-24,sp),a
 804                     ; 149 		di.payload[6] = 0x00;
 806  0026 0f0a          	clr	(OFST-23,sp)
 807                     ; 150 		di.payload[7] = 0xc0;
 809  0028 a6c0          	ld	a,#192
 810  002a 6b0b          	ld	(OFST-22,sp),a
 811                     ; 151 		di.payload[8] = slave_address;
 813  002c b64b          	ld	a,_slave_address
 814  002e 6b0c          	ld	(OFST-21,sp),a
 815                     ; 152 		i2c_init_message(&di,9);
 817  0030 4b09          	push	#9
 818  0032 96            	ldw	x,sp
 819  0033 1c0002        	addw	x,#OFST-31
 820  0036 cd0000        	call	_i2c_init_message
 822  0039 84            	pop	a
 823                     ; 153 	}
 826  003a 5b21          	addw	sp,#33
 827  003c 81            	ret
 867                     ; 155 	void init_energy_consume(void)
 867                     ; 156 	{
 868                     .text:	section	.text,new
 869  0000               _init_energy_consume:
 871  0000 5221          	subw	sp,#33
 872       00000021      OFST:	set	33
 875                     ; 158 		eg.frame_h1 = 0x7E;
 877  0002 a67e          	ld	a,#126
 878  0004 6b01          	ld	(OFST-32,sp),a
 879                     ; 159 		eg.frame_h2 = 0x7E;
 881  0006 a67e          	ld	a,#126
 882  0008 6b02          	ld	(OFST-31,sp),a
 883                     ; 160 		eg.message_id = IIC_RxBuffer[2];
 885  000a b62c          	ld	a,_IIC_RxBuffer+2
 886  000c 6b03          	ld	(OFST-30,sp),a
 887                     ; 161 		eg.payload[0] = 0x2A;
 889  000e a62a          	ld	a,#42
 890  0010 6b04          	ld	(OFST-29,sp),a
 891                     ; 162 		eg.payload[1] = (u8)((spc.energy_consume&0xff00)>>8);
 893  0012 b665          	ld	a,_spc+25
 894  0014 97            	ld	xl,a
 895  0015 b666          	ld	a,_spc+26
 896  0017 9f            	ld	a,xl
 897  0018 a4ff          	and	a,#255
 898  001a 97            	ld	xl,a
 899  001b 4f            	clr	a
 900  001c 02            	rlwa	x,a
 901  001d 4f            	clr	a
 902  001e 01            	rrwa	x,a
 903  001f 9f            	ld	a,xl
 904  0020 6b05          	ld	(OFST-28,sp),a
 905                     ; 163 		eg.payload[2] = (u8)(spc.energy_consume&0x00ff);
 907  0022 b666          	ld	a,_spc+26
 908  0024 a4ff          	and	a,#255
 909  0026 6b06          	ld	(OFST-27,sp),a
 910                     ; 164 		eg.payload[3] = spc.MDID;
 912  0028 b660          	ld	a,_spc+20
 913  002a 6b07          	ld	(OFST-26,sp),a
 914                     ; 165 		i2c_init_message(&eg,4);
 916  002c 4b04          	push	#4
 917  002e 96            	ldw	x,sp
 918  002f 1c0002        	addw	x,#OFST-31
 919  0032 cd0000        	call	_i2c_init_message
 921  0035 84            	pop	a
 922                     ; 166 		spc.energy_consume = 0;
 924  0036 5f            	clrw	x
 925  0037 bf65          	ldw	_spc+25,x
 926                     ; 167 		rtEG = 0;
 928  0039 ae0000        	ldw	x,#0
 929  003c bf02          	ldw	_rtEG+2,x
 930  003e ae0000        	ldw	x,#0
 931  0041 bf00          	ldw	_rtEG,x
 932                     ; 168 	}
 935  0043 5b21          	addw	sp,#33
 936  0045 81            	ret
 974                     ; 172 	void rev_heart_breat(void)
 974                     ; 173 	{
 975                     .text:	section	.text,new
 976  0000               _rev_heart_breat:
 978  0000 5221          	subw	sp,#33
 979       00000021      OFST:	set	33
 982                     ; 175 		hb.frame_h1 = 0x7E;
 984  0002 a67e          	ld	a,#126
 985  0004 6b01          	ld	(OFST-32,sp),a
 986                     ; 176 		hb.frame_h2 = 0x7E;
 988  0006 a67e          	ld	a,#126
 989  0008 6b02          	ld	(OFST-31,sp),a
 990                     ; 177 		hb.message_id = IIC_RxBuffer[2];
 992  000a b62c          	ld	a,_IIC_RxBuffer+2
 993  000c 6b03          	ld	(OFST-30,sp),a
 994                     ; 178 		hb.payload[0] = 0x06;
 996  000e a606          	ld	a,#6
 997  0010 6b04          	ld	(OFST-29,sp),a
 998                     ; 179 		hb.payload[1] = spc.MDID;
1000  0012 b660          	ld	a,_spc+20
1001  0014 6b05          	ld	(OFST-28,sp),a
1002                     ; 180 		hb.payload[2] = spc.ch1_status;
1004  0016 b661          	ld	a,_spc+21
1005  0018 6b06          	ld	(OFST-27,sp),a
1006                     ; 181 		hb.payload[3] = spc.ch2_status;
1008  001a b662          	ld	a,_spc+22
1009  001c 6b07          	ld	(OFST-26,sp),a
1010                     ; 182 		hb.payload[4] = spc.ch3_status;
1012  001e b663          	ld	a,_spc+23
1013  0020 6b08          	ld	(OFST-25,sp),a
1014                     ; 183 		hb.payload[5] = spc.ch4_status;
1016  0022 b664          	ld	a,_spc+24
1017  0024 6b09          	ld	(OFST-24,sp),a
1018                     ; 184 		i2c_init_message(&hb,6);
1020  0026 4b06          	push	#6
1021  0028 96            	ldw	x,sp
1022  0029 1c0002        	addw	x,#OFST-31
1023  002c cd0000        	call	_i2c_init_message
1025  002f 84            	pop	a
1026                     ; 185 	}
1029  0030 5b21          	addw	sp,#33
1030  0032 81            	ret
1069                     ; 187 	void rev_action_dimmer_OK(void)
1069                     ; 188 	{
1070                     .text:	section	.text,new
1071  0000               _rev_action_dimmer_OK:
1073  0000 5221          	subw	sp,#33
1074       00000021      OFST:	set	33
1077                     ; 190 		ad.frame_h1 = 0x7E;
1079  0002 a67e          	ld	a,#126
1080  0004 6b01          	ld	(OFST-32,sp),a
1081                     ; 191 		ad.frame_h2 = 0x7E;
1083  0006 a67e          	ld	a,#126
1084  0008 6b02          	ld	(OFST-31,sp),a
1085                     ; 192 		ad.message_id = IIC_RxBuffer[2];
1087  000a b62c          	ld	a,_IIC_RxBuffer+2
1088  000c 6b03          	ld	(OFST-30,sp),a
1089                     ; 193 		ad.payload[0] = 0xAA;
1091  000e a6aa          	ld	a,#170
1092  0010 6b04          	ld	(OFST-29,sp),a
1093                     ; 194 		ad.payload[1] = 0x02;
1095  0012 a602          	ld	a,#2
1096  0014 6b05          	ld	(OFST-28,sp),a
1097                     ; 195 		ad.payload[2] = spc.MDID;
1099  0016 b660          	ld	a,_spc+20
1100  0018 6b06          	ld	(OFST-27,sp),a
1101                     ; 196 		i2c_init_message(&ad,3);
1103  001a 4b03          	push	#3
1104  001c 96            	ldw	x,sp
1105  001d 1c0002        	addw	x,#OFST-31
1106  0020 cd0000        	call	_i2c_init_message
1108  0023 84            	pop	a
1109                     ; 197 	}
1112  0024 5b21          	addw	sp,#33
1113  0026 81            	ret
1151                     ; 200 	void rev_action_dimmer_done(void)
1151                     ; 201 	{
1152                     .text:	section	.text,new
1153  0000               _rev_action_dimmer_done:
1155  0000 5221          	subw	sp,#33
1156       00000021      OFST:	set	33
1159                     ; 203 		ad.frame_h1 = 0x7E;
1161  0002 a67e          	ld	a,#126
1162  0004 6b01          	ld	(OFST-32,sp),a
1163                     ; 204 		ad.frame_h2 = 0x7E;
1165  0006 a67e          	ld	a,#126
1166  0008 6b02          	ld	(OFST-31,sp),a
1167                     ; 205 		ad.message_id = 66;
1169  000a a642          	ld	a,#66
1170  000c 6b03          	ld	(OFST-30,sp),a
1171                     ; 206 		ad.payload[0] = 0xAA;
1173  000e a6aa          	ld	a,#170
1174  0010 6b04          	ld	(OFST-29,sp),a
1175                     ; 207 		ad.payload[1] = 0x05;
1177  0012 a605          	ld	a,#5
1178  0014 6b05          	ld	(OFST-28,sp),a
1179                     ; 208 		ad.payload[2] = spc.MDID;
1181  0016 b660          	ld	a,_spc+20
1182  0018 6b06          	ld	(OFST-27,sp),a
1183                     ; 209 		ad.payload[3] = spc.ch1_status;
1185  001a b661          	ld	a,_spc+21
1186  001c 6b07          	ld	(OFST-26,sp),a
1187                     ; 210 		ad.payload[4] = spc.ch2_status;
1189  001e b662          	ld	a,_spc+22
1190  0020 6b08          	ld	(OFST-25,sp),a
1191                     ; 211 		ad.payload[5] = spc.ch3_status;
1193  0022 b663          	ld	a,_spc+23
1194  0024 6b09          	ld	(OFST-24,sp),a
1195                     ; 212 		ad.payload[6] = spc.ch4_status;
1197  0026 b664          	ld	a,_spc+24
1198  0028 6b0a          	ld	(OFST-23,sp),a
1199                     ; 213 		i2c_init_message(&ad,7);
1201  002a 4b07          	push	#7
1202  002c 96            	ldw	x,sp
1203  002d 1c0002        	addw	x,#OFST-31
1204  0030 cd0000        	call	_i2c_init_message
1206  0033 84            	pop	a
1207                     ; 214 	}
1210  0034 5b21          	addw	sp,#33
1211  0036 81            	ret
1249                     ; 216 	void rev_action_plug_done(void)
1249                     ; 217 	{
1250                     .text:	section	.text,new
1251  0000               _rev_action_plug_done:
1253  0000 5221          	subw	sp,#33
1254       00000021      OFST:	set	33
1257                     ; 219 		ap.frame_h1 = 0x7E;
1259  0002 a67e          	ld	a,#126
1260  0004 6b01          	ld	(OFST-32,sp),a
1261                     ; 220 		ap.frame_h2 = 0x7E;
1263  0006 a67e          	ld	a,#126
1264  0008 6b02          	ld	(OFST-31,sp),a
1265                     ; 221 		ap.message_id = 66;
1267  000a a642          	ld	a,#66
1268  000c 6b03          	ld	(OFST-30,sp),a
1269                     ; 222 		ap.payload[0] = 0xAA;
1271  000e a6aa          	ld	a,#170
1272  0010 6b04          	ld	(OFST-29,sp),a
1273                     ; 223 		ap.payload[1] = 0x05;
1275  0012 a605          	ld	a,#5
1276  0014 6b05          	ld	(OFST-28,sp),a
1277                     ; 224 		ap.payload[2] = spc.MDID;
1279  0016 b660          	ld	a,_spc+20
1280  0018 6b06          	ld	(OFST-27,sp),a
1281                     ; 225 		ap.payload[3] = spc.ch1_status;
1283  001a b661          	ld	a,_spc+21
1284  001c 6b07          	ld	(OFST-26,sp),a
1285                     ; 226 		ap.payload[4] = spc.ch2_status;
1287  001e b662          	ld	a,_spc+22
1288  0020 6b08          	ld	(OFST-25,sp),a
1289                     ; 227 		ap.payload[5] = spc.ch3_status;
1291  0022 b663          	ld	a,_spc+23
1292  0024 6b09          	ld	(OFST-24,sp),a
1293                     ; 228 		ap.payload[6] = spc.ch4_status;
1295  0026 b664          	ld	a,_spc+24
1296  0028 6b0a          	ld	(OFST-23,sp),a
1297                     ; 229 		i2c_init_message(&ap,7);
1299  002a 4b07          	push	#7
1300  002c 96            	ldw	x,sp
1301  002d 1c0002        	addw	x,#OFST-31
1302  0030 cd0000        	call	_i2c_init_message
1304  0033 84            	pop	a
1305                     ; 230 	}
1308  0034 5b21          	addw	sp,#33
1309  0036 81            	ret
1334                     ; 232 	void I2C_transaction_end(void)
1334                     ; 233 	{
1335                     .text:	section	.text,new
1336  0000               _I2C_transaction_end:
1340                     ; 234 		ReceiveState = IIC_STATE_END;
1342  0000 35030001      	mov	_ReceiveState,#3
1343                     ; 235 	}	
1346  0004 81            	ret
1371                     ; 237 	void I2C_transaction_receive(void)
1371                     ; 238 	{
1372                     .text:	section	.text,new
1373  0000               _I2C_transaction_receive:
1377                     ; 239 		ReceiveState = IIC_STATE_RECEIVEING;
1379  0000 35020001      	mov	_ReceiveState,#2
1380                     ; 240 	}
1383  0004 81            	ret
1420                     ; 242 	void I2C_byte_received(uint8_t RxData)
1420                     ; 243 	{
1421                     .text:	section	.text,new
1422  0000               _I2C_byte_received:
1424  0000 88            	push	a
1425       00000000      OFST:	set	0
1428                     ; 244 		if(GetDataIndex < MAX_BUFFER) {
1430  0001 b600          	ld	a,_GetDataIndex
1431  0003 a120          	cp	a,#32
1432  0005 2410          	jruge	L154
1433                     ; 245 			IIC_RxBuffer[GetDataIndex++] = RxData;
1435  0007 b600          	ld	a,_GetDataIndex
1436  0009 97            	ld	xl,a
1437  000a 3c00          	inc	_GetDataIndex
1438  000c 9f            	ld	a,xl
1439  000d 5f            	clrw	x
1440  000e 97            	ld	xl,a
1441  000f 7b01          	ld	a,(OFST+1,sp)
1442  0011 e72a          	ld	(_IIC_RxBuffer,x),a
1443                     ; 246 			ReceiveState = IIC_STATE_RECEIVEING;
1445  0013 35020001      	mov	_ReceiveState,#2
1446  0017               L154:
1447                     ; 248 	}
1450  0017 84            	pop	a
1451  0018 81            	ret
1476                     ; 250 	uint8_t I2C_byte_write(void)
1476                     ; 251 	{
1477                     .text:	section	.text,new
1478  0000               _I2C_byte_write:
1482                     ; 252 			return IIC_TxBuffer[SendDataIndex++];
1484  0000 b602          	ld	a,_SendDataIndex
1485  0002 97            	ld	xl,a
1486  0003 3c02          	inc	_SendDataIndex
1487  0005 9f            	ld	a,xl
1488  0006 5f            	clrw	x
1489  0007 97            	ld	xl,a
1490  0008 e60a          	ld	a,(_IIC_TxBuffer,x)
1493  000a 81            	ret
1496                     	switch	.ubsct
1497  0000               L364_sr1:
1498  0000 00            	ds.b	1
1499  0001               L564_sr2:
1500  0001 00            	ds.b	1
1501  0002               L764_sr3:
1502  0002 00            	ds.b	1
1558                     ; 262 @far @interrupt void I2C_Slave_check_event(void) {
1560                     .text:	section	.text,new
1561  0000               f_I2C_Slave_check_event:
1564  0000 3b0002        	push	c_x+2
1565  0003 be00          	ldw	x,c_x
1566  0005 89            	pushw	x
1567  0006 3b0002        	push	c_y+2
1568  0009 be00          	ldw	x,c_y
1569  000b 89            	pushw	x
1572                     ; 269 	sr1 = I2C->SR1;
1574  000c 5552170000    	mov	L364_sr1,21015
1575                     ; 270 	sr2 = I2C->SR2;
1577  0011 5552180001    	mov	L564_sr2,21016
1578                     ; 271 	sr3 = I2C->SR3;
1580  0016 5552190002    	mov	L764_sr3,21017
1581                     ; 274   if (sr2 & (I2C_SR2_WUFH | I2C_SR2_OVR |I2C_SR2_ARLO |I2C_SR2_BERR))
1583  001b b601          	ld	a,L564_sr2
1584  001d a52b          	bcp	a,#43
1585  001f 2708          	jreq	L715
1586                     ; 276     I2C->CR2|= I2C_CR2_STOP;  // stop communication - release the lines
1588  0021 72125211      	bset	21009,#1
1589                     ; 277     I2C->SR2= 0;					    // clear all error flags
1591  0025 725f5218      	clr	21016
1592  0029               L715:
1593                     ; 280   if ((sr1 & (I2C_SR1_RXNE | I2C_SR1_BTF)) == (I2C_SR1_RXNE | I2C_SR1_BTF))
1595  0029 b600          	ld	a,L364_sr1
1596  002b a444          	and	a,#68
1597  002d a144          	cp	a,#68
1598  002f 2606          	jrne	L125
1599                     ; 282     I2C_byte_received(I2C->DR);
1601  0031 c65216        	ld	a,21014
1602  0034 cd0000        	call	_I2C_byte_received
1604  0037               L125:
1605                     ; 285   if (sr1 & I2C_SR1_RXNE)
1607  0037 b600          	ld	a,L364_sr1
1608  0039 a540          	bcp	a,#64
1609  003b 2706          	jreq	L325
1610                     ; 287     I2C_byte_received(I2C->DR);
1612  003d c65216        	ld	a,21014
1613  0040 cd0000        	call	_I2C_byte_received
1615  0043               L325:
1616                     ; 290   if (sr2 & I2C_SR2_AF)
1618  0043 b601          	ld	a,L564_sr2
1619  0045 a504          	bcp	a,#4
1620  0047 2707          	jreq	L525
1621                     ; 292     I2C->SR2 &= ~I2C_SR2_AF;	  // clear AF
1623  0049 72155218      	bres	21016,#2
1624                     ; 293 		I2C_transaction_end();
1626  004d cd0000        	call	_I2C_transaction_end
1628  0050               L525:
1629                     ; 296   if (sr1 & I2C_SR1_STOPF) 
1631  0050 b600          	ld	a,L364_sr1
1632  0052 a510          	bcp	a,#16
1633  0054 2707          	jreq	L725
1634                     ; 298     I2C->CR2 |= I2C_CR2_ACK;	  // CR2 write to clear STOPF
1636  0056 72145211      	bset	21009,#2
1637                     ; 299 		I2C_transaction_end();
1639  005a cd0000        	call	_I2C_transaction_end
1641  005d               L725:
1642                     ; 302   if (sr1 & I2C_SR1_ADDR)
1644  005d b600          	ld	a,L364_sr1
1645  005f a502          	bcp	a,#2
1646  0061 270e          	jreq	L135
1647                     ; 304 		if(sr3 & I2C_SR3_TRA){//´Ó»ú·¢ËÍÊý¾Ý
1649  0063 b602          	ld	a,L764_sr3
1650  0065 a504          	bcp	a,#4
1651  0067 2705          	jreq	L335
1652                     ; 305 			I2C_transaction_begin();
1654  0069 cd0000        	call	_I2C_transaction_begin
1657  006c 2003          	jra	L135
1658  006e               L335:
1659                     ; 307 			I2C_receive_begin();//´Ó»ú½ÓÊÕÊý¾Ý
1661  006e cd0000        	call	_I2C_receive_begin
1663  0071               L135:
1664                     ; 311   if ((sr1 & (I2C_SR1_TXE | I2C_SR1_BTF)) == (I2C_SR1_TXE | I2C_SR1_BTF))
1666  0071 b600          	ld	a,L364_sr1
1667  0073 a484          	and	a,#132
1668  0075 a184          	cp	a,#132
1669  0077 2606          	jrne	L735
1670                     ; 313 		I2C->DR = I2C_byte_write();
1672  0079 cd0000        	call	_I2C_byte_write
1674  007c c75216        	ld	21014,a
1675  007f               L735:
1676                     ; 316   if (sr1 & I2C_SR1_TXE)
1678  007f b600          	ld	a,L364_sr1
1679  0081 a580          	bcp	a,#128
1680  0083 2706          	jreq	L145
1681                     ; 318 		I2C->DR = I2C_byte_write();
1683  0085 cd0000        	call	_I2C_byte_write
1685  0088 c75216        	ld	21014,a
1686  008b               L145:
1687                     ; 321 }
1690  008b 85            	popw	x
1691  008c bf00          	ldw	c_y,x
1692  008e 320002        	pop	c_y+2
1693  0091 85            	popw	x
1694  0092 bf00          	ldw	c_x,x
1695  0094 320002        	pop	c_x+2
1696  0097 80            	iret
1719                     ; 326 void IIC_SlaveConfig (void)
1719                     ; 327 {
1721                     .text:	section	.text,new
1722  0000               _IIC_SlaveConfig:
1726                     ; 338 		I2C->CR1 |= 0x01;				        	// Enable I2C peripheral
1728  0000 72105210      	bset	21008,#0
1729                     ; 339 		I2C->CR2 = 0x04;					      		// Enable I2C acknowledgement
1731  0004 35045211      	mov	21009,#4
1732                     ; 340 		I2C->FREQR = 16; 					      	// Set I2C Freq value (16MHz)
1734  0008 35105212      	mov	21010,#16
1735                     ; 342 		I2C->OARL = (SLAVE_ADDRESS << 1) ;	// set slave address to 0x51 (put 0xA2 for the register dues to7bit address) 
1737  000c b64b          	ld	a,_slave_address
1738  000e 48            	sll	a
1739  000f c75213        	ld	21011,a
1740                     ; 343 		I2C->OARH = 0x40;					      	// Set 7bit address mode
1742  0012 35405214      	mov	21012,#64
1743                     ; 356 	I2C->ITR	= 0x07;					      // all I2C interrupt enable  
1745  0016 3507521a      	mov	21018,#7
1746                     ; 357 }
1749  001a 81            	ret
2111                     	xdef	_I2C_byte_write
2112                     	xdef	_I2C_byte_received
2113                     	xdef	_I2C_transaction_receive
2114                     	xdef	_I2C_transaction_end
2115                     	xdef	_rev_action_dimmer_done
2116                     	xdef	_rev_action_dimmer_OK
2117                     	xdef	_I2C_transaction_begin
2118                     	xdef	_I2C_receive_begin
2119                     	xdef	_i2c_init_message
2120                     	xdef	_Check_Sum
2121                     	xdef	_mymemcpy
2122                     	switch	.ubsct
2123  0003               _action_flag:
2124  0003 00            	ds.b	1
2125                     	xdef	_action_flag
2126  0004               _ch2_status_change:
2127  0004 00            	ds.b	1
2128                     	xdef	_ch2_status_change
2129  0005               _ch1_status_change:
2130  0005 00            	ds.b	1
2131                     	xdef	_ch1_status_change
2132  0006               _last_ch2_status:
2133  0006 00            	ds.b	1
2134                     	xdef	_last_ch2_status
2135  0007               _last_ch1_status:
2136  0007 00            	ds.b	1
2137                     	xdef	_last_ch1_status
2138  0008               _ext:
2139  0008 00            	ds.b	1
2140                     	xdef	_ext
2141  0009               _channel:
2142  0009 00            	ds.b	1
2143                     	xdef	_channel
2144                     	xdef	_SendDataIndex
2145                     	xdef	_ReceiveState
2146                     	xdef	_GetDataIndex
2147  000a               _IIC_TxBuffer:
2148  000a 000000000000  	ds.b	32
2149                     	xdef	_IIC_TxBuffer
2150  002a               _IIC_RxBuffer:
2151  002a 000000000000  	ds.b	32
2152                     	xdef	_IIC_RxBuffer
2153  004a               _action_done:
2154  004a 00            	ds.b	1
2155                     	xdef	_action_done
2156  004b               _slave_address:
2157  004b 00            	ds.b	1
2158                     	xdef	_slave_address
2159  004c               _spc:
2160  004c 000000000000  	ds.b	27
2161                     	xdef	_spc
2162                     	xref.b	_rtEG
2163                     	xdef	_rev_action_plug_done
2164                     	xdef	_init_energy_consume
2165                     	xdef	_rev_heart_breat
2166                     	xdef	_init_device_info
2167                     	xdef	f_I2C_Slave_check_event
2168                     	xdef	_IIC_SlaveConfig
2169                     	xref	_GPIO_WriteLow
2170                     	xref	_GPIO_WriteHigh
2171                     	xref.b	c_lreg
2172                     	xref.b	c_x
2173                     	xref.b	c_y
2193                     	xref	c_ftoi
2194                     	xref	c_lrzmp
2195                     	xref	c_lgsbc
2196                     	xref	c_ltor
2197                     	end
