   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
  32                     ; 52 void ADC1_DeInit(void)
  32                     ; 53 {
  34                     .text:	section	.text,new
  35  0000               _ADC1_DeInit:
  39                     ; 54   ADC1->CSR  = ADC1_CSR_RESET_VALUE;
  41  0000 725f5400      	clr	21504
  42                     ; 55   ADC1->CR1  = ADC1_CR1_RESET_VALUE;
  44  0004 725f5401      	clr	21505
  45                     ; 56   ADC1->CR2  = ADC1_CR2_RESET_VALUE;
  47  0008 725f5402      	clr	21506
  48                     ; 57   ADC1->CR3  = ADC1_CR3_RESET_VALUE;
  50  000c 725f5403      	clr	21507
  51                     ; 58   ADC1->TDRH = ADC1_TDRH_RESET_VALUE;
  53  0010 725f5406      	clr	21510
  54                     ; 59   ADC1->TDRL = ADC1_TDRL_RESET_VALUE;
  56  0014 725f5407      	clr	21511
  57                     ; 60   ADC1->HTRH = ADC1_HTRH_RESET_VALUE;
  59  0018 35ff5408      	mov	21512,#255
  60                     ; 61   ADC1->HTRL = ADC1_HTRL_RESET_VALUE;
  62  001c 35035409      	mov	21513,#3
  63                     ; 62   ADC1->LTRH = ADC1_LTRH_RESET_VALUE;
  65  0020 725f540a      	clr	21514
  66                     ; 63   ADC1->LTRL = ADC1_LTRL_RESET_VALUE;
  68  0024 725f540b      	clr	21515
  69                     ; 64   ADC1->AWCRH = ADC1_AWCRH_RESET_VALUE;
  71  0028 725f540e      	clr	21518
  72                     ; 65   ADC1->AWCRL = ADC1_AWCRL_RESET_VALUE;
  74  002c 725f540f      	clr	21519
  75                     ; 66 }
  78  0030 81            	ret
 530                     ; 88 void ADC1_Init(ADC1_ConvMode_TypeDef ADC1_ConversionMode, ADC1_Channel_TypeDef ADC1_Channel, ADC1_PresSel_TypeDef ADC1_PrescalerSelection, ADC1_ExtTrig_TypeDef ADC1_ExtTrigger, FunctionalState ADC1_ExtTriggerState, ADC1_Align_TypeDef ADC1_Align, ADC1_SchmittTrigg_TypeDef ADC1_SchmittTriggerChannel, FunctionalState ADC1_SchmittTriggerState)
 530                     ; 89 {
 531                     .text:	section	.text,new
 532  0000               _ADC1_Init:
 534  0000 89            	pushw	x
 535       00000000      OFST:	set	0
 538                     ; 91   assert_param(IS_ADC1_CONVERSIONMODE_OK(ADC1_ConversionMode));
 540  0001 9e            	ld	a,xh
 541  0002 4d            	tnz	a
 542  0003 2705          	jreq	L21
 543  0005 9e            	ld	a,xh
 544  0006 a101          	cp	a,#1
 545  0008 2603          	jrne	L01
 546  000a               L21:
 547  000a 4f            	clr	a
 548  000b 2010          	jra	L41
 549  000d               L01:
 550  000d ae005b        	ldw	x,#91
 551  0010 89            	pushw	x
 552  0011 ae0000        	ldw	x,#0
 553  0014 89            	pushw	x
 554  0015 ae0000        	ldw	x,#L542
 555  0018 cd0000        	call	_assert_failed
 557  001b 5b04          	addw	sp,#4
 558  001d               L41:
 559                     ; 92   assert_param(IS_ADC1_CHANNEL_OK(ADC1_Channel));
 561  001d 0d02          	tnz	(OFST+2,sp)
 562  001f 273c          	jreq	L02
 563  0021 7b02          	ld	a,(OFST+2,sp)
 564  0023 a101          	cp	a,#1
 565  0025 2736          	jreq	L02
 566  0027 7b02          	ld	a,(OFST+2,sp)
 567  0029 a102          	cp	a,#2
 568  002b 2730          	jreq	L02
 569  002d 7b02          	ld	a,(OFST+2,sp)
 570  002f a103          	cp	a,#3
 571  0031 272a          	jreq	L02
 572  0033 7b02          	ld	a,(OFST+2,sp)
 573  0035 a104          	cp	a,#4
 574  0037 2724          	jreq	L02
 575  0039 7b02          	ld	a,(OFST+2,sp)
 576  003b a105          	cp	a,#5
 577  003d 271e          	jreq	L02
 578  003f 7b02          	ld	a,(OFST+2,sp)
 579  0041 a106          	cp	a,#6
 580  0043 2718          	jreq	L02
 581  0045 7b02          	ld	a,(OFST+2,sp)
 582  0047 a107          	cp	a,#7
 583  0049 2712          	jreq	L02
 584  004b 7b02          	ld	a,(OFST+2,sp)
 585  004d a108          	cp	a,#8
 586  004f 270c          	jreq	L02
 587  0051 7b02          	ld	a,(OFST+2,sp)
 588  0053 a10c          	cp	a,#12
 589  0055 2706          	jreq	L02
 590  0057 7b02          	ld	a,(OFST+2,sp)
 591  0059 a109          	cp	a,#9
 592  005b 2603          	jrne	L61
 593  005d               L02:
 594  005d 4f            	clr	a
 595  005e 2010          	jra	L22
 596  0060               L61:
 597  0060 ae005c        	ldw	x,#92
 598  0063 89            	pushw	x
 599  0064 ae0000        	ldw	x,#0
 600  0067 89            	pushw	x
 601  0068 ae0000        	ldw	x,#L542
 602  006b cd0000        	call	_assert_failed
 604  006e 5b04          	addw	sp,#4
 605  0070               L22:
 606                     ; 93   assert_param(IS_ADC1_PRESSEL_OK(ADC1_PrescalerSelection));
 608  0070 0d05          	tnz	(OFST+5,sp)
 609  0072 272a          	jreq	L62
 610  0074 7b05          	ld	a,(OFST+5,sp)
 611  0076 a110          	cp	a,#16
 612  0078 2724          	jreq	L62
 613  007a 7b05          	ld	a,(OFST+5,sp)
 614  007c a120          	cp	a,#32
 615  007e 271e          	jreq	L62
 616  0080 7b05          	ld	a,(OFST+5,sp)
 617  0082 a130          	cp	a,#48
 618  0084 2718          	jreq	L62
 619  0086 7b05          	ld	a,(OFST+5,sp)
 620  0088 a140          	cp	a,#64
 621  008a 2712          	jreq	L62
 622  008c 7b05          	ld	a,(OFST+5,sp)
 623  008e a150          	cp	a,#80
 624  0090 270c          	jreq	L62
 625  0092 7b05          	ld	a,(OFST+5,sp)
 626  0094 a160          	cp	a,#96
 627  0096 2706          	jreq	L62
 628  0098 7b05          	ld	a,(OFST+5,sp)
 629  009a a170          	cp	a,#112
 630  009c 2603          	jrne	L42
 631  009e               L62:
 632  009e 4f            	clr	a
 633  009f 2010          	jra	L03
 634  00a1               L42:
 635  00a1 ae005d        	ldw	x,#93
 636  00a4 89            	pushw	x
 637  00a5 ae0000        	ldw	x,#0
 638  00a8 89            	pushw	x
 639  00a9 ae0000        	ldw	x,#L542
 640  00ac cd0000        	call	_assert_failed
 642  00af 5b04          	addw	sp,#4
 643  00b1               L03:
 644                     ; 94   assert_param(IS_ADC1_EXTTRIG_OK(ADC1_ExtTrigger));
 646  00b1 0d06          	tnz	(OFST+6,sp)
 647  00b3 2706          	jreq	L43
 648  00b5 7b06          	ld	a,(OFST+6,sp)
 649  00b7 a110          	cp	a,#16
 650  00b9 2603          	jrne	L23
 651  00bb               L43:
 652  00bb 4f            	clr	a
 653  00bc 2010          	jra	L63
 654  00be               L23:
 655  00be ae005e        	ldw	x,#94
 656  00c1 89            	pushw	x
 657  00c2 ae0000        	ldw	x,#0
 658  00c5 89            	pushw	x
 659  00c6 ae0000        	ldw	x,#L542
 660  00c9 cd0000        	call	_assert_failed
 662  00cc 5b04          	addw	sp,#4
 663  00ce               L63:
 664                     ; 95   assert_param(IS_FUNCTIONALSTATE_OK(((ADC1_ExtTriggerState))));
 666  00ce 0d07          	tnz	(OFST+7,sp)
 667  00d0 2706          	jreq	L24
 668  00d2 7b07          	ld	a,(OFST+7,sp)
 669  00d4 a101          	cp	a,#1
 670  00d6 2603          	jrne	L04
 671  00d8               L24:
 672  00d8 4f            	clr	a
 673  00d9 2010          	jra	L44
 674  00db               L04:
 675  00db ae005f        	ldw	x,#95
 676  00de 89            	pushw	x
 677  00df ae0000        	ldw	x,#0
 678  00e2 89            	pushw	x
 679  00e3 ae0000        	ldw	x,#L542
 680  00e6 cd0000        	call	_assert_failed
 682  00e9 5b04          	addw	sp,#4
 683  00eb               L44:
 684                     ; 96   assert_param(IS_ADC1_ALIGN_OK(ADC1_Align));
 686  00eb 0d08          	tnz	(OFST+8,sp)
 687  00ed 2706          	jreq	L05
 688  00ef 7b08          	ld	a,(OFST+8,sp)
 689  00f1 a108          	cp	a,#8
 690  00f3 2603          	jrne	L64
 691  00f5               L05:
 692  00f5 4f            	clr	a
 693  00f6 2010          	jra	L25
 694  00f8               L64:
 695  00f8 ae0060        	ldw	x,#96
 696  00fb 89            	pushw	x
 697  00fc ae0000        	ldw	x,#0
 698  00ff 89            	pushw	x
 699  0100 ae0000        	ldw	x,#L542
 700  0103 cd0000        	call	_assert_failed
 702  0106 5b04          	addw	sp,#4
 703  0108               L25:
 704                     ; 97   assert_param(IS_ADC1_SCHMITTTRIG_OK(ADC1_SchmittTriggerChannel));
 706  0108 0d09          	tnz	(OFST+9,sp)
 707  010a 2742          	jreq	L65
 708  010c 7b09          	ld	a,(OFST+9,sp)
 709  010e a101          	cp	a,#1
 710  0110 273c          	jreq	L65
 711  0112 7b09          	ld	a,(OFST+9,sp)
 712  0114 a102          	cp	a,#2
 713  0116 2736          	jreq	L65
 714  0118 7b09          	ld	a,(OFST+9,sp)
 715  011a a103          	cp	a,#3
 716  011c 2730          	jreq	L65
 717  011e 7b09          	ld	a,(OFST+9,sp)
 718  0120 a104          	cp	a,#4
 719  0122 272a          	jreq	L65
 720  0124 7b09          	ld	a,(OFST+9,sp)
 721  0126 a105          	cp	a,#5
 722  0128 2724          	jreq	L65
 723  012a 7b09          	ld	a,(OFST+9,sp)
 724  012c a106          	cp	a,#6
 725  012e 271e          	jreq	L65
 726  0130 7b09          	ld	a,(OFST+9,sp)
 727  0132 a107          	cp	a,#7
 728  0134 2718          	jreq	L65
 729  0136 7b09          	ld	a,(OFST+9,sp)
 730  0138 a108          	cp	a,#8
 731  013a 2712          	jreq	L65
 732  013c 7b09          	ld	a,(OFST+9,sp)
 733  013e a10c          	cp	a,#12
 734  0140 270c          	jreq	L65
 735  0142 7b09          	ld	a,(OFST+9,sp)
 736  0144 a1ff          	cp	a,#255
 737  0146 2706          	jreq	L65
 738  0148 7b09          	ld	a,(OFST+9,sp)
 739  014a a109          	cp	a,#9
 740  014c 2603          	jrne	L45
 741  014e               L65:
 742  014e 4f            	clr	a
 743  014f 2010          	jra	L06
 744  0151               L45:
 745  0151 ae0061        	ldw	x,#97
 746  0154 89            	pushw	x
 747  0155 ae0000        	ldw	x,#0
 748  0158 89            	pushw	x
 749  0159 ae0000        	ldw	x,#L542
 750  015c cd0000        	call	_assert_failed
 752  015f 5b04          	addw	sp,#4
 753  0161               L06:
 754                     ; 98   assert_param(IS_FUNCTIONALSTATE_OK(ADC1_SchmittTriggerState));
 756  0161 0d0a          	tnz	(OFST+10,sp)
 757  0163 2706          	jreq	L46
 758  0165 7b0a          	ld	a,(OFST+10,sp)
 759  0167 a101          	cp	a,#1
 760  0169 2603          	jrne	L26
 761  016b               L46:
 762  016b 4f            	clr	a
 763  016c 2010          	jra	L66
 764  016e               L26:
 765  016e ae0062        	ldw	x,#98
 766  0171 89            	pushw	x
 767  0172 ae0000        	ldw	x,#0
 768  0175 89            	pushw	x
 769  0176 ae0000        	ldw	x,#L542
 770  0179 cd0000        	call	_assert_failed
 772  017c 5b04          	addw	sp,#4
 773  017e               L66:
 774                     ; 103   ADC1_ConversionConfig(ADC1_ConversionMode, ADC1_Channel, ADC1_Align);
 776  017e 7b08          	ld	a,(OFST+8,sp)
 777  0180 88            	push	a
 778  0181 7b03          	ld	a,(OFST+3,sp)
 779  0183 97            	ld	xl,a
 780  0184 7b02          	ld	a,(OFST+2,sp)
 781  0186 95            	ld	xh,a
 782  0187 cd0000        	call	_ADC1_ConversionConfig
 784  018a 84            	pop	a
 785                     ; 105   ADC1_PrescalerConfig(ADC1_PrescalerSelection);
 787  018b 7b05          	ld	a,(OFST+5,sp)
 788  018d cd0000        	call	_ADC1_PrescalerConfig
 790                     ; 110   ADC1_ExternalTriggerConfig(ADC1_ExtTrigger, ADC1_ExtTriggerState);
 792  0190 7b07          	ld	a,(OFST+7,sp)
 793  0192 97            	ld	xl,a
 794  0193 7b06          	ld	a,(OFST+6,sp)
 795  0195 95            	ld	xh,a
 796  0196 cd0000        	call	_ADC1_ExternalTriggerConfig
 798                     ; 115   ADC1_SchmittTriggerConfig(ADC1_SchmittTriggerChannel, ADC1_SchmittTriggerState);
 800  0199 7b0a          	ld	a,(OFST+10,sp)
 801  019b 97            	ld	xl,a
 802  019c 7b09          	ld	a,(OFST+9,sp)
 803  019e 95            	ld	xh,a
 804  019f cd0000        	call	_ADC1_SchmittTriggerConfig
 806                     ; 118   ADC1->CR1 |= ADC1_CR1_ADON;
 808  01a2 72105401      	bset	21505,#0
 809                     ; 119 }
 812  01a6 85            	popw	x
 813  01a7 81            	ret
 849                     ; 126 void ADC1_Cmd(FunctionalState NewState)
 849                     ; 127 {
 850                     .text:	section	.text,new
 851  0000               _ADC1_Cmd:
 853  0000 88            	push	a
 854       00000000      OFST:	set	0
 857                     ; 129   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 859  0001 4d            	tnz	a
 860  0002 2704          	jreq	L47
 861  0004 a101          	cp	a,#1
 862  0006 2603          	jrne	L27
 863  0008               L47:
 864  0008 4f            	clr	a
 865  0009 2010          	jra	L67
 866  000b               L27:
 867  000b ae0081        	ldw	x,#129
 868  000e 89            	pushw	x
 869  000f ae0000        	ldw	x,#0
 870  0012 89            	pushw	x
 871  0013 ae0000        	ldw	x,#L542
 872  0016 cd0000        	call	_assert_failed
 874  0019 5b04          	addw	sp,#4
 875  001b               L67:
 876                     ; 131   if (NewState != DISABLE)
 878  001b 0d01          	tnz	(OFST+1,sp)
 879  001d 2706          	jreq	L562
 880                     ; 133     ADC1->CR1 |= ADC1_CR1_ADON;
 882  001f 72105401      	bset	21505,#0
 884  0023 2004          	jra	L762
 885  0025               L562:
 886                     ; 137     ADC1->CR1 &= (uint8_t)(~ADC1_CR1_ADON);
 888  0025 72115401      	bres	21505,#0
 889  0029               L762:
 890                     ; 139 }
 893  0029 84            	pop	a
 894  002a 81            	ret
 930                     ; 146 void ADC1_ScanModeCmd(FunctionalState NewState)
 930                     ; 147 {
 931                     .text:	section	.text,new
 932  0000               _ADC1_ScanModeCmd:
 934  0000 88            	push	a
 935       00000000      OFST:	set	0
 938                     ; 149   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 940  0001 4d            	tnz	a
 941  0002 2704          	jreq	L401
 942  0004 a101          	cp	a,#1
 943  0006 2603          	jrne	L201
 944  0008               L401:
 945  0008 4f            	clr	a
 946  0009 2010          	jra	L601
 947  000b               L201:
 948  000b ae0095        	ldw	x,#149
 949  000e 89            	pushw	x
 950  000f ae0000        	ldw	x,#0
 951  0012 89            	pushw	x
 952  0013 ae0000        	ldw	x,#L542
 953  0016 cd0000        	call	_assert_failed
 955  0019 5b04          	addw	sp,#4
 956  001b               L601:
 957                     ; 151   if (NewState != DISABLE)
 959  001b 0d01          	tnz	(OFST+1,sp)
 960  001d 2706          	jreq	L703
 961                     ; 153     ADC1->CR2 |= ADC1_CR2_SCAN;
 963  001f 72125402      	bset	21506,#1
 965  0023 2004          	jra	L113
 966  0025               L703:
 967                     ; 157     ADC1->CR2 &= (uint8_t)(~ADC1_CR2_SCAN);
 969  0025 72135402      	bres	21506,#1
 970  0029               L113:
 971                     ; 159 }
 974  0029 84            	pop	a
 975  002a 81            	ret
1011                     ; 166 void ADC1_DataBufferCmd(FunctionalState NewState)
1011                     ; 167 {
1012                     .text:	section	.text,new
1013  0000               _ADC1_DataBufferCmd:
1015  0000 88            	push	a
1016       00000000      OFST:	set	0
1019                     ; 169   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1021  0001 4d            	tnz	a
1022  0002 2704          	jreq	L411
1023  0004 a101          	cp	a,#1
1024  0006 2603          	jrne	L211
1025  0008               L411:
1026  0008 4f            	clr	a
1027  0009 2010          	jra	L611
1028  000b               L211:
1029  000b ae00a9        	ldw	x,#169
1030  000e 89            	pushw	x
1031  000f ae0000        	ldw	x,#0
1032  0012 89            	pushw	x
1033  0013 ae0000        	ldw	x,#L542
1034  0016 cd0000        	call	_assert_failed
1036  0019 5b04          	addw	sp,#4
1037  001b               L611:
1038                     ; 171   if (NewState != DISABLE)
1040  001b 0d01          	tnz	(OFST+1,sp)
1041  001d 2706          	jreq	L133
1042                     ; 173     ADC1->CR3 |= ADC1_CR3_DBUF;
1044  001f 721e5403      	bset	21507,#7
1046  0023 2004          	jra	L333
1047  0025               L133:
1048                     ; 177     ADC1->CR3 &= (uint8_t)(~ADC1_CR3_DBUF);
1050  0025 721f5403      	bres	21507,#7
1051  0029               L333:
1052                     ; 179 }
1055  0029 84            	pop	a
1056  002a 81            	ret
1213                     ; 190 void ADC1_ITConfig(ADC1_IT_TypeDef ADC1_IT, FunctionalState NewState)
1213                     ; 191 {
1214                     .text:	section	.text,new
1215  0000               _ADC1_ITConfig:
1217  0000 89            	pushw	x
1218       00000000      OFST:	set	0
1221                     ; 193   assert_param(IS_ADC1_IT_OK(ADC1_IT));
1223  0001 a30020        	cpw	x,#32
1224  0004 2705          	jreq	L421
1225  0006 a30010        	cpw	x,#16
1226  0009 2603          	jrne	L221
1227  000b               L421:
1228  000b 4f            	clr	a
1229  000c 2010          	jra	L621
1230  000e               L221:
1231  000e ae00c1        	ldw	x,#193
1232  0011 89            	pushw	x
1233  0012 ae0000        	ldw	x,#0
1234  0015 89            	pushw	x
1235  0016 ae0000        	ldw	x,#L542
1236  0019 cd0000        	call	_assert_failed
1238  001c 5b04          	addw	sp,#4
1239  001e               L621:
1240                     ; 194   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1242  001e 0d05          	tnz	(OFST+5,sp)
1243  0020 2706          	jreq	L231
1244  0022 7b05          	ld	a,(OFST+5,sp)
1245  0024 a101          	cp	a,#1
1246  0026 2603          	jrne	L031
1247  0028               L231:
1248  0028 4f            	clr	a
1249  0029 2010          	jra	L431
1250  002b               L031:
1251  002b ae00c2        	ldw	x,#194
1252  002e 89            	pushw	x
1253  002f ae0000        	ldw	x,#0
1254  0032 89            	pushw	x
1255  0033 ae0000        	ldw	x,#L542
1256  0036 cd0000        	call	_assert_failed
1258  0039 5b04          	addw	sp,#4
1259  003b               L431:
1260                     ; 196   if (NewState != DISABLE)
1262  003b 0d05          	tnz	(OFST+5,sp)
1263  003d 270a          	jreq	L124
1264                     ; 199     ADC1->CSR |= (uint8_t)ADC1_IT;
1266  003f c65400        	ld	a,21504
1267  0042 1a02          	or	a,(OFST+2,sp)
1268  0044 c75400        	ld	21504,a
1270  0047 2009          	jra	L324
1271  0049               L124:
1272                     ; 204     ADC1->CSR &= (uint8_t)((uint16_t)~(uint16_t)ADC1_IT);
1274  0049 7b02          	ld	a,(OFST+2,sp)
1275  004b 43            	cpl	a
1276  004c c45400        	and	a,21504
1277  004f c75400        	ld	21504,a
1278  0052               L324:
1279                     ; 206 }
1282  0052 85            	popw	x
1283  0053 81            	ret
1320                     ; 214 void ADC1_PrescalerConfig(ADC1_PresSel_TypeDef ADC1_Prescaler)
1320                     ; 215 {
1321                     .text:	section	.text,new
1322  0000               _ADC1_PrescalerConfig:
1324  0000 88            	push	a
1325       00000000      OFST:	set	0
1328                     ; 217   assert_param(IS_ADC1_PRESSEL_OK(ADC1_Prescaler));
1330  0001 4d            	tnz	a
1331  0002 271c          	jreq	L241
1332  0004 a110          	cp	a,#16
1333  0006 2718          	jreq	L241
1334  0008 a120          	cp	a,#32
1335  000a 2714          	jreq	L241
1336  000c a130          	cp	a,#48
1337  000e 2710          	jreq	L241
1338  0010 a140          	cp	a,#64
1339  0012 270c          	jreq	L241
1340  0014 a150          	cp	a,#80
1341  0016 2708          	jreq	L241
1342  0018 a160          	cp	a,#96
1343  001a 2704          	jreq	L241
1344  001c a170          	cp	a,#112
1345  001e 2603          	jrne	L041
1346  0020               L241:
1347  0020 4f            	clr	a
1348  0021 2010          	jra	L441
1349  0023               L041:
1350  0023 ae00d9        	ldw	x,#217
1351  0026 89            	pushw	x
1352  0027 ae0000        	ldw	x,#0
1353  002a 89            	pushw	x
1354  002b ae0000        	ldw	x,#L542
1355  002e cd0000        	call	_assert_failed
1357  0031 5b04          	addw	sp,#4
1358  0033               L441:
1359                     ; 220   ADC1->CR1 &= (uint8_t)(~ADC1_CR1_SPSEL);
1361  0033 c65401        	ld	a,21505
1362  0036 a48f          	and	a,#143
1363  0038 c75401        	ld	21505,a
1364                     ; 222   ADC1->CR1 |= (uint8_t)(ADC1_Prescaler);
1366  003b c65401        	ld	a,21505
1367  003e 1a01          	or	a,(OFST+1,sp)
1368  0040 c75401        	ld	21505,a
1369                     ; 223 }
1372  0043 84            	pop	a
1373  0044 81            	ret
1421                     ; 233 void ADC1_SchmittTriggerConfig(ADC1_SchmittTrigg_TypeDef ADC1_SchmittTriggerChannel, FunctionalState NewState)
1421                     ; 234 {
1422                     .text:	section	.text,new
1423  0000               _ADC1_SchmittTriggerConfig:
1425  0000 89            	pushw	x
1426       00000000      OFST:	set	0
1429                     ; 236   assert_param(IS_ADC1_SCHMITTTRIG_OK(ADC1_SchmittTriggerChannel));
1431  0001 9e            	ld	a,xh
1432  0002 4d            	tnz	a
1433  0003 2737          	jreq	L251
1434  0005 9e            	ld	a,xh
1435  0006 a101          	cp	a,#1
1436  0008 2732          	jreq	L251
1437  000a 9e            	ld	a,xh
1438  000b a102          	cp	a,#2
1439  000d 272d          	jreq	L251
1440  000f 9e            	ld	a,xh
1441  0010 a103          	cp	a,#3
1442  0012 2728          	jreq	L251
1443  0014 9e            	ld	a,xh
1444  0015 a104          	cp	a,#4
1445  0017 2723          	jreq	L251
1446  0019 9e            	ld	a,xh
1447  001a a105          	cp	a,#5
1448  001c 271e          	jreq	L251
1449  001e 9e            	ld	a,xh
1450  001f a106          	cp	a,#6
1451  0021 2719          	jreq	L251
1452  0023 9e            	ld	a,xh
1453  0024 a107          	cp	a,#7
1454  0026 2714          	jreq	L251
1455  0028 9e            	ld	a,xh
1456  0029 a108          	cp	a,#8
1457  002b 270f          	jreq	L251
1458  002d 9e            	ld	a,xh
1459  002e a10c          	cp	a,#12
1460  0030 270a          	jreq	L251
1461  0032 9e            	ld	a,xh
1462  0033 a1ff          	cp	a,#255
1463  0035 2705          	jreq	L251
1464  0037 9e            	ld	a,xh
1465  0038 a109          	cp	a,#9
1466  003a 2603          	jrne	L051
1467  003c               L251:
1468  003c 4f            	clr	a
1469  003d 2010          	jra	L451
1470  003f               L051:
1471  003f ae00ec        	ldw	x,#236
1472  0042 89            	pushw	x
1473  0043 ae0000        	ldw	x,#0
1474  0046 89            	pushw	x
1475  0047 ae0000        	ldw	x,#L542
1476  004a cd0000        	call	_assert_failed
1478  004d 5b04          	addw	sp,#4
1479  004f               L451:
1480                     ; 237   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1482  004f 0d02          	tnz	(OFST+2,sp)
1483  0051 2706          	jreq	L061
1484  0053 7b02          	ld	a,(OFST+2,sp)
1485  0055 a101          	cp	a,#1
1486  0057 2603          	jrne	L651
1487  0059               L061:
1488  0059 4f            	clr	a
1489  005a 2010          	jra	L261
1490  005c               L651:
1491  005c ae00ed        	ldw	x,#237
1492  005f 89            	pushw	x
1493  0060 ae0000        	ldw	x,#0
1494  0063 89            	pushw	x
1495  0064 ae0000        	ldw	x,#L542
1496  0067 cd0000        	call	_assert_failed
1498  006a 5b04          	addw	sp,#4
1499  006c               L261:
1500                     ; 239   if (ADC1_SchmittTriggerChannel == ADC1_SCHMITTTRIG_ALL)
1502  006c 7b01          	ld	a,(OFST+1,sp)
1503  006e a1ff          	cp	a,#255
1504  0070 2620          	jrne	L564
1505                     ; 241     if (NewState != DISABLE)
1507  0072 0d02          	tnz	(OFST+2,sp)
1508  0074 270a          	jreq	L764
1509                     ; 243       ADC1->TDRL &= (uint8_t)0x0;
1511  0076 725f5407      	clr	21511
1512                     ; 244       ADC1->TDRH &= (uint8_t)0x0;
1514  007a 725f5406      	clr	21510
1516  007e 2078          	jra	L374
1517  0080               L764:
1518                     ; 248       ADC1->TDRL |= (uint8_t)0xFF;
1520  0080 c65407        	ld	a,21511
1521  0083 aaff          	or	a,#255
1522  0085 c75407        	ld	21511,a
1523                     ; 249       ADC1->TDRH |= (uint8_t)0xFF;
1525  0088 c65406        	ld	a,21510
1526  008b aaff          	or	a,#255
1527  008d c75406        	ld	21510,a
1528  0090 2066          	jra	L374
1529  0092               L564:
1530                     ; 252   else if (ADC1_SchmittTriggerChannel < ADC1_SCHMITTTRIG_CHANNEL8)
1532  0092 7b01          	ld	a,(OFST+1,sp)
1533  0094 a108          	cp	a,#8
1534  0096 242f          	jruge	L574
1535                     ; 254     if (NewState != DISABLE)
1537  0098 0d02          	tnz	(OFST+2,sp)
1538  009a 2716          	jreq	L774
1539                     ; 256       ADC1->TDRL &= (uint8_t)(~(uint8_t)((uint8_t)0x01 << (uint8_t)ADC1_SchmittTriggerChannel));
1541  009c 7b01          	ld	a,(OFST+1,sp)
1542  009e 5f            	clrw	x
1543  009f 97            	ld	xl,a
1544  00a0 a601          	ld	a,#1
1545  00a2 5d            	tnzw	x
1546  00a3 2704          	jreq	L461
1547  00a5               L661:
1548  00a5 48            	sll	a
1549  00a6 5a            	decw	x
1550  00a7 26fc          	jrne	L661
1551  00a9               L461:
1552  00a9 43            	cpl	a
1553  00aa c45407        	and	a,21511
1554  00ad c75407        	ld	21511,a
1556  00b0 2046          	jra	L374
1557  00b2               L774:
1558                     ; 260       ADC1->TDRL |= (uint8_t)((uint8_t)0x01 << (uint8_t)ADC1_SchmittTriggerChannel);
1560  00b2 7b01          	ld	a,(OFST+1,sp)
1561  00b4 5f            	clrw	x
1562  00b5 97            	ld	xl,a
1563  00b6 a601          	ld	a,#1
1564  00b8 5d            	tnzw	x
1565  00b9 2704          	jreq	L071
1566  00bb               L271:
1567  00bb 48            	sll	a
1568  00bc 5a            	decw	x
1569  00bd 26fc          	jrne	L271
1570  00bf               L071:
1571  00bf ca5407        	or	a,21511
1572  00c2 c75407        	ld	21511,a
1573  00c5 2031          	jra	L374
1574  00c7               L574:
1575                     ; 265     if (NewState != DISABLE)
1577  00c7 0d02          	tnz	(OFST+2,sp)
1578  00c9 2718          	jreq	L505
1579                     ; 267       ADC1->TDRH &= (uint8_t)(~(uint8_t)((uint8_t)0x01 << ((uint8_t)ADC1_SchmittTriggerChannel - (uint8_t)8)));
1581  00cb 7b01          	ld	a,(OFST+1,sp)
1582  00cd a008          	sub	a,#8
1583  00cf 5f            	clrw	x
1584  00d0 97            	ld	xl,a
1585  00d1 a601          	ld	a,#1
1586  00d3 5d            	tnzw	x
1587  00d4 2704          	jreq	L471
1588  00d6               L671:
1589  00d6 48            	sll	a
1590  00d7 5a            	decw	x
1591  00d8 26fc          	jrne	L671
1592  00da               L471:
1593  00da 43            	cpl	a
1594  00db c45406        	and	a,21510
1595  00de c75406        	ld	21510,a
1597  00e1 2015          	jra	L374
1598  00e3               L505:
1599                     ; 271       ADC1->TDRH |= (uint8_t)((uint8_t)0x01 << ((uint8_t)ADC1_SchmittTriggerChannel - (uint8_t)8));
1601  00e3 7b01          	ld	a,(OFST+1,sp)
1602  00e5 a008          	sub	a,#8
1603  00e7 5f            	clrw	x
1604  00e8 97            	ld	xl,a
1605  00e9 a601          	ld	a,#1
1606  00eb 5d            	tnzw	x
1607  00ec 2704          	jreq	L002
1608  00ee               L202:
1609  00ee 48            	sll	a
1610  00ef 5a            	decw	x
1611  00f0 26fc          	jrne	L202
1612  00f2               L002:
1613  00f2 ca5406        	or	a,21510
1614  00f5 c75406        	ld	21510,a
1615  00f8               L374:
1616                     ; 274 }
1619  00f8 85            	popw	x
1620  00f9 81            	ret
1678                     ; 286 void ADC1_ConversionConfig(ADC1_ConvMode_TypeDef ADC1_ConversionMode, ADC1_Channel_TypeDef ADC1_Channel, ADC1_Align_TypeDef ADC1_Align)
1678                     ; 287 {
1679                     .text:	section	.text,new
1680  0000               _ADC1_ConversionConfig:
1682  0000 89            	pushw	x
1683       00000000      OFST:	set	0
1686                     ; 289   assert_param(IS_ADC1_CONVERSIONMODE_OK(ADC1_ConversionMode));
1688  0001 9e            	ld	a,xh
1689  0002 4d            	tnz	a
1690  0003 2705          	jreq	L012
1691  0005 9e            	ld	a,xh
1692  0006 a101          	cp	a,#1
1693  0008 2603          	jrne	L602
1694  000a               L012:
1695  000a 4f            	clr	a
1696  000b 2010          	jra	L212
1697  000d               L602:
1698  000d ae0121        	ldw	x,#289
1699  0010 89            	pushw	x
1700  0011 ae0000        	ldw	x,#0
1701  0014 89            	pushw	x
1702  0015 ae0000        	ldw	x,#L542
1703  0018 cd0000        	call	_assert_failed
1705  001b 5b04          	addw	sp,#4
1706  001d               L212:
1707                     ; 290   assert_param(IS_ADC1_CHANNEL_OK(ADC1_Channel));
1709  001d 0d02          	tnz	(OFST+2,sp)
1710  001f 273c          	jreq	L612
1711  0021 7b02          	ld	a,(OFST+2,sp)
1712  0023 a101          	cp	a,#1
1713  0025 2736          	jreq	L612
1714  0027 7b02          	ld	a,(OFST+2,sp)
1715  0029 a102          	cp	a,#2
1716  002b 2730          	jreq	L612
1717  002d 7b02          	ld	a,(OFST+2,sp)
1718  002f a103          	cp	a,#3
1719  0031 272a          	jreq	L612
1720  0033 7b02          	ld	a,(OFST+2,sp)
1721  0035 a104          	cp	a,#4
1722  0037 2724          	jreq	L612
1723  0039 7b02          	ld	a,(OFST+2,sp)
1724  003b a105          	cp	a,#5
1725  003d 271e          	jreq	L612
1726  003f 7b02          	ld	a,(OFST+2,sp)
1727  0041 a106          	cp	a,#6
1728  0043 2718          	jreq	L612
1729  0045 7b02          	ld	a,(OFST+2,sp)
1730  0047 a107          	cp	a,#7
1731  0049 2712          	jreq	L612
1732  004b 7b02          	ld	a,(OFST+2,sp)
1733  004d a108          	cp	a,#8
1734  004f 270c          	jreq	L612
1735  0051 7b02          	ld	a,(OFST+2,sp)
1736  0053 a10c          	cp	a,#12
1737  0055 2706          	jreq	L612
1738  0057 7b02          	ld	a,(OFST+2,sp)
1739  0059 a109          	cp	a,#9
1740  005b 2603          	jrne	L412
1741  005d               L612:
1742  005d 4f            	clr	a
1743  005e 2010          	jra	L022
1744  0060               L412:
1745  0060 ae0122        	ldw	x,#290
1746  0063 89            	pushw	x
1747  0064 ae0000        	ldw	x,#0
1748  0067 89            	pushw	x
1749  0068 ae0000        	ldw	x,#L542
1750  006b cd0000        	call	_assert_failed
1752  006e 5b04          	addw	sp,#4
1753  0070               L022:
1754                     ; 291   assert_param(IS_ADC1_ALIGN_OK(ADC1_Align));
1756  0070 0d05          	tnz	(OFST+5,sp)
1757  0072 2706          	jreq	L422
1758  0074 7b05          	ld	a,(OFST+5,sp)
1759  0076 a108          	cp	a,#8
1760  0078 2603          	jrne	L222
1761  007a               L422:
1762  007a 4f            	clr	a
1763  007b 2010          	jra	L622
1764  007d               L222:
1765  007d ae0123        	ldw	x,#291
1766  0080 89            	pushw	x
1767  0081 ae0000        	ldw	x,#0
1768  0084 89            	pushw	x
1769  0085 ae0000        	ldw	x,#L542
1770  0088 cd0000        	call	_assert_failed
1772  008b 5b04          	addw	sp,#4
1773  008d               L622:
1774                     ; 294   ADC1->CR2 &= (uint8_t)(~ADC1_CR2_ALIGN);
1776  008d 72175402      	bres	21506,#3
1777                     ; 296   ADC1->CR2 |= (uint8_t)(ADC1_Align);
1779  0091 c65402        	ld	a,21506
1780  0094 1a05          	or	a,(OFST+5,sp)
1781  0096 c75402        	ld	21506,a
1782                     ; 298   if (ADC1_ConversionMode == ADC1_CONVERSIONMODE_CONTINUOUS)
1784  0099 7b01          	ld	a,(OFST+1,sp)
1785  009b a101          	cp	a,#1
1786  009d 2606          	jrne	L735
1787                     ; 301     ADC1->CR1 |= ADC1_CR1_CONT;
1789  009f 72125401      	bset	21505,#1
1791  00a3 2004          	jra	L145
1792  00a5               L735:
1793                     ; 306     ADC1->CR1 &= (uint8_t)(~ADC1_CR1_CONT);
1795  00a5 72135401      	bres	21505,#1
1796  00a9               L145:
1797                     ; 310   ADC1->CSR &= (uint8_t)(~ADC1_CSR_CH);
1799  00a9 c65400        	ld	a,21504
1800  00ac a4f0          	and	a,#240
1801  00ae c75400        	ld	21504,a
1802                     ; 312   ADC1->CSR |= (uint8_t)(ADC1_Channel);
1804  00b1 c65400        	ld	a,21504
1805  00b4 1a02          	or	a,(OFST+2,sp)
1806  00b6 c75400        	ld	21504,a
1807                     ; 313 }
1810  00b9 85            	popw	x
1811  00ba 81            	ret
1858                     ; 325 void ADC1_ExternalTriggerConfig(ADC1_ExtTrig_TypeDef ADC1_ExtTrigger, FunctionalState NewState)
1858                     ; 326 {
1859                     .text:	section	.text,new
1860  0000               _ADC1_ExternalTriggerConfig:
1862  0000 89            	pushw	x
1863       00000000      OFST:	set	0
1866                     ; 328   assert_param(IS_ADC1_EXTTRIG_OK(ADC1_ExtTrigger));
1868  0001 9e            	ld	a,xh
1869  0002 4d            	tnz	a
1870  0003 2705          	jreq	L432
1871  0005 9e            	ld	a,xh
1872  0006 a110          	cp	a,#16
1873  0008 2603          	jrne	L232
1874  000a               L432:
1875  000a 4f            	clr	a
1876  000b 2010          	jra	L632
1877  000d               L232:
1878  000d ae0148        	ldw	x,#328
1879  0010 89            	pushw	x
1880  0011 ae0000        	ldw	x,#0
1881  0014 89            	pushw	x
1882  0015 ae0000        	ldw	x,#L542
1883  0018 cd0000        	call	_assert_failed
1885  001b 5b04          	addw	sp,#4
1886  001d               L632:
1887                     ; 329   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1889  001d 0d02          	tnz	(OFST+2,sp)
1890  001f 2706          	jreq	L242
1891  0021 7b02          	ld	a,(OFST+2,sp)
1892  0023 a101          	cp	a,#1
1893  0025 2603          	jrne	L042
1894  0027               L242:
1895  0027 4f            	clr	a
1896  0028 2010          	jra	L442
1897  002a               L042:
1898  002a ae0149        	ldw	x,#329
1899  002d 89            	pushw	x
1900  002e ae0000        	ldw	x,#0
1901  0031 89            	pushw	x
1902  0032 ae0000        	ldw	x,#L542
1903  0035 cd0000        	call	_assert_failed
1905  0038 5b04          	addw	sp,#4
1906  003a               L442:
1907                     ; 332   ADC1->CR2 &= (uint8_t)(~ADC1_CR2_EXTSEL);
1909  003a c65402        	ld	a,21506
1910  003d a4cf          	and	a,#207
1911  003f c75402        	ld	21506,a
1912                     ; 334   if (NewState != DISABLE)
1914  0042 0d02          	tnz	(OFST+2,sp)
1915  0044 2706          	jreq	L565
1916                     ; 337     ADC1->CR2 |= (uint8_t)(ADC1_CR2_EXTTRIG);
1918  0046 721c5402      	bset	21506,#6
1920  004a 2004          	jra	L765
1921  004c               L565:
1922                     ; 342     ADC1->CR2 &= (uint8_t)(~ADC1_CR2_EXTTRIG);
1924  004c 721d5402      	bres	21506,#6
1925  0050               L765:
1926                     ; 346   ADC1->CR2 |= (uint8_t)(ADC1_ExtTrigger);
1928  0050 c65402        	ld	a,21506
1929  0053 1a01          	or	a,(OFST+1,sp)
1930  0055 c75402        	ld	21506,a
1931                     ; 347 }
1934  0058 85            	popw	x
1935  0059 81            	ret
1959                     ; 358 void ADC1_StartConversion(void)
1959                     ; 359 {
1960                     .text:	section	.text,new
1961  0000               _ADC1_StartConversion:
1965                     ; 360   ADC1->CR1 |= ADC1_CR1_ADON;
1967  0000 72105401      	bset	21505,#0
1968                     ; 361 }
1971  0004 81            	ret
2015                     ; 370 uint16_t ADC1_GetConversionValue(void)
2015                     ; 371 {
2016                     .text:	section	.text,new
2017  0000               _ADC1_GetConversionValue:
2019  0000 5205          	subw	sp,#5
2020       00000005      OFST:	set	5
2023                     ; 372   uint16_t temph = 0;
2025  0002 1e04          	ldw	x,(OFST-1,sp)
2026                     ; 373   uint8_t templ = 0;
2028  0004 7b03          	ld	a,(OFST-2,sp)
2029  0006 97            	ld	xl,a
2030                     ; 375   if ((ADC1->CR2 & ADC1_CR2_ALIGN) != 0) /* Right alignment */
2032  0007 c65402        	ld	a,21506
2033  000a a508          	bcp	a,#8
2034  000c 2719          	jreq	L326
2035                     ; 378     templ = ADC1->DRL;
2037  000e c65405        	ld	a,21509
2038  0011 6b03          	ld	(OFST-2,sp),a
2039                     ; 380     temph = ADC1->DRH;
2041  0013 c65404        	ld	a,21508
2042  0016 5f            	clrw	x
2043  0017 97            	ld	xl,a
2044  0018 1f04          	ldw	(OFST-1,sp),x
2045                     ; 382     temph = (uint16_t)(templ | (uint16_t)(temph << (uint8_t)8));
2047  001a 1e04          	ldw	x,(OFST-1,sp)
2048  001c 4f            	clr	a
2049  001d 02            	rlwa	x,a
2050  001e 01            	rrwa	x,a
2051  001f 1a03          	or	a,(OFST-2,sp)
2052  0021 02            	rlwa	x,a
2053  0022 1f04          	ldw	(OFST-1,sp),x
2054  0024 01            	rrwa	x,a
2056  0025 2021          	jra	L526
2057  0027               L326:
2058                     ; 387     temph = ADC1->DRH;
2060  0027 c65404        	ld	a,21508
2061  002a 5f            	clrw	x
2062  002b 97            	ld	xl,a
2063  002c 1f04          	ldw	(OFST-1,sp),x
2064                     ; 389     templ = ADC1->DRL;
2066  002e c65405        	ld	a,21509
2067  0031 6b03          	ld	(OFST-2,sp),a
2068                     ; 391     temph = (uint16_t)((uint16_t)((uint16_t)templ << 6) | (uint16_t)((uint16_t)temph << 8));
2070  0033 1e04          	ldw	x,(OFST-1,sp)
2071  0035 4f            	clr	a
2072  0036 02            	rlwa	x,a
2073  0037 1f01          	ldw	(OFST-4,sp),x
2074  0039 7b03          	ld	a,(OFST-2,sp)
2075  003b 97            	ld	xl,a
2076  003c a640          	ld	a,#64
2077  003e 42            	mul	x,a
2078  003f 01            	rrwa	x,a
2079  0040 1a02          	or	a,(OFST-3,sp)
2080  0042 01            	rrwa	x,a
2081  0043 1a01          	or	a,(OFST-4,sp)
2082  0045 01            	rrwa	x,a
2083  0046 1f04          	ldw	(OFST-1,sp),x
2084  0048               L526:
2085                     ; 394   return ((uint16_t)temph);
2087  0048 1e04          	ldw	x,(OFST-1,sp)
2090  004a 5b05          	addw	sp,#5
2091  004c 81            	ret
2138                     ; 405 void ADC1_AWDChannelConfig(ADC1_Channel_TypeDef Channel, FunctionalState NewState)
2138                     ; 406 {
2139                     .text:	section	.text,new
2140  0000               _ADC1_AWDChannelConfig:
2142  0000 89            	pushw	x
2143       00000000      OFST:	set	0
2146                     ; 408   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2148  0001 9f            	ld	a,xl
2149  0002 4d            	tnz	a
2150  0003 2705          	jreq	L652
2151  0005 9f            	ld	a,xl
2152  0006 a101          	cp	a,#1
2153  0008 2603          	jrne	L452
2154  000a               L652:
2155  000a 4f            	clr	a
2156  000b 2010          	jra	L062
2157  000d               L452:
2158  000d ae0198        	ldw	x,#408
2159  0010 89            	pushw	x
2160  0011 ae0000        	ldw	x,#0
2161  0014 89            	pushw	x
2162  0015 ae0000        	ldw	x,#L542
2163  0018 cd0000        	call	_assert_failed
2165  001b 5b04          	addw	sp,#4
2166  001d               L062:
2167                     ; 409   assert_param(IS_ADC1_CHANNEL_OK(Channel));
2169  001d 0d01          	tnz	(OFST+1,sp)
2170  001f 273c          	jreq	L462
2171  0021 7b01          	ld	a,(OFST+1,sp)
2172  0023 a101          	cp	a,#1
2173  0025 2736          	jreq	L462
2174  0027 7b01          	ld	a,(OFST+1,sp)
2175  0029 a102          	cp	a,#2
2176  002b 2730          	jreq	L462
2177  002d 7b01          	ld	a,(OFST+1,sp)
2178  002f a103          	cp	a,#3
2179  0031 272a          	jreq	L462
2180  0033 7b01          	ld	a,(OFST+1,sp)
2181  0035 a104          	cp	a,#4
2182  0037 2724          	jreq	L462
2183  0039 7b01          	ld	a,(OFST+1,sp)
2184  003b a105          	cp	a,#5
2185  003d 271e          	jreq	L462
2186  003f 7b01          	ld	a,(OFST+1,sp)
2187  0041 a106          	cp	a,#6
2188  0043 2718          	jreq	L462
2189  0045 7b01          	ld	a,(OFST+1,sp)
2190  0047 a107          	cp	a,#7
2191  0049 2712          	jreq	L462
2192  004b 7b01          	ld	a,(OFST+1,sp)
2193  004d a108          	cp	a,#8
2194  004f 270c          	jreq	L462
2195  0051 7b01          	ld	a,(OFST+1,sp)
2196  0053 a10c          	cp	a,#12
2197  0055 2706          	jreq	L462
2198  0057 7b01          	ld	a,(OFST+1,sp)
2199  0059 a109          	cp	a,#9
2200  005b 2603          	jrne	L262
2201  005d               L462:
2202  005d 4f            	clr	a
2203  005e 2010          	jra	L662
2204  0060               L262:
2205  0060 ae0199        	ldw	x,#409
2206  0063 89            	pushw	x
2207  0064 ae0000        	ldw	x,#0
2208  0067 89            	pushw	x
2209  0068 ae0000        	ldw	x,#L542
2210  006b cd0000        	call	_assert_failed
2212  006e 5b04          	addw	sp,#4
2213  0070               L662:
2214                     ; 411   if (Channel < (uint8_t)8)
2216  0070 7b01          	ld	a,(OFST+1,sp)
2217  0072 a108          	cp	a,#8
2218  0074 242f          	jruge	L156
2219                     ; 413     if (NewState != DISABLE)
2221  0076 0d02          	tnz	(OFST+2,sp)
2222  0078 2715          	jreq	L356
2223                     ; 415       ADC1->AWCRL |= (uint8_t)((uint8_t)1 << Channel);
2225  007a 7b01          	ld	a,(OFST+1,sp)
2226  007c 5f            	clrw	x
2227  007d 97            	ld	xl,a
2228  007e a601          	ld	a,#1
2229  0080 5d            	tnzw	x
2230  0081 2704          	jreq	L072
2231  0083               L272:
2232  0083 48            	sll	a
2233  0084 5a            	decw	x
2234  0085 26fc          	jrne	L272
2235  0087               L072:
2236  0087 ca540f        	or	a,21519
2237  008a c7540f        	ld	21519,a
2239  008d 2047          	jra	L756
2240  008f               L356:
2241                     ; 419       ADC1->AWCRL &= (uint8_t)~(uint8_t)((uint8_t)1 << Channel);
2243  008f 7b01          	ld	a,(OFST+1,sp)
2244  0091 5f            	clrw	x
2245  0092 97            	ld	xl,a
2246  0093 a601          	ld	a,#1
2247  0095 5d            	tnzw	x
2248  0096 2704          	jreq	L472
2249  0098               L672:
2250  0098 48            	sll	a
2251  0099 5a            	decw	x
2252  009a 26fc          	jrne	L672
2253  009c               L472:
2254  009c 43            	cpl	a
2255  009d c4540f        	and	a,21519
2256  00a0 c7540f        	ld	21519,a
2257  00a3 2031          	jra	L756
2258  00a5               L156:
2259                     ; 424     if (NewState != DISABLE)
2261  00a5 0d02          	tnz	(OFST+2,sp)
2262  00a7 2717          	jreq	L166
2263                     ; 426       ADC1->AWCRH |= (uint8_t)((uint8_t)1 << (Channel - (uint8_t)8));
2265  00a9 7b01          	ld	a,(OFST+1,sp)
2266  00ab a008          	sub	a,#8
2267  00ad 5f            	clrw	x
2268  00ae 97            	ld	xl,a
2269  00af a601          	ld	a,#1
2270  00b1 5d            	tnzw	x
2271  00b2 2704          	jreq	L003
2272  00b4               L203:
2273  00b4 48            	sll	a
2274  00b5 5a            	decw	x
2275  00b6 26fc          	jrne	L203
2276  00b8               L003:
2277  00b8 ca540e        	or	a,21518
2278  00bb c7540e        	ld	21518,a
2280  00be 2016          	jra	L756
2281  00c0               L166:
2282                     ; 430       ADC1->AWCRH &= (uint8_t)~(uint8_t)((uint8_t)1 << (uint8_t)(Channel - (uint8_t)8));
2284  00c0 7b01          	ld	a,(OFST+1,sp)
2285  00c2 a008          	sub	a,#8
2286  00c4 5f            	clrw	x
2287  00c5 97            	ld	xl,a
2288  00c6 a601          	ld	a,#1
2289  00c8 5d            	tnzw	x
2290  00c9 2704          	jreq	L403
2291  00cb               L603:
2292  00cb 48            	sll	a
2293  00cc 5a            	decw	x
2294  00cd 26fc          	jrne	L603
2295  00cf               L403:
2296  00cf 43            	cpl	a
2297  00d0 c4540e        	and	a,21518
2298  00d3 c7540e        	ld	21518,a
2299  00d6               L756:
2300                     ; 433 }
2303  00d6 85            	popw	x
2304  00d7 81            	ret
2339                     ; 441 void ADC1_SetHighThreshold(uint16_t Threshold)
2339                     ; 442 {
2340                     .text:	section	.text,new
2341  0000               _ADC1_SetHighThreshold:
2343  0000 89            	pushw	x
2344       00000000      OFST:	set	0
2347                     ; 443   ADC1->HTRH = (uint8_t)(Threshold >> (uint8_t)2);
2349  0001 54            	srlw	x
2350  0002 54            	srlw	x
2351  0003 9f            	ld	a,xl
2352  0004 c75408        	ld	21512,a
2353                     ; 444   ADC1->HTRL = (uint8_t)Threshold;
2355  0007 7b02          	ld	a,(OFST+2,sp)
2356  0009 c75409        	ld	21513,a
2357                     ; 445 }
2360  000c 85            	popw	x
2361  000d 81            	ret
2396                     ; 453 void ADC1_SetLowThreshold(uint16_t Threshold)
2396                     ; 454 {
2397                     .text:	section	.text,new
2398  0000               _ADC1_SetLowThreshold:
2402                     ; 455   ADC1->LTRL = (uint8_t)Threshold;
2404  0000 9f            	ld	a,xl
2405  0001 c7540b        	ld	21515,a
2406                     ; 456   ADC1->LTRH = (uint8_t)(Threshold >> (uint8_t)2);
2408  0004 54            	srlw	x
2409  0005 54            	srlw	x
2410  0006 9f            	ld	a,xl
2411  0007 c7540a        	ld	21514,a
2412                     ; 457 }
2415  000a 81            	ret
2469                     ; 466 uint16_t ADC1_GetBufferValue(uint8_t Buffer)
2469                     ; 467 {
2470                     .text:	section	.text,new
2471  0000               _ADC1_GetBufferValue:
2473  0000 88            	push	a
2474  0001 5205          	subw	sp,#5
2475       00000005      OFST:	set	5
2478                     ; 468   uint16_t temph = 0;
2480  0003 1e04          	ldw	x,(OFST-1,sp)
2481                     ; 469   uint8_t templ = 0;
2483  0005 7b03          	ld	a,(OFST-2,sp)
2484  0007 97            	ld	xl,a
2485                     ; 472   assert_param(IS_ADC1_BUFFER_OK(Buffer));
2487  0008 7b06          	ld	a,(OFST+1,sp)
2488  000a a10a          	cp	a,#10
2489  000c 2403          	jruge	L613
2490  000e 4f            	clr	a
2491  000f 2010          	jra	L023
2492  0011               L613:
2493  0011 ae01d8        	ldw	x,#472
2494  0014 89            	pushw	x
2495  0015 ae0000        	ldw	x,#0
2496  0018 89            	pushw	x
2497  0019 ae0000        	ldw	x,#L542
2498  001c cd0000        	call	_assert_failed
2500  001f 5b04          	addw	sp,#4
2501  0021               L023:
2502                     ; 474   if ((ADC1->CR2 & ADC1_CR2_ALIGN) != 0) /* Right alignment */
2504  0021 c65402        	ld	a,21506
2505  0024 a508          	bcp	a,#8
2506  0026 2723          	jreq	L747
2507                     ; 477     templ = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1) + 1);
2509  0028 7b06          	ld	a,(OFST+1,sp)
2510  002a 48            	sll	a
2511  002b 5f            	clrw	x
2512  002c 97            	ld	xl,a
2513  002d d653e1        	ld	a,(21473,x)
2514  0030 6b03          	ld	(OFST-2,sp),a
2515                     ; 479     temph = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1));
2517  0032 7b06          	ld	a,(OFST+1,sp)
2518  0034 48            	sll	a
2519  0035 5f            	clrw	x
2520  0036 97            	ld	xl,a
2521  0037 d653e0        	ld	a,(21472,x)
2522  003a 5f            	clrw	x
2523  003b 97            	ld	xl,a
2524  003c 1f04          	ldw	(OFST-1,sp),x
2525                     ; 481     temph = (uint16_t)(templ | (uint16_t)(temph << (uint8_t)8));
2527  003e 1e04          	ldw	x,(OFST-1,sp)
2528  0040 4f            	clr	a
2529  0041 02            	rlwa	x,a
2530  0042 01            	rrwa	x,a
2531  0043 1a03          	or	a,(OFST-2,sp)
2532  0045 02            	rlwa	x,a
2533  0046 1f04          	ldw	(OFST-1,sp),x
2534  0048 01            	rrwa	x,a
2536  0049 202b          	jra	L157
2537  004b               L747:
2538                     ; 486     temph = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1));
2540  004b 7b06          	ld	a,(OFST+1,sp)
2541  004d 48            	sll	a
2542  004e 5f            	clrw	x
2543  004f 97            	ld	xl,a
2544  0050 d653e0        	ld	a,(21472,x)
2545  0053 5f            	clrw	x
2546  0054 97            	ld	xl,a
2547  0055 1f04          	ldw	(OFST-1,sp),x
2548                     ; 488     templ = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1) + 1);
2550  0057 7b06          	ld	a,(OFST+1,sp)
2551  0059 48            	sll	a
2552  005a 5f            	clrw	x
2553  005b 97            	ld	xl,a
2554  005c d653e1        	ld	a,(21473,x)
2555  005f 6b03          	ld	(OFST-2,sp),a
2556                     ; 490     temph = (uint16_t)((uint16_t)((uint16_t)templ << 6) | (uint16_t)(temph << 8));
2558  0061 1e04          	ldw	x,(OFST-1,sp)
2559  0063 4f            	clr	a
2560  0064 02            	rlwa	x,a
2561  0065 1f01          	ldw	(OFST-4,sp),x
2562  0067 7b03          	ld	a,(OFST-2,sp)
2563  0069 97            	ld	xl,a
2564  006a a640          	ld	a,#64
2565  006c 42            	mul	x,a
2566  006d 01            	rrwa	x,a
2567  006e 1a02          	or	a,(OFST-3,sp)
2568  0070 01            	rrwa	x,a
2569  0071 1a01          	or	a,(OFST-4,sp)
2570  0073 01            	rrwa	x,a
2571  0074 1f04          	ldw	(OFST-1,sp),x
2572  0076               L157:
2573                     ; 493   return ((uint16_t)temph);
2575  0076 1e04          	ldw	x,(OFST-1,sp)
2578  0078 5b06          	addw	sp,#6
2579  007a 81            	ret
2646                     ; 502 FlagStatus ADC1_GetAWDChannelStatus(ADC1_Channel_TypeDef Channel)
2646                     ; 503 {
2647                     .text:	section	.text,new
2648  0000               _ADC1_GetAWDChannelStatus:
2650  0000 88            	push	a
2651  0001 88            	push	a
2652       00000001      OFST:	set	1
2655                     ; 504   uint8_t status = 0;
2657  0002 0f01          	clr	(OFST+0,sp)
2658                     ; 507   assert_param(IS_ADC1_CHANNEL_OK(Channel));
2660  0004 4d            	tnz	a
2661  0005 2728          	jreq	L623
2662  0007 a101          	cp	a,#1
2663  0009 2724          	jreq	L623
2664  000b a102          	cp	a,#2
2665  000d 2720          	jreq	L623
2666  000f a103          	cp	a,#3
2667  0011 271c          	jreq	L623
2668  0013 a104          	cp	a,#4
2669  0015 2718          	jreq	L623
2670  0017 a105          	cp	a,#5
2671  0019 2714          	jreq	L623
2672  001b a106          	cp	a,#6
2673  001d 2710          	jreq	L623
2674  001f a107          	cp	a,#7
2675  0021 270c          	jreq	L623
2676  0023 a108          	cp	a,#8
2677  0025 2708          	jreq	L623
2678  0027 a10c          	cp	a,#12
2679  0029 2704          	jreq	L623
2680  002b a109          	cp	a,#9
2681  002d 2603          	jrne	L423
2682  002f               L623:
2683  002f 4f            	clr	a
2684  0030 2010          	jra	L033
2685  0032               L423:
2686  0032 ae01fb        	ldw	x,#507
2687  0035 89            	pushw	x
2688  0036 ae0000        	ldw	x,#0
2689  0039 89            	pushw	x
2690  003a ae0000        	ldw	x,#L542
2691  003d cd0000        	call	_assert_failed
2693  0040 5b04          	addw	sp,#4
2694  0042               L033:
2695                     ; 509   if (Channel < (uint8_t)8)
2697  0042 7b02          	ld	a,(OFST+1,sp)
2698  0044 a108          	cp	a,#8
2699  0046 2414          	jruge	L5001
2700                     ; 511     status = (uint8_t)(ADC1->AWSRL & (uint8_t)((uint8_t)1 << Channel));
2702  0048 7b02          	ld	a,(OFST+1,sp)
2703  004a 5f            	clrw	x
2704  004b 97            	ld	xl,a
2705  004c a601          	ld	a,#1
2706  004e 5d            	tnzw	x
2707  004f 2704          	jreq	L233
2708  0051               L433:
2709  0051 48            	sll	a
2710  0052 5a            	decw	x
2711  0053 26fc          	jrne	L433
2712  0055               L233:
2713  0055 c4540d        	and	a,21517
2714  0058 6b01          	ld	(OFST+0,sp),a
2716  005a 2014          	jra	L7001
2717  005c               L5001:
2718                     ; 515     status = (uint8_t)(ADC1->AWSRH & (uint8_t)((uint8_t)1 << (Channel - (uint8_t)8)));
2720  005c 7b02          	ld	a,(OFST+1,sp)
2721  005e a008          	sub	a,#8
2722  0060 5f            	clrw	x
2723  0061 97            	ld	xl,a
2724  0062 a601          	ld	a,#1
2725  0064 5d            	tnzw	x
2726  0065 2704          	jreq	L633
2727  0067               L043:
2728  0067 48            	sll	a
2729  0068 5a            	decw	x
2730  0069 26fc          	jrne	L043
2731  006b               L633:
2732  006b c4540c        	and	a,21516
2733  006e 6b01          	ld	(OFST+0,sp),a
2734  0070               L7001:
2735                     ; 518   return ((FlagStatus)status);
2737  0070 7b01          	ld	a,(OFST+0,sp)
2740  0072 85            	popw	x
2741  0073 81            	ret
2900                     ; 527 FlagStatus ADC1_GetFlagStatus(ADC1_Flag_TypeDef Flag)
2900                     ; 528 {
2901                     .text:	section	.text,new
2902  0000               _ADC1_GetFlagStatus:
2904  0000 88            	push	a
2905  0001 88            	push	a
2906       00000001      OFST:	set	1
2909                     ; 529   uint8_t flagstatus = 0;
2911  0002 7b01          	ld	a,(OFST+0,sp)
2912  0004 97            	ld	xl,a
2913                     ; 530   uint8_t temp = 0;
2915  0005 7b01          	ld	a,(OFST+0,sp)
2916  0007 97            	ld	xl,a
2917                     ; 533   assert_param(IS_ADC1_FLAG_OK(Flag));
2919  0008 7b02          	ld	a,(OFST+1,sp)
2920  000a a180          	cp	a,#128
2921  000c 2748          	jreq	L643
2922  000e 7b02          	ld	a,(OFST+1,sp)
2923  0010 a141          	cp	a,#65
2924  0012 2742          	jreq	L643
2925  0014 7b02          	ld	a,(OFST+1,sp)
2926  0016 a140          	cp	a,#64
2927  0018 273c          	jreq	L643
2928  001a 7b02          	ld	a,(OFST+1,sp)
2929  001c a110          	cp	a,#16
2930  001e 2736          	jreq	L643
2931  0020 7b02          	ld	a,(OFST+1,sp)
2932  0022 a111          	cp	a,#17
2933  0024 2730          	jreq	L643
2934  0026 7b02          	ld	a,(OFST+1,sp)
2935  0028 a112          	cp	a,#18
2936  002a 272a          	jreq	L643
2937  002c 7b02          	ld	a,(OFST+1,sp)
2938  002e a113          	cp	a,#19
2939  0030 2724          	jreq	L643
2940  0032 7b02          	ld	a,(OFST+1,sp)
2941  0034 a114          	cp	a,#20
2942  0036 271e          	jreq	L643
2943  0038 7b02          	ld	a,(OFST+1,sp)
2944  003a a115          	cp	a,#21
2945  003c 2718          	jreq	L643
2946  003e 7b02          	ld	a,(OFST+1,sp)
2947  0040 a116          	cp	a,#22
2948  0042 2712          	jreq	L643
2949  0044 7b02          	ld	a,(OFST+1,sp)
2950  0046 a117          	cp	a,#23
2951  0048 270c          	jreq	L643
2952  004a 7b02          	ld	a,(OFST+1,sp)
2953  004c a118          	cp	a,#24
2954  004e 2706          	jreq	L643
2955  0050 7b02          	ld	a,(OFST+1,sp)
2956  0052 a119          	cp	a,#25
2957  0054 2603          	jrne	L443
2958  0056               L643:
2959  0056 4f            	clr	a
2960  0057 2010          	jra	L053
2961  0059               L443:
2962  0059 ae0215        	ldw	x,#533
2963  005c 89            	pushw	x
2964  005d ae0000        	ldw	x,#0
2965  0060 89            	pushw	x
2966  0061 ae0000        	ldw	x,#L542
2967  0064 cd0000        	call	_assert_failed
2969  0067 5b04          	addw	sp,#4
2970  0069               L053:
2971                     ; 535   if ((Flag & 0x0F) == 0x01)
2973  0069 7b02          	ld	a,(OFST+1,sp)
2974  006b a40f          	and	a,#15
2975  006d a101          	cp	a,#1
2976  006f 2609          	jrne	L7701
2977                     ; 538     flagstatus = (uint8_t)(ADC1->CR3 & ADC1_CR3_OVR);
2979  0071 c65403        	ld	a,21507
2980  0074 a440          	and	a,#64
2981  0076 6b01          	ld	(OFST+0,sp),a
2983  0078 2045          	jra	L1011
2984  007a               L7701:
2985                     ; 540   else if ((Flag & 0xF0) == 0x10)
2987  007a 7b02          	ld	a,(OFST+1,sp)
2988  007c a4f0          	and	a,#240
2989  007e a110          	cp	a,#16
2990  0080 2636          	jrne	L3011
2991                     ; 543     temp = (uint8_t)(Flag & (uint8_t)0x0F);
2993  0082 7b02          	ld	a,(OFST+1,sp)
2994  0084 a40f          	and	a,#15
2995  0086 6b01          	ld	(OFST+0,sp),a
2996                     ; 544     if (temp < 8)
2998  0088 7b01          	ld	a,(OFST+0,sp)
2999  008a a108          	cp	a,#8
3000  008c 2414          	jruge	L5011
3001                     ; 546       flagstatus = (uint8_t)(ADC1->AWSRL & (uint8_t)((uint8_t)1 << temp));
3003  008e 7b01          	ld	a,(OFST+0,sp)
3004  0090 5f            	clrw	x
3005  0091 97            	ld	xl,a
3006  0092 a601          	ld	a,#1
3007  0094 5d            	tnzw	x
3008  0095 2704          	jreq	L253
3009  0097               L453:
3010  0097 48            	sll	a
3011  0098 5a            	decw	x
3012  0099 26fc          	jrne	L453
3013  009b               L253:
3014  009b c4540d        	and	a,21517
3015  009e 6b01          	ld	(OFST+0,sp),a
3017  00a0 201d          	jra	L1011
3018  00a2               L5011:
3019                     ; 550       flagstatus = (uint8_t)(ADC1->AWSRH & (uint8_t)((uint8_t)1 << (temp - 8)));
3021  00a2 7b01          	ld	a,(OFST+0,sp)
3022  00a4 a008          	sub	a,#8
3023  00a6 5f            	clrw	x
3024  00a7 97            	ld	xl,a
3025  00a8 a601          	ld	a,#1
3026  00aa 5d            	tnzw	x
3027  00ab 2704          	jreq	L653
3028  00ad               L063:
3029  00ad 48            	sll	a
3030  00ae 5a            	decw	x
3031  00af 26fc          	jrne	L063
3032  00b1               L653:
3033  00b1 c4540c        	and	a,21516
3034  00b4 6b01          	ld	(OFST+0,sp),a
3035  00b6 2007          	jra	L1011
3036  00b8               L3011:
3037                     ; 555     flagstatus = (uint8_t)(ADC1->CSR & Flag);
3039  00b8 c65400        	ld	a,21504
3040  00bb 1402          	and	a,(OFST+1,sp)
3041  00bd 6b01          	ld	(OFST+0,sp),a
3042  00bf               L1011:
3043                     ; 557   return ((FlagStatus)flagstatus);
3045  00bf 7b01          	ld	a,(OFST+0,sp)
3048  00c1 85            	popw	x
3049  00c2 81            	ret
3094                     ; 567 void ADC1_ClearFlag(ADC1_Flag_TypeDef Flag)
3094                     ; 568 {
3095                     .text:	section	.text,new
3096  0000               _ADC1_ClearFlag:
3098  0000 88            	push	a
3099  0001 88            	push	a
3100       00000001      OFST:	set	1
3103                     ; 569   uint8_t temp = 0;
3105  0002 0f01          	clr	(OFST+0,sp)
3106                     ; 572   assert_param(IS_ADC1_FLAG_OK(Flag));
3108  0004 a180          	cp	a,#128
3109  0006 2730          	jreq	L663
3110  0008 a141          	cp	a,#65
3111  000a 272c          	jreq	L663
3112  000c a140          	cp	a,#64
3113  000e 2728          	jreq	L663
3114  0010 a110          	cp	a,#16
3115  0012 2724          	jreq	L663
3116  0014 a111          	cp	a,#17
3117  0016 2720          	jreq	L663
3118  0018 a112          	cp	a,#18
3119  001a 271c          	jreq	L663
3120  001c a113          	cp	a,#19
3121  001e 2718          	jreq	L663
3122  0020 a114          	cp	a,#20
3123  0022 2714          	jreq	L663
3124  0024 a115          	cp	a,#21
3125  0026 2710          	jreq	L663
3126  0028 a116          	cp	a,#22
3127  002a 270c          	jreq	L663
3128  002c a117          	cp	a,#23
3129  002e 2708          	jreq	L663
3130  0030 a118          	cp	a,#24
3131  0032 2704          	jreq	L663
3132  0034 a119          	cp	a,#25
3133  0036 2603          	jrne	L463
3134  0038               L663:
3135  0038 4f            	clr	a
3136  0039 2010          	jra	L073
3137  003b               L463:
3138  003b ae023c        	ldw	x,#572
3139  003e 89            	pushw	x
3140  003f ae0000        	ldw	x,#0
3141  0042 89            	pushw	x
3142  0043 ae0000        	ldw	x,#L542
3143  0046 cd0000        	call	_assert_failed
3145  0049 5b04          	addw	sp,#4
3146  004b               L073:
3147                     ; 574   if ((Flag & 0x0F) == 0x01)
3149  004b 7b02          	ld	a,(OFST+1,sp)
3150  004d a40f          	and	a,#15
3151  004f a101          	cp	a,#1
3152  0051 2606          	jrne	L5311
3153                     ; 577     ADC1->CR3 &= (uint8_t)(~ADC1_CR3_OVR);
3155  0053 721d5403      	bres	21507,#6
3157  0057 204b          	jra	L7311
3158  0059               L5311:
3159                     ; 579   else if ((Flag & 0xF0) == 0x10)
3161  0059 7b02          	ld	a,(OFST+1,sp)
3162  005b a4f0          	and	a,#240
3163  005d a110          	cp	a,#16
3164  005f 263a          	jrne	L1411
3165                     ; 582     temp = (uint8_t)(Flag & (uint8_t)0x0F);
3167  0061 7b02          	ld	a,(OFST+1,sp)
3168  0063 a40f          	and	a,#15
3169  0065 6b01          	ld	(OFST+0,sp),a
3170                     ; 583     if (temp < 8)
3172  0067 7b01          	ld	a,(OFST+0,sp)
3173  0069 a108          	cp	a,#8
3174  006b 2416          	jruge	L3411
3175                     ; 585       ADC1->AWSRL &= (uint8_t)~(uint8_t)((uint8_t)1 << temp);
3177  006d 7b01          	ld	a,(OFST+0,sp)
3178  006f 5f            	clrw	x
3179  0070 97            	ld	xl,a
3180  0071 a601          	ld	a,#1
3181  0073 5d            	tnzw	x
3182  0074 2704          	jreq	L273
3183  0076               L473:
3184  0076 48            	sll	a
3185  0077 5a            	decw	x
3186  0078 26fc          	jrne	L473
3187  007a               L273:
3188  007a 43            	cpl	a
3189  007b c4540d        	and	a,21517
3190  007e c7540d        	ld	21517,a
3192  0081 2021          	jra	L7311
3193  0083               L3411:
3194                     ; 589       ADC1->AWSRH &= (uint8_t)~(uint8_t)((uint8_t)1 << (temp - 8));
3196  0083 7b01          	ld	a,(OFST+0,sp)
3197  0085 a008          	sub	a,#8
3198  0087 5f            	clrw	x
3199  0088 97            	ld	xl,a
3200  0089 a601          	ld	a,#1
3201  008b 5d            	tnzw	x
3202  008c 2704          	jreq	L673
3203  008e               L004:
3204  008e 48            	sll	a
3205  008f 5a            	decw	x
3206  0090 26fc          	jrne	L004
3207  0092               L673:
3208  0092 43            	cpl	a
3209  0093 c4540c        	and	a,21516
3210  0096 c7540c        	ld	21516,a
3211  0099 2009          	jra	L7311
3212  009b               L1411:
3213                     ; 594     ADC1->CSR &= (uint8_t) (~Flag);
3215  009b 7b02          	ld	a,(OFST+1,sp)
3216  009d 43            	cpl	a
3217  009e c45400        	and	a,21504
3218  00a1 c75400        	ld	21504,a
3219  00a4               L7311:
3220                     ; 596 }
3223  00a4 85            	popw	x
3224  00a5 81            	ret
3280                     ; 616 ITStatus ADC1_GetITStatus(ADC1_IT_TypeDef ITPendingBit)
3280                     ; 617 {
3281                     .text:	section	.text,new
3282  0000               _ADC1_GetITStatus:
3284  0000 89            	pushw	x
3285  0001 88            	push	a
3286       00000001      OFST:	set	1
3289                     ; 618   ITStatus itstatus = RESET;
3291  0002 7b01          	ld	a,(OFST+0,sp)
3292  0004 97            	ld	xl,a
3293                     ; 619   uint8_t temp = 0;
3295  0005 7b01          	ld	a,(OFST+0,sp)
3296  0007 97            	ld	xl,a
3297                     ; 622   assert_param(IS_ADC1_ITPENDINGBIT_OK(ITPendingBit));
3299  0008 1e02          	ldw	x,(OFST+1,sp)
3300  000a a30080        	cpw	x,#128
3301  000d 2754          	jreq	L604
3302  000f 1e02          	ldw	x,(OFST+1,sp)
3303  0011 a30140        	cpw	x,#320
3304  0014 274d          	jreq	L604
3305  0016 1e02          	ldw	x,(OFST+1,sp)
3306  0018 a30110        	cpw	x,#272
3307  001b 2746          	jreq	L604
3308  001d 1e02          	ldw	x,(OFST+1,sp)
3309  001f a30111        	cpw	x,#273
3310  0022 273f          	jreq	L604
3311  0024 1e02          	ldw	x,(OFST+1,sp)
3312  0026 a30112        	cpw	x,#274
3313  0029 2738          	jreq	L604
3314  002b 1e02          	ldw	x,(OFST+1,sp)
3315  002d a30113        	cpw	x,#275
3316  0030 2731          	jreq	L604
3317  0032 1e02          	ldw	x,(OFST+1,sp)
3318  0034 a30114        	cpw	x,#276
3319  0037 272a          	jreq	L604
3320  0039 1e02          	ldw	x,(OFST+1,sp)
3321  003b a30115        	cpw	x,#277
3322  003e 2723          	jreq	L604
3323  0040 1e02          	ldw	x,(OFST+1,sp)
3324  0042 a30116        	cpw	x,#278
3325  0045 271c          	jreq	L604
3326  0047 1e02          	ldw	x,(OFST+1,sp)
3327  0049 a30117        	cpw	x,#279
3328  004c 2715          	jreq	L604
3329  004e 1e02          	ldw	x,(OFST+1,sp)
3330  0050 a30118        	cpw	x,#280
3331  0053 270e          	jreq	L604
3332  0055 1e02          	ldw	x,(OFST+1,sp)
3333  0057 a3011c        	cpw	x,#284
3334  005a 2707          	jreq	L604
3335  005c 1e02          	ldw	x,(OFST+1,sp)
3336  005e a30119        	cpw	x,#281
3337  0061 2603          	jrne	L404
3338  0063               L604:
3339  0063 4f            	clr	a
3340  0064 2010          	jra	L014
3341  0066               L404:
3342  0066 ae026e        	ldw	x,#622
3343  0069 89            	pushw	x
3344  006a ae0000        	ldw	x,#0
3345  006d 89            	pushw	x
3346  006e ae0000        	ldw	x,#L542
3347  0071 cd0000        	call	_assert_failed
3349  0074 5b04          	addw	sp,#4
3350  0076               L014:
3351                     ; 624   if (((uint16_t)ITPendingBit & 0xF0) == 0x10)
3353  0076 7b02          	ld	a,(OFST+1,sp)
3354  0078 97            	ld	xl,a
3355  0079 7b03          	ld	a,(OFST+2,sp)
3356  007b a4f0          	and	a,#240
3357  007d 5f            	clrw	x
3358  007e 02            	rlwa	x,a
3359  007f a30010        	cpw	x,#16
3360  0082 2636          	jrne	L7711
3361                     ; 627     temp = (uint8_t)((uint16_t)ITPendingBit & 0x0F);
3363  0084 7b03          	ld	a,(OFST+2,sp)
3364  0086 a40f          	and	a,#15
3365  0088 6b01          	ld	(OFST+0,sp),a
3366                     ; 628     if (temp < 8)
3368  008a 7b01          	ld	a,(OFST+0,sp)
3369  008c a108          	cp	a,#8
3370  008e 2414          	jruge	L1021
3371                     ; 630       itstatus = (ITStatus)(ADC1->AWSRL & (uint8_t)((uint8_t)1 << temp));
3373  0090 7b01          	ld	a,(OFST+0,sp)
3374  0092 5f            	clrw	x
3375  0093 97            	ld	xl,a
3376  0094 a601          	ld	a,#1
3377  0096 5d            	tnzw	x
3378  0097 2704          	jreq	L214
3379  0099               L414:
3380  0099 48            	sll	a
3381  009a 5a            	decw	x
3382  009b 26fc          	jrne	L414
3383  009d               L214:
3384  009d c4540d        	and	a,21517
3385  00a0 6b01          	ld	(OFST+0,sp),a
3387  00a2 201d          	jra	L5021
3388  00a4               L1021:
3389                     ; 634       itstatus = (ITStatus)(ADC1->AWSRH & (uint8_t)((uint8_t)1 << (temp - 8)));
3391  00a4 7b01          	ld	a,(OFST+0,sp)
3392  00a6 a008          	sub	a,#8
3393  00a8 5f            	clrw	x
3394  00a9 97            	ld	xl,a
3395  00aa a601          	ld	a,#1
3396  00ac 5d            	tnzw	x
3397  00ad 2704          	jreq	L614
3398  00af               L024:
3399  00af 48            	sll	a
3400  00b0 5a            	decw	x
3401  00b1 26fc          	jrne	L024
3402  00b3               L614:
3403  00b3 c4540c        	and	a,21516
3404  00b6 6b01          	ld	(OFST+0,sp),a
3405  00b8 2007          	jra	L5021
3406  00ba               L7711:
3407                     ; 639     itstatus = (ITStatus)(ADC1->CSR & (uint8_t)ITPendingBit);
3409  00ba c65400        	ld	a,21504
3410  00bd 1403          	and	a,(OFST+2,sp)
3411  00bf 6b01          	ld	(OFST+0,sp),a
3412  00c1               L5021:
3413                     ; 641   return ((ITStatus)itstatus);
3415  00c1 7b01          	ld	a,(OFST+0,sp)
3418  00c3 5b03          	addw	sp,#3
3419  00c5 81            	ret
3465                     ; 662 void ADC1_ClearITPendingBit(ADC1_IT_TypeDef ITPendingBit)
3465                     ; 663 {
3466                     .text:	section	.text,new
3467  0000               _ADC1_ClearITPendingBit:
3469  0000 89            	pushw	x
3470  0001 88            	push	a
3471       00000001      OFST:	set	1
3474                     ; 664   uint8_t temp = 0;
3476  0002 0f01          	clr	(OFST+0,sp)
3477                     ; 667   assert_param(IS_ADC1_ITPENDINGBIT_OK(ITPendingBit));
3479  0004 a30080        	cpw	x,#128
3480  0007 273c          	jreq	L624
3481  0009 a30140        	cpw	x,#320
3482  000c 2737          	jreq	L624
3483  000e a30110        	cpw	x,#272
3484  0011 2732          	jreq	L624
3485  0013 a30111        	cpw	x,#273
3486  0016 272d          	jreq	L624
3487  0018 a30112        	cpw	x,#274
3488  001b 2728          	jreq	L624
3489  001d a30113        	cpw	x,#275
3490  0020 2723          	jreq	L624
3491  0022 a30114        	cpw	x,#276
3492  0025 271e          	jreq	L624
3493  0027 a30115        	cpw	x,#277
3494  002a 2719          	jreq	L624
3495  002c a30116        	cpw	x,#278
3496  002f 2714          	jreq	L624
3497  0031 a30117        	cpw	x,#279
3498  0034 270f          	jreq	L624
3499  0036 a30118        	cpw	x,#280
3500  0039 270a          	jreq	L624
3501  003b a3011c        	cpw	x,#284
3502  003e 2705          	jreq	L624
3503  0040 a30119        	cpw	x,#281
3504  0043 2603          	jrne	L424
3505  0045               L624:
3506  0045 4f            	clr	a
3507  0046 2010          	jra	L034
3508  0048               L424:
3509  0048 ae029b        	ldw	x,#667
3510  004b 89            	pushw	x
3511  004c ae0000        	ldw	x,#0
3512  004f 89            	pushw	x
3513  0050 ae0000        	ldw	x,#L542
3514  0053 cd0000        	call	_assert_failed
3516  0056 5b04          	addw	sp,#4
3517  0058               L034:
3518                     ; 669   if (((uint16_t)ITPendingBit & 0xF0) == 0x10)
3520  0058 7b02          	ld	a,(OFST+1,sp)
3521  005a 97            	ld	xl,a
3522  005b 7b03          	ld	a,(OFST+2,sp)
3523  005d a4f0          	and	a,#240
3524  005f 5f            	clrw	x
3525  0060 02            	rlwa	x,a
3526  0061 a30010        	cpw	x,#16
3527  0064 263a          	jrne	L1321
3528                     ; 672     temp = (uint8_t)((uint16_t)ITPendingBit & 0x0F);
3530  0066 7b03          	ld	a,(OFST+2,sp)
3531  0068 a40f          	and	a,#15
3532  006a 6b01          	ld	(OFST+0,sp),a
3533                     ; 673     if (temp < 8)
3535  006c 7b01          	ld	a,(OFST+0,sp)
3536  006e a108          	cp	a,#8
3537  0070 2416          	jruge	L3321
3538                     ; 675       ADC1->AWSRL &= (uint8_t)~(uint8_t)((uint8_t)1 << temp);
3540  0072 7b01          	ld	a,(OFST+0,sp)
3541  0074 5f            	clrw	x
3542  0075 97            	ld	xl,a
3543  0076 a601          	ld	a,#1
3544  0078 5d            	tnzw	x
3545  0079 2704          	jreq	L234
3546  007b               L434:
3547  007b 48            	sll	a
3548  007c 5a            	decw	x
3549  007d 26fc          	jrne	L434
3550  007f               L234:
3551  007f 43            	cpl	a
3552  0080 c4540d        	and	a,21517
3553  0083 c7540d        	ld	21517,a
3555  0086 2021          	jra	L7321
3556  0088               L3321:
3557                     ; 679       ADC1->AWSRH &= (uint8_t)~(uint8_t)((uint8_t)1 << (temp - 8));
3559  0088 7b01          	ld	a,(OFST+0,sp)
3560  008a a008          	sub	a,#8
3561  008c 5f            	clrw	x
3562  008d 97            	ld	xl,a
3563  008e a601          	ld	a,#1
3564  0090 5d            	tnzw	x
3565  0091 2704          	jreq	L634
3566  0093               L044:
3567  0093 48            	sll	a
3568  0094 5a            	decw	x
3569  0095 26fc          	jrne	L044
3570  0097               L634:
3571  0097 43            	cpl	a
3572  0098 c4540c        	and	a,21516
3573  009b c7540c        	ld	21516,a
3574  009e 2009          	jra	L7321
3575  00a0               L1321:
3576                     ; 684     ADC1->CSR &= (uint8_t)((uint16_t)~(uint16_t)ITPendingBit);
3578  00a0 7b03          	ld	a,(OFST+2,sp)
3579  00a2 43            	cpl	a
3580  00a3 c45400        	and	a,21504
3581  00a6 c75400        	ld	21504,a
3582  00a9               L7321:
3583                     ; 686 }
3586  00a9 5b03          	addw	sp,#3
3587  00ab 81            	ret
3600                     	xdef	_ADC1_ClearITPendingBit
3601                     	xdef	_ADC1_GetITStatus
3602                     	xdef	_ADC1_ClearFlag
3603                     	xdef	_ADC1_GetFlagStatus
3604                     	xdef	_ADC1_GetAWDChannelStatus
3605                     	xdef	_ADC1_GetBufferValue
3606                     	xdef	_ADC1_SetLowThreshold
3607                     	xdef	_ADC1_SetHighThreshold
3608                     	xdef	_ADC1_GetConversionValue
3609                     	xdef	_ADC1_StartConversion
3610                     	xdef	_ADC1_AWDChannelConfig
3611                     	xdef	_ADC1_ExternalTriggerConfig
3612                     	xdef	_ADC1_ConversionConfig
3613                     	xdef	_ADC1_SchmittTriggerConfig
3614                     	xdef	_ADC1_PrescalerConfig
3615                     	xdef	_ADC1_ITConfig
3616                     	xdef	_ADC1_DataBufferCmd
3617                     	xdef	_ADC1_ScanModeCmd
3618                     	xdef	_ADC1_Cmd
3619                     	xdef	_ADC1_Init
3620                     	xdef	_ADC1_DeInit
3621                     	xref	_assert_failed
3622                     .const:	section	.text
3623  0000               L542:
3624  0000 2e2e5c2e2e5c  	dc.b	"..\..\..\libraries"
3625  0012 5c73746d3873  	dc.b	"\stm8s_stdperiph_d"
3626  0024 72697665725c  	dc.b	"river\src\stm8s_ad"
3627  0036 63312e6300    	dc.b	"c1.c",0
3647                     	end
