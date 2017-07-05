   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
  32                     ; 50 uint8_t ITC_GetCPUCC(void)
  32                     ; 51 {
  34                     .text:	section	.text,new
  35  0000               _ITC_GetCPUCC:
  39                     ; 53   _asm("push cc");
  42  0000 8a            push cc
  44                     ; 54   _asm("pop a");
  47  0001 84            pop a
  49                     ; 55   return; /* Ignore compiler warning, the returned value is in A register */
  52  0002 81            	ret
  75                     ; 80 void ITC_DeInit(void)
  75                     ; 81 {
  76                     .text:	section	.text,new
  77  0000               _ITC_DeInit:
  81                     ; 82   ITC->ISPR1 = ITC_SPRX_RESET_VALUE;
  83  0000 35ff7f70      	mov	32624,#255
  84                     ; 83   ITC->ISPR2 = ITC_SPRX_RESET_VALUE;
  86  0004 35ff7f71      	mov	32625,#255
  87                     ; 84   ITC->ISPR3 = ITC_SPRX_RESET_VALUE;
  89  0008 35ff7f72      	mov	32626,#255
  90                     ; 85   ITC->ISPR4 = ITC_SPRX_RESET_VALUE;
  92  000c 35ff7f73      	mov	32627,#255
  93                     ; 86   ITC->ISPR5 = ITC_SPRX_RESET_VALUE;
  95  0010 35ff7f74      	mov	32628,#255
  96                     ; 87   ITC->ISPR6 = ITC_SPRX_RESET_VALUE;
  98  0014 35ff7f75      	mov	32629,#255
  99                     ; 88   ITC->ISPR7 = ITC_SPRX_RESET_VALUE;
 101  0018 35ff7f76      	mov	32630,#255
 102                     ; 89   ITC->ISPR8 = ITC_SPRX_RESET_VALUE;
 104  001c 35ff7f77      	mov	32631,#255
 105                     ; 90 }
 108  0020 81            	ret
 133                     ; 97 uint8_t ITC_GetSoftIntStatus(void)
 133                     ; 98 {
 134                     .text:	section	.text,new
 135  0000               _ITC_GetSoftIntStatus:
 139                     ; 99   return (uint8_t)(ITC_GetCPUCC() & CPU_CC_I1I0);
 141  0000 cd0000        	call	_ITC_GetCPUCC
 143  0003 a428          	and	a,#40
 146  0005 81            	ret
 396                     .const:	section	.text
 397  0000               L62:
 398  0000 0041          	dc.w	L14
 399  0002 0041          	dc.w	L14
 400  0004 0041          	dc.w	L14
 401  0006 0041          	dc.w	L14
 402  0008 004a          	dc.w	L34
 403  000a 004a          	dc.w	L34
 404  000c 004a          	dc.w	L34
 405  000e 004a          	dc.w	L34
 406  0010 007e          	dc.w	L502
 407  0012 007e          	dc.w	L502
 408  0014 0053          	dc.w	L54
 409  0016 0053          	dc.w	L54
 410  0018 005c          	dc.w	L74
 411  001a 005c          	dc.w	L74
 412  001c 005c          	dc.w	L74
 413  001e 005c          	dc.w	L74
 414  0020 0065          	dc.w	L15
 415  0022 0065          	dc.w	L15
 416  0024 0065          	dc.w	L15
 417  0026 0065          	dc.w	L15
 418  0028 007e          	dc.w	L502
 419  002a 007e          	dc.w	L502
 420  002c 006e          	dc.w	L35
 421  002e 006e          	dc.w	L35
 422  0030 0077          	dc.w	L55
 423                     ; 107 ITC_PriorityLevel_TypeDef ITC_GetSoftwarePriority(ITC_Irq_TypeDef IrqNum)
 423                     ; 108 {
 424                     .text:	section	.text,new
 425  0000               _ITC_GetSoftwarePriority:
 427  0000 88            	push	a
 428  0001 89            	pushw	x
 429       00000002      OFST:	set	2
 432                     ; 109   uint8_t Value = 0;
 434  0002 0f02          	clr	(OFST+0,sp)
 435                     ; 110   uint8_t Mask = 0;
 437  0004 7b01          	ld	a,(OFST-1,sp)
 438  0006 97            	ld	xl,a
 439                     ; 113   assert_param(IS_ITC_IRQ_OK((uint8_t)IrqNum));
 441  0007 7b03          	ld	a,(OFST+1,sp)
 442  0009 a119          	cp	a,#25
 443  000b 2403          	jruge	L41
 444  000d 4f            	clr	a
 445  000e 2010          	jra	L61
 446  0010               L41:
 447  0010 ae0071        	ldw	x,#113
 448  0013 89            	pushw	x
 449  0014 ae0000        	ldw	x,#0
 450  0017 89            	pushw	x
 451  0018 ae0064        	ldw	x,#L102
 452  001b cd0000        	call	_assert_failed
 454  001e 5b04          	addw	sp,#4
 455  0020               L61:
 456                     ; 116   Mask = (uint8_t)(0x03U << (((uint8_t)IrqNum % 4U) * 2U));
 458  0020 7b03          	ld	a,(OFST+1,sp)
 459  0022 a403          	and	a,#3
 460  0024 48            	sll	a
 461  0025 5f            	clrw	x
 462  0026 97            	ld	xl,a
 463  0027 a603          	ld	a,#3
 464  0029 5d            	tnzw	x
 465  002a 2704          	jreq	L02
 466  002c               L22:
 467  002c 48            	sll	a
 468  002d 5a            	decw	x
 469  002e 26fc          	jrne	L22
 470  0030               L02:
 471  0030 6b01          	ld	(OFST-1,sp),a
 472                     ; 118   switch (IrqNum)
 474  0032 7b03          	ld	a,(OFST+1,sp)
 476                     ; 198   default:
 476                     ; 199     break;
 477  0034 a119          	cp	a,#25
 478  0036 2407          	jruge	L42
 479  0038 5f            	clrw	x
 480  0039 97            	ld	xl,a
 481  003a 58            	sllw	x
 482  003b de0000        	ldw	x,(L62,x)
 483  003e fc            	jp	(x)
 484  003f               L42:
 485  003f 203d          	jra	L502
 486  0041               L14:
 487                     ; 120   case ITC_IRQ_TLI: /* TLI software priority can be read but has no meaning */
 487                     ; 121   case ITC_IRQ_AWU:
 487                     ; 122   case ITC_IRQ_CLK:
 487                     ; 123   case ITC_IRQ_PORTA:
 487                     ; 124     Value = (uint8_t)(ITC->ISPR1 & Mask); /* Read software priority */
 489  0041 c67f70        	ld	a,32624
 490  0044 1401          	and	a,(OFST-1,sp)
 491  0046 6b02          	ld	(OFST+0,sp),a
 492                     ; 125     break;
 494  0048 2034          	jra	L502
 495  004a               L34:
 496                     ; 127   case ITC_IRQ_PORTB:
 496                     ; 128   case ITC_IRQ_PORTC:
 496                     ; 129   case ITC_IRQ_PORTD:
 496                     ; 130   case ITC_IRQ_PORTE:
 496                     ; 131     Value = (uint8_t)(ITC->ISPR2 & Mask); /* Read software priority */
 498  004a c67f71        	ld	a,32625
 499  004d 1401          	and	a,(OFST-1,sp)
 500  004f 6b02          	ld	(OFST+0,sp),a
 501                     ; 132     break;
 503  0051 202b          	jra	L502
 504  0053               L54:
 505                     ; 141   case ITC_IRQ_SPI:
 505                     ; 142   case ITC_IRQ_TIM1_OVF:
 505                     ; 143     Value = (uint8_t)(ITC->ISPR3 & Mask); /* Read software priority */
 507  0053 c67f72        	ld	a,32626
 508  0056 1401          	and	a,(OFST-1,sp)
 509  0058 6b02          	ld	(OFST+0,sp),a
 510                     ; 144     break;
 512  005a 2022          	jra	L502
 513  005c               L74:
 514                     ; 146   case ITC_IRQ_TIM1_CAPCOM:
 514                     ; 147 #if defined (STM8S903) || defined (STM8AF622x)
 514                     ; 148   case ITC_IRQ_TIM5_OVFTRI:
 514                     ; 149   case ITC_IRQ_TIM5_CAPCOM:
 514                     ; 150 #else
 514                     ; 151   case ITC_IRQ_TIM2_OVF:
 514                     ; 152   case ITC_IRQ_TIM2_CAPCOM:
 514                     ; 153 #endif /* STM8S903 or STM8AF622x*/
 514                     ; 154   case ITC_IRQ_TIM3_OVF:
 514                     ; 155     Value = (uint8_t)(ITC->ISPR4 & Mask); /* Read software priority */
 516  005c c67f73        	ld	a,32627
 517  005f 1401          	and	a,(OFST-1,sp)
 518  0061 6b02          	ld	(OFST+0,sp),a
 519                     ; 156     break;
 521  0063 2019          	jra	L502
 522  0065               L15:
 523                     ; 158   case ITC_IRQ_TIM3_CAPCOM:
 523                     ; 159 #if defined(STM8S208) ||defined(STM8S207) || defined (STM8S007) || defined(STM8S103) || \
 523                     ; 160     defined(STM8S003) ||defined(STM8S903) || defined (STM8AF52Ax) || defined (STM8AF62Ax)
 523                     ; 161   case ITC_IRQ_UART1_TX:
 523                     ; 162   case ITC_IRQ_UART1_RX:
 523                     ; 163 #endif /*STM8S208 or STM8S207 or STM8S007 or STM8S103 or STM8S003 or STM8S903 or STM8AF52Ax or STM8AF62Ax */ 
 523                     ; 164 #if defined(STM8AF622x)
 523                     ; 165   case ITC_IRQ_UART4_TX:
 523                     ; 166   case ITC_IRQ_UART4_RX:
 523                     ; 167 #endif /*STM8AF622x */
 523                     ; 168   case ITC_IRQ_I2C:
 523                     ; 169     Value = (uint8_t)(ITC->ISPR5 & Mask); /* Read software priority */
 525  0065 c67f74        	ld	a,32628
 526  0068 1401          	and	a,(OFST-1,sp)
 527  006a 6b02          	ld	(OFST+0,sp),a
 528                     ; 170     break;
 530  006c 2010          	jra	L502
 531  006e               L35:
 532                     ; 184   case ITC_IRQ_ADC1:
 532                     ; 185 #endif /*STM8S105, STM8S005, STM8S103 or STM8S003 or STM8S903 or STM8AF626x or STM8AF622x */
 532                     ; 186 #if defined (STM8S903) || defined (STM8AF622x)
 532                     ; 187   case ITC_IRQ_TIM6_OVFTRI:
 532                     ; 188 #else
 532                     ; 189   case ITC_IRQ_TIM4_OVF:
 532                     ; 190 #endif /*STM8S903 or STM8AF622x */
 532                     ; 191     Value = (uint8_t)(ITC->ISPR6 & Mask); /* Read software priority */
 534  006e c67f75        	ld	a,32629
 535  0071 1401          	and	a,(OFST-1,sp)
 536  0073 6b02          	ld	(OFST+0,sp),a
 537                     ; 192     break;
 539  0075 2007          	jra	L502
 540  0077               L55:
 541                     ; 194   case ITC_IRQ_EEPROM_EEC:
 541                     ; 195     Value = (uint8_t)(ITC->ISPR7 & Mask); /* Read software priority */
 543  0077 c67f76        	ld	a,32630
 544  007a 1401          	and	a,(OFST-1,sp)
 545  007c 6b02          	ld	(OFST+0,sp),a
 546                     ; 196     break;
 548  007e               L75:
 549                     ; 198   default:
 549                     ; 199     break;
 551  007e               L502:
 552                     ; 202   Value >>= (uint8_t)(((uint8_t)IrqNum % 4u) * 2u);
 554  007e 7b03          	ld	a,(OFST+1,sp)
 555  0080 a403          	and	a,#3
 556  0082 48            	sll	a
 557  0083 5f            	clrw	x
 558  0084 97            	ld	xl,a
 559  0085 7b02          	ld	a,(OFST+0,sp)
 560  0087 5d            	tnzw	x
 561  0088 2704          	jreq	L03
 562  008a               L23:
 563  008a 44            	srl	a
 564  008b 5a            	decw	x
 565  008c 26fc          	jrne	L23
 566  008e               L03:
 567  008e 6b02          	ld	(OFST+0,sp),a
 568                     ; 204   return((ITC_PriorityLevel_TypeDef)Value);
 570  0090 7b02          	ld	a,(OFST+0,sp)
 573  0092 5b03          	addw	sp,#3
 574  0094 81            	ret
 640                     	switch	.const
 641  0032               L66:
 642  0032 0098          	dc.w	L702
 643  0034 0098          	dc.w	L702
 644  0036 0098          	dc.w	L702
 645  0038 0098          	dc.w	L702
 646  003a 00aa          	dc.w	L112
 647  003c 00aa          	dc.w	L112
 648  003e 00aa          	dc.w	L112
 649  0040 00aa          	dc.w	L112
 650  0042 0114          	dc.w	L362
 651  0044 0114          	dc.w	L362
 652  0046 00bc          	dc.w	L312
 653  0048 00bc          	dc.w	L312
 654  004a 00ce          	dc.w	L512
 655  004c 00ce          	dc.w	L512
 656  004e 00ce          	dc.w	L512
 657  0050 00ce          	dc.w	L512
 658  0052 00e0          	dc.w	L712
 659  0054 00e0          	dc.w	L712
 660  0056 00e0          	dc.w	L712
 661  0058 00e0          	dc.w	L712
 662  005a 0114          	dc.w	L362
 663  005c 0114          	dc.w	L362
 664  005e 00f2          	dc.w	L122
 665  0060 00f2          	dc.w	L122
 666  0062 0104          	dc.w	L322
 667                     ; 220 void ITC_SetSoftwarePriority(ITC_Irq_TypeDef IrqNum, ITC_PriorityLevel_TypeDef PriorityValue)
 667                     ; 221 {
 668                     .text:	section	.text,new
 669  0000               _ITC_SetSoftwarePriority:
 671  0000 89            	pushw	x
 672  0001 89            	pushw	x
 673       00000002      OFST:	set	2
 676                     ; 222   uint8_t Mask = 0;
 678  0002 7b01          	ld	a,(OFST-1,sp)
 679  0004 97            	ld	xl,a
 680                     ; 223   uint8_t NewPriority = 0;
 682  0005 7b02          	ld	a,(OFST+0,sp)
 683  0007 97            	ld	xl,a
 684                     ; 226   assert_param(IS_ITC_IRQ_OK((uint8_t)IrqNum));
 686  0008 7b03          	ld	a,(OFST+1,sp)
 687  000a a119          	cp	a,#25
 688  000c 2403          	jruge	L63
 689  000e 4f            	clr	a
 690  000f 2010          	jra	L04
 691  0011               L63:
 692  0011 ae00e2        	ldw	x,#226
 693  0014 89            	pushw	x
 694  0015 ae0000        	ldw	x,#0
 695  0018 89            	pushw	x
 696  0019 ae0064        	ldw	x,#L102
 697  001c cd0000        	call	_assert_failed
 699  001f 5b04          	addw	sp,#4
 700  0021               L04:
 701                     ; 227   assert_param(IS_ITC_PRIORITY_OK(PriorityValue));
 703  0021 7b04          	ld	a,(OFST+2,sp)
 704  0023 a102          	cp	a,#2
 705  0025 2710          	jreq	L44
 706  0027 7b04          	ld	a,(OFST+2,sp)
 707  0029 a101          	cp	a,#1
 708  002b 270a          	jreq	L44
 709  002d 0d04          	tnz	(OFST+2,sp)
 710  002f 2706          	jreq	L44
 711  0031 7b04          	ld	a,(OFST+2,sp)
 712  0033 a103          	cp	a,#3
 713  0035 2603          	jrne	L24
 714  0037               L44:
 715  0037 4f            	clr	a
 716  0038 2010          	jra	L64
 717  003a               L24:
 718  003a ae00e3        	ldw	x,#227
 719  003d 89            	pushw	x
 720  003e ae0000        	ldw	x,#0
 721  0041 89            	pushw	x
 722  0042 ae0064        	ldw	x,#L102
 723  0045 cd0000        	call	_assert_failed
 725  0048 5b04          	addw	sp,#4
 726  004a               L64:
 727                     ; 230   assert_param(IS_ITC_INTERRUPTS_DISABLED);
 729  004a cd0000        	call	_ITC_GetSoftIntStatus
 731  004d a128          	cp	a,#40
 732  004f 2603          	jrne	L05
 733  0051 4f            	clr	a
 734  0052 2010          	jra	L25
 735  0054               L05:
 736  0054 ae00e6        	ldw	x,#230
 737  0057 89            	pushw	x
 738  0058 ae0000        	ldw	x,#0
 739  005b 89            	pushw	x
 740  005c ae0064        	ldw	x,#L102
 741  005f cd0000        	call	_assert_failed
 743  0062 5b04          	addw	sp,#4
 744  0064               L25:
 745                     ; 234   Mask = (uint8_t)(~(uint8_t)(0x03U << (((uint8_t)IrqNum % 4U) * 2U)));
 747  0064 7b03          	ld	a,(OFST+1,sp)
 748  0066 a403          	and	a,#3
 749  0068 48            	sll	a
 750  0069 5f            	clrw	x
 751  006a 97            	ld	xl,a
 752  006b a603          	ld	a,#3
 753  006d 5d            	tnzw	x
 754  006e 2704          	jreq	L45
 755  0070               L65:
 756  0070 48            	sll	a
 757  0071 5a            	decw	x
 758  0072 26fc          	jrne	L65
 759  0074               L45:
 760  0074 43            	cpl	a
 761  0075 6b01          	ld	(OFST-1,sp),a
 762                     ; 237   NewPriority = (uint8_t)((uint8_t)(PriorityValue) << (((uint8_t)IrqNum % 4U) * 2U));
 764  0077 7b03          	ld	a,(OFST+1,sp)
 765  0079 a403          	and	a,#3
 766  007b 48            	sll	a
 767  007c 5f            	clrw	x
 768  007d 97            	ld	xl,a
 769  007e 7b04          	ld	a,(OFST+2,sp)
 770  0080 5d            	tnzw	x
 771  0081 2704          	jreq	L06
 772  0083               L26:
 773  0083 48            	sll	a
 774  0084 5a            	decw	x
 775  0085 26fc          	jrne	L26
 776  0087               L06:
 777  0087 6b02          	ld	(OFST+0,sp),a
 778                     ; 239   switch (IrqNum)
 780  0089 7b03          	ld	a,(OFST+1,sp)
 782                     ; 329   default:
 782                     ; 330     break;
 783  008b a119          	cp	a,#25
 784  008d 2407          	jruge	L46
 785  008f 5f            	clrw	x
 786  0090 97            	ld	xl,a
 787  0091 58            	sllw	x
 788  0092 de0032        	ldw	x,(L66,x)
 789  0095 fc            	jp	(x)
 790  0096               L46:
 791  0096 207c          	jra	L362
 792  0098               L702:
 793                     ; 241   case ITC_IRQ_TLI: /* TLI software priority can be written but has no meaning */
 793                     ; 242   case ITC_IRQ_AWU:
 793                     ; 243   case ITC_IRQ_CLK:
 793                     ; 244   case ITC_IRQ_PORTA:
 793                     ; 245     ITC->ISPR1 &= Mask;
 795  0098 c67f70        	ld	a,32624
 796  009b 1401          	and	a,(OFST-1,sp)
 797  009d c77f70        	ld	32624,a
 798                     ; 246     ITC->ISPR1 |= NewPriority;
 800  00a0 c67f70        	ld	a,32624
 801  00a3 1a02          	or	a,(OFST+0,sp)
 802  00a5 c77f70        	ld	32624,a
 803                     ; 247     break;
 805  00a8 206a          	jra	L362
 806  00aa               L112:
 807                     ; 249   case ITC_IRQ_PORTB:
 807                     ; 250   case ITC_IRQ_PORTC:
 807                     ; 251   case ITC_IRQ_PORTD:
 807                     ; 252   case ITC_IRQ_PORTE:
 807                     ; 253     ITC->ISPR2 &= Mask;
 809  00aa c67f71        	ld	a,32625
 810  00ad 1401          	and	a,(OFST-1,sp)
 811  00af c77f71        	ld	32625,a
 812                     ; 254     ITC->ISPR2 |= NewPriority;
 814  00b2 c67f71        	ld	a,32625
 815  00b5 1a02          	or	a,(OFST+0,sp)
 816  00b7 c77f71        	ld	32625,a
 817                     ; 255     break;
 819  00ba 2058          	jra	L362
 820  00bc               L312:
 821                     ; 264   case ITC_IRQ_SPI:
 821                     ; 265   case ITC_IRQ_TIM1_OVF:
 821                     ; 266     ITC->ISPR3 &= Mask;
 823  00bc c67f72        	ld	a,32626
 824  00bf 1401          	and	a,(OFST-1,sp)
 825  00c1 c77f72        	ld	32626,a
 826                     ; 267     ITC->ISPR3 |= NewPriority;
 828  00c4 c67f72        	ld	a,32626
 829  00c7 1a02          	or	a,(OFST+0,sp)
 830  00c9 c77f72        	ld	32626,a
 831                     ; 268     break;
 833  00cc 2046          	jra	L362
 834  00ce               L512:
 835                     ; 270   case ITC_IRQ_TIM1_CAPCOM:
 835                     ; 271 #if defined(STM8S903) || defined(STM8AF622x) 
 835                     ; 272   case ITC_IRQ_TIM5_OVFTRI:
 835                     ; 273   case ITC_IRQ_TIM5_CAPCOM:
 835                     ; 274 #else
 835                     ; 275   case ITC_IRQ_TIM2_OVF:
 835                     ; 276   case ITC_IRQ_TIM2_CAPCOM:
 835                     ; 277 #endif /*STM8S903 or STM8AF622x */
 835                     ; 278   case ITC_IRQ_TIM3_OVF:
 835                     ; 279     ITC->ISPR4 &= Mask;
 837  00ce c67f73        	ld	a,32627
 838  00d1 1401          	and	a,(OFST-1,sp)
 839  00d3 c77f73        	ld	32627,a
 840                     ; 280     ITC->ISPR4 |= NewPriority;
 842  00d6 c67f73        	ld	a,32627
 843  00d9 1a02          	or	a,(OFST+0,sp)
 844  00db c77f73        	ld	32627,a
 845                     ; 281     break;
 847  00de 2034          	jra	L362
 848  00e0               L712:
 849                     ; 283   case ITC_IRQ_TIM3_CAPCOM:
 849                     ; 284 #if defined(STM8S208) ||defined(STM8S207) || defined (STM8S007) || defined(STM8S103) || \
 849                     ; 285     defined(STM8S003) ||defined(STM8S903) || defined (STM8AF52Ax) || defined (STM8AF62Ax)
 849                     ; 286   case ITC_IRQ_UART1_TX:
 849                     ; 287   case ITC_IRQ_UART1_RX:
 849                     ; 288 #endif /*STM8S208 or STM8S207 or STM8S007 or STM8S103 or STM8S003 or STM8S903 or STM8AF52Ax or STM8AF62Ax */ 
 849                     ; 289 #if defined(STM8AF622x)
 849                     ; 290   case ITC_IRQ_UART4_TX:
 849                     ; 291   case ITC_IRQ_UART4_RX:
 849                     ; 292 #endif /*STM8AF622x */
 849                     ; 293   case ITC_IRQ_I2C:
 849                     ; 294     ITC->ISPR5 &= Mask;
 851  00e0 c67f74        	ld	a,32628
 852  00e3 1401          	and	a,(OFST-1,sp)
 853  00e5 c77f74        	ld	32628,a
 854                     ; 295     ITC->ISPR5 |= NewPriority;
 856  00e8 c67f74        	ld	a,32628
 857  00eb 1a02          	or	a,(OFST+0,sp)
 858  00ed c77f74        	ld	32628,a
 859                     ; 296     break;
 861  00f0 2022          	jra	L362
 862  00f2               L122:
 863                     ; 312   case ITC_IRQ_ADC1:
 863                     ; 313 #endif /*STM8S105, STM8S005, STM8S103 or STM8S003 or STM8S903 or STM8AF626x or STM8AF622x */
 863                     ; 314     
 863                     ; 315 #if defined (STM8S903) || defined (STM8AF622x)
 863                     ; 316   case ITC_IRQ_TIM6_OVFTRI:
 863                     ; 317 #else
 863                     ; 318   case ITC_IRQ_TIM4_OVF:
 863                     ; 319 #endif /* STM8S903 or STM8AF622x */
 863                     ; 320     ITC->ISPR6 &= Mask;
 865  00f2 c67f75        	ld	a,32629
 866  00f5 1401          	and	a,(OFST-1,sp)
 867  00f7 c77f75        	ld	32629,a
 868                     ; 321     ITC->ISPR6 |= NewPriority;
 870  00fa c67f75        	ld	a,32629
 871  00fd 1a02          	or	a,(OFST+0,sp)
 872  00ff c77f75        	ld	32629,a
 873                     ; 322     break;
 875  0102 2010          	jra	L362
 876  0104               L322:
 877                     ; 324   case ITC_IRQ_EEPROM_EEC:
 877                     ; 325     ITC->ISPR7 &= Mask;
 879  0104 c67f76        	ld	a,32630
 880  0107 1401          	and	a,(OFST-1,sp)
 881  0109 c77f76        	ld	32630,a
 882                     ; 326     ITC->ISPR7 |= NewPriority;
 884  010c c67f76        	ld	a,32630
 885  010f 1a02          	or	a,(OFST+0,sp)
 886  0111 c77f76        	ld	32630,a
 887                     ; 327     break;
 889  0114               L522:
 890                     ; 329   default:
 890                     ; 330     break;
 892  0114               L362:
 893                     ; 332 }
 896  0114 5b04          	addw	sp,#4
 897  0116 81            	ret
 910                     	xdef	_ITC_GetSoftwarePriority
 911                     	xdef	_ITC_SetSoftwarePriority
 912                     	xdef	_ITC_GetSoftIntStatus
 913                     	xdef	_ITC_DeInit
 914                     	xdef	_ITC_GetCPUCC
 915                     	xref	_assert_failed
 916                     	switch	.const
 917  0064               L102:
 918  0064 2e2e5c2e2e5c  	dc.b	"..\..\..\libraries"
 919  0076 5c73746d3873  	dc.b	"\stm8s_stdperiph_d"
 920  0088 72697665725c  	dc.b	"river\src\stm8s_it"
 921  009a 632e6300      	dc.b	"c.c",0
 941                     	end
