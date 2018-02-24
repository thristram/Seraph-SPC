   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
  32                     ; 52 void TIM2_DeInit(void)
  32                     ; 53 {
  34                     .text:	section	.text,new
  35  0000               _TIM2_DeInit:
  39                     ; 54   TIM2->CR1 = (uint8_t)TIM2_CR1_RESET_VALUE;
  41  0000 725f5300      	clr	21248
  42                     ; 55   TIM2->IER = (uint8_t)TIM2_IER_RESET_VALUE;
  44  0004 725f5303      	clr	21251
  45                     ; 56   TIM2->SR2 = (uint8_t)TIM2_SR2_RESET_VALUE;
  47  0008 725f5305      	clr	21253
  48                     ; 59   TIM2->CCER1 = (uint8_t)TIM2_CCER1_RESET_VALUE;
  50  000c 725f530a      	clr	21258
  51                     ; 60   TIM2->CCER2 = (uint8_t)TIM2_CCER2_RESET_VALUE;
  53  0010 725f530b      	clr	21259
  54                     ; 64   TIM2->CCER1 = (uint8_t)TIM2_CCER1_RESET_VALUE;
  56  0014 725f530a      	clr	21258
  57                     ; 65   TIM2->CCER2 = (uint8_t)TIM2_CCER2_RESET_VALUE;
  59  0018 725f530b      	clr	21259
  60                     ; 66   TIM2->CCMR1 = (uint8_t)TIM2_CCMR1_RESET_VALUE;
  62  001c 725f5307      	clr	21255
  63                     ; 67   TIM2->CCMR2 = (uint8_t)TIM2_CCMR2_RESET_VALUE;
  65  0020 725f5308      	clr	21256
  66                     ; 68   TIM2->CCMR3 = (uint8_t)TIM2_CCMR3_RESET_VALUE;
  68  0024 725f5309      	clr	21257
  69                     ; 69   TIM2->CNTRH = (uint8_t)TIM2_CNTRH_RESET_VALUE;
  71  0028 725f530c      	clr	21260
  72                     ; 70   TIM2->CNTRL = (uint8_t)TIM2_CNTRL_RESET_VALUE;
  74  002c 725f530d      	clr	21261
  75                     ; 71   TIM2->PSCR = (uint8_t)TIM2_PSCR_RESET_VALUE;
  77  0030 725f530e      	clr	21262
  78                     ; 72   TIM2->ARRH  = (uint8_t)TIM2_ARRH_RESET_VALUE;
  80  0034 35ff530f      	mov	21263,#255
  81                     ; 73   TIM2->ARRL  = (uint8_t)TIM2_ARRL_RESET_VALUE;
  83  0038 35ff5310      	mov	21264,#255
  84                     ; 74   TIM2->CCR1H = (uint8_t)TIM2_CCR1H_RESET_VALUE;
  86  003c 725f5311      	clr	21265
  87                     ; 75   TIM2->CCR1L = (uint8_t)TIM2_CCR1L_RESET_VALUE;
  89  0040 725f5312      	clr	21266
  90                     ; 76   TIM2->CCR2H = (uint8_t)TIM2_CCR2H_RESET_VALUE;
  92  0044 725f5313      	clr	21267
  93                     ; 77   TIM2->CCR2L = (uint8_t)TIM2_CCR2L_RESET_VALUE;
  95  0048 725f5314      	clr	21268
  96                     ; 78   TIM2->CCR3H = (uint8_t)TIM2_CCR3H_RESET_VALUE;
  98  004c 725f5315      	clr	21269
  99                     ; 79   TIM2->CCR3L = (uint8_t)TIM2_CCR3L_RESET_VALUE;
 101  0050 725f5316      	clr	21270
 102                     ; 80   TIM2->SR1 = (uint8_t)TIM2_SR1_RESET_VALUE;
 104  0054 725f5304      	clr	21252
 105                     ; 81 }
 108  0058 81            	ret
 276                     ; 89 void TIM2_TimeBaseInit( TIM2_Prescaler_TypeDef TIM2_Prescaler,
 276                     ; 90                         uint16_t TIM2_Period)
 276                     ; 91 {
 277                     .text:	section	.text,new
 278  0000               _TIM2_TimeBaseInit:
 280  0000 88            	push	a
 281       00000000      OFST:	set	0
 284                     ; 93   TIM2->PSCR = (uint8_t)(TIM2_Prescaler);
 286  0001 c7530e        	ld	21262,a
 287                     ; 95   TIM2->ARRH = (uint8_t)(TIM2_Period >> 8);
 289  0004 7b04          	ld	a,(OFST+4,sp)
 290  0006 c7530f        	ld	21263,a
 291                     ; 96   TIM2->ARRL = (uint8_t)(TIM2_Period);
 293  0009 7b05          	ld	a,(OFST+5,sp)
 294  000b c75310        	ld	21264,a
 295                     ; 97 }
 298  000e 84            	pop	a
 299  000f 81            	ret
 456                     ; 108 void TIM2_OC1Init(TIM2_OCMode_TypeDef TIM2_OCMode,
 456                     ; 109                   TIM2_OutputState_TypeDef TIM2_OutputState,
 456                     ; 110                   uint16_t TIM2_Pulse,
 456                     ; 111                   TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
 456                     ; 112 {
 457                     .text:	section	.text,new
 458  0000               _TIM2_OC1Init:
 460  0000 89            	pushw	x
 461  0001 88            	push	a
 462       00000001      OFST:	set	1
 465                     ; 114   assert_param(IS_TIM2_OC_MODE_OK(TIM2_OCMode));
 467                     ; 115   assert_param(IS_TIM2_OUTPUT_STATE_OK(TIM2_OutputState));
 469                     ; 116   assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
 471                     ; 119   TIM2->CCER1 &= (uint8_t)(~( TIM2_CCER1_CC1E | TIM2_CCER1_CC1P));
 473  0002 c6530a        	ld	a,21258
 474  0005 a4fc          	and	a,#252
 475  0007 c7530a        	ld	21258,a
 476                     ; 121   TIM2->CCER1 |= (uint8_t)((uint8_t)(TIM2_OutputState & TIM2_CCER1_CC1E ) | 
 476                     ; 122                            (uint8_t)(TIM2_OCPolarity & TIM2_CCER1_CC1P));
 478  000a 7b08          	ld	a,(OFST+7,sp)
 479  000c a402          	and	a,#2
 480  000e 6b01          	ld	(OFST+0,sp),a
 481  0010 9f            	ld	a,xl
 482  0011 a401          	and	a,#1
 483  0013 1a01          	or	a,(OFST+0,sp)
 484  0015 ca530a        	or	a,21258
 485  0018 c7530a        	ld	21258,a
 486                     ; 125   TIM2->CCMR1 = (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~TIM2_CCMR_OCM)) |
 486                     ; 126                           (uint8_t)TIM2_OCMode);
 488  001b c65307        	ld	a,21255
 489  001e a48f          	and	a,#143
 490  0020 1a02          	or	a,(OFST+1,sp)
 491  0022 c75307        	ld	21255,a
 492                     ; 129   TIM2->CCR1H = (uint8_t)(TIM2_Pulse >> 8);
 494  0025 7b06          	ld	a,(OFST+5,sp)
 495  0027 c75311        	ld	21265,a
 496                     ; 130   TIM2->CCR1L = (uint8_t)(TIM2_Pulse);
 498  002a 7b07          	ld	a,(OFST+6,sp)
 499  002c c75312        	ld	21266,a
 500                     ; 131 }
 503  002f 5b03          	addw	sp,#3
 504  0031 81            	ret
 568                     ; 142 void TIM2_OC2Init(TIM2_OCMode_TypeDef TIM2_OCMode,
 568                     ; 143                   TIM2_OutputState_TypeDef TIM2_OutputState,
 568                     ; 144                   uint16_t TIM2_Pulse,
 568                     ; 145                   TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
 568                     ; 146 {
 569                     .text:	section	.text,new
 570  0000               _TIM2_OC2Init:
 572  0000 89            	pushw	x
 573  0001 88            	push	a
 574       00000001      OFST:	set	1
 577                     ; 148   assert_param(IS_TIM2_OC_MODE_OK(TIM2_OCMode));
 579                     ; 149   assert_param(IS_TIM2_OUTPUT_STATE_OK(TIM2_OutputState));
 581                     ; 150   assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
 583                     ; 154   TIM2->CCER1 &= (uint8_t)(~( TIM2_CCER1_CC2E |  TIM2_CCER1_CC2P ));
 585  0002 c6530a        	ld	a,21258
 586  0005 a4cf          	and	a,#207
 587  0007 c7530a        	ld	21258,a
 588                     ; 156   TIM2->CCER1 |= (uint8_t)((uint8_t)(TIM2_OutputState  & TIM2_CCER1_CC2E ) |
 588                     ; 157                            (uint8_t)(TIM2_OCPolarity & TIM2_CCER1_CC2P));
 590  000a 7b08          	ld	a,(OFST+7,sp)
 591  000c a420          	and	a,#32
 592  000e 6b01          	ld	(OFST+0,sp),a
 593  0010 9f            	ld	a,xl
 594  0011 a410          	and	a,#16
 595  0013 1a01          	or	a,(OFST+0,sp)
 596  0015 ca530a        	or	a,21258
 597  0018 c7530a        	ld	21258,a
 598                     ; 161   TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~TIM2_CCMR_OCM)) | 
 598                     ; 162                           (uint8_t)TIM2_OCMode);
 600  001b c65308        	ld	a,21256
 601  001e a48f          	and	a,#143
 602  0020 1a02          	or	a,(OFST+1,sp)
 603  0022 c75308        	ld	21256,a
 604                     ; 166   TIM2->CCR2H = (uint8_t)(TIM2_Pulse >> 8);
 606  0025 7b06          	ld	a,(OFST+5,sp)
 607  0027 c75313        	ld	21267,a
 608                     ; 167   TIM2->CCR2L = (uint8_t)(TIM2_Pulse);
 610  002a 7b07          	ld	a,(OFST+6,sp)
 611  002c c75314        	ld	21268,a
 612                     ; 168 }
 615  002f 5b03          	addw	sp,#3
 616  0031 81            	ret
 680                     ; 179 void TIM2_OC3Init(TIM2_OCMode_TypeDef TIM2_OCMode,
 680                     ; 180                   TIM2_OutputState_TypeDef TIM2_OutputState,
 680                     ; 181                   uint16_t TIM2_Pulse,
 680                     ; 182                   TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
 680                     ; 183 {
 681                     .text:	section	.text,new
 682  0000               _TIM2_OC3Init:
 684  0000 89            	pushw	x
 685  0001 88            	push	a
 686       00000001      OFST:	set	1
 689                     ; 185   assert_param(IS_TIM2_OC_MODE_OK(TIM2_OCMode));
 691                     ; 186   assert_param(IS_TIM2_OUTPUT_STATE_OK(TIM2_OutputState));
 693                     ; 187   assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
 695                     ; 189   TIM2->CCER2 &= (uint8_t)(~( TIM2_CCER2_CC3E  | TIM2_CCER2_CC3P));
 697  0002 c6530b        	ld	a,21259
 698  0005 a4fc          	and	a,#252
 699  0007 c7530b        	ld	21259,a
 700                     ; 191   TIM2->CCER2 |= (uint8_t)((uint8_t)(TIM2_OutputState & TIM2_CCER2_CC3E) |  
 700                     ; 192                            (uint8_t)(TIM2_OCPolarity & TIM2_CCER2_CC3P));
 702  000a 7b08          	ld	a,(OFST+7,sp)
 703  000c a402          	and	a,#2
 704  000e 6b01          	ld	(OFST+0,sp),a
 705  0010 9f            	ld	a,xl
 706  0011 a401          	and	a,#1
 707  0013 1a01          	or	a,(OFST+0,sp)
 708  0015 ca530b        	or	a,21259
 709  0018 c7530b        	ld	21259,a
 710                     ; 195   TIM2->CCMR3 = (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~TIM2_CCMR_OCM)) |
 710                     ; 196                           (uint8_t)TIM2_OCMode);
 712  001b c65309        	ld	a,21257
 713  001e a48f          	and	a,#143
 714  0020 1a02          	or	a,(OFST+1,sp)
 715  0022 c75309        	ld	21257,a
 716                     ; 199   TIM2->CCR3H = (uint8_t)(TIM2_Pulse >> 8);
 718  0025 7b06          	ld	a,(OFST+5,sp)
 719  0027 c75315        	ld	21269,a
 720                     ; 200   TIM2->CCR3L = (uint8_t)(TIM2_Pulse);
 722  002a 7b07          	ld	a,(OFST+6,sp)
 723  002c c75316        	ld	21270,a
 724                     ; 201 }
 727  002f 5b03          	addw	sp,#3
 728  0031 81            	ret
 921                     ; 212 void TIM2_ICInit(TIM2_Channel_TypeDef TIM2_Channel,
 921                     ; 213                  TIM2_ICPolarity_TypeDef TIM2_ICPolarity,
 921                     ; 214                  TIM2_ICSelection_TypeDef TIM2_ICSelection,
 921                     ; 215                  TIM2_ICPSC_TypeDef TIM2_ICPrescaler,
 921                     ; 216                  uint8_t TIM2_ICFilter)
 921                     ; 217 {
 922                     .text:	section	.text,new
 923  0000               _TIM2_ICInit:
 925  0000 89            	pushw	x
 926       00000000      OFST:	set	0
 929                     ; 219   assert_param(IS_TIM2_CHANNEL_OK(TIM2_Channel));
 931                     ; 220   assert_param(IS_TIM2_IC_POLARITY_OK(TIM2_ICPolarity));
 933                     ; 221   assert_param(IS_TIM2_IC_SELECTION_OK(TIM2_ICSelection));
 935                     ; 222   assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_ICPrescaler));
 937                     ; 223   assert_param(IS_TIM2_IC_FILTER_OK(TIM2_ICFilter));
 939                     ; 225   if (TIM2_Channel == TIM2_CHANNEL_1)
 941  0001 9e            	ld	a,xh
 942  0002 4d            	tnz	a
 943  0003 2614          	jrne	L104
 944                     ; 228     TI1_Config((uint8_t)TIM2_ICPolarity,
 944                     ; 229                (uint8_t)TIM2_ICSelection,
 944                     ; 230                (uint8_t)TIM2_ICFilter);
 946  0005 7b07          	ld	a,(OFST+7,sp)
 947  0007 88            	push	a
 948  0008 7b06          	ld	a,(OFST+6,sp)
 949  000a 97            	ld	xl,a
 950  000b 7b03          	ld	a,(OFST+3,sp)
 951  000d 95            	ld	xh,a
 952  000e cd0000        	call	L3_TI1_Config
 954  0011 84            	pop	a
 955                     ; 233     TIM2_SetIC1Prescaler(TIM2_ICPrescaler);
 957  0012 7b06          	ld	a,(OFST+6,sp)
 958  0014 cd0000        	call	_TIM2_SetIC1Prescaler
 961  0017 202c          	jra	L304
 962  0019               L104:
 963                     ; 235   else if (TIM2_Channel == TIM2_CHANNEL_2)
 965  0019 7b01          	ld	a,(OFST+1,sp)
 966  001b a101          	cp	a,#1
 967  001d 2614          	jrne	L504
 968                     ; 238     TI2_Config((uint8_t)TIM2_ICPolarity,
 968                     ; 239                (uint8_t)TIM2_ICSelection,
 968                     ; 240                (uint8_t)TIM2_ICFilter);
 970  001f 7b07          	ld	a,(OFST+7,sp)
 971  0021 88            	push	a
 972  0022 7b06          	ld	a,(OFST+6,sp)
 973  0024 97            	ld	xl,a
 974  0025 7b03          	ld	a,(OFST+3,sp)
 975  0027 95            	ld	xh,a
 976  0028 cd0000        	call	L5_TI2_Config
 978  002b 84            	pop	a
 979                     ; 243     TIM2_SetIC2Prescaler(TIM2_ICPrescaler);
 981  002c 7b06          	ld	a,(OFST+6,sp)
 982  002e cd0000        	call	_TIM2_SetIC2Prescaler
 985  0031 2012          	jra	L304
 986  0033               L504:
 987                     ; 248     TI3_Config((uint8_t)TIM2_ICPolarity,
 987                     ; 249                (uint8_t)TIM2_ICSelection,
 987                     ; 250                (uint8_t)TIM2_ICFilter);
 989  0033 7b07          	ld	a,(OFST+7,sp)
 990  0035 88            	push	a
 991  0036 7b06          	ld	a,(OFST+6,sp)
 992  0038 97            	ld	xl,a
 993  0039 7b03          	ld	a,(OFST+3,sp)
 994  003b 95            	ld	xh,a
 995  003c cd0000        	call	L7_TI3_Config
 997  003f 84            	pop	a
 998                     ; 253     TIM2_SetIC3Prescaler(TIM2_ICPrescaler);
1000  0040 7b06          	ld	a,(OFST+6,sp)
1001  0042 cd0000        	call	_TIM2_SetIC3Prescaler
1003  0045               L304:
1004                     ; 255 }
1007  0045 85            	popw	x
1008  0046 81            	ret
1104                     ; 266 void TIM2_PWMIConfig(TIM2_Channel_TypeDef TIM2_Channel,
1104                     ; 267                      TIM2_ICPolarity_TypeDef TIM2_ICPolarity,
1104                     ; 268                      TIM2_ICSelection_TypeDef TIM2_ICSelection,
1104                     ; 269                      TIM2_ICPSC_TypeDef TIM2_ICPrescaler,
1104                     ; 270                      uint8_t TIM2_ICFilter)
1104                     ; 271 {
1105                     .text:	section	.text,new
1106  0000               _TIM2_PWMIConfig:
1108  0000 89            	pushw	x
1109  0001 89            	pushw	x
1110       00000002      OFST:	set	2
1113                     ; 272   uint8_t icpolarity = (uint8_t)TIM2_ICPOLARITY_RISING;
1115  0002 7b01          	ld	a,(OFST-1,sp)
1116  0004 97            	ld	xl,a
1117                     ; 273   uint8_t icselection = (uint8_t)TIM2_ICSELECTION_DIRECTTI;
1119  0005 7b02          	ld	a,(OFST+0,sp)
1120  0007 97            	ld	xl,a
1121                     ; 276   assert_param(IS_TIM2_PWMI_CHANNEL_OK(TIM2_Channel));
1123                     ; 277   assert_param(IS_TIM2_IC_POLARITY_OK(TIM2_ICPolarity));
1125                     ; 278   assert_param(IS_TIM2_IC_SELECTION_OK(TIM2_ICSelection));
1127                     ; 279   assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_ICPrescaler));
1129                     ; 282   if (TIM2_ICPolarity != TIM2_ICPOLARITY_FALLING)
1131  0008 7b04          	ld	a,(OFST+2,sp)
1132  000a a144          	cp	a,#68
1133  000c 2706          	jreq	L754
1134                     ; 284     icpolarity = (uint8_t)TIM2_ICPOLARITY_FALLING;
1136  000e a644          	ld	a,#68
1137  0010 6b01          	ld	(OFST-1,sp),a
1139  0012 2002          	jra	L164
1140  0014               L754:
1141                     ; 288     icpolarity = (uint8_t)TIM2_ICPOLARITY_RISING;
1143  0014 0f01          	clr	(OFST-1,sp)
1144  0016               L164:
1145                     ; 292   if (TIM2_ICSelection == TIM2_ICSELECTION_DIRECTTI)
1147  0016 7b07          	ld	a,(OFST+5,sp)
1148  0018 a101          	cp	a,#1
1149  001a 2606          	jrne	L364
1150                     ; 294     icselection = (uint8_t)TIM2_ICSELECTION_INDIRECTTI;
1152  001c a602          	ld	a,#2
1153  001e 6b02          	ld	(OFST+0,sp),a
1155  0020 2004          	jra	L564
1156  0022               L364:
1157                     ; 298     icselection = (uint8_t)TIM2_ICSELECTION_DIRECTTI;
1159  0022 a601          	ld	a,#1
1160  0024 6b02          	ld	(OFST+0,sp),a
1161  0026               L564:
1162                     ; 301   if (TIM2_Channel == TIM2_CHANNEL_1)
1164  0026 0d03          	tnz	(OFST+1,sp)
1165  0028 2626          	jrne	L764
1166                     ; 304     TI1_Config((uint8_t)TIM2_ICPolarity, (uint8_t)TIM2_ICSelection,
1166                     ; 305                (uint8_t)TIM2_ICFilter);
1168  002a 7b09          	ld	a,(OFST+7,sp)
1169  002c 88            	push	a
1170  002d 7b08          	ld	a,(OFST+6,sp)
1171  002f 97            	ld	xl,a
1172  0030 7b05          	ld	a,(OFST+3,sp)
1173  0032 95            	ld	xh,a
1174  0033 cd0000        	call	L3_TI1_Config
1176  0036 84            	pop	a
1177                     ; 308     TIM2_SetIC1Prescaler(TIM2_ICPrescaler);
1179  0037 7b08          	ld	a,(OFST+6,sp)
1180  0039 cd0000        	call	_TIM2_SetIC1Prescaler
1182                     ; 311     TI2_Config(icpolarity, icselection, TIM2_ICFilter);
1184  003c 7b09          	ld	a,(OFST+7,sp)
1185  003e 88            	push	a
1186  003f 7b03          	ld	a,(OFST+1,sp)
1187  0041 97            	ld	xl,a
1188  0042 7b02          	ld	a,(OFST+0,sp)
1189  0044 95            	ld	xh,a
1190  0045 cd0000        	call	L5_TI2_Config
1192  0048 84            	pop	a
1193                     ; 314     TIM2_SetIC2Prescaler(TIM2_ICPrescaler);
1195  0049 7b08          	ld	a,(OFST+6,sp)
1196  004b cd0000        	call	_TIM2_SetIC2Prescaler
1199  004e 2024          	jra	L174
1200  0050               L764:
1201                     ; 319     TI2_Config((uint8_t)TIM2_ICPolarity, (uint8_t)TIM2_ICSelection,
1201                     ; 320                (uint8_t)TIM2_ICFilter);
1203  0050 7b09          	ld	a,(OFST+7,sp)
1204  0052 88            	push	a
1205  0053 7b08          	ld	a,(OFST+6,sp)
1206  0055 97            	ld	xl,a
1207  0056 7b05          	ld	a,(OFST+3,sp)
1208  0058 95            	ld	xh,a
1209  0059 cd0000        	call	L5_TI2_Config
1211  005c 84            	pop	a
1212                     ; 323     TIM2_SetIC2Prescaler(TIM2_ICPrescaler);
1214  005d 7b08          	ld	a,(OFST+6,sp)
1215  005f cd0000        	call	_TIM2_SetIC2Prescaler
1217                     ; 326     TI1_Config((uint8_t)icpolarity, icselection, (uint8_t)TIM2_ICFilter);
1219  0062 7b09          	ld	a,(OFST+7,sp)
1220  0064 88            	push	a
1221  0065 7b03          	ld	a,(OFST+1,sp)
1222  0067 97            	ld	xl,a
1223  0068 7b02          	ld	a,(OFST+0,sp)
1224  006a 95            	ld	xh,a
1225  006b cd0000        	call	L3_TI1_Config
1227  006e 84            	pop	a
1228                     ; 329     TIM2_SetIC1Prescaler(TIM2_ICPrescaler);
1230  006f 7b08          	ld	a,(OFST+6,sp)
1231  0071 cd0000        	call	_TIM2_SetIC1Prescaler
1233  0074               L174:
1234                     ; 331 }
1237  0074 5b04          	addw	sp,#4
1238  0076 81            	ret
1293                     ; 339 void TIM2_Cmd(FunctionalState NewState)
1293                     ; 340 {
1294                     .text:	section	.text,new
1295  0000               _TIM2_Cmd:
1299                     ; 342   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1301                     ; 345   if (NewState != DISABLE)
1303  0000 4d            	tnz	a
1304  0001 2706          	jreq	L125
1305                     ; 347     TIM2->CR1 |= (uint8_t)TIM2_CR1_CEN;
1307  0003 72105300      	bset	21248,#0
1309  0007 2004          	jra	L325
1310  0009               L125:
1311                     ; 351     TIM2->CR1 &= (uint8_t)(~TIM2_CR1_CEN);
1313  0009 72115300      	bres	21248,#0
1314  000d               L325:
1315                     ; 353 }
1318  000d 81            	ret
1397                     ; 368 void TIM2_ITConfig(TIM2_IT_TypeDef TIM2_IT, FunctionalState NewState)
1397                     ; 369 {
1398                     .text:	section	.text,new
1399  0000               _TIM2_ITConfig:
1401  0000 89            	pushw	x
1402       00000000      OFST:	set	0
1405                     ; 371   assert_param(IS_TIM2_IT_OK(TIM2_IT));
1407                     ; 372   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1409                     ; 374   if (NewState != DISABLE)
1411  0001 9f            	ld	a,xl
1412  0002 4d            	tnz	a
1413  0003 2709          	jreq	L365
1414                     ; 377     TIM2->IER |= (uint8_t)TIM2_IT;
1416  0005 9e            	ld	a,xh
1417  0006 ca5303        	or	a,21251
1418  0009 c75303        	ld	21251,a
1420  000c 2009          	jra	L565
1421  000e               L365:
1422                     ; 382     TIM2->IER &= (uint8_t)(~TIM2_IT);
1424  000e 7b01          	ld	a,(OFST+1,sp)
1425  0010 43            	cpl	a
1426  0011 c45303        	and	a,21251
1427  0014 c75303        	ld	21251,a
1428  0017               L565:
1429                     ; 384 }
1432  0017 85            	popw	x
1433  0018 81            	ret
1469                     ; 392 void TIM2_UpdateDisableConfig(FunctionalState NewState)
1469                     ; 393 {
1470                     .text:	section	.text,new
1471  0000               _TIM2_UpdateDisableConfig:
1475                     ; 395   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1477                     ; 398   if (NewState != DISABLE)
1479  0000 4d            	tnz	a
1480  0001 2706          	jreq	L506
1481                     ; 400     TIM2->CR1 |= (uint8_t)TIM2_CR1_UDIS;
1483  0003 72125300      	bset	21248,#1
1485  0007 2004          	jra	L706
1486  0009               L506:
1487                     ; 404     TIM2->CR1 &= (uint8_t)(~TIM2_CR1_UDIS);
1489  0009 72135300      	bres	21248,#1
1490  000d               L706:
1491                     ; 406 }
1494  000d 81            	ret
1552                     ; 416 void TIM2_UpdateRequestConfig(TIM2_UpdateSource_TypeDef TIM2_UpdateSource)
1552                     ; 417 {
1553                     .text:	section	.text,new
1554  0000               _TIM2_UpdateRequestConfig:
1558                     ; 419   assert_param(IS_TIM2_UPDATE_SOURCE_OK(TIM2_UpdateSource));
1560                     ; 422   if (TIM2_UpdateSource != TIM2_UPDATESOURCE_GLOBAL)
1562  0000 4d            	tnz	a
1563  0001 2706          	jreq	L736
1564                     ; 424     TIM2->CR1 |= (uint8_t)TIM2_CR1_URS;
1566  0003 72145300      	bset	21248,#2
1568  0007 2004          	jra	L146
1569  0009               L736:
1570                     ; 428     TIM2->CR1 &= (uint8_t)(~TIM2_CR1_URS);
1572  0009 72155300      	bres	21248,#2
1573  000d               L146:
1574                     ; 430 }
1577  000d 81            	ret
1634                     ; 440 void TIM2_SelectOnePulseMode(TIM2_OPMode_TypeDef TIM2_OPMode)
1634                     ; 441 {
1635                     .text:	section	.text,new
1636  0000               _TIM2_SelectOnePulseMode:
1640                     ; 443   assert_param(IS_TIM2_OPM_MODE_OK(TIM2_OPMode));
1642                     ; 446   if (TIM2_OPMode != TIM2_OPMODE_REPETITIVE)
1644  0000 4d            	tnz	a
1645  0001 2706          	jreq	L176
1646                     ; 448     TIM2->CR1 |= (uint8_t)TIM2_CR1_OPM;
1648  0003 72165300      	bset	21248,#3
1650  0007 2004          	jra	L376
1651  0009               L176:
1652                     ; 452     TIM2->CR1 &= (uint8_t)(~TIM2_CR1_OPM);
1654  0009 72175300      	bres	21248,#3
1655  000d               L376:
1656                     ; 454 }
1659  000d 81            	ret
1727                     ; 484 void TIM2_PrescalerConfig(TIM2_Prescaler_TypeDef Prescaler,
1727                     ; 485                           TIM2_PSCReloadMode_TypeDef TIM2_PSCReloadMode)
1727                     ; 486 {
1728                     .text:	section	.text,new
1729  0000               _TIM2_PrescalerConfig:
1733                     ; 488   assert_param(IS_TIM2_PRESCALER_RELOAD_OK(TIM2_PSCReloadMode));
1735                     ; 489   assert_param(IS_TIM2_PRESCALER_OK(Prescaler));
1737                     ; 492   TIM2->PSCR = (uint8_t)Prescaler;
1739  0000 9e            	ld	a,xh
1740  0001 c7530e        	ld	21262,a
1741                     ; 495   TIM2->EGR = (uint8_t)TIM2_PSCReloadMode;
1743  0004 9f            	ld	a,xl
1744  0005 c75306        	ld	21254,a
1745                     ; 496 }
1748  0008 81            	ret
1806                     ; 507 void TIM2_ForcedOC1Config(TIM2_ForcedAction_TypeDef TIM2_ForcedAction)
1806                     ; 508 {
1807                     .text:	section	.text,new
1808  0000               _TIM2_ForcedOC1Config:
1810  0000 88            	push	a
1811       00000000      OFST:	set	0
1814                     ; 510   assert_param(IS_TIM2_FORCED_ACTION_OK(TIM2_ForcedAction));
1816                     ; 513   TIM2->CCMR1  =  (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~TIM2_CCMR_OCM))  
1816                     ; 514                             | (uint8_t)TIM2_ForcedAction);
1818  0001 c65307        	ld	a,21255
1819  0004 a48f          	and	a,#143
1820  0006 1a01          	or	a,(OFST+1,sp)
1821  0008 c75307        	ld	21255,a
1822                     ; 515 }
1825  000b 84            	pop	a
1826  000c 81            	ret
1862                     ; 526 void TIM2_ForcedOC2Config(TIM2_ForcedAction_TypeDef TIM2_ForcedAction)
1862                     ; 527 {
1863                     .text:	section	.text,new
1864  0000               _TIM2_ForcedOC2Config:
1866  0000 88            	push	a
1867       00000000      OFST:	set	0
1870                     ; 529   assert_param(IS_TIM2_FORCED_ACTION_OK(TIM2_ForcedAction));
1872                     ; 532   TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~TIM2_CCMR_OCM))  
1872                     ; 533                           | (uint8_t)TIM2_ForcedAction);
1874  0001 c65308        	ld	a,21256
1875  0004 a48f          	and	a,#143
1876  0006 1a01          	or	a,(OFST+1,sp)
1877  0008 c75308        	ld	21256,a
1878                     ; 534 }
1881  000b 84            	pop	a
1882  000c 81            	ret
1918                     ; 545 void TIM2_ForcedOC3Config(TIM2_ForcedAction_TypeDef TIM2_ForcedAction)
1918                     ; 546 {
1919                     .text:	section	.text,new
1920  0000               _TIM2_ForcedOC3Config:
1922  0000 88            	push	a
1923       00000000      OFST:	set	0
1926                     ; 548   assert_param(IS_TIM2_FORCED_ACTION_OK(TIM2_ForcedAction));
1928                     ; 551   TIM2->CCMR3  =  (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~TIM2_CCMR_OCM))
1928                     ; 552                             | (uint8_t)TIM2_ForcedAction);
1930  0001 c65309        	ld	a,21257
1931  0004 a48f          	and	a,#143
1932  0006 1a01          	or	a,(OFST+1,sp)
1933  0008 c75309        	ld	21257,a
1934                     ; 553 }
1937  000b 84            	pop	a
1938  000c 81            	ret
1974                     ; 561 void TIM2_ARRPreloadConfig(FunctionalState NewState)
1974                     ; 562 {
1975                     .text:	section	.text,new
1976  0000               _TIM2_ARRPreloadConfig:
1980                     ; 564   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1982                     ; 567   if (NewState != DISABLE)
1984  0000 4d            	tnz	a
1985  0001 2706          	jreq	L7201
1986                     ; 569     TIM2->CR1 |= (uint8_t)TIM2_CR1_ARPE;
1988  0003 721e5300      	bset	21248,#7
1990  0007 2004          	jra	L1301
1991  0009               L7201:
1992                     ; 573     TIM2->CR1 &= (uint8_t)(~TIM2_CR1_ARPE);
1994  0009 721f5300      	bres	21248,#7
1995  000d               L1301:
1996                     ; 575 }
1999  000d 81            	ret
2035                     ; 583 void TIM2_OC1PreloadConfig(FunctionalState NewState)
2035                     ; 584 {
2036                     .text:	section	.text,new
2037  0000               _TIM2_OC1PreloadConfig:
2041                     ; 586   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2043                     ; 589   if (NewState != DISABLE)
2045  0000 4d            	tnz	a
2046  0001 2706          	jreq	L1501
2047                     ; 591     TIM2->CCMR1 |= (uint8_t)TIM2_CCMR_OCxPE;
2049  0003 72165307      	bset	21255,#3
2051  0007 2004          	jra	L3501
2052  0009               L1501:
2053                     ; 595     TIM2->CCMR1 &= (uint8_t)(~TIM2_CCMR_OCxPE);
2055  0009 72175307      	bres	21255,#3
2056  000d               L3501:
2057                     ; 597 }
2060  000d 81            	ret
2096                     ; 605 void TIM2_OC2PreloadConfig(FunctionalState NewState)
2096                     ; 606 {
2097                     .text:	section	.text,new
2098  0000               _TIM2_OC2PreloadConfig:
2102                     ; 608   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2104                     ; 611   if (NewState != DISABLE)
2106  0000 4d            	tnz	a
2107  0001 2706          	jreq	L3701
2108                     ; 613     TIM2->CCMR2 |= (uint8_t)TIM2_CCMR_OCxPE;
2110  0003 72165308      	bset	21256,#3
2112  0007 2004          	jra	L5701
2113  0009               L3701:
2114                     ; 617     TIM2->CCMR2 &= (uint8_t)(~TIM2_CCMR_OCxPE);
2116  0009 72175308      	bres	21256,#3
2117  000d               L5701:
2118                     ; 619 }
2121  000d 81            	ret
2157                     ; 627 void TIM2_OC3PreloadConfig(FunctionalState NewState)
2157                     ; 628 {
2158                     .text:	section	.text,new
2159  0000               _TIM2_OC3PreloadConfig:
2163                     ; 630   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2165                     ; 633   if (NewState != DISABLE)
2167  0000 4d            	tnz	a
2168  0001 2706          	jreq	L5111
2169                     ; 635     TIM2->CCMR3 |= (uint8_t)TIM2_CCMR_OCxPE;
2171  0003 72165309      	bset	21257,#3
2173  0007 2004          	jra	L7111
2174  0009               L5111:
2175                     ; 639     TIM2->CCMR3 &= (uint8_t)(~TIM2_CCMR_OCxPE);
2177  0009 72175309      	bres	21257,#3
2178  000d               L7111:
2179                     ; 641 }
2182  000d 81            	ret
2255                     ; 653 void TIM2_GenerateEvent(TIM2_EventSource_TypeDef TIM2_EventSource)
2255                     ; 654 {
2256                     .text:	section	.text,new
2257  0000               _TIM2_GenerateEvent:
2261                     ; 656   assert_param(IS_TIM2_EVENT_SOURCE_OK(TIM2_EventSource));
2263                     ; 659   TIM2->EGR = (uint8_t)TIM2_EventSource;
2265  0000 c75306        	ld	21254,a
2266                     ; 660 }
2269  0003 81            	ret
2305                     ; 670 void TIM2_OC1PolarityConfig(TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
2305                     ; 671 {
2306                     .text:	section	.text,new
2307  0000               _TIM2_OC1PolarityConfig:
2311                     ; 673   assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
2313                     ; 676   if (TIM2_OCPolarity != TIM2_OCPOLARITY_HIGH)
2315  0000 4d            	tnz	a
2316  0001 2706          	jreq	L1711
2317                     ; 678     TIM2->CCER1 |= (uint8_t)TIM2_CCER1_CC1P;
2319  0003 7212530a      	bset	21258,#1
2321  0007 2004          	jra	L3711
2322  0009               L1711:
2323                     ; 682     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1P);
2325  0009 7213530a      	bres	21258,#1
2326  000d               L3711:
2327                     ; 684 }
2330  000d 81            	ret
2366                     ; 694 void TIM2_OC2PolarityConfig(TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
2366                     ; 695 {
2367                     .text:	section	.text,new
2368  0000               _TIM2_OC2PolarityConfig:
2372                     ; 697   assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
2374                     ; 700   if (TIM2_OCPolarity != TIM2_OCPOLARITY_HIGH)
2376  0000 4d            	tnz	a
2377  0001 2706          	jreq	L3121
2378                     ; 702     TIM2->CCER1 |= TIM2_CCER1_CC2P;
2380  0003 721a530a      	bset	21258,#5
2382  0007 2004          	jra	L5121
2383  0009               L3121:
2384                     ; 706     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2P);
2386  0009 721b530a      	bres	21258,#5
2387  000d               L5121:
2388                     ; 708 }
2391  000d 81            	ret
2427                     ; 718 void TIM2_OC3PolarityConfig(TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
2427                     ; 719 {
2428                     .text:	section	.text,new
2429  0000               _TIM2_OC3PolarityConfig:
2433                     ; 721   assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
2435                     ; 724   if (TIM2_OCPolarity != TIM2_OCPOLARITY_HIGH)
2437  0000 4d            	tnz	a
2438  0001 2706          	jreq	L5321
2439                     ; 726     TIM2->CCER2 |= (uint8_t)TIM2_CCER2_CC3P;
2441  0003 7212530b      	bset	21259,#1
2443  0007 2004          	jra	L7321
2444  0009               L5321:
2445                     ; 730     TIM2->CCER2 &= (uint8_t)(~TIM2_CCER2_CC3P);
2447  0009 7213530b      	bres	21259,#1
2448  000d               L7321:
2449                     ; 732 }
2452  000d 81            	ret
2497                     ; 745 void TIM2_CCxCmd(TIM2_Channel_TypeDef TIM2_Channel, FunctionalState NewState)
2497                     ; 746 {
2498                     .text:	section	.text,new
2499  0000               _TIM2_CCxCmd:
2501  0000 89            	pushw	x
2502       00000000      OFST:	set	0
2505                     ; 748   assert_param(IS_TIM2_CHANNEL_OK(TIM2_Channel));
2507                     ; 749   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2509                     ; 751   if (TIM2_Channel == TIM2_CHANNEL_1)
2511  0001 9e            	ld	a,xh
2512  0002 4d            	tnz	a
2513  0003 2610          	jrne	L3621
2514                     ; 754     if (NewState != DISABLE)
2516  0005 9f            	ld	a,xl
2517  0006 4d            	tnz	a
2518  0007 2706          	jreq	L5621
2519                     ; 756       TIM2->CCER1 |= (uint8_t)TIM2_CCER1_CC1E;
2521  0009 7210530a      	bset	21258,#0
2523  000d 202a          	jra	L1721
2524  000f               L5621:
2525                     ; 760       TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1E);
2527  000f 7211530a      	bres	21258,#0
2528  0013 2024          	jra	L1721
2529  0015               L3621:
2530                     ; 764   else if (TIM2_Channel == TIM2_CHANNEL_2)
2532  0015 7b01          	ld	a,(OFST+1,sp)
2533  0017 a101          	cp	a,#1
2534  0019 2610          	jrne	L3721
2535                     ; 767     if (NewState != DISABLE)
2537  001b 0d02          	tnz	(OFST+2,sp)
2538  001d 2706          	jreq	L5721
2539                     ; 769       TIM2->CCER1 |= (uint8_t)TIM2_CCER1_CC2E;
2541  001f 7218530a      	bset	21258,#4
2543  0023 2014          	jra	L1721
2544  0025               L5721:
2545                     ; 773       TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2E);
2547  0025 7219530a      	bres	21258,#4
2548  0029 200e          	jra	L1721
2549  002b               L3721:
2550                     ; 779     if (NewState != DISABLE)
2552  002b 0d02          	tnz	(OFST+2,sp)
2553  002d 2706          	jreq	L3031
2554                     ; 781       TIM2->CCER2 |= (uint8_t)TIM2_CCER2_CC3E;
2556  002f 7210530b      	bset	21259,#0
2558  0033 2004          	jra	L1721
2559  0035               L3031:
2560                     ; 785       TIM2->CCER2 &= (uint8_t)(~TIM2_CCER2_CC3E);
2562  0035 7211530b      	bres	21259,#0
2563  0039               L1721:
2564                     ; 788 }
2567  0039 85            	popw	x
2568  003a 81            	ret
2613                     ; 810 void TIM2_SelectOCxM(TIM2_Channel_TypeDef TIM2_Channel, TIM2_OCMode_TypeDef TIM2_OCMode)
2613                     ; 811 {
2614                     .text:	section	.text,new
2615  0000               _TIM2_SelectOCxM:
2617  0000 89            	pushw	x
2618       00000000      OFST:	set	0
2621                     ; 813   assert_param(IS_TIM2_CHANNEL_OK(TIM2_Channel));
2623                     ; 814   assert_param(IS_TIM2_OCM_OK(TIM2_OCMode));
2625                     ; 816   if (TIM2_Channel == TIM2_CHANNEL_1)
2627  0001 9e            	ld	a,xh
2628  0002 4d            	tnz	a
2629  0003 2610          	jrne	L1331
2630                     ; 819     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1E);
2632  0005 7211530a      	bres	21258,#0
2633                     ; 822     TIM2->CCMR1 = (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~TIM2_CCMR_OCM))
2633                     ; 823                             | (uint8_t)TIM2_OCMode);
2635  0009 c65307        	ld	a,21255
2636  000c a48f          	and	a,#143
2637  000e 1a02          	or	a,(OFST+2,sp)
2638  0010 c75307        	ld	21255,a
2640  0013 2024          	jra	L3331
2641  0015               L1331:
2642                     ; 825   else if (TIM2_Channel == TIM2_CHANNEL_2)
2644  0015 7b01          	ld	a,(OFST+1,sp)
2645  0017 a101          	cp	a,#1
2646  0019 2610          	jrne	L5331
2647                     ; 828     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2E);
2649  001b 7219530a      	bres	21258,#4
2650                     ; 831     TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~TIM2_CCMR_OCM))
2650                     ; 832                             | (uint8_t)TIM2_OCMode);
2652  001f c65308        	ld	a,21256
2653  0022 a48f          	and	a,#143
2654  0024 1a02          	or	a,(OFST+2,sp)
2655  0026 c75308        	ld	21256,a
2657  0029 200e          	jra	L3331
2658  002b               L5331:
2659                     ; 837     TIM2->CCER2 &= (uint8_t)(~TIM2_CCER2_CC3E);
2661  002b 7211530b      	bres	21259,#0
2662                     ; 840     TIM2->CCMR3 = (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~TIM2_CCMR_OCM))
2662                     ; 841                             | (uint8_t)TIM2_OCMode);
2664  002f c65309        	ld	a,21257
2665  0032 a48f          	and	a,#143
2666  0034 1a02          	or	a,(OFST+2,sp)
2667  0036 c75309        	ld	21257,a
2668  0039               L3331:
2669                     ; 843 }
2672  0039 85            	popw	x
2673  003a 81            	ret
2707                     ; 851 void TIM2_SetCounter(uint16_t Counter)
2707                     ; 852 {
2708                     .text:	section	.text,new
2709  0000               _TIM2_SetCounter:
2713                     ; 854   TIM2->CNTRH = (uint8_t)(Counter >> 8);
2715  0000 9e            	ld	a,xh
2716  0001 c7530c        	ld	21260,a
2717                     ; 855   TIM2->CNTRL = (uint8_t)(Counter);
2719  0004 9f            	ld	a,xl
2720  0005 c7530d        	ld	21261,a
2721                     ; 856 }
2724  0008 81            	ret
2758                     ; 864 void TIM2_SetAutoreload(uint16_t Autoreload)
2758                     ; 865 {
2759                     .text:	section	.text,new
2760  0000               _TIM2_SetAutoreload:
2764                     ; 867   TIM2->ARRH = (uint8_t)(Autoreload >> 8);
2766  0000 9e            	ld	a,xh
2767  0001 c7530f        	ld	21263,a
2768                     ; 868   TIM2->ARRL = (uint8_t)(Autoreload);
2770  0004 9f            	ld	a,xl
2771  0005 c75310        	ld	21264,a
2772                     ; 869 }
2775  0008 81            	ret
2809                     ; 877 void TIM2_SetCompare1(uint16_t Compare1)
2809                     ; 878 {
2810                     .text:	section	.text,new
2811  0000               _TIM2_SetCompare1:
2815                     ; 880   TIM2->CCR1H = (uint8_t)(Compare1 >> 8);
2817  0000 9e            	ld	a,xh
2818  0001 c75311        	ld	21265,a
2819                     ; 881   TIM2->CCR1L = (uint8_t)(Compare1);
2821  0004 9f            	ld	a,xl
2822  0005 c75312        	ld	21266,a
2823                     ; 882 }
2826  0008 81            	ret
2860                     ; 890 void TIM2_SetCompare2(uint16_t Compare2)
2860                     ; 891 {
2861                     .text:	section	.text,new
2862  0000               _TIM2_SetCompare2:
2866                     ; 893   TIM2->CCR2H = (uint8_t)(Compare2 >> 8);
2868  0000 9e            	ld	a,xh
2869  0001 c75313        	ld	21267,a
2870                     ; 894   TIM2->CCR2L = (uint8_t)(Compare2);
2872  0004 9f            	ld	a,xl
2873  0005 c75314        	ld	21268,a
2874                     ; 895 }
2877  0008 81            	ret
2911                     ; 903 void TIM2_SetCompare3(uint16_t Compare3)
2911                     ; 904 {
2912                     .text:	section	.text,new
2913  0000               _TIM2_SetCompare3:
2917                     ; 906   TIM2->CCR3H = (uint8_t)(Compare3 >> 8);
2919  0000 9e            	ld	a,xh
2920  0001 c75315        	ld	21269,a
2921                     ; 907   TIM2->CCR3L = (uint8_t)(Compare3);
2923  0004 9f            	ld	a,xl
2924  0005 c75316        	ld	21270,a
2925                     ; 908 }
2928  0008 81            	ret
2964                     ; 920 void TIM2_SetIC1Prescaler(TIM2_ICPSC_TypeDef TIM2_IC1Prescaler)
2964                     ; 921 {
2965                     .text:	section	.text,new
2966  0000               _TIM2_SetIC1Prescaler:
2968  0000 88            	push	a
2969       00000000      OFST:	set	0
2972                     ; 923   assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_IC1Prescaler));
2974                     ; 926   TIM2->CCMR1 = (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~TIM2_CCMR_ICxPSC))
2974                     ; 927                           | (uint8_t)TIM2_IC1Prescaler);
2976  0001 c65307        	ld	a,21255
2977  0004 a4f3          	and	a,#243
2978  0006 1a01          	or	a,(OFST+1,sp)
2979  0008 c75307        	ld	21255,a
2980                     ; 928 }
2983  000b 84            	pop	a
2984  000c 81            	ret
3020                     ; 940 void TIM2_SetIC2Prescaler(TIM2_ICPSC_TypeDef TIM2_IC2Prescaler)
3020                     ; 941 {
3021                     .text:	section	.text,new
3022  0000               _TIM2_SetIC2Prescaler:
3024  0000 88            	push	a
3025       00000000      OFST:	set	0
3028                     ; 943   assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_IC2Prescaler));
3030                     ; 946   TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~TIM2_CCMR_ICxPSC))
3030                     ; 947                           | (uint8_t)TIM2_IC2Prescaler);
3032  0001 c65308        	ld	a,21256
3033  0004 a4f3          	and	a,#243
3034  0006 1a01          	or	a,(OFST+1,sp)
3035  0008 c75308        	ld	21256,a
3036                     ; 948 }
3039  000b 84            	pop	a
3040  000c 81            	ret
3076                     ; 960 void TIM2_SetIC3Prescaler(TIM2_ICPSC_TypeDef TIM2_IC3Prescaler)
3076                     ; 961 {
3077                     .text:	section	.text,new
3078  0000               _TIM2_SetIC3Prescaler:
3080  0000 88            	push	a
3081       00000000      OFST:	set	0
3084                     ; 964   assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_IC3Prescaler));
3086                     ; 966   TIM2->CCMR3 = (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~TIM2_CCMR_ICxPSC))
3086                     ; 967                           | (uint8_t)TIM2_IC3Prescaler);
3088  0001 c65309        	ld	a,21257
3089  0004 a4f3          	and	a,#243
3090  0006 1a01          	or	a,(OFST+1,sp)
3091  0008 c75309        	ld	21257,a
3092                     ; 968 }
3095  000b 84            	pop	a
3096  000c 81            	ret
3148                     ; 975 uint16_t TIM2_GetCapture1(void)
3148                     ; 976 {
3149                     .text:	section	.text,new
3150  0000               _TIM2_GetCapture1:
3152  0000 5204          	subw	sp,#4
3153       00000004      OFST:	set	4
3156                     ; 978   uint16_t tmpccr1 = 0;
3158  0002 1e03          	ldw	x,(OFST-1,sp)
3159                     ; 979   uint8_t tmpccr1l=0, tmpccr1h=0;
3161  0004 7b01          	ld	a,(OFST-3,sp)
3162  0006 97            	ld	xl,a
3165  0007 7b02          	ld	a,(OFST-2,sp)
3166  0009 97            	ld	xl,a
3167                     ; 981   tmpccr1h = TIM2->CCR1H;
3169  000a c65311        	ld	a,21265
3170  000d 6b02          	ld	(OFST-2,sp),a
3171                     ; 982   tmpccr1l = TIM2->CCR1L;
3173  000f c65312        	ld	a,21266
3174  0012 6b01          	ld	(OFST-3,sp),a
3175                     ; 984   tmpccr1 = (uint16_t)(tmpccr1l);
3177  0014 7b01          	ld	a,(OFST-3,sp)
3178  0016 5f            	clrw	x
3179  0017 97            	ld	xl,a
3180  0018 1f03          	ldw	(OFST-1,sp),x
3181                     ; 985   tmpccr1 |= (uint16_t)((uint16_t)tmpccr1h << 8);
3183  001a 7b02          	ld	a,(OFST-2,sp)
3184  001c 5f            	clrw	x
3185  001d 97            	ld	xl,a
3186  001e 4f            	clr	a
3187  001f 02            	rlwa	x,a
3188  0020 01            	rrwa	x,a
3189  0021 1a04          	or	a,(OFST+0,sp)
3190  0023 01            	rrwa	x,a
3191  0024 1a03          	or	a,(OFST-1,sp)
3192  0026 01            	rrwa	x,a
3193  0027 1f03          	ldw	(OFST-1,sp),x
3194                     ; 987   return (uint16_t)tmpccr1;
3196  0029 1e03          	ldw	x,(OFST-1,sp)
3199  002b 5b04          	addw	sp,#4
3200  002d 81            	ret
3252                     ; 995 uint16_t TIM2_GetCapture2(void)
3252                     ; 996 {
3253                     .text:	section	.text,new
3254  0000               _TIM2_GetCapture2:
3256  0000 5204          	subw	sp,#4
3257       00000004      OFST:	set	4
3260                     ; 998   uint16_t tmpccr2 = 0;
3262  0002 1e03          	ldw	x,(OFST-1,sp)
3263                     ; 999   uint8_t tmpccr2l=0, tmpccr2h=0;
3265  0004 7b01          	ld	a,(OFST-3,sp)
3266  0006 97            	ld	xl,a
3269  0007 7b02          	ld	a,(OFST-2,sp)
3270  0009 97            	ld	xl,a
3271                     ; 1001   tmpccr2h = TIM2->CCR2H;
3273  000a c65313        	ld	a,21267
3274  000d 6b02          	ld	(OFST-2,sp),a
3275                     ; 1002   tmpccr2l = TIM2->CCR2L;
3277  000f c65314        	ld	a,21268
3278  0012 6b01          	ld	(OFST-3,sp),a
3279                     ; 1004   tmpccr2 = (uint16_t)(tmpccr2l);
3281  0014 7b01          	ld	a,(OFST-3,sp)
3282  0016 5f            	clrw	x
3283  0017 97            	ld	xl,a
3284  0018 1f03          	ldw	(OFST-1,sp),x
3285                     ; 1005   tmpccr2 |= (uint16_t)((uint16_t)tmpccr2h << 8);
3287  001a 7b02          	ld	a,(OFST-2,sp)
3288  001c 5f            	clrw	x
3289  001d 97            	ld	xl,a
3290  001e 4f            	clr	a
3291  001f 02            	rlwa	x,a
3292  0020 01            	rrwa	x,a
3293  0021 1a04          	or	a,(OFST+0,sp)
3294  0023 01            	rrwa	x,a
3295  0024 1a03          	or	a,(OFST-1,sp)
3296  0026 01            	rrwa	x,a
3297  0027 1f03          	ldw	(OFST-1,sp),x
3298                     ; 1007   return (uint16_t)tmpccr2;
3300  0029 1e03          	ldw	x,(OFST-1,sp)
3303  002b 5b04          	addw	sp,#4
3304  002d 81            	ret
3356                     ; 1015 uint16_t TIM2_GetCapture3(void)
3356                     ; 1016 {
3357                     .text:	section	.text,new
3358  0000               _TIM2_GetCapture3:
3360  0000 5204          	subw	sp,#4
3361       00000004      OFST:	set	4
3364                     ; 1018   uint16_t tmpccr3 = 0;
3366  0002 1e03          	ldw	x,(OFST-1,sp)
3367                     ; 1019   uint8_t tmpccr3l=0, tmpccr3h=0;
3369  0004 7b01          	ld	a,(OFST-3,sp)
3370  0006 97            	ld	xl,a
3373  0007 7b02          	ld	a,(OFST-2,sp)
3374  0009 97            	ld	xl,a
3375                     ; 1021   tmpccr3h = TIM2->CCR3H;
3377  000a c65315        	ld	a,21269
3378  000d 6b02          	ld	(OFST-2,sp),a
3379                     ; 1022   tmpccr3l = TIM2->CCR3L;
3381  000f c65316        	ld	a,21270
3382  0012 6b01          	ld	(OFST-3,sp),a
3383                     ; 1024   tmpccr3 = (uint16_t)(tmpccr3l);
3385  0014 7b01          	ld	a,(OFST-3,sp)
3386  0016 5f            	clrw	x
3387  0017 97            	ld	xl,a
3388  0018 1f03          	ldw	(OFST-1,sp),x
3389                     ; 1025   tmpccr3 |= (uint16_t)((uint16_t)tmpccr3h << 8);
3391  001a 7b02          	ld	a,(OFST-2,sp)
3392  001c 5f            	clrw	x
3393  001d 97            	ld	xl,a
3394  001e 4f            	clr	a
3395  001f 02            	rlwa	x,a
3396  0020 01            	rrwa	x,a
3397  0021 1a04          	or	a,(OFST+0,sp)
3398  0023 01            	rrwa	x,a
3399  0024 1a03          	or	a,(OFST-1,sp)
3400  0026 01            	rrwa	x,a
3401  0027 1f03          	ldw	(OFST-1,sp),x
3402                     ; 1027   return (uint16_t)tmpccr3;
3404  0029 1e03          	ldw	x,(OFST-1,sp)
3407  002b 5b04          	addw	sp,#4
3408  002d 81            	ret
3442                     ; 1035 uint16_t TIM2_GetCounter(void)
3442                     ; 1036 {
3443                     .text:	section	.text,new
3444  0000               _TIM2_GetCounter:
3446  0000 89            	pushw	x
3447       00000002      OFST:	set	2
3450                     ; 1037   uint16_t tmpcntr = 0;
3452  0001 5f            	clrw	x
3453  0002 1f01          	ldw	(OFST-1,sp),x
3454                     ; 1039   tmpcntr =  ((uint16_t)TIM2->CNTRH << 8);
3456  0004 c6530c        	ld	a,21260
3457  0007 5f            	clrw	x
3458  0008 97            	ld	xl,a
3459  0009 4f            	clr	a
3460  000a 02            	rlwa	x,a
3461  000b 1f01          	ldw	(OFST-1,sp),x
3462                     ; 1041   return (uint16_t)( tmpcntr| (uint16_t)(TIM2->CNTRL));
3464  000d c6530d        	ld	a,21261
3465  0010 5f            	clrw	x
3466  0011 97            	ld	xl,a
3467  0012 01            	rrwa	x,a
3468  0013 1a02          	or	a,(OFST+0,sp)
3469  0015 01            	rrwa	x,a
3470  0016 1a01          	or	a,(OFST-1,sp)
3471  0018 01            	rrwa	x,a
3474  0019 5b02          	addw	sp,#2
3475  001b 81            	ret
3499                     ; 1049 TIM2_Prescaler_TypeDef TIM2_GetPrescaler(void)
3499                     ; 1050 {
3500                     .text:	section	.text,new
3501  0000               _TIM2_GetPrescaler:
3505                     ; 1052   return (TIM2_Prescaler_TypeDef)(TIM2->PSCR);
3507  0000 c6530e        	ld	a,21262
3510  0003 81            	ret
3649                     ; 1068 FlagStatus TIM2_GetFlagStatus(TIM2_FLAG_TypeDef TIM2_FLAG)
3649                     ; 1069 {
3650                     .text:	section	.text,new
3651  0000               _TIM2_GetFlagStatus:
3653  0000 89            	pushw	x
3654  0001 89            	pushw	x
3655       00000002      OFST:	set	2
3658                     ; 1070   FlagStatus bitstatus = RESET;
3660  0002 7b02          	ld	a,(OFST+0,sp)
3661  0004 97            	ld	xl,a
3662                     ; 1071   uint8_t tim2_flag_l = 0, tim2_flag_h = 0;
3664  0005 7b01          	ld	a,(OFST-1,sp)
3665  0007 97            	ld	xl,a
3668  0008 7b02          	ld	a,(OFST+0,sp)
3669  000a 97            	ld	xl,a
3670                     ; 1074   assert_param(IS_TIM2_GET_FLAG_OK(TIM2_FLAG));
3672                     ; 1076   tim2_flag_l = (uint8_t)(TIM2->SR1 & (uint8_t)TIM2_FLAG);
3674  000b c65304        	ld	a,21252
3675  000e 1404          	and	a,(OFST+2,sp)
3676  0010 6b01          	ld	(OFST-1,sp),a
3677                     ; 1077   tim2_flag_h = (uint8_t)((uint16_t)TIM2_FLAG >> 8);
3679  0012 7b03          	ld	a,(OFST+1,sp)
3680  0014 6b02          	ld	(OFST+0,sp),a
3681                     ; 1079   if ((tim2_flag_l | (uint8_t)(TIM2->SR2 & tim2_flag_h)) != (uint8_t)RESET )
3683  0016 c65305        	ld	a,21253
3684  0019 1402          	and	a,(OFST+0,sp)
3685  001b 1a01          	or	a,(OFST-1,sp)
3686  001d 2706          	jreq	L5371
3687                     ; 1081     bitstatus = SET;
3689  001f a601          	ld	a,#1
3690  0021 6b02          	ld	(OFST+0,sp),a
3692  0023 2002          	jra	L7371
3693  0025               L5371:
3694                     ; 1085     bitstatus = RESET;
3696  0025 0f02          	clr	(OFST+0,sp)
3697  0027               L7371:
3698                     ; 1087   return (FlagStatus)bitstatus;
3700  0027 7b02          	ld	a,(OFST+0,sp)
3703  0029 5b04          	addw	sp,#4
3704  002b 81            	ret
3739                     ; 1103 void TIM2_ClearFlag(TIM2_FLAG_TypeDef TIM2_FLAG)
3739                     ; 1104 {
3740                     .text:	section	.text,new
3741  0000               _TIM2_ClearFlag:
3745                     ; 1106   assert_param(IS_TIM2_CLEAR_FLAG_OK(TIM2_FLAG));
3747                     ; 1109   TIM2->SR1 = (uint8_t)(~((uint8_t)(TIM2_FLAG)));
3749  0000 9f            	ld	a,xl
3750  0001 43            	cpl	a
3751  0002 c75304        	ld	21252,a
3752                     ; 1110   TIM2->SR2 = (uint8_t)(~((uint8_t)((uint8_t)TIM2_FLAG >> 8)));
3754  0005 35ff5305      	mov	21253,#255
3755                     ; 1111 }
3758  0009 81            	ret
3822                     ; 1123 ITStatus TIM2_GetITStatus(TIM2_IT_TypeDef TIM2_IT)
3822                     ; 1124 {
3823                     .text:	section	.text,new
3824  0000               _TIM2_GetITStatus:
3826  0000 88            	push	a
3827  0001 89            	pushw	x
3828       00000002      OFST:	set	2
3831                     ; 1125   ITStatus bitstatus = RESET;
3833  0002 7b02          	ld	a,(OFST+0,sp)
3834  0004 97            	ld	xl,a
3835                     ; 1126   uint8_t TIM2_itStatus = 0, TIM2_itEnable = 0;
3837  0005 7b01          	ld	a,(OFST-1,sp)
3838  0007 97            	ld	xl,a
3841  0008 7b02          	ld	a,(OFST+0,sp)
3842  000a 97            	ld	xl,a
3843                     ; 1129   assert_param(IS_TIM2_GET_IT_OK(TIM2_IT));
3845                     ; 1131   TIM2_itStatus = (uint8_t)(TIM2->SR1 & TIM2_IT);
3847  000b c65304        	ld	a,21252
3848  000e 1403          	and	a,(OFST+1,sp)
3849  0010 6b01          	ld	(OFST-1,sp),a
3850                     ; 1133   TIM2_itEnable = (uint8_t)(TIM2->IER & TIM2_IT);
3852  0012 c65303        	ld	a,21251
3853  0015 1403          	and	a,(OFST+1,sp)
3854  0017 6b02          	ld	(OFST+0,sp),a
3855                     ; 1135   if ((TIM2_itStatus != (uint8_t)RESET ) && (TIM2_itEnable != (uint8_t)RESET ))
3857  0019 0d01          	tnz	(OFST-1,sp)
3858  001b 270a          	jreq	L1102
3860  001d 0d02          	tnz	(OFST+0,sp)
3861  001f 2706          	jreq	L1102
3862                     ; 1137     bitstatus = SET;
3864  0021 a601          	ld	a,#1
3865  0023 6b02          	ld	(OFST+0,sp),a
3867  0025 2002          	jra	L3102
3868  0027               L1102:
3869                     ; 1141     bitstatus = RESET;
3871  0027 0f02          	clr	(OFST+0,sp)
3872  0029               L3102:
3873                     ; 1143   return (ITStatus)(bitstatus);
3875  0029 7b02          	ld	a,(OFST+0,sp)
3878  002b 5b03          	addw	sp,#3
3879  002d 81            	ret
3915                     ; 1156 void TIM2_ClearITPendingBit(TIM2_IT_TypeDef TIM2_IT)
3915                     ; 1157 {
3916                     .text:	section	.text,new
3917  0000               _TIM2_ClearITPendingBit:
3921                     ; 1159   assert_param(IS_TIM2_IT_OK(TIM2_IT));
3923                     ; 1162   TIM2->SR1 = (uint8_t)(~TIM2_IT);
3925  0000 43            	cpl	a
3926  0001 c75304        	ld	21252,a
3927                     ; 1163 }
3930  0004 81            	ret
3982                     ; 1181 static void TI1_Config(uint8_t TIM2_ICPolarity,
3982                     ; 1182                        uint8_t TIM2_ICSelection,
3982                     ; 1183                        uint8_t TIM2_ICFilter)
3982                     ; 1184 {
3983                     .text:	section	.text,new
3984  0000               L3_TI1_Config:
3986  0000 89            	pushw	x
3987  0001 88            	push	a
3988       00000001      OFST:	set	1
3991                     ; 1186   TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1E);
3993  0002 7211530a      	bres	21258,#0
3994                     ; 1189   TIM2->CCMR1  = (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~(uint8_t)( TIM2_CCMR_CCxS | TIM2_CCMR_ICxF )))
3994                     ; 1190                            | (uint8_t)(((TIM2_ICSelection)) | ((uint8_t)( TIM2_ICFilter << 4))));
3996  0006 7b06          	ld	a,(OFST+5,sp)
3997  0008 97            	ld	xl,a
3998  0009 a610          	ld	a,#16
3999  000b 42            	mul	x,a
4000  000c 9f            	ld	a,xl
4001  000d 1a03          	or	a,(OFST+2,sp)
4002  000f 6b01          	ld	(OFST+0,sp),a
4003  0011 c65307        	ld	a,21255
4004  0014 a40c          	and	a,#12
4005  0016 1a01          	or	a,(OFST+0,sp)
4006  0018 c75307        	ld	21255,a
4007                     ; 1193   if (TIM2_ICPolarity != TIM2_ICPOLARITY_RISING)
4009  001b 0d02          	tnz	(OFST+1,sp)
4010  001d 2706          	jreq	L1602
4011                     ; 1195     TIM2->CCER1 |= TIM2_CCER1_CC1P;
4013  001f 7212530a      	bset	21258,#1
4015  0023 2004          	jra	L3602
4016  0025               L1602:
4017                     ; 1199     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1P);
4019  0025 7213530a      	bres	21258,#1
4020  0029               L3602:
4021                     ; 1202   TIM2->CCER1 |= TIM2_CCER1_CC1E;
4023  0029 7210530a      	bset	21258,#0
4024                     ; 1203 }
4027  002d 5b03          	addw	sp,#3
4028  002f 81            	ret
4080                     ; 1221 static void TI2_Config(uint8_t TIM2_ICPolarity,
4080                     ; 1222                        uint8_t TIM2_ICSelection,
4080                     ; 1223                        uint8_t TIM2_ICFilter)
4080                     ; 1224 {
4081                     .text:	section	.text,new
4082  0000               L5_TI2_Config:
4084  0000 89            	pushw	x
4085  0001 88            	push	a
4086       00000001      OFST:	set	1
4089                     ; 1226   TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2E);
4091  0002 7219530a      	bres	21258,#4
4092                     ; 1229   TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~(uint8_t)( TIM2_CCMR_CCxS | TIM2_CCMR_ICxF ))) 
4092                     ; 1230                           | (uint8_t)(( (TIM2_ICSelection)) | ((uint8_t)( TIM2_ICFilter << 4))));
4094  0006 7b06          	ld	a,(OFST+5,sp)
4095  0008 97            	ld	xl,a
4096  0009 a610          	ld	a,#16
4097  000b 42            	mul	x,a
4098  000c 9f            	ld	a,xl
4099  000d 1a03          	or	a,(OFST+2,sp)
4100  000f 6b01          	ld	(OFST+0,sp),a
4101  0011 c65308        	ld	a,21256
4102  0014 a40c          	and	a,#12
4103  0016 1a01          	or	a,(OFST+0,sp)
4104  0018 c75308        	ld	21256,a
4105                     ; 1234   if (TIM2_ICPolarity != TIM2_ICPOLARITY_RISING)
4107  001b 0d02          	tnz	(OFST+1,sp)
4108  001d 2706          	jreq	L3112
4109                     ; 1236     TIM2->CCER1 |= TIM2_CCER1_CC2P;
4111  001f 721a530a      	bset	21258,#5
4113  0023 2004          	jra	L5112
4114  0025               L3112:
4115                     ; 1240     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2P);
4117  0025 721b530a      	bres	21258,#5
4118  0029               L5112:
4119                     ; 1244   TIM2->CCER1 |= TIM2_CCER1_CC2E;
4121  0029 7218530a      	bset	21258,#4
4122                     ; 1245 }
4125  002d 5b03          	addw	sp,#3
4126  002f 81            	ret
4178                     ; 1261 static void TI3_Config(uint8_t TIM2_ICPolarity, uint8_t TIM2_ICSelection,
4178                     ; 1262                        uint8_t TIM2_ICFilter)
4178                     ; 1263 {
4179                     .text:	section	.text,new
4180  0000               L7_TI3_Config:
4182  0000 89            	pushw	x
4183  0001 88            	push	a
4184       00000001      OFST:	set	1
4187                     ; 1265   TIM2->CCER2 &=  (uint8_t)(~TIM2_CCER2_CC3E);
4189  0002 7211530b      	bres	21259,#0
4190                     ; 1268   TIM2->CCMR3 = (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~( TIM2_CCMR_CCxS | TIM2_CCMR_ICxF))) 
4190                     ; 1269                           | (uint8_t)(( (TIM2_ICSelection)) | ((uint8_t)( TIM2_ICFilter << 4))));
4192  0006 7b06          	ld	a,(OFST+5,sp)
4193  0008 97            	ld	xl,a
4194  0009 a610          	ld	a,#16
4195  000b 42            	mul	x,a
4196  000c 9f            	ld	a,xl
4197  000d 1a03          	or	a,(OFST+2,sp)
4198  000f 6b01          	ld	(OFST+0,sp),a
4199  0011 c65309        	ld	a,21257
4200  0014 a40c          	and	a,#12
4201  0016 1a01          	or	a,(OFST+0,sp)
4202  0018 c75309        	ld	21257,a
4203                     ; 1273   if (TIM2_ICPolarity != TIM2_ICPOLARITY_RISING)
4205  001b 0d02          	tnz	(OFST+1,sp)
4206  001d 2706          	jreq	L5412
4207                     ; 1275     TIM2->CCER2 |= TIM2_CCER2_CC3P;
4209  001f 7212530b      	bset	21259,#1
4211  0023 2004          	jra	L7412
4212  0025               L5412:
4213                     ; 1279     TIM2->CCER2 &= (uint8_t)(~TIM2_CCER2_CC3P);
4215  0025 7213530b      	bres	21259,#1
4216  0029               L7412:
4217                     ; 1282   TIM2->CCER2 |= TIM2_CCER2_CC3E;
4219  0029 7210530b      	bset	21259,#0
4220                     ; 1283 }
4223  002d 5b03          	addw	sp,#3
4224  002f 81            	ret
4237                     	xdef	_TIM2_ClearITPendingBit
4238                     	xdef	_TIM2_GetITStatus
4239                     	xdef	_TIM2_ClearFlag
4240                     	xdef	_TIM2_GetFlagStatus
4241                     	xdef	_TIM2_GetPrescaler
4242                     	xdef	_TIM2_GetCounter
4243                     	xdef	_TIM2_GetCapture3
4244                     	xdef	_TIM2_GetCapture2
4245                     	xdef	_TIM2_GetCapture1
4246                     	xdef	_TIM2_SetIC3Prescaler
4247                     	xdef	_TIM2_SetIC2Prescaler
4248                     	xdef	_TIM2_SetIC1Prescaler
4249                     	xdef	_TIM2_SetCompare3
4250                     	xdef	_TIM2_SetCompare2
4251                     	xdef	_TIM2_SetCompare1
4252                     	xdef	_TIM2_SetAutoreload
4253                     	xdef	_TIM2_SetCounter
4254                     	xdef	_TIM2_SelectOCxM
4255                     	xdef	_TIM2_CCxCmd
4256                     	xdef	_TIM2_OC3PolarityConfig
4257                     	xdef	_TIM2_OC2PolarityConfig
4258                     	xdef	_TIM2_OC1PolarityConfig
4259                     	xdef	_TIM2_GenerateEvent
4260                     	xdef	_TIM2_OC3PreloadConfig
4261                     	xdef	_TIM2_OC2PreloadConfig
4262                     	xdef	_TIM2_OC1PreloadConfig
4263                     	xdef	_TIM2_ARRPreloadConfig
4264                     	xdef	_TIM2_ForcedOC3Config
4265                     	xdef	_TIM2_ForcedOC2Config
4266                     	xdef	_TIM2_ForcedOC1Config
4267                     	xdef	_TIM2_PrescalerConfig
4268                     	xdef	_TIM2_SelectOnePulseMode
4269                     	xdef	_TIM2_UpdateRequestConfig
4270                     	xdef	_TIM2_UpdateDisableConfig
4271                     	xdef	_TIM2_ITConfig
4272                     	xdef	_TIM2_Cmd
4273                     	xdef	_TIM2_PWMIConfig
4274                     	xdef	_TIM2_ICInit
4275                     	xdef	_TIM2_OC3Init
4276                     	xdef	_TIM2_OC2Init
4277                     	xdef	_TIM2_OC1Init
4278                     	xdef	_TIM2_TimeBaseInit
4279                     	xdef	_TIM2_DeInit
4298                     	end
