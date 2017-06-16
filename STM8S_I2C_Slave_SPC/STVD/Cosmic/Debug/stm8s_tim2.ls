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
 457                     ; 108 void TIM2_OC1Init(TIM2_OCMode_TypeDef TIM2_OCMode,
 457                     ; 109                   TIM2_OutputState_TypeDef TIM2_OutputState,
 457                     ; 110                   uint16_t TIM2_Pulse,
 457                     ; 111                   TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
 457                     ; 112 {
 458                     .text:	section	.text,new
 459  0000               _TIM2_OC1Init:
 461  0000 89            	pushw	x
 462  0001 88            	push	a
 463       00000001      OFST:	set	1
 466                     ; 114   assert_param(IS_TIM2_OC_MODE_OK(TIM2_OCMode));
 468  0002 9e            	ld	a,xh
 469  0003 4d            	tnz	a
 470  0004 2719          	jreq	L41
 471  0006 9e            	ld	a,xh
 472  0007 a110          	cp	a,#16
 473  0009 2714          	jreq	L41
 474  000b 9e            	ld	a,xh
 475  000c a120          	cp	a,#32
 476  000e 270f          	jreq	L41
 477  0010 9e            	ld	a,xh
 478  0011 a130          	cp	a,#48
 479  0013 270a          	jreq	L41
 480  0015 9e            	ld	a,xh
 481  0016 a160          	cp	a,#96
 482  0018 2705          	jreq	L41
 483  001a 9e            	ld	a,xh
 484  001b a170          	cp	a,#112
 485  001d 2603          	jrne	L21
 486  001f               L41:
 487  001f 4f            	clr	a
 488  0020 2010          	jra	L61
 489  0022               L21:
 490  0022 ae0072        	ldw	x,#114
 491  0025 89            	pushw	x
 492  0026 ae0000        	ldw	x,#0
 493  0029 89            	pushw	x
 494  002a ae0000        	ldw	x,#L702
 495  002d cd0000        	call	_assert_failed
 497  0030 5b04          	addw	sp,#4
 498  0032               L61:
 499                     ; 115   assert_param(IS_TIM2_OUTPUT_STATE_OK(TIM2_OutputState));
 501  0032 0d03          	tnz	(OFST+2,sp)
 502  0034 2706          	jreq	L22
 503  0036 7b03          	ld	a,(OFST+2,sp)
 504  0038 a111          	cp	a,#17
 505  003a 2603          	jrne	L02
 506  003c               L22:
 507  003c 4f            	clr	a
 508  003d 2010          	jra	L42
 509  003f               L02:
 510  003f ae0073        	ldw	x,#115
 511  0042 89            	pushw	x
 512  0043 ae0000        	ldw	x,#0
 513  0046 89            	pushw	x
 514  0047 ae0000        	ldw	x,#L702
 515  004a cd0000        	call	_assert_failed
 517  004d 5b04          	addw	sp,#4
 518  004f               L42:
 519                     ; 116   assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
 521  004f 0d08          	tnz	(OFST+7,sp)
 522  0051 2706          	jreq	L03
 523  0053 7b08          	ld	a,(OFST+7,sp)
 524  0055 a122          	cp	a,#34
 525  0057 2603          	jrne	L62
 526  0059               L03:
 527  0059 4f            	clr	a
 528  005a 2010          	jra	L23
 529  005c               L62:
 530  005c ae0074        	ldw	x,#116
 531  005f 89            	pushw	x
 532  0060 ae0000        	ldw	x,#0
 533  0063 89            	pushw	x
 534  0064 ae0000        	ldw	x,#L702
 535  0067 cd0000        	call	_assert_failed
 537  006a 5b04          	addw	sp,#4
 538  006c               L23:
 539                     ; 119   TIM2->CCER1 &= (uint8_t)(~( TIM2_CCER1_CC1E | TIM2_CCER1_CC1P));
 541  006c c6530a        	ld	a,21258
 542  006f a4fc          	and	a,#252
 543  0071 c7530a        	ld	21258,a
 544                     ; 121   TIM2->CCER1 |= (uint8_t)((uint8_t)(TIM2_OutputState & TIM2_CCER1_CC1E ) | 
 544                     ; 122                            (uint8_t)(TIM2_OCPolarity & TIM2_CCER1_CC1P));
 546  0074 7b08          	ld	a,(OFST+7,sp)
 547  0076 a402          	and	a,#2
 548  0078 6b01          	ld	(OFST+0,sp),a
 549  007a 7b03          	ld	a,(OFST+2,sp)
 550  007c a401          	and	a,#1
 551  007e 1a01          	or	a,(OFST+0,sp)
 552  0080 ca530a        	or	a,21258
 553  0083 c7530a        	ld	21258,a
 554                     ; 125   TIM2->CCMR1 = (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~TIM2_CCMR_OCM)) |
 554                     ; 126                           (uint8_t)TIM2_OCMode);
 556  0086 c65307        	ld	a,21255
 557  0089 a48f          	and	a,#143
 558  008b 1a02          	or	a,(OFST+1,sp)
 559  008d c75307        	ld	21255,a
 560                     ; 129   TIM2->CCR1H = (uint8_t)(TIM2_Pulse >> 8);
 562  0090 7b06          	ld	a,(OFST+5,sp)
 563  0092 c75311        	ld	21265,a
 564                     ; 130   TIM2->CCR1L = (uint8_t)(TIM2_Pulse);
 566  0095 7b07          	ld	a,(OFST+6,sp)
 567  0097 c75312        	ld	21266,a
 568                     ; 131 }
 571  009a 5b03          	addw	sp,#3
 572  009c 81            	ret
 637                     ; 142 void TIM2_OC2Init(TIM2_OCMode_TypeDef TIM2_OCMode,
 637                     ; 143                   TIM2_OutputState_TypeDef TIM2_OutputState,
 637                     ; 144                   uint16_t TIM2_Pulse,
 637                     ; 145                   TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
 637                     ; 146 {
 638                     .text:	section	.text,new
 639  0000               _TIM2_OC2Init:
 641  0000 89            	pushw	x
 642  0001 88            	push	a
 643       00000001      OFST:	set	1
 646                     ; 148   assert_param(IS_TIM2_OC_MODE_OK(TIM2_OCMode));
 648  0002 9e            	ld	a,xh
 649  0003 4d            	tnz	a
 650  0004 2719          	jreq	L04
 651  0006 9e            	ld	a,xh
 652  0007 a110          	cp	a,#16
 653  0009 2714          	jreq	L04
 654  000b 9e            	ld	a,xh
 655  000c a120          	cp	a,#32
 656  000e 270f          	jreq	L04
 657  0010 9e            	ld	a,xh
 658  0011 a130          	cp	a,#48
 659  0013 270a          	jreq	L04
 660  0015 9e            	ld	a,xh
 661  0016 a160          	cp	a,#96
 662  0018 2705          	jreq	L04
 663  001a 9e            	ld	a,xh
 664  001b a170          	cp	a,#112
 665  001d 2603          	jrne	L63
 666  001f               L04:
 667  001f 4f            	clr	a
 668  0020 2010          	jra	L24
 669  0022               L63:
 670  0022 ae0094        	ldw	x,#148
 671  0025 89            	pushw	x
 672  0026 ae0000        	ldw	x,#0
 673  0029 89            	pushw	x
 674  002a ae0000        	ldw	x,#L702
 675  002d cd0000        	call	_assert_failed
 677  0030 5b04          	addw	sp,#4
 678  0032               L24:
 679                     ; 149   assert_param(IS_TIM2_OUTPUT_STATE_OK(TIM2_OutputState));
 681  0032 0d03          	tnz	(OFST+2,sp)
 682  0034 2706          	jreq	L64
 683  0036 7b03          	ld	a,(OFST+2,sp)
 684  0038 a111          	cp	a,#17
 685  003a 2603          	jrne	L44
 686  003c               L64:
 687  003c 4f            	clr	a
 688  003d 2010          	jra	L05
 689  003f               L44:
 690  003f ae0095        	ldw	x,#149
 691  0042 89            	pushw	x
 692  0043 ae0000        	ldw	x,#0
 693  0046 89            	pushw	x
 694  0047 ae0000        	ldw	x,#L702
 695  004a cd0000        	call	_assert_failed
 697  004d 5b04          	addw	sp,#4
 698  004f               L05:
 699                     ; 150   assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
 701  004f 0d08          	tnz	(OFST+7,sp)
 702  0051 2706          	jreq	L45
 703  0053 7b08          	ld	a,(OFST+7,sp)
 704  0055 a122          	cp	a,#34
 705  0057 2603          	jrne	L25
 706  0059               L45:
 707  0059 4f            	clr	a
 708  005a 2010          	jra	L65
 709  005c               L25:
 710  005c ae0096        	ldw	x,#150
 711  005f 89            	pushw	x
 712  0060 ae0000        	ldw	x,#0
 713  0063 89            	pushw	x
 714  0064 ae0000        	ldw	x,#L702
 715  0067 cd0000        	call	_assert_failed
 717  006a 5b04          	addw	sp,#4
 718  006c               L65:
 719                     ; 154   TIM2->CCER1 &= (uint8_t)(~( TIM2_CCER1_CC2E |  TIM2_CCER1_CC2P ));
 721  006c c6530a        	ld	a,21258
 722  006f a4cf          	and	a,#207
 723  0071 c7530a        	ld	21258,a
 724                     ; 156   TIM2->CCER1 |= (uint8_t)((uint8_t)(TIM2_OutputState  & TIM2_CCER1_CC2E ) |
 724                     ; 157                            (uint8_t)(TIM2_OCPolarity & TIM2_CCER1_CC2P));
 726  0074 7b08          	ld	a,(OFST+7,sp)
 727  0076 a420          	and	a,#32
 728  0078 6b01          	ld	(OFST+0,sp),a
 729  007a 7b03          	ld	a,(OFST+2,sp)
 730  007c a410          	and	a,#16
 731  007e 1a01          	or	a,(OFST+0,sp)
 732  0080 ca530a        	or	a,21258
 733  0083 c7530a        	ld	21258,a
 734                     ; 161   TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~TIM2_CCMR_OCM)) | 
 734                     ; 162                           (uint8_t)TIM2_OCMode);
 736  0086 c65308        	ld	a,21256
 737  0089 a48f          	and	a,#143
 738  008b 1a02          	or	a,(OFST+1,sp)
 739  008d c75308        	ld	21256,a
 740                     ; 166   TIM2->CCR2H = (uint8_t)(TIM2_Pulse >> 8);
 742  0090 7b06          	ld	a,(OFST+5,sp)
 743  0092 c75313        	ld	21267,a
 744                     ; 167   TIM2->CCR2L = (uint8_t)(TIM2_Pulse);
 746  0095 7b07          	ld	a,(OFST+6,sp)
 747  0097 c75314        	ld	21268,a
 748                     ; 168 }
 751  009a 5b03          	addw	sp,#3
 752  009c 81            	ret
 817                     ; 179 void TIM2_OC3Init(TIM2_OCMode_TypeDef TIM2_OCMode,
 817                     ; 180                   TIM2_OutputState_TypeDef TIM2_OutputState,
 817                     ; 181                   uint16_t TIM2_Pulse,
 817                     ; 182                   TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
 817                     ; 183 {
 818                     .text:	section	.text,new
 819  0000               _TIM2_OC3Init:
 821  0000 89            	pushw	x
 822  0001 88            	push	a
 823       00000001      OFST:	set	1
 826                     ; 185   assert_param(IS_TIM2_OC_MODE_OK(TIM2_OCMode));
 828  0002 9e            	ld	a,xh
 829  0003 4d            	tnz	a
 830  0004 2719          	jreq	L46
 831  0006 9e            	ld	a,xh
 832  0007 a110          	cp	a,#16
 833  0009 2714          	jreq	L46
 834  000b 9e            	ld	a,xh
 835  000c a120          	cp	a,#32
 836  000e 270f          	jreq	L46
 837  0010 9e            	ld	a,xh
 838  0011 a130          	cp	a,#48
 839  0013 270a          	jreq	L46
 840  0015 9e            	ld	a,xh
 841  0016 a160          	cp	a,#96
 842  0018 2705          	jreq	L46
 843  001a 9e            	ld	a,xh
 844  001b a170          	cp	a,#112
 845  001d 2603          	jrne	L26
 846  001f               L46:
 847  001f 4f            	clr	a
 848  0020 2010          	jra	L66
 849  0022               L26:
 850  0022 ae00b9        	ldw	x,#185
 851  0025 89            	pushw	x
 852  0026 ae0000        	ldw	x,#0
 853  0029 89            	pushw	x
 854  002a ae0000        	ldw	x,#L702
 855  002d cd0000        	call	_assert_failed
 857  0030 5b04          	addw	sp,#4
 858  0032               L66:
 859                     ; 186   assert_param(IS_TIM2_OUTPUT_STATE_OK(TIM2_OutputState));
 861  0032 0d03          	tnz	(OFST+2,sp)
 862  0034 2706          	jreq	L27
 863  0036 7b03          	ld	a,(OFST+2,sp)
 864  0038 a111          	cp	a,#17
 865  003a 2603          	jrne	L07
 866  003c               L27:
 867  003c 4f            	clr	a
 868  003d 2010          	jra	L47
 869  003f               L07:
 870  003f ae00ba        	ldw	x,#186
 871  0042 89            	pushw	x
 872  0043 ae0000        	ldw	x,#0
 873  0046 89            	pushw	x
 874  0047 ae0000        	ldw	x,#L702
 875  004a cd0000        	call	_assert_failed
 877  004d 5b04          	addw	sp,#4
 878  004f               L47:
 879                     ; 187   assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
 881  004f 0d08          	tnz	(OFST+7,sp)
 882  0051 2706          	jreq	L001
 883  0053 7b08          	ld	a,(OFST+7,sp)
 884  0055 a122          	cp	a,#34
 885  0057 2603          	jrne	L67
 886  0059               L001:
 887  0059 4f            	clr	a
 888  005a 2010          	jra	L201
 889  005c               L67:
 890  005c ae00bb        	ldw	x,#187
 891  005f 89            	pushw	x
 892  0060 ae0000        	ldw	x,#0
 893  0063 89            	pushw	x
 894  0064 ae0000        	ldw	x,#L702
 895  0067 cd0000        	call	_assert_failed
 897  006a 5b04          	addw	sp,#4
 898  006c               L201:
 899                     ; 189   TIM2->CCER2 &= (uint8_t)(~( TIM2_CCER2_CC3E  | TIM2_CCER2_CC3P));
 901  006c c6530b        	ld	a,21259
 902  006f a4fc          	and	a,#252
 903  0071 c7530b        	ld	21259,a
 904                     ; 191   TIM2->CCER2 |= (uint8_t)((uint8_t)(TIM2_OutputState & TIM2_CCER2_CC3E) |  
 904                     ; 192                            (uint8_t)(TIM2_OCPolarity & TIM2_CCER2_CC3P));
 906  0074 7b08          	ld	a,(OFST+7,sp)
 907  0076 a402          	and	a,#2
 908  0078 6b01          	ld	(OFST+0,sp),a
 909  007a 7b03          	ld	a,(OFST+2,sp)
 910  007c a401          	and	a,#1
 911  007e 1a01          	or	a,(OFST+0,sp)
 912  0080 ca530b        	or	a,21259
 913  0083 c7530b        	ld	21259,a
 914                     ; 195   TIM2->CCMR3 = (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~TIM2_CCMR_OCM)) |
 914                     ; 196                           (uint8_t)TIM2_OCMode);
 916  0086 c65309        	ld	a,21257
 917  0089 a48f          	and	a,#143
 918  008b 1a02          	or	a,(OFST+1,sp)
 919  008d c75309        	ld	21257,a
 920                     ; 199   TIM2->CCR3H = (uint8_t)(TIM2_Pulse >> 8);
 922  0090 7b06          	ld	a,(OFST+5,sp)
 923  0092 c75315        	ld	21269,a
 924                     ; 200   TIM2->CCR3L = (uint8_t)(TIM2_Pulse);
 926  0095 7b07          	ld	a,(OFST+6,sp)
 927  0097 c75316        	ld	21270,a
 928                     ; 201 }
 931  009a 5b03          	addw	sp,#3
 932  009c 81            	ret
1126                     ; 212 void TIM2_ICInit(TIM2_Channel_TypeDef TIM2_Channel,
1126                     ; 213                  TIM2_ICPolarity_TypeDef TIM2_ICPolarity,
1126                     ; 214                  TIM2_ICSelection_TypeDef TIM2_ICSelection,
1126                     ; 215                  TIM2_ICPSC_TypeDef TIM2_ICPrescaler,
1126                     ; 216                  uint8_t TIM2_ICFilter)
1126                     ; 217 {
1127                     .text:	section	.text,new
1128  0000               _TIM2_ICInit:
1130  0000 89            	pushw	x
1131       00000000      OFST:	set	0
1134                     ; 219   assert_param(IS_TIM2_CHANNEL_OK(TIM2_Channel));
1136  0001 9e            	ld	a,xh
1137  0002 4d            	tnz	a
1138  0003 270a          	jreq	L011
1139  0005 9e            	ld	a,xh
1140  0006 a101          	cp	a,#1
1141  0008 2705          	jreq	L011
1142  000a 9e            	ld	a,xh
1143  000b a102          	cp	a,#2
1144  000d 2603          	jrne	L601
1145  000f               L011:
1146  000f 4f            	clr	a
1147  0010 2010          	jra	L211
1148  0012               L601:
1149  0012 ae00db        	ldw	x,#219
1150  0015 89            	pushw	x
1151  0016 ae0000        	ldw	x,#0
1152  0019 89            	pushw	x
1153  001a ae0000        	ldw	x,#L702
1154  001d cd0000        	call	_assert_failed
1156  0020 5b04          	addw	sp,#4
1157  0022               L211:
1158                     ; 220   assert_param(IS_TIM2_IC_POLARITY_OK(TIM2_ICPolarity));
1160  0022 0d02          	tnz	(OFST+2,sp)
1161  0024 2706          	jreq	L611
1162  0026 7b02          	ld	a,(OFST+2,sp)
1163  0028 a144          	cp	a,#68
1164  002a 2603          	jrne	L411
1165  002c               L611:
1166  002c 4f            	clr	a
1167  002d 2010          	jra	L021
1168  002f               L411:
1169  002f ae00dc        	ldw	x,#220
1170  0032 89            	pushw	x
1171  0033 ae0000        	ldw	x,#0
1172  0036 89            	pushw	x
1173  0037 ae0000        	ldw	x,#L702
1174  003a cd0000        	call	_assert_failed
1176  003d 5b04          	addw	sp,#4
1177  003f               L021:
1178                     ; 221   assert_param(IS_TIM2_IC_SELECTION_OK(TIM2_ICSelection));
1180  003f 7b05          	ld	a,(OFST+5,sp)
1181  0041 a101          	cp	a,#1
1182  0043 270c          	jreq	L421
1183  0045 7b05          	ld	a,(OFST+5,sp)
1184  0047 a102          	cp	a,#2
1185  0049 2706          	jreq	L421
1186  004b 7b05          	ld	a,(OFST+5,sp)
1187  004d a103          	cp	a,#3
1188  004f 2603          	jrne	L221
1189  0051               L421:
1190  0051 4f            	clr	a
1191  0052 2010          	jra	L621
1192  0054               L221:
1193  0054 ae00dd        	ldw	x,#221
1194  0057 89            	pushw	x
1195  0058 ae0000        	ldw	x,#0
1196  005b 89            	pushw	x
1197  005c ae0000        	ldw	x,#L702
1198  005f cd0000        	call	_assert_failed
1200  0062 5b04          	addw	sp,#4
1201  0064               L621:
1202                     ; 222   assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_ICPrescaler));
1204  0064 0d06          	tnz	(OFST+6,sp)
1205  0066 2712          	jreq	L231
1206  0068 7b06          	ld	a,(OFST+6,sp)
1207  006a a104          	cp	a,#4
1208  006c 270c          	jreq	L231
1209  006e 7b06          	ld	a,(OFST+6,sp)
1210  0070 a108          	cp	a,#8
1211  0072 2706          	jreq	L231
1212  0074 7b06          	ld	a,(OFST+6,sp)
1213  0076 a10c          	cp	a,#12
1214  0078 2603          	jrne	L031
1215  007a               L231:
1216  007a 4f            	clr	a
1217  007b 2010          	jra	L431
1218  007d               L031:
1219  007d ae00de        	ldw	x,#222
1220  0080 89            	pushw	x
1221  0081 ae0000        	ldw	x,#0
1222  0084 89            	pushw	x
1223  0085 ae0000        	ldw	x,#L702
1224  0088 cd0000        	call	_assert_failed
1226  008b 5b04          	addw	sp,#4
1227  008d               L431:
1228                     ; 223   assert_param(IS_TIM2_IC_FILTER_OK(TIM2_ICFilter));
1230  008d 7b07          	ld	a,(OFST+7,sp)
1231  008f a110          	cp	a,#16
1232  0091 2403          	jruge	L631
1233  0093 4f            	clr	a
1234  0094 2010          	jra	L041
1235  0096               L631:
1236  0096 ae00df        	ldw	x,#223
1237  0099 89            	pushw	x
1238  009a ae0000        	ldw	x,#0
1239  009d 89            	pushw	x
1240  009e ae0000        	ldw	x,#L702
1241  00a1 cd0000        	call	_assert_failed
1243  00a4 5b04          	addw	sp,#4
1244  00a6               L041:
1245                     ; 225   if (TIM2_Channel == TIM2_CHANNEL_1)
1247  00a6 0d01          	tnz	(OFST+1,sp)
1248  00a8 2614          	jrne	L304
1249                     ; 228     TI1_Config((uint8_t)TIM2_ICPolarity,
1249                     ; 229                (uint8_t)TIM2_ICSelection,
1249                     ; 230                (uint8_t)TIM2_ICFilter);
1251  00aa 7b07          	ld	a,(OFST+7,sp)
1252  00ac 88            	push	a
1253  00ad 7b06          	ld	a,(OFST+6,sp)
1254  00af 97            	ld	xl,a
1255  00b0 7b03          	ld	a,(OFST+3,sp)
1256  00b2 95            	ld	xh,a
1257  00b3 cd0000        	call	L3_TI1_Config
1259  00b6 84            	pop	a
1260                     ; 233     TIM2_SetIC1Prescaler(TIM2_ICPrescaler);
1262  00b7 7b06          	ld	a,(OFST+6,sp)
1263  00b9 cd0000        	call	_TIM2_SetIC1Prescaler
1266  00bc 202c          	jra	L504
1267  00be               L304:
1268                     ; 235   else if (TIM2_Channel == TIM2_CHANNEL_2)
1270  00be 7b01          	ld	a,(OFST+1,sp)
1271  00c0 a101          	cp	a,#1
1272  00c2 2614          	jrne	L704
1273                     ; 238     TI2_Config((uint8_t)TIM2_ICPolarity,
1273                     ; 239                (uint8_t)TIM2_ICSelection,
1273                     ; 240                (uint8_t)TIM2_ICFilter);
1275  00c4 7b07          	ld	a,(OFST+7,sp)
1276  00c6 88            	push	a
1277  00c7 7b06          	ld	a,(OFST+6,sp)
1278  00c9 97            	ld	xl,a
1279  00ca 7b03          	ld	a,(OFST+3,sp)
1280  00cc 95            	ld	xh,a
1281  00cd cd0000        	call	L5_TI2_Config
1283  00d0 84            	pop	a
1284                     ; 243     TIM2_SetIC2Prescaler(TIM2_ICPrescaler);
1286  00d1 7b06          	ld	a,(OFST+6,sp)
1287  00d3 cd0000        	call	_TIM2_SetIC2Prescaler
1290  00d6 2012          	jra	L504
1291  00d8               L704:
1292                     ; 248     TI3_Config((uint8_t)TIM2_ICPolarity,
1292                     ; 249                (uint8_t)TIM2_ICSelection,
1292                     ; 250                (uint8_t)TIM2_ICFilter);
1294  00d8 7b07          	ld	a,(OFST+7,sp)
1295  00da 88            	push	a
1296  00db 7b06          	ld	a,(OFST+6,sp)
1297  00dd 97            	ld	xl,a
1298  00de 7b03          	ld	a,(OFST+3,sp)
1299  00e0 95            	ld	xh,a
1300  00e1 cd0000        	call	L7_TI3_Config
1302  00e4 84            	pop	a
1303                     ; 253     TIM2_SetIC3Prescaler(TIM2_ICPrescaler);
1305  00e5 7b06          	ld	a,(OFST+6,sp)
1306  00e7 cd0000        	call	_TIM2_SetIC3Prescaler
1308  00ea               L504:
1309                     ; 255 }
1312  00ea 85            	popw	x
1313  00eb 81            	ret
1410                     ; 266 void TIM2_PWMIConfig(TIM2_Channel_TypeDef TIM2_Channel,
1410                     ; 267                      TIM2_ICPolarity_TypeDef TIM2_ICPolarity,
1410                     ; 268                      TIM2_ICSelection_TypeDef TIM2_ICSelection,
1410                     ; 269                      TIM2_ICPSC_TypeDef TIM2_ICPrescaler,
1410                     ; 270                      uint8_t TIM2_ICFilter)
1410                     ; 271 {
1411                     .text:	section	.text,new
1412  0000               _TIM2_PWMIConfig:
1414  0000 89            	pushw	x
1415  0001 89            	pushw	x
1416       00000002      OFST:	set	2
1419                     ; 272   uint8_t icpolarity = (uint8_t)TIM2_ICPOLARITY_RISING;
1421  0002 7b01          	ld	a,(OFST-1,sp)
1422  0004 97            	ld	xl,a
1423                     ; 273   uint8_t icselection = (uint8_t)TIM2_ICSELECTION_DIRECTTI;
1425  0005 7b02          	ld	a,(OFST+0,sp)
1426  0007 97            	ld	xl,a
1427                     ; 276   assert_param(IS_TIM2_PWMI_CHANNEL_OK(TIM2_Channel));
1429  0008 0d03          	tnz	(OFST+1,sp)
1430  000a 2706          	jreq	L641
1431  000c 7b03          	ld	a,(OFST+1,sp)
1432  000e a101          	cp	a,#1
1433  0010 2603          	jrne	L441
1434  0012               L641:
1435  0012 4f            	clr	a
1436  0013 2010          	jra	L051
1437  0015               L441:
1438  0015 ae0114        	ldw	x,#276
1439  0018 89            	pushw	x
1440  0019 ae0000        	ldw	x,#0
1441  001c 89            	pushw	x
1442  001d ae0000        	ldw	x,#L702
1443  0020 cd0000        	call	_assert_failed
1445  0023 5b04          	addw	sp,#4
1446  0025               L051:
1447                     ; 277   assert_param(IS_TIM2_IC_POLARITY_OK(TIM2_ICPolarity));
1449  0025 0d04          	tnz	(OFST+2,sp)
1450  0027 2706          	jreq	L451
1451  0029 7b04          	ld	a,(OFST+2,sp)
1452  002b a144          	cp	a,#68
1453  002d 2603          	jrne	L251
1454  002f               L451:
1455  002f 4f            	clr	a
1456  0030 2010          	jra	L651
1457  0032               L251:
1458  0032 ae0115        	ldw	x,#277
1459  0035 89            	pushw	x
1460  0036 ae0000        	ldw	x,#0
1461  0039 89            	pushw	x
1462  003a ae0000        	ldw	x,#L702
1463  003d cd0000        	call	_assert_failed
1465  0040 5b04          	addw	sp,#4
1466  0042               L651:
1467                     ; 278   assert_param(IS_TIM2_IC_SELECTION_OK(TIM2_ICSelection));
1469  0042 7b07          	ld	a,(OFST+5,sp)
1470  0044 a101          	cp	a,#1
1471  0046 270c          	jreq	L261
1472  0048 7b07          	ld	a,(OFST+5,sp)
1473  004a a102          	cp	a,#2
1474  004c 2706          	jreq	L261
1475  004e 7b07          	ld	a,(OFST+5,sp)
1476  0050 a103          	cp	a,#3
1477  0052 2603          	jrne	L061
1478  0054               L261:
1479  0054 4f            	clr	a
1480  0055 2010          	jra	L461
1481  0057               L061:
1482  0057 ae0116        	ldw	x,#278
1483  005a 89            	pushw	x
1484  005b ae0000        	ldw	x,#0
1485  005e 89            	pushw	x
1486  005f ae0000        	ldw	x,#L702
1487  0062 cd0000        	call	_assert_failed
1489  0065 5b04          	addw	sp,#4
1490  0067               L461:
1491                     ; 279   assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_ICPrescaler));
1493  0067 0d08          	tnz	(OFST+6,sp)
1494  0069 2712          	jreq	L071
1495  006b 7b08          	ld	a,(OFST+6,sp)
1496  006d a104          	cp	a,#4
1497  006f 270c          	jreq	L071
1498  0071 7b08          	ld	a,(OFST+6,sp)
1499  0073 a108          	cp	a,#8
1500  0075 2706          	jreq	L071
1501  0077 7b08          	ld	a,(OFST+6,sp)
1502  0079 a10c          	cp	a,#12
1503  007b 2603          	jrne	L661
1504  007d               L071:
1505  007d 4f            	clr	a
1506  007e 2010          	jra	L271
1507  0080               L661:
1508  0080 ae0117        	ldw	x,#279
1509  0083 89            	pushw	x
1510  0084 ae0000        	ldw	x,#0
1511  0087 89            	pushw	x
1512  0088 ae0000        	ldw	x,#L702
1513  008b cd0000        	call	_assert_failed
1515  008e 5b04          	addw	sp,#4
1516  0090               L271:
1517                     ; 282   if (TIM2_ICPolarity != TIM2_ICPOLARITY_FALLING)
1519  0090 7b04          	ld	a,(OFST+2,sp)
1520  0092 a144          	cp	a,#68
1521  0094 2706          	jreq	L164
1522                     ; 284     icpolarity = (uint8_t)TIM2_ICPOLARITY_FALLING;
1524  0096 a644          	ld	a,#68
1525  0098 6b01          	ld	(OFST-1,sp),a
1527  009a 2002          	jra	L364
1528  009c               L164:
1529                     ; 288     icpolarity = (uint8_t)TIM2_ICPOLARITY_RISING;
1531  009c 0f01          	clr	(OFST-1,sp)
1532  009e               L364:
1533                     ; 292   if (TIM2_ICSelection == TIM2_ICSELECTION_DIRECTTI)
1535  009e 7b07          	ld	a,(OFST+5,sp)
1536  00a0 a101          	cp	a,#1
1537  00a2 2606          	jrne	L564
1538                     ; 294     icselection = (uint8_t)TIM2_ICSELECTION_INDIRECTTI;
1540  00a4 a602          	ld	a,#2
1541  00a6 6b02          	ld	(OFST+0,sp),a
1543  00a8 2004          	jra	L764
1544  00aa               L564:
1545                     ; 298     icselection = (uint8_t)TIM2_ICSELECTION_DIRECTTI;
1547  00aa a601          	ld	a,#1
1548  00ac 6b02          	ld	(OFST+0,sp),a
1549  00ae               L764:
1550                     ; 301   if (TIM2_Channel == TIM2_CHANNEL_1)
1552  00ae 0d03          	tnz	(OFST+1,sp)
1553  00b0 2626          	jrne	L174
1554                     ; 304     TI1_Config((uint8_t)TIM2_ICPolarity, (uint8_t)TIM2_ICSelection,
1554                     ; 305                (uint8_t)TIM2_ICFilter);
1556  00b2 7b09          	ld	a,(OFST+7,sp)
1557  00b4 88            	push	a
1558  00b5 7b08          	ld	a,(OFST+6,sp)
1559  00b7 97            	ld	xl,a
1560  00b8 7b05          	ld	a,(OFST+3,sp)
1561  00ba 95            	ld	xh,a
1562  00bb cd0000        	call	L3_TI1_Config
1564  00be 84            	pop	a
1565                     ; 308     TIM2_SetIC1Prescaler(TIM2_ICPrescaler);
1567  00bf 7b08          	ld	a,(OFST+6,sp)
1568  00c1 cd0000        	call	_TIM2_SetIC1Prescaler
1570                     ; 311     TI2_Config(icpolarity, icselection, TIM2_ICFilter);
1572  00c4 7b09          	ld	a,(OFST+7,sp)
1573  00c6 88            	push	a
1574  00c7 7b03          	ld	a,(OFST+1,sp)
1575  00c9 97            	ld	xl,a
1576  00ca 7b02          	ld	a,(OFST+0,sp)
1577  00cc 95            	ld	xh,a
1578  00cd cd0000        	call	L5_TI2_Config
1580  00d0 84            	pop	a
1581                     ; 314     TIM2_SetIC2Prescaler(TIM2_ICPrescaler);
1583  00d1 7b08          	ld	a,(OFST+6,sp)
1584  00d3 cd0000        	call	_TIM2_SetIC2Prescaler
1587  00d6 2024          	jra	L374
1588  00d8               L174:
1589                     ; 319     TI2_Config((uint8_t)TIM2_ICPolarity, (uint8_t)TIM2_ICSelection,
1589                     ; 320                (uint8_t)TIM2_ICFilter);
1591  00d8 7b09          	ld	a,(OFST+7,sp)
1592  00da 88            	push	a
1593  00db 7b08          	ld	a,(OFST+6,sp)
1594  00dd 97            	ld	xl,a
1595  00de 7b05          	ld	a,(OFST+3,sp)
1596  00e0 95            	ld	xh,a
1597  00e1 cd0000        	call	L5_TI2_Config
1599  00e4 84            	pop	a
1600                     ; 323     TIM2_SetIC2Prescaler(TIM2_ICPrescaler);
1602  00e5 7b08          	ld	a,(OFST+6,sp)
1603  00e7 cd0000        	call	_TIM2_SetIC2Prescaler
1605                     ; 326     TI1_Config((uint8_t)icpolarity, icselection, (uint8_t)TIM2_ICFilter);
1607  00ea 7b09          	ld	a,(OFST+7,sp)
1608  00ec 88            	push	a
1609  00ed 7b03          	ld	a,(OFST+1,sp)
1610  00ef 97            	ld	xl,a
1611  00f0 7b02          	ld	a,(OFST+0,sp)
1612  00f2 95            	ld	xh,a
1613  00f3 cd0000        	call	L3_TI1_Config
1615  00f6 84            	pop	a
1616                     ; 329     TIM2_SetIC1Prescaler(TIM2_ICPrescaler);
1618  00f7 7b08          	ld	a,(OFST+6,sp)
1619  00f9 cd0000        	call	_TIM2_SetIC1Prescaler
1621  00fc               L374:
1622                     ; 331 }
1625  00fc 5b04          	addw	sp,#4
1626  00fe 81            	ret
1682                     ; 339 void TIM2_Cmd(FunctionalState NewState)
1682                     ; 340 {
1683                     .text:	section	.text,new
1684  0000               _TIM2_Cmd:
1686  0000 88            	push	a
1687       00000000      OFST:	set	0
1690                     ; 342   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1692  0001 4d            	tnz	a
1693  0002 2704          	jreq	L002
1694  0004 a101          	cp	a,#1
1695  0006 2603          	jrne	L671
1696  0008               L002:
1697  0008 4f            	clr	a
1698  0009 2010          	jra	L202
1699  000b               L671:
1700  000b ae0156        	ldw	x,#342
1701  000e 89            	pushw	x
1702  000f ae0000        	ldw	x,#0
1703  0012 89            	pushw	x
1704  0013 ae0000        	ldw	x,#L702
1705  0016 cd0000        	call	_assert_failed
1707  0019 5b04          	addw	sp,#4
1708  001b               L202:
1709                     ; 345   if (NewState != DISABLE)
1711  001b 0d01          	tnz	(OFST+1,sp)
1712  001d 2706          	jreq	L325
1713                     ; 347     TIM2->CR1 |= (uint8_t)TIM2_CR1_CEN;
1715  001f 72105300      	bset	21248,#0
1717  0023 2004          	jra	L525
1718  0025               L325:
1719                     ; 351     TIM2->CR1 &= (uint8_t)(~TIM2_CR1_CEN);
1721  0025 72115300      	bres	21248,#0
1722  0029               L525:
1723                     ; 353 }
1726  0029 84            	pop	a
1727  002a 81            	ret
1807                     ; 368 void TIM2_ITConfig(TIM2_IT_TypeDef TIM2_IT, FunctionalState NewState)
1807                     ; 369 {
1808                     .text:	section	.text,new
1809  0000               _TIM2_ITConfig:
1811  0000 89            	pushw	x
1812       00000000      OFST:	set	0
1815                     ; 371   assert_param(IS_TIM2_IT_OK(TIM2_IT));
1817  0001 9e            	ld	a,xh
1818  0002 4d            	tnz	a
1819  0003 2708          	jreq	L602
1820  0005 9e            	ld	a,xh
1821  0006 a110          	cp	a,#16
1822  0008 2403          	jruge	L602
1823  000a 4f            	clr	a
1824  000b 2010          	jra	L012
1825  000d               L602:
1826  000d ae0173        	ldw	x,#371
1827  0010 89            	pushw	x
1828  0011 ae0000        	ldw	x,#0
1829  0014 89            	pushw	x
1830  0015 ae0000        	ldw	x,#L702
1831  0018 cd0000        	call	_assert_failed
1833  001b 5b04          	addw	sp,#4
1834  001d               L012:
1835                     ; 372   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1837  001d 0d02          	tnz	(OFST+2,sp)
1838  001f 2706          	jreq	L412
1839  0021 7b02          	ld	a,(OFST+2,sp)
1840  0023 a101          	cp	a,#1
1841  0025 2603          	jrne	L212
1842  0027               L412:
1843  0027 4f            	clr	a
1844  0028 2010          	jra	L612
1845  002a               L212:
1846  002a ae0174        	ldw	x,#372
1847  002d 89            	pushw	x
1848  002e ae0000        	ldw	x,#0
1849  0031 89            	pushw	x
1850  0032 ae0000        	ldw	x,#L702
1851  0035 cd0000        	call	_assert_failed
1853  0038 5b04          	addw	sp,#4
1854  003a               L612:
1855                     ; 374   if (NewState != DISABLE)
1857  003a 0d02          	tnz	(OFST+2,sp)
1858  003c 270a          	jreq	L565
1859                     ; 377     TIM2->IER |= (uint8_t)TIM2_IT;
1861  003e c65303        	ld	a,21251
1862  0041 1a01          	or	a,(OFST+1,sp)
1863  0043 c75303        	ld	21251,a
1865  0046 2009          	jra	L765
1866  0048               L565:
1867                     ; 382     TIM2->IER &= (uint8_t)(~TIM2_IT);
1869  0048 7b01          	ld	a,(OFST+1,sp)
1870  004a 43            	cpl	a
1871  004b c45303        	and	a,21251
1872  004e c75303        	ld	21251,a
1873  0051               L765:
1874                     ; 384 }
1877  0051 85            	popw	x
1878  0052 81            	ret
1915                     ; 392 void TIM2_UpdateDisableConfig(FunctionalState NewState)
1915                     ; 393 {
1916                     .text:	section	.text,new
1917  0000               _TIM2_UpdateDisableConfig:
1919  0000 88            	push	a
1920       00000000      OFST:	set	0
1923                     ; 395   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1925  0001 4d            	tnz	a
1926  0002 2704          	jreq	L422
1927  0004 a101          	cp	a,#1
1928  0006 2603          	jrne	L222
1929  0008               L422:
1930  0008 4f            	clr	a
1931  0009 2010          	jra	L622
1932  000b               L222:
1933  000b ae018b        	ldw	x,#395
1934  000e 89            	pushw	x
1935  000f ae0000        	ldw	x,#0
1936  0012 89            	pushw	x
1937  0013 ae0000        	ldw	x,#L702
1938  0016 cd0000        	call	_assert_failed
1940  0019 5b04          	addw	sp,#4
1941  001b               L622:
1942                     ; 398   if (NewState != DISABLE)
1944  001b 0d01          	tnz	(OFST+1,sp)
1945  001d 2706          	jreq	L706
1946                     ; 400     TIM2->CR1 |= (uint8_t)TIM2_CR1_UDIS;
1948  001f 72125300      	bset	21248,#1
1950  0023 2004          	jra	L116
1951  0025               L706:
1952                     ; 404     TIM2->CR1 &= (uint8_t)(~TIM2_CR1_UDIS);
1954  0025 72135300      	bres	21248,#1
1955  0029               L116:
1956                     ; 406 }
1959  0029 84            	pop	a
1960  002a 81            	ret
2019                     ; 416 void TIM2_UpdateRequestConfig(TIM2_UpdateSource_TypeDef TIM2_UpdateSource)
2019                     ; 417 {
2020                     .text:	section	.text,new
2021  0000               _TIM2_UpdateRequestConfig:
2023  0000 88            	push	a
2024       00000000      OFST:	set	0
2027                     ; 419   assert_param(IS_TIM2_UPDATE_SOURCE_OK(TIM2_UpdateSource));
2029  0001 4d            	tnz	a
2030  0002 2704          	jreq	L432
2031  0004 a101          	cp	a,#1
2032  0006 2603          	jrne	L232
2033  0008               L432:
2034  0008 4f            	clr	a
2035  0009 2010          	jra	L632
2036  000b               L232:
2037  000b ae01a3        	ldw	x,#419
2038  000e 89            	pushw	x
2039  000f ae0000        	ldw	x,#0
2040  0012 89            	pushw	x
2041  0013 ae0000        	ldw	x,#L702
2042  0016 cd0000        	call	_assert_failed
2044  0019 5b04          	addw	sp,#4
2045  001b               L632:
2046                     ; 422   if (TIM2_UpdateSource != TIM2_UPDATESOURCE_GLOBAL)
2048  001b 0d01          	tnz	(OFST+1,sp)
2049  001d 2706          	jreq	L146
2050                     ; 424     TIM2->CR1 |= (uint8_t)TIM2_CR1_URS;
2052  001f 72145300      	bset	21248,#2
2054  0023 2004          	jra	L346
2055  0025               L146:
2056                     ; 428     TIM2->CR1 &= (uint8_t)(~TIM2_CR1_URS);
2058  0025 72155300      	bres	21248,#2
2059  0029               L346:
2060                     ; 430 }
2063  0029 84            	pop	a
2064  002a 81            	ret
2122                     ; 440 void TIM2_SelectOnePulseMode(TIM2_OPMode_TypeDef TIM2_OPMode)
2122                     ; 441 {
2123                     .text:	section	.text,new
2124  0000               _TIM2_SelectOnePulseMode:
2126  0000 88            	push	a
2127       00000000      OFST:	set	0
2130                     ; 443   assert_param(IS_TIM2_OPM_MODE_OK(TIM2_OPMode));
2132  0001 a101          	cp	a,#1
2133  0003 2703          	jreq	L442
2134  0005 4d            	tnz	a
2135  0006 2603          	jrne	L242
2136  0008               L442:
2137  0008 4f            	clr	a
2138  0009 2010          	jra	L642
2139  000b               L242:
2140  000b ae01bb        	ldw	x,#443
2141  000e 89            	pushw	x
2142  000f ae0000        	ldw	x,#0
2143  0012 89            	pushw	x
2144  0013 ae0000        	ldw	x,#L702
2145  0016 cd0000        	call	_assert_failed
2147  0019 5b04          	addw	sp,#4
2148  001b               L642:
2149                     ; 446   if (TIM2_OPMode != TIM2_OPMODE_REPETITIVE)
2151  001b 0d01          	tnz	(OFST+1,sp)
2152  001d 2706          	jreq	L376
2153                     ; 448     TIM2->CR1 |= (uint8_t)TIM2_CR1_OPM;
2155  001f 72165300      	bset	21248,#3
2157  0023 2004          	jra	L576
2158  0025               L376:
2159                     ; 452     TIM2->CR1 &= (uint8_t)(~TIM2_CR1_OPM);
2161  0025 72175300      	bres	21248,#3
2162  0029               L576:
2163                     ; 454 }
2166  0029 84            	pop	a
2167  002a 81            	ret
2236                     ; 484 void TIM2_PrescalerConfig(TIM2_Prescaler_TypeDef Prescaler,
2236                     ; 485                           TIM2_PSCReloadMode_TypeDef TIM2_PSCReloadMode)
2236                     ; 486 {
2237                     .text:	section	.text,new
2238  0000               _TIM2_PrescalerConfig:
2240  0000 89            	pushw	x
2241       00000000      OFST:	set	0
2244                     ; 488   assert_param(IS_TIM2_PRESCALER_RELOAD_OK(TIM2_PSCReloadMode));
2246  0001 9f            	ld	a,xl
2247  0002 4d            	tnz	a
2248  0003 2705          	jreq	L452
2249  0005 9f            	ld	a,xl
2250  0006 a101          	cp	a,#1
2251  0008 2603          	jrne	L252
2252  000a               L452:
2253  000a 4f            	clr	a
2254  000b 2010          	jra	L652
2255  000d               L252:
2256  000d ae01e8        	ldw	x,#488
2257  0010 89            	pushw	x
2258  0011 ae0000        	ldw	x,#0
2259  0014 89            	pushw	x
2260  0015 ae0000        	ldw	x,#L702
2261  0018 cd0000        	call	_assert_failed
2263  001b 5b04          	addw	sp,#4
2264  001d               L652:
2265                     ; 489   assert_param(IS_TIM2_PRESCALER_OK(Prescaler));
2267  001d 0d01          	tnz	(OFST+1,sp)
2268  001f 275a          	jreq	L262
2269  0021 7b01          	ld	a,(OFST+1,sp)
2270  0023 a101          	cp	a,#1
2271  0025 2754          	jreq	L262
2272  0027 7b01          	ld	a,(OFST+1,sp)
2273  0029 a102          	cp	a,#2
2274  002b 274e          	jreq	L262
2275  002d 7b01          	ld	a,(OFST+1,sp)
2276  002f a103          	cp	a,#3
2277  0031 2748          	jreq	L262
2278  0033 7b01          	ld	a,(OFST+1,sp)
2279  0035 a104          	cp	a,#4
2280  0037 2742          	jreq	L262
2281  0039 7b01          	ld	a,(OFST+1,sp)
2282  003b a105          	cp	a,#5
2283  003d 273c          	jreq	L262
2284  003f 7b01          	ld	a,(OFST+1,sp)
2285  0041 a106          	cp	a,#6
2286  0043 2736          	jreq	L262
2287  0045 7b01          	ld	a,(OFST+1,sp)
2288  0047 a107          	cp	a,#7
2289  0049 2730          	jreq	L262
2290  004b 7b01          	ld	a,(OFST+1,sp)
2291  004d a108          	cp	a,#8
2292  004f 272a          	jreq	L262
2293  0051 7b01          	ld	a,(OFST+1,sp)
2294  0053 a109          	cp	a,#9
2295  0055 2724          	jreq	L262
2296  0057 7b01          	ld	a,(OFST+1,sp)
2297  0059 a10a          	cp	a,#10
2298  005b 271e          	jreq	L262
2299  005d 7b01          	ld	a,(OFST+1,sp)
2300  005f a10b          	cp	a,#11
2301  0061 2718          	jreq	L262
2302  0063 7b01          	ld	a,(OFST+1,sp)
2303  0065 a10c          	cp	a,#12
2304  0067 2712          	jreq	L262
2305  0069 7b01          	ld	a,(OFST+1,sp)
2306  006b a10d          	cp	a,#13
2307  006d 270c          	jreq	L262
2308  006f 7b01          	ld	a,(OFST+1,sp)
2309  0071 a10e          	cp	a,#14
2310  0073 2706          	jreq	L262
2311  0075 7b01          	ld	a,(OFST+1,sp)
2312  0077 a10f          	cp	a,#15
2313  0079 2603          	jrne	L062
2314  007b               L262:
2315  007b 4f            	clr	a
2316  007c 2010          	jra	L462
2317  007e               L062:
2318  007e ae01e9        	ldw	x,#489
2319  0081 89            	pushw	x
2320  0082 ae0000        	ldw	x,#0
2321  0085 89            	pushw	x
2322  0086 ae0000        	ldw	x,#L702
2323  0089 cd0000        	call	_assert_failed
2325  008c 5b04          	addw	sp,#4
2326  008e               L462:
2327                     ; 492   TIM2->PSCR = (uint8_t)Prescaler;
2329  008e 7b01          	ld	a,(OFST+1,sp)
2330  0090 c7530e        	ld	21262,a
2331                     ; 495   TIM2->EGR = (uint8_t)TIM2_PSCReloadMode;
2333  0093 7b02          	ld	a,(OFST+2,sp)
2334  0095 c75306        	ld	21254,a
2335                     ; 496 }
2338  0098 85            	popw	x
2339  0099 81            	ret
2398                     ; 507 void TIM2_ForcedOC1Config(TIM2_ForcedAction_TypeDef TIM2_ForcedAction)
2398                     ; 508 {
2399                     .text:	section	.text,new
2400  0000               _TIM2_ForcedOC1Config:
2402  0000 88            	push	a
2403       00000000      OFST:	set	0
2406                     ; 510   assert_param(IS_TIM2_FORCED_ACTION_OK(TIM2_ForcedAction));
2408  0001 a150          	cp	a,#80
2409  0003 2704          	jreq	L272
2410  0005 a140          	cp	a,#64
2411  0007 2603          	jrne	L072
2412  0009               L272:
2413  0009 4f            	clr	a
2414  000a 2010          	jra	L472
2415  000c               L072:
2416  000c ae01fe        	ldw	x,#510
2417  000f 89            	pushw	x
2418  0010 ae0000        	ldw	x,#0
2419  0013 89            	pushw	x
2420  0014 ae0000        	ldw	x,#L702
2421  0017 cd0000        	call	_assert_failed
2423  001a 5b04          	addw	sp,#4
2424  001c               L472:
2425                     ; 513   TIM2->CCMR1  =  (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~TIM2_CCMR_OCM))  
2425                     ; 514                             | (uint8_t)TIM2_ForcedAction);
2427  001c c65307        	ld	a,21255
2428  001f a48f          	and	a,#143
2429  0021 1a01          	or	a,(OFST+1,sp)
2430  0023 c75307        	ld	21255,a
2431                     ; 515 }
2434  0026 84            	pop	a
2435  0027 81            	ret
2472                     ; 526 void TIM2_ForcedOC2Config(TIM2_ForcedAction_TypeDef TIM2_ForcedAction)
2472                     ; 527 {
2473                     .text:	section	.text,new
2474  0000               _TIM2_ForcedOC2Config:
2476  0000 88            	push	a
2477       00000000      OFST:	set	0
2480                     ; 529   assert_param(IS_TIM2_FORCED_ACTION_OK(TIM2_ForcedAction));
2482  0001 a150          	cp	a,#80
2483  0003 2704          	jreq	L203
2484  0005 a140          	cp	a,#64
2485  0007 2603          	jrne	L003
2486  0009               L203:
2487  0009 4f            	clr	a
2488  000a 2010          	jra	L403
2489  000c               L003:
2490  000c ae0211        	ldw	x,#529
2491  000f 89            	pushw	x
2492  0010 ae0000        	ldw	x,#0
2493  0013 89            	pushw	x
2494  0014 ae0000        	ldw	x,#L702
2495  0017 cd0000        	call	_assert_failed
2497  001a 5b04          	addw	sp,#4
2498  001c               L403:
2499                     ; 532   TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~TIM2_CCMR_OCM))  
2499                     ; 533                           | (uint8_t)TIM2_ForcedAction);
2501  001c c65308        	ld	a,21256
2502  001f a48f          	and	a,#143
2503  0021 1a01          	or	a,(OFST+1,sp)
2504  0023 c75308        	ld	21256,a
2505                     ; 534 }
2508  0026 84            	pop	a
2509  0027 81            	ret
2546                     ; 545 void TIM2_ForcedOC3Config(TIM2_ForcedAction_TypeDef TIM2_ForcedAction)
2546                     ; 546 {
2547                     .text:	section	.text,new
2548  0000               _TIM2_ForcedOC3Config:
2550  0000 88            	push	a
2551       00000000      OFST:	set	0
2554                     ; 548   assert_param(IS_TIM2_FORCED_ACTION_OK(TIM2_ForcedAction));
2556  0001 a150          	cp	a,#80
2557  0003 2704          	jreq	L213
2558  0005 a140          	cp	a,#64
2559  0007 2603          	jrne	L013
2560  0009               L213:
2561  0009 4f            	clr	a
2562  000a 2010          	jra	L413
2563  000c               L013:
2564  000c ae0224        	ldw	x,#548
2565  000f 89            	pushw	x
2566  0010 ae0000        	ldw	x,#0
2567  0013 89            	pushw	x
2568  0014 ae0000        	ldw	x,#L702
2569  0017 cd0000        	call	_assert_failed
2571  001a 5b04          	addw	sp,#4
2572  001c               L413:
2573                     ; 551   TIM2->CCMR3  =  (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~TIM2_CCMR_OCM))
2573                     ; 552                             | (uint8_t)TIM2_ForcedAction);
2575  001c c65309        	ld	a,21257
2576  001f a48f          	and	a,#143
2577  0021 1a01          	or	a,(OFST+1,sp)
2578  0023 c75309        	ld	21257,a
2579                     ; 553 }
2582  0026 84            	pop	a
2583  0027 81            	ret
2620                     ; 561 void TIM2_ARRPreloadConfig(FunctionalState NewState)
2620                     ; 562 {
2621                     .text:	section	.text,new
2622  0000               _TIM2_ARRPreloadConfig:
2624  0000 88            	push	a
2625       00000000      OFST:	set	0
2628                     ; 564   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2630  0001 4d            	tnz	a
2631  0002 2704          	jreq	L223
2632  0004 a101          	cp	a,#1
2633  0006 2603          	jrne	L023
2634  0008               L223:
2635  0008 4f            	clr	a
2636  0009 2010          	jra	L423
2637  000b               L023:
2638  000b ae0234        	ldw	x,#564
2639  000e 89            	pushw	x
2640  000f ae0000        	ldw	x,#0
2641  0012 89            	pushw	x
2642  0013 ae0000        	ldw	x,#L702
2643  0016 cd0000        	call	_assert_failed
2645  0019 5b04          	addw	sp,#4
2646  001b               L423:
2647                     ; 567   if (NewState != DISABLE)
2649  001b 0d01          	tnz	(OFST+1,sp)
2650  001d 2706          	jreq	L1301
2651                     ; 569     TIM2->CR1 |= (uint8_t)TIM2_CR1_ARPE;
2653  001f 721e5300      	bset	21248,#7
2655  0023 2004          	jra	L3301
2656  0025               L1301:
2657                     ; 573     TIM2->CR1 &= (uint8_t)(~TIM2_CR1_ARPE);
2659  0025 721f5300      	bres	21248,#7
2660  0029               L3301:
2661                     ; 575 }
2664  0029 84            	pop	a
2665  002a 81            	ret
2702                     ; 583 void TIM2_OC1PreloadConfig(FunctionalState NewState)
2702                     ; 584 {
2703                     .text:	section	.text,new
2704  0000               _TIM2_OC1PreloadConfig:
2706  0000 88            	push	a
2707       00000000      OFST:	set	0
2710                     ; 586   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2712  0001 4d            	tnz	a
2713  0002 2704          	jreq	L233
2714  0004 a101          	cp	a,#1
2715  0006 2603          	jrne	L033
2716  0008               L233:
2717  0008 4f            	clr	a
2718  0009 2010          	jra	L433
2719  000b               L033:
2720  000b ae024a        	ldw	x,#586
2721  000e 89            	pushw	x
2722  000f ae0000        	ldw	x,#0
2723  0012 89            	pushw	x
2724  0013 ae0000        	ldw	x,#L702
2725  0016 cd0000        	call	_assert_failed
2727  0019 5b04          	addw	sp,#4
2728  001b               L433:
2729                     ; 589   if (NewState != DISABLE)
2731  001b 0d01          	tnz	(OFST+1,sp)
2732  001d 2706          	jreq	L3501
2733                     ; 591     TIM2->CCMR1 |= (uint8_t)TIM2_CCMR_OCxPE;
2735  001f 72165307      	bset	21255,#3
2737  0023 2004          	jra	L5501
2738  0025               L3501:
2739                     ; 595     TIM2->CCMR1 &= (uint8_t)(~TIM2_CCMR_OCxPE);
2741  0025 72175307      	bres	21255,#3
2742  0029               L5501:
2743                     ; 597 }
2746  0029 84            	pop	a
2747  002a 81            	ret
2784                     ; 605 void TIM2_OC2PreloadConfig(FunctionalState NewState)
2784                     ; 606 {
2785                     .text:	section	.text,new
2786  0000               _TIM2_OC2PreloadConfig:
2788  0000 88            	push	a
2789       00000000      OFST:	set	0
2792                     ; 608   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2794  0001 4d            	tnz	a
2795  0002 2704          	jreq	L243
2796  0004 a101          	cp	a,#1
2797  0006 2603          	jrne	L043
2798  0008               L243:
2799  0008 4f            	clr	a
2800  0009 2010          	jra	L443
2801  000b               L043:
2802  000b ae0260        	ldw	x,#608
2803  000e 89            	pushw	x
2804  000f ae0000        	ldw	x,#0
2805  0012 89            	pushw	x
2806  0013 ae0000        	ldw	x,#L702
2807  0016 cd0000        	call	_assert_failed
2809  0019 5b04          	addw	sp,#4
2810  001b               L443:
2811                     ; 611   if (NewState != DISABLE)
2813  001b 0d01          	tnz	(OFST+1,sp)
2814  001d 2706          	jreq	L5701
2815                     ; 613     TIM2->CCMR2 |= (uint8_t)TIM2_CCMR_OCxPE;
2817  001f 72165308      	bset	21256,#3
2819  0023 2004          	jra	L7701
2820  0025               L5701:
2821                     ; 617     TIM2->CCMR2 &= (uint8_t)(~TIM2_CCMR_OCxPE);
2823  0025 72175308      	bres	21256,#3
2824  0029               L7701:
2825                     ; 619 }
2828  0029 84            	pop	a
2829  002a 81            	ret
2866                     ; 627 void TIM2_OC3PreloadConfig(FunctionalState NewState)
2866                     ; 628 {
2867                     .text:	section	.text,new
2868  0000               _TIM2_OC3PreloadConfig:
2870  0000 88            	push	a
2871       00000000      OFST:	set	0
2874                     ; 630   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2876  0001 4d            	tnz	a
2877  0002 2704          	jreq	L253
2878  0004 a101          	cp	a,#1
2879  0006 2603          	jrne	L053
2880  0008               L253:
2881  0008 4f            	clr	a
2882  0009 2010          	jra	L453
2883  000b               L053:
2884  000b ae0276        	ldw	x,#630
2885  000e 89            	pushw	x
2886  000f ae0000        	ldw	x,#0
2887  0012 89            	pushw	x
2888  0013 ae0000        	ldw	x,#L702
2889  0016 cd0000        	call	_assert_failed
2891  0019 5b04          	addw	sp,#4
2892  001b               L453:
2893                     ; 633   if (NewState != DISABLE)
2895  001b 0d01          	tnz	(OFST+1,sp)
2896  001d 2706          	jreq	L7111
2897                     ; 635     TIM2->CCMR3 |= (uint8_t)TIM2_CCMR_OCxPE;
2899  001f 72165309      	bset	21257,#3
2901  0023 2004          	jra	L1211
2902  0025               L7111:
2903                     ; 639     TIM2->CCMR3 &= (uint8_t)(~TIM2_CCMR_OCxPE);
2905  0025 72175309      	bres	21257,#3
2906  0029               L1211:
2907                     ; 641 }
2910  0029 84            	pop	a
2911  002a 81            	ret
2985                     ; 653 void TIM2_GenerateEvent(TIM2_EventSource_TypeDef TIM2_EventSource)
2985                     ; 654 {
2986                     .text:	section	.text,new
2987  0000               _TIM2_GenerateEvent:
2989  0000 88            	push	a
2990       00000000      OFST:	set	0
2993                     ; 656   assert_param(IS_TIM2_EVENT_SOURCE_OK(TIM2_EventSource));
2995  0001 4d            	tnz	a
2996  0002 2703          	jreq	L063
2997  0004 4f            	clr	a
2998  0005 2010          	jra	L263
2999  0007               L063:
3000  0007 ae0290        	ldw	x,#656
3001  000a 89            	pushw	x
3002  000b ae0000        	ldw	x,#0
3003  000e 89            	pushw	x
3004  000f ae0000        	ldw	x,#L702
3005  0012 cd0000        	call	_assert_failed
3007  0015 5b04          	addw	sp,#4
3008  0017               L263:
3009                     ; 659   TIM2->EGR = (uint8_t)TIM2_EventSource;
3011  0017 7b01          	ld	a,(OFST+1,sp)
3012  0019 c75306        	ld	21254,a
3013                     ; 660 }
3016  001c 84            	pop	a
3017  001d 81            	ret
3054                     ; 670 void TIM2_OC1PolarityConfig(TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
3054                     ; 671 {
3055                     .text:	section	.text,new
3056  0000               _TIM2_OC1PolarityConfig:
3058  0000 88            	push	a
3059       00000000      OFST:	set	0
3062                     ; 673   assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
3064  0001 4d            	tnz	a
3065  0002 2704          	jreq	L073
3066  0004 a122          	cp	a,#34
3067  0006 2603          	jrne	L663
3068  0008               L073:
3069  0008 4f            	clr	a
3070  0009 2010          	jra	L273
3071  000b               L663:
3072  000b ae02a1        	ldw	x,#673
3073  000e 89            	pushw	x
3074  000f ae0000        	ldw	x,#0
3075  0012 89            	pushw	x
3076  0013 ae0000        	ldw	x,#L702
3077  0016 cd0000        	call	_assert_failed
3079  0019 5b04          	addw	sp,#4
3080  001b               L273:
3081                     ; 676   if (TIM2_OCPolarity != TIM2_OCPOLARITY_HIGH)
3083  001b 0d01          	tnz	(OFST+1,sp)
3084  001d 2706          	jreq	L3711
3085                     ; 678     TIM2->CCER1 |= (uint8_t)TIM2_CCER1_CC1P;
3087  001f 7212530a      	bset	21258,#1
3089  0023 2004          	jra	L5711
3090  0025               L3711:
3091                     ; 682     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1P);
3093  0025 7213530a      	bres	21258,#1
3094  0029               L5711:
3095                     ; 684 }
3098  0029 84            	pop	a
3099  002a 81            	ret
3136                     ; 694 void TIM2_OC2PolarityConfig(TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
3136                     ; 695 {
3137                     .text:	section	.text,new
3138  0000               _TIM2_OC2PolarityConfig:
3140  0000 88            	push	a
3141       00000000      OFST:	set	0
3144                     ; 697   assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
3146  0001 4d            	tnz	a
3147  0002 2704          	jreq	L004
3148  0004 a122          	cp	a,#34
3149  0006 2603          	jrne	L673
3150  0008               L004:
3151  0008 4f            	clr	a
3152  0009 2010          	jra	L204
3153  000b               L673:
3154  000b ae02b9        	ldw	x,#697
3155  000e 89            	pushw	x
3156  000f ae0000        	ldw	x,#0
3157  0012 89            	pushw	x
3158  0013 ae0000        	ldw	x,#L702
3159  0016 cd0000        	call	_assert_failed
3161  0019 5b04          	addw	sp,#4
3162  001b               L204:
3163                     ; 700   if (TIM2_OCPolarity != TIM2_OCPOLARITY_HIGH)
3165  001b 0d01          	tnz	(OFST+1,sp)
3166  001d 2706          	jreq	L5121
3167                     ; 702     TIM2->CCER1 |= TIM2_CCER1_CC2P;
3169  001f 721a530a      	bset	21258,#5
3171  0023 2004          	jra	L7121
3172  0025               L5121:
3173                     ; 706     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2P);
3175  0025 721b530a      	bres	21258,#5
3176  0029               L7121:
3177                     ; 708 }
3180  0029 84            	pop	a
3181  002a 81            	ret
3218                     ; 718 void TIM2_OC3PolarityConfig(TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
3218                     ; 719 {
3219                     .text:	section	.text,new
3220  0000               _TIM2_OC3PolarityConfig:
3222  0000 88            	push	a
3223       00000000      OFST:	set	0
3226                     ; 721   assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
3228  0001 4d            	tnz	a
3229  0002 2704          	jreq	L014
3230  0004 a122          	cp	a,#34
3231  0006 2603          	jrne	L604
3232  0008               L014:
3233  0008 4f            	clr	a
3234  0009 2010          	jra	L214
3235  000b               L604:
3236  000b ae02d1        	ldw	x,#721
3237  000e 89            	pushw	x
3238  000f ae0000        	ldw	x,#0
3239  0012 89            	pushw	x
3240  0013 ae0000        	ldw	x,#L702
3241  0016 cd0000        	call	_assert_failed
3243  0019 5b04          	addw	sp,#4
3244  001b               L214:
3245                     ; 724   if (TIM2_OCPolarity != TIM2_OCPOLARITY_HIGH)
3247  001b 0d01          	tnz	(OFST+1,sp)
3248  001d 2706          	jreq	L7321
3249                     ; 726     TIM2->CCER2 |= (uint8_t)TIM2_CCER2_CC3P;
3251  001f 7212530b      	bset	21259,#1
3253  0023 2004          	jra	L1421
3254  0025               L7321:
3255                     ; 730     TIM2->CCER2 &= (uint8_t)(~TIM2_CCER2_CC3P);
3257  0025 7213530b      	bres	21259,#1
3258  0029               L1421:
3259                     ; 732 }
3262  0029 84            	pop	a
3263  002a 81            	ret
3309                     ; 745 void TIM2_CCxCmd(TIM2_Channel_TypeDef TIM2_Channel, FunctionalState NewState)
3309                     ; 746 {
3310                     .text:	section	.text,new
3311  0000               _TIM2_CCxCmd:
3313  0000 89            	pushw	x
3314       00000000      OFST:	set	0
3317                     ; 748   assert_param(IS_TIM2_CHANNEL_OK(TIM2_Channel));
3319  0001 9e            	ld	a,xh
3320  0002 4d            	tnz	a
3321  0003 270a          	jreq	L024
3322  0005 9e            	ld	a,xh
3323  0006 a101          	cp	a,#1
3324  0008 2705          	jreq	L024
3325  000a 9e            	ld	a,xh
3326  000b a102          	cp	a,#2
3327  000d 2603          	jrne	L614
3328  000f               L024:
3329  000f 4f            	clr	a
3330  0010 2010          	jra	L224
3331  0012               L614:
3332  0012 ae02ec        	ldw	x,#748
3333  0015 89            	pushw	x
3334  0016 ae0000        	ldw	x,#0
3335  0019 89            	pushw	x
3336  001a ae0000        	ldw	x,#L702
3337  001d cd0000        	call	_assert_failed
3339  0020 5b04          	addw	sp,#4
3340  0022               L224:
3341                     ; 749   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
3343  0022 0d02          	tnz	(OFST+2,sp)
3344  0024 2706          	jreq	L624
3345  0026 7b02          	ld	a,(OFST+2,sp)
3346  0028 a101          	cp	a,#1
3347  002a 2603          	jrne	L424
3348  002c               L624:
3349  002c 4f            	clr	a
3350  002d 2010          	jra	L034
3351  002f               L424:
3352  002f ae02ed        	ldw	x,#749
3353  0032 89            	pushw	x
3354  0033 ae0000        	ldw	x,#0
3355  0036 89            	pushw	x
3356  0037 ae0000        	ldw	x,#L702
3357  003a cd0000        	call	_assert_failed
3359  003d 5b04          	addw	sp,#4
3360  003f               L034:
3361                     ; 751   if (TIM2_Channel == TIM2_CHANNEL_1)
3363  003f 0d01          	tnz	(OFST+1,sp)
3364  0041 2610          	jrne	L5621
3365                     ; 754     if (NewState != DISABLE)
3367  0043 0d02          	tnz	(OFST+2,sp)
3368  0045 2706          	jreq	L7621
3369                     ; 756       TIM2->CCER1 |= (uint8_t)TIM2_CCER1_CC1E;
3371  0047 7210530a      	bset	21258,#0
3373  004b 202a          	jra	L3721
3374  004d               L7621:
3375                     ; 760       TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1E);
3377  004d 7211530a      	bres	21258,#0
3378  0051 2024          	jra	L3721
3379  0053               L5621:
3380                     ; 764   else if (TIM2_Channel == TIM2_CHANNEL_2)
3382  0053 7b01          	ld	a,(OFST+1,sp)
3383  0055 a101          	cp	a,#1
3384  0057 2610          	jrne	L5721
3385                     ; 767     if (NewState != DISABLE)
3387  0059 0d02          	tnz	(OFST+2,sp)
3388  005b 2706          	jreq	L7721
3389                     ; 769       TIM2->CCER1 |= (uint8_t)TIM2_CCER1_CC2E;
3391  005d 7218530a      	bset	21258,#4
3393  0061 2014          	jra	L3721
3394  0063               L7721:
3395                     ; 773       TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2E);
3397  0063 7219530a      	bres	21258,#4
3398  0067 200e          	jra	L3721
3399  0069               L5721:
3400                     ; 779     if (NewState != DISABLE)
3402  0069 0d02          	tnz	(OFST+2,sp)
3403  006b 2706          	jreq	L5031
3404                     ; 781       TIM2->CCER2 |= (uint8_t)TIM2_CCER2_CC3E;
3406  006d 7210530b      	bset	21259,#0
3408  0071 2004          	jra	L3721
3409  0073               L5031:
3410                     ; 785       TIM2->CCER2 &= (uint8_t)(~TIM2_CCER2_CC3E);
3412  0073 7211530b      	bres	21259,#0
3413  0077               L3721:
3414                     ; 788 }
3417  0077 85            	popw	x
3418  0078 81            	ret
3464                     ; 810 void TIM2_SelectOCxM(TIM2_Channel_TypeDef TIM2_Channel, TIM2_OCMode_TypeDef TIM2_OCMode)
3464                     ; 811 {
3465                     .text:	section	.text,new
3466  0000               _TIM2_SelectOCxM:
3468  0000 89            	pushw	x
3469       00000000      OFST:	set	0
3472                     ; 813   assert_param(IS_TIM2_CHANNEL_OK(TIM2_Channel));
3474  0001 9e            	ld	a,xh
3475  0002 4d            	tnz	a
3476  0003 270a          	jreq	L634
3477  0005 9e            	ld	a,xh
3478  0006 a101          	cp	a,#1
3479  0008 2705          	jreq	L634
3480  000a 9e            	ld	a,xh
3481  000b a102          	cp	a,#2
3482  000d 2603          	jrne	L434
3483  000f               L634:
3484  000f 4f            	clr	a
3485  0010 2010          	jra	L044
3486  0012               L434:
3487  0012 ae032d        	ldw	x,#813
3488  0015 89            	pushw	x
3489  0016 ae0000        	ldw	x,#0
3490  0019 89            	pushw	x
3491  001a ae0000        	ldw	x,#L702
3492  001d cd0000        	call	_assert_failed
3494  0020 5b04          	addw	sp,#4
3495  0022               L044:
3496                     ; 814   assert_param(IS_TIM2_OCM_OK(TIM2_OCMode));
3498  0022 0d02          	tnz	(OFST+2,sp)
3499  0024 272a          	jreq	L444
3500  0026 7b02          	ld	a,(OFST+2,sp)
3501  0028 a110          	cp	a,#16
3502  002a 2724          	jreq	L444
3503  002c 7b02          	ld	a,(OFST+2,sp)
3504  002e a120          	cp	a,#32
3505  0030 271e          	jreq	L444
3506  0032 7b02          	ld	a,(OFST+2,sp)
3507  0034 a130          	cp	a,#48
3508  0036 2718          	jreq	L444
3509  0038 7b02          	ld	a,(OFST+2,sp)
3510  003a a160          	cp	a,#96
3511  003c 2712          	jreq	L444
3512  003e 7b02          	ld	a,(OFST+2,sp)
3513  0040 a170          	cp	a,#112
3514  0042 270c          	jreq	L444
3515  0044 7b02          	ld	a,(OFST+2,sp)
3516  0046 a150          	cp	a,#80
3517  0048 2706          	jreq	L444
3518  004a 7b02          	ld	a,(OFST+2,sp)
3519  004c a140          	cp	a,#64
3520  004e 2603          	jrne	L244
3521  0050               L444:
3522  0050 4f            	clr	a
3523  0051 2010          	jra	L644
3524  0053               L244:
3525  0053 ae032e        	ldw	x,#814
3526  0056 89            	pushw	x
3527  0057 ae0000        	ldw	x,#0
3528  005a 89            	pushw	x
3529  005b ae0000        	ldw	x,#L702
3530  005e cd0000        	call	_assert_failed
3532  0061 5b04          	addw	sp,#4
3533  0063               L644:
3534                     ; 816   if (TIM2_Channel == TIM2_CHANNEL_1)
3536  0063 0d01          	tnz	(OFST+1,sp)
3537  0065 2610          	jrne	L3331
3538                     ; 819     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1E);
3540  0067 7211530a      	bres	21258,#0
3541                     ; 822     TIM2->CCMR1 = (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~TIM2_CCMR_OCM))
3541                     ; 823                             | (uint8_t)TIM2_OCMode);
3543  006b c65307        	ld	a,21255
3544  006e a48f          	and	a,#143
3545  0070 1a02          	or	a,(OFST+2,sp)
3546  0072 c75307        	ld	21255,a
3548  0075 2024          	jra	L5331
3549  0077               L3331:
3550                     ; 825   else if (TIM2_Channel == TIM2_CHANNEL_2)
3552  0077 7b01          	ld	a,(OFST+1,sp)
3553  0079 a101          	cp	a,#1
3554  007b 2610          	jrne	L7331
3555                     ; 828     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2E);
3557  007d 7219530a      	bres	21258,#4
3558                     ; 831     TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~TIM2_CCMR_OCM))
3558                     ; 832                             | (uint8_t)TIM2_OCMode);
3560  0081 c65308        	ld	a,21256
3561  0084 a48f          	and	a,#143
3562  0086 1a02          	or	a,(OFST+2,sp)
3563  0088 c75308        	ld	21256,a
3565  008b 200e          	jra	L5331
3566  008d               L7331:
3567                     ; 837     TIM2->CCER2 &= (uint8_t)(~TIM2_CCER2_CC3E);
3569  008d 7211530b      	bres	21259,#0
3570                     ; 840     TIM2->CCMR3 = (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~TIM2_CCMR_OCM))
3570                     ; 841                             | (uint8_t)TIM2_OCMode);
3572  0091 c65309        	ld	a,21257
3573  0094 a48f          	and	a,#143
3574  0096 1a02          	or	a,(OFST+2,sp)
3575  0098 c75309        	ld	21257,a
3576  009b               L5331:
3577                     ; 843 }
3580  009b 85            	popw	x
3581  009c 81            	ret
3615                     ; 851 void TIM2_SetCounter(uint16_t Counter)
3615                     ; 852 {
3616                     .text:	section	.text,new
3617  0000               _TIM2_SetCounter:
3621                     ; 854   TIM2->CNTRH = (uint8_t)(Counter >> 8);
3623  0000 9e            	ld	a,xh
3624  0001 c7530c        	ld	21260,a
3625                     ; 855   TIM2->CNTRL = (uint8_t)(Counter);
3627  0004 9f            	ld	a,xl
3628  0005 c7530d        	ld	21261,a
3629                     ; 856 }
3632  0008 81            	ret
3666                     ; 864 void TIM2_SetAutoreload(uint16_t Autoreload)
3666                     ; 865 {
3667                     .text:	section	.text,new
3668  0000               _TIM2_SetAutoreload:
3672                     ; 867   TIM2->ARRH = (uint8_t)(Autoreload >> 8);
3674  0000 9e            	ld	a,xh
3675  0001 c7530f        	ld	21263,a
3676                     ; 868   TIM2->ARRL = (uint8_t)(Autoreload);
3678  0004 9f            	ld	a,xl
3679  0005 c75310        	ld	21264,a
3680                     ; 869 }
3683  0008 81            	ret
3717                     ; 877 void TIM2_SetCompare1(uint16_t Compare1)
3717                     ; 878 {
3718                     .text:	section	.text,new
3719  0000               _TIM2_SetCompare1:
3723                     ; 880   TIM2->CCR1H = (uint8_t)(Compare1 >> 8);
3725  0000 9e            	ld	a,xh
3726  0001 c75311        	ld	21265,a
3727                     ; 881   TIM2->CCR1L = (uint8_t)(Compare1);
3729  0004 9f            	ld	a,xl
3730  0005 c75312        	ld	21266,a
3731                     ; 882 }
3734  0008 81            	ret
3768                     ; 890 void TIM2_SetCompare2(uint16_t Compare2)
3768                     ; 891 {
3769                     .text:	section	.text,new
3770  0000               _TIM2_SetCompare2:
3774                     ; 893   TIM2->CCR2H = (uint8_t)(Compare2 >> 8);
3776  0000 9e            	ld	a,xh
3777  0001 c75313        	ld	21267,a
3778                     ; 894   TIM2->CCR2L = (uint8_t)(Compare2);
3780  0004 9f            	ld	a,xl
3781  0005 c75314        	ld	21268,a
3782                     ; 895 }
3785  0008 81            	ret
3819                     ; 903 void TIM2_SetCompare3(uint16_t Compare3)
3819                     ; 904 {
3820                     .text:	section	.text,new
3821  0000               _TIM2_SetCompare3:
3825                     ; 906   TIM2->CCR3H = (uint8_t)(Compare3 >> 8);
3827  0000 9e            	ld	a,xh
3828  0001 c75315        	ld	21269,a
3829                     ; 907   TIM2->CCR3L = (uint8_t)(Compare3);
3831  0004 9f            	ld	a,xl
3832  0005 c75316        	ld	21270,a
3833                     ; 908 }
3836  0008 81            	ret
3873                     ; 920 void TIM2_SetIC1Prescaler(TIM2_ICPSC_TypeDef TIM2_IC1Prescaler)
3873                     ; 921 {
3874                     .text:	section	.text,new
3875  0000               _TIM2_SetIC1Prescaler:
3877  0000 88            	push	a
3878       00000000      OFST:	set	0
3881                     ; 923   assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_IC1Prescaler));
3883  0001 4d            	tnz	a
3884  0002 270c          	jreq	L664
3885  0004 a104          	cp	a,#4
3886  0006 2708          	jreq	L664
3887  0008 a108          	cp	a,#8
3888  000a 2704          	jreq	L664
3889  000c a10c          	cp	a,#12
3890  000e 2603          	jrne	L464
3891  0010               L664:
3892  0010 4f            	clr	a
3893  0011 2010          	jra	L074
3894  0013               L464:
3895  0013 ae039b        	ldw	x,#923
3896  0016 89            	pushw	x
3897  0017 ae0000        	ldw	x,#0
3898  001a 89            	pushw	x
3899  001b ae0000        	ldw	x,#L702
3900  001e cd0000        	call	_assert_failed
3902  0021 5b04          	addw	sp,#4
3903  0023               L074:
3904                     ; 926   TIM2->CCMR1 = (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~TIM2_CCMR_ICxPSC))
3904                     ; 927                           | (uint8_t)TIM2_IC1Prescaler);
3906  0023 c65307        	ld	a,21255
3907  0026 a4f3          	and	a,#243
3908  0028 1a01          	or	a,(OFST+1,sp)
3909  002a c75307        	ld	21255,a
3910                     ; 928 }
3913  002d 84            	pop	a
3914  002e 81            	ret
3951                     ; 940 void TIM2_SetIC2Prescaler(TIM2_ICPSC_TypeDef TIM2_IC2Prescaler)
3951                     ; 941 {
3952                     .text:	section	.text,new
3953  0000               _TIM2_SetIC2Prescaler:
3955  0000 88            	push	a
3956       00000000      OFST:	set	0
3959                     ; 943   assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_IC2Prescaler));
3961  0001 4d            	tnz	a
3962  0002 270c          	jreq	L674
3963  0004 a104          	cp	a,#4
3964  0006 2708          	jreq	L674
3965  0008 a108          	cp	a,#8
3966  000a 2704          	jreq	L674
3967  000c a10c          	cp	a,#12
3968  000e 2603          	jrne	L474
3969  0010               L674:
3970  0010 4f            	clr	a
3971  0011 2010          	jra	L005
3972  0013               L474:
3973  0013 ae03af        	ldw	x,#943
3974  0016 89            	pushw	x
3975  0017 ae0000        	ldw	x,#0
3976  001a 89            	pushw	x
3977  001b ae0000        	ldw	x,#L702
3978  001e cd0000        	call	_assert_failed
3980  0021 5b04          	addw	sp,#4
3981  0023               L005:
3982                     ; 946   TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~TIM2_CCMR_ICxPSC))
3982                     ; 947                           | (uint8_t)TIM2_IC2Prescaler);
3984  0023 c65308        	ld	a,21256
3985  0026 a4f3          	and	a,#243
3986  0028 1a01          	or	a,(OFST+1,sp)
3987  002a c75308        	ld	21256,a
3988                     ; 948 }
3991  002d 84            	pop	a
3992  002e 81            	ret
4029                     ; 960 void TIM2_SetIC3Prescaler(TIM2_ICPSC_TypeDef TIM2_IC3Prescaler)
4029                     ; 961 {
4030                     .text:	section	.text,new
4031  0000               _TIM2_SetIC3Prescaler:
4033  0000 88            	push	a
4034       00000000      OFST:	set	0
4037                     ; 964   assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_IC3Prescaler));
4039  0001 4d            	tnz	a
4040  0002 270c          	jreq	L605
4041  0004 a104          	cp	a,#4
4042  0006 2708          	jreq	L605
4043  0008 a108          	cp	a,#8
4044  000a 2704          	jreq	L605
4045  000c a10c          	cp	a,#12
4046  000e 2603          	jrne	L405
4047  0010               L605:
4048  0010 4f            	clr	a
4049  0011 2010          	jra	L015
4050  0013               L405:
4051  0013 ae03c4        	ldw	x,#964
4052  0016 89            	pushw	x
4053  0017 ae0000        	ldw	x,#0
4054  001a 89            	pushw	x
4055  001b ae0000        	ldw	x,#L702
4056  001e cd0000        	call	_assert_failed
4058  0021 5b04          	addw	sp,#4
4059  0023               L015:
4060                     ; 966   TIM2->CCMR3 = (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~TIM2_CCMR_ICxPSC))
4060                     ; 967                           | (uint8_t)TIM2_IC3Prescaler);
4062  0023 c65309        	ld	a,21257
4063  0026 a4f3          	and	a,#243
4064  0028 1a01          	or	a,(OFST+1,sp)
4065  002a c75309        	ld	21257,a
4066                     ; 968 }
4069  002d 84            	pop	a
4070  002e 81            	ret
4122                     ; 975 uint16_t TIM2_GetCapture1(void)
4122                     ; 976 {
4123                     .text:	section	.text,new
4124  0000               _TIM2_GetCapture1:
4126  0000 5204          	subw	sp,#4
4127       00000004      OFST:	set	4
4130                     ; 978   uint16_t tmpccr1 = 0;
4132  0002 1e03          	ldw	x,(OFST-1,sp)
4133                     ; 979   uint8_t tmpccr1l=0, tmpccr1h=0;
4135  0004 7b01          	ld	a,(OFST-3,sp)
4136  0006 97            	ld	xl,a
4139  0007 7b02          	ld	a,(OFST-2,sp)
4140  0009 97            	ld	xl,a
4141                     ; 981   tmpccr1h = TIM2->CCR1H;
4143  000a c65311        	ld	a,21265
4144  000d 6b02          	ld	(OFST-2,sp),a
4145                     ; 982   tmpccr1l = TIM2->CCR1L;
4147  000f c65312        	ld	a,21266
4148  0012 6b01          	ld	(OFST-3,sp),a
4149                     ; 984   tmpccr1 = (uint16_t)(tmpccr1l);
4151  0014 7b01          	ld	a,(OFST-3,sp)
4152  0016 5f            	clrw	x
4153  0017 97            	ld	xl,a
4154  0018 1f03          	ldw	(OFST-1,sp),x
4155                     ; 985   tmpccr1 |= (uint16_t)((uint16_t)tmpccr1h << 8);
4157  001a 7b02          	ld	a,(OFST-2,sp)
4158  001c 5f            	clrw	x
4159  001d 97            	ld	xl,a
4160  001e 4f            	clr	a
4161  001f 02            	rlwa	x,a
4162  0020 01            	rrwa	x,a
4163  0021 1a04          	or	a,(OFST+0,sp)
4164  0023 01            	rrwa	x,a
4165  0024 1a03          	or	a,(OFST-1,sp)
4166  0026 01            	rrwa	x,a
4167  0027 1f03          	ldw	(OFST-1,sp),x
4168                     ; 987   return (uint16_t)tmpccr1;
4170  0029 1e03          	ldw	x,(OFST-1,sp)
4173  002b 5b04          	addw	sp,#4
4174  002d 81            	ret
4226                     ; 995 uint16_t TIM2_GetCapture2(void)
4226                     ; 996 {
4227                     .text:	section	.text,new
4228  0000               _TIM2_GetCapture2:
4230  0000 5204          	subw	sp,#4
4231       00000004      OFST:	set	4
4234                     ; 998   uint16_t tmpccr2 = 0;
4236  0002 1e03          	ldw	x,(OFST-1,sp)
4237                     ; 999   uint8_t tmpccr2l=0, tmpccr2h=0;
4239  0004 7b01          	ld	a,(OFST-3,sp)
4240  0006 97            	ld	xl,a
4243  0007 7b02          	ld	a,(OFST-2,sp)
4244  0009 97            	ld	xl,a
4245                     ; 1001   tmpccr2h = TIM2->CCR2H;
4247  000a c65313        	ld	a,21267
4248  000d 6b02          	ld	(OFST-2,sp),a
4249                     ; 1002   tmpccr2l = TIM2->CCR2L;
4251  000f c65314        	ld	a,21268
4252  0012 6b01          	ld	(OFST-3,sp),a
4253                     ; 1004   tmpccr2 = (uint16_t)(tmpccr2l);
4255  0014 7b01          	ld	a,(OFST-3,sp)
4256  0016 5f            	clrw	x
4257  0017 97            	ld	xl,a
4258  0018 1f03          	ldw	(OFST-1,sp),x
4259                     ; 1005   tmpccr2 |= (uint16_t)((uint16_t)tmpccr2h << 8);
4261  001a 7b02          	ld	a,(OFST-2,sp)
4262  001c 5f            	clrw	x
4263  001d 97            	ld	xl,a
4264  001e 4f            	clr	a
4265  001f 02            	rlwa	x,a
4266  0020 01            	rrwa	x,a
4267  0021 1a04          	or	a,(OFST+0,sp)
4268  0023 01            	rrwa	x,a
4269  0024 1a03          	or	a,(OFST-1,sp)
4270  0026 01            	rrwa	x,a
4271  0027 1f03          	ldw	(OFST-1,sp),x
4272                     ; 1007   return (uint16_t)tmpccr2;
4274  0029 1e03          	ldw	x,(OFST-1,sp)
4277  002b 5b04          	addw	sp,#4
4278  002d 81            	ret
4330                     ; 1015 uint16_t TIM2_GetCapture3(void)
4330                     ; 1016 {
4331                     .text:	section	.text,new
4332  0000               _TIM2_GetCapture3:
4334  0000 5204          	subw	sp,#4
4335       00000004      OFST:	set	4
4338                     ; 1018   uint16_t tmpccr3 = 0;
4340  0002 1e03          	ldw	x,(OFST-1,sp)
4341                     ; 1019   uint8_t tmpccr3l=0, tmpccr3h=0;
4343  0004 7b01          	ld	a,(OFST-3,sp)
4344  0006 97            	ld	xl,a
4347  0007 7b02          	ld	a,(OFST-2,sp)
4348  0009 97            	ld	xl,a
4349                     ; 1021   tmpccr3h = TIM2->CCR3H;
4351  000a c65315        	ld	a,21269
4352  000d 6b02          	ld	(OFST-2,sp),a
4353                     ; 1022   tmpccr3l = TIM2->CCR3L;
4355  000f c65316        	ld	a,21270
4356  0012 6b01          	ld	(OFST-3,sp),a
4357                     ; 1024   tmpccr3 = (uint16_t)(tmpccr3l);
4359  0014 7b01          	ld	a,(OFST-3,sp)
4360  0016 5f            	clrw	x
4361  0017 97            	ld	xl,a
4362  0018 1f03          	ldw	(OFST-1,sp),x
4363                     ; 1025   tmpccr3 |= (uint16_t)((uint16_t)tmpccr3h << 8);
4365  001a 7b02          	ld	a,(OFST-2,sp)
4366  001c 5f            	clrw	x
4367  001d 97            	ld	xl,a
4368  001e 4f            	clr	a
4369  001f 02            	rlwa	x,a
4370  0020 01            	rrwa	x,a
4371  0021 1a04          	or	a,(OFST+0,sp)
4372  0023 01            	rrwa	x,a
4373  0024 1a03          	or	a,(OFST-1,sp)
4374  0026 01            	rrwa	x,a
4375  0027 1f03          	ldw	(OFST-1,sp),x
4376                     ; 1027   return (uint16_t)tmpccr3;
4378  0029 1e03          	ldw	x,(OFST-1,sp)
4381  002b 5b04          	addw	sp,#4
4382  002d 81            	ret
4416                     ; 1035 uint16_t TIM2_GetCounter(void)
4416                     ; 1036 {
4417                     .text:	section	.text,new
4418  0000               _TIM2_GetCounter:
4420  0000 89            	pushw	x
4421       00000002      OFST:	set	2
4424                     ; 1037   uint16_t tmpcntr = 0;
4426  0001 5f            	clrw	x
4427  0002 1f01          	ldw	(OFST-1,sp),x
4428                     ; 1039   tmpcntr =  ((uint16_t)TIM2->CNTRH << 8);
4430  0004 c6530c        	ld	a,21260
4431  0007 5f            	clrw	x
4432  0008 97            	ld	xl,a
4433  0009 4f            	clr	a
4434  000a 02            	rlwa	x,a
4435  000b 1f01          	ldw	(OFST-1,sp),x
4436                     ; 1041   return (uint16_t)( tmpcntr| (uint16_t)(TIM2->CNTRL));
4438  000d c6530d        	ld	a,21261
4439  0010 5f            	clrw	x
4440  0011 97            	ld	xl,a
4441  0012 01            	rrwa	x,a
4442  0013 1a02          	or	a,(OFST+0,sp)
4443  0015 01            	rrwa	x,a
4444  0016 1a01          	or	a,(OFST-1,sp)
4445  0018 01            	rrwa	x,a
4448  0019 5b02          	addw	sp,#2
4449  001b 81            	ret
4473                     ; 1049 TIM2_Prescaler_TypeDef TIM2_GetPrescaler(void)
4473                     ; 1050 {
4474                     .text:	section	.text,new
4475  0000               _TIM2_GetPrescaler:
4479                     ; 1052   return (TIM2_Prescaler_TypeDef)(TIM2->PSCR);
4481  0000 c6530e        	ld	a,21262
4484  0003 81            	ret
4624                     ; 1068 FlagStatus TIM2_GetFlagStatus(TIM2_FLAG_TypeDef TIM2_FLAG)
4624                     ; 1069 {
4625                     .text:	section	.text,new
4626  0000               _TIM2_GetFlagStatus:
4628  0000 89            	pushw	x
4629  0001 89            	pushw	x
4630       00000002      OFST:	set	2
4633                     ; 1070   FlagStatus bitstatus = RESET;
4635  0002 7b02          	ld	a,(OFST+0,sp)
4636  0004 97            	ld	xl,a
4637                     ; 1071   uint8_t tim2_flag_l = 0, tim2_flag_h = 0;
4639  0005 7b01          	ld	a,(OFST-1,sp)
4640  0007 97            	ld	xl,a
4643  0008 7b02          	ld	a,(OFST+0,sp)
4644  000a 97            	ld	xl,a
4645                     ; 1074   assert_param(IS_TIM2_GET_FLAG_OK(TIM2_FLAG));
4647  000b 1e03          	ldw	x,(OFST+1,sp)
4648  000d a30001        	cpw	x,#1
4649  0010 272a          	jreq	L035
4650  0012 1e03          	ldw	x,(OFST+1,sp)
4651  0014 a30002        	cpw	x,#2
4652  0017 2723          	jreq	L035
4653  0019 1e03          	ldw	x,(OFST+1,sp)
4654  001b a30004        	cpw	x,#4
4655  001e 271c          	jreq	L035
4656  0020 1e03          	ldw	x,(OFST+1,sp)
4657  0022 a30008        	cpw	x,#8
4658  0025 2715          	jreq	L035
4659  0027 1e03          	ldw	x,(OFST+1,sp)
4660  0029 a30200        	cpw	x,#512
4661  002c 270e          	jreq	L035
4662  002e 1e03          	ldw	x,(OFST+1,sp)
4663  0030 a30400        	cpw	x,#1024
4664  0033 2707          	jreq	L035
4665  0035 1e03          	ldw	x,(OFST+1,sp)
4666  0037 a30800        	cpw	x,#2048
4667  003a 2603          	jrne	L625
4668  003c               L035:
4669  003c 4f            	clr	a
4670  003d 2010          	jra	L235
4671  003f               L625:
4672  003f ae0432        	ldw	x,#1074
4673  0042 89            	pushw	x
4674  0043 ae0000        	ldw	x,#0
4675  0046 89            	pushw	x
4676  0047 ae0000        	ldw	x,#L702
4677  004a cd0000        	call	_assert_failed
4679  004d 5b04          	addw	sp,#4
4680  004f               L235:
4681                     ; 1076   tim2_flag_l = (uint8_t)(TIM2->SR1 & (uint8_t)TIM2_FLAG);
4683  004f c65304        	ld	a,21252
4684  0052 1404          	and	a,(OFST+2,sp)
4685  0054 6b01          	ld	(OFST-1,sp),a
4686                     ; 1077   tim2_flag_h = (uint8_t)((uint16_t)TIM2_FLAG >> 8);
4688  0056 7b03          	ld	a,(OFST+1,sp)
4689  0058 6b02          	ld	(OFST+0,sp),a
4690                     ; 1079   if ((tim2_flag_l | (uint8_t)(TIM2->SR2 & tim2_flag_h)) != (uint8_t)RESET )
4692  005a c65305        	ld	a,21253
4693  005d 1402          	and	a,(OFST+0,sp)
4694  005f 1a01          	or	a,(OFST-1,sp)
4695  0061 2706          	jreq	L7371
4696                     ; 1081     bitstatus = SET;
4698  0063 a601          	ld	a,#1
4699  0065 6b02          	ld	(OFST+0,sp),a
4701  0067 2002          	jra	L1471
4702  0069               L7371:
4703                     ; 1085     bitstatus = RESET;
4705  0069 0f02          	clr	(OFST+0,sp)
4706  006b               L1471:
4707                     ; 1087   return (FlagStatus)bitstatus;
4709  006b 7b02          	ld	a,(OFST+0,sp)
4712  006d 5b04          	addw	sp,#4
4713  006f 81            	ret
4749                     ; 1103 void TIM2_ClearFlag(TIM2_FLAG_TypeDef TIM2_FLAG)
4749                     ; 1104 {
4750                     .text:	section	.text,new
4751  0000               _TIM2_ClearFlag:
4753  0000 89            	pushw	x
4754       00000000      OFST:	set	0
4757                     ; 1106   assert_param(IS_TIM2_CLEAR_FLAG_OK(TIM2_FLAG));
4759  0001 01            	rrwa	x,a
4760  0002 a4f0          	and	a,#240
4761  0004 01            	rrwa	x,a
4762  0005 a4f1          	and	a,#241
4763  0007 01            	rrwa	x,a
4764  0008 a30000        	cpw	x,#0
4765  000b 2607          	jrne	L635
4766  000d 1e01          	ldw	x,(OFST+1,sp)
4767  000f 2703          	jreq	L635
4768  0011 4f            	clr	a
4769  0012 2010          	jra	L045
4770  0014               L635:
4771  0014 ae0452        	ldw	x,#1106
4772  0017 89            	pushw	x
4773  0018 ae0000        	ldw	x,#0
4774  001b 89            	pushw	x
4775  001c ae0000        	ldw	x,#L702
4776  001f cd0000        	call	_assert_failed
4778  0022 5b04          	addw	sp,#4
4779  0024               L045:
4780                     ; 1109   TIM2->SR1 = (uint8_t)(~((uint8_t)(TIM2_FLAG)));
4782  0024 7b02          	ld	a,(OFST+2,sp)
4783  0026 43            	cpl	a
4784  0027 c75304        	ld	21252,a
4785                     ; 1110   TIM2->SR2 = (uint8_t)(~((uint8_t)((uint8_t)TIM2_FLAG >> 8)));
4787  002a 35ff5305      	mov	21253,#255
4788                     ; 1111 }
4791  002e 85            	popw	x
4792  002f 81            	ret
4857                     ; 1123 ITStatus TIM2_GetITStatus(TIM2_IT_TypeDef TIM2_IT)
4857                     ; 1124 {
4858                     .text:	section	.text,new
4859  0000               _TIM2_GetITStatus:
4861  0000 88            	push	a
4862  0001 89            	pushw	x
4863       00000002      OFST:	set	2
4866                     ; 1125   ITStatus bitstatus = RESET;
4868  0002 7b02          	ld	a,(OFST+0,sp)
4869  0004 97            	ld	xl,a
4870                     ; 1126   uint8_t TIM2_itStatus = 0, TIM2_itEnable = 0;
4872  0005 7b01          	ld	a,(OFST-1,sp)
4873  0007 97            	ld	xl,a
4876  0008 7b02          	ld	a,(OFST+0,sp)
4877  000a 97            	ld	xl,a
4878                     ; 1129   assert_param(IS_TIM2_GET_IT_OK(TIM2_IT));
4880  000b 7b03          	ld	a,(OFST+1,sp)
4881  000d a101          	cp	a,#1
4882  000f 2712          	jreq	L645
4883  0011 7b03          	ld	a,(OFST+1,sp)
4884  0013 a102          	cp	a,#2
4885  0015 270c          	jreq	L645
4886  0017 7b03          	ld	a,(OFST+1,sp)
4887  0019 a104          	cp	a,#4
4888  001b 2706          	jreq	L645
4889  001d 7b03          	ld	a,(OFST+1,sp)
4890  001f a108          	cp	a,#8
4891  0021 2603          	jrne	L445
4892  0023               L645:
4893  0023 4f            	clr	a
4894  0024 2010          	jra	L055
4895  0026               L445:
4896  0026 ae0469        	ldw	x,#1129
4897  0029 89            	pushw	x
4898  002a ae0000        	ldw	x,#0
4899  002d 89            	pushw	x
4900  002e ae0000        	ldw	x,#L702
4901  0031 cd0000        	call	_assert_failed
4903  0034 5b04          	addw	sp,#4
4904  0036               L055:
4905                     ; 1131   TIM2_itStatus = (uint8_t)(TIM2->SR1 & TIM2_IT);
4907  0036 c65304        	ld	a,21252
4908  0039 1403          	and	a,(OFST+1,sp)
4909  003b 6b01          	ld	(OFST-1,sp),a
4910                     ; 1133   TIM2_itEnable = (uint8_t)(TIM2->IER & TIM2_IT);
4912  003d c65303        	ld	a,21251
4913  0040 1403          	and	a,(OFST+1,sp)
4914  0042 6b02          	ld	(OFST+0,sp),a
4915                     ; 1135   if ((TIM2_itStatus != (uint8_t)RESET ) && (TIM2_itEnable != (uint8_t)RESET ))
4917  0044 0d01          	tnz	(OFST-1,sp)
4918  0046 270a          	jreq	L3102
4920  0048 0d02          	tnz	(OFST+0,sp)
4921  004a 2706          	jreq	L3102
4922                     ; 1137     bitstatus = SET;
4924  004c a601          	ld	a,#1
4925  004e 6b02          	ld	(OFST+0,sp),a
4927  0050 2002          	jra	L5102
4928  0052               L3102:
4929                     ; 1141     bitstatus = RESET;
4931  0052 0f02          	clr	(OFST+0,sp)
4932  0054               L5102:
4933                     ; 1143   return (ITStatus)(bitstatus);
4935  0054 7b02          	ld	a,(OFST+0,sp)
4938  0056 5b03          	addw	sp,#3
4939  0058 81            	ret
4976                     ; 1156 void TIM2_ClearITPendingBit(TIM2_IT_TypeDef TIM2_IT)
4976                     ; 1157 {
4977                     .text:	section	.text,new
4978  0000               _TIM2_ClearITPendingBit:
4980  0000 88            	push	a
4981       00000000      OFST:	set	0
4984                     ; 1159   assert_param(IS_TIM2_IT_OK(TIM2_IT));
4986  0001 4d            	tnz	a
4987  0002 2707          	jreq	L455
4988  0004 a110          	cp	a,#16
4989  0006 2403          	jruge	L455
4990  0008 4f            	clr	a
4991  0009 2010          	jra	L655
4992  000b               L455:
4993  000b ae0487        	ldw	x,#1159
4994  000e 89            	pushw	x
4995  000f ae0000        	ldw	x,#0
4996  0012 89            	pushw	x
4997  0013 ae0000        	ldw	x,#L702
4998  0016 cd0000        	call	_assert_failed
5000  0019 5b04          	addw	sp,#4
5001  001b               L655:
5002                     ; 1162   TIM2->SR1 = (uint8_t)(~TIM2_IT);
5004  001b 7b01          	ld	a,(OFST+1,sp)
5005  001d 43            	cpl	a
5006  001e c75304        	ld	21252,a
5007                     ; 1163 }
5010  0021 84            	pop	a
5011  0022 81            	ret
5063                     ; 1181 static void TI1_Config(uint8_t TIM2_ICPolarity,
5063                     ; 1182                        uint8_t TIM2_ICSelection,
5063                     ; 1183                        uint8_t TIM2_ICFilter)
5063                     ; 1184 {
5064                     .text:	section	.text,new
5065  0000               L3_TI1_Config:
5067  0000 89            	pushw	x
5068  0001 88            	push	a
5069       00000001      OFST:	set	1
5072                     ; 1186   TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1E);
5074  0002 7211530a      	bres	21258,#0
5075                     ; 1189   TIM2->CCMR1  = (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~(uint8_t)( TIM2_CCMR_CCxS | TIM2_CCMR_ICxF )))
5075                     ; 1190                            | (uint8_t)(((TIM2_ICSelection)) | ((uint8_t)( TIM2_ICFilter << 4))));
5077  0006 7b06          	ld	a,(OFST+5,sp)
5078  0008 97            	ld	xl,a
5079  0009 a610          	ld	a,#16
5080  000b 42            	mul	x,a
5081  000c 9f            	ld	a,xl
5082  000d 1a03          	or	a,(OFST+2,sp)
5083  000f 6b01          	ld	(OFST+0,sp),a
5084  0011 c65307        	ld	a,21255
5085  0014 a40c          	and	a,#12
5086  0016 1a01          	or	a,(OFST+0,sp)
5087  0018 c75307        	ld	21255,a
5088                     ; 1193   if (TIM2_ICPolarity != TIM2_ICPOLARITY_RISING)
5090  001b 0d02          	tnz	(OFST+1,sp)
5091  001d 2706          	jreq	L3602
5092                     ; 1195     TIM2->CCER1 |= TIM2_CCER1_CC1P;
5094  001f 7212530a      	bset	21258,#1
5096  0023 2004          	jra	L5602
5097  0025               L3602:
5098                     ; 1199     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1P);
5100  0025 7213530a      	bres	21258,#1
5101  0029               L5602:
5102                     ; 1202   TIM2->CCER1 |= TIM2_CCER1_CC1E;
5104  0029 7210530a      	bset	21258,#0
5105                     ; 1203 }
5108  002d 5b03          	addw	sp,#3
5109  002f 81            	ret
5161                     ; 1221 static void TI2_Config(uint8_t TIM2_ICPolarity,
5161                     ; 1222                        uint8_t TIM2_ICSelection,
5161                     ; 1223                        uint8_t TIM2_ICFilter)
5161                     ; 1224 {
5162                     .text:	section	.text,new
5163  0000               L5_TI2_Config:
5165  0000 89            	pushw	x
5166  0001 88            	push	a
5167       00000001      OFST:	set	1
5170                     ; 1226   TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2E);
5172  0002 7219530a      	bres	21258,#4
5173                     ; 1229   TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~(uint8_t)( TIM2_CCMR_CCxS | TIM2_CCMR_ICxF ))) 
5173                     ; 1230                           | (uint8_t)(( (TIM2_ICSelection)) | ((uint8_t)( TIM2_ICFilter << 4))));
5175  0006 7b06          	ld	a,(OFST+5,sp)
5176  0008 97            	ld	xl,a
5177  0009 a610          	ld	a,#16
5178  000b 42            	mul	x,a
5179  000c 9f            	ld	a,xl
5180  000d 1a03          	or	a,(OFST+2,sp)
5181  000f 6b01          	ld	(OFST+0,sp),a
5182  0011 c65308        	ld	a,21256
5183  0014 a40c          	and	a,#12
5184  0016 1a01          	or	a,(OFST+0,sp)
5185  0018 c75308        	ld	21256,a
5186                     ; 1234   if (TIM2_ICPolarity != TIM2_ICPOLARITY_RISING)
5188  001b 0d02          	tnz	(OFST+1,sp)
5189  001d 2706          	jreq	L5112
5190                     ; 1236     TIM2->CCER1 |= TIM2_CCER1_CC2P;
5192  001f 721a530a      	bset	21258,#5
5194  0023 2004          	jra	L7112
5195  0025               L5112:
5196                     ; 1240     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2P);
5198  0025 721b530a      	bres	21258,#5
5199  0029               L7112:
5200                     ; 1244   TIM2->CCER1 |= TIM2_CCER1_CC2E;
5202  0029 7218530a      	bset	21258,#4
5203                     ; 1245 }
5206  002d 5b03          	addw	sp,#3
5207  002f 81            	ret
5259                     ; 1261 static void TI3_Config(uint8_t TIM2_ICPolarity, uint8_t TIM2_ICSelection,
5259                     ; 1262                        uint8_t TIM2_ICFilter)
5259                     ; 1263 {
5260                     .text:	section	.text,new
5261  0000               L7_TI3_Config:
5263  0000 89            	pushw	x
5264  0001 88            	push	a
5265       00000001      OFST:	set	1
5268                     ; 1265   TIM2->CCER2 &=  (uint8_t)(~TIM2_CCER2_CC3E);
5270  0002 7211530b      	bres	21259,#0
5271                     ; 1268   TIM2->CCMR3 = (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~( TIM2_CCMR_CCxS | TIM2_CCMR_ICxF))) 
5271                     ; 1269                           | (uint8_t)(( (TIM2_ICSelection)) | ((uint8_t)( TIM2_ICFilter << 4))));
5273  0006 7b06          	ld	a,(OFST+5,sp)
5274  0008 97            	ld	xl,a
5275  0009 a610          	ld	a,#16
5276  000b 42            	mul	x,a
5277  000c 9f            	ld	a,xl
5278  000d 1a03          	or	a,(OFST+2,sp)
5279  000f 6b01          	ld	(OFST+0,sp),a
5280  0011 c65309        	ld	a,21257
5281  0014 a40c          	and	a,#12
5282  0016 1a01          	or	a,(OFST+0,sp)
5283  0018 c75309        	ld	21257,a
5284                     ; 1273   if (TIM2_ICPolarity != TIM2_ICPOLARITY_RISING)
5286  001b 0d02          	tnz	(OFST+1,sp)
5287  001d 2706          	jreq	L7412
5288                     ; 1275     TIM2->CCER2 |= TIM2_CCER2_CC3P;
5290  001f 7212530b      	bset	21259,#1
5292  0023 2004          	jra	L1512
5293  0025               L7412:
5294                     ; 1279     TIM2->CCER2 &= (uint8_t)(~TIM2_CCER2_CC3P);
5296  0025 7213530b      	bres	21259,#1
5297  0029               L1512:
5298                     ; 1282   TIM2->CCER2 |= TIM2_CCER2_CC3E;
5300  0029 7210530b      	bset	21259,#0
5301                     ; 1283 }
5304  002d 5b03          	addw	sp,#3
5305  002f 81            	ret
5318                     	xdef	_TIM2_ClearITPendingBit
5319                     	xdef	_TIM2_GetITStatus
5320                     	xdef	_TIM2_ClearFlag
5321                     	xdef	_TIM2_GetFlagStatus
5322                     	xdef	_TIM2_GetPrescaler
5323                     	xdef	_TIM2_GetCounter
5324                     	xdef	_TIM2_GetCapture3
5325                     	xdef	_TIM2_GetCapture2
5326                     	xdef	_TIM2_GetCapture1
5327                     	xdef	_TIM2_SetIC3Prescaler
5328                     	xdef	_TIM2_SetIC2Prescaler
5329                     	xdef	_TIM2_SetIC1Prescaler
5330                     	xdef	_TIM2_SetCompare3
5331                     	xdef	_TIM2_SetCompare2
5332                     	xdef	_TIM2_SetCompare1
5333                     	xdef	_TIM2_SetAutoreload
5334                     	xdef	_TIM2_SetCounter
5335                     	xdef	_TIM2_SelectOCxM
5336                     	xdef	_TIM2_CCxCmd
5337                     	xdef	_TIM2_OC3PolarityConfig
5338                     	xdef	_TIM2_OC2PolarityConfig
5339                     	xdef	_TIM2_OC1PolarityConfig
5340                     	xdef	_TIM2_GenerateEvent
5341                     	xdef	_TIM2_OC3PreloadConfig
5342                     	xdef	_TIM2_OC2PreloadConfig
5343                     	xdef	_TIM2_OC1PreloadConfig
5344                     	xdef	_TIM2_ARRPreloadConfig
5345                     	xdef	_TIM2_ForcedOC3Config
5346                     	xdef	_TIM2_ForcedOC2Config
5347                     	xdef	_TIM2_ForcedOC1Config
5348                     	xdef	_TIM2_PrescalerConfig
5349                     	xdef	_TIM2_SelectOnePulseMode
5350                     	xdef	_TIM2_UpdateRequestConfig
5351                     	xdef	_TIM2_UpdateDisableConfig
5352                     	xdef	_TIM2_ITConfig
5353                     	xdef	_TIM2_Cmd
5354                     	xdef	_TIM2_PWMIConfig
5355                     	xdef	_TIM2_ICInit
5356                     	xdef	_TIM2_OC3Init
5357                     	xdef	_TIM2_OC2Init
5358                     	xdef	_TIM2_OC1Init
5359                     	xdef	_TIM2_TimeBaseInit
5360                     	xdef	_TIM2_DeInit
5361                     	xref	_assert_failed
5362                     .const:	section	.text
5363  0000               L702:
5364  0000 2e2e5c2e2e5c  	dc.b	"..\..\..\libraries"
5365  0012 5c73746d3873  	dc.b	"\stm8s_stdperiph_d"
5366  0024 72697665725c  	dc.b	"river\src\stm8s_ti"
5367  0036 6d322e6300    	dc.b	"m2.c",0
5387                     	end
