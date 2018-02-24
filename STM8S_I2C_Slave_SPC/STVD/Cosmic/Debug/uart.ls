   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
  62                     ; 34 u8 random(u8 xxx)  
  62                     ; 35 {  
  64                     .text:	section	.text,new
  65  0000               _random:
  67  0000 88            	push	a
  68  0001 89            	pushw	x
  69       00000002      OFST:	set	2
  72                     ; 37 	for(iii=0; iii<xxx; iii++)  
  74  0002 0f02          	clr	(OFST+0,sp)
  76  0004 2011          	jra	L34
  77  0006               L73:
  78                     ; 39 		value = rand() % (MAX + 1- MIN) + MIN; //获取一个随机数1~255
  80  0006 cd0000        	call	_rand
  82  0009 90ae00ff      	ldw	y,#255
  83  000d cd0000        	call	c_idiv
  85  0010 51            	exgw	x,y
  86  0011 9f            	ld	a,xl
  87  0012 4c            	inc	a
  88  0013 6b01          	ld	(OFST-1,sp),a
  89                     ; 37 	for(iii=0; iii<xxx; iii++)  
  91  0015 0c02          	inc	(OFST+0,sp)
  92  0017               L34:
  95  0017 7b02          	ld	a,(OFST+0,sp)
  96  0019 1103          	cp	a,(OFST+1,sp)
  97  001b 25e9          	jrult	L73
  98                     ; 41 	return value;  
 100  001d 7b01          	ld	a,(OFST-1,sp)
 103  001f 5b03          	addw	sp,#3
 104  0021 81            	ret
 178                     ; 49 void mymemcpy(void *des,void *src,u32 n)  
 178                     ; 50 {  
 179                     .text:	section	.text,new
 180  0000               _mymemcpy:
 182  0000 89            	pushw	x
 183  0001 5204          	subw	sp,#4
 184       00000004      OFST:	set	4
 187                     ; 51   u8 *xdes=des;
 189  0003 1f01          	ldw	(OFST-3,sp),x
 190                     ; 52 	u8 *xsrc=src; 
 192  0005 1e09          	ldw	x,(OFST+5,sp)
 193  0007 1f03          	ldw	(OFST-1,sp),x
 195  0009 2016          	jra	L111
 196  000b               L501:
 197                     ; 53   while(n--)*xdes++=*xsrc++;  
 199  000b 1e03          	ldw	x,(OFST-1,sp)
 200  000d 1c0001        	addw	x,#1
 201  0010 1f03          	ldw	(OFST-1,sp),x
 202  0012 1d0001        	subw	x,#1
 203  0015 f6            	ld	a,(x)
 204  0016 1e01          	ldw	x,(OFST-3,sp)
 205  0018 1c0001        	addw	x,#1
 206  001b 1f01          	ldw	(OFST-3,sp),x
 207  001d 1d0001        	subw	x,#1
 208  0020 f7            	ld	(x),a
 209  0021               L111:
 212  0021 96            	ldw	x,sp
 213  0022 1c000b        	addw	x,#OFST+7
 214  0025 cd0000        	call	c_ltor
 216  0028 96            	ldw	x,sp
 217  0029 1c000b        	addw	x,#OFST+7
 218  002c a601          	ld	a,#1
 219  002e cd0000        	call	c_lgsbc
 221  0031 cd0000        	call	c_lrzmp
 223  0034 26d5          	jrne	L501
 224                     ; 54 }  
 227  0036 5b06          	addw	sp,#6
 228  0038 81            	ret
 290                     ; 62 u8 uart1_check_sum(u8 *buf, u8 length)
 290                     ; 63 {
 291                     .text:	section	.text,new
 292  0000               _uart1_check_sum:
 294  0000 89            	pushw	x
 295  0001 89            	pushw	x
 296       00000002      OFST:	set	2
 299                     ; 65 	u8 result = *buf++;
 301  0002 1e03          	ldw	x,(OFST+1,sp)
 302  0004 1c0001        	addw	x,#1
 303  0007 1f03          	ldw	(OFST+1,sp),x
 304  0009 1d0001        	subw	x,#1
 305  000c f6            	ld	a,(x)
 306  000d 6b01          	ld	(OFST-1,sp),a
 307                     ; 67 	for(i = 1; i < length; i++)
 309  000f a601          	ld	a,#1
 310  0011 6b02          	ld	(OFST+0,sp),a
 312  0013 2011          	jra	L351
 313  0015               L741:
 314                     ; 69 		result ^= *buf++;
 316  0015 1e03          	ldw	x,(OFST+1,sp)
 317  0017 1c0001        	addw	x,#1
 318  001a 1f03          	ldw	(OFST+1,sp),x
 319  001c 1d0001        	subw	x,#1
 320  001f 7b01          	ld	a,(OFST-1,sp)
 321  0021 f8            	xor	a,	(x)
 322  0022 6b01          	ld	(OFST-1,sp),a
 323                     ; 67 	for(i = 1; i < length; i++)
 325  0024 0c02          	inc	(OFST+0,sp)
 326  0026               L351:
 329  0026 7b02          	ld	a,(OFST+0,sp)
 330  0028 1107          	cp	a,(OFST+5,sp)
 331  002a 25e9          	jrult	L741
 332                     ; 72 	return result;
 334  002c 7b01          	ld	a,(OFST-1,sp)
 337  002e 5b04          	addw	sp,#4
 338  0030 81            	ret
 365                     ; 81 void uart1_init(void)
 365                     ; 82 {
 366                     .text:	section	.text,new
 367  0000               _uart1_init:
 371                     ; 83 	UART1_DeInit();
 373  0000 cd0000        	call	_UART1_DeInit
 375                     ; 85 	UART1_Init((u32)19200, UART1_WORDLENGTH_8D, UART1_STOPBITS_1, UART1_PARITY_NO, UART1_SYNCMODE_CLOCK_DISABLE, UART1_MODE_TXRX_ENABLE);
 377  0003 4b0c          	push	#12
 378  0005 4b80          	push	#128
 379  0007 4b00          	push	#0
 380  0009 4b00          	push	#0
 381  000b 4b00          	push	#0
 382  000d ae4b00        	ldw	x,#19200
 383  0010 89            	pushw	x
 384  0011 ae0000        	ldw	x,#0
 385  0014 89            	pushw	x
 386  0015 cd0000        	call	_UART1_Init
 388  0018 5b09          	addw	sp,#9
 389                     ; 86 	UART1_ITConfig(UART1_IT_TC, ENABLE);//发送完成中断
 391  001a 4b01          	push	#1
 392  001c ae0266        	ldw	x,#614
 393  001f cd0000        	call	_UART1_ITConfig
 395  0022 84            	pop	a
 396                     ; 87 	UART1_ITConfig(UART1_IT_RXNE_OR, ENABLE);//接收非空中断
 398  0023 4b01          	push	#1
 399  0025 ae0205        	ldw	x,#517
 400  0028 cd0000        	call	_UART1_ITConfig
 402  002b 84            	pop	a
 403                     ; 88 	UART1_Cmd(ENABLE);//启用uart1接口
 405  002c a601          	ld	a,#1
 406  002e cd0000        	call	_UART1_Cmd
 408                     ; 89 }
 411  0031 81            	ret
 457                     ; 98 void Uart1_Send(u8 *buf, u16 len)
 457                     ; 99 {
 458                     .text:	section	.text,new
 459  0000               _Uart1_Send:
 461  0000 89            	pushw	x
 462       00000000      OFST:	set	0
 465                     ; 100 	if(len >= UART1_SEND_LEN)	
 467  0001 1e05          	ldw	x,(OFST+5,sp)
 468  0003 a30028        	cpw	x,#40
 469  0006 2505          	jrult	L112
 470                     ; 101 		len = UART1_SEND_LEN;
 472  0008 ae0028        	ldw	x,#40
 473  000b 1f05          	ldw	(OFST+5,sp),x
 474  000d               L112:
 475                     ; 103 	mymemcpy(uart1_frame.txbuf, buf, len);
 477  000d 1e05          	ldw	x,(OFST+5,sp)
 478  000f cd0000        	call	c_uitolx
 480  0012 be02          	ldw	x,c_lreg+2
 481  0014 89            	pushw	x
 482  0015 be00          	ldw	x,c_lreg
 483  0017 89            	pushw	x
 484  0018 1e05          	ldw	x,(OFST+5,sp)
 485  001a 89            	pushw	x
 486  001b ae002f        	ldw	x,#_uart1_frame+47
 487  001e cd0000        	call	_mymemcpy
 489  0021 5b06          	addw	sp,#6
 490                     ; 105 	uart1_frame.txlen = len;
 492  0023 1e05          	ldw	x,(OFST+5,sp)
 493  0025 bf03          	ldw	_uart1_frame+3,x
 494                     ; 106 	uart1_frame.txhas = 1;
 496  0027 ae0001        	ldw	x,#1
 497  002a bf05          	ldw	_uart1_frame+5,x
 498                     ; 107 	UART1->DR = uart1_frame.txbuf[0];
 500  002c 55002f5231    	mov	21041,_uart1_frame+47
 501                     ; 109 }
 504  0031 85            	popw	x
 505  0032 81            	ret
 532                     ; 117 void uart1_init_device_info(void)
 532                     ; 118 {
 533                     .text:	section	.text,new
 534  0000               _uart1_init_device_info:
 538                     ; 119 	uart1_frame.txbuf[0] = 0x7e;
 540  0000 357e002f      	mov	_uart1_frame+47,#126
 541                     ; 120 	uart1_frame.txbuf[1] = 0x7e;
 543  0004 357e0030      	mov	_uart1_frame+48,#126
 544                     ; 121 	uart1_frame.txbuf[2] = spc.MDID;		//addr
 546  0008 451d31        	mov	_uart1_frame+49,_spc+29
 547                     ; 122 	uart1_frame.txbuf[3] = uart1_frame.rxbuf[3];	//message id
 549  000b 450a32        	mov	_uart1_frame+50,_uart1_frame+10
 550                     ; 123 	uart1_frame.txbuf[4] = 12;	//len
 552  000e 350c0033      	mov	_uart1_frame+51,#12
 553                     ; 124 	uart1_frame.txbuf[5] = 0xB3;	//payload
 555  0012 35b30034      	mov	_uart1_frame+52,#179
 556                     ; 125 	uart1_frame.txbuf[6] = spc.deviceID[0];
 558  0016 450035        	mov	_uart1_frame+53,_spc
 559                     ; 126 	uart1_frame.txbuf[7] = spc.deviceID[1];
 561  0019 450136        	mov	_uart1_frame+54,_spc+1
 562                     ; 127 	uart1_frame.txbuf[8] = spc.deviceID[2];
 564  001c 450237        	mov	_uart1_frame+55,_spc+2
 565                     ; 128 	uart1_frame.txbuf[9] = spc.deviceID[3];
 567  001f 450338        	mov	_uart1_frame+56,_spc+3
 568                     ; 129 	uart1_frame.txbuf[10] = spc.model;
 570  0022 450439        	mov	_uart1_frame+57,_spc+4
 571                     ; 130 	uart1_frame.txbuf[11] = spc.firmware_version;
 573  0025 45053a        	mov	_uart1_frame+58,_spc+5
 574                     ; 131 	uart1_frame.txbuf[12] = spc.f_mal.byte;
 576  0028 45073b        	mov	_uart1_frame+59,_spc+7
 577                     ; 132 	uart1_frame.txbuf[13] = spc.MDID;	
 579  002b 451d3c        	mov	_uart1_frame+60,_spc+29
 580                     ; 133 	uart1_frame.txbuf[14] = uart1_check_sum(&uart1_frame.txbuf[2], uart1_frame.txbuf[4]);
 582  002e 3b0033        	push	_uart1_frame+51
 583  0031 ae0031        	ldw	x,#_uart1_frame+49
 584  0034 cd0000        	call	_uart1_check_sum
 586  0037 5b01          	addw	sp,#1
 587  0039 b73d          	ld	_uart1_frame+61,a
 588                     ; 135 	uart1_frame.txlen = uart1_frame.txbuf[4] + 3;
 590  003b a600          	ld	a,#0
 591  003d 97            	ld	xl,a
 592  003e a603          	ld	a,#3
 593  0040 bb33          	add	a,_uart1_frame+51
 594  0042 2401          	jrnc	L02
 595  0044 5c            	incw	x
 596  0045               L02:
 597  0045 b704          	ld	_uart1_frame+4,a
 598  0047 9f            	ld	a,xl
 599  0048 b703          	ld	_uart1_frame+3,a
 600                     ; 136 	uart1_frame.txhas = 1;
 602  004a ae0001        	ldw	x,#1
 603  004d bf05          	ldw	_uart1_frame+5,x
 604                     ; 137 	UART1->DR = uart1_frame.txbuf[0];
 606  004f 55002f5231    	mov	21041,_uart1_frame+47
 607                     ; 140 }
 610  0054 81            	ret
 637                     ; 147 void uart1_init_energy_consume(void)
 637                     ; 148 {
 638                     .text:	section	.text,new
 639  0000               _uart1_init_energy_consume:
 643                     ; 150 	uart1_frame.txbuf[0] = 0x7e;
 645  0000 357e002f      	mov	_uart1_frame+47,#126
 646                     ; 151 	uart1_frame.txbuf[1] = 0x7e;
 648  0004 357e0030      	mov	_uart1_frame+48,#126
 649                     ; 152 	uart1_frame.txbuf[2] = spc.MDID;		//addr
 651  0008 451d31        	mov	_uart1_frame+49,_spc+29
 652                     ; 153 	uart1_frame.txbuf[3] = uart1_frame.rxbuf[3];	//message id
 654  000b 450a32        	mov	_uart1_frame+50,_uart1_frame+10
 655                     ; 154 	uart1_frame.txbuf[4] = 7;	//len
 657  000e 35070033      	mov	_uart1_frame+51,#7
 658                     ; 155 	uart1_frame.txbuf[5] = 0x2a;	//payload
 660  0012 352a0034      	mov	_uart1_frame+52,#42
 661                     ; 157 	uart1_frame.txbuf[6] = (u8)((spc.energy_consume >> 8) & 0xff);
 663  0016 b623          	ld	a,_spc+35
 664  0018 a4ff          	and	a,#255
 665  001a b735          	ld	_uart1_frame+53,a
 666                     ; 158 	uart1_frame.txbuf[7] = (u8)(spc.energy_consume & 0xff);
 668  001c b624          	ld	a,_spc+36
 669  001e a4ff          	and	a,#255
 670  0020 b736          	ld	_uart1_frame+54,a
 671                     ; 160 	uart1_frame.txbuf[8] = spc.MDID;
 673  0022 451d37        	mov	_uart1_frame+55,_spc+29
 674                     ; 161 	uart1_frame.txbuf[9] = uart1_check_sum(&uart1_frame.txbuf[2], uart1_frame.txbuf[4]);
 676  0025 3b0033        	push	_uart1_frame+51
 677  0028 ae0031        	ldw	x,#_uart1_frame+49
 678  002b cd0000        	call	_uart1_check_sum
 680  002e 5b01          	addw	sp,#1
 681  0030 b738          	ld	_uart1_frame+56,a
 682                     ; 163 	uart1_frame.txlen = uart1_frame.txbuf[4] + 3;
 684  0032 a600          	ld	a,#0
 685  0034 97            	ld	xl,a
 686  0035 a603          	ld	a,#3
 687  0037 bb33          	add	a,_uart1_frame+51
 688  0039 2401          	jrnc	L42
 689  003b 5c            	incw	x
 690  003c               L42:
 691  003c b704          	ld	_uart1_frame+4,a
 692  003e 9f            	ld	a,xl
 693  003f b703          	ld	_uart1_frame+3,a
 694                     ; 164 	uart1_frame.txhas = 1;
 696  0041 ae0001        	ldw	x,#1
 697  0044 bf05          	ldw	_uart1_frame+5,x
 698                     ; 165 	UART1->DR = uart1_frame.txbuf[0];
 700  0046 55002f5231    	mov	21041,_uart1_frame+47
 701                     ; 167 }
 704  004b 81            	ret
 731                     ; 179 void uart1_rev_heart_breat(void)
 731                     ; 180 {
 732                     .text:	section	.text,new
 733  0000               _uart1_rev_heart_breat:
 737                     ; 181 	uart1_frame.txbuf[0] = 0x7e;
 739  0000 357e002f      	mov	_uart1_frame+47,#126
 740                     ; 182 	uart1_frame.txbuf[1] = 0x7e;
 742  0004 357e0030      	mov	_uart1_frame+48,#126
 743                     ; 183 	uart1_frame.txbuf[2] = spc.MDID;		//addr
 745  0008 451d31        	mov	_uart1_frame+49,_spc+29
 746                     ; 184 	uart1_frame.txbuf[3] = uart1_frame.rxbuf[3];	//message id
 748  000b 450a32        	mov	_uart1_frame+50,_uart1_frame+10
 749                     ; 185 	uart1_frame.txbuf[4] = 10;	//len
 751  000e 350a0033      	mov	_uart1_frame+51,#10
 752                     ; 186 	uart1_frame.txbuf[5] = 0x06;	//payload
 754  0012 35060034      	mov	_uart1_frame+52,#6
 755                     ; 187 	uart1_frame.txbuf[6] = spc.MDID;
 757  0016 451d35        	mov	_uart1_frame+53,_spc+29
 758                     ; 188 	uart1_frame.txbuf[7] = spc.ch1_status;
 760  0019 451f36        	mov	_uart1_frame+54,_spc+31
 761                     ; 189 	uart1_frame.txbuf[8] = spc.ch2_status;
 763  001c 452037        	mov	_uart1_frame+55,_spc+32
 764                     ; 190 	uart1_frame.txbuf[9] = spc.ch3_status;
 766  001f 452138        	mov	_uart1_frame+56,_spc+33
 767                     ; 191 	uart1_frame.txbuf[10] = spc.ch4_status;
 769  0022 452239        	mov	_uart1_frame+57,_spc+34
 770                     ; 192 	uart1_frame.txbuf[11] = spc.f_mal.byte;
 772  0025 45073a        	mov	_uart1_frame+58,_spc+7
 773                     ; 193 	uart1_frame.txbuf[12] = uart1_check_sum(&uart1_frame.txbuf[2], uart1_frame.txbuf[4]);
 775  0028 3b0033        	push	_uart1_frame+51
 776  002b ae0031        	ldw	x,#_uart1_frame+49
 777  002e cd0000        	call	_uart1_check_sum
 779  0031 5b01          	addw	sp,#1
 780  0033 b73b          	ld	_uart1_frame+59,a
 781                     ; 195 	uart1_frame.txlen = uart1_frame.txbuf[4] + 3;
 783  0035 a600          	ld	a,#0
 784  0037 97            	ld	xl,a
 785  0038 a603          	ld	a,#3
 786  003a bb33          	add	a,_uart1_frame+51
 787  003c 2401          	jrnc	L03
 788  003e 5c            	incw	x
 789  003f               L03:
 790  003f b704          	ld	_uart1_frame+4,a
 791  0041 9f            	ld	a,xl
 792  0042 b703          	ld	_uart1_frame+3,a
 793                     ; 196 	uart1_frame.txhas = 1;
 795  0044 ae0001        	ldw	x,#1
 796  0047 bf05          	ldw	_uart1_frame+5,x
 797                     ; 197 	UART1->DR = uart1_frame.txbuf[0];
 799  0049 55002f5231    	mov	21041,_uart1_frame+47
 800                     ; 199 }
 803  004e 81            	ret
 830                     ; 206 void uart1_rev_action_plug_done(void)
 830                     ; 207 {
 831                     .text:	section	.text,new
 832  0000               _uart1_rev_action_plug_done:
 836                     ; 208 	uart1_frame.txbuf[0] = 0x7e;
 838  0000 357e002f      	mov	_uart1_frame+47,#126
 839                     ; 209 	uart1_frame.txbuf[1] = 0x7e;
 841  0004 357e0030      	mov	_uart1_frame+48,#126
 842                     ; 210 	uart1_frame.txbuf[2] = spc.MDID;			//addr
 844  0008 451d31        	mov	_uart1_frame+49,_spc+29
 845                     ; 211 	uart1_frame.txbuf[3] = uart1_frame.rxbuf[3];	//message id
 847  000b 450a32        	mov	_uart1_frame+50,_uart1_frame+10
 848                     ; 212 	uart1_frame.txbuf[4] = 10;	//len
 850  000e 350a0033      	mov	_uart1_frame+51,#10
 851                     ; 213 	uart1_frame.txbuf[5] = 0xaa;	//payload
 853  0012 35aa0034      	mov	_uart1_frame+52,#170
 854                     ; 215 	uart1_frame.txbuf[6] = 0x05;	//payload
 856  0016 35050035      	mov	_uart1_frame+53,#5
 857                     ; 216 	uart1_frame.txbuf[7] = spc.MDID;
 859  001a 451d36        	mov	_uart1_frame+54,_spc+29
 860                     ; 217 	uart1_frame.txbuf[8] = spc.ch1_status;
 862  001d 451f37        	mov	_uart1_frame+55,_spc+31
 863                     ; 218 	uart1_frame.txbuf[9] = spc.ch2_status;
 865  0020 452038        	mov	_uart1_frame+56,_spc+32
 866                     ; 219 	uart1_frame.txbuf[10] = spc.ch3_status;
 868  0023 452139        	mov	_uart1_frame+57,_spc+33
 869                     ; 220 	uart1_frame.txbuf[11] = spc.ch4_status;
 871  0026 45223a        	mov	_uart1_frame+58,_spc+34
 872                     ; 221 	uart1_frame.txbuf[12] = uart1_check_sum(&uart1_frame.txbuf[2], uart1_frame.txbuf[4]);
 874  0029 3b0033        	push	_uart1_frame+51
 875  002c ae0031        	ldw	x,#_uart1_frame+49
 876  002f cd0000        	call	_uart1_check_sum
 878  0032 5b01          	addw	sp,#1
 879  0034 b73b          	ld	_uart1_frame+59,a
 880                     ; 223 	uart1_frame.txlen = uart1_frame.txbuf[4] + 3;
 882  0036 a600          	ld	a,#0
 883  0038 97            	ld	xl,a
 884  0039 a603          	ld	a,#3
 885  003b bb33          	add	a,_uart1_frame+51
 886  003d 2401          	jrnc	L43
 887  003f 5c            	incw	x
 888  0040               L43:
 889  0040 b704          	ld	_uart1_frame+4,a
 890  0042 9f            	ld	a,xl
 891  0043 b703          	ld	_uart1_frame+3,a
 892                     ; 224 	uart1_frame.txhas = 1;
 894  0045 ae0001        	ldw	x,#1
 895  0048 bf05          	ldw	_uart1_frame+5,x
 896                     ; 225 	UART1->DR = uart1_frame.txbuf[0];
 898  004a 55002f5231    	mov	21041,_uart1_frame+47
 899                     ; 227 }
 902  004f 81            	ret
 939                     ; 236 void uart1_recv_handle(void)
 939                     ; 237 {
 940                     .text:	section	.text,new
 941  0000               _uart1_recv_handle:
 945                     ; 240 	switch(uart1_frame.rxbuf[UART1_POSITION_COMMAND]){
 947  0000 b60c          	ld	a,_uart1_frame+12
 949                     ; 306 		default:
 949                     ; 307 			break;
 950  0002 a003          	sub	a,#3
 951  0004 272f          	jreq	L552
 952  0006 a052          	sub	a,#82
 953  0008 2756          	jreq	L752
 954  000a a0a9          	sub	a,#169
 955  000c 2703          	jreq	L04
 956  000e cc0110        	jp	L572
 957  0011               L04:
 958                     ; 241 		case 0xFE:
 958                     ; 242 			if(uart1_frame.rxbuf[6] == 0x01){
 960  0011 b60d          	ld	a,_uart1_frame+13
 961  0013 a101          	cp	a,#1
 962  0015 2607          	jrne	L772
 963                     ; 243 				uart1_init_device_info();
 965  0017 cd0000        	call	_uart1_init_device_info
 968  001a ac100110      	jpf	L572
 969  001e               L772:
 970                     ; 245 			else if(uart1_frame.rxbuf[6] == 0x02){
 972  001e b60d          	ld	a,_uart1_frame+13
 973  0020 a102          	cp	a,#2
 974  0022 2703          	jreq	L24
 975  0024 cc0110        	jp	L572
 976  0027               L24:
 977                     ; 246 				spc.energy_consume = adc_sample.total_energy;
 979  0027 be12          	ldw	x,_adc_sample+18
 980  0029 bf23          	ldw	_spc+35,x
 981                     ; 247 				uart1_init_energy_consume();
 983  002b cd0000        	call	_uart1_init_energy_consume
 985                     ; 248 				adc_sample.total_energy = 0;
 987  002e 5f            	clrw	x
 988  002f bf12          	ldw	_adc_sample+18,x
 989  0031 ac100110      	jpf	L572
 990  0035               L552:
 991                     ; 252 		case 0x03:
 991                     ; 253 			if((uart1_frame.rxbuf[6] == 0x03) && (uart1_frame.rxbuf[7] == spc.MDID)){
 993  0035 b60d          	ld	a,_uart1_frame+13
 994  0037 a103          	cp	a,#3
 995  0039 2703          	jreq	L44
 996  003b cc0110        	jp	L572
 997  003e               L44:
 999  003e b60e          	ld	a,_uart1_frame+14
1000  0040 b11d          	cp	a,_spc+29
1001  0042 2703          	jreq	L64
1002  0044 cc0110        	jp	L572
1003  0047               L64:
1004                     ; 255 				if(uart1_check_sum(&uart1_frame.rxbuf[2], uart1_frame.rxbuf[4]) == uart1_frame.rxbuf[8]){
1006  0047 3b000b        	push	_uart1_frame+11
1007  004a ae0009        	ldw	x,#_uart1_frame+9
1008  004d cd0000        	call	_uart1_check_sum
1010  0050 5b01          	addw	sp,#1
1011  0052 b10f          	cp	a,_uart1_frame+15
1012  0054 2703          	jreq	L05
1013  0056 cc0110        	jp	L572
1014  0059               L05:
1015                     ; 256 					uart1_rev_heart_breat();
1017  0059 cd0000        	call	_uart1_rev_heart_breat
1019  005c ac100110      	jpf	L572
1020  0060               L752:
1021                     ; 260 		case 0x55://打开或关闭开关
1021                     ; 261 		
1021                     ; 262 			if((uart1_frame.rxbuf[6] >> 4) == spc.MDID){
1023  0060 b60d          	ld	a,_uart1_frame+13
1024  0062 4e            	swap	a
1025  0063 a40f          	and	a,#15
1026  0065 5f            	clrw	x
1027  0066 97            	ld	xl,a
1028  0067 b61d          	ld	a,_spc+29
1029  0069 905f          	clrw	y
1030  006b 9097          	ld	yl,a
1031  006d 90bf01        	ldw	c_y+1,y
1032  0070 b301          	cpw	x,c_y+1
1033  0072 2703          	jreq	L25
1034  0074 cc0110        	jp	L572
1035  0077               L25:
1036                     ; 264 				channel = uart1_frame.rxbuf[6] & 0x0f;
1038  0077 b60d          	ld	a,_uart1_frame+13
1039  0079 a40f          	and	a,#15
1040  007b b700          	ld	_channel,a
1041                     ; 265 				if((channel & 0x01)==0x01)	{
1043  007d b600          	ld	a,_channel
1044  007f a401          	and	a,#1
1045  0081 a101          	cp	a,#1
1046  0083 2628          	jrne	L313
1047                     ; 266 					spc.ch1_status = uart1_frame.rxbuf[7];
1049  0085 450e1f        	mov	_spc+31,_uart1_frame+14
1050                     ; 267 					if(spc.ch1_status != last_ch1_status)	{						
1052  0088 b61f          	ld	a,_spc+31
1053  008a b100          	cp	a,_last_ch1_status
1054  008c 271c          	jreq	L513
1055                     ; 268 						spc.savFlag = 1;		/* 保存状态数据 */
1057  008e 3501001e      	mov	_spc+30,#1
1058                     ; 269 						if(spc.ch1_status)
1060  0092 3d1f          	tnz	_spc+31
1061  0094 270b          	jreq	L713
1062                     ; 270 							CH1_ON;
1064  0096 4b08          	push	#8
1065  0098 ae5000        	ldw	x,#20480
1066  009b cd0000        	call	_GPIO_WriteLow
1068  009e 84            	pop	a
1070  009f 2009          	jra	L513
1071  00a1               L713:
1072                     ; 272 							CH1_OFF;
1074  00a1 4b08          	push	#8
1075  00a3 ae5000        	ldw	x,#20480
1076  00a6 cd0000        	call	_GPIO_WriteHigh
1078  00a9 84            	pop	a
1079  00aa               L513:
1080                     ; 274 					last_ch1_status = spc.ch1_status;
1082  00aa 451f00        	mov	_last_ch1_status,_spc+31
1083  00ad               L313:
1084                     ; 276 				if((channel & 0x02)==0x02)	{
1086  00ad b600          	ld	a,_channel
1087  00af a402          	and	a,#2
1088  00b1 a102          	cp	a,#2
1089  00b3 2628          	jrne	L323
1090                     ; 277 					spc.ch2_status = uart1_frame.rxbuf[7];
1092  00b5 450e20        	mov	_spc+32,_uart1_frame+14
1093                     ; 278 					if(spc.ch2_status != last_ch2_status)	{
1095  00b8 b620          	ld	a,_spc+32
1096  00ba b100          	cp	a,_last_ch2_status
1097  00bc 271c          	jreq	L523
1098                     ; 279 						spc.savFlag = 1;		/* 保存状态数据 */
1100  00be 3501001e      	mov	_spc+30,#1
1101                     ; 280 						if(spc.ch2_status)
1103  00c2 3d20          	tnz	_spc+32
1104  00c4 270b          	jreq	L723
1105                     ; 281 							CH2_ON;
1107  00c6 4b10          	push	#16
1108  00c8 ae500a        	ldw	x,#20490
1109  00cb cd0000        	call	_GPIO_WriteLow
1111  00ce 84            	pop	a
1113  00cf 2009          	jra	L523
1114  00d1               L723:
1115                     ; 283 							CH2_OFF;
1117  00d1 4b10          	push	#16
1118  00d3 ae500a        	ldw	x,#20490
1119  00d6 cd0000        	call	_GPIO_WriteHigh
1121  00d9 84            	pop	a
1122  00da               L523:
1123                     ; 285 					last_ch2_status = spc.ch2_status;
1125  00da 452000        	mov	_last_ch2_status,_spc+32
1126  00dd               L323:
1127                     ; 288 				if((channel & 0x04)==0x04)	{
1129  00dd b600          	ld	a,_channel
1130  00df a404          	and	a,#4
1131  00e1 a104          	cp	a,#4
1132  00e3 2628          	jrne	L333
1133                     ; 289 					spc.ch3_status = uart1_frame.rxbuf[7];
1135  00e5 450e21        	mov	_spc+33,_uart1_frame+14
1136                     ; 290 					if(spc.ch3_status != last_ch3_status)	{
1138  00e8 b621          	ld	a,_spc+33
1139  00ea b100          	cp	a,_last_ch3_status
1140  00ec 271c          	jreq	L533
1141                     ; 291 						spc.savFlag = 1;		/* 保存状态数据 */
1143  00ee 3501001e      	mov	_spc+30,#1
1144                     ; 292 						if(spc.ch3_status)
1146  00f2 3d21          	tnz	_spc+33
1147  00f4 270b          	jreq	L733
1148                     ; 293 							CH3_ON;
1150  00f6 4b08          	push	#8
1151  00f8 ae500a        	ldw	x,#20490
1152  00fb cd0000        	call	_GPIO_WriteLow
1154  00fe 84            	pop	a
1156  00ff 2009          	jra	L533
1157  0101               L733:
1158                     ; 295 							CH3_OFF;
1160  0101 4b08          	push	#8
1161  0103 ae500a        	ldw	x,#20490
1162  0106 cd0000        	call	_GPIO_WriteHigh
1164  0109 84            	pop	a
1165  010a               L533:
1166                     ; 297 					last_ch3_status = spc.ch3_status;
1168  010a 452100        	mov	_last_ch3_status,_spc+33
1169  010d               L333:
1170                     ; 299 				uart1_rev_action_plug_done();
1172  010d cd0000        	call	_uart1_rev_action_plug_done
1174  0110               L162:
1175                     ; 306 		default:
1175                     ; 307 			break;
1177  0110               L572:
1178                     ; 311 }
1181  0110 81            	ret
1206                     ; 319 @interrupt void UART1_TX_ISR(void) 
1206                     ; 320 {
1207                     .text:	section	.text,new
1208  0000               _UART1_TX_ISR:
1213                     ; 325 	UART1->SR &= ~0x40; 	//清除发送完成标志位
1215  0000 721d5230      	bres	21040,#6
1216                     ; 327 	if (uart1_frame.txhas < uart1_frame.txlen){
1218  0004 be05          	ldw	x,_uart1_frame+5
1219  0006 b303          	cpw	x,_uart1_frame+3
1220  0008 2410          	jruge	L353
1221                     ; 329 		UART1->DR = uart1_frame.txbuf[uart1_frame.txhas];
1223  000a be05          	ldw	x,_uart1_frame+5
1224  000c e62f          	ld	a,(_uart1_frame+47,x)
1225  000e c75231        	ld	21041,a
1226                     ; 330 		uart1_frame.txhas++;
1228  0011 be05          	ldw	x,_uart1_frame+5
1229  0013 1c0001        	addw	x,#1
1230  0016 bf05          	ldw	_uart1_frame+5,x
1232  0018 2010          	jra	L553
1233  001a               L353:
1234                     ; 334 		uart1_frame.txhas = 0;
1236  001a 5f            	clrw	x
1237  001b bf05          	ldw	_uart1_frame+5,x
1238                     ; 335 		uart1_frame.txlen = 0;
1240  001d 5f            	clrw	x
1241  001e bf03          	ldw	_uart1_frame+3,x
1242                     ; 337 		if(spc.savFlag == 1){
1244  0020 b61e          	ld	a,_spc+30
1245  0022 a101          	cp	a,#1
1246  0024 2604          	jrne	L553
1247                     ; 338 			spc.savFlag = 2;
1249  0026 3502001e      	mov	_spc+30,#2
1250  002a               L553:
1251                     ; 344 }
1254  002a 80            	iret
1301                     ; 354 @interrupt void UART1_RX_ISR(void)
1301                     ; 355 {
1302                     .text:	section	.text,new
1303  0000               _UART1_RX_ISR:
1306       00000001      OFST:	set	1
1307  0000 3b0002        	push	c_x+2
1308  0003 be00          	ldw	x,c_x
1309  0005 89            	pushw	x
1310  0006 3b0002        	push	c_y+2
1311  0009 be00          	ldw	x,c_y
1312  000b 89            	pushw	x
1313  000c 88            	push	a
1316                     ; 358 	temp = (u8)UART1->DR;
1318  000d c65231        	ld	a,21041
1319  0010 6b01          	ld	(OFST+0,sp),a
1320                     ; 359 	uart1_frame.rxbuf[uart1_frame.rxlen] = temp;
1322  0012 7b01          	ld	a,(OFST+0,sp)
1323  0014 be01          	ldw	x,_uart1_frame+1
1324  0016 e707          	ld	(_uart1_frame+7,x),a
1325                     ; 360 	uart1_frame.rxlen++;
1327  0018 be01          	ldw	x,_uart1_frame+1
1328  001a 1c0001        	addw	x,#1
1329  001d bf01          	ldw	_uart1_frame+1,x
1330                     ; 362 	switch(uart1_frame.rxlen){
1332  001f be01          	ldw	x,_uart1_frame+1
1334                     ; 403 			break;
1335  0021 5a            	decw	x
1336  0022 2712          	jreq	L163
1337  0024 5a            	decw	x
1338  0025 271a          	jreq	L363
1339  0027 5a            	decw	x
1340  0028 2722          	jreq	L563
1341  002a               L763:
1342                     ; 376 		default:
1342                     ; 377 			//防止接收错误后溢出
1342                     ; 378 			if (uart1_frame.rxlen >= UART1_RECV_LEN){
1344  002a be01          	ldw	x,_uart1_frame+1
1345  002c a30028        	cpw	x,#40
1346  002f 2526          	jrult	L524
1347                     ; 379 				uart1_frame.rxlen = 0;
1349  0031 5f            	clrw	x
1350  0032 bf01          	ldw	_uart1_frame+1,x
1351  0034 2021          	jra	L524
1352  0036               L163:
1353                     ; 364 		case 1:
1353                     ; 365 			if (temp != 0x7e) uart1_frame.rxlen = 0;
1355  0036 7b01          	ld	a,(OFST+0,sp)
1356  0038 a17e          	cp	a,#126
1357  003a 274d          	jreq	L514
1360  003c 5f            	clrw	x
1361  003d bf01          	ldw	_uart1_frame+1,x
1362  003f 2048          	jra	L514
1363  0041               L363:
1364                     ; 368 		case 2:
1364                     ; 369 			if (temp != 0x7e) uart1_frame.rxlen = 0;
1366  0041 7b01          	ld	a,(OFST+0,sp)
1367  0043 a17e          	cp	a,#126
1368  0045 2742          	jreq	L514
1371  0047 5f            	clrw	x
1372  0048 bf01          	ldw	_uart1_frame+1,x
1373  004a 203d          	jra	L514
1374  004c               L563:
1375                     ; 372 		case 3:
1375                     ; 373 			if (temp != spc.MDID) uart1_frame.rxlen = 0;
1377  004c 7b01          	ld	a,(OFST+0,sp)
1378  004e b11d          	cp	a,_spc+29
1379  0050 2737          	jreq	L514
1382  0052 5f            	clrw	x
1383  0053 bf01          	ldw	_uart1_frame+1,x
1384  0055 2032          	jra	L514
1385  0057               L524:
1386                     ; 383 			if(uart1_frame.rxlen > UART1_AFTER_LENGTH_BYTES){	
1388  0057 be01          	ldw	x,_uart1_frame+1
1389  0059 a30006        	cpw	x,#6
1390  005c 252b          	jrult	L514
1391                     ; 385 				if (uart1_frame.rxlen >= uart1_frame.rxbuf[UART1_POSITION_LENGTH] + 3)//接收数据完成
1393  005e a600          	ld	a,#0
1394  0060 97            	ld	xl,a
1395  0061 a603          	ld	a,#3
1396  0063 bb0b          	add	a,_uart1_frame+11
1397  0065 2401          	jrnc	L06
1398  0067 5c            	incw	x
1399  0068               L06:
1400  0068 02            	rlwa	x,a
1401  0069 b301          	cpw	x,_uart1_frame+1
1402  006b 221c          	jrugt	L514
1403                     ; 388 					check_sum = uart1_check_sum(uart1_frame.rxbuf + 2, uart1_frame.rxbuf[UART1_POSITION_LENGTH]);
1405  006d 3b000b        	push	_uart1_frame+11
1406  0070 ae0009        	ldw	x,#_uart1_frame+9
1407  0073 cd0000        	call	_uart1_check_sum
1409  0076 5b01          	addw	sp,#1
1410  0078 6b01          	ld	(OFST+0,sp),a
1411                     ; 391 					if (check_sum == uart1_frame.rxbuf[uart1_frame.rxlen - 1]){
1413  007a be01          	ldw	x,_uart1_frame+1
1414  007c 5a            	decw	x
1415  007d e607          	ld	a,(_uart1_frame+7,x)
1416  007f 1101          	cp	a,(OFST+0,sp)
1417  0081 2603          	jrne	L334
1418                     ; 394 						uart1_recv_handle();
1420  0083 cd0000        	call	_uart1_recv_handle
1422  0086               L334:
1423                     ; 397 					uart1_frame.rxlen = 0;
1425  0086 5f            	clrw	x
1426  0087 bf01          	ldw	_uart1_frame+1,x
1427  0089               L514:
1428                     ; 407 	if (UART1->SR & 0x20) //|| (UART1->SR & UART2_SR_OR))
1430  0089 c65230        	ld	a,21040
1431  008c a520          	bcp	a,#32
1432  008e 2707          	jreq	L534
1433                     ; 409 		temp = UART1->DR;
1435  0090 7b01          	ld	a,(OFST+0,sp)
1436  0092 97            	ld	xl,a
1437  0093 c65231        	ld	a,21041
1438  0096 97            	ld	xl,a
1439  0097               L534:
1440                     ; 412 }
1443  0097 84            	pop	a
1444  0098 85            	popw	x
1445  0099 bf00          	ldw	c_y,x
1446  009b 320002        	pop	c_y+2
1447  009e 85            	popw	x
1448  009f bf00          	ldw	c_x,x
1449  00a1 320002        	pop	c_x+2
1450  00a4 80            	iret
1530                     	xdef	_uart1_recv_handle
1531                     	xdef	_uart1_rev_action_plug_done
1532                     	xdef	_uart1_rev_heart_breat
1533                     	xdef	_uart1_init_energy_consume
1534                     	xdef	_uart1_init_device_info
1535                     	xdef	_Uart1_Send
1536                     	xdef	_uart1_check_sum
1537                     	xdef	_mymemcpy
1538                     	xdef	_random
1539                     	xref.b	_last_ch3_status
1540                     	xref.b	_last_ch2_status
1541                     	xref.b	_last_ch1_status
1542                     	xref.b	_channel
1543                     	xref.b	_spc
1544                     	xref.b	_adc_sample
1545                     	xdef	_UART1_RX_ISR
1546                     	xdef	_UART1_TX_ISR
1547                     	xdef	_uart1_init
1548                     	switch	.ubsct
1549  0000               _uart1_frame:
1550  0000 000000000000  	ds.b	87
1551                     	xdef	_uart1_frame
1552                     	xref	_UART1_ITConfig
1553                     	xref	_UART1_Cmd
1554                     	xref	_UART1_Init
1555                     	xref	_UART1_DeInit
1556                     	xref	_GPIO_WriteLow
1557                     	xref	_GPIO_WriteHigh
1558                     	xref	_rand
1559                     	xref.b	c_lreg
1560                     	xref.b	c_x
1561                     	xref.b	c_y
1581                     	xref	c_uitolx
1582                     	xref	c_lrzmp
1583                     	xref	c_lgsbc
1584                     	xref	c_ltor
1585                     	xref	c_idiv
1586                     	end
