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
 505  000d cc00da        	jp	L122
 506  0010               L61:
 508  0010 b62b          	ld	a,_IIC_RxBuffer+1
 509  0012 a17e          	cp	a,#126
 510  0014 2703          	jreq	L02
 511  0016 cc00da        	jp	L122
 512  0019               L02:
 513                     ; 84 			switch(cmd){
 515  0019 7b01          	ld	a,(OFST+0,sp)
 517                     ; 124 				default:
 517                     ; 125 				break;
 518  001b a003          	sub	a,#3
 519  001d 2732          	jreq	L571
 520  001f a052          	sub	a,#82
 521  0021 274e          	jreq	L771
 522  0023 a0a9          	sub	a,#169
 523  0025 2703          	jreq	L22
 524  0027 cc00da        	jp	L122
 525  002a               L22:
 526                     ; 85 				case 0xFE:
 526                     ; 86 					if(IIC_RxBuffer[5] == 0x01)	init_device_info();
 528  002a b62f          	ld	a,_IIC_RxBuffer+5
 529  002c a101          	cp	a,#1
 530  002e 2607          	jrne	L722
 533  0030 cd0000        	call	_init_device_info
 536  0033 acda00da      	jpf	L122
 537  0037               L722:
 538                     ; 87 					else if(IIC_RxBuffer[5] == 0x02)	{spc.energy_consume = (u16)rtEG;init_energy_consume();}
 540  0037 b62f          	ld	a,_IIC_RxBuffer+5
 541  0039 a102          	cp	a,#2
 542  003b 2703          	jreq	L42
 543  003d cc00da        	jp	L122
 544  0040               L42:
 547  0040 ae0000        	ldw	x,#_rtEG
 548  0043 cd0000        	call	c_ltor
 550  0046 cd0000        	call	c_ftoi
 552  0049 bf65          	ldw	_spc+25,x
 555  004b cd0000        	call	_init_energy_consume
 557  004e cc00da        	jra	L122
 558  0051               L571:
 559                     ; 89 				case 0x03:
 559                     ; 90 					if((IIC_RxBuffer[5] == 0x03)&&(IIC_RxBuffer[6] == slave_address)){
 561  0051 b62f          	ld	a,_IIC_RxBuffer+5
 562  0053 a103          	cp	a,#3
 563  0055 26f7          	jrne	L122
 565  0057 b630          	ld	a,_IIC_RxBuffer+6
 566  0059 b14b          	cp	a,_slave_address
 567  005b 267d          	jrne	L122
 568                     ; 92 						if(Check_Sum(&IIC_RxBuffer[2],IIC_RxBuffer[3]) == IIC_RxBuffer[7]){
 570  005d 3b002d        	push	_IIC_RxBuffer+3
 571  0060 ae002c        	ldw	x,#_IIC_RxBuffer+2
 572  0063 cd0000        	call	_Check_Sum
 574  0066 5b01          	addw	sp,#1
 575  0068 b131          	cp	a,_IIC_RxBuffer+7
 576  006a 266e          	jrne	L122
 577                     ; 93 							rev_heart_breat();
 579  006c cd0000        	call	_rev_heart_breat
 581  006f 2069          	jra	L122
 582  0071               L771:
 583                     ; 97 				case 0x55://´ò¿ª»ò¹Ø±Õ¿ª¹Ø
 583                     ; 98 					if((IIC_RxBuffer[5]&0xf0)>>4 == slave_address)	{//µØÖ·ÕýÈ
 585  0071 b62f          	ld	a,_IIC_RxBuffer+5
 586  0073 a4f0          	and	a,#240
 587  0075 4e            	swap	a
 588  0076 a40f          	and	a,#15
 589  0078 5f            	clrw	x
 590  0079 97            	ld	xl,a
 591  007a b64b          	ld	a,_slave_address
 592  007c 905f          	clrw	y
 593  007e 9097          	ld	yl,a
 594  0080 90bf01        	ldw	c_y+1,y
 595  0083 b301          	cpw	x,c_y+1
 596  0085 2653          	jrne	L122
 597                     ; 99 						if(Check_Sum(&IIC_RxBuffer[2],IIC_RxBuffer[3]) == IIC_RxBuffer[8]){//Ð£ÑéÕýÈ·
 599  0087 3b002d        	push	_IIC_RxBuffer+3
 600  008a ae002c        	ldw	x,#_IIC_RxBuffer+2
 601  008d cd0000        	call	_Check_Sum
 603  0090 5b01          	addw	sp,#1
 604  0092 b132          	cp	a,_IIC_RxBuffer+8
 605  0094 2644          	jrne	L122
 606                     ; 100 							channel = IIC_RxBuffer[5]&0x0f;
 608  0096 b62f          	ld	a,_IIC_RxBuffer+5
 609  0098 a40f          	and	a,#15
 610  009a b709          	ld	_channel,a
 611                     ; 101 							if((channel & 0x01)==0x01)	{
 613  009c b609          	ld	a,_channel
 614  009e a401          	and	a,#1
 615  00a0 a101          	cp	a,#1
 616  00a2 2610          	jrne	L542
 617                     ; 102 								spc.ch1_status = IIC_RxBuffer[6];
 619  00a4 453061        	mov	_spc+21,_IIC_RxBuffer+6
 620                     ; 103 								if(spc.ch1_status != last_ch1_status)	ch1_status_change = 1;
 622  00a7 b661          	ld	a,_spc+21
 623  00a9 b107          	cp	a,_last_ch1_status
 624  00ab 2704          	jreq	L742
 627  00ad 35010005      	mov	_ch1_status_change,#1
 628  00b1               L742:
 629                     ; 104 								last_ch1_status = spc.ch1_status;
 631  00b1 456107        	mov	_last_ch1_status,_spc+21
 632  00b4               L542:
 633                     ; 108 							if((channel & 0x02)==0x02)	{
 635  00b4 b609          	ld	a,_channel
 636  00b6 a402          	and	a,#2
 637  00b8 a102          	cp	a,#2
 638  00ba 2610          	jrne	L152
 639                     ; 109 								spc.ch2_status = IIC_RxBuffer[6];
 641  00bc 453062        	mov	_spc+22,_IIC_RxBuffer+6
 642                     ; 110 								if(spc.ch2_status != last_ch2_status)	ch2_status_change = 1;
 644  00bf b662          	ld	a,_spc+22
 645  00c1 b106          	cp	a,_last_ch2_status
 646  00c3 2704          	jreq	L352
 649  00c5 35010004      	mov	_ch2_status_change,#1
 650  00c9               L352:
 651                     ; 111 								last_ch2_status = spc.ch2_status;
 653  00c9 456206        	mov	_last_ch2_status,_spc+22
 654  00cc               L152:
 655                     ; 115 							if((channel & 0x04)==0x04)	{
 657  00cc b609          	ld	a,_channel
 658  00ce a404          	and	a,#4
 659  00d0 a104          	cp	a,#4
 660  00d2 2603          	jrne	L552
 661                     ; 116 								spc.ch3_status = IIC_RxBuffer[6];
 663  00d4 453063        	mov	_spc+23,_IIC_RxBuffer+6
 664  00d7               L552:
 665                     ; 120 							rev_action_plug_done();
 667  00d7 cd0000        	call	_rev_action_plug_done
 669  00da               L102:
 670                     ; 124 				default:
 670                     ; 125 				break;
 672  00da               L522:
 673  00da               L122:
 674                     ; 129 	}
 677  00da 84            	pop	a
 678  00db 81            	ret
 716                     ; 131 	void init_device_info(void)
 716                     ; 132 	{
 717                     .text:	section	.text,new
 718  0000               _init_device_info:
 720  0000 5221          	subw	sp,#33
 721       00000021      OFST:	set	33
 724                     ; 134 		di.frame_h1 = 0x7E;
 726  0002 a67e          	ld	a,#126
 727  0004 6b01          	ld	(OFST-32,sp),a
 728                     ; 135 		di.frame_h2 = 0x7E;
 730  0006 a67e          	ld	a,#126
 731  0008 6b02          	ld	(OFST-31,sp),a
 732                     ; 136 		di.message_id = IIC_RxBuffer[2];
 734  000a b62c          	ld	a,_IIC_RxBuffer+2
 735  000c 6b03          	ld	(OFST-30,sp),a
 736                     ; 137 		di.payload[0] = 0xB3;
 738  000e a6b3          	ld	a,#179
 739  0010 6b04          	ld	(OFST-29,sp),a
 740                     ; 138 		di.payload[1] = 0x01;
 742  0012 a601          	ld	a,#1
 743  0014 6b05          	ld	(OFST-28,sp),a
 744                     ; 139 		di.payload[2] = 0x01;
 746  0016 a601          	ld	a,#1
 747  0018 6b06          	ld	(OFST-27,sp),a
 748                     ; 140 		di.payload[3] = 0x01;
 750  001a a601          	ld	a,#1
 751  001c 6b07          	ld	(OFST-26,sp),a
 752                     ; 141 		di.payload[4] = 0x01;
 754  001e a601          	ld	a,#1
 755  0020 6b08          	ld	(OFST-25,sp),a
 756                     ; 142 		di.payload[5] = 0x63;
 758  0022 a663          	ld	a,#99
 759  0024 6b09          	ld	(OFST-24,sp),a
 760                     ; 143 		di.payload[6] = 0x00;
 762  0026 0f0a          	clr	(OFST-23,sp)
 763                     ; 144 		di.payload[7] = 0xc0;
 765  0028 a6c0          	ld	a,#192
 766  002a 6b0b          	ld	(OFST-22,sp),a
 767                     ; 145 		di.payload[8] = slave_address;
 769  002c b64b          	ld	a,_slave_address
 770  002e 6b0c          	ld	(OFST-21,sp),a
 771                     ; 146 		i2c_init_message(&di,9);
 773  0030 4b09          	push	#9
 774  0032 96            	ldw	x,sp
 775  0033 1c0002        	addw	x,#OFST-31
 776  0036 cd0000        	call	_i2c_init_message
 778  0039 84            	pop	a
 779                     ; 147 	}
 782  003a 5b21          	addw	sp,#33
 783  003c 81            	ret
 823                     ; 149 	void init_energy_consume(void)
 823                     ; 150 	{
 824                     .text:	section	.text,new
 825  0000               _init_energy_consume:
 827  0000 5221          	subw	sp,#33
 828       00000021      OFST:	set	33
 831                     ; 152 		eg.frame_h1 = 0x7E;
 833  0002 a67e          	ld	a,#126
 834  0004 6b01          	ld	(OFST-32,sp),a
 835                     ; 153 		eg.frame_h2 = 0x7E;
 837  0006 a67e          	ld	a,#126
 838  0008 6b02          	ld	(OFST-31,sp),a
 839                     ; 154 		eg.message_id = IIC_RxBuffer[2];
 841  000a b62c          	ld	a,_IIC_RxBuffer+2
 842  000c 6b03          	ld	(OFST-30,sp),a
 843                     ; 155 		eg.payload[0] = 0x2A;
 845  000e a62a          	ld	a,#42
 846  0010 6b04          	ld	(OFST-29,sp),a
 847                     ; 156 		eg.payload[1] = (u8)((spc.energy_consume&0xff00)>>8);
 849  0012 b665          	ld	a,_spc+25
 850  0014 97            	ld	xl,a
 851  0015 b666          	ld	a,_spc+26
 852  0017 9f            	ld	a,xl
 853  0018 a4ff          	and	a,#255
 854  001a 97            	ld	xl,a
 855  001b 4f            	clr	a
 856  001c 02            	rlwa	x,a
 857  001d 4f            	clr	a
 858  001e 01            	rrwa	x,a
 859  001f 9f            	ld	a,xl
 860  0020 6b05          	ld	(OFST-28,sp),a
 861                     ; 157 		eg.payload[2] = (u8)(spc.energy_consume&0x00ff);
 863  0022 b666          	ld	a,_spc+26
 864  0024 a4ff          	and	a,#255
 865  0026 6b06          	ld	(OFST-27,sp),a
 866                     ; 158 		eg.payload[3] = spc.MDID;
 868  0028 b660          	ld	a,_spc+20
 869  002a 6b07          	ld	(OFST-26,sp),a
 870                     ; 159 		i2c_init_message(&eg,4);
 872  002c 4b04          	push	#4
 873  002e 96            	ldw	x,sp
 874  002f 1c0002        	addw	x,#OFST-31
 875  0032 cd0000        	call	_i2c_init_message
 877  0035 84            	pop	a
 878                     ; 160 		spc.energy_consume = 0;
 880  0036 5f            	clrw	x
 881  0037 bf65          	ldw	_spc+25,x
 882                     ; 161 		rtEG = 0;
 884  0039 ae0000        	ldw	x,#0
 885  003c bf02          	ldw	_rtEG+2,x
 886  003e ae0000        	ldw	x,#0
 887  0041 bf00          	ldw	_rtEG,x
 888                     ; 162 	}
 891  0043 5b21          	addw	sp,#33
 892  0045 81            	ret
 930                     ; 166 	void rev_heart_breat(void)
 930                     ; 167 	{
 931                     .text:	section	.text,new
 932  0000               _rev_heart_breat:
 934  0000 5221          	subw	sp,#33
 935       00000021      OFST:	set	33
 938                     ; 169 		hb.frame_h1 = 0x7E;
 940  0002 a67e          	ld	a,#126
 941  0004 6b01          	ld	(OFST-32,sp),a
 942                     ; 170 		hb.frame_h2 = 0x7E;
 944  0006 a67e          	ld	a,#126
 945  0008 6b02          	ld	(OFST-31,sp),a
 946                     ; 171 		hb.message_id = IIC_RxBuffer[2];
 948  000a b62c          	ld	a,_IIC_RxBuffer+2
 949  000c 6b03          	ld	(OFST-30,sp),a
 950                     ; 172 		hb.payload[0] = 0x06;
 952  000e a606          	ld	a,#6
 953  0010 6b04          	ld	(OFST-29,sp),a
 954                     ; 173 		hb.payload[1] = spc.MDID;
 956  0012 b660          	ld	a,_spc+20
 957  0014 6b05          	ld	(OFST-28,sp),a
 958                     ; 174 		hb.payload[2] = spc.ch1_status;
 960  0016 b661          	ld	a,_spc+21
 961  0018 6b06          	ld	(OFST-27,sp),a
 962                     ; 175 		hb.payload[3] = spc.ch2_status;
 964  001a b662          	ld	a,_spc+22
 965  001c 6b07          	ld	(OFST-26,sp),a
 966                     ; 176 		hb.payload[4] = spc.ch3_status;
 968  001e b663          	ld	a,_spc+23
 969  0020 6b08          	ld	(OFST-25,sp),a
 970                     ; 177 		hb.payload[5] = spc.ch4_status;
 972  0022 b664          	ld	a,_spc+24
 973  0024 6b09          	ld	(OFST-24,sp),a
 974                     ; 178 		i2c_init_message(&hb,6);
 976  0026 4b06          	push	#6
 977  0028 96            	ldw	x,sp
 978  0029 1c0002        	addw	x,#OFST-31
 979  002c cd0000        	call	_i2c_init_message
 981  002f 84            	pop	a
 982                     ; 179 	}
 985  0030 5b21          	addw	sp,#33
 986  0032 81            	ret
1025                     ; 181 	void rev_action_dimmer_OK(void)
1025                     ; 182 	{
1026                     .text:	section	.text,new
1027  0000               _rev_action_dimmer_OK:
1029  0000 5221          	subw	sp,#33
1030       00000021      OFST:	set	33
1033                     ; 184 		ad.frame_h1 = 0x7E;
1035  0002 a67e          	ld	a,#126
1036  0004 6b01          	ld	(OFST-32,sp),a
1037                     ; 185 		ad.frame_h2 = 0x7E;
1039  0006 a67e          	ld	a,#126
1040  0008 6b02          	ld	(OFST-31,sp),a
1041                     ; 186 		ad.message_id = IIC_RxBuffer[2];
1043  000a b62c          	ld	a,_IIC_RxBuffer+2
1044  000c 6b03          	ld	(OFST-30,sp),a
1045                     ; 187 		ad.payload[0] = 0xAA;
1047  000e a6aa          	ld	a,#170
1048  0010 6b04          	ld	(OFST-29,sp),a
1049                     ; 188 		ad.payload[1] = 0x02;
1051  0012 a602          	ld	a,#2
1052  0014 6b05          	ld	(OFST-28,sp),a
1053                     ; 189 		ad.payload[2] = spc.MDID;
1055  0016 b660          	ld	a,_spc+20
1056  0018 6b06          	ld	(OFST-27,sp),a
1057                     ; 190 		i2c_init_message(&ad,3);
1059  001a 4b03          	push	#3
1060  001c 96            	ldw	x,sp
1061  001d 1c0002        	addw	x,#OFST-31
1062  0020 cd0000        	call	_i2c_init_message
1064  0023 84            	pop	a
1065                     ; 191 	}
1068  0024 5b21          	addw	sp,#33
1069  0026 81            	ret
1107                     ; 194 	void rev_action_dimmer_done(void)
1107                     ; 195 	{
1108                     .text:	section	.text,new
1109  0000               _rev_action_dimmer_done:
1111  0000 5221          	subw	sp,#33
1112       00000021      OFST:	set	33
1115                     ; 197 		ad.frame_h1 = 0x7E;
1117  0002 a67e          	ld	a,#126
1118  0004 6b01          	ld	(OFST-32,sp),a
1119                     ; 198 		ad.frame_h2 = 0x7E;
1121  0006 a67e          	ld	a,#126
1122  0008 6b02          	ld	(OFST-31,sp),a
1123                     ; 199 		ad.message_id = 66;
1125  000a a642          	ld	a,#66
1126  000c 6b03          	ld	(OFST-30,sp),a
1127                     ; 200 		ad.payload[0] = 0xAA;
1129  000e a6aa          	ld	a,#170
1130  0010 6b04          	ld	(OFST-29,sp),a
1131                     ; 201 		ad.payload[1] = 0x05;
1133  0012 a605          	ld	a,#5
1134  0014 6b05          	ld	(OFST-28,sp),a
1135                     ; 202 		ad.payload[2] = spc.MDID;
1137  0016 b660          	ld	a,_spc+20
1138  0018 6b06          	ld	(OFST-27,sp),a
1139                     ; 203 		ad.payload[3] = spc.ch1_status;
1141  001a b661          	ld	a,_spc+21
1142  001c 6b07          	ld	(OFST-26,sp),a
1143                     ; 204 		ad.payload[4] = spc.ch2_status;
1145  001e b662          	ld	a,_spc+22
1146  0020 6b08          	ld	(OFST-25,sp),a
1147                     ; 205 		ad.payload[5] = spc.ch3_status;
1149  0022 b663          	ld	a,_spc+23
1150  0024 6b09          	ld	(OFST-24,sp),a
1151                     ; 206 		ad.payload[6] = spc.ch4_status;
1153  0026 b664          	ld	a,_spc+24
1154  0028 6b0a          	ld	(OFST-23,sp),a
1155                     ; 207 		i2c_init_message(&ad,7);
1157  002a 4b07          	push	#7
1158  002c 96            	ldw	x,sp
1159  002d 1c0002        	addw	x,#OFST-31
1160  0030 cd0000        	call	_i2c_init_message
1162  0033 84            	pop	a
1163                     ; 208 	}
1166  0034 5b21          	addw	sp,#33
1167  0036 81            	ret
1205                     ; 210 	void rev_action_plug_done(void)
1205                     ; 211 	{
1206                     .text:	section	.text,new
1207  0000               _rev_action_plug_done:
1209  0000 5221          	subw	sp,#33
1210       00000021      OFST:	set	33
1213                     ; 213 		ap.frame_h1 = 0x7E;
1215  0002 a67e          	ld	a,#126
1216  0004 6b01          	ld	(OFST-32,sp),a
1217                     ; 214 		ap.frame_h2 = 0x7E;
1219  0006 a67e          	ld	a,#126
1220  0008 6b02          	ld	(OFST-31,sp),a
1221                     ; 215 		ap.message_id = 66;
1223  000a a642          	ld	a,#66
1224  000c 6b03          	ld	(OFST-30,sp),a
1225                     ; 216 		ap.payload[0] = 0xAA;
1227  000e a6aa          	ld	a,#170
1228  0010 6b04          	ld	(OFST-29,sp),a
1229                     ; 217 		ap.payload[1] = 0x05;
1231  0012 a605          	ld	a,#5
1232  0014 6b05          	ld	(OFST-28,sp),a
1233                     ; 218 		ap.payload[2] = spc.MDID;
1235  0016 b660          	ld	a,_spc+20
1236  0018 6b06          	ld	(OFST-27,sp),a
1237                     ; 219 		ap.payload[3] = spc.ch1_status;
1239  001a b661          	ld	a,_spc+21
1240  001c 6b07          	ld	(OFST-26,sp),a
1241                     ; 220 		ap.payload[4] = spc.ch2_status;
1243  001e b662          	ld	a,_spc+22
1244  0020 6b08          	ld	(OFST-25,sp),a
1245                     ; 221 		ap.payload[5] = spc.ch3_status;
1247  0022 b663          	ld	a,_spc+23
1248  0024 6b09          	ld	(OFST-24,sp),a
1249                     ; 222 		ap.payload[6] = spc.ch4_status;
1251  0026 b664          	ld	a,_spc+24
1252  0028 6b0a          	ld	(OFST-23,sp),a
1253                     ; 223 		i2c_init_message(&ap,7);
1255  002a 4b07          	push	#7
1256  002c 96            	ldw	x,sp
1257  002d 1c0002        	addw	x,#OFST-31
1258  0030 cd0000        	call	_i2c_init_message
1260  0033 84            	pop	a
1261                     ; 224 	}
1264  0034 5b21          	addw	sp,#33
1265  0036 81            	ret
1290                     ; 226 	void I2C_transaction_end(void)
1290                     ; 227 	{
1291                     .text:	section	.text,new
1292  0000               _I2C_transaction_end:
1296                     ; 228 		ReceiveState = IIC_STATE_END;
1298  0000 35030001      	mov	_ReceiveState,#3
1299                     ; 229 	}	
1302  0004 81            	ret
1327                     ; 231 	void I2C_transaction_receive(void)
1327                     ; 232 	{
1328                     .text:	section	.text,new
1329  0000               _I2C_transaction_receive:
1333                     ; 233 		ReceiveState = IIC_STATE_RECEIVEING;
1335  0000 35020001      	mov	_ReceiveState,#2
1336                     ; 234 	}
1339  0004 81            	ret
1376                     ; 236 	void I2C_byte_received(uint8_t RxData)
1376                     ; 237 	{
1377                     .text:	section	.text,new
1378  0000               _I2C_byte_received:
1380  0000 88            	push	a
1381       00000000      OFST:	set	0
1384                     ; 238 		if(GetDataIndex < MAX_BUFFER) {
1386  0001 b600          	ld	a,_GetDataIndex
1387  0003 a120          	cp	a,#32
1388  0005 2410          	jruge	L144
1389                     ; 239 			IIC_RxBuffer[GetDataIndex++] = RxData;
1391  0007 b600          	ld	a,_GetDataIndex
1392  0009 97            	ld	xl,a
1393  000a 3c00          	inc	_GetDataIndex
1394  000c 9f            	ld	a,xl
1395  000d 5f            	clrw	x
1396  000e 97            	ld	xl,a
1397  000f 7b01          	ld	a,(OFST+1,sp)
1398  0011 e72a          	ld	(_IIC_RxBuffer,x),a
1399                     ; 240 			ReceiveState = IIC_STATE_RECEIVEING;
1401  0013 35020001      	mov	_ReceiveState,#2
1402  0017               L144:
1403                     ; 242 	}
1406  0017 84            	pop	a
1407  0018 81            	ret
1432                     ; 244 	uint8_t I2C_byte_write(void)
1432                     ; 245 	{
1433                     .text:	section	.text,new
1434  0000               _I2C_byte_write:
1438                     ; 246 			return IIC_TxBuffer[SendDataIndex++];
1440  0000 b602          	ld	a,_SendDataIndex
1441  0002 97            	ld	xl,a
1442  0003 3c02          	inc	_SendDataIndex
1443  0005 9f            	ld	a,xl
1444  0006 5f            	clrw	x
1445  0007 97            	ld	xl,a
1446  0008 e60a          	ld	a,(_IIC_TxBuffer,x)
1449  000a 81            	ret
1452                     	switch	.ubsct
1453  0000               L354_sr1:
1454  0000 00            	ds.b	1
1455  0001               L554_sr2:
1456  0001 00            	ds.b	1
1457  0002               L754_sr3:
1458  0002 00            	ds.b	1
1514                     ; 256 @far @interrupt void I2C_Slave_check_event(void) {
1516                     .text:	section	.text,new
1517  0000               f_I2C_Slave_check_event:
1520  0000 3b0002        	push	c_x+2
1521  0003 be00          	ldw	x,c_x
1522  0005 89            	pushw	x
1523  0006 3b0002        	push	c_y+2
1524  0009 be00          	ldw	x,c_y
1525  000b 89            	pushw	x
1528                     ; 263 	sr1 = I2C->SR1;
1530  000c 5552170000    	mov	L354_sr1,21015
1531                     ; 264 	sr2 = I2C->SR2;
1533  0011 5552180001    	mov	L554_sr2,21016
1534                     ; 265 	sr3 = I2C->SR3;
1536  0016 5552190002    	mov	L754_sr3,21017
1537                     ; 268   if (sr2 & (I2C_SR2_WUFH | I2C_SR2_OVR |I2C_SR2_ARLO |I2C_SR2_BERR))
1539  001b b601          	ld	a,L554_sr2
1540  001d a52b          	bcp	a,#43
1541  001f 2708          	jreq	L705
1542                     ; 270     I2C->CR2|= I2C_CR2_STOP;  // stop communication - release the lines
1544  0021 72125211      	bset	21009,#1
1545                     ; 271     I2C->SR2= 0;					    // clear all error flags
1547  0025 725f5218      	clr	21016
1548  0029               L705:
1549                     ; 274   if ((sr1 & (I2C_SR1_RXNE | I2C_SR1_BTF)) == (I2C_SR1_RXNE | I2C_SR1_BTF))
1551  0029 b600          	ld	a,L354_sr1
1552  002b a444          	and	a,#68
1553  002d a144          	cp	a,#68
1554  002f 2606          	jrne	L115
1555                     ; 276     I2C_byte_received(I2C->DR);
1557  0031 c65216        	ld	a,21014
1558  0034 cd0000        	call	_I2C_byte_received
1560  0037               L115:
1561                     ; 279   if (sr1 & I2C_SR1_RXNE)
1563  0037 b600          	ld	a,L354_sr1
1564  0039 a540          	bcp	a,#64
1565  003b 2706          	jreq	L315
1566                     ; 281     I2C_byte_received(I2C->DR);
1568  003d c65216        	ld	a,21014
1569  0040 cd0000        	call	_I2C_byte_received
1571  0043               L315:
1572                     ; 284   if (sr2 & I2C_SR2_AF)
1574  0043 b601          	ld	a,L554_sr2
1575  0045 a504          	bcp	a,#4
1576  0047 2707          	jreq	L515
1577                     ; 286     I2C->SR2 &= ~I2C_SR2_AF;	  // clear AF
1579  0049 72155218      	bres	21016,#2
1580                     ; 287 		I2C_transaction_end();
1582  004d cd0000        	call	_I2C_transaction_end
1584  0050               L515:
1585                     ; 290   if (sr1 & I2C_SR1_STOPF) 
1587  0050 b600          	ld	a,L354_sr1
1588  0052 a510          	bcp	a,#16
1589  0054 2707          	jreq	L715
1590                     ; 292     I2C->CR2 |= I2C_CR2_ACK;	  // CR2 write to clear STOPF
1592  0056 72145211      	bset	21009,#2
1593                     ; 293 		I2C_transaction_end();
1595  005a cd0000        	call	_I2C_transaction_end
1597  005d               L715:
1598                     ; 296   if (sr1 & I2C_SR1_ADDR)
1600  005d b600          	ld	a,L354_sr1
1601  005f a502          	bcp	a,#2
1602  0061 270e          	jreq	L125
1603                     ; 298 		if(sr3 & I2C_SR3_TRA){//´Ó»ú·¢ËÍÊý¾Ý
1605  0063 b602          	ld	a,L754_sr3
1606  0065 a504          	bcp	a,#4
1607  0067 2705          	jreq	L325
1608                     ; 299 			I2C_transaction_begin();
1610  0069 cd0000        	call	_I2C_transaction_begin
1613  006c 2003          	jra	L125
1614  006e               L325:
1615                     ; 301 			I2C_receive_begin();//´Ó»ú½ÓÊÕÊý¾Ý
1617  006e cd0000        	call	_I2C_receive_begin
1619  0071               L125:
1620                     ; 305   if ((sr1 & (I2C_SR1_TXE | I2C_SR1_BTF)) == (I2C_SR1_TXE | I2C_SR1_BTF))
1622  0071 b600          	ld	a,L354_sr1
1623  0073 a484          	and	a,#132
1624  0075 a184          	cp	a,#132
1625  0077 2606          	jrne	L725
1626                     ; 307 		I2C->DR = I2C_byte_write();
1628  0079 cd0000        	call	_I2C_byte_write
1630  007c c75216        	ld	21014,a
1631  007f               L725:
1632                     ; 310   if (sr1 & I2C_SR1_TXE)
1634  007f b600          	ld	a,L354_sr1
1635  0081 a580          	bcp	a,#128
1636  0083 2706          	jreq	L135
1637                     ; 312 		I2C->DR = I2C_byte_write();
1639  0085 cd0000        	call	_I2C_byte_write
1641  0088 c75216        	ld	21014,a
1642  008b               L135:
1643                     ; 315 }
1646  008b 85            	popw	x
1647  008c bf00          	ldw	c_y,x
1648  008e 320002        	pop	c_y+2
1649  0091 85            	popw	x
1650  0092 bf00          	ldw	c_x,x
1651  0094 320002        	pop	c_x+2
1652  0097 80            	iret
1675                     ; 320 void IIC_SlaveConfig (void)
1675                     ; 321 {
1677                     .text:	section	.text,new
1678  0000               _IIC_SlaveConfig:
1682                     ; 327   GPIOB->ODR |= (1<<4)|(1<<5);                //define SDA, SCL outputs, HiZ, Open drain, Fast
1684  0000 c65005        	ld	a,20485
1685  0003 aa30          	or	a,#48
1686  0005 c75005        	ld	20485,a
1687                     ; 328   GPIOB->DDR |= (1<<4)|(1<<5);
1689  0008 c65007        	ld	a,20487
1690  000b aa30          	or	a,#48
1691  000d c75007        	ld	20487,a
1692                     ; 329   GPIOB->CR2 |= (1<<4)|(1<<5);
1694  0010 c65009        	ld	a,20489
1695  0013 aa30          	or	a,#48
1696  0015 c75009        	ld	20489,a
1697                     ; 332 		I2C->CR1 |= 0x01;				        	// Enable I2C peripheral
1699  0018 72105210      	bset	21008,#0
1700                     ; 333 		I2C->CR2 = 0x04;					      		// Enable I2C acknowledgement
1702  001c 35045211      	mov	21009,#4
1703                     ; 334 		I2C->FREQR = 16; 					      	// Set I2C Freq value (16MHz)
1705  0020 35105212      	mov	21010,#16
1706                     ; 336 		I2C->OARL = (SLAVE_ADDRESS << 1) ;	// set slave address to 0x51 (put 0xA2 for the register dues to7bit address) 
1708  0024 b64b          	ld	a,_slave_address
1709  0026 48            	sll	a
1710  0027 c75213        	ld	21011,a
1711                     ; 337 		I2C->OARH = 0x40;					      	// Set 7bit address mode
1713  002a 35405214      	mov	21012,#64
1714                     ; 350 	I2C->ITR	= 0x07;					      // all I2C interrupt enable  
1716  002e 3507521a      	mov	21018,#7
1717                     ; 351 }
1720  0032 81            	ret
2082                     	xdef	_I2C_byte_write
2083                     	xdef	_I2C_byte_received
2084                     	xdef	_I2C_transaction_receive
2085                     	xdef	_I2C_transaction_end
2086                     	xdef	_rev_action_dimmer_done
2087                     	xdef	_rev_action_dimmer_OK
2088                     	xdef	_I2C_transaction_begin
2089                     	xdef	_I2C_receive_begin
2090                     	xdef	_i2c_init_message
2091                     	xdef	_Check_Sum
2092                     	xdef	_mymemcpy
2093                     	switch	.ubsct
2094  0003               _action_flag:
2095  0003 00            	ds.b	1
2096                     	xdef	_action_flag
2097  0004               _ch2_status_change:
2098  0004 00            	ds.b	1
2099                     	xdef	_ch2_status_change
2100  0005               _ch1_status_change:
2101  0005 00            	ds.b	1
2102                     	xdef	_ch1_status_change
2103  0006               _last_ch2_status:
2104  0006 00            	ds.b	1
2105                     	xdef	_last_ch2_status
2106  0007               _last_ch1_status:
2107  0007 00            	ds.b	1
2108                     	xdef	_last_ch1_status
2109  0008               _ext:
2110  0008 00            	ds.b	1
2111                     	xdef	_ext
2112  0009               _channel:
2113  0009 00            	ds.b	1
2114                     	xdef	_channel
2115                     	xdef	_SendDataIndex
2116                     	xdef	_ReceiveState
2117                     	xdef	_GetDataIndex
2118  000a               _IIC_TxBuffer:
2119  000a 000000000000  	ds.b	32
2120                     	xdef	_IIC_TxBuffer
2121  002a               _IIC_RxBuffer:
2122  002a 000000000000  	ds.b	32
2123                     	xdef	_IIC_RxBuffer
2124  004a               _action_done:
2125  004a 00            	ds.b	1
2126                     	xdef	_action_done
2127  004b               _slave_address:
2128  004b 00            	ds.b	1
2129                     	xdef	_slave_address
2130  004c               _spc:
2131  004c 000000000000  	ds.b	27
2132                     	xdef	_spc
2133                     	xref.b	_rtEG
2134                     	xdef	_rev_action_plug_done
2135                     	xdef	_init_energy_consume
2136                     	xdef	_rev_heart_breat
2137                     	xdef	_init_device_info
2138                     	xdef	f_I2C_Slave_check_event
2139                     	xdef	_IIC_SlaveConfig
2140                     	xref.b	c_lreg
2141                     	xref.b	c_x
2142                     	xref.b	c_y
2162                     	xref	c_ftoi
2163                     	xref	c_lrzmp
2164                     	xref	c_lgsbc
2165                     	xref	c_ltor
2166                     	end
