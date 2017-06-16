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
 157                     ; 99 void CLK_FastHaltWakeUpCmd(FunctionalState NewState)
 157                     ; 100 {
 158                     .text:	section	.text,new
 159  0000               _CLK_FastHaltWakeUpCmd:
 161  0000 88            	push	a
 162       00000000      OFST:	set	0
 165                     ; 102   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 167  0001 4d            	tnz	a
 168  0002 2704          	jreq	L21
 169  0004 a101          	cp	a,#1
 170  0006 2603          	jrne	L01
 171  0008               L21:
 172  0008 4f            	clr	a
 173  0009 2010          	jra	L41
 174  000b               L01:
 175  000b ae0066        	ldw	x,#102
 176  000e 89            	pushw	x
 177  000f ae0000        	ldw	x,#0
 178  0012 89            	pushw	x
 179  0013 ae000c        	ldw	x,#L75
 180  0016 cd0000        	call	_assert_failed
 182  0019 5b04          	addw	sp,#4
 183  001b               L41:
 184                     ; 104   if (NewState != DISABLE)
 186  001b 0d01          	tnz	(OFST+1,sp)
 187  001d 2706          	jreq	L16
 188                     ; 107     CLK->ICKR |= CLK_ICKR_FHWU;
 190  001f 721450c0      	bset	20672,#2
 192  0023 2004          	jra	L36
 193  0025               L16:
 194                     ; 112     CLK->ICKR &= (uint8_t)(~CLK_ICKR_FHWU);
 196  0025 721550c0      	bres	20672,#2
 197  0029               L36:
 198                     ; 114 }
 201  0029 84            	pop	a
 202  002a 81            	ret
 238                     ; 121 void CLK_HSECmd(FunctionalState NewState)
 238                     ; 122 {
 239                     .text:	section	.text,new
 240  0000               _CLK_HSECmd:
 242  0000 88            	push	a
 243       00000000      OFST:	set	0
 246                     ; 124   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 248  0001 4d            	tnz	a
 249  0002 2704          	jreq	L22
 250  0004 a101          	cp	a,#1
 251  0006 2603          	jrne	L02
 252  0008               L22:
 253  0008 4f            	clr	a
 254  0009 2010          	jra	L42
 255  000b               L02:
 256  000b ae007c        	ldw	x,#124
 257  000e 89            	pushw	x
 258  000f ae0000        	ldw	x,#0
 259  0012 89            	pushw	x
 260  0013 ae000c        	ldw	x,#L75
 261  0016 cd0000        	call	_assert_failed
 263  0019 5b04          	addw	sp,#4
 264  001b               L42:
 265                     ; 126   if (NewState != DISABLE)
 267  001b 0d01          	tnz	(OFST+1,sp)
 268  001d 2706          	jreq	L301
 269                     ; 129     CLK->ECKR |= CLK_ECKR_HSEEN;
 271  001f 721050c1      	bset	20673,#0
 273  0023 2004          	jra	L501
 274  0025               L301:
 275                     ; 134     CLK->ECKR &= (uint8_t)(~CLK_ECKR_HSEEN);
 277  0025 721150c1      	bres	20673,#0
 278  0029               L501:
 279                     ; 136 }
 282  0029 84            	pop	a
 283  002a 81            	ret
 319                     ; 143 void CLK_HSICmd(FunctionalState NewState)
 319                     ; 144 {
 320                     .text:	section	.text,new
 321  0000               _CLK_HSICmd:
 323  0000 88            	push	a
 324       00000000      OFST:	set	0
 327                     ; 146   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 329  0001 4d            	tnz	a
 330  0002 2704          	jreq	L23
 331  0004 a101          	cp	a,#1
 332  0006 2603          	jrne	L03
 333  0008               L23:
 334  0008 4f            	clr	a
 335  0009 2010          	jra	L43
 336  000b               L03:
 337  000b ae0092        	ldw	x,#146
 338  000e 89            	pushw	x
 339  000f ae0000        	ldw	x,#0
 340  0012 89            	pushw	x
 341  0013 ae000c        	ldw	x,#L75
 342  0016 cd0000        	call	_assert_failed
 344  0019 5b04          	addw	sp,#4
 345  001b               L43:
 346                     ; 148   if (NewState != DISABLE)
 348  001b 0d01          	tnz	(OFST+1,sp)
 349  001d 2706          	jreq	L521
 350                     ; 151     CLK->ICKR |= CLK_ICKR_HSIEN;
 352  001f 721050c0      	bset	20672,#0
 354  0023 2004          	jra	L721
 355  0025               L521:
 356                     ; 156     CLK->ICKR &= (uint8_t)(~CLK_ICKR_HSIEN);
 358  0025 721150c0      	bres	20672,#0
 359  0029               L721:
 360                     ; 158 }
 363  0029 84            	pop	a
 364  002a 81            	ret
 400                     ; 166 void CLK_LSICmd(FunctionalState NewState)
 400                     ; 167 {
 401                     .text:	section	.text,new
 402  0000               _CLK_LSICmd:
 404  0000 88            	push	a
 405       00000000      OFST:	set	0
 408                     ; 169   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 410  0001 4d            	tnz	a
 411  0002 2704          	jreq	L24
 412  0004 a101          	cp	a,#1
 413  0006 2603          	jrne	L04
 414  0008               L24:
 415  0008 4f            	clr	a
 416  0009 2010          	jra	L44
 417  000b               L04:
 418  000b ae00a9        	ldw	x,#169
 419  000e 89            	pushw	x
 420  000f ae0000        	ldw	x,#0
 421  0012 89            	pushw	x
 422  0013 ae000c        	ldw	x,#L75
 423  0016 cd0000        	call	_assert_failed
 425  0019 5b04          	addw	sp,#4
 426  001b               L44:
 427                     ; 171   if (NewState != DISABLE)
 429  001b 0d01          	tnz	(OFST+1,sp)
 430  001d 2706          	jreq	L741
 431                     ; 174     CLK->ICKR |= CLK_ICKR_LSIEN;
 433  001f 721650c0      	bset	20672,#3
 435  0023 2004          	jra	L151
 436  0025               L741:
 437                     ; 179     CLK->ICKR &= (uint8_t)(~CLK_ICKR_LSIEN);
 439  0025 721750c0      	bres	20672,#3
 440  0029               L151:
 441                     ; 181 }
 444  0029 84            	pop	a
 445  002a 81            	ret
 481                     ; 189 void CLK_CCOCmd(FunctionalState NewState)
 481                     ; 190 {
 482                     .text:	section	.text,new
 483  0000               _CLK_CCOCmd:
 485  0000 88            	push	a
 486       00000000      OFST:	set	0
 489                     ; 192   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 491  0001 4d            	tnz	a
 492  0002 2704          	jreq	L25
 493  0004 a101          	cp	a,#1
 494  0006 2603          	jrne	L05
 495  0008               L25:
 496  0008 4f            	clr	a
 497  0009 2010          	jra	L45
 498  000b               L05:
 499  000b ae00c0        	ldw	x,#192
 500  000e 89            	pushw	x
 501  000f ae0000        	ldw	x,#0
 502  0012 89            	pushw	x
 503  0013 ae000c        	ldw	x,#L75
 504  0016 cd0000        	call	_assert_failed
 506  0019 5b04          	addw	sp,#4
 507  001b               L45:
 508                     ; 194   if (NewState != DISABLE)
 510  001b 0d01          	tnz	(OFST+1,sp)
 511  001d 2706          	jreq	L171
 512                     ; 197     CLK->CCOR |= CLK_CCOR_CCOEN;
 514  001f 721050c9      	bset	20681,#0
 516  0023 2004          	jra	L371
 517  0025               L171:
 518                     ; 202     CLK->CCOR &= (uint8_t)(~CLK_CCOR_CCOEN);
 520  0025 721150c9      	bres	20681,#0
 521  0029               L371:
 522                     ; 204 }
 525  0029 84            	pop	a
 526  002a 81            	ret
 562                     ; 213 void CLK_ClockSwitchCmd(FunctionalState NewState)
 562                     ; 214 {
 563                     .text:	section	.text,new
 564  0000               _CLK_ClockSwitchCmd:
 566  0000 88            	push	a
 567       00000000      OFST:	set	0
 570                     ; 216   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 572  0001 4d            	tnz	a
 573  0002 2704          	jreq	L26
 574  0004 a101          	cp	a,#1
 575  0006 2603          	jrne	L06
 576  0008               L26:
 577  0008 4f            	clr	a
 578  0009 2010          	jra	L46
 579  000b               L06:
 580  000b ae00d8        	ldw	x,#216
 581  000e 89            	pushw	x
 582  000f ae0000        	ldw	x,#0
 583  0012 89            	pushw	x
 584  0013 ae000c        	ldw	x,#L75
 585  0016 cd0000        	call	_assert_failed
 587  0019 5b04          	addw	sp,#4
 588  001b               L46:
 589                     ; 218   if (NewState != DISABLE )
 591  001b 0d01          	tnz	(OFST+1,sp)
 592  001d 2706          	jreq	L312
 593                     ; 221     CLK->SWCR |= CLK_SWCR_SWEN;
 595  001f 721250c5      	bset	20677,#1
 597  0023 2004          	jra	L512
 598  0025               L312:
 599                     ; 226     CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWEN);
 601  0025 721350c5      	bres	20677,#1
 602  0029               L512:
 603                     ; 228 }
 606  0029 84            	pop	a
 607  002a 81            	ret
 644                     ; 238 void CLK_SlowActiveHaltWakeUpCmd(FunctionalState NewState)
 644                     ; 239 {
 645                     .text:	section	.text,new
 646  0000               _CLK_SlowActiveHaltWakeUpCmd:
 648  0000 88            	push	a
 649       00000000      OFST:	set	0
 652                     ; 241   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 654  0001 4d            	tnz	a
 655  0002 2704          	jreq	L27
 656  0004 a101          	cp	a,#1
 657  0006 2603          	jrne	L07
 658  0008               L27:
 659  0008 4f            	clr	a
 660  0009 2010          	jra	L47
 661  000b               L07:
 662  000b ae00f1        	ldw	x,#241
 663  000e 89            	pushw	x
 664  000f ae0000        	ldw	x,#0
 665  0012 89            	pushw	x
 666  0013 ae000c        	ldw	x,#L75
 667  0016 cd0000        	call	_assert_failed
 669  0019 5b04          	addw	sp,#4
 670  001b               L47:
 671                     ; 243   if (NewState != DISABLE)
 673  001b 0d01          	tnz	(OFST+1,sp)
 674  001d 2706          	jreq	L532
 675                     ; 246     CLK->ICKR |= CLK_ICKR_SWUAH;
 677  001f 721a50c0      	bset	20672,#5
 679  0023 2004          	jra	L732
 680  0025               L532:
 681                     ; 251     CLK->ICKR &= (uint8_t)(~CLK_ICKR_SWUAH);
 683  0025 721b50c0      	bres	20672,#5
 684  0029               L732:
 685                     ; 253 }
 688  0029 84            	pop	a
 689  002a 81            	ret
 849                     ; 263 void CLK_PeripheralClockConfig(CLK_Peripheral_TypeDef CLK_Peripheral, FunctionalState NewState)
 849                     ; 264 {
 850                     .text:	section	.text,new
 851  0000               _CLK_PeripheralClockConfig:
 853  0000 89            	pushw	x
 854       00000000      OFST:	set	0
 857                     ; 266   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 859  0001 9f            	ld	a,xl
 860  0002 4d            	tnz	a
 861  0003 2705          	jreq	L201
 862  0005 9f            	ld	a,xl
 863  0006 a101          	cp	a,#1
 864  0008 2603          	jrne	L001
 865  000a               L201:
 866  000a 4f            	clr	a
 867  000b 2010          	jra	L401
 868  000d               L001:
 869  000d ae010a        	ldw	x,#266
 870  0010 89            	pushw	x
 871  0011 ae0000        	ldw	x,#0
 872  0014 89            	pushw	x
 873  0015 ae000c        	ldw	x,#L75
 874  0018 cd0000        	call	_assert_failed
 876  001b 5b04          	addw	sp,#4
 877  001d               L401:
 878                     ; 267   assert_param(IS_CLK_PERIPHERAL_OK(CLK_Peripheral));
 880  001d 0d01          	tnz	(OFST+1,sp)
 881  001f 274e          	jreq	L011
 882  0021 7b01          	ld	a,(OFST+1,sp)
 883  0023 a101          	cp	a,#1
 884  0025 2748          	jreq	L011
 885  0027 7b01          	ld	a,(OFST+1,sp)
 886  0029 a103          	cp	a,#3
 887  002b 2742          	jreq	L011
 888  002d 7b01          	ld	a,(OFST+1,sp)
 889  002f a103          	cp	a,#3
 890  0031 273c          	jreq	L011
 891  0033 7b01          	ld	a,(OFST+1,sp)
 892  0035 a103          	cp	a,#3
 893  0037 2736          	jreq	L011
 894  0039 7b01          	ld	a,(OFST+1,sp)
 895  003b a104          	cp	a,#4
 896  003d 2730          	jreq	L011
 897  003f 7b01          	ld	a,(OFST+1,sp)
 898  0041 a105          	cp	a,#5
 899  0043 272a          	jreq	L011
 900  0045 7b01          	ld	a,(OFST+1,sp)
 901  0047 a105          	cp	a,#5
 902  0049 2724          	jreq	L011
 903  004b 7b01          	ld	a,(OFST+1,sp)
 904  004d a104          	cp	a,#4
 905  004f 271e          	jreq	L011
 906  0051 7b01          	ld	a,(OFST+1,sp)
 907  0053 a106          	cp	a,#6
 908  0055 2718          	jreq	L011
 909  0057 7b01          	ld	a,(OFST+1,sp)
 910  0059 a107          	cp	a,#7
 911  005b 2712          	jreq	L011
 912  005d 7b01          	ld	a,(OFST+1,sp)
 913  005f a117          	cp	a,#23
 914  0061 270c          	jreq	L011
 915  0063 7b01          	ld	a,(OFST+1,sp)
 916  0065 a113          	cp	a,#19
 917  0067 2706          	jreq	L011
 918  0069 7b01          	ld	a,(OFST+1,sp)
 919  006b a112          	cp	a,#18
 920  006d 2603          	jrne	L601
 921  006f               L011:
 922  006f 4f            	clr	a
 923  0070 2010          	jra	L211
 924  0072               L601:
 925  0072 ae010b        	ldw	x,#267
 926  0075 89            	pushw	x
 927  0076 ae0000        	ldw	x,#0
 928  0079 89            	pushw	x
 929  007a ae000c        	ldw	x,#L75
 930  007d cd0000        	call	_assert_failed
 932  0080 5b04          	addw	sp,#4
 933  0082               L211:
 934                     ; 269   if (((uint8_t)CLK_Peripheral & (uint8_t)0x10) == 0x00)
 936  0082 7b01          	ld	a,(OFST+1,sp)
 937  0084 a510          	bcp	a,#16
 938  0086 2633          	jrne	L323
 939                     ; 271     if (NewState != DISABLE)
 941  0088 0d02          	tnz	(OFST+2,sp)
 942  008a 2717          	jreq	L523
 943                     ; 274       CLK->PCKENR1 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
 945  008c 7b01          	ld	a,(OFST+1,sp)
 946  008e a40f          	and	a,#15
 947  0090 5f            	clrw	x
 948  0091 97            	ld	xl,a
 949  0092 a601          	ld	a,#1
 950  0094 5d            	tnzw	x
 951  0095 2704          	jreq	L411
 952  0097               L611:
 953  0097 48            	sll	a
 954  0098 5a            	decw	x
 955  0099 26fc          	jrne	L611
 956  009b               L411:
 957  009b ca50c7        	or	a,20679
 958  009e c750c7        	ld	20679,a
 960  00a1 2049          	jra	L133
 961  00a3               L523:
 962                     ; 279       CLK->PCKENR1 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
 964  00a3 7b01          	ld	a,(OFST+1,sp)
 965  00a5 a40f          	and	a,#15
 966  00a7 5f            	clrw	x
 967  00a8 97            	ld	xl,a
 968  00a9 a601          	ld	a,#1
 969  00ab 5d            	tnzw	x
 970  00ac 2704          	jreq	L021
 971  00ae               L221:
 972  00ae 48            	sll	a
 973  00af 5a            	decw	x
 974  00b0 26fc          	jrne	L221
 975  00b2               L021:
 976  00b2 43            	cpl	a
 977  00b3 c450c7        	and	a,20679
 978  00b6 c750c7        	ld	20679,a
 979  00b9 2031          	jra	L133
 980  00bb               L323:
 981                     ; 284     if (NewState != DISABLE)
 983  00bb 0d02          	tnz	(OFST+2,sp)
 984  00bd 2717          	jreq	L333
 985                     ; 287       CLK->PCKENR2 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
 987  00bf 7b01          	ld	a,(OFST+1,sp)
 988  00c1 a40f          	and	a,#15
 989  00c3 5f            	clrw	x
 990  00c4 97            	ld	xl,a
 991  00c5 a601          	ld	a,#1
 992  00c7 5d            	tnzw	x
 993  00c8 2704          	jreq	L421
 994  00ca               L621:
 995  00ca 48            	sll	a
 996  00cb 5a            	decw	x
 997  00cc 26fc          	jrne	L621
 998  00ce               L421:
 999  00ce ca50ca        	or	a,20682
1000  00d1 c750ca        	ld	20682,a
1002  00d4 2016          	jra	L133
1003  00d6               L333:
1004                     ; 292       CLK->PCKENR2 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
1006  00d6 7b01          	ld	a,(OFST+1,sp)
1007  00d8 a40f          	and	a,#15
1008  00da 5f            	clrw	x
1009  00db 97            	ld	xl,a
1010  00dc a601          	ld	a,#1
1011  00de 5d            	tnzw	x
1012  00df 2704          	jreq	L031
1013  00e1               L231:
1014  00e1 48            	sll	a
1015  00e2 5a            	decw	x
1016  00e3 26fc          	jrne	L231
1017  00e5               L031:
1018  00e5 43            	cpl	a
1019  00e6 c450ca        	and	a,20682
1020  00e9 c750ca        	ld	20682,a
1021  00ec               L133:
1022                     ; 295 }
1025  00ec 85            	popw	x
1026  00ed 81            	ret
1215                     ; 309 ErrorStatus CLK_ClockSwitchConfig(CLK_SwitchMode_TypeDef CLK_SwitchMode, CLK_Source_TypeDef CLK_NewClock, FunctionalState ITState, CLK_CurrentClockState_TypeDef CLK_CurrentClockState)
1215                     ; 310 {
1216                     .text:	section	.text,new
1217  0000               _CLK_ClockSwitchConfig:
1219  0000 89            	pushw	x
1220  0001 5204          	subw	sp,#4
1221       00000004      OFST:	set	4
1224                     ; 312   uint16_t DownCounter = CLK_TIMEOUT;
1226  0003 aeffff        	ldw	x,#65535
1227  0006 1f03          	ldw	(OFST-1,sp),x
1228                     ; 313   ErrorStatus Swif = ERROR;
1230  0008 7b02          	ld	a,(OFST-2,sp)
1231  000a 97            	ld	xl,a
1232                     ; 316   assert_param(IS_CLK_SOURCE_OK(CLK_NewClock));
1234  000b 7b06          	ld	a,(OFST+2,sp)
1235  000d a1e1          	cp	a,#225
1236  000f 270c          	jreq	L041
1237  0011 7b06          	ld	a,(OFST+2,sp)
1238  0013 a1d2          	cp	a,#210
1239  0015 2706          	jreq	L041
1240  0017 7b06          	ld	a,(OFST+2,sp)
1241  0019 a1b4          	cp	a,#180
1242  001b 2603          	jrne	L631
1243  001d               L041:
1244  001d 4f            	clr	a
1245  001e 2010          	jra	L241
1246  0020               L631:
1247  0020 ae013c        	ldw	x,#316
1248  0023 89            	pushw	x
1249  0024 ae0000        	ldw	x,#0
1250  0027 89            	pushw	x
1251  0028 ae000c        	ldw	x,#L75
1252  002b cd0000        	call	_assert_failed
1254  002e 5b04          	addw	sp,#4
1255  0030               L241:
1256                     ; 317   assert_param(IS_CLK_SWITCHMODE_OK(CLK_SwitchMode));
1258  0030 0d05          	tnz	(OFST+1,sp)
1259  0032 2706          	jreq	L641
1260  0034 7b05          	ld	a,(OFST+1,sp)
1261  0036 a101          	cp	a,#1
1262  0038 2603          	jrne	L441
1263  003a               L641:
1264  003a 4f            	clr	a
1265  003b 2010          	jra	L051
1266  003d               L441:
1267  003d ae013d        	ldw	x,#317
1268  0040 89            	pushw	x
1269  0041 ae0000        	ldw	x,#0
1270  0044 89            	pushw	x
1271  0045 ae000c        	ldw	x,#L75
1272  0048 cd0000        	call	_assert_failed
1274  004b 5b04          	addw	sp,#4
1275  004d               L051:
1276                     ; 318   assert_param(IS_FUNCTIONALSTATE_OK(ITState));
1278  004d 0d09          	tnz	(OFST+5,sp)
1279  004f 2706          	jreq	L451
1280  0051 7b09          	ld	a,(OFST+5,sp)
1281  0053 a101          	cp	a,#1
1282  0055 2603          	jrne	L251
1283  0057               L451:
1284  0057 4f            	clr	a
1285  0058 2010          	jra	L651
1286  005a               L251:
1287  005a ae013e        	ldw	x,#318
1288  005d 89            	pushw	x
1289  005e ae0000        	ldw	x,#0
1290  0061 89            	pushw	x
1291  0062 ae000c        	ldw	x,#L75
1292  0065 cd0000        	call	_assert_failed
1294  0068 5b04          	addw	sp,#4
1295  006a               L651:
1296                     ; 319   assert_param(IS_CLK_CURRENTCLOCKSTATE_OK(CLK_CurrentClockState));
1298  006a 0d0a          	tnz	(OFST+6,sp)
1299  006c 2706          	jreq	L261
1300  006e 7b0a          	ld	a,(OFST+6,sp)
1301  0070 a101          	cp	a,#1
1302  0072 2603          	jrne	L061
1303  0074               L261:
1304  0074 4f            	clr	a
1305  0075 2010          	jra	L461
1306  0077               L061:
1307  0077 ae013f        	ldw	x,#319
1308  007a 89            	pushw	x
1309  007b ae0000        	ldw	x,#0
1310  007e 89            	pushw	x
1311  007f ae000c        	ldw	x,#L75
1312  0082 cd0000        	call	_assert_failed
1314  0085 5b04          	addw	sp,#4
1315  0087               L461:
1316                     ; 322   clock_master = (CLK_Source_TypeDef)CLK->CMSR;
1318  0087 c650c3        	ld	a,20675
1319  008a 6b01          	ld	(OFST-3,sp),a
1320                     ; 325   if (CLK_SwitchMode == CLK_SWITCHMODE_AUTO)
1322  008c 7b05          	ld	a,(OFST+1,sp)
1323  008e a101          	cp	a,#1
1324  0090 264b          	jrne	L744
1325                     ; 328     CLK->SWCR |= CLK_SWCR_SWEN;
1327  0092 721250c5      	bset	20677,#1
1328                     ; 331     if (ITState != DISABLE)
1330  0096 0d09          	tnz	(OFST+5,sp)
1331  0098 2706          	jreq	L154
1332                     ; 333       CLK->SWCR |= CLK_SWCR_SWIEN;
1334  009a 721450c5      	bset	20677,#2
1336  009e 2004          	jra	L354
1337  00a0               L154:
1338                     ; 337       CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIEN);
1340  00a0 721550c5      	bres	20677,#2
1341  00a4               L354:
1342                     ; 341     CLK->SWR = (uint8_t)CLK_NewClock;
1344  00a4 7b06          	ld	a,(OFST+2,sp)
1345  00a6 c750c4        	ld	20676,a
1347  00a9 2007          	jra	L164
1348  00ab               L554:
1349                     ; 346       DownCounter--;
1351  00ab 1e03          	ldw	x,(OFST-1,sp)
1352  00ad 1d0001        	subw	x,#1
1353  00b0 1f03          	ldw	(OFST-1,sp),x
1354  00b2               L164:
1355                     ; 344     while((((CLK->SWCR & CLK_SWCR_SWBSY) != 0 )&& (DownCounter != 0)))
1357  00b2 c650c5        	ld	a,20677
1358  00b5 a501          	bcp	a,#1
1359  00b7 2704          	jreq	L564
1361  00b9 1e03          	ldw	x,(OFST-1,sp)
1362  00bb 26ee          	jrne	L554
1363  00bd               L564:
1364                     ; 349     if(DownCounter != 0)
1366  00bd 1e03          	ldw	x,(OFST-1,sp)
1367  00bf 2706          	jreq	L764
1368                     ; 351       Swif = SUCCESS;
1370  00c1 a601          	ld	a,#1
1371  00c3 6b02          	ld	(OFST-2,sp),a
1373  00c5 2002          	jra	L374
1374  00c7               L764:
1375                     ; 355       Swif = ERROR;
1377  00c7 0f02          	clr	(OFST-2,sp)
1378  00c9               L374:
1379                     ; 390   if(Swif != ERROR)
1381  00c9 0d02          	tnz	(OFST-2,sp)
1382  00cb 2767          	jreq	L715
1383                     ; 393     if((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_HSI))
1385  00cd 0d0a          	tnz	(OFST+6,sp)
1386  00cf 2645          	jrne	L125
1388  00d1 7b01          	ld	a,(OFST-3,sp)
1389  00d3 a1e1          	cp	a,#225
1390  00d5 263f          	jrne	L125
1391                     ; 395       CLK->ICKR &= (uint8_t)(~CLK_ICKR_HSIEN);
1393  00d7 721150c0      	bres	20672,#0
1395  00db 2057          	jra	L715
1396  00dd               L744:
1397                     ; 361     if (ITState != DISABLE)
1399  00dd 0d09          	tnz	(OFST+5,sp)
1400  00df 2706          	jreq	L574
1401                     ; 363       CLK->SWCR |= CLK_SWCR_SWIEN;
1403  00e1 721450c5      	bset	20677,#2
1405  00e5 2004          	jra	L774
1406  00e7               L574:
1407                     ; 367       CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIEN);
1409  00e7 721550c5      	bres	20677,#2
1410  00eb               L774:
1411                     ; 371     CLK->SWR = (uint8_t)CLK_NewClock;
1413  00eb 7b06          	ld	a,(OFST+2,sp)
1414  00ed c750c4        	ld	20676,a
1416  00f0 2007          	jra	L505
1417  00f2               L105:
1418                     ; 376       DownCounter--;
1420  00f2 1e03          	ldw	x,(OFST-1,sp)
1421  00f4 1d0001        	subw	x,#1
1422  00f7 1f03          	ldw	(OFST-1,sp),x
1423  00f9               L505:
1424                     ; 374     while((((CLK->SWCR & CLK_SWCR_SWIF) != 0 ) && (DownCounter != 0)))
1426  00f9 c650c5        	ld	a,20677
1427  00fc a508          	bcp	a,#8
1428  00fe 2704          	jreq	L115
1430  0100 1e03          	ldw	x,(OFST-1,sp)
1431  0102 26ee          	jrne	L105
1432  0104               L115:
1433                     ; 379     if(DownCounter != 0)
1435  0104 1e03          	ldw	x,(OFST-1,sp)
1436  0106 270a          	jreq	L315
1437                     ; 382       CLK->SWCR |= CLK_SWCR_SWEN;
1439  0108 721250c5      	bset	20677,#1
1440                     ; 383       Swif = SUCCESS;
1442  010c a601          	ld	a,#1
1443  010e 6b02          	ld	(OFST-2,sp),a
1445  0110 20b7          	jra	L374
1446  0112               L315:
1447                     ; 387       Swif = ERROR;
1449  0112 0f02          	clr	(OFST-2,sp)
1450  0114 20b3          	jra	L374
1451  0116               L125:
1452                     ; 397     else if((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_LSI))
1454  0116 0d0a          	tnz	(OFST+6,sp)
1455  0118 260c          	jrne	L525
1457  011a 7b01          	ld	a,(OFST-3,sp)
1458  011c a1d2          	cp	a,#210
1459  011e 2606          	jrne	L525
1460                     ; 399       CLK->ICKR &= (uint8_t)(~CLK_ICKR_LSIEN);
1462  0120 721750c0      	bres	20672,#3
1464  0124 200e          	jra	L715
1465  0126               L525:
1466                     ; 401     else if ((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_HSE))
1468  0126 0d0a          	tnz	(OFST+6,sp)
1469  0128 260a          	jrne	L715
1471  012a 7b01          	ld	a,(OFST-3,sp)
1472  012c a1b4          	cp	a,#180
1473  012e 2604          	jrne	L715
1474                     ; 403       CLK->ECKR &= (uint8_t)(~CLK_ECKR_HSEEN);
1476  0130 721150c1      	bres	20673,#0
1477  0134               L715:
1478                     ; 406   return(Swif);
1480  0134 7b02          	ld	a,(OFST-2,sp)
1483  0136 5b06          	addw	sp,#6
1484  0138 81            	ret
1623                     ; 415 void CLK_HSIPrescalerConfig(CLK_Prescaler_TypeDef HSIPrescaler)
1623                     ; 416 {
1624                     .text:	section	.text,new
1625  0000               _CLK_HSIPrescalerConfig:
1627  0000 88            	push	a
1628       00000000      OFST:	set	0
1631                     ; 418   assert_param(IS_CLK_HSIPRESCALER_OK(HSIPrescaler));
1633  0001 4d            	tnz	a
1634  0002 270c          	jreq	L271
1635  0004 a108          	cp	a,#8
1636  0006 2708          	jreq	L271
1637  0008 a110          	cp	a,#16
1638  000a 2704          	jreq	L271
1639  000c a118          	cp	a,#24
1640  000e 2603          	jrne	L071
1641  0010               L271:
1642  0010 4f            	clr	a
1643  0011 2010          	jra	L471
1644  0013               L071:
1645  0013 ae01a2        	ldw	x,#418
1646  0016 89            	pushw	x
1647  0017 ae0000        	ldw	x,#0
1648  001a 89            	pushw	x
1649  001b ae000c        	ldw	x,#L75
1650  001e cd0000        	call	_assert_failed
1652  0021 5b04          	addw	sp,#4
1653  0023               L471:
1654                     ; 421   CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
1656  0023 c650c6        	ld	a,20678
1657  0026 a4e7          	and	a,#231
1658  0028 c750c6        	ld	20678,a
1659                     ; 424   CLK->CKDIVR |= (uint8_t)HSIPrescaler;
1661  002b c650c6        	ld	a,20678
1662  002e 1a01          	or	a,(OFST+1,sp)
1663  0030 c750c6        	ld	20678,a
1664                     ; 425 }
1667  0033 84            	pop	a
1668  0034 81            	ret
1804                     ; 436 void CLK_CCOConfig(CLK_Output_TypeDef CLK_CCO)
1804                     ; 437 {
1805                     .text:	section	.text,new
1806  0000               _CLK_CCOConfig:
1808  0000 88            	push	a
1809       00000000      OFST:	set	0
1812                     ; 439   assert_param(IS_CLK_OUTPUT_OK(CLK_CCO));
1814  0001 4d            	tnz	a
1815  0002 2730          	jreq	L202
1816  0004 a104          	cp	a,#4
1817  0006 272c          	jreq	L202
1818  0008 a102          	cp	a,#2
1819  000a 2728          	jreq	L202
1820  000c a108          	cp	a,#8
1821  000e 2724          	jreq	L202
1822  0010 a10a          	cp	a,#10
1823  0012 2720          	jreq	L202
1824  0014 a10c          	cp	a,#12
1825  0016 271c          	jreq	L202
1826  0018 a10e          	cp	a,#14
1827  001a 2718          	jreq	L202
1828  001c a110          	cp	a,#16
1829  001e 2714          	jreq	L202
1830  0020 a112          	cp	a,#18
1831  0022 2710          	jreq	L202
1832  0024 a114          	cp	a,#20
1833  0026 270c          	jreq	L202
1834  0028 a116          	cp	a,#22
1835  002a 2708          	jreq	L202
1836  002c a118          	cp	a,#24
1837  002e 2704          	jreq	L202
1838  0030 a11a          	cp	a,#26
1839  0032 2603          	jrne	L002
1840  0034               L202:
1841  0034 4f            	clr	a
1842  0035 2010          	jra	L402
1843  0037               L002:
1844  0037 ae01b7        	ldw	x,#439
1845  003a 89            	pushw	x
1846  003b ae0000        	ldw	x,#0
1847  003e 89            	pushw	x
1848  003f ae000c        	ldw	x,#L75
1849  0042 cd0000        	call	_assert_failed
1851  0045 5b04          	addw	sp,#4
1852  0047               L402:
1853                     ; 442   CLK->CCOR &= (uint8_t)(~CLK_CCOR_CCOSEL);
1855  0047 c650c9        	ld	a,20681
1856  004a a4e1          	and	a,#225
1857  004c c750c9        	ld	20681,a
1858                     ; 445   CLK->CCOR |= (uint8_t)CLK_CCO;
1860  004f c650c9        	ld	a,20681
1861  0052 1a01          	or	a,(OFST+1,sp)
1862  0054 c750c9        	ld	20681,a
1863                     ; 448   CLK->CCOR |= CLK_CCOR_CCOEN;
1865  0057 721050c9      	bset	20681,#0
1866                     ; 449 }
1869  005b 84            	pop	a
1870  005c 81            	ret
1936                     ; 459 void CLK_ITConfig(CLK_IT_TypeDef CLK_IT, FunctionalState NewState)
1936                     ; 460 {
1937                     .text:	section	.text,new
1938  0000               _CLK_ITConfig:
1940  0000 89            	pushw	x
1941       00000000      OFST:	set	0
1944                     ; 462   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1946  0001 9f            	ld	a,xl
1947  0002 4d            	tnz	a
1948  0003 2705          	jreq	L212
1949  0005 9f            	ld	a,xl
1950  0006 a101          	cp	a,#1
1951  0008 2603          	jrne	L012
1952  000a               L212:
1953  000a 4f            	clr	a
1954  000b 2010          	jra	L412
1955  000d               L012:
1956  000d ae01ce        	ldw	x,#462
1957  0010 89            	pushw	x
1958  0011 ae0000        	ldw	x,#0
1959  0014 89            	pushw	x
1960  0015 ae000c        	ldw	x,#L75
1961  0018 cd0000        	call	_assert_failed
1963  001b 5b04          	addw	sp,#4
1964  001d               L412:
1965                     ; 463   assert_param(IS_CLK_IT_OK(CLK_IT));
1967  001d 7b01          	ld	a,(OFST+1,sp)
1968  001f a10c          	cp	a,#12
1969  0021 2706          	jreq	L022
1970  0023 7b01          	ld	a,(OFST+1,sp)
1971  0025 a11c          	cp	a,#28
1972  0027 2603          	jrne	L612
1973  0029               L022:
1974  0029 4f            	clr	a
1975  002a 2010          	jra	L222
1976  002c               L612:
1977  002c ae01cf        	ldw	x,#463
1978  002f 89            	pushw	x
1979  0030 ae0000        	ldw	x,#0
1980  0033 89            	pushw	x
1981  0034 ae000c        	ldw	x,#L75
1982  0037 cd0000        	call	_assert_failed
1984  003a 5b04          	addw	sp,#4
1985  003c               L222:
1986                     ; 465   if (NewState != DISABLE)
1988  003c 0d02          	tnz	(OFST+2,sp)
1989  003e 271a          	jreq	L727
1990                     ; 467     switch (CLK_IT)
1992  0040 7b01          	ld	a,(OFST+1,sp)
1994                     ; 475     default:
1994                     ; 476       break;
1995  0042 a00c          	sub	a,#12
1996  0044 270a          	jreq	L366
1997  0046 a010          	sub	a,#16
1998  0048 2624          	jrne	L537
1999                     ; 469     case CLK_IT_SWIF: /* Enable the clock switch interrupt */
1999                     ; 470       CLK->SWCR |= CLK_SWCR_SWIEN;
2001  004a 721450c5      	bset	20677,#2
2002                     ; 471       break;
2004  004e 201e          	jra	L537
2005  0050               L366:
2006                     ; 472     case CLK_IT_CSSD: /* Enable the clock security system detection interrupt */
2006                     ; 473       CLK->CSSR |= CLK_CSSR_CSSDIE;
2008  0050 721450c8      	bset	20680,#2
2009                     ; 474       break;
2011  0054 2018          	jra	L537
2012  0056               L566:
2013                     ; 475     default:
2013                     ; 476       break;
2015  0056 2016          	jra	L537
2016  0058               L337:
2018  0058 2014          	jra	L537
2019  005a               L727:
2020                     ; 481     switch (CLK_IT)
2022  005a 7b01          	ld	a,(OFST+1,sp)
2024                     ; 489     default:
2024                     ; 490       break;
2025  005c a00c          	sub	a,#12
2026  005e 270a          	jreq	L176
2027  0060 a010          	sub	a,#16
2028  0062 260a          	jrne	L537
2029                     ; 483     case CLK_IT_SWIF: /* Disable the clock switch interrupt */
2029                     ; 484       CLK->SWCR  &= (uint8_t)(~CLK_SWCR_SWIEN);
2031  0064 721550c5      	bres	20677,#2
2032                     ; 485       break;
2034  0068 2004          	jra	L537
2035  006a               L176:
2036                     ; 486     case CLK_IT_CSSD: /* Disable the clock security system detection interrupt */
2036                     ; 487       CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSDIE);
2038  006a 721550c8      	bres	20680,#2
2039                     ; 488       break;
2040  006e               L537:
2041                     ; 493 }
2044  006e 85            	popw	x
2045  006f 81            	ret
2046  0070               L376:
2047                     ; 489     default:
2047                     ; 490       break;
2049  0070 20fc          	jra	L537
2050  0072               L147:
2051  0072 20fa          	jra	L537
2087                     ; 500 void CLK_SYSCLKConfig(CLK_Prescaler_TypeDef CLK_Prescaler)
2087                     ; 501 {
2088                     .text:	section	.text,new
2089  0000               _CLK_SYSCLKConfig:
2091  0000 88            	push	a
2092       00000000      OFST:	set	0
2095                     ; 503   assert_param(IS_CLK_PRESCALER_OK(CLK_Prescaler));
2097  0001 4d            	tnz	a
2098  0002 272c          	jreq	L032
2099  0004 a108          	cp	a,#8
2100  0006 2728          	jreq	L032
2101  0008 a110          	cp	a,#16
2102  000a 2724          	jreq	L032
2103  000c a118          	cp	a,#24
2104  000e 2720          	jreq	L032
2105  0010 a180          	cp	a,#128
2106  0012 271c          	jreq	L032
2107  0014 a181          	cp	a,#129
2108  0016 2718          	jreq	L032
2109  0018 a182          	cp	a,#130
2110  001a 2714          	jreq	L032
2111  001c a183          	cp	a,#131
2112  001e 2710          	jreq	L032
2113  0020 a184          	cp	a,#132
2114  0022 270c          	jreq	L032
2115  0024 a185          	cp	a,#133
2116  0026 2708          	jreq	L032
2117  0028 a186          	cp	a,#134
2118  002a 2704          	jreq	L032
2119  002c a187          	cp	a,#135
2120  002e 2603          	jrne	L622
2121  0030               L032:
2122  0030 4f            	clr	a
2123  0031 2010          	jra	L232
2124  0033               L622:
2125  0033 ae01f7        	ldw	x,#503
2126  0036 89            	pushw	x
2127  0037 ae0000        	ldw	x,#0
2128  003a 89            	pushw	x
2129  003b ae000c        	ldw	x,#L75
2130  003e cd0000        	call	_assert_failed
2132  0041 5b04          	addw	sp,#4
2133  0043               L232:
2134                     ; 505   if (((uint8_t)CLK_Prescaler & (uint8_t)0x80) == 0x00) /* Bit7 = 0 means HSI divider */
2136  0043 7b01          	ld	a,(OFST+1,sp)
2137  0045 a580          	bcp	a,#128
2138  0047 2614          	jrne	L167
2139                     ; 507     CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
2141  0049 c650c6        	ld	a,20678
2142  004c a4e7          	and	a,#231
2143  004e c750c6        	ld	20678,a
2144                     ; 508     CLK->CKDIVR |= (uint8_t)((uint8_t)CLK_Prescaler & (uint8_t)CLK_CKDIVR_HSIDIV);
2146  0051 7b01          	ld	a,(OFST+1,sp)
2147  0053 a418          	and	a,#24
2148  0055 ca50c6        	or	a,20678
2149  0058 c750c6        	ld	20678,a
2151  005b 2012          	jra	L367
2152  005d               L167:
2153                     ; 512     CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_CPUDIV);
2155  005d c650c6        	ld	a,20678
2156  0060 a4f8          	and	a,#248
2157  0062 c750c6        	ld	20678,a
2158                     ; 513     CLK->CKDIVR |= (uint8_t)((uint8_t)CLK_Prescaler & (uint8_t)CLK_CKDIVR_CPUDIV);
2160  0065 7b01          	ld	a,(OFST+1,sp)
2161  0067 a407          	and	a,#7
2162  0069 ca50c6        	or	a,20678
2163  006c c750c6        	ld	20678,a
2164  006f               L367:
2165                     ; 515 }
2168  006f 84            	pop	a
2169  0070 81            	ret
2226                     ; 523 void CLK_SWIMConfig(CLK_SWIMDivider_TypeDef CLK_SWIMDivider)
2226                     ; 524 {
2227                     .text:	section	.text,new
2228  0000               _CLK_SWIMConfig:
2230  0000 88            	push	a
2231       00000000      OFST:	set	0
2234                     ; 526   assert_param(IS_CLK_SWIMDIVIDER_OK(CLK_SWIMDivider));
2236  0001 4d            	tnz	a
2237  0002 2704          	jreq	L042
2238  0004 a101          	cp	a,#1
2239  0006 2603          	jrne	L632
2240  0008               L042:
2241  0008 4f            	clr	a
2242  0009 2010          	jra	L242
2243  000b               L632:
2244  000b ae020e        	ldw	x,#526
2245  000e 89            	pushw	x
2246  000f ae0000        	ldw	x,#0
2247  0012 89            	pushw	x
2248  0013 ae000c        	ldw	x,#L75
2249  0016 cd0000        	call	_assert_failed
2251  0019 5b04          	addw	sp,#4
2252  001b               L242:
2253                     ; 528   if (CLK_SWIMDivider != CLK_SWIMDIVIDER_2)
2255  001b 0d01          	tnz	(OFST+1,sp)
2256  001d 2706          	jreq	L3101
2257                     ; 531     CLK->SWIMCCR |= CLK_SWIMCCR_SWIMDIV;
2259  001f 721050cd      	bset	20685,#0
2261  0023 2004          	jra	L5101
2262  0025               L3101:
2263                     ; 536     CLK->SWIMCCR &= (uint8_t)(~CLK_SWIMCCR_SWIMDIV);
2265  0025 721150cd      	bres	20685,#0
2266  0029               L5101:
2267                     ; 538 }
2270  0029 84            	pop	a
2271  002a 81            	ret
2295                     ; 547 void CLK_ClockSecuritySystemEnable(void)
2295                     ; 548 {
2296                     .text:	section	.text,new
2297  0000               _CLK_ClockSecuritySystemEnable:
2301                     ; 550   CLK->CSSR |= CLK_CSSR_CSSEN;
2303  0000 721050c8      	bset	20680,#0
2304                     ; 551 }
2307  0004 81            	ret
2332                     ; 559 CLK_Source_TypeDef CLK_GetSYSCLKSource(void)
2332                     ; 560 {
2333                     .text:	section	.text,new
2334  0000               _CLK_GetSYSCLKSource:
2338                     ; 561   return((CLK_Source_TypeDef)CLK->CMSR);
2340  0000 c650c3        	ld	a,20675
2343  0003 81            	ret
2406                     ; 569 uint32_t CLK_GetClockFreq(void)
2406                     ; 570 {
2407                     .text:	section	.text,new
2408  0000               _CLK_GetClockFreq:
2410  0000 5209          	subw	sp,#9
2411       00000009      OFST:	set	9
2414                     ; 571   uint32_t clockfrequency = 0;
2416  0002 96            	ldw	x,sp
2417  0003 1c0005        	addw	x,#OFST-4
2418  0006 cd0000        	call	c_ltor
2420                     ; 572   CLK_Source_TypeDef clocksource = CLK_SOURCE_HSI;
2422  0009 7b09          	ld	a,(OFST+0,sp)
2423  000b 97            	ld	xl,a
2424                     ; 573   uint8_t tmp = 0, presc = 0;
2426  000c 7b09          	ld	a,(OFST+0,sp)
2427  000e 97            	ld	xl,a
2430  000f 7b09          	ld	a,(OFST+0,sp)
2431  0011 97            	ld	xl,a
2432                     ; 576   clocksource = (CLK_Source_TypeDef)CLK->CMSR;
2434  0012 c650c3        	ld	a,20675
2435  0015 6b09          	ld	(OFST+0,sp),a
2436                     ; 578   if (clocksource == CLK_SOURCE_HSI)
2438  0017 7b09          	ld	a,(OFST+0,sp)
2439  0019 a1e1          	cp	a,#225
2440  001b 2642          	jrne	L1701
2441                     ; 580     tmp = (uint8_t)(CLK->CKDIVR & CLK_CKDIVR_HSIDIV);
2443  001d c650c6        	ld	a,20678
2444  0020 a418          	and	a,#24
2445  0022 6b09          	ld	(OFST+0,sp),a
2446                     ; 581     tmp = (uint8_t)(tmp >> 3);
2448  0024 7b09          	ld	a,(OFST+0,sp)
2449  0026 44            	srl	a
2450  0027 44            	srl	a
2451  0028 44            	srl	a
2452  0029 6b09          	ld	(OFST+0,sp),a
2453                     ; 582     presc = HSIDivFactor[tmp];
2455  002b 7b09          	ld	a,(OFST+0,sp)
2456  002d 5f            	clrw	x
2457  002e 97            	ld	xl,a
2458  002f d60000        	ld	a,(_HSIDivFactor,x)
2459  0032 6b09          	ld	(OFST+0,sp),a
2460                     ; 583     clockfrequency = HSI_VALUE / presc;
2462  0034 7b09          	ld	a,(OFST+0,sp)
2463  0036 b703          	ld	c_lreg+3,a
2464  0038 3f02          	clr	c_lreg+2
2465  003a 3f01          	clr	c_lreg+1
2466  003c 3f00          	clr	c_lreg
2467  003e 96            	ldw	x,sp
2468  003f 1c0001        	addw	x,#OFST-8
2469  0042 cd0000        	call	c_rtol
2471  0045 ae2400        	ldw	x,#9216
2472  0048 bf02          	ldw	c_lreg+2,x
2473  004a ae00f4        	ldw	x,#244
2474  004d bf00          	ldw	c_lreg,x
2475  004f 96            	ldw	x,sp
2476  0050 1c0001        	addw	x,#OFST-8
2477  0053 cd0000        	call	c_ludv
2479  0056 96            	ldw	x,sp
2480  0057 1c0005        	addw	x,#OFST-4
2481  005a cd0000        	call	c_rtol
2484  005d 201c          	jra	L3701
2485  005f               L1701:
2486                     ; 585   else if ( clocksource == CLK_SOURCE_LSI)
2488  005f 7b09          	ld	a,(OFST+0,sp)
2489  0061 a1d2          	cp	a,#210
2490  0063 260c          	jrne	L5701
2491                     ; 587     clockfrequency = LSI_VALUE;
2493  0065 aef400        	ldw	x,#62464
2494  0068 1f07          	ldw	(OFST-2,sp),x
2495  006a ae0001        	ldw	x,#1
2496  006d 1f05          	ldw	(OFST-4,sp),x
2498  006f 200a          	jra	L3701
2499  0071               L5701:
2500                     ; 591     clockfrequency = HSE_VALUE;
2502  0071 ae2400        	ldw	x,#9216
2503  0074 1f07          	ldw	(OFST-2,sp),x
2504  0076 ae00f4        	ldw	x,#244
2505  0079 1f05          	ldw	(OFST-4,sp),x
2506  007b               L3701:
2507                     ; 594   return((uint32_t)clockfrequency);
2509  007b 96            	ldw	x,sp
2510  007c 1c0005        	addw	x,#OFST-4
2511  007f cd0000        	call	c_ltor
2515  0082 5b09          	addw	sp,#9
2516  0084 81            	ret
2616                     ; 604 void CLK_AdjustHSICalibrationValue(CLK_HSITrimValue_TypeDef CLK_HSICalibrationValue)
2616                     ; 605 {
2617                     .text:	section	.text,new
2618  0000               _CLK_AdjustHSICalibrationValue:
2620  0000 88            	push	a
2621       00000000      OFST:	set	0
2624                     ; 607   assert_param(IS_CLK_HSITRIMVALUE_OK(CLK_HSICalibrationValue));
2626  0001 4d            	tnz	a
2627  0002 271c          	jreq	L652
2628  0004 a101          	cp	a,#1
2629  0006 2718          	jreq	L652
2630  0008 a102          	cp	a,#2
2631  000a 2714          	jreq	L652
2632  000c a103          	cp	a,#3
2633  000e 2710          	jreq	L652
2634  0010 a104          	cp	a,#4
2635  0012 270c          	jreq	L652
2636  0014 a105          	cp	a,#5
2637  0016 2708          	jreq	L652
2638  0018 a106          	cp	a,#6
2639  001a 2704          	jreq	L652
2640  001c a107          	cp	a,#7
2641  001e 2603          	jrne	L452
2642  0020               L652:
2643  0020 4f            	clr	a
2644  0021 2010          	jra	L062
2645  0023               L452:
2646  0023 ae025f        	ldw	x,#607
2647  0026 89            	pushw	x
2648  0027 ae0000        	ldw	x,#0
2649  002a 89            	pushw	x
2650  002b ae000c        	ldw	x,#L75
2651  002e cd0000        	call	_assert_failed
2653  0031 5b04          	addw	sp,#4
2654  0033               L062:
2655                     ; 610   CLK->HSITRIMR = (uint8_t)( (uint8_t)(CLK->HSITRIMR & (uint8_t)(~CLK_HSITRIMR_HSITRIM))|((uint8_t)CLK_HSICalibrationValue));
2657  0033 c650cc        	ld	a,20684
2658  0036 a4f8          	and	a,#248
2659  0038 1a01          	or	a,(OFST+1,sp)
2660  003a c750cc        	ld	20684,a
2661                     ; 611 }
2664  003d 84            	pop	a
2665  003e 81            	ret
2689                     ; 622 void CLK_SYSCLKEmergencyClear(void)
2689                     ; 623 {
2690                     .text:	section	.text,new
2691  0000               _CLK_SYSCLKEmergencyClear:
2695                     ; 624   CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWBSY);
2697  0000 721150c5      	bres	20677,#0
2698                     ; 625 }
2701  0004 81            	ret
2855                     ; 634 FlagStatus CLK_GetFlagStatus(CLK_Flag_TypeDef CLK_FLAG)
2855                     ; 635 {
2856                     .text:	section	.text,new
2857  0000               _CLK_GetFlagStatus:
2859  0000 89            	pushw	x
2860  0001 5203          	subw	sp,#3
2861       00000003      OFST:	set	3
2864                     ; 636   uint16_t statusreg = 0;
2866  0003 1e01          	ldw	x,(OFST-2,sp)
2867                     ; 637   uint8_t tmpreg = 0;
2869  0005 7b03          	ld	a,(OFST+0,sp)
2870  0007 97            	ld	xl,a
2871                     ; 638   FlagStatus bitstatus = RESET;
2873  0008 7b03          	ld	a,(OFST+0,sp)
2874  000a 97            	ld	xl,a
2875                     ; 641   assert_param(IS_CLK_FLAG_OK(CLK_FLAG));
2877  000b 1e04          	ldw	x,(OFST+1,sp)
2878  000d a30110        	cpw	x,#272
2879  0010 2738          	jreq	L072
2880  0012 1e04          	ldw	x,(OFST+1,sp)
2881  0014 a30102        	cpw	x,#258
2882  0017 2731          	jreq	L072
2883  0019 1e04          	ldw	x,(OFST+1,sp)
2884  001b a30202        	cpw	x,#514
2885  001e 272a          	jreq	L072
2886  0020 1e04          	ldw	x,(OFST+1,sp)
2887  0022 a30308        	cpw	x,#776
2888  0025 2723          	jreq	L072
2889  0027 1e04          	ldw	x,(OFST+1,sp)
2890  0029 a30301        	cpw	x,#769
2891  002c 271c          	jreq	L072
2892  002e 1e04          	ldw	x,(OFST+1,sp)
2893  0030 a30408        	cpw	x,#1032
2894  0033 2715          	jreq	L072
2895  0035 1e04          	ldw	x,(OFST+1,sp)
2896  0037 a30402        	cpw	x,#1026
2897  003a 270e          	jreq	L072
2898  003c 1e04          	ldw	x,(OFST+1,sp)
2899  003e a30504        	cpw	x,#1284
2900  0041 2707          	jreq	L072
2901  0043 1e04          	ldw	x,(OFST+1,sp)
2902  0045 a30502        	cpw	x,#1282
2903  0048 2603          	jrne	L662
2904  004a               L072:
2905  004a 4f            	clr	a
2906  004b 2010          	jra	L272
2907  004d               L662:
2908  004d ae0281        	ldw	x,#641
2909  0050 89            	pushw	x
2910  0051 ae0000        	ldw	x,#0
2911  0054 89            	pushw	x
2912  0055 ae000c        	ldw	x,#L75
2913  0058 cd0000        	call	_assert_failed
2915  005b 5b04          	addw	sp,#4
2916  005d               L272:
2917                     ; 644   statusreg = (uint16_t)((uint16_t)CLK_FLAG & (uint16_t)0xFF00);
2919  005d 7b04          	ld	a,(OFST+1,sp)
2920  005f 97            	ld	xl,a
2921  0060 7b05          	ld	a,(OFST+2,sp)
2922  0062 9f            	ld	a,xl
2923  0063 a4ff          	and	a,#255
2924  0065 97            	ld	xl,a
2925  0066 4f            	clr	a
2926  0067 02            	rlwa	x,a
2927  0068 1f01          	ldw	(OFST-2,sp),x
2928  006a 01            	rrwa	x,a
2929                     ; 647   if (statusreg == 0x0100) /* The flag to check is in ICKRregister */
2931  006b 1e01          	ldw	x,(OFST-2,sp)
2932  006d a30100        	cpw	x,#256
2933  0070 2607          	jrne	L3421
2934                     ; 649     tmpreg = CLK->ICKR;
2936  0072 c650c0        	ld	a,20672
2937  0075 6b03          	ld	(OFST+0,sp),a
2939  0077 202f          	jra	L5421
2940  0079               L3421:
2941                     ; 651   else if (statusreg == 0x0200) /* The flag to check is in ECKRregister */
2943  0079 1e01          	ldw	x,(OFST-2,sp)
2944  007b a30200        	cpw	x,#512
2945  007e 2607          	jrne	L7421
2946                     ; 653     tmpreg = CLK->ECKR;
2948  0080 c650c1        	ld	a,20673
2949  0083 6b03          	ld	(OFST+0,sp),a
2951  0085 2021          	jra	L5421
2952  0087               L7421:
2953                     ; 655   else if (statusreg == 0x0300) /* The flag to check is in SWIC register */
2955  0087 1e01          	ldw	x,(OFST-2,sp)
2956  0089 a30300        	cpw	x,#768
2957  008c 2607          	jrne	L3521
2958                     ; 657     tmpreg = CLK->SWCR;
2960  008e c650c5        	ld	a,20677
2961  0091 6b03          	ld	(OFST+0,sp),a
2963  0093 2013          	jra	L5421
2964  0095               L3521:
2965                     ; 659   else if (statusreg == 0x0400) /* The flag to check is in CSS register */
2967  0095 1e01          	ldw	x,(OFST-2,sp)
2968  0097 a30400        	cpw	x,#1024
2969  009a 2607          	jrne	L7521
2970                     ; 661     tmpreg = CLK->CSSR;
2972  009c c650c8        	ld	a,20680
2973  009f 6b03          	ld	(OFST+0,sp),a
2975  00a1 2005          	jra	L5421
2976  00a3               L7521:
2977                     ; 665     tmpreg = CLK->CCOR;
2979  00a3 c650c9        	ld	a,20681
2980  00a6 6b03          	ld	(OFST+0,sp),a
2981  00a8               L5421:
2982                     ; 668   if ((tmpreg & (uint8_t)CLK_FLAG) != (uint8_t)RESET)
2984  00a8 7b05          	ld	a,(OFST+2,sp)
2985  00aa 1503          	bcp	a,(OFST+0,sp)
2986  00ac 2706          	jreq	L3621
2987                     ; 670     bitstatus = SET;
2989  00ae a601          	ld	a,#1
2990  00b0 6b03          	ld	(OFST+0,sp),a
2992  00b2 2002          	jra	L5621
2993  00b4               L3621:
2994                     ; 674     bitstatus = RESET;
2996  00b4 0f03          	clr	(OFST+0,sp)
2997  00b6               L5621:
2998                     ; 678   return((FlagStatus)bitstatus);
3000  00b6 7b03          	ld	a,(OFST+0,sp)
3003  00b8 5b05          	addw	sp,#5
3004  00ba 81            	ret
3051                     ; 687 ITStatus CLK_GetITStatus(CLK_IT_TypeDef CLK_IT)
3051                     ; 688 {
3052                     .text:	section	.text,new
3053  0000               _CLK_GetITStatus:
3055  0000 88            	push	a
3056  0001 88            	push	a
3057       00000001      OFST:	set	1
3060                     ; 689   ITStatus bitstatus = RESET;
3062  0002 0f01          	clr	(OFST+0,sp)
3063                     ; 692   assert_param(IS_CLK_IT_OK(CLK_IT));
3065  0004 a10c          	cp	a,#12
3066  0006 2704          	jreq	L003
3067  0008 a11c          	cp	a,#28
3068  000a 2603          	jrne	L672
3069  000c               L003:
3070  000c 4f            	clr	a
3071  000d 2010          	jra	L203
3072  000f               L672:
3073  000f ae02b4        	ldw	x,#692
3074  0012 89            	pushw	x
3075  0013 ae0000        	ldw	x,#0
3076  0016 89            	pushw	x
3077  0017 ae000c        	ldw	x,#L75
3078  001a cd0000        	call	_assert_failed
3080  001d 5b04          	addw	sp,#4
3081  001f               L203:
3082                     ; 694   if (CLK_IT == CLK_IT_SWIF)
3084  001f 7b02          	ld	a,(OFST+1,sp)
3085  0021 a11c          	cp	a,#28
3086  0023 2613          	jrne	L1131
3087                     ; 697     if ((CLK->SWCR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
3089  0025 c650c5        	ld	a,20677
3090  0028 1402          	and	a,(OFST+1,sp)
3091  002a a10c          	cp	a,#12
3092  002c 2606          	jrne	L3131
3093                     ; 699       bitstatus = SET;
3095  002e a601          	ld	a,#1
3096  0030 6b01          	ld	(OFST+0,sp),a
3098  0032 2015          	jra	L7131
3099  0034               L3131:
3100                     ; 703       bitstatus = RESET;
3102  0034 0f01          	clr	(OFST+0,sp)
3103  0036 2011          	jra	L7131
3104  0038               L1131:
3105                     ; 709     if ((CLK->CSSR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
3107  0038 c650c8        	ld	a,20680
3108  003b 1402          	and	a,(OFST+1,sp)
3109  003d a10c          	cp	a,#12
3110  003f 2606          	jrne	L1231
3111                     ; 711       bitstatus = SET;
3113  0041 a601          	ld	a,#1
3114  0043 6b01          	ld	(OFST+0,sp),a
3116  0045 2002          	jra	L7131
3117  0047               L1231:
3118                     ; 715       bitstatus = RESET;
3120  0047 0f01          	clr	(OFST+0,sp)
3121  0049               L7131:
3122                     ; 720   return bitstatus;
3124  0049 7b01          	ld	a,(OFST+0,sp)
3127  004b 85            	popw	x
3128  004c 81            	ret
3165                     ; 729 void CLK_ClearITPendingBit(CLK_IT_TypeDef CLK_IT)
3165                     ; 730 {
3166                     .text:	section	.text,new
3167  0000               _CLK_ClearITPendingBit:
3169  0000 88            	push	a
3170       00000000      OFST:	set	0
3173                     ; 732   assert_param(IS_CLK_IT_OK(CLK_IT));
3175  0001 a10c          	cp	a,#12
3176  0003 2704          	jreq	L013
3177  0005 a11c          	cp	a,#28
3178  0007 2603          	jrne	L603
3179  0009               L013:
3180  0009 4f            	clr	a
3181  000a 2010          	jra	L213
3182  000c               L603:
3183  000c ae02dc        	ldw	x,#732
3184  000f 89            	pushw	x
3185  0010 ae0000        	ldw	x,#0
3186  0013 89            	pushw	x
3187  0014 ae000c        	ldw	x,#L75
3188  0017 cd0000        	call	_assert_failed
3190  001a 5b04          	addw	sp,#4
3191  001c               L213:
3192                     ; 734   if (CLK_IT == (uint8_t)CLK_IT_CSSD)
3194  001c 7b01          	ld	a,(OFST+1,sp)
3195  001e a10c          	cp	a,#12
3196  0020 2606          	jrne	L3431
3197                     ; 737     CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSD);
3199  0022 721750c8      	bres	20680,#3
3201  0026 2004          	jra	L5431
3202  0028               L3431:
3203                     ; 742     CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIF);
3205  0028 721750c5      	bres	20677,#3
3206  002c               L5431:
3207                     ; 745 }
3210  002c 84            	pop	a
3211  002d 81            	ret
3246                     	xdef	_CLKPrescTable
3247                     	xdef	_HSIDivFactor
3248                     	xdef	_CLK_ClearITPendingBit
3249                     	xdef	_CLK_GetITStatus
3250                     	xdef	_CLK_GetFlagStatus
3251                     	xdef	_CLK_GetSYSCLKSource
3252                     	xdef	_CLK_GetClockFreq
3253                     	xdef	_CLK_AdjustHSICalibrationValue
3254                     	xdef	_CLK_SYSCLKEmergencyClear
3255                     	xdef	_CLK_ClockSecuritySystemEnable
3256                     	xdef	_CLK_SWIMConfig
3257                     	xdef	_CLK_SYSCLKConfig
3258                     	xdef	_CLK_ITConfig
3259                     	xdef	_CLK_CCOConfig
3260                     	xdef	_CLK_HSIPrescalerConfig
3261                     	xdef	_CLK_ClockSwitchConfig
3262                     	xdef	_CLK_PeripheralClockConfig
3263                     	xdef	_CLK_SlowActiveHaltWakeUpCmd
3264                     	xdef	_CLK_FastHaltWakeUpCmd
3265                     	xdef	_CLK_ClockSwitchCmd
3266                     	xdef	_CLK_CCOCmd
3267                     	xdef	_CLK_LSICmd
3268                     	xdef	_CLK_HSICmd
3269                     	xdef	_CLK_HSECmd
3270                     	xdef	_CLK_DeInit
3271                     	xref	_assert_failed
3272                     	switch	.const
3273  000c               L75:
3274  000c 2e2e5c2e2e5c  	dc.b	"..\..\..\libraries"
3275  001e 5c73746d3873  	dc.b	"\stm8s_stdperiph_d"
3276  0030 72697665725c  	dc.b	"river\src\stm8s_cl"
3277  0042 6b2e6300      	dc.b	"k.c",0
3278                     	xref.b	c_lreg
3298                     	xref	c_ludv
3299                     	xref	c_rtol
3300                     	xref	c_ltor
3301                     	end
