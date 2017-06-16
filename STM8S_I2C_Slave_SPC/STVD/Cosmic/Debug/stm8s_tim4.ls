   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
  32                     ; 49 void TIM4_DeInit(void)
  32                     ; 50 {
  34                     .text:	section	.text,new
  35  0000               _TIM4_DeInit:
  39                     ; 51   TIM4->CR1 = TIM4_CR1_RESET_VALUE;
  41  0000 725f5340      	clr	21312
  42                     ; 52   TIM4->IER = TIM4_IER_RESET_VALUE;
  44  0004 725f5343      	clr	21315
  45                     ; 53   TIM4->CNTR = TIM4_CNTR_RESET_VALUE;
  47  0008 725f5346      	clr	21318
  48                     ; 54   TIM4->PSCR = TIM4_PSCR_RESET_VALUE;
  50  000c 725f5347      	clr	21319
  51                     ; 55   TIM4->ARR = TIM4_ARR_RESET_VALUE;
  53  0010 35ff5348      	mov	21320,#255
  54                     ; 56   TIM4->SR1 = TIM4_SR1_RESET_VALUE;
  56  0014 725f5344      	clr	21316
  57                     ; 57 }
  60  0018 81            	ret
 167                     ; 65 void TIM4_TimeBaseInit(TIM4_Prescaler_TypeDef TIM4_Prescaler, uint8_t TIM4_Period)
 167                     ; 66 {
 168                     .text:	section	.text,new
 169  0000               _TIM4_TimeBaseInit:
 171  0000 89            	pushw	x
 172       00000000      OFST:	set	0
 175                     ; 68   assert_param(IS_TIM4_PRESCALER_OK(TIM4_Prescaler));
 177  0001 9e            	ld	a,xh
 178  0002 4d            	tnz	a
 179  0003 2723          	jreq	L21
 180  0005 9e            	ld	a,xh
 181  0006 a101          	cp	a,#1
 182  0008 271e          	jreq	L21
 183  000a 9e            	ld	a,xh
 184  000b a102          	cp	a,#2
 185  000d 2719          	jreq	L21
 186  000f 9e            	ld	a,xh
 187  0010 a103          	cp	a,#3
 188  0012 2714          	jreq	L21
 189  0014 9e            	ld	a,xh
 190  0015 a104          	cp	a,#4
 191  0017 270f          	jreq	L21
 192  0019 9e            	ld	a,xh
 193  001a a105          	cp	a,#5
 194  001c 270a          	jreq	L21
 195  001e 9e            	ld	a,xh
 196  001f a106          	cp	a,#6
 197  0021 2705          	jreq	L21
 198  0023 9e            	ld	a,xh
 199  0024 a107          	cp	a,#7
 200  0026 2603          	jrne	L01
 201  0028               L21:
 202  0028 4f            	clr	a
 203  0029 2010          	jra	L41
 204  002b               L01:
 205  002b ae0044        	ldw	x,#68
 206  002e 89            	pushw	x
 207  002f ae0000        	ldw	x,#0
 208  0032 89            	pushw	x
 209  0033 ae0000        	ldw	x,#L76
 210  0036 cd0000        	call	_assert_failed
 212  0039 5b04          	addw	sp,#4
 213  003b               L41:
 214                     ; 70   TIM4->PSCR = (uint8_t)(TIM4_Prescaler);
 216  003b 7b01          	ld	a,(OFST+1,sp)
 217  003d c75347        	ld	21319,a
 218                     ; 72   TIM4->ARR = (uint8_t)(TIM4_Period);
 220  0040 7b02          	ld	a,(OFST+2,sp)
 221  0042 c75348        	ld	21320,a
 222                     ; 73 }
 225  0045 85            	popw	x
 226  0046 81            	ret
 282                     ; 81 void TIM4_Cmd(FunctionalState NewState)
 282                     ; 82 {
 283                     .text:	section	.text,new
 284  0000               _TIM4_Cmd:
 286  0000 88            	push	a
 287       00000000      OFST:	set	0
 290                     ; 84   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 292  0001 4d            	tnz	a
 293  0002 2704          	jreq	L22
 294  0004 a101          	cp	a,#1
 295  0006 2603          	jrne	L02
 296  0008               L22:
 297  0008 4f            	clr	a
 298  0009 2010          	jra	L42
 299  000b               L02:
 300  000b ae0054        	ldw	x,#84
 301  000e 89            	pushw	x
 302  000f ae0000        	ldw	x,#0
 303  0012 89            	pushw	x
 304  0013 ae0000        	ldw	x,#L76
 305  0016 cd0000        	call	_assert_failed
 307  0019 5b04          	addw	sp,#4
 308  001b               L42:
 309                     ; 87   if (NewState != DISABLE)
 311  001b 0d01          	tnz	(OFST+1,sp)
 312  001d 2706          	jreq	L711
 313                     ; 89     TIM4->CR1 |= TIM4_CR1_CEN;
 315  001f 72105340      	bset	21312,#0
 317  0023 2004          	jra	L121
 318  0025               L711:
 319                     ; 93     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_CEN);
 321  0025 72115340      	bres	21312,#0
 322  0029               L121:
 323                     ; 95 }
 326  0029 84            	pop	a
 327  002a 81            	ret
 386                     ; 107 void TIM4_ITConfig(TIM4_IT_TypeDef TIM4_IT, FunctionalState NewState)
 386                     ; 108 {
 387                     .text:	section	.text,new
 388  0000               _TIM4_ITConfig:
 390  0000 89            	pushw	x
 391       00000000      OFST:	set	0
 394                     ; 110   assert_param(IS_TIM4_IT_OK(TIM4_IT));
 396  0001 9e            	ld	a,xh
 397  0002 a101          	cp	a,#1
 398  0004 2603          	jrne	L03
 399  0006 4f            	clr	a
 400  0007 2010          	jra	L23
 401  0009               L03:
 402  0009 ae006e        	ldw	x,#110
 403  000c 89            	pushw	x
 404  000d ae0000        	ldw	x,#0
 405  0010 89            	pushw	x
 406  0011 ae0000        	ldw	x,#L76
 407  0014 cd0000        	call	_assert_failed
 409  0017 5b04          	addw	sp,#4
 410  0019               L23:
 411                     ; 111   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 413  0019 0d02          	tnz	(OFST+2,sp)
 414  001b 2706          	jreq	L63
 415  001d 7b02          	ld	a,(OFST+2,sp)
 416  001f a101          	cp	a,#1
 417  0021 2603          	jrne	L43
 418  0023               L63:
 419  0023 4f            	clr	a
 420  0024 2010          	jra	L04
 421  0026               L43:
 422  0026 ae006f        	ldw	x,#111
 423  0029 89            	pushw	x
 424  002a ae0000        	ldw	x,#0
 425  002d 89            	pushw	x
 426  002e ae0000        	ldw	x,#L76
 427  0031 cd0000        	call	_assert_failed
 429  0034 5b04          	addw	sp,#4
 430  0036               L04:
 431                     ; 113   if (NewState != DISABLE)
 433  0036 0d02          	tnz	(OFST+2,sp)
 434  0038 270a          	jreq	L351
 435                     ; 116     TIM4->IER |= (uint8_t)TIM4_IT;
 437  003a c65343        	ld	a,21315
 438  003d 1a01          	or	a,(OFST+1,sp)
 439  003f c75343        	ld	21315,a
 441  0042 2009          	jra	L551
 442  0044               L351:
 443                     ; 121     TIM4->IER &= (uint8_t)(~TIM4_IT);
 445  0044 7b01          	ld	a,(OFST+1,sp)
 446  0046 43            	cpl	a
 447  0047 c45343        	and	a,21315
 448  004a c75343        	ld	21315,a
 449  004d               L551:
 450                     ; 123 }
 453  004d 85            	popw	x
 454  004e 81            	ret
 491                     ; 131 void TIM4_UpdateDisableConfig(FunctionalState NewState)
 491                     ; 132 {
 492                     .text:	section	.text,new
 493  0000               _TIM4_UpdateDisableConfig:
 495  0000 88            	push	a
 496       00000000      OFST:	set	0
 499                     ; 134   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 501  0001 4d            	tnz	a
 502  0002 2704          	jreq	L64
 503  0004 a101          	cp	a,#1
 504  0006 2603          	jrne	L44
 505  0008               L64:
 506  0008 4f            	clr	a
 507  0009 2010          	jra	L05
 508  000b               L44:
 509  000b ae0086        	ldw	x,#134
 510  000e 89            	pushw	x
 511  000f ae0000        	ldw	x,#0
 512  0012 89            	pushw	x
 513  0013 ae0000        	ldw	x,#L76
 514  0016 cd0000        	call	_assert_failed
 516  0019 5b04          	addw	sp,#4
 517  001b               L05:
 518                     ; 137   if (NewState != DISABLE)
 520  001b 0d01          	tnz	(OFST+1,sp)
 521  001d 2706          	jreq	L571
 522                     ; 139     TIM4->CR1 |= TIM4_CR1_UDIS;
 524  001f 72125340      	bset	21312,#1
 526  0023 2004          	jra	L771
 527  0025               L571:
 528                     ; 143     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_UDIS);
 530  0025 72135340      	bres	21312,#1
 531  0029               L771:
 532                     ; 145 }
 535  0029 84            	pop	a
 536  002a 81            	ret
 595                     ; 155 void TIM4_UpdateRequestConfig(TIM4_UpdateSource_TypeDef TIM4_UpdateSource)
 595                     ; 156 {
 596                     .text:	section	.text,new
 597  0000               _TIM4_UpdateRequestConfig:
 599  0000 88            	push	a
 600       00000000      OFST:	set	0
 603                     ; 158   assert_param(IS_TIM4_UPDATE_SOURCE_OK(TIM4_UpdateSource));
 605  0001 4d            	tnz	a
 606  0002 2704          	jreq	L65
 607  0004 a101          	cp	a,#1
 608  0006 2603          	jrne	L45
 609  0008               L65:
 610  0008 4f            	clr	a
 611  0009 2010          	jra	L06
 612  000b               L45:
 613  000b ae009e        	ldw	x,#158
 614  000e 89            	pushw	x
 615  000f ae0000        	ldw	x,#0
 616  0012 89            	pushw	x
 617  0013 ae0000        	ldw	x,#L76
 618  0016 cd0000        	call	_assert_failed
 620  0019 5b04          	addw	sp,#4
 621  001b               L06:
 622                     ; 161   if (TIM4_UpdateSource != TIM4_UPDATESOURCE_GLOBAL)
 624  001b 0d01          	tnz	(OFST+1,sp)
 625  001d 2706          	jreq	L722
 626                     ; 163     TIM4->CR1 |= TIM4_CR1_URS;
 628  001f 72145340      	bset	21312,#2
 630  0023 2004          	jra	L132
 631  0025               L722:
 632                     ; 167     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_URS);
 634  0025 72155340      	bres	21312,#2
 635  0029               L132:
 636                     ; 169 }
 639  0029 84            	pop	a
 640  002a 81            	ret
 698                     ; 179 void TIM4_SelectOnePulseMode(TIM4_OPMode_TypeDef TIM4_OPMode)
 698                     ; 180 {
 699                     .text:	section	.text,new
 700  0000               _TIM4_SelectOnePulseMode:
 702  0000 88            	push	a
 703       00000000      OFST:	set	0
 706                     ; 182   assert_param(IS_TIM4_OPM_MODE_OK(TIM4_OPMode));
 708  0001 a101          	cp	a,#1
 709  0003 2703          	jreq	L66
 710  0005 4d            	tnz	a
 711  0006 2603          	jrne	L46
 712  0008               L66:
 713  0008 4f            	clr	a
 714  0009 2010          	jra	L07
 715  000b               L46:
 716  000b ae00b6        	ldw	x,#182
 717  000e 89            	pushw	x
 718  000f ae0000        	ldw	x,#0
 719  0012 89            	pushw	x
 720  0013 ae0000        	ldw	x,#L76
 721  0016 cd0000        	call	_assert_failed
 723  0019 5b04          	addw	sp,#4
 724  001b               L07:
 725                     ; 185   if (TIM4_OPMode != TIM4_OPMODE_REPETITIVE)
 727  001b 0d01          	tnz	(OFST+1,sp)
 728  001d 2706          	jreq	L162
 729                     ; 187     TIM4->CR1 |= TIM4_CR1_OPM;
 731  001f 72165340      	bset	21312,#3
 733  0023 2004          	jra	L362
 734  0025               L162:
 735                     ; 191     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_OPM);
 737  0025 72175340      	bres	21312,#3
 738  0029               L362:
 739                     ; 193 }
 742  0029 84            	pop	a
 743  002a 81            	ret
 812                     ; 215 void TIM4_PrescalerConfig(TIM4_Prescaler_TypeDef Prescaler, TIM4_PSCReloadMode_TypeDef TIM4_PSCReloadMode)
 812                     ; 216 {
 813                     .text:	section	.text,new
 814  0000               _TIM4_PrescalerConfig:
 816  0000 89            	pushw	x
 817       00000000      OFST:	set	0
 820                     ; 218   assert_param(IS_TIM4_PRESCALER_RELOAD_OK(TIM4_PSCReloadMode));
 822  0001 9f            	ld	a,xl
 823  0002 4d            	tnz	a
 824  0003 2705          	jreq	L67
 825  0005 9f            	ld	a,xl
 826  0006 a101          	cp	a,#1
 827  0008 2603          	jrne	L47
 828  000a               L67:
 829  000a 4f            	clr	a
 830  000b 2010          	jra	L001
 831  000d               L47:
 832  000d ae00da        	ldw	x,#218
 833  0010 89            	pushw	x
 834  0011 ae0000        	ldw	x,#0
 835  0014 89            	pushw	x
 836  0015 ae0000        	ldw	x,#L76
 837  0018 cd0000        	call	_assert_failed
 839  001b 5b04          	addw	sp,#4
 840  001d               L001:
 841                     ; 219   assert_param(IS_TIM4_PRESCALER_OK(Prescaler));
 843  001d 0d01          	tnz	(OFST+1,sp)
 844  001f 272a          	jreq	L401
 845  0021 7b01          	ld	a,(OFST+1,sp)
 846  0023 a101          	cp	a,#1
 847  0025 2724          	jreq	L401
 848  0027 7b01          	ld	a,(OFST+1,sp)
 849  0029 a102          	cp	a,#2
 850  002b 271e          	jreq	L401
 851  002d 7b01          	ld	a,(OFST+1,sp)
 852  002f a103          	cp	a,#3
 853  0031 2718          	jreq	L401
 854  0033 7b01          	ld	a,(OFST+1,sp)
 855  0035 a104          	cp	a,#4
 856  0037 2712          	jreq	L401
 857  0039 7b01          	ld	a,(OFST+1,sp)
 858  003b a105          	cp	a,#5
 859  003d 270c          	jreq	L401
 860  003f 7b01          	ld	a,(OFST+1,sp)
 861  0041 a106          	cp	a,#6
 862  0043 2706          	jreq	L401
 863  0045 7b01          	ld	a,(OFST+1,sp)
 864  0047 a107          	cp	a,#7
 865  0049 2603          	jrne	L201
 866  004b               L401:
 867  004b 4f            	clr	a
 868  004c 2010          	jra	L601
 869  004e               L201:
 870  004e ae00db        	ldw	x,#219
 871  0051 89            	pushw	x
 872  0052 ae0000        	ldw	x,#0
 873  0055 89            	pushw	x
 874  0056 ae0000        	ldw	x,#L76
 875  0059 cd0000        	call	_assert_failed
 877  005c 5b04          	addw	sp,#4
 878  005e               L601:
 879                     ; 222   TIM4->PSCR = (uint8_t)Prescaler;
 881  005e 7b01          	ld	a,(OFST+1,sp)
 882  0060 c75347        	ld	21319,a
 883                     ; 225   TIM4->EGR = (uint8_t)TIM4_PSCReloadMode;
 885  0063 7b02          	ld	a,(OFST+2,sp)
 886  0065 c75345        	ld	21317,a
 887                     ; 226 }
 890  0068 85            	popw	x
 891  0069 81            	ret
 928                     ; 234 void TIM4_ARRPreloadConfig(FunctionalState NewState)
 928                     ; 235 {
 929                     .text:	section	.text,new
 930  0000               _TIM4_ARRPreloadConfig:
 932  0000 88            	push	a
 933       00000000      OFST:	set	0
 936                     ; 237   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 938  0001 4d            	tnz	a
 939  0002 2704          	jreq	L411
 940  0004 a101          	cp	a,#1
 941  0006 2603          	jrne	L211
 942  0008               L411:
 943  0008 4f            	clr	a
 944  0009 2010          	jra	L611
 945  000b               L211:
 946  000b ae00ed        	ldw	x,#237
 947  000e 89            	pushw	x
 948  000f ae0000        	ldw	x,#0
 949  0012 89            	pushw	x
 950  0013 ae0000        	ldw	x,#L76
 951  0016 cd0000        	call	_assert_failed
 953  0019 5b04          	addw	sp,#4
 954  001b               L611:
 955                     ; 240   if (NewState != DISABLE)
 957  001b 0d01          	tnz	(OFST+1,sp)
 958  001d 2706          	jreq	L533
 959                     ; 242     TIM4->CR1 |= TIM4_CR1_ARPE;
 961  001f 721e5340      	bset	21312,#7
 963  0023 2004          	jra	L733
 964  0025               L533:
 965                     ; 246     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_ARPE);
 967  0025 721f5340      	bres	21312,#7
 968  0029               L733:
 969                     ; 248 }
 972  0029 84            	pop	a
 973  002a 81            	ret
1023                     ; 257 void TIM4_GenerateEvent(TIM4_EventSource_TypeDef TIM4_EventSource)
1023                     ; 258 {
1024                     .text:	section	.text,new
1025  0000               _TIM4_GenerateEvent:
1027  0000 88            	push	a
1028       00000000      OFST:	set	0
1031                     ; 260   assert_param(IS_TIM4_EVENT_SOURCE_OK(TIM4_EventSource));
1033  0001 a101          	cp	a,#1
1034  0003 2603          	jrne	L221
1035  0005 4f            	clr	a
1036  0006 2010          	jra	L421
1037  0008               L221:
1038  0008 ae0104        	ldw	x,#260
1039  000b 89            	pushw	x
1040  000c ae0000        	ldw	x,#0
1041  000f 89            	pushw	x
1042  0010 ae0000        	ldw	x,#L76
1043  0013 cd0000        	call	_assert_failed
1045  0016 5b04          	addw	sp,#4
1046  0018               L421:
1047                     ; 263   TIM4->EGR = (uint8_t)(TIM4_EventSource);
1049  0018 7b01          	ld	a,(OFST+1,sp)
1050  001a c75345        	ld	21317,a
1051                     ; 264 }
1054  001d 84            	pop	a
1055  001e 81            	ret
1089                     ; 272 void TIM4_SetCounter(uint8_t Counter)
1089                     ; 273 {
1090                     .text:	section	.text,new
1091  0000               _TIM4_SetCounter:
1095                     ; 275   TIM4->CNTR = (uint8_t)(Counter);
1097  0000 c75346        	ld	21318,a
1098                     ; 276 }
1101  0003 81            	ret
1135                     ; 284 void TIM4_SetAutoreload(uint8_t Autoreload)
1135                     ; 285 {
1136                     .text:	section	.text,new
1137  0000               _TIM4_SetAutoreload:
1141                     ; 287   TIM4->ARR = (uint8_t)(Autoreload);
1143  0000 c75348        	ld	21320,a
1144                     ; 288 }
1147  0003 81            	ret
1170                     ; 295 uint8_t TIM4_GetCounter(void)
1170                     ; 296 {
1171                     .text:	section	.text,new
1172  0000               _TIM4_GetCounter:
1176                     ; 298   return (uint8_t)(TIM4->CNTR);
1178  0000 c65346        	ld	a,21318
1181  0003 81            	ret
1205                     ; 306 TIM4_Prescaler_TypeDef TIM4_GetPrescaler(void)
1205                     ; 307 {
1206                     .text:	section	.text,new
1207  0000               _TIM4_GetPrescaler:
1211                     ; 309   return (TIM4_Prescaler_TypeDef)(TIM4->PSCR);
1213  0000 c65347        	ld	a,21319
1216  0003 81            	ret
1296                     ; 319 FlagStatus TIM4_GetFlagStatus(TIM4_FLAG_TypeDef TIM4_FLAG)
1296                     ; 320 {
1297                     .text:	section	.text,new
1298  0000               _TIM4_GetFlagStatus:
1300  0000 88            	push	a
1301  0001 88            	push	a
1302       00000001      OFST:	set	1
1305                     ; 321   FlagStatus bitstatus = RESET;
1307  0002 0f01          	clr	(OFST+0,sp)
1308                     ; 324   assert_param(IS_TIM4_GET_FLAG_OK(TIM4_FLAG));
1310  0004 a101          	cp	a,#1
1311  0006 2603          	jrne	L041
1312  0008 4f            	clr	a
1313  0009 2010          	jra	L241
1314  000b               L041:
1315  000b ae0144        	ldw	x,#324
1316  000e 89            	pushw	x
1317  000f ae0000        	ldw	x,#0
1318  0012 89            	pushw	x
1319  0013 ae0000        	ldw	x,#L76
1320  0016 cd0000        	call	_assert_failed
1322  0019 5b04          	addw	sp,#4
1323  001b               L241:
1324                     ; 326   if ((TIM4->SR1 & (uint8_t)TIM4_FLAG)  != 0)
1326  001b c65344        	ld	a,21316
1327  001e 1502          	bcp	a,(OFST+1,sp)
1328  0020 2706          	jreq	L105
1329                     ; 328     bitstatus = SET;
1331  0022 a601          	ld	a,#1
1332  0024 6b01          	ld	(OFST+0,sp),a
1334  0026 2002          	jra	L305
1335  0028               L105:
1336                     ; 332     bitstatus = RESET;
1338  0028 0f01          	clr	(OFST+0,sp)
1339  002a               L305:
1340                     ; 334   return ((FlagStatus)bitstatus);
1342  002a 7b01          	ld	a,(OFST+0,sp)
1345  002c 85            	popw	x
1346  002d 81            	ret
1382                     ; 344 void TIM4_ClearFlag(TIM4_FLAG_TypeDef TIM4_FLAG)
1382                     ; 345 {
1383                     .text:	section	.text,new
1384  0000               _TIM4_ClearFlag:
1386  0000 88            	push	a
1387       00000000      OFST:	set	0
1390                     ; 347   assert_param(IS_TIM4_GET_FLAG_OK(TIM4_FLAG));
1392  0001 a101          	cp	a,#1
1393  0003 2603          	jrne	L641
1394  0005 4f            	clr	a
1395  0006 2010          	jra	L051
1396  0008               L641:
1397  0008 ae015b        	ldw	x,#347
1398  000b 89            	pushw	x
1399  000c ae0000        	ldw	x,#0
1400  000f 89            	pushw	x
1401  0010 ae0000        	ldw	x,#L76
1402  0013 cd0000        	call	_assert_failed
1404  0016 5b04          	addw	sp,#4
1405  0018               L051:
1406                     ; 350   TIM4->SR1 = (uint8_t)(~TIM4_FLAG);
1408  0018 7b01          	ld	a,(OFST+1,sp)
1409  001a 43            	cpl	a
1410  001b c75344        	ld	21316,a
1411                     ; 351 }
1414  001e 84            	pop	a
1415  001f 81            	ret
1480                     ; 360 ITStatus TIM4_GetITStatus(TIM4_IT_TypeDef TIM4_IT)
1480                     ; 361 {
1481                     .text:	section	.text,new
1482  0000               _TIM4_GetITStatus:
1484  0000 88            	push	a
1485  0001 89            	pushw	x
1486       00000002      OFST:	set	2
1489                     ; 362   ITStatus bitstatus = RESET;
1491  0002 7b02          	ld	a,(OFST+0,sp)
1492  0004 97            	ld	xl,a
1493                     ; 364   uint8_t itstatus = 0x0, itenable = 0x0;
1495  0005 7b01          	ld	a,(OFST-1,sp)
1496  0007 97            	ld	xl,a
1499  0008 7b02          	ld	a,(OFST+0,sp)
1500  000a 97            	ld	xl,a
1501                     ; 367   assert_param(IS_TIM4_IT_OK(TIM4_IT));
1503  000b 7b03          	ld	a,(OFST+1,sp)
1504  000d a101          	cp	a,#1
1505  000f 2603          	jrne	L451
1506  0011 4f            	clr	a
1507  0012 2010          	jra	L651
1508  0014               L451:
1509  0014 ae016f        	ldw	x,#367
1510  0017 89            	pushw	x
1511  0018 ae0000        	ldw	x,#0
1512  001b 89            	pushw	x
1513  001c ae0000        	ldw	x,#L76
1514  001f cd0000        	call	_assert_failed
1516  0022 5b04          	addw	sp,#4
1517  0024               L651:
1518                     ; 369   itstatus = (uint8_t)(TIM4->SR1 & (uint8_t)TIM4_IT);
1520  0024 c65344        	ld	a,21316
1521  0027 1403          	and	a,(OFST+1,sp)
1522  0029 6b01          	ld	(OFST-1,sp),a
1523                     ; 371   itenable = (uint8_t)(TIM4->IER & (uint8_t)TIM4_IT);
1525  002b c65343        	ld	a,21315
1526  002e 1403          	and	a,(OFST+1,sp)
1527  0030 6b02          	ld	(OFST+0,sp),a
1528                     ; 373   if ((itstatus != (uint8_t)RESET ) && (itenable != (uint8_t)RESET ))
1530  0032 0d01          	tnz	(OFST-1,sp)
1531  0034 270a          	jreq	L555
1533  0036 0d02          	tnz	(OFST+0,sp)
1534  0038 2706          	jreq	L555
1535                     ; 375     bitstatus = (ITStatus)SET;
1537  003a a601          	ld	a,#1
1538  003c 6b02          	ld	(OFST+0,sp),a
1540  003e 2002          	jra	L755
1541  0040               L555:
1542                     ; 379     bitstatus = (ITStatus)RESET;
1544  0040 0f02          	clr	(OFST+0,sp)
1545  0042               L755:
1546                     ; 381   return ((ITStatus)bitstatus);
1548  0042 7b02          	ld	a,(OFST+0,sp)
1551  0044 5b03          	addw	sp,#3
1552  0046 81            	ret
1589                     ; 391 void TIM4_ClearITPendingBit(TIM4_IT_TypeDef TIM4_IT)
1589                     ; 392 {
1590                     .text:	section	.text,new
1591  0000               _TIM4_ClearITPendingBit:
1593  0000 88            	push	a
1594       00000000      OFST:	set	0
1597                     ; 394   assert_param(IS_TIM4_IT_OK(TIM4_IT));
1599  0001 a101          	cp	a,#1
1600  0003 2603          	jrne	L261
1601  0005 4f            	clr	a
1602  0006 2010          	jra	L461
1603  0008               L261:
1604  0008 ae018a        	ldw	x,#394
1605  000b 89            	pushw	x
1606  000c ae0000        	ldw	x,#0
1607  000f 89            	pushw	x
1608  0010 ae0000        	ldw	x,#L76
1609  0013 cd0000        	call	_assert_failed
1611  0016 5b04          	addw	sp,#4
1612  0018               L461:
1613                     ; 397   TIM4->SR1 = (uint8_t)(~TIM4_IT);
1615  0018 7b01          	ld	a,(OFST+1,sp)
1616  001a 43            	cpl	a
1617  001b c75344        	ld	21316,a
1618                     ; 398 }
1621  001e 84            	pop	a
1622  001f 81            	ret
1635                     	xdef	_TIM4_ClearITPendingBit
1636                     	xdef	_TIM4_GetITStatus
1637                     	xdef	_TIM4_ClearFlag
1638                     	xdef	_TIM4_GetFlagStatus
1639                     	xdef	_TIM4_GetPrescaler
1640                     	xdef	_TIM4_GetCounter
1641                     	xdef	_TIM4_SetAutoreload
1642                     	xdef	_TIM4_SetCounter
1643                     	xdef	_TIM4_GenerateEvent
1644                     	xdef	_TIM4_ARRPreloadConfig
1645                     	xdef	_TIM4_PrescalerConfig
1646                     	xdef	_TIM4_SelectOnePulseMode
1647                     	xdef	_TIM4_UpdateRequestConfig
1648                     	xdef	_TIM4_UpdateDisableConfig
1649                     	xdef	_TIM4_ITConfig
1650                     	xdef	_TIM4_Cmd
1651                     	xdef	_TIM4_TimeBaseInit
1652                     	xdef	_TIM4_DeInit
1653                     	xref	_assert_failed
1654                     .const:	section	.text
1655  0000               L76:
1656  0000 2e2e5c2e2e5c  	dc.b	"..\..\..\libraries"
1657  0012 5c73746d3873  	dc.b	"\stm8s_stdperiph_d"
1658  0024 72697665725c  	dc.b	"river\src\stm8s_ti"
1659  0036 6d342e6300    	dc.b	"m4.c",0
1679                     	end
