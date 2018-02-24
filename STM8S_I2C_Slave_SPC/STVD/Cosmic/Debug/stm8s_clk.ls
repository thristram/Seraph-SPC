   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
   4                     .const:	section	.text
   5  0000               _HSIDivFactor:
   6  0000 01            	dc.b	1
   7  0001 02            	dc.b	2
   8  0002 04            	dc.b	4
   9  0003 08            	dc.b	8
  10  0004               _CLKPrescTable:
  11  0004 01            	dc.b	1
  12  0005 02            	dc.b	2
  13  0006 04            	dc.b	4
  14  0007 08            	dc.b	8
  15  0008 0a            	dc.b	10
  16  0009 10            	dc.b	16
  17  000a 14            	dc.b	20
  18  000b 28            	dc.b	40
  47                     ; 72 void CLK_DeInit(void)
  47                     ; 73 {
  49                     .text:	section	.text,new
  50  0000               _CLK_DeInit:
  54                     ; 74   CLK->ICKR = CLK_ICKR_RESET_VALUE;
  56  0000 350150c0      	mov	20672,#1
  57                     ; 75   CLK->ECKR = CLK_ECKR_RESET_VALUE;
  59  0004 725f50c1      	clr	20673
  60                     ; 76   CLK->SWR  = CLK_SWR_RESET_VALUE;
  62  0008 35e150c4      	mov	20676,#225
  63                     ; 77   CLK->SWCR = CLK_SWCR_RESET_VALUE;
  65  000c 725f50c5      	clr	20677
  66                     ; 78   CLK->CKDIVR = CLK_CKDIVR_RESET_VALUE;
  68  0010 351850c6      	mov	20678,#24
  69                     ; 79   CLK->PCKENR1 = CLK_PCKENR1_RESET_VALUE;
  71  0014 35ff50c7      	mov	20679,#255
  72                     ; 80   CLK->PCKENR2 = CLK_PCKENR2_RESET_VALUE;
  74  0018 35ff50ca      	mov	20682,#255
  75                     ; 81   CLK->CSSR = CLK_CSSR_RESET_VALUE;
  77  001c 725f50c8      	clr	20680
  78                     ; 82   CLK->CCOR = CLK_CCOR_RESET_VALUE;
  80  0020 725f50c9      	clr	20681
  82  0024               L52:
  83                     ; 83   while ((CLK->CCOR & CLK_CCOR_CCOEN)!= 0)
  85  0024 c650c9        	ld	a,20681
  86  0027 a501          	bcp	a,#1
  87  0029 26f9          	jrne	L52
  88                     ; 85   CLK->CCOR = CLK_CCOR_RESET_VALUE;
  90  002b 725f50c9      	clr	20681
  91                     ; 86   CLK->HSITRIMR = CLK_HSITRIMR_RESET_VALUE;
  93  002f 725f50cc      	clr	20684
  94                     ; 87   CLK->SWIMCCR = CLK_SWIMCCR_RESET_VALUE;
  96  0033 725f50cd      	clr	20685
  97                     ; 88 }
 100  0037 81            	ret
 156                     ; 99 void CLK_FastHaltWakeUpCmd(FunctionalState NewState)
 156                     ; 100 {
 157                     .text:	section	.text,new
 158  0000               _CLK_FastHaltWakeUpCmd:
 162                     ; 102   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 164                     ; 104   if (NewState != DISABLE)
 166  0000 4d            	tnz	a
 167  0001 2706          	jreq	L75
 168                     ; 107     CLK->ICKR |= CLK_ICKR_FHWU;
 170  0003 721450c0      	bset	20672,#2
 172  0007 2004          	jra	L16
 173  0009               L75:
 174                     ; 112     CLK->ICKR &= (uint8_t)(~CLK_ICKR_FHWU);
 176  0009 721550c0      	bres	20672,#2
 177  000d               L16:
 178                     ; 114 }
 181  000d 81            	ret
 216                     ; 121 void CLK_HSECmd(FunctionalState NewState)
 216                     ; 122 {
 217                     .text:	section	.text,new
 218  0000               _CLK_HSECmd:
 222                     ; 124   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 224                     ; 126   if (NewState != DISABLE)
 226  0000 4d            	tnz	a
 227  0001 2706          	jreq	L101
 228                     ; 129     CLK->ECKR |= CLK_ECKR_HSEEN;
 230  0003 721050c1      	bset	20673,#0
 232  0007 2004          	jra	L301
 233  0009               L101:
 234                     ; 134     CLK->ECKR &= (uint8_t)(~CLK_ECKR_HSEEN);
 236  0009 721150c1      	bres	20673,#0
 237  000d               L301:
 238                     ; 136 }
 241  000d 81            	ret
 276                     ; 143 void CLK_HSICmd(FunctionalState NewState)
 276                     ; 144 {
 277                     .text:	section	.text,new
 278  0000               _CLK_HSICmd:
 282                     ; 146   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 284                     ; 148   if (NewState != DISABLE)
 286  0000 4d            	tnz	a
 287  0001 2706          	jreq	L321
 288                     ; 151     CLK->ICKR |= CLK_ICKR_HSIEN;
 290  0003 721050c0      	bset	20672,#0
 292  0007 2004          	jra	L521
 293  0009               L321:
 294                     ; 156     CLK->ICKR &= (uint8_t)(~CLK_ICKR_HSIEN);
 296  0009 721150c0      	bres	20672,#0
 297  000d               L521:
 298                     ; 158 }
 301  000d 81            	ret
 336                     ; 166 void CLK_LSICmd(FunctionalState NewState)
 336                     ; 167 {
 337                     .text:	section	.text,new
 338  0000               _CLK_LSICmd:
 342                     ; 169   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 344                     ; 171   if (NewState != DISABLE)
 346  0000 4d            	tnz	a
 347  0001 2706          	jreq	L541
 348                     ; 174     CLK->ICKR |= CLK_ICKR_LSIEN;
 350  0003 721650c0      	bset	20672,#3
 352  0007 2004          	jra	L741
 353  0009               L541:
 354                     ; 179     CLK->ICKR &= (uint8_t)(~CLK_ICKR_LSIEN);
 356  0009 721750c0      	bres	20672,#3
 357  000d               L741:
 358                     ; 181 }
 361  000d 81            	ret
 396                     ; 189 void CLK_CCOCmd(FunctionalState NewState)
 396                     ; 190 {
 397                     .text:	section	.text,new
 398  0000               _CLK_CCOCmd:
 402                     ; 192   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 404                     ; 194   if (NewState != DISABLE)
 406  0000 4d            	tnz	a
 407  0001 2706          	jreq	L761
 408                     ; 197     CLK->CCOR |= CLK_CCOR_CCOEN;
 410  0003 721050c9      	bset	20681,#0
 412  0007 2004          	jra	L171
 413  0009               L761:
 414                     ; 202     CLK->CCOR &= (uint8_t)(~CLK_CCOR_CCOEN);
 416  0009 721150c9      	bres	20681,#0
 417  000d               L171:
 418                     ; 204 }
 421  000d 81            	ret
 456                     ; 213 void CLK_ClockSwitchCmd(FunctionalState NewState)
 456                     ; 214 {
 457                     .text:	section	.text,new
 458  0000               _CLK_ClockSwitchCmd:
 462                     ; 216   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 464                     ; 218   if (NewState != DISABLE )
 466  0000 4d            	tnz	a
 467  0001 2706          	jreq	L112
 468                     ; 221     CLK->SWCR |= CLK_SWCR_SWEN;
 470  0003 721250c5      	bset	20677,#1
 472  0007 2004          	jra	L312
 473  0009               L112:
 474                     ; 226     CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWEN);
 476  0009 721350c5      	bres	20677,#1
 477  000d               L312:
 478                     ; 228 }
 481  000d 81            	ret
 517                     ; 238 void CLK_SlowActiveHaltWakeUpCmd(FunctionalState NewState)
 517                     ; 239 {
 518                     .text:	section	.text,new
 519  0000               _CLK_SlowActiveHaltWakeUpCmd:
 523                     ; 241   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 525                     ; 243   if (NewState != DISABLE)
 527  0000 4d            	tnz	a
 528  0001 2706          	jreq	L332
 529                     ; 246     CLK->ICKR |= CLK_ICKR_SWUAH;
 531  0003 721a50c0      	bset	20672,#5
 533  0007 2004          	jra	L532
 534  0009               L332:
 535                     ; 251     CLK->ICKR &= (uint8_t)(~CLK_ICKR_SWUAH);
 537  0009 721b50c0      	bres	20672,#5
 538  000d               L532:
 539                     ; 253 }
 542  000d 81            	ret
 701                     ; 263 void CLK_PeripheralClockConfig(CLK_Peripheral_TypeDef CLK_Peripheral, FunctionalState NewState)
 701                     ; 264 {
 702                     .text:	section	.text,new
 703  0000               _CLK_PeripheralClockConfig:
 705  0000 89            	pushw	x
 706       00000000      OFST:	set	0
 709                     ; 266   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 711                     ; 267   assert_param(IS_CLK_PERIPHERAL_OK(CLK_Peripheral));
 713                     ; 269   if (((uint8_t)CLK_Peripheral & (uint8_t)0x10) == 0x00)
 715  0001 9e            	ld	a,xh
 716  0002 a510          	bcp	a,#16
 717  0004 2633          	jrne	L123
 718                     ; 271     if (NewState != DISABLE)
 720  0006 0d02          	tnz	(OFST+2,sp)
 721  0008 2717          	jreq	L323
 722                     ; 274       CLK->PCKENR1 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
 724  000a 7b01          	ld	a,(OFST+1,sp)
 725  000c a40f          	and	a,#15
 726  000e 5f            	clrw	x
 727  000f 97            	ld	xl,a
 728  0010 a601          	ld	a,#1
 729  0012 5d            	tnzw	x
 730  0013 2704          	jreq	L62
 731  0015               L03:
 732  0015 48            	sll	a
 733  0016 5a            	decw	x
 734  0017 26fc          	jrne	L03
 735  0019               L62:
 736  0019 ca50c7        	or	a,20679
 737  001c c750c7        	ld	20679,a
 739  001f 2049          	jra	L723
 740  0021               L323:
 741                     ; 279       CLK->PCKENR1 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
 743  0021 7b01          	ld	a,(OFST+1,sp)
 744  0023 a40f          	and	a,#15
 745  0025 5f            	clrw	x
 746  0026 97            	ld	xl,a
 747  0027 a601          	ld	a,#1
 748  0029 5d            	tnzw	x
 749  002a 2704          	jreq	L23
 750  002c               L43:
 751  002c 48            	sll	a
 752  002d 5a            	decw	x
 753  002e 26fc          	jrne	L43
 754  0030               L23:
 755  0030 43            	cpl	a
 756  0031 c450c7        	and	a,20679
 757  0034 c750c7        	ld	20679,a
 758  0037 2031          	jra	L723
 759  0039               L123:
 760                     ; 284     if (NewState != DISABLE)
 762  0039 0d02          	tnz	(OFST+2,sp)
 763  003b 2717          	jreq	L133
 764                     ; 287       CLK->PCKENR2 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
 766  003d 7b01          	ld	a,(OFST+1,sp)
 767  003f a40f          	and	a,#15
 768  0041 5f            	clrw	x
 769  0042 97            	ld	xl,a
 770  0043 a601          	ld	a,#1
 771  0045 5d            	tnzw	x
 772  0046 2704          	jreq	L63
 773  0048               L04:
 774  0048 48            	sll	a
 775  0049 5a            	decw	x
 776  004a 26fc          	jrne	L04
 777  004c               L63:
 778  004c ca50ca        	or	a,20682
 779  004f c750ca        	ld	20682,a
 781  0052 2016          	jra	L723
 782  0054               L133:
 783                     ; 292       CLK->PCKENR2 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
 785  0054 7b01          	ld	a,(OFST+1,sp)
 786  0056 a40f          	and	a,#15
 787  0058 5f            	clrw	x
 788  0059 97            	ld	xl,a
 789  005a a601          	ld	a,#1
 790  005c 5d            	tnzw	x
 791  005d 2704          	jreq	L24
 792  005f               L44:
 793  005f 48            	sll	a
 794  0060 5a            	decw	x
 795  0061 26fc          	jrne	L44
 796  0063               L24:
 797  0063 43            	cpl	a
 798  0064 c450ca        	and	a,20682
 799  0067 c750ca        	ld	20682,a
 800  006a               L723:
 801                     ; 295 }
 804  006a 85            	popw	x
 805  006b 81            	ret
 993                     ; 309 ErrorStatus CLK_ClockSwitchConfig(CLK_SwitchMode_TypeDef CLK_SwitchMode, CLK_Source_TypeDef CLK_NewClock, FunctionalState ITState, CLK_CurrentClockState_TypeDef CLK_CurrentClockState)
 993                     ; 310 {
 994                     .text:	section	.text,new
 995  0000               _CLK_ClockSwitchConfig:
 997  0000 89            	pushw	x
 998  0001 5204          	subw	sp,#4
 999       00000004      OFST:	set	4
1002                     ; 312   uint16_t DownCounter = CLK_TIMEOUT;
1004  0003 aeffff        	ldw	x,#65535
1005  0006 1f03          	ldw	(OFST-1,sp),x
1006                     ; 313   ErrorStatus Swif = ERROR;
1008  0008 7b02          	ld	a,(OFST-2,sp)
1009  000a 97            	ld	xl,a
1010                     ; 316   assert_param(IS_CLK_SOURCE_OK(CLK_NewClock));
1012                     ; 317   assert_param(IS_CLK_SWITCHMODE_OK(CLK_SwitchMode));
1014                     ; 318   assert_param(IS_FUNCTIONALSTATE_OK(ITState));
1016                     ; 319   assert_param(IS_CLK_CURRENTCLOCKSTATE_OK(CLK_CurrentClockState));
1018                     ; 322   clock_master = (CLK_Source_TypeDef)CLK->CMSR;
1020  000b c650c3        	ld	a,20675
1021  000e 6b01          	ld	(OFST-3,sp),a
1022                     ; 325   if (CLK_SwitchMode == CLK_SWITCHMODE_AUTO)
1024  0010 7b05          	ld	a,(OFST+1,sp)
1025  0012 a101          	cp	a,#1
1026  0014 264b          	jrne	L544
1027                     ; 328     CLK->SWCR |= CLK_SWCR_SWEN;
1029  0016 721250c5      	bset	20677,#1
1030                     ; 331     if (ITState != DISABLE)
1032  001a 0d09          	tnz	(OFST+5,sp)
1033  001c 2706          	jreq	L744
1034                     ; 333       CLK->SWCR |= CLK_SWCR_SWIEN;
1036  001e 721450c5      	bset	20677,#2
1038  0022 2004          	jra	L154
1039  0024               L744:
1040                     ; 337       CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIEN);
1042  0024 721550c5      	bres	20677,#2
1043  0028               L154:
1044                     ; 341     CLK->SWR = (uint8_t)CLK_NewClock;
1046  0028 7b06          	ld	a,(OFST+2,sp)
1047  002a c750c4        	ld	20676,a
1049  002d 2007          	jra	L754
1050  002f               L354:
1051                     ; 346       DownCounter--;
1053  002f 1e03          	ldw	x,(OFST-1,sp)
1054  0031 1d0001        	subw	x,#1
1055  0034 1f03          	ldw	(OFST-1,sp),x
1056  0036               L754:
1057                     ; 344     while((((CLK->SWCR & CLK_SWCR_SWBSY) != 0 )&& (DownCounter != 0)))
1059  0036 c650c5        	ld	a,20677
1060  0039 a501          	bcp	a,#1
1061  003b 2704          	jreq	L364
1063  003d 1e03          	ldw	x,(OFST-1,sp)
1064  003f 26ee          	jrne	L354
1065  0041               L364:
1066                     ; 349     if(DownCounter != 0)
1068  0041 1e03          	ldw	x,(OFST-1,sp)
1069  0043 2706          	jreq	L564
1070                     ; 351       Swif = SUCCESS;
1072  0045 a601          	ld	a,#1
1073  0047 6b02          	ld	(OFST-2,sp),a
1075  0049 2002          	jra	L174
1076  004b               L564:
1077                     ; 355       Swif = ERROR;
1079  004b 0f02          	clr	(OFST-2,sp)
1080  004d               L174:
1081                     ; 390   if(Swif != ERROR)
1083  004d 0d02          	tnz	(OFST-2,sp)
1084  004f 2767          	jreq	L515
1085                     ; 393     if((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_HSI))
1087  0051 0d0a          	tnz	(OFST+6,sp)
1088  0053 2645          	jrne	L715
1090  0055 7b01          	ld	a,(OFST-3,sp)
1091  0057 a1e1          	cp	a,#225
1092  0059 263f          	jrne	L715
1093                     ; 395       CLK->ICKR &= (uint8_t)(~CLK_ICKR_HSIEN);
1095  005b 721150c0      	bres	20672,#0
1097  005f 2057          	jra	L515
1098  0061               L544:
1099                     ; 361     if (ITState != DISABLE)
1101  0061 0d09          	tnz	(OFST+5,sp)
1102  0063 2706          	jreq	L374
1103                     ; 363       CLK->SWCR |= CLK_SWCR_SWIEN;
1105  0065 721450c5      	bset	20677,#2
1107  0069 2004          	jra	L574
1108  006b               L374:
1109                     ; 367       CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIEN);
1111  006b 721550c5      	bres	20677,#2
1112  006f               L574:
1113                     ; 371     CLK->SWR = (uint8_t)CLK_NewClock;
1115  006f 7b06          	ld	a,(OFST+2,sp)
1116  0071 c750c4        	ld	20676,a
1118  0074 2007          	jra	L305
1119  0076               L774:
1120                     ; 376       DownCounter--;
1122  0076 1e03          	ldw	x,(OFST-1,sp)
1123  0078 1d0001        	subw	x,#1
1124  007b 1f03          	ldw	(OFST-1,sp),x
1125  007d               L305:
1126                     ; 374     while((((CLK->SWCR & CLK_SWCR_SWIF) != 0 ) && (DownCounter != 0)))
1128  007d c650c5        	ld	a,20677
1129  0080 a508          	bcp	a,#8
1130  0082 2704          	jreq	L705
1132  0084 1e03          	ldw	x,(OFST-1,sp)
1133  0086 26ee          	jrne	L774
1134  0088               L705:
1135                     ; 379     if(DownCounter != 0)
1137  0088 1e03          	ldw	x,(OFST-1,sp)
1138  008a 270a          	jreq	L115
1139                     ; 382       CLK->SWCR |= CLK_SWCR_SWEN;
1141  008c 721250c5      	bset	20677,#1
1142                     ; 383       Swif = SUCCESS;
1144  0090 a601          	ld	a,#1
1145  0092 6b02          	ld	(OFST-2,sp),a
1147  0094 20b7          	jra	L174
1148  0096               L115:
1149                     ; 387       Swif = ERROR;
1151  0096 0f02          	clr	(OFST-2,sp)
1152  0098 20b3          	jra	L174
1153  009a               L715:
1154                     ; 397     else if((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_LSI))
1156  009a 0d0a          	tnz	(OFST+6,sp)
1157  009c 260c          	jrne	L325
1159  009e 7b01          	ld	a,(OFST-3,sp)
1160  00a0 a1d2          	cp	a,#210
1161  00a2 2606          	jrne	L325
1162                     ; 399       CLK->ICKR &= (uint8_t)(~CLK_ICKR_LSIEN);
1164  00a4 721750c0      	bres	20672,#3
1166  00a8 200e          	jra	L515
1167  00aa               L325:
1168                     ; 401     else if ((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_HSE))
1170  00aa 0d0a          	tnz	(OFST+6,sp)
1171  00ac 260a          	jrne	L515
1173  00ae 7b01          	ld	a,(OFST-3,sp)
1174  00b0 a1b4          	cp	a,#180
1175  00b2 2604          	jrne	L515
1176                     ; 403       CLK->ECKR &= (uint8_t)(~CLK_ECKR_HSEEN);
1178  00b4 721150c1      	bres	20673,#0
1179  00b8               L515:
1180                     ; 406   return(Swif);
1182  00b8 7b02          	ld	a,(OFST-2,sp)
1185  00ba 5b06          	addw	sp,#6
1186  00bc 81            	ret
1324                     ; 415 void CLK_HSIPrescalerConfig(CLK_Prescaler_TypeDef HSIPrescaler)
1324                     ; 416 {
1325                     .text:	section	.text,new
1326  0000               _CLK_HSIPrescalerConfig:
1328  0000 88            	push	a
1329       00000000      OFST:	set	0
1332                     ; 418   assert_param(IS_CLK_HSIPRESCALER_OK(HSIPrescaler));
1334                     ; 421   CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
1336  0001 c650c6        	ld	a,20678
1337  0004 a4e7          	and	a,#231
1338  0006 c750c6        	ld	20678,a
1339                     ; 424   CLK->CKDIVR |= (uint8_t)HSIPrescaler;
1341  0009 c650c6        	ld	a,20678
1342  000c 1a01          	or	a,(OFST+1,sp)
1343  000e c750c6        	ld	20678,a
1344                     ; 425 }
1347  0011 84            	pop	a
1348  0012 81            	ret
1483                     ; 436 void CLK_CCOConfig(CLK_Output_TypeDef CLK_CCO)
1483                     ; 437 {
1484                     .text:	section	.text,new
1485  0000               _CLK_CCOConfig:
1487  0000 88            	push	a
1488       00000000      OFST:	set	0
1491                     ; 439   assert_param(IS_CLK_OUTPUT_OK(CLK_CCO));
1493                     ; 442   CLK->CCOR &= (uint8_t)(~CLK_CCOR_CCOSEL);
1495  0001 c650c9        	ld	a,20681
1496  0004 a4e1          	and	a,#225
1497  0006 c750c9        	ld	20681,a
1498                     ; 445   CLK->CCOR |= (uint8_t)CLK_CCO;
1500  0009 c650c9        	ld	a,20681
1501  000c 1a01          	or	a,(OFST+1,sp)
1502  000e c750c9        	ld	20681,a
1503                     ; 448   CLK->CCOR |= CLK_CCOR_CCOEN;
1505  0011 721050c9      	bset	20681,#0
1506                     ; 449 }
1509  0015 84            	pop	a
1510  0016 81            	ret
1575                     ; 459 void CLK_ITConfig(CLK_IT_TypeDef CLK_IT, FunctionalState NewState)
1575                     ; 460 {
1576                     .text:	section	.text,new
1577  0000               _CLK_ITConfig:
1579  0000 89            	pushw	x
1580       00000000      OFST:	set	0
1583                     ; 462   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1585                     ; 463   assert_param(IS_CLK_IT_OK(CLK_IT));
1587                     ; 465   if (NewState != DISABLE)
1589  0001 9f            	ld	a,xl
1590  0002 4d            	tnz	a
1591  0003 2719          	jreq	L527
1592                     ; 467     switch (CLK_IT)
1594  0005 9e            	ld	a,xh
1596                     ; 475     default:
1596                     ; 476       break;
1597  0006 a00c          	sub	a,#12
1598  0008 270a          	jreq	L166
1599  000a a010          	sub	a,#16
1600  000c 2624          	jrne	L337
1601                     ; 469     case CLK_IT_SWIF: /* Enable the clock switch interrupt */
1601                     ; 470       CLK->SWCR |= CLK_SWCR_SWIEN;
1603  000e 721450c5      	bset	20677,#2
1604                     ; 471       break;
1606  0012 201e          	jra	L337
1607  0014               L166:
1608                     ; 472     case CLK_IT_CSSD: /* Enable the clock security system detection interrupt */
1608                     ; 473       CLK->CSSR |= CLK_CSSR_CSSDIE;
1610  0014 721450c8      	bset	20680,#2
1611                     ; 474       break;
1613  0018 2018          	jra	L337
1614  001a               L366:
1615                     ; 475     default:
1615                     ; 476       break;
1617  001a 2016          	jra	L337
1618  001c               L137:
1620  001c 2014          	jra	L337
1621  001e               L527:
1622                     ; 481     switch (CLK_IT)
1624  001e 7b01          	ld	a,(OFST+1,sp)
1626                     ; 489     default:
1626                     ; 490       break;
1627  0020 a00c          	sub	a,#12
1628  0022 270a          	jreq	L766
1629  0024 a010          	sub	a,#16
1630  0026 260a          	jrne	L337
1631                     ; 483     case CLK_IT_SWIF: /* Disable the clock switch interrupt */
1631                     ; 484       CLK->SWCR  &= (uint8_t)(~CLK_SWCR_SWIEN);
1633  0028 721550c5      	bres	20677,#2
1634                     ; 485       break;
1636  002c 2004          	jra	L337
1637  002e               L766:
1638                     ; 486     case CLK_IT_CSSD: /* Disable the clock security system detection interrupt */
1638                     ; 487       CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSDIE);
1640  002e 721550c8      	bres	20680,#2
1641                     ; 488       break;
1642  0032               L337:
1643                     ; 493 }
1646  0032 85            	popw	x
1647  0033 81            	ret
1648  0034               L176:
1649                     ; 489     default:
1649                     ; 490       break;
1651  0034 20fc          	jra	L337
1652  0036               L737:
1653  0036 20fa          	jra	L337
1688                     ; 500 void CLK_SYSCLKConfig(CLK_Prescaler_TypeDef CLK_Prescaler)
1688                     ; 501 {
1689                     .text:	section	.text,new
1690  0000               _CLK_SYSCLKConfig:
1692  0000 88            	push	a
1693       00000000      OFST:	set	0
1696                     ; 503   assert_param(IS_CLK_PRESCALER_OK(CLK_Prescaler));
1698                     ; 505   if (((uint8_t)CLK_Prescaler & (uint8_t)0x80) == 0x00) /* Bit7 = 0 means HSI divider */
1700  0001 a580          	bcp	a,#128
1701  0003 2614          	jrne	L757
1702                     ; 507     CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
1704  0005 c650c6        	ld	a,20678
1705  0008 a4e7          	and	a,#231
1706  000a c750c6        	ld	20678,a
1707                     ; 508     CLK->CKDIVR |= (uint8_t)((uint8_t)CLK_Prescaler & (uint8_t)CLK_CKDIVR_HSIDIV);
1709  000d 7b01          	ld	a,(OFST+1,sp)
1710  000f a418          	and	a,#24
1711  0011 ca50c6        	or	a,20678
1712  0014 c750c6        	ld	20678,a
1714  0017 2012          	jra	L167
1715  0019               L757:
1716                     ; 512     CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_CPUDIV);
1718  0019 c650c6        	ld	a,20678
1719  001c a4f8          	and	a,#248
1720  001e c750c6        	ld	20678,a
1721                     ; 513     CLK->CKDIVR |= (uint8_t)((uint8_t)CLK_Prescaler & (uint8_t)CLK_CKDIVR_CPUDIV);
1723  0021 7b01          	ld	a,(OFST+1,sp)
1724  0023 a407          	and	a,#7
1725  0025 ca50c6        	or	a,20678
1726  0028 c750c6        	ld	20678,a
1727  002b               L167:
1728                     ; 515 }
1731  002b 84            	pop	a
1732  002c 81            	ret
1788                     ; 523 void CLK_SWIMConfig(CLK_SWIMDivider_TypeDef CLK_SWIMDivider)
1788                     ; 524 {
1789                     .text:	section	.text,new
1790  0000               _CLK_SWIMConfig:
1794                     ; 526   assert_param(IS_CLK_SWIMDIVIDER_OK(CLK_SWIMDivider));
1796                     ; 528   if (CLK_SWIMDivider != CLK_SWIMDIVIDER_2)
1798  0000 4d            	tnz	a
1799  0001 2706          	jreq	L1101
1800                     ; 531     CLK->SWIMCCR |= CLK_SWIMCCR_SWIMDIV;
1802  0003 721050cd      	bset	20685,#0
1804  0007 2004          	jra	L3101
1805  0009               L1101:
1806                     ; 536     CLK->SWIMCCR &= (uint8_t)(~CLK_SWIMCCR_SWIMDIV);
1808  0009 721150cd      	bres	20685,#0
1809  000d               L3101:
1810                     ; 538 }
1813  000d 81            	ret
1837                     ; 547 void CLK_ClockSecuritySystemEnable(void)
1837                     ; 548 {
1838                     .text:	section	.text,new
1839  0000               _CLK_ClockSecuritySystemEnable:
1843                     ; 550   CLK->CSSR |= CLK_CSSR_CSSEN;
1845  0000 721050c8      	bset	20680,#0
1846                     ; 551 }
1849  0004 81            	ret
1874                     ; 559 CLK_Source_TypeDef CLK_GetSYSCLKSource(void)
1874                     ; 560 {
1875                     .text:	section	.text,new
1876  0000               _CLK_GetSYSCLKSource:
1880                     ; 561   return((CLK_Source_TypeDef)CLK->CMSR);
1882  0000 c650c3        	ld	a,20675
1885  0003 81            	ret
1948                     ; 569 uint32_t CLK_GetClockFreq(void)
1948                     ; 570 {
1949                     .text:	section	.text,new
1950  0000               _CLK_GetClockFreq:
1952  0000 5209          	subw	sp,#9
1953       00000009      OFST:	set	9
1956                     ; 571   uint32_t clockfrequency = 0;
1958  0002 96            	ldw	x,sp
1959  0003 1c0005        	addw	x,#OFST-4
1960  0006 cd0000        	call	c_ltor
1962                     ; 572   CLK_Source_TypeDef clocksource = CLK_SOURCE_HSI;
1964  0009 7b09          	ld	a,(OFST+0,sp)
1965  000b 97            	ld	xl,a
1966                     ; 573   uint8_t tmp = 0, presc = 0;
1968  000c 7b09          	ld	a,(OFST+0,sp)
1969  000e 97            	ld	xl,a
1972  000f 7b09          	ld	a,(OFST+0,sp)
1973  0011 97            	ld	xl,a
1974                     ; 576   clocksource = (CLK_Source_TypeDef)CLK->CMSR;
1976  0012 c650c3        	ld	a,20675
1977  0015 6b09          	ld	(OFST+0,sp),a
1978                     ; 578   if (clocksource == CLK_SOURCE_HSI)
1980  0017 7b09          	ld	a,(OFST+0,sp)
1981  0019 a1e1          	cp	a,#225
1982  001b 2642          	jrne	L7601
1983                     ; 580     tmp = (uint8_t)(CLK->CKDIVR & CLK_CKDIVR_HSIDIV);
1985  001d c650c6        	ld	a,20678
1986  0020 a418          	and	a,#24
1987  0022 6b09          	ld	(OFST+0,sp),a
1988                     ; 581     tmp = (uint8_t)(tmp >> 3);
1990  0024 7b09          	ld	a,(OFST+0,sp)
1991  0026 44            	srl	a
1992  0027 44            	srl	a
1993  0028 44            	srl	a
1994  0029 6b09          	ld	(OFST+0,sp),a
1995                     ; 582     presc = HSIDivFactor[tmp];
1997  002b 7b09          	ld	a,(OFST+0,sp)
1998  002d 5f            	clrw	x
1999  002e 97            	ld	xl,a
2000  002f d60000        	ld	a,(_HSIDivFactor,x)
2001  0032 6b09          	ld	(OFST+0,sp),a
2002                     ; 583     clockfrequency = HSI_VALUE / presc;
2004  0034 7b09          	ld	a,(OFST+0,sp)
2005  0036 b703          	ld	c_lreg+3,a
2006  0038 3f02          	clr	c_lreg+2
2007  003a 3f01          	clr	c_lreg+1
2008  003c 3f00          	clr	c_lreg
2009  003e 96            	ldw	x,sp
2010  003f 1c0001        	addw	x,#OFST-8
2011  0042 cd0000        	call	c_rtol
2013  0045 ae2400        	ldw	x,#9216
2014  0048 bf02          	ldw	c_lreg+2,x
2015  004a ae00f4        	ldw	x,#244
2016  004d bf00          	ldw	c_lreg,x
2017  004f 96            	ldw	x,sp
2018  0050 1c0001        	addw	x,#OFST-8
2019  0053 cd0000        	call	c_ludv
2021  0056 96            	ldw	x,sp
2022  0057 1c0005        	addw	x,#OFST-4
2023  005a cd0000        	call	c_rtol
2026  005d 201c          	jra	L1701
2027  005f               L7601:
2028                     ; 585   else if ( clocksource == CLK_SOURCE_LSI)
2030  005f 7b09          	ld	a,(OFST+0,sp)
2031  0061 a1d2          	cp	a,#210
2032  0063 260c          	jrne	L3701
2033                     ; 587     clockfrequency = LSI_VALUE;
2035  0065 aef400        	ldw	x,#62464
2036  0068 1f07          	ldw	(OFST-2,sp),x
2037  006a ae0001        	ldw	x,#1
2038  006d 1f05          	ldw	(OFST-4,sp),x
2040  006f 200a          	jra	L1701
2041  0071               L3701:
2042                     ; 591     clockfrequency = HSE_VALUE;
2044  0071 ae2400        	ldw	x,#9216
2045  0074 1f07          	ldw	(OFST-2,sp),x
2046  0076 ae00f4        	ldw	x,#244
2047  0079 1f05          	ldw	(OFST-4,sp),x
2048  007b               L1701:
2049                     ; 594   return((uint32_t)clockfrequency);
2051  007b 96            	ldw	x,sp
2052  007c 1c0005        	addw	x,#OFST-4
2053  007f cd0000        	call	c_ltor
2057  0082 5b09          	addw	sp,#9
2058  0084 81            	ret
2157                     ; 604 void CLK_AdjustHSICalibrationValue(CLK_HSITrimValue_TypeDef CLK_HSICalibrationValue)
2157                     ; 605 {
2158                     .text:	section	.text,new
2159  0000               _CLK_AdjustHSICalibrationValue:
2161  0000 88            	push	a
2162       00000000      OFST:	set	0
2165                     ; 607   assert_param(IS_CLK_HSITRIMVALUE_OK(CLK_HSICalibrationValue));
2167                     ; 610   CLK->HSITRIMR = (uint8_t)( (uint8_t)(CLK->HSITRIMR & (uint8_t)(~CLK_HSITRIMR_HSITRIM))|((uint8_t)CLK_HSICalibrationValue));
2169  0001 c650cc        	ld	a,20684
2170  0004 a4f8          	and	a,#248
2171  0006 1a01          	or	a,(OFST+1,sp)
2172  0008 c750cc        	ld	20684,a
2173                     ; 611 }
2176  000b 84            	pop	a
2177  000c 81            	ret
2201                     ; 622 void CLK_SYSCLKEmergencyClear(void)
2201                     ; 623 {
2202                     .text:	section	.text,new
2203  0000               _CLK_SYSCLKEmergencyClear:
2207                     ; 624   CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWBSY);
2209  0000 721150c5      	bres	20677,#0
2210                     ; 625 }
2213  0004 81            	ret
2366                     ; 634 FlagStatus CLK_GetFlagStatus(CLK_Flag_TypeDef CLK_FLAG)
2366                     ; 635 {
2367                     .text:	section	.text,new
2368  0000               _CLK_GetFlagStatus:
2370  0000 89            	pushw	x
2371  0001 5203          	subw	sp,#3
2372       00000003      OFST:	set	3
2375                     ; 636   uint16_t statusreg = 0;
2377  0003 1e01          	ldw	x,(OFST-2,sp)
2378                     ; 637   uint8_t tmpreg = 0;
2380  0005 7b03          	ld	a,(OFST+0,sp)
2381  0007 97            	ld	xl,a
2382                     ; 638   FlagStatus bitstatus = RESET;
2384  0008 7b03          	ld	a,(OFST+0,sp)
2385  000a 97            	ld	xl,a
2386                     ; 641   assert_param(IS_CLK_FLAG_OK(CLK_FLAG));
2388                     ; 644   statusreg = (uint16_t)((uint16_t)CLK_FLAG & (uint16_t)0xFF00);
2390  000b 7b04          	ld	a,(OFST+1,sp)
2391  000d 97            	ld	xl,a
2392  000e 7b05          	ld	a,(OFST+2,sp)
2393  0010 9f            	ld	a,xl
2394  0011 a4ff          	and	a,#255
2395  0013 97            	ld	xl,a
2396  0014 4f            	clr	a
2397  0015 02            	rlwa	x,a
2398  0016 1f01          	ldw	(OFST-2,sp),x
2399  0018 01            	rrwa	x,a
2400                     ; 647   if (statusreg == 0x0100) /* The flag to check is in ICKRregister */
2402  0019 1e01          	ldw	x,(OFST-2,sp)
2403  001b a30100        	cpw	x,#256
2404  001e 2607          	jrne	L1421
2405                     ; 649     tmpreg = CLK->ICKR;
2407  0020 c650c0        	ld	a,20672
2408  0023 6b03          	ld	(OFST+0,sp),a
2410  0025 202f          	jra	L3421
2411  0027               L1421:
2412                     ; 651   else if (statusreg == 0x0200) /* The flag to check is in ECKRregister */
2414  0027 1e01          	ldw	x,(OFST-2,sp)
2415  0029 a30200        	cpw	x,#512
2416  002c 2607          	jrne	L5421
2417                     ; 653     tmpreg = CLK->ECKR;
2419  002e c650c1        	ld	a,20673
2420  0031 6b03          	ld	(OFST+0,sp),a
2422  0033 2021          	jra	L3421
2423  0035               L5421:
2424                     ; 655   else if (statusreg == 0x0300) /* The flag to check is in SWIC register */
2426  0035 1e01          	ldw	x,(OFST-2,sp)
2427  0037 a30300        	cpw	x,#768
2428  003a 2607          	jrne	L1521
2429                     ; 657     tmpreg = CLK->SWCR;
2431  003c c650c5        	ld	a,20677
2432  003f 6b03          	ld	(OFST+0,sp),a
2434  0041 2013          	jra	L3421
2435  0043               L1521:
2436                     ; 659   else if (statusreg == 0x0400) /* The flag to check is in CSS register */
2438  0043 1e01          	ldw	x,(OFST-2,sp)
2439  0045 a30400        	cpw	x,#1024
2440  0048 2607          	jrne	L5521
2441                     ; 661     tmpreg = CLK->CSSR;
2443  004a c650c8        	ld	a,20680
2444  004d 6b03          	ld	(OFST+0,sp),a
2446  004f 2005          	jra	L3421
2447  0051               L5521:
2448                     ; 665     tmpreg = CLK->CCOR;
2450  0051 c650c9        	ld	a,20681
2451  0054 6b03          	ld	(OFST+0,sp),a
2452  0056               L3421:
2453                     ; 668   if ((tmpreg & (uint8_t)CLK_FLAG) != (uint8_t)RESET)
2455  0056 7b05          	ld	a,(OFST+2,sp)
2456  0058 1503          	bcp	a,(OFST+0,sp)
2457  005a 2706          	jreq	L1621
2458                     ; 670     bitstatus = SET;
2460  005c a601          	ld	a,#1
2461  005e 6b03          	ld	(OFST+0,sp),a
2463  0060 2002          	jra	L3621
2464  0062               L1621:
2465                     ; 674     bitstatus = RESET;
2467  0062 0f03          	clr	(OFST+0,sp)
2468  0064               L3621:
2469                     ; 678   return((FlagStatus)bitstatus);
2471  0064 7b03          	ld	a,(OFST+0,sp)
2474  0066 5b05          	addw	sp,#5
2475  0068 81            	ret
2521                     ; 687 ITStatus CLK_GetITStatus(CLK_IT_TypeDef CLK_IT)
2521                     ; 688 {
2522                     .text:	section	.text,new
2523  0000               _CLK_GetITStatus:
2525  0000 88            	push	a
2526  0001 88            	push	a
2527       00000001      OFST:	set	1
2530                     ; 689   ITStatus bitstatus = RESET;
2532  0002 0f01          	clr	(OFST+0,sp)
2533                     ; 692   assert_param(IS_CLK_IT_OK(CLK_IT));
2535                     ; 694   if (CLK_IT == CLK_IT_SWIF)
2537  0004 a11c          	cp	a,#28
2538  0006 2611          	jrne	L7031
2539                     ; 697     if ((CLK->SWCR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
2541  0008 c450c5        	and	a,20677
2542  000b a10c          	cp	a,#12
2543  000d 2606          	jrne	L1131
2544                     ; 699       bitstatus = SET;
2546  000f a601          	ld	a,#1
2547  0011 6b01          	ld	(OFST+0,sp),a
2549  0013 2015          	jra	L5131
2550  0015               L1131:
2551                     ; 703       bitstatus = RESET;
2553  0015 0f01          	clr	(OFST+0,sp)
2554  0017 2011          	jra	L5131
2555  0019               L7031:
2556                     ; 709     if ((CLK->CSSR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
2558  0019 c650c8        	ld	a,20680
2559  001c 1402          	and	a,(OFST+1,sp)
2560  001e a10c          	cp	a,#12
2561  0020 2606          	jrne	L7131
2562                     ; 711       bitstatus = SET;
2564  0022 a601          	ld	a,#1
2565  0024 6b01          	ld	(OFST+0,sp),a
2567  0026 2002          	jra	L5131
2568  0028               L7131:
2569                     ; 715       bitstatus = RESET;
2571  0028 0f01          	clr	(OFST+0,sp)
2572  002a               L5131:
2573                     ; 720   return bitstatus;
2575  002a 7b01          	ld	a,(OFST+0,sp)
2578  002c 85            	popw	x
2579  002d 81            	ret
2615                     ; 729 void CLK_ClearITPendingBit(CLK_IT_TypeDef CLK_IT)
2615                     ; 730 {
2616                     .text:	section	.text,new
2617  0000               _CLK_ClearITPendingBit:
2621                     ; 732   assert_param(IS_CLK_IT_OK(CLK_IT));
2623                     ; 734   if (CLK_IT == (uint8_t)CLK_IT_CSSD)
2625  0000 a10c          	cp	a,#12
2626  0002 2606          	jrne	L1431
2627                     ; 737     CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSD);
2629  0004 721750c8      	bres	20680,#3
2631  0008 2004          	jra	L3431
2632  000a               L1431:
2633                     ; 742     CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIF);
2635  000a 721750c5      	bres	20677,#3
2636  000e               L3431:
2637                     ; 745 }
2640  000e 81            	ret
2675                     	xdef	_CLKPrescTable
2676                     	xdef	_HSIDivFactor
2677                     	xdef	_CLK_ClearITPendingBit
2678                     	xdef	_CLK_GetITStatus
2679                     	xdef	_CLK_GetFlagStatus
2680                     	xdef	_CLK_GetSYSCLKSource
2681                     	xdef	_CLK_GetClockFreq
2682                     	xdef	_CLK_AdjustHSICalibrationValue
2683                     	xdef	_CLK_SYSCLKEmergencyClear
2684                     	xdef	_CLK_ClockSecuritySystemEnable
2685                     	xdef	_CLK_SWIMConfig
2686                     	xdef	_CLK_SYSCLKConfig
2687                     	xdef	_CLK_ITConfig
2688                     	xdef	_CLK_CCOConfig
2689                     	xdef	_CLK_HSIPrescalerConfig
2690                     	xdef	_CLK_ClockSwitchConfig
2691                     	xdef	_CLK_PeripheralClockConfig
2692                     	xdef	_CLK_SlowActiveHaltWakeUpCmd
2693                     	xdef	_CLK_FastHaltWakeUpCmd
2694                     	xdef	_CLK_ClockSwitchCmd
2695                     	xdef	_CLK_CCOCmd
2696                     	xdef	_CLK_LSICmd
2697                     	xdef	_CLK_HSICmd
2698                     	xdef	_CLK_HSECmd
2699                     	xdef	_CLK_DeInit
2700                     	xref.b	c_lreg
2719                     	xref	c_ludv
2720                     	xref	c_rtol
2721                     	xref	c_ltor
2722                     	end
