   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
  32                     ; 53 void UART1_DeInit(void)
  32                     ; 54 {
  34                     .text:	section	.text,new
  35  0000               _UART1_DeInit:
  39                     ; 57   (void)UART1->SR;
  41  0000 c65230        	ld	a,21040
  42  0003 97            	ld	xl,a
  43                     ; 58   (void)UART1->DR;
  45  0004 c65231        	ld	a,21041
  46  0007 97            	ld	xl,a
  47                     ; 60   UART1->BRR2 = UART1_BRR2_RESET_VALUE;  /* Set UART1_BRR2 to reset value 0x00 */
  49  0008 725f5233      	clr	21043
  50                     ; 61   UART1->BRR1 = UART1_BRR1_RESET_VALUE;  /* Set UART1_BRR1 to reset value 0x00 */
  52  000c 725f5232      	clr	21042
  53                     ; 63   UART1->CR1 = UART1_CR1_RESET_VALUE;  /* Set UART1_CR1 to reset value 0x00 */
  55  0010 725f5234      	clr	21044
  56                     ; 64   UART1->CR2 = UART1_CR2_RESET_VALUE;  /* Set UART1_CR2 to reset value 0x00 */
  58  0014 725f5235      	clr	21045
  59                     ; 65   UART1->CR3 = UART1_CR3_RESET_VALUE;  /* Set UART1_CR3 to reset value 0x00 */
  61  0018 725f5236      	clr	21046
  62                     ; 66   UART1->CR4 = UART1_CR4_RESET_VALUE;  /* Set UART1_CR4 to reset value 0x00 */
  64  001c 725f5237      	clr	21047
  65                     ; 67   UART1->CR5 = UART1_CR5_RESET_VALUE;  /* Set UART1_CR5 to reset value 0x00 */
  67  0020 725f5238      	clr	21048
  68                     ; 69   UART1->GTR = UART1_GTR_RESET_VALUE;
  70  0024 725f5239      	clr	21049
  71                     ; 70   UART1->PSCR = UART1_PSCR_RESET_VALUE;
  73  0028 725f523a      	clr	21050
  74                     ; 71 }
  77  002c 81            	ret
 380                     .const:	section	.text
 381  0000               L01:
 382  0000 00000064      	dc.l	100
 383                     ; 90 void UART1_Init(uint32_t BaudRate, UART1_WordLength_TypeDef WordLength, 
 383                     ; 91                 UART1_StopBits_TypeDef StopBits, UART1_Parity_TypeDef Parity, 
 383                     ; 92                 UART1_SyncMode_TypeDef SyncMode, UART1_Mode_TypeDef Mode)
 383                     ; 93 {
 384                     .text:	section	.text,new
 385  0000               _UART1_Init:
 387  0000 520c          	subw	sp,#12
 388       0000000c      OFST:	set	12
 391                     ; 94   uint32_t BaudRate_Mantissa = 0, BaudRate_Mantissa100 = 0;
 393  0002 96            	ldw	x,sp
 394  0003 1c0009        	addw	x,#OFST-3
 395  0006 cd0000        	call	c_ltor
 399  0009 96            	ldw	x,sp
 400  000a 1c0005        	addw	x,#OFST-7
 401  000d cd0000        	call	c_ltor
 403                     ; 97   assert_param(IS_UART1_BAUDRATE_OK(BaudRate));
 405                     ; 98   assert_param(IS_UART1_WORDLENGTH_OK(WordLength));
 407                     ; 99   assert_param(IS_UART1_STOPBITS_OK(StopBits));
 409                     ; 100   assert_param(IS_UART1_PARITY_OK(Parity));
 411                     ; 101   assert_param(IS_UART1_MODE_OK((uint8_t)Mode));
 413                     ; 102   assert_param(IS_UART1_SYNCMODE_OK((uint8_t)SyncMode));
 415                     ; 105   UART1->CR1 &= (uint8_t)(~UART1_CR1_M);  
 417  0010 72195234      	bres	21044,#4
 418                     ; 108   UART1->CR1 |= (uint8_t)WordLength;
 420  0014 c65234        	ld	a,21044
 421  0017 1a13          	or	a,(OFST+7,sp)
 422  0019 c75234        	ld	21044,a
 423                     ; 111   UART1->CR3 &= (uint8_t)(~UART1_CR3_STOP);  
 425  001c c65236        	ld	a,21046
 426  001f a4cf          	and	a,#207
 427  0021 c75236        	ld	21046,a
 428                     ; 113   UART1->CR3 |= (uint8_t)StopBits;  
 430  0024 c65236        	ld	a,21046
 431  0027 1a14          	or	a,(OFST+8,sp)
 432  0029 c75236        	ld	21046,a
 433                     ; 116   UART1->CR1 &= (uint8_t)(~(UART1_CR1_PCEN | UART1_CR1_PS  ));  
 435  002c c65234        	ld	a,21044
 436  002f a4f9          	and	a,#249
 437  0031 c75234        	ld	21044,a
 438                     ; 118   UART1->CR1 |= (uint8_t)Parity;  
 440  0034 c65234        	ld	a,21044
 441  0037 1a15          	or	a,(OFST+9,sp)
 442  0039 c75234        	ld	21044,a
 443                     ; 121   UART1->BRR1 &= (uint8_t)(~UART1_BRR1_DIVM);  
 445  003c 725f5232      	clr	21042
 446                     ; 123   UART1->BRR2 &= (uint8_t)(~UART1_BRR2_DIVM);  
 448  0040 c65233        	ld	a,21043
 449  0043 a40f          	and	a,#15
 450  0045 c75233        	ld	21043,a
 451                     ; 125   UART1->BRR2 &= (uint8_t)(~UART1_BRR2_DIVF);  
 453  0048 c65233        	ld	a,21043
 454  004b a4f0          	and	a,#240
 455  004d c75233        	ld	21043,a
 456                     ; 128   BaudRate_Mantissa    = ((uint32_t)CLK_GetClockFreq() / (BaudRate << 4));
 458  0050 96            	ldw	x,sp
 459  0051 1c000f        	addw	x,#OFST+3
 460  0054 cd0000        	call	c_ltor
 462  0057 a604          	ld	a,#4
 463  0059 cd0000        	call	c_llsh
 465  005c 96            	ldw	x,sp
 466  005d 1c0001        	addw	x,#OFST-11
 467  0060 cd0000        	call	c_rtol
 469  0063 cd0000        	call	_CLK_GetClockFreq
 471  0066 96            	ldw	x,sp
 472  0067 1c0001        	addw	x,#OFST-11
 473  006a cd0000        	call	c_ludv
 475  006d 96            	ldw	x,sp
 476  006e 1c0009        	addw	x,#OFST-3
 477  0071 cd0000        	call	c_rtol
 479                     ; 129   BaudRate_Mantissa100 = (((uint32_t)CLK_GetClockFreq() * 100) / (BaudRate << 4));
 481  0074 96            	ldw	x,sp
 482  0075 1c000f        	addw	x,#OFST+3
 483  0078 cd0000        	call	c_ltor
 485  007b a604          	ld	a,#4
 486  007d cd0000        	call	c_llsh
 488  0080 96            	ldw	x,sp
 489  0081 1c0001        	addw	x,#OFST-11
 490  0084 cd0000        	call	c_rtol
 492  0087 cd0000        	call	_CLK_GetClockFreq
 494  008a a664          	ld	a,#100
 495  008c cd0000        	call	c_smul
 497  008f 96            	ldw	x,sp
 498  0090 1c0001        	addw	x,#OFST-11
 499  0093 cd0000        	call	c_ludv
 501  0096 96            	ldw	x,sp
 502  0097 1c0005        	addw	x,#OFST-7
 503  009a cd0000        	call	c_rtol
 505                     ; 131   UART1->BRR2 |= (uint8_t)((uint8_t)(((BaudRate_Mantissa100 - (BaudRate_Mantissa * 100)) << 4) / 100) & (uint8_t)0x0F); 
 507  009d 96            	ldw	x,sp
 508  009e 1c0009        	addw	x,#OFST-3
 509  00a1 cd0000        	call	c_ltor
 511  00a4 a664          	ld	a,#100
 512  00a6 cd0000        	call	c_smul
 514  00a9 96            	ldw	x,sp
 515  00aa 1c0001        	addw	x,#OFST-11
 516  00ad cd0000        	call	c_rtol
 518  00b0 96            	ldw	x,sp
 519  00b1 1c0005        	addw	x,#OFST-7
 520  00b4 cd0000        	call	c_ltor
 522  00b7 96            	ldw	x,sp
 523  00b8 1c0001        	addw	x,#OFST-11
 524  00bb cd0000        	call	c_lsub
 526  00be a604          	ld	a,#4
 527  00c0 cd0000        	call	c_llsh
 529  00c3 ae0000        	ldw	x,#L01
 530  00c6 cd0000        	call	c_ludv
 532  00c9 b603          	ld	a,c_lreg+3
 533  00cb a40f          	and	a,#15
 534  00cd ca5233        	or	a,21043
 535  00d0 c75233        	ld	21043,a
 536                     ; 133   UART1->BRR2 |= (uint8_t)((BaudRate_Mantissa >> 4) & (uint8_t)0xF0); 
 538  00d3 96            	ldw	x,sp
 539  00d4 1c0009        	addw	x,#OFST-3
 540  00d7 cd0000        	call	c_ltor
 542  00da a604          	ld	a,#4
 543  00dc cd0000        	call	c_lursh
 545  00df b603          	ld	a,c_lreg+3
 546  00e1 a4f0          	and	a,#240
 547  00e3 b703          	ld	c_lreg+3,a
 548  00e5 3f02          	clr	c_lreg+2
 549  00e7 3f01          	clr	c_lreg+1
 550  00e9 3f00          	clr	c_lreg
 551  00eb b603          	ld	a,c_lreg+3
 552  00ed ca5233        	or	a,21043
 553  00f0 c75233        	ld	21043,a
 554                     ; 135   UART1->BRR1 |= (uint8_t)BaudRate_Mantissa;           
 556  00f3 c65232        	ld	a,21042
 557  00f6 1a0c          	or	a,(OFST+0,sp)
 558  00f8 c75232        	ld	21042,a
 559                     ; 138   UART1->CR2 &= (uint8_t)~(UART1_CR2_TEN | UART1_CR2_REN); 
 561  00fb c65235        	ld	a,21045
 562  00fe a4f3          	and	a,#243
 563  0100 c75235        	ld	21045,a
 564                     ; 140   UART1->CR3 &= (uint8_t)~(UART1_CR3_CPOL | UART1_CR3_CPHA | UART1_CR3_LBCL); 
 566  0103 c65236        	ld	a,21046
 567  0106 a4f8          	and	a,#248
 568  0108 c75236        	ld	21046,a
 569                     ; 142   UART1->CR3 |= (uint8_t)((uint8_t)SyncMode & (uint8_t)(UART1_CR3_CPOL | 
 569                     ; 143                                                         UART1_CR3_CPHA | UART1_CR3_LBCL));  
 571  010b 7b16          	ld	a,(OFST+10,sp)
 572  010d a407          	and	a,#7
 573  010f ca5236        	or	a,21046
 574  0112 c75236        	ld	21046,a
 575                     ; 145   if ((uint8_t)(Mode & UART1_MODE_TX_ENABLE))
 577  0115 7b17          	ld	a,(OFST+11,sp)
 578  0117 a504          	bcp	a,#4
 579  0119 2706          	jreq	L371
 580                     ; 148     UART1->CR2 |= (uint8_t)UART1_CR2_TEN;  
 582  011b 72165235      	bset	21045,#3
 584  011f 2004          	jra	L571
 585  0121               L371:
 586                     ; 153     UART1->CR2 &= (uint8_t)(~UART1_CR2_TEN);  
 588  0121 72175235      	bres	21045,#3
 589  0125               L571:
 590                     ; 155   if ((uint8_t)(Mode & UART1_MODE_RX_ENABLE))
 592  0125 7b17          	ld	a,(OFST+11,sp)
 593  0127 a508          	bcp	a,#8
 594  0129 2706          	jreq	L771
 595                     ; 158     UART1->CR2 |= (uint8_t)UART1_CR2_REN;  
 597  012b 72145235      	bset	21045,#2
 599  012f 2004          	jra	L102
 600  0131               L771:
 601                     ; 163     UART1->CR2 &= (uint8_t)(~UART1_CR2_REN);  
 603  0131 72155235      	bres	21045,#2
 604  0135               L102:
 605                     ; 167   if ((uint8_t)(SyncMode & UART1_SYNCMODE_CLOCK_DISABLE))
 607  0135 7b16          	ld	a,(OFST+10,sp)
 608  0137 a580          	bcp	a,#128
 609  0139 2706          	jreq	L302
 610                     ; 170     UART1->CR3 &= (uint8_t)(~UART1_CR3_CKEN); 
 612  013b 72175236      	bres	21046,#3
 614  013f 200a          	jra	L502
 615  0141               L302:
 616                     ; 174     UART1->CR3 |= (uint8_t)((uint8_t)SyncMode & UART1_CR3_CKEN);
 618  0141 7b16          	ld	a,(OFST+10,sp)
 619  0143 a408          	and	a,#8
 620  0145 ca5236        	or	a,21046
 621  0148 c75236        	ld	21046,a
 622  014b               L502:
 623                     ; 176 }
 626  014b 5b0c          	addw	sp,#12
 627  014d 81            	ret
 682                     ; 184 void UART1_Cmd(FunctionalState NewState)
 682                     ; 185 {
 683                     .text:	section	.text,new
 684  0000               _UART1_Cmd:
 688                     ; 186   if (NewState != DISABLE)
 690  0000 4d            	tnz	a
 691  0001 2706          	jreq	L532
 692                     ; 189     UART1->CR1 &= (uint8_t)(~UART1_CR1_UARTD); 
 694  0003 721b5234      	bres	21044,#5
 696  0007 2004          	jra	L732
 697  0009               L532:
 698                     ; 194     UART1->CR1 |= UART1_CR1_UARTD;  
 700  0009 721a5234      	bset	21044,#5
 701  000d               L732:
 702                     ; 196 }
 705  000d 81            	ret
 830                     ; 211 void UART1_ITConfig(UART1_IT_TypeDef UART1_IT, FunctionalState NewState)
 830                     ; 212 {
 831                     .text:	section	.text,new
 832  0000               _UART1_ITConfig:
 834  0000 89            	pushw	x
 835  0001 89            	pushw	x
 836       00000002      OFST:	set	2
 839                     ; 213   uint8_t uartreg = 0, itpos = 0x00;
 841  0002 7b01          	ld	a,(OFST-1,sp)
 842  0004 97            	ld	xl,a
 845  0005 7b02          	ld	a,(OFST+0,sp)
 846  0007 97            	ld	xl,a
 847                     ; 216   assert_param(IS_UART1_CONFIG_IT_OK(UART1_IT));
 849                     ; 217   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 851                     ; 220   uartreg = (uint8_t)((uint16_t)UART1_IT >> 0x08);
 853  0008 7b03          	ld	a,(OFST+1,sp)
 854  000a 6b01          	ld	(OFST-1,sp),a
 855                     ; 222   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)UART1_IT & (uint8_t)0x0F));
 857  000c 7b04          	ld	a,(OFST+2,sp)
 858  000e a40f          	and	a,#15
 859  0010 5f            	clrw	x
 860  0011 97            	ld	xl,a
 861  0012 a601          	ld	a,#1
 862  0014 5d            	tnzw	x
 863  0015 2704          	jreq	L61
 864  0017               L02:
 865  0017 48            	sll	a
 866  0018 5a            	decw	x
 867  0019 26fc          	jrne	L02
 868  001b               L61:
 869  001b 6b02          	ld	(OFST+0,sp),a
 870                     ; 224   if (NewState != DISABLE)
 872  001d 0d07          	tnz	(OFST+5,sp)
 873  001f 272a          	jreq	L713
 874                     ; 227     if (uartreg == 0x01)
 876  0021 7b01          	ld	a,(OFST-1,sp)
 877  0023 a101          	cp	a,#1
 878  0025 260a          	jrne	L123
 879                     ; 229       UART1->CR1 |= itpos;
 881  0027 c65234        	ld	a,21044
 882  002a 1a02          	or	a,(OFST+0,sp)
 883  002c c75234        	ld	21044,a
 885  002f 2045          	jra	L133
 886  0031               L123:
 887                     ; 231     else if (uartreg == 0x02)
 889  0031 7b01          	ld	a,(OFST-1,sp)
 890  0033 a102          	cp	a,#2
 891  0035 260a          	jrne	L523
 892                     ; 233       UART1->CR2 |= itpos;
 894  0037 c65235        	ld	a,21045
 895  003a 1a02          	or	a,(OFST+0,sp)
 896  003c c75235        	ld	21045,a
 898  003f 2035          	jra	L133
 899  0041               L523:
 900                     ; 237       UART1->CR4 |= itpos;
 902  0041 c65237        	ld	a,21047
 903  0044 1a02          	or	a,(OFST+0,sp)
 904  0046 c75237        	ld	21047,a
 905  0049 202b          	jra	L133
 906  004b               L713:
 907                     ; 243     if (uartreg == 0x01)
 909  004b 7b01          	ld	a,(OFST-1,sp)
 910  004d a101          	cp	a,#1
 911  004f 260b          	jrne	L333
 912                     ; 245       UART1->CR1 &= (uint8_t)(~itpos);
 914  0051 7b02          	ld	a,(OFST+0,sp)
 915  0053 43            	cpl	a
 916  0054 c45234        	and	a,21044
 917  0057 c75234        	ld	21044,a
 919  005a 201a          	jra	L133
 920  005c               L333:
 921                     ; 247     else if (uartreg == 0x02)
 923  005c 7b01          	ld	a,(OFST-1,sp)
 924  005e a102          	cp	a,#2
 925  0060 260b          	jrne	L733
 926                     ; 249       UART1->CR2 &= (uint8_t)(~itpos);
 928  0062 7b02          	ld	a,(OFST+0,sp)
 929  0064 43            	cpl	a
 930  0065 c45235        	and	a,21045
 931  0068 c75235        	ld	21045,a
 933  006b 2009          	jra	L133
 934  006d               L733:
 935                     ; 253       UART1->CR4 &= (uint8_t)(~itpos);
 937  006d 7b02          	ld	a,(OFST+0,sp)
 938  006f 43            	cpl	a
 939  0070 c45237        	and	a,21047
 940  0073 c75237        	ld	21047,a
 941  0076               L133:
 942                     ; 257 }
 945  0076 5b04          	addw	sp,#4
 946  0078 81            	ret
 982                     ; 265 void UART1_HalfDuplexCmd(FunctionalState NewState)
 982                     ; 266 {
 983                     .text:	section	.text,new
 984  0000               _UART1_HalfDuplexCmd:
 988                     ; 267   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 990                     ; 269   if (NewState != DISABLE)
 992  0000 4d            	tnz	a
 993  0001 2706          	jreq	L163
 994                     ; 271     UART1->CR5 |= UART1_CR5_HDSEL;  /**< UART1 Half Duplex Enable  */
 996  0003 72165238      	bset	21048,#3
 998  0007 2004          	jra	L363
 999  0009               L163:
1000                     ; 275     UART1->CR5 &= (uint8_t)~UART1_CR5_HDSEL; /**< UART1 Half Duplex Disable */
1002  0009 72175238      	bres	21048,#3
1003  000d               L363:
1004                     ; 277 }
1007  000d 81            	ret
1064                     ; 285 void UART1_IrDAConfig(UART1_IrDAMode_TypeDef UART1_IrDAMode)
1064                     ; 286 {
1065                     .text:	section	.text,new
1066  0000               _UART1_IrDAConfig:
1070                     ; 287   assert_param(IS_UART1_IRDAMODE_OK(UART1_IrDAMode));
1072                     ; 289   if (UART1_IrDAMode != UART1_IRDAMODE_NORMAL)
1074  0000 4d            	tnz	a
1075  0001 2706          	jreq	L314
1076                     ; 291     UART1->CR5 |= UART1_CR5_IRLP;
1078  0003 72145238      	bset	21048,#2
1080  0007 2004          	jra	L514
1081  0009               L314:
1082                     ; 295     UART1->CR5 &= ((uint8_t)~UART1_CR5_IRLP);
1084  0009 72155238      	bres	21048,#2
1085  000d               L514:
1086                     ; 297 }
1089  000d 81            	ret
1124                     ; 305 void UART1_IrDACmd(FunctionalState NewState)
1124                     ; 306 {
1125                     .text:	section	.text,new
1126  0000               _UART1_IrDACmd:
1130                     ; 308   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1132                     ; 310   if (NewState != DISABLE)
1134  0000 4d            	tnz	a
1135  0001 2706          	jreq	L534
1136                     ; 313     UART1->CR5 |= UART1_CR5_IREN;
1138  0003 72125238      	bset	21048,#1
1140  0007 2004          	jra	L734
1141  0009               L534:
1142                     ; 318     UART1->CR5 &= ((uint8_t)~UART1_CR5_IREN);
1144  0009 72135238      	bres	21048,#1
1145  000d               L734:
1146                     ; 320 }
1149  000d 81            	ret
1208                     ; 329 void UART1_LINBreakDetectionConfig(UART1_LINBreakDetectionLength_TypeDef UART1_LINBreakDetectionLength)
1208                     ; 330 {
1209                     .text:	section	.text,new
1210  0000               _UART1_LINBreakDetectionConfig:
1214                     ; 331   assert_param(IS_UART1_LINBREAKDETECTIONLENGTH_OK(UART1_LINBreakDetectionLength));
1216                     ; 333   if (UART1_LINBreakDetectionLength != UART1_LINBREAKDETECTIONLENGTH_10BITS)
1218  0000 4d            	tnz	a
1219  0001 2706          	jreq	L764
1220                     ; 335     UART1->CR4 |= UART1_CR4_LBDL;
1222  0003 721a5237      	bset	21047,#5
1224  0007 2004          	jra	L174
1225  0009               L764:
1226                     ; 339     UART1->CR4 &= ((uint8_t)~UART1_CR4_LBDL);
1228  0009 721b5237      	bres	21047,#5
1229  000d               L174:
1230                     ; 341 }
1233  000d 81            	ret
1268                     ; 349 void UART1_LINCmd(FunctionalState NewState)
1268                     ; 350 {
1269                     .text:	section	.text,new
1270  0000               _UART1_LINCmd:
1274                     ; 351   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1276                     ; 353   if (NewState != DISABLE)
1278  0000 4d            	tnz	a
1279  0001 2706          	jreq	L115
1280                     ; 356     UART1->CR3 |= UART1_CR3_LINEN;
1282  0003 721c5236      	bset	21046,#6
1284  0007 2004          	jra	L315
1285  0009               L115:
1286                     ; 361     UART1->CR3 &= ((uint8_t)~UART1_CR3_LINEN);
1288  0009 721d5236      	bres	21046,#6
1289  000d               L315:
1290                     ; 363 }
1293  000d 81            	ret
1328                     ; 371 void UART1_SmartCardCmd(FunctionalState NewState)
1328                     ; 372 {
1329                     .text:	section	.text,new
1330  0000               _UART1_SmartCardCmd:
1334                     ; 373   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1336                     ; 375   if (NewState != DISABLE)
1338  0000 4d            	tnz	a
1339  0001 2706          	jreq	L335
1340                     ; 378     UART1->CR5 |= UART1_CR5_SCEN;
1342  0003 721a5238      	bset	21048,#5
1344  0007 2004          	jra	L535
1345  0009               L335:
1346                     ; 383     UART1->CR5 &= ((uint8_t)(~UART1_CR5_SCEN));
1348  0009 721b5238      	bres	21048,#5
1349  000d               L535:
1350                     ; 385 }
1353  000d 81            	ret
1389                     ; 394 void UART1_SmartCardNACKCmd(FunctionalState NewState)
1389                     ; 395 {
1390                     .text:	section	.text,new
1391  0000               _UART1_SmartCardNACKCmd:
1395                     ; 396   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1397                     ; 398   if (NewState != DISABLE)
1399  0000 4d            	tnz	a
1400  0001 2706          	jreq	L555
1401                     ; 401     UART1->CR5 |= UART1_CR5_NACK;
1403  0003 72185238      	bset	21048,#4
1405  0007 2004          	jra	L755
1406  0009               L555:
1407                     ; 406     UART1->CR5 &= ((uint8_t)~(UART1_CR5_NACK));
1409  0009 72195238      	bres	21048,#4
1410  000d               L755:
1411                     ; 408 }
1414  000d 81            	ret
1471                     ; 416 void UART1_WakeUpConfig(UART1_WakeUp_TypeDef UART1_WakeUp)
1471                     ; 417 {
1472                     .text:	section	.text,new
1473  0000               _UART1_WakeUpConfig:
1477                     ; 418   assert_param(IS_UART1_WAKEUP_OK(UART1_WakeUp));
1479                     ; 420   UART1->CR1 &= ((uint8_t)~UART1_CR1_WAKE);
1481  0000 72175234      	bres	21044,#3
1482                     ; 421   UART1->CR1 |= (uint8_t)UART1_WakeUp;
1484  0004 ca5234        	or	a,21044
1485  0007 c75234        	ld	21044,a
1486                     ; 422 }
1489  000a 81            	ret
1525                     ; 430 void UART1_ReceiverWakeUpCmd(FunctionalState NewState)
1525                     ; 431 {
1526                     .text:	section	.text,new
1527  0000               _UART1_ReceiverWakeUpCmd:
1531                     ; 432   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1533                     ; 434   if (NewState != DISABLE)
1535  0000 4d            	tnz	a
1536  0001 2706          	jreq	L526
1537                     ; 437     UART1->CR2 |= UART1_CR2_RWU;
1539  0003 72125235      	bset	21045,#1
1541  0007 2004          	jra	L726
1542  0009               L526:
1543                     ; 442     UART1->CR2 &= ((uint8_t)~UART1_CR2_RWU);
1545  0009 72135235      	bres	21045,#1
1546  000d               L726:
1547                     ; 444 }
1550  000d 81            	ret
1573                     ; 451 uint8_t UART1_ReceiveData8(void)
1573                     ; 452 {
1574                     .text:	section	.text,new
1575  0000               _UART1_ReceiveData8:
1579                     ; 453   return ((uint8_t)UART1->DR);
1581  0000 c65231        	ld	a,21041
1584  0003 81            	ret
1618                     ; 461 uint16_t UART1_ReceiveData9(void)
1618                     ; 462 {
1619                     .text:	section	.text,new
1620  0000               _UART1_ReceiveData9:
1622  0000 89            	pushw	x
1623       00000002      OFST:	set	2
1626                     ; 463   uint16_t temp = 0;
1628  0001 5f            	clrw	x
1629  0002 1f01          	ldw	(OFST-1,sp),x
1630                     ; 465   temp = (uint16_t)(((uint16_t)( (uint16_t)UART1->CR1 & (uint16_t)UART1_CR1_R8)) << 1);
1632  0004 c65234        	ld	a,21044
1633  0007 5f            	clrw	x
1634  0008 a480          	and	a,#128
1635  000a 5f            	clrw	x
1636  000b 02            	rlwa	x,a
1637  000c 58            	sllw	x
1638  000d 1f01          	ldw	(OFST-1,sp),x
1639                     ; 466   return (uint16_t)( (((uint16_t) UART1->DR) | temp ) & ((uint16_t)0x01FF));
1641  000f c65231        	ld	a,21041
1642  0012 5f            	clrw	x
1643  0013 97            	ld	xl,a
1644  0014 01            	rrwa	x,a
1645  0015 1a02          	or	a,(OFST+0,sp)
1646  0017 01            	rrwa	x,a
1647  0018 1a01          	or	a,(OFST-1,sp)
1648  001a 01            	rrwa	x,a
1649  001b 01            	rrwa	x,a
1650  001c a4ff          	and	a,#255
1651  001e 01            	rrwa	x,a
1652  001f a401          	and	a,#1
1653  0021 01            	rrwa	x,a
1656  0022 5b02          	addw	sp,#2
1657  0024 81            	ret
1691                     ; 474 void UART1_SendData8(uint8_t Data)
1691                     ; 475 {
1692                     .text:	section	.text,new
1693  0000               _UART1_SendData8:
1697                     ; 477   UART1->DR = Data;
1699  0000 c75231        	ld	21041,a
1700                     ; 478 }
1703  0003 81            	ret
1737                     ; 486 void UART1_SendData9(uint16_t Data)
1737                     ; 487 {
1738                     .text:	section	.text,new
1739  0000               _UART1_SendData9:
1741  0000 89            	pushw	x
1742       00000000      OFST:	set	0
1745                     ; 489   UART1->CR1 &= ((uint8_t)~UART1_CR1_T8);
1747  0001 721d5234      	bres	21044,#6
1748                     ; 491   UART1->CR1 |= (uint8_t)(((uint8_t)(Data >> 2)) & UART1_CR1_T8);
1750  0005 54            	srlw	x
1751  0006 54            	srlw	x
1752  0007 9f            	ld	a,xl
1753  0008 a440          	and	a,#64
1754  000a ca5234        	or	a,21044
1755  000d c75234        	ld	21044,a
1756                     ; 493   UART1->DR   = (uint8_t)(Data);
1758  0010 7b02          	ld	a,(OFST+2,sp)
1759  0012 c75231        	ld	21041,a
1760                     ; 494 }
1763  0015 85            	popw	x
1764  0016 81            	ret
1787                     ; 501 void UART1_SendBreak(void)
1787                     ; 502 {
1788                     .text:	section	.text,new
1789  0000               _UART1_SendBreak:
1793                     ; 503   UART1->CR2 |= UART1_CR2_SBK;
1795  0000 72105235      	bset	21045,#0
1796                     ; 504 }
1799  0004 81            	ret
1833                     ; 511 void UART1_SetAddress(uint8_t UART1_Address)
1833                     ; 512 {
1834                     .text:	section	.text,new
1835  0000               _UART1_SetAddress:
1837  0000 88            	push	a
1838       00000000      OFST:	set	0
1841                     ; 514   assert_param(IS_UART1_ADDRESS_OK(UART1_Address));
1843                     ; 517   UART1->CR4 &= ((uint8_t)~UART1_CR4_ADD);
1845  0001 c65237        	ld	a,21047
1846  0004 a4f0          	and	a,#240
1847  0006 c75237        	ld	21047,a
1848                     ; 519   UART1->CR4 |= UART1_Address;
1850  0009 c65237        	ld	a,21047
1851  000c 1a01          	or	a,(OFST+1,sp)
1852  000e c75237        	ld	21047,a
1853                     ; 520 }
1856  0011 84            	pop	a
1857  0012 81            	ret
1891                     ; 528 void UART1_SetGuardTime(uint8_t UART1_GuardTime)
1891                     ; 529 {
1892                     .text:	section	.text,new
1893  0000               _UART1_SetGuardTime:
1897                     ; 531   UART1->GTR = UART1_GuardTime;
1899  0000 c75239        	ld	21049,a
1900                     ; 532 }
1903  0003 81            	ret
1937                     ; 556 void UART1_SetPrescaler(uint8_t UART1_Prescaler)
1937                     ; 557 {
1938                     .text:	section	.text,new
1939  0000               _UART1_SetPrescaler:
1943                     ; 559   UART1->PSCR = UART1_Prescaler;
1945  0000 c7523a        	ld	21050,a
1946                     ; 560 }
1949  0003 81            	ret
2092                     ; 568 FlagStatus UART1_GetFlagStatus(UART1_Flag_TypeDef UART1_FLAG)
2092                     ; 569 {
2093                     .text:	section	.text,new
2094  0000               _UART1_GetFlagStatus:
2096  0000 89            	pushw	x
2097  0001 88            	push	a
2098       00000001      OFST:	set	1
2101                     ; 570   FlagStatus status = RESET;
2103  0002 0f01          	clr	(OFST+0,sp)
2104                     ; 573   assert_param(IS_UART1_FLAG_OK(UART1_FLAG));
2106                     ; 577   if (UART1_FLAG == UART1_FLAG_LBDF)
2108  0004 a30210        	cpw	x,#528
2109  0007 2610          	jrne	L7501
2110                     ; 579     if ((UART1->CR4 & (uint8_t)UART1_FLAG) != (uint8_t)0x00)
2112  0009 9f            	ld	a,xl
2113  000a c45237        	and	a,21047
2114  000d 2706          	jreq	L1601
2115                     ; 582       status = SET;
2117  000f a601          	ld	a,#1
2118  0011 6b01          	ld	(OFST+0,sp),a
2120  0013 202b          	jra	L5601
2121  0015               L1601:
2122                     ; 587       status = RESET;
2124  0015 0f01          	clr	(OFST+0,sp)
2125  0017 2027          	jra	L5601
2126  0019               L7501:
2127                     ; 590   else if (UART1_FLAG == UART1_FLAG_SBK)
2129  0019 1e02          	ldw	x,(OFST+1,sp)
2130  001b a30101        	cpw	x,#257
2131  001e 2611          	jrne	L7601
2132                     ; 592     if ((UART1->CR2 & (uint8_t)UART1_FLAG) != (uint8_t)0x00)
2134  0020 c65235        	ld	a,21045
2135  0023 1503          	bcp	a,(OFST+2,sp)
2136  0025 2706          	jreq	L1701
2137                     ; 595       status = SET;
2139  0027 a601          	ld	a,#1
2140  0029 6b01          	ld	(OFST+0,sp),a
2142  002b 2013          	jra	L5601
2143  002d               L1701:
2144                     ; 600       status = RESET;
2146  002d 0f01          	clr	(OFST+0,sp)
2147  002f 200f          	jra	L5601
2148  0031               L7601:
2149                     ; 605     if ((UART1->SR & (uint8_t)UART1_FLAG) != (uint8_t)0x00)
2151  0031 c65230        	ld	a,21040
2152  0034 1503          	bcp	a,(OFST+2,sp)
2153  0036 2706          	jreq	L7701
2154                     ; 608       status = SET;
2156  0038 a601          	ld	a,#1
2157  003a 6b01          	ld	(OFST+0,sp),a
2159  003c 2002          	jra	L5601
2160  003e               L7701:
2161                     ; 613       status = RESET;
2163  003e 0f01          	clr	(OFST+0,sp)
2164  0040               L5601:
2165                     ; 617   return status;
2167  0040 7b01          	ld	a,(OFST+0,sp)
2170  0042 5b03          	addw	sp,#3
2171  0044 81            	ret
2206                     ; 646 void UART1_ClearFlag(UART1_Flag_TypeDef UART1_FLAG)
2206                     ; 647 {
2207                     .text:	section	.text,new
2208  0000               _UART1_ClearFlag:
2212                     ; 648   assert_param(IS_UART1_CLEAR_FLAG_OK(UART1_FLAG));
2214                     ; 651   if (UART1_FLAG == UART1_FLAG_RXNE)
2216  0000 a30020        	cpw	x,#32
2217  0003 2606          	jrne	L1211
2218                     ; 653     UART1->SR = (uint8_t)~(UART1_SR_RXNE);
2220  0005 35df5230      	mov	21040,#223
2222  0009 2004          	jra	L3211
2223  000b               L1211:
2224                     ; 658     UART1->CR4 &= (uint8_t)~(UART1_CR4_LBDF);
2226  000b 72195237      	bres	21047,#4
2227  000f               L3211:
2228                     ; 660 }
2231  000f 81            	ret
2313                     ; 675 ITStatus UART1_GetITStatus(UART1_IT_TypeDef UART1_IT)
2313                     ; 676 {
2314                     .text:	section	.text,new
2315  0000               _UART1_GetITStatus:
2317  0000 89            	pushw	x
2318  0001 89            	pushw	x
2319       00000002      OFST:	set	2
2322                     ; 677   ITStatus pendingbitstatus = RESET;
2324  0002 7b02          	ld	a,(OFST+0,sp)
2325  0004 97            	ld	xl,a
2326                     ; 678   uint8_t itpos = 0;
2328  0005 7b01          	ld	a,(OFST-1,sp)
2329  0007 97            	ld	xl,a
2330                     ; 679   uint8_t itmask1 = 0;
2332  0008 7b02          	ld	a,(OFST+0,sp)
2333  000a 97            	ld	xl,a
2334                     ; 680   uint8_t itmask2 = 0;
2336  000b 7b02          	ld	a,(OFST+0,sp)
2337  000d 97            	ld	xl,a
2338                     ; 681   uint8_t enablestatus = 0;
2340  000e 7b02          	ld	a,(OFST+0,sp)
2341  0010 97            	ld	xl,a
2342                     ; 684   assert_param(IS_UART1_GET_IT_OK(UART1_IT));
2344                     ; 687   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)UART1_IT & (uint8_t)0x0F));
2346  0011 7b04          	ld	a,(OFST+2,sp)
2347  0013 a40f          	and	a,#15
2348  0015 5f            	clrw	x
2349  0016 97            	ld	xl,a
2350  0017 a601          	ld	a,#1
2351  0019 5d            	tnzw	x
2352  001a 2704          	jreq	L27
2353  001c               L47:
2354  001c 48            	sll	a
2355  001d 5a            	decw	x
2356  001e 26fc          	jrne	L47
2357  0020               L27:
2358  0020 6b01          	ld	(OFST-1,sp),a
2359                     ; 689   itmask1 = (uint8_t)((uint8_t)UART1_IT >> (uint8_t)4);
2361  0022 7b04          	ld	a,(OFST+2,sp)
2362  0024 4e            	swap	a
2363  0025 a40f          	and	a,#15
2364  0027 6b02          	ld	(OFST+0,sp),a
2365                     ; 691   itmask2 = (uint8_t)((uint8_t)1 << itmask1);
2367  0029 7b02          	ld	a,(OFST+0,sp)
2368  002b 5f            	clrw	x
2369  002c 97            	ld	xl,a
2370  002d a601          	ld	a,#1
2371  002f 5d            	tnzw	x
2372  0030 2704          	jreq	L67
2373  0032               L001:
2374  0032 48            	sll	a
2375  0033 5a            	decw	x
2376  0034 26fc          	jrne	L001
2377  0036               L67:
2378  0036 6b02          	ld	(OFST+0,sp),a
2379                     ; 695   if (UART1_IT == UART1_IT_PE)
2381  0038 1e03          	ldw	x,(OFST+1,sp)
2382  003a a30100        	cpw	x,#256
2383  003d 261c          	jrne	L7611
2384                     ; 698     enablestatus = (uint8_t)((uint8_t)UART1->CR1 & itmask2);
2386  003f c65234        	ld	a,21044
2387  0042 1402          	and	a,(OFST+0,sp)
2388  0044 6b02          	ld	(OFST+0,sp),a
2389                     ; 701     if (((UART1->SR & itpos) != (uint8_t)0x00) && enablestatus)
2391  0046 c65230        	ld	a,21040
2392  0049 1501          	bcp	a,(OFST-1,sp)
2393  004b 270a          	jreq	L1711
2395  004d 0d02          	tnz	(OFST+0,sp)
2396  004f 2706          	jreq	L1711
2397                     ; 704       pendingbitstatus = SET;
2399  0051 a601          	ld	a,#1
2400  0053 6b02          	ld	(OFST+0,sp),a
2402  0055 2041          	jra	L5711
2403  0057               L1711:
2404                     ; 709       pendingbitstatus = RESET;
2406  0057 0f02          	clr	(OFST+0,sp)
2407  0059 203d          	jra	L5711
2408  005b               L7611:
2409                     ; 713   else if (UART1_IT == UART1_IT_LBDF)
2411  005b 1e03          	ldw	x,(OFST+1,sp)
2412  005d a30346        	cpw	x,#838
2413  0060 261c          	jrne	L7711
2414                     ; 716     enablestatus = (uint8_t)((uint8_t)UART1->CR4 & itmask2);
2416  0062 c65237        	ld	a,21047
2417  0065 1402          	and	a,(OFST+0,sp)
2418  0067 6b02          	ld	(OFST+0,sp),a
2419                     ; 718     if (((UART1->CR4 & itpos) != (uint8_t)0x00) && enablestatus)
2421  0069 c65237        	ld	a,21047
2422  006c 1501          	bcp	a,(OFST-1,sp)
2423  006e 270a          	jreq	L1021
2425  0070 0d02          	tnz	(OFST+0,sp)
2426  0072 2706          	jreq	L1021
2427                     ; 721       pendingbitstatus = SET;
2429  0074 a601          	ld	a,#1
2430  0076 6b02          	ld	(OFST+0,sp),a
2432  0078 201e          	jra	L5711
2433  007a               L1021:
2434                     ; 726       pendingbitstatus = RESET;
2436  007a 0f02          	clr	(OFST+0,sp)
2437  007c 201a          	jra	L5711
2438  007e               L7711:
2439                     ; 732     enablestatus = (uint8_t)((uint8_t)UART1->CR2 & itmask2);
2441  007e c65235        	ld	a,21045
2442  0081 1402          	and	a,(OFST+0,sp)
2443  0083 6b02          	ld	(OFST+0,sp),a
2444                     ; 734     if (((UART1->SR & itpos) != (uint8_t)0x00) && enablestatus)
2446  0085 c65230        	ld	a,21040
2447  0088 1501          	bcp	a,(OFST-1,sp)
2448  008a 270a          	jreq	L7021
2450  008c 0d02          	tnz	(OFST+0,sp)
2451  008e 2706          	jreq	L7021
2452                     ; 737       pendingbitstatus = SET;
2454  0090 a601          	ld	a,#1
2455  0092 6b02          	ld	(OFST+0,sp),a
2457  0094 2002          	jra	L5711
2458  0096               L7021:
2459                     ; 742       pendingbitstatus = RESET;
2461  0096 0f02          	clr	(OFST+0,sp)
2462  0098               L5711:
2463                     ; 747   return  pendingbitstatus;
2465  0098 7b02          	ld	a,(OFST+0,sp)
2468  009a 5b04          	addw	sp,#4
2469  009c 81            	ret
2505                     ; 775 void UART1_ClearITPendingBit(UART1_IT_TypeDef UART1_IT)
2505                     ; 776 {
2506                     .text:	section	.text,new
2507  0000               _UART1_ClearITPendingBit:
2511                     ; 777   assert_param(IS_UART1_CLEAR_IT_OK(UART1_IT));
2513                     ; 780   if (UART1_IT == UART1_IT_RXNE)
2515  0000 a30255        	cpw	x,#597
2516  0003 2606          	jrne	L1321
2517                     ; 782     UART1->SR = (uint8_t)~(UART1_SR_RXNE);
2519  0005 35df5230      	mov	21040,#223
2521  0009 2004          	jra	L3321
2522  000b               L1321:
2523                     ; 787     UART1->CR4 &= (uint8_t)~(UART1_CR4_LBDF);
2525  000b 72195237      	bres	21047,#4
2526  000f               L3321:
2527                     ; 789 }
2530  000f 81            	ret
2543                     	xdef	_UART1_ClearITPendingBit
2544                     	xdef	_UART1_GetITStatus
2545                     	xdef	_UART1_ClearFlag
2546                     	xdef	_UART1_GetFlagStatus
2547                     	xdef	_UART1_SetPrescaler
2548                     	xdef	_UART1_SetGuardTime
2549                     	xdef	_UART1_SetAddress
2550                     	xdef	_UART1_SendBreak
2551                     	xdef	_UART1_SendData9
2552                     	xdef	_UART1_SendData8
2553                     	xdef	_UART1_ReceiveData9
2554                     	xdef	_UART1_ReceiveData8
2555                     	xdef	_UART1_ReceiverWakeUpCmd
2556                     	xdef	_UART1_WakeUpConfig
2557                     	xdef	_UART1_SmartCardNACKCmd
2558                     	xdef	_UART1_SmartCardCmd
2559                     	xdef	_UART1_LINCmd
2560                     	xdef	_UART1_LINBreakDetectionConfig
2561                     	xdef	_UART1_IrDACmd
2562                     	xdef	_UART1_IrDAConfig
2563                     	xdef	_UART1_HalfDuplexCmd
2564                     	xdef	_UART1_ITConfig
2565                     	xdef	_UART1_Cmd
2566                     	xdef	_UART1_Init
2567                     	xdef	_UART1_DeInit
2568                     	xref	_CLK_GetClockFreq
2569                     	xref.b	c_lreg
2588                     	xref	c_lursh
2589                     	xref	c_lsub
2590                     	xref	c_smul
2591                     	xref	c_ludv
2592                     	xref	c_rtol
2593                     	xref	c_llsh
2594                     	xref	c_ltor
2595                     	end
