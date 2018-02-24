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
 166                     ; 65 void TIM4_TimeBaseInit(TIM4_Prescaler_TypeDef TIM4_Prescaler, uint8_t TIM4_Period)
 166                     ; 66 {
 167                     .text:	section	.text,new
 168  0000               _TIM4_TimeBaseInit:
 172                     ; 68   assert_param(IS_TIM4_PRESCALER_OK(TIM4_Prescaler));
 174                     ; 70   TIM4->PSCR = (uint8_t)(TIM4_Prescaler);
 176  0000 9e            	ld	a,xh
 177  0001 c75347        	ld	21319,a
 178                     ; 72   TIM4->ARR = (uint8_t)(TIM4_Period);
 180  0004 9f            	ld	a,xl
 181  0005 c75348        	ld	21320,a
 182                     ; 73 }
 185  0008 81            	ret
 240                     ; 81 void TIM4_Cmd(FunctionalState NewState)
 240                     ; 82 {
 241                     .text:	section	.text,new
 242  0000               _TIM4_Cmd:
 246                     ; 84   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 248                     ; 87   if (NewState != DISABLE)
 250  0000 4d            	tnz	a
 251  0001 2706          	jreq	L511
 252                     ; 89     TIM4->CR1 |= TIM4_CR1_CEN;
 254  0003 72105340      	bset	21312,#0
 256  0007 2004          	jra	L711
 257  0009               L511:
 258                     ; 93     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_CEN);
 260  0009 72115340      	bres	21312,#0
 261  000d               L711:
 262                     ; 95 }
 265  000d 81            	ret
 323                     ; 107 void TIM4_ITConfig(TIM4_IT_TypeDef TIM4_IT, FunctionalState NewState)
 323                     ; 108 {
 324                     .text:	section	.text,new
 325  0000               _TIM4_ITConfig:
 327  0000 89            	pushw	x
 328       00000000      OFST:	set	0
 331                     ; 110   assert_param(IS_TIM4_IT_OK(TIM4_IT));
 333                     ; 111   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 335                     ; 113   if (NewState != DISABLE)
 337  0001 9f            	ld	a,xl
 338  0002 4d            	tnz	a
 339  0003 2709          	jreq	L151
 340                     ; 116     TIM4->IER |= (uint8_t)TIM4_IT;
 342  0005 9e            	ld	a,xh
 343  0006 ca5343        	or	a,21315
 344  0009 c75343        	ld	21315,a
 346  000c 2009          	jra	L351
 347  000e               L151:
 348                     ; 121     TIM4->IER &= (uint8_t)(~TIM4_IT);
 350  000e 7b01          	ld	a,(OFST+1,sp)
 351  0010 43            	cpl	a
 352  0011 c45343        	and	a,21315
 353  0014 c75343        	ld	21315,a
 354  0017               L351:
 355                     ; 123 }
 358  0017 85            	popw	x
 359  0018 81            	ret
 395                     ; 131 void TIM4_UpdateDisableConfig(FunctionalState NewState)
 395                     ; 132 {
 396                     .text:	section	.text,new
 397  0000               _TIM4_UpdateDisableConfig:
 401                     ; 134   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 403                     ; 137   if (NewState != DISABLE)
 405  0000 4d            	tnz	a
 406  0001 2706          	jreq	L371
 407                     ; 139     TIM4->CR1 |= TIM4_CR1_UDIS;
 409  0003 72125340      	bset	21312,#1
 411  0007 2004          	jra	L571
 412  0009               L371:
 413                     ; 143     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_UDIS);
 415  0009 72135340      	bres	21312,#1
 416  000d               L571:
 417                     ; 145 }
 420  000d 81            	ret
 478                     ; 155 void TIM4_UpdateRequestConfig(TIM4_UpdateSource_TypeDef TIM4_UpdateSource)
 478                     ; 156 {
 479                     .text:	section	.text,new
 480  0000               _TIM4_UpdateRequestConfig:
 484                     ; 158   assert_param(IS_TIM4_UPDATE_SOURCE_OK(TIM4_UpdateSource));
 486                     ; 161   if (TIM4_UpdateSource != TIM4_UPDATESOURCE_GLOBAL)
 488  0000 4d            	tnz	a
 489  0001 2706          	jreq	L522
 490                     ; 163     TIM4->CR1 |= TIM4_CR1_URS;
 492  0003 72145340      	bset	21312,#2
 494  0007 2004          	jra	L722
 495  0009               L522:
 496                     ; 167     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_URS);
 498  0009 72155340      	bres	21312,#2
 499  000d               L722:
 500                     ; 169 }
 503  000d 81            	ret
 560                     ; 179 void TIM4_SelectOnePulseMode(TIM4_OPMode_TypeDef TIM4_OPMode)
 560                     ; 180 {
 561                     .text:	section	.text,new
 562  0000               _TIM4_SelectOnePulseMode:
 566                     ; 182   assert_param(IS_TIM4_OPM_MODE_OK(TIM4_OPMode));
 568                     ; 185   if (TIM4_OPMode != TIM4_OPMODE_REPETITIVE)
 570  0000 4d            	tnz	a
 571  0001 2706          	jreq	L752
 572                     ; 187     TIM4->CR1 |= TIM4_CR1_OPM;
 574  0003 72165340      	bset	21312,#3
 576  0007 2004          	jra	L162
 577  0009               L752:
 578                     ; 191     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_OPM);
 580  0009 72175340      	bres	21312,#3
 581  000d               L162:
 582                     ; 193 }
 585  000d 81            	ret
 653                     ; 215 void TIM4_PrescalerConfig(TIM4_Prescaler_TypeDef Prescaler, TIM4_PSCReloadMode_TypeDef TIM4_PSCReloadMode)
 653                     ; 216 {
 654                     .text:	section	.text,new
 655  0000               _TIM4_PrescalerConfig:
 659                     ; 218   assert_param(IS_TIM4_PRESCALER_RELOAD_OK(TIM4_PSCReloadMode));
 661                     ; 219   assert_param(IS_TIM4_PRESCALER_OK(Prescaler));
 663                     ; 222   TIM4->PSCR = (uint8_t)Prescaler;
 665  0000 9e            	ld	a,xh
 666  0001 c75347        	ld	21319,a
 667                     ; 225   TIM4->EGR = (uint8_t)TIM4_PSCReloadMode;
 669  0004 9f            	ld	a,xl
 670  0005 c75345        	ld	21317,a
 671                     ; 226 }
 674  0008 81            	ret
 710                     ; 234 void TIM4_ARRPreloadConfig(FunctionalState NewState)
 710                     ; 235 {
 711                     .text:	section	.text,new
 712  0000               _TIM4_ARRPreloadConfig:
 716                     ; 237   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 718                     ; 240   if (NewState != DISABLE)
 720  0000 4d            	tnz	a
 721  0001 2706          	jreq	L333
 722                     ; 242     TIM4->CR1 |= TIM4_CR1_ARPE;
 724  0003 721e5340      	bset	21312,#7
 726  0007 2004          	jra	L533
 727  0009               L333:
 728                     ; 246     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_ARPE);
 730  0009 721f5340      	bres	21312,#7
 731  000d               L533:
 732                     ; 248 }
 735  000d 81            	ret
 784                     ; 257 void TIM4_GenerateEvent(TIM4_EventSource_TypeDef TIM4_EventSource)
 784                     ; 258 {
 785                     .text:	section	.text,new
 786  0000               _TIM4_GenerateEvent:
 790                     ; 260   assert_param(IS_TIM4_EVENT_SOURCE_OK(TIM4_EventSource));
 792                     ; 263   TIM4->EGR = (uint8_t)(TIM4_EventSource);
 794  0000 c75345        	ld	21317,a
 795                     ; 264 }
 798  0003 81            	ret
 832                     ; 272 void TIM4_SetCounter(uint8_t Counter)
 832                     ; 273 {
 833                     .text:	section	.text,new
 834  0000               _TIM4_SetCounter:
 838                     ; 275   TIM4->CNTR = (uint8_t)(Counter);
 840  0000 c75346        	ld	21318,a
 841                     ; 276 }
 844  0003 81            	ret
 878                     ; 284 void TIM4_SetAutoreload(uint8_t Autoreload)
 878                     ; 285 {
 879                     .text:	section	.text,new
 880  0000               _TIM4_SetAutoreload:
 884                     ; 287   TIM4->ARR = (uint8_t)(Autoreload);
 886  0000 c75348        	ld	21320,a
 887                     ; 288 }
 890  0003 81            	ret
 913                     ; 295 uint8_t TIM4_GetCounter(void)
 913                     ; 296 {
 914                     .text:	section	.text,new
 915  0000               _TIM4_GetCounter:
 919                     ; 298   return (uint8_t)(TIM4->CNTR);
 921  0000 c65346        	ld	a,21318
 924  0003 81            	ret
 948                     ; 306 TIM4_Prescaler_TypeDef TIM4_GetPrescaler(void)
 948                     ; 307 {
 949                     .text:	section	.text,new
 950  0000               _TIM4_GetPrescaler:
 954                     ; 309   return (TIM4_Prescaler_TypeDef)(TIM4->PSCR);
 956  0000 c65347        	ld	a,21319
 959  0003 81            	ret
1038                     ; 319 FlagStatus TIM4_GetFlagStatus(TIM4_FLAG_TypeDef TIM4_FLAG)
1038                     ; 320 {
1039                     .text:	section	.text,new
1040  0000               _TIM4_GetFlagStatus:
1042  0000 88            	push	a
1043       00000001      OFST:	set	1
1046                     ; 321   FlagStatus bitstatus = RESET;
1048  0001 0f01          	clr	(OFST+0,sp)
1049                     ; 324   assert_param(IS_TIM4_GET_FLAG_OK(TIM4_FLAG));
1051                     ; 326   if ((TIM4->SR1 & (uint8_t)TIM4_FLAG)  != 0)
1053  0003 c45344        	and	a,21316
1054  0006 2706          	jreq	L774
1055                     ; 328     bitstatus = SET;
1057  0008 a601          	ld	a,#1
1058  000a 6b01          	ld	(OFST+0,sp),a
1060  000c 2002          	jra	L105
1061  000e               L774:
1062                     ; 332     bitstatus = RESET;
1064  000e 0f01          	clr	(OFST+0,sp)
1065  0010               L105:
1066                     ; 334   return ((FlagStatus)bitstatus);
1068  0010 7b01          	ld	a,(OFST+0,sp)
1071  0012 5b01          	addw	sp,#1
1072  0014 81            	ret
1107                     ; 344 void TIM4_ClearFlag(TIM4_FLAG_TypeDef TIM4_FLAG)
1107                     ; 345 {
1108                     .text:	section	.text,new
1109  0000               _TIM4_ClearFlag:
1113                     ; 347   assert_param(IS_TIM4_GET_FLAG_OK(TIM4_FLAG));
1115                     ; 350   TIM4->SR1 = (uint8_t)(~TIM4_FLAG);
1117  0000 43            	cpl	a
1118  0001 c75344        	ld	21316,a
1119                     ; 351 }
1122  0004 81            	ret
1186                     ; 360 ITStatus TIM4_GetITStatus(TIM4_IT_TypeDef TIM4_IT)
1186                     ; 361 {
1187                     .text:	section	.text,new
1188  0000               _TIM4_GetITStatus:
1190  0000 88            	push	a
1191  0001 89            	pushw	x
1192       00000002      OFST:	set	2
1195                     ; 362   ITStatus bitstatus = RESET;
1197  0002 7b02          	ld	a,(OFST+0,sp)
1198  0004 97            	ld	xl,a
1199                     ; 364   uint8_t itstatus = 0x0, itenable = 0x0;
1201  0005 7b01          	ld	a,(OFST-1,sp)
1202  0007 97            	ld	xl,a
1205  0008 7b02          	ld	a,(OFST+0,sp)
1206  000a 97            	ld	xl,a
1207                     ; 367   assert_param(IS_TIM4_IT_OK(TIM4_IT));
1209                     ; 369   itstatus = (uint8_t)(TIM4->SR1 & (uint8_t)TIM4_IT);
1211  000b c65344        	ld	a,21316
1212  000e 1403          	and	a,(OFST+1,sp)
1213  0010 6b01          	ld	(OFST-1,sp),a
1214                     ; 371   itenable = (uint8_t)(TIM4->IER & (uint8_t)TIM4_IT);
1216  0012 c65343        	ld	a,21315
1217  0015 1403          	and	a,(OFST+1,sp)
1218  0017 6b02          	ld	(OFST+0,sp),a
1219                     ; 373   if ((itstatus != (uint8_t)RESET ) && (itenable != (uint8_t)RESET ))
1221  0019 0d01          	tnz	(OFST-1,sp)
1222  001b 270a          	jreq	L355
1224  001d 0d02          	tnz	(OFST+0,sp)
1225  001f 2706          	jreq	L355
1226                     ; 375     bitstatus = (ITStatus)SET;
1228  0021 a601          	ld	a,#1
1229  0023 6b02          	ld	(OFST+0,sp),a
1231  0025 2002          	jra	L555
1232  0027               L355:
1233                     ; 379     bitstatus = (ITStatus)RESET;
1235  0027 0f02          	clr	(OFST+0,sp)
1236  0029               L555:
1237                     ; 381   return ((ITStatus)bitstatus);
1239  0029 7b02          	ld	a,(OFST+0,sp)
1242  002b 5b03          	addw	sp,#3
1243  002d 81            	ret
1279                     ; 391 void TIM4_ClearITPendingBit(TIM4_IT_TypeDef TIM4_IT)
1279                     ; 392 {
1280                     .text:	section	.text,new
1281  0000               _TIM4_ClearITPendingBit:
1285                     ; 394   assert_param(IS_TIM4_IT_OK(TIM4_IT));
1287                     ; 397   TIM4->SR1 = (uint8_t)(~TIM4_IT);
1289  0000 43            	cpl	a
1290  0001 c75344        	ld	21316,a
1291                     ; 398 }
1294  0004 81            	ret
1307                     	xdef	_TIM4_ClearITPendingBit
1308                     	xdef	_TIM4_GetITStatus
1309                     	xdef	_TIM4_ClearFlag
1310                     	xdef	_TIM4_GetFlagStatus
1311                     	xdef	_TIM4_GetPrescaler
1312                     	xdef	_TIM4_GetCounter
1313                     	xdef	_TIM4_SetAutoreload
1314                     	xdef	_TIM4_SetCounter
1315                     	xdef	_TIM4_GenerateEvent
1316                     	xdef	_TIM4_ARRPreloadConfig
1317                     	xdef	_TIM4_PrescalerConfig
1318                     	xdef	_TIM4_SelectOnePulseMode
1319                     	xdef	_TIM4_UpdateRequestConfig
1320                     	xdef	_TIM4_UpdateDisableConfig
1321                     	xdef	_TIM4_ITConfig
1322                     	xdef	_TIM4_Cmd
1323                     	xdef	_TIM4_TimeBaseInit
1324                     	xdef	_TIM4_DeInit
1343                     	end
