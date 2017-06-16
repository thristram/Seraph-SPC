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
 381                     .const:	section	.text
 382  0000               L21:
 383  0000 00098969      	dc.l	625001
 384  0004               L25:
 385  0004 00000064      	dc.l	100
 386                     ; 90 void UART1_Init(uint32_t BaudRate, UART1_WordLength_TypeDef WordLength, 
 386                     ; 91                 UART1_StopBits_TypeDef StopBits, UART1_Parity_TypeDef Parity, 
 386                     ; 92                 UART1_SyncMode_TypeDef SyncMode, UART1_Mode_TypeDef Mode)
 386                     ; 93 {
 387                     .text:	section	.text,new
 388  0000               _UART1_Init:
 390  0000 520c          	subw	sp,#12
 391       0000000c      OFST:	set	12
 394                     ; 94   uint32_t BaudRate_Mantissa = 0, BaudRate_Mantissa100 = 0;
 396  0002 96            	ldw	x,sp
 397  0003 1c0009        	addw	x,#OFST-3
 398  0006 cd0000        	call	c_ltor
 402  0009 96            	ldw	x,sp
 403  000a 1c0005        	addw	x,#OFST-7
 404  000d cd0000        	call	c_ltor
 406                     ; 97   assert_param(IS_UART1_BAUDRATE_OK(BaudRate));
 408  0010 96            	ldw	x,sp
 409  0011 1c000f        	addw	x,#OFST+3
 410  0014 cd0000        	call	c_ltor
 412  0017 ae0000        	ldw	x,#L21
 413  001a cd0000        	call	c_lcmp
 415  001d 2403          	jruge	L01
 416  001f 4f            	clr	a
 417  0020 2010          	jra	L41
 418  0022               L01:
 419  0022 ae0061        	ldw	x,#97
 420  0025 89            	pushw	x
 421  0026 ae0000        	ldw	x,#0
 422  0029 89            	pushw	x
 423  002a ae0008        	ldw	x,#L371
 424  002d cd0000        	call	_assert_failed
 426  0030 5b04          	addw	sp,#4
 427  0032               L41:
 428                     ; 98   assert_param(IS_UART1_WORDLENGTH_OK(WordLength));
 430  0032 0d13          	tnz	(OFST+7,sp)
 431  0034 2706          	jreq	L02
 432  0036 7b13          	ld	a,(OFST+7,sp)
 433  0038 a110          	cp	a,#16
 434  003a 2603          	jrne	L61
 435  003c               L02:
 436  003c 4f            	clr	a
 437  003d 2010          	jra	L22
 438  003f               L61:
 439  003f ae0062        	ldw	x,#98
 440  0042 89            	pushw	x
 441  0043 ae0000        	ldw	x,#0
 442  0046 89            	pushw	x
 443  0047 ae0008        	ldw	x,#L371
 444  004a cd0000        	call	_assert_failed
 446  004d 5b04          	addw	sp,#4
 447  004f               L22:
 448                     ; 99   assert_param(IS_UART1_STOPBITS_OK(StopBits));
 450  004f 0d14          	tnz	(OFST+8,sp)
 451  0051 2712          	jreq	L62
 452  0053 7b14          	ld	a,(OFST+8,sp)
 453  0055 a110          	cp	a,#16
 454  0057 270c          	jreq	L62
 455  0059 7b14          	ld	a,(OFST+8,sp)
 456  005b a120          	cp	a,#32
 457  005d 2706          	jreq	L62
 458  005f 7b14          	ld	a,(OFST+8,sp)
 459  0061 a130          	cp	a,#48
 460  0063 2603          	jrne	L42
 461  0065               L62:
 462  0065 4f            	clr	a
 463  0066 2010          	jra	L03
 464  0068               L42:
 465  0068 ae0063        	ldw	x,#99
 466  006b 89            	pushw	x
 467  006c ae0000        	ldw	x,#0
 468  006f 89            	pushw	x
 469  0070 ae0008        	ldw	x,#L371
 470  0073 cd0000        	call	_assert_failed
 472  0076 5b04          	addw	sp,#4
 473  0078               L03:
 474                     ; 100   assert_param(IS_UART1_PARITY_OK(Parity));
 476  0078 0d15          	tnz	(OFST+9,sp)
 477  007a 270c          	jreq	L43
 478  007c 7b15          	ld	a,(OFST+9,sp)
 479  007e a104          	cp	a,#4
 480  0080 2706          	jreq	L43
 481  0082 7b15          	ld	a,(OFST+9,sp)
 482  0084 a106          	cp	a,#6
 483  0086 2603          	jrne	L23
 484  0088               L43:
 485  0088 4f            	clr	a
 486  0089 2010          	jra	L63
 487  008b               L23:
 488  008b ae0064        	ldw	x,#100
 489  008e 89            	pushw	x
 490  008f ae0000        	ldw	x,#0
 491  0092 89            	pushw	x
 492  0093 ae0008        	ldw	x,#L371
 493  0096 cd0000        	call	_assert_failed
 495  0099 5b04          	addw	sp,#4
 496  009b               L63:
 497                     ; 101   assert_param(IS_UART1_MODE_OK((uint8_t)Mode));
 499  009b 7b17          	ld	a,(OFST+11,sp)
 500  009d a108          	cp	a,#8
 501  009f 2730          	jreq	L24
 502  00a1 7b17          	ld	a,(OFST+11,sp)
 503  00a3 a140          	cp	a,#64
 504  00a5 272a          	jreq	L24
 505  00a7 7b17          	ld	a,(OFST+11,sp)
 506  00a9 a104          	cp	a,#4
 507  00ab 2724          	jreq	L24
 508  00ad 7b17          	ld	a,(OFST+11,sp)
 509  00af a180          	cp	a,#128
 510  00b1 271e          	jreq	L24
 511  00b3 7b17          	ld	a,(OFST+11,sp)
 512  00b5 a10c          	cp	a,#12
 513  00b7 2718          	jreq	L24
 514  00b9 7b17          	ld	a,(OFST+11,sp)
 515  00bb a10c          	cp	a,#12
 516  00bd 2712          	jreq	L24
 517  00bf 7b17          	ld	a,(OFST+11,sp)
 518  00c1 a144          	cp	a,#68
 519  00c3 270c          	jreq	L24
 520  00c5 7b17          	ld	a,(OFST+11,sp)
 521  00c7 a1c0          	cp	a,#192
 522  00c9 2706          	jreq	L24
 523  00cb 7b17          	ld	a,(OFST+11,sp)
 524  00cd a188          	cp	a,#136
 525  00cf 2603          	jrne	L04
 526  00d1               L24:
 527  00d1 4f            	clr	a
 528  00d2 2010          	jra	L44
 529  00d4               L04:
 530  00d4 ae0065        	ldw	x,#101
 531  00d7 89            	pushw	x
 532  00d8 ae0000        	ldw	x,#0
 533  00db 89            	pushw	x
 534  00dc ae0008        	ldw	x,#L371
 535  00df cd0000        	call	_assert_failed
 537  00e2 5b04          	addw	sp,#4
 538  00e4               L44:
 539                     ; 102   assert_param(IS_UART1_SYNCMODE_OK((uint8_t)SyncMode));
 541  00e4 7b16          	ld	a,(OFST+10,sp)
 542  00e6 a488          	and	a,#136
 543  00e8 a188          	cp	a,#136
 544  00ea 271b          	jreq	L64
 545  00ec 7b16          	ld	a,(OFST+10,sp)
 546  00ee a444          	and	a,#68
 547  00f0 a144          	cp	a,#68
 548  00f2 2713          	jreq	L64
 549  00f4 7b16          	ld	a,(OFST+10,sp)
 550  00f6 a422          	and	a,#34
 551  00f8 a122          	cp	a,#34
 552  00fa 270b          	jreq	L64
 553  00fc 7b16          	ld	a,(OFST+10,sp)
 554  00fe a411          	and	a,#17
 555  0100 a111          	cp	a,#17
 556  0102 2703          	jreq	L64
 557  0104 4f            	clr	a
 558  0105 2010          	jra	L05
 559  0107               L64:
 560  0107 ae0066        	ldw	x,#102
 561  010a 89            	pushw	x
 562  010b ae0000        	ldw	x,#0
 563  010e 89            	pushw	x
 564  010f ae0008        	ldw	x,#L371
 565  0112 cd0000        	call	_assert_failed
 567  0115 5b04          	addw	sp,#4
 568  0117               L05:
 569                     ; 105   UART1->CR1 &= (uint8_t)(~UART1_CR1_M);  
 571  0117 72195234      	bres	21044,#4
 572                     ; 108   UART1->CR1 |= (uint8_t)WordLength;
 574  011b c65234        	ld	a,21044
 575  011e 1a13          	or	a,(OFST+7,sp)
 576  0120 c75234        	ld	21044,a
 577                     ; 111   UART1->CR3 &= (uint8_t)(~UART1_CR3_STOP);  
 579  0123 c65236        	ld	a,21046
 580  0126 a4cf          	and	a,#207
 581  0128 c75236        	ld	21046,a
 582                     ; 113   UART1->CR3 |= (uint8_t)StopBits;  
 584  012b c65236        	ld	a,21046
 585  012e 1a14          	or	a,(OFST+8,sp)
 586  0130 c75236        	ld	21046,a
 587                     ; 116   UART1->CR1 &= (uint8_t)(~(UART1_CR1_PCEN | UART1_CR1_PS  ));  
 589  0133 c65234        	ld	a,21044
 590  0136 a4f9          	and	a,#249
 591  0138 c75234        	ld	21044,a
 592                     ; 118   UART1->CR1 |= (uint8_t)Parity;  
 594  013b c65234        	ld	a,21044
 595  013e 1a15          	or	a,(OFST+9,sp)
 596  0140 c75234        	ld	21044,a
 597                     ; 121   UART1->BRR1 &= (uint8_t)(~UART1_BRR1_DIVM);  
 599  0143 725f5232      	clr	21042
 600                     ; 123   UART1->BRR2 &= (uint8_t)(~UART1_BRR2_DIVM);  
 602  0147 c65233        	ld	a,21043
 603  014a a40f          	and	a,#15
 604  014c c75233        	ld	21043,a
 605                     ; 125   UART1->BRR2 &= (uint8_t)(~UART1_BRR2_DIVF);  
 607  014f c65233        	ld	a,21043
 608  0152 a4f0          	and	a,#240
 609  0154 c75233        	ld	21043,a
 610                     ; 128   BaudRate_Mantissa    = ((uint32_t)CLK_GetClockFreq() / (BaudRate << 4));
 612  0157 96            	ldw	x,sp
 613  0158 1c000f        	addw	x,#OFST+3
 614  015b cd0000        	call	c_ltor
 616  015e a604          	ld	a,#4
 617  0160 cd0000        	call	c_llsh
 619  0163 96            	ldw	x,sp
 620  0164 1c0001        	addw	x,#OFST-11
 621  0167 cd0000        	call	c_rtol
 623  016a cd0000        	call	_CLK_GetClockFreq
 625  016d 96            	ldw	x,sp
 626  016e 1c0001        	addw	x,#OFST-11
 627  0171 cd0000        	call	c_ludv
 629  0174 96            	ldw	x,sp
 630  0175 1c0009        	addw	x,#OFST-3
 631  0178 cd0000        	call	c_rtol
 633                     ; 129   BaudRate_Mantissa100 = (((uint32_t)CLK_GetClockFreq() * 100) / (BaudRate << 4));
 635  017b 96            	ldw	x,sp
 636  017c 1c000f        	addw	x,#OFST+3
 637  017f cd0000        	call	c_ltor
 639  0182 a604          	ld	a,#4
 640  0184 cd0000        	call	c_llsh
 642  0187 96            	ldw	x,sp
 643  0188 1c0001        	addw	x,#OFST-11
 644  018b cd0000        	call	c_rtol
 646  018e cd0000        	call	_CLK_GetClockFreq
 648  0191 a664          	ld	a,#100
 649  0193 cd0000        	call	c_smul
 651  0196 96            	ldw	x,sp
 652  0197 1c0001        	addw	x,#OFST-11
 653  019a cd0000        	call	c_ludv
 655  019d 96            	ldw	x,sp
 656  019e 1c0005        	addw	x,#OFST-7
 657  01a1 cd0000        	call	c_rtol
 659                     ; 131   UART1->BRR2 |= (uint8_t)((uint8_t)(((BaudRate_Mantissa100 - (BaudRate_Mantissa * 100)) << 4) / 100) & (uint8_t)0x0F); 
 661  01a4 96            	ldw	x,sp
 662  01a5 1c0009        	addw	x,#OFST-3
 663  01a8 cd0000        	call	c_ltor
 665  01ab a664          	ld	a,#100
 666  01ad cd0000        	call	c_smul
 668  01b0 96            	ldw	x,sp
 669  01b1 1c0001        	addw	x,#OFST-11
 670  01b4 cd0000        	call	c_rtol
 672  01b7 96            	ldw	x,sp
 673  01b8 1c0005        	addw	x,#OFST-7
 674  01bb cd0000        	call	c_ltor
 676  01be 96            	ldw	x,sp
 677  01bf 1c0001        	addw	x,#OFST-11
 678  01c2 cd0000        	call	c_lsub
 680  01c5 a604          	ld	a,#4
 681  01c7 cd0000        	call	c_llsh
 683  01ca ae0004        	ldw	x,#L25
 684  01cd cd0000        	call	c_ludv
 686  01d0 b603          	ld	a,c_lreg+3
 687  01d2 a40f          	and	a,#15
 688  01d4 ca5233        	or	a,21043
 689  01d7 c75233        	ld	21043,a
 690                     ; 133   UART1->BRR2 |= (uint8_t)((BaudRate_Mantissa >> 4) & (uint8_t)0xF0); 
 692  01da 96            	ldw	x,sp
 693  01db 1c0009        	addw	x,#OFST-3
 694  01de cd0000        	call	c_ltor
 696  01e1 a604          	ld	a,#4
 697  01e3 cd0000        	call	c_lursh
 699  01e6 b603          	ld	a,c_lreg+3
 700  01e8 a4f0          	and	a,#240
 701  01ea b703          	ld	c_lreg+3,a
 702  01ec 3f02          	clr	c_lreg+2
 703  01ee 3f01          	clr	c_lreg+1
 704  01f0 3f00          	clr	c_lreg
 705  01f2 b603          	ld	a,c_lreg+3
 706  01f4 ca5233        	or	a,21043
 707  01f7 c75233        	ld	21043,a
 708                     ; 135   UART1->BRR1 |= (uint8_t)BaudRate_Mantissa;           
 710  01fa c65232        	ld	a,21042
 711  01fd 1a0c          	or	a,(OFST+0,sp)
 712  01ff c75232        	ld	21042,a
 713                     ; 138   UART1->CR2 &= (uint8_t)~(UART1_CR2_TEN | UART1_CR2_REN); 
 715  0202 c65235        	ld	a,21045
 716  0205 a4f3          	and	a,#243
 717  0207 c75235        	ld	21045,a
 718                     ; 140   UART1->CR3 &= (uint8_t)~(UART1_CR3_CPOL | UART1_CR3_CPHA | UART1_CR3_LBCL); 
 720  020a c65236        	ld	a,21046
 721  020d a4f8          	and	a,#248
 722  020f c75236        	ld	21046,a
 723                     ; 142   UART1->CR3 |= (uint8_t)((uint8_t)SyncMode & (uint8_t)(UART1_CR3_CPOL | 
 723                     ; 143                                                         UART1_CR3_CPHA | UART1_CR3_LBCL));  
 725  0212 7b16          	ld	a,(OFST+10,sp)
 726  0214 a407          	and	a,#7
 727  0216 ca5236        	or	a,21046
 728  0219 c75236        	ld	21046,a
 729                     ; 145   if ((uint8_t)(Mode & UART1_MODE_TX_ENABLE))
 731  021c 7b17          	ld	a,(OFST+11,sp)
 732  021e a504          	bcp	a,#4
 733  0220 2706          	jreq	L571
 734                     ; 148     UART1->CR2 |= (uint8_t)UART1_CR2_TEN;  
 736  0222 72165235      	bset	21045,#3
 738  0226 2004          	jra	L771
 739  0228               L571:
 740                     ; 153     UART1->CR2 &= (uint8_t)(~UART1_CR2_TEN);  
 742  0228 72175235      	bres	21045,#3
 743  022c               L771:
 744                     ; 155   if ((uint8_t)(Mode & UART1_MODE_RX_ENABLE))
 746  022c 7b17          	ld	a,(OFST+11,sp)
 747  022e a508          	bcp	a,#8
 748  0230 2706          	jreq	L102
 749                     ; 158     UART1->CR2 |= (uint8_t)UART1_CR2_REN;  
 751  0232 72145235      	bset	21045,#2
 753  0236 2004          	jra	L302
 754  0238               L102:
 755                     ; 163     UART1->CR2 &= (uint8_t)(~UART1_CR2_REN);  
 757  0238 72155235      	bres	21045,#2
 758  023c               L302:
 759                     ; 167   if ((uint8_t)(SyncMode & UART1_SYNCMODE_CLOCK_DISABLE))
 761  023c 7b16          	ld	a,(OFST+10,sp)
 762  023e a580          	bcp	a,#128
 763  0240 2706          	jreq	L502
 764                     ; 170     UART1->CR3 &= (uint8_t)(~UART1_CR3_CKEN); 
 766  0242 72175236      	bres	21046,#3
 768  0246 200a          	jra	L702
 769  0248               L502:
 770                     ; 174     UART1->CR3 |= (uint8_t)((uint8_t)SyncMode & UART1_CR3_CKEN);
 772  0248 7b16          	ld	a,(OFST+10,sp)
 773  024a a408          	and	a,#8
 774  024c ca5236        	or	a,21046
 775  024f c75236        	ld	21046,a
 776  0252               L702:
 777                     ; 176 }
 780  0252 5b0c          	addw	sp,#12
 781  0254 81            	ret
 836                     ; 184 void UART1_Cmd(FunctionalState NewState)
 836                     ; 185 {
 837                     .text:	section	.text,new
 838  0000               _UART1_Cmd:
 842                     ; 186   if (NewState != DISABLE)
 844  0000 4d            	tnz	a
 845  0001 2706          	jreq	L732
 846                     ; 189     UART1->CR1 &= (uint8_t)(~UART1_CR1_UARTD); 
 848  0003 721b5234      	bres	21044,#5
 850  0007 2004          	jra	L142
 851  0009               L732:
 852                     ; 194     UART1->CR1 |= UART1_CR1_UARTD;  
 854  0009 721a5234      	bset	21044,#5
 855  000d               L142:
 856                     ; 196 }
 859  000d 81            	ret
 985                     ; 211 void UART1_ITConfig(UART1_IT_TypeDef UART1_IT, FunctionalState NewState)
 985                     ; 212 {
 986                     .text:	section	.text,new
 987  0000               _UART1_ITConfig:
 989  0000 89            	pushw	x
 990  0001 89            	pushw	x
 991       00000002      OFST:	set	2
 994                     ; 213   uint8_t uartreg = 0, itpos = 0x00;
 996  0002 7b01          	ld	a,(OFST-1,sp)
 997  0004 97            	ld	xl,a
1000  0005 7b02          	ld	a,(OFST+0,sp)
1001  0007 97            	ld	xl,a
1002                     ; 216   assert_param(IS_UART1_CONFIG_IT_OK(UART1_IT));
1004  0008 1e03          	ldw	x,(OFST+1,sp)
1005  000a a30100        	cpw	x,#256
1006  000d 2723          	jreq	L26
1007  000f 1e03          	ldw	x,(OFST+1,sp)
1008  0011 a30277        	cpw	x,#631
1009  0014 271c          	jreq	L26
1010  0016 1e03          	ldw	x,(OFST+1,sp)
1011  0018 a30266        	cpw	x,#614
1012  001b 2715          	jreq	L26
1013  001d 1e03          	ldw	x,(OFST+1,sp)
1014  001f a30205        	cpw	x,#517
1015  0022 270e          	jreq	L26
1016  0024 1e03          	ldw	x,(OFST+1,sp)
1017  0026 a30244        	cpw	x,#580
1018  0029 2707          	jreq	L26
1019  002b 1e03          	ldw	x,(OFST+1,sp)
1020  002d a30346        	cpw	x,#838
1021  0030 2603          	jrne	L06
1022  0032               L26:
1023  0032 4f            	clr	a
1024  0033 2010          	jra	L46
1025  0035               L06:
1026  0035 ae00d8        	ldw	x,#216
1027  0038 89            	pushw	x
1028  0039 ae0000        	ldw	x,#0
1029  003c 89            	pushw	x
1030  003d ae0008        	ldw	x,#L371
1031  0040 cd0000        	call	_assert_failed
1033  0043 5b04          	addw	sp,#4
1034  0045               L46:
1035                     ; 217   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1037  0045 0d07          	tnz	(OFST+5,sp)
1038  0047 2706          	jreq	L07
1039  0049 7b07          	ld	a,(OFST+5,sp)
1040  004b a101          	cp	a,#1
1041  004d 2603          	jrne	L66
1042  004f               L07:
1043  004f 4f            	clr	a
1044  0050 2010          	jra	L27
1045  0052               L66:
1046  0052 ae00d9        	ldw	x,#217
1047  0055 89            	pushw	x
1048  0056 ae0000        	ldw	x,#0
1049  0059 89            	pushw	x
1050  005a ae0008        	ldw	x,#L371
1051  005d cd0000        	call	_assert_failed
1053  0060 5b04          	addw	sp,#4
1054  0062               L27:
1055                     ; 220   uartreg = (uint8_t)((uint16_t)UART1_IT >> 0x08);
1057  0062 7b03          	ld	a,(OFST+1,sp)
1058  0064 6b01          	ld	(OFST-1,sp),a
1059                     ; 222   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)UART1_IT & (uint8_t)0x0F));
1061  0066 7b04          	ld	a,(OFST+2,sp)
1062  0068 a40f          	and	a,#15
1063  006a 5f            	clrw	x
1064  006b 97            	ld	xl,a
1065  006c a601          	ld	a,#1
1066  006e 5d            	tnzw	x
1067  006f 2704          	jreq	L47
1068  0071               L67:
1069  0071 48            	sll	a
1070  0072 5a            	decw	x
1071  0073 26fc          	jrne	L67
1072  0075               L47:
1073  0075 6b02          	ld	(OFST+0,sp),a
1074                     ; 224   if (NewState != DISABLE)
1076  0077 0d07          	tnz	(OFST+5,sp)
1077  0079 272a          	jreq	L123
1078                     ; 227     if (uartreg == 0x01)
1080  007b 7b01          	ld	a,(OFST-1,sp)
1081  007d a101          	cp	a,#1
1082  007f 260a          	jrne	L323
1083                     ; 229       UART1->CR1 |= itpos;
1085  0081 c65234        	ld	a,21044
1086  0084 1a02          	or	a,(OFST+0,sp)
1087  0086 c75234        	ld	21044,a
1089  0089 2045          	jra	L333
1090  008b               L323:
1091                     ; 231     else if (uartreg == 0x02)
1093  008b 7b01          	ld	a,(OFST-1,sp)
1094  008d a102          	cp	a,#2
1095  008f 260a          	jrne	L723
1096                     ; 233       UART1->CR2 |= itpos;
1098  0091 c65235        	ld	a,21045
1099  0094 1a02          	or	a,(OFST+0,sp)
1100  0096 c75235        	ld	21045,a
1102  0099 2035          	jra	L333
1103  009b               L723:
1104                     ; 237       UART1->CR4 |= itpos;
1106  009b c65237        	ld	a,21047
1107  009e 1a02          	or	a,(OFST+0,sp)
1108  00a0 c75237        	ld	21047,a
1109  00a3 202b          	jra	L333
1110  00a5               L123:
1111                     ; 243     if (uartreg == 0x01)
1113  00a5 7b01          	ld	a,(OFST-1,sp)
1114  00a7 a101          	cp	a,#1
1115  00a9 260b          	jrne	L533
1116                     ; 245       UART1->CR1 &= (uint8_t)(~itpos);
1118  00ab 7b02          	ld	a,(OFST+0,sp)
1119  00ad 43            	cpl	a
1120  00ae c45234        	and	a,21044
1121  00b1 c75234        	ld	21044,a
1123  00b4 201a          	jra	L333
1124  00b6               L533:
1125                     ; 247     else if (uartreg == 0x02)
1127  00b6 7b01          	ld	a,(OFST-1,sp)
1128  00b8 a102          	cp	a,#2
1129  00ba 260b          	jrne	L143
1130                     ; 249       UART1->CR2 &= (uint8_t)(~itpos);
1132  00bc 7b02          	ld	a,(OFST+0,sp)
1133  00be 43            	cpl	a
1134  00bf c45235        	and	a,21045
1135  00c2 c75235        	ld	21045,a
1137  00c5 2009          	jra	L333
1138  00c7               L143:
1139                     ; 253       UART1->CR4 &= (uint8_t)(~itpos);
1141  00c7 7b02          	ld	a,(OFST+0,sp)
1142  00c9 43            	cpl	a
1143  00ca c45237        	and	a,21047
1144  00cd c75237        	ld	21047,a
1145  00d0               L333:
1146                     ; 257 }
1149  00d0 5b04          	addw	sp,#4
1150  00d2 81            	ret
1187                     ; 265 void UART1_HalfDuplexCmd(FunctionalState NewState)
1187                     ; 266 {
1188                     .text:	section	.text,new
1189  0000               _UART1_HalfDuplexCmd:
1191  0000 88            	push	a
1192       00000000      OFST:	set	0
1195                     ; 267   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1197  0001 4d            	tnz	a
1198  0002 2704          	jreq	L401
1199  0004 a101          	cp	a,#1
1200  0006 2603          	jrne	L201
1201  0008               L401:
1202  0008 4f            	clr	a
1203  0009 2010          	jra	L601
1204  000b               L201:
1205  000b ae010b        	ldw	x,#267
1206  000e 89            	pushw	x
1207  000f ae0000        	ldw	x,#0
1208  0012 89            	pushw	x
1209  0013 ae0008        	ldw	x,#L371
1210  0016 cd0000        	call	_assert_failed
1212  0019 5b04          	addw	sp,#4
1213  001b               L601:
1214                     ; 269   if (NewState != DISABLE)
1216  001b 0d01          	tnz	(OFST+1,sp)
1217  001d 2706          	jreq	L363
1218                     ; 271     UART1->CR5 |= UART1_CR5_HDSEL;  /**< UART1 Half Duplex Enable  */
1220  001f 72165238      	bset	21048,#3
1222  0023 2004          	jra	L563
1223  0025               L363:
1224                     ; 275     UART1->CR5 &= (uint8_t)~UART1_CR5_HDSEL; /**< UART1 Half Duplex Disable */
1226  0025 72175238      	bres	21048,#3
1227  0029               L563:
1228                     ; 277 }
1231  0029 84            	pop	a
1232  002a 81            	ret
1290                     ; 285 void UART1_IrDAConfig(UART1_IrDAMode_TypeDef UART1_IrDAMode)
1290                     ; 286 {
1291                     .text:	section	.text,new
1292  0000               _UART1_IrDAConfig:
1294  0000 88            	push	a
1295       00000000      OFST:	set	0
1298                     ; 287   assert_param(IS_UART1_IRDAMODE_OK(UART1_IrDAMode));
1300  0001 a101          	cp	a,#1
1301  0003 2703          	jreq	L411
1302  0005 4d            	tnz	a
1303  0006 2603          	jrne	L211
1304  0008               L411:
1305  0008 4f            	clr	a
1306  0009 2010          	jra	L611
1307  000b               L211:
1308  000b ae011f        	ldw	x,#287
1309  000e 89            	pushw	x
1310  000f ae0000        	ldw	x,#0
1311  0012 89            	pushw	x
1312  0013 ae0008        	ldw	x,#L371
1313  0016 cd0000        	call	_assert_failed
1315  0019 5b04          	addw	sp,#4
1316  001b               L611:
1317                     ; 289   if (UART1_IrDAMode != UART1_IRDAMODE_NORMAL)
1319  001b 0d01          	tnz	(OFST+1,sp)
1320  001d 2706          	jreq	L514
1321                     ; 291     UART1->CR5 |= UART1_CR5_IRLP;
1323  001f 72145238      	bset	21048,#2
1325  0023 2004          	jra	L714
1326  0025               L514:
1327                     ; 295     UART1->CR5 &= ((uint8_t)~UART1_CR5_IRLP);
1329  0025 72155238      	bres	21048,#2
1330  0029               L714:
1331                     ; 297 }
1334  0029 84            	pop	a
1335  002a 81            	ret
1371                     ; 305 void UART1_IrDACmd(FunctionalState NewState)
1371                     ; 306 {
1372                     .text:	section	.text,new
1373  0000               _UART1_IrDACmd:
1375  0000 88            	push	a
1376       00000000      OFST:	set	0
1379                     ; 308   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1381  0001 4d            	tnz	a
1382  0002 2704          	jreq	L421
1383  0004 a101          	cp	a,#1
1384  0006 2603          	jrne	L221
1385  0008               L421:
1386  0008 4f            	clr	a
1387  0009 2010          	jra	L621
1388  000b               L221:
1389  000b ae0134        	ldw	x,#308
1390  000e 89            	pushw	x
1391  000f ae0000        	ldw	x,#0
1392  0012 89            	pushw	x
1393  0013 ae0008        	ldw	x,#L371
1394  0016 cd0000        	call	_assert_failed
1396  0019 5b04          	addw	sp,#4
1397  001b               L621:
1398                     ; 310   if (NewState != DISABLE)
1400  001b 0d01          	tnz	(OFST+1,sp)
1401  001d 2706          	jreq	L734
1402                     ; 313     UART1->CR5 |= UART1_CR5_IREN;
1404  001f 72125238      	bset	21048,#1
1406  0023 2004          	jra	L144
1407  0025               L734:
1408                     ; 318     UART1->CR5 &= ((uint8_t)~UART1_CR5_IREN);
1410  0025 72135238      	bres	21048,#1
1411  0029               L144:
1412                     ; 320 }
1415  0029 84            	pop	a
1416  002a 81            	ret
1476                     ; 329 void UART1_LINBreakDetectionConfig(UART1_LINBreakDetectionLength_TypeDef UART1_LINBreakDetectionLength)
1476                     ; 330 {
1477                     .text:	section	.text,new
1478  0000               _UART1_LINBreakDetectionConfig:
1480  0000 88            	push	a
1481       00000000      OFST:	set	0
1484                     ; 331   assert_param(IS_UART1_LINBREAKDETECTIONLENGTH_OK(UART1_LINBreakDetectionLength));
1486  0001 4d            	tnz	a
1487  0002 2704          	jreq	L431
1488  0004 a101          	cp	a,#1
1489  0006 2603          	jrne	L231
1490  0008               L431:
1491  0008 4f            	clr	a
1492  0009 2010          	jra	L631
1493  000b               L231:
1494  000b ae014b        	ldw	x,#331
1495  000e 89            	pushw	x
1496  000f ae0000        	ldw	x,#0
1497  0012 89            	pushw	x
1498  0013 ae0008        	ldw	x,#L371
1499  0016 cd0000        	call	_assert_failed
1501  0019 5b04          	addw	sp,#4
1502  001b               L631:
1503                     ; 333   if (UART1_LINBreakDetectionLength != UART1_LINBREAKDETECTIONLENGTH_10BITS)
1505  001b 0d01          	tnz	(OFST+1,sp)
1506  001d 2706          	jreq	L174
1507                     ; 335     UART1->CR4 |= UART1_CR4_LBDL;
1509  001f 721a5237      	bset	21047,#5
1511  0023 2004          	jra	L374
1512  0025               L174:
1513                     ; 339     UART1->CR4 &= ((uint8_t)~UART1_CR4_LBDL);
1515  0025 721b5237      	bres	21047,#5
1516  0029               L374:
1517                     ; 341 }
1520  0029 84            	pop	a
1521  002a 81            	ret
1557                     ; 349 void UART1_LINCmd(FunctionalState NewState)
1557                     ; 350 {
1558                     .text:	section	.text,new
1559  0000               _UART1_LINCmd:
1561  0000 88            	push	a
1562       00000000      OFST:	set	0
1565                     ; 351   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1567  0001 4d            	tnz	a
1568  0002 2704          	jreq	L441
1569  0004 a101          	cp	a,#1
1570  0006 2603          	jrne	L241
1571  0008               L441:
1572  0008 4f            	clr	a
1573  0009 2010          	jra	L641
1574  000b               L241:
1575  000b ae015f        	ldw	x,#351
1576  000e 89            	pushw	x
1577  000f ae0000        	ldw	x,#0
1578  0012 89            	pushw	x
1579  0013 ae0008        	ldw	x,#L371
1580  0016 cd0000        	call	_assert_failed
1582  0019 5b04          	addw	sp,#4
1583  001b               L641:
1584                     ; 353   if (NewState != DISABLE)
1586  001b 0d01          	tnz	(OFST+1,sp)
1587  001d 2706          	jreq	L315
1588                     ; 356     UART1->CR3 |= UART1_CR3_LINEN;
1590  001f 721c5236      	bset	21046,#6
1592  0023 2004          	jra	L515
1593  0025               L315:
1594                     ; 361     UART1->CR3 &= ((uint8_t)~UART1_CR3_LINEN);
1596  0025 721d5236      	bres	21046,#6
1597  0029               L515:
1598                     ; 363 }
1601  0029 84            	pop	a
1602  002a 81            	ret
1638                     ; 371 void UART1_SmartCardCmd(FunctionalState NewState)
1638                     ; 372 {
1639                     .text:	section	.text,new
1640  0000               _UART1_SmartCardCmd:
1642  0000 88            	push	a
1643       00000000      OFST:	set	0
1646                     ; 373   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1648  0001 4d            	tnz	a
1649  0002 2704          	jreq	L451
1650  0004 a101          	cp	a,#1
1651  0006 2603          	jrne	L251
1652  0008               L451:
1653  0008 4f            	clr	a
1654  0009 2010          	jra	L651
1655  000b               L251:
1656  000b ae0175        	ldw	x,#373
1657  000e 89            	pushw	x
1658  000f ae0000        	ldw	x,#0
1659  0012 89            	pushw	x
1660  0013 ae0008        	ldw	x,#L371
1661  0016 cd0000        	call	_assert_failed
1663  0019 5b04          	addw	sp,#4
1664  001b               L651:
1665                     ; 375   if (NewState != DISABLE)
1667  001b 0d01          	tnz	(OFST+1,sp)
1668  001d 2706          	jreq	L535
1669                     ; 378     UART1->CR5 |= UART1_CR5_SCEN;
1671  001f 721a5238      	bset	21048,#5
1673  0023 2004          	jra	L735
1674  0025               L535:
1675                     ; 383     UART1->CR5 &= ((uint8_t)(~UART1_CR5_SCEN));
1677  0025 721b5238      	bres	21048,#5
1678  0029               L735:
1679                     ; 385 }
1682  0029 84            	pop	a
1683  002a 81            	ret
1720                     ; 394 void UART1_SmartCardNACKCmd(FunctionalState NewState)
1720                     ; 395 {
1721                     .text:	section	.text,new
1722  0000               _UART1_SmartCardNACKCmd:
1724  0000 88            	push	a
1725       00000000      OFST:	set	0
1728                     ; 396   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1730  0001 4d            	tnz	a
1731  0002 2704          	jreq	L461
1732  0004 a101          	cp	a,#1
1733  0006 2603          	jrne	L261
1734  0008               L461:
1735  0008 4f            	clr	a
1736  0009 2010          	jra	L661
1737  000b               L261:
1738  000b ae018c        	ldw	x,#396
1739  000e 89            	pushw	x
1740  000f ae0000        	ldw	x,#0
1741  0012 89            	pushw	x
1742  0013 ae0008        	ldw	x,#L371
1743  0016 cd0000        	call	_assert_failed
1745  0019 5b04          	addw	sp,#4
1746  001b               L661:
1747                     ; 398   if (NewState != DISABLE)
1749  001b 0d01          	tnz	(OFST+1,sp)
1750  001d 2706          	jreq	L755
1751                     ; 401     UART1->CR5 |= UART1_CR5_NACK;
1753  001f 72185238      	bset	21048,#4
1755  0023 2004          	jra	L165
1756  0025               L755:
1757                     ; 406     UART1->CR5 &= ((uint8_t)~(UART1_CR5_NACK));
1759  0025 72195238      	bres	21048,#4
1760  0029               L165:
1761                     ; 408 }
1764  0029 84            	pop	a
1765  002a 81            	ret
1823                     ; 416 void UART1_WakeUpConfig(UART1_WakeUp_TypeDef UART1_WakeUp)
1823                     ; 417 {
1824                     .text:	section	.text,new
1825  0000               _UART1_WakeUpConfig:
1827  0000 88            	push	a
1828       00000000      OFST:	set	0
1831                     ; 418   assert_param(IS_UART1_WAKEUP_OK(UART1_WakeUp));
1833  0001 4d            	tnz	a
1834  0002 2704          	jreq	L471
1835  0004 a108          	cp	a,#8
1836  0006 2603          	jrne	L271
1837  0008               L471:
1838  0008 4f            	clr	a
1839  0009 2010          	jra	L671
1840  000b               L271:
1841  000b ae01a2        	ldw	x,#418
1842  000e 89            	pushw	x
1843  000f ae0000        	ldw	x,#0
1844  0012 89            	pushw	x
1845  0013 ae0008        	ldw	x,#L371
1846  0016 cd0000        	call	_assert_failed
1848  0019 5b04          	addw	sp,#4
1849  001b               L671:
1850                     ; 420   UART1->CR1 &= ((uint8_t)~UART1_CR1_WAKE);
1852  001b 72175234      	bres	21044,#3
1853                     ; 421   UART1->CR1 |= (uint8_t)UART1_WakeUp;
1855  001f c65234        	ld	a,21044
1856  0022 1a01          	or	a,(OFST+1,sp)
1857  0024 c75234        	ld	21044,a
1858                     ; 422 }
1861  0027 84            	pop	a
1862  0028 81            	ret
1899                     ; 430 void UART1_ReceiverWakeUpCmd(FunctionalState NewState)
1899                     ; 431 {
1900                     .text:	section	.text,new
1901  0000               _UART1_ReceiverWakeUpCmd:
1903  0000 88            	push	a
1904       00000000      OFST:	set	0
1907                     ; 432   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1909  0001 4d            	tnz	a
1910  0002 2704          	jreq	L402
1911  0004 a101          	cp	a,#1
1912  0006 2603          	jrne	L202
1913  0008               L402:
1914  0008 4f            	clr	a
1915  0009 2010          	jra	L602
1916  000b               L202:
1917  000b ae01b0        	ldw	x,#432
1918  000e 89            	pushw	x
1919  000f ae0000        	ldw	x,#0
1920  0012 89            	pushw	x
1921  0013 ae0008        	ldw	x,#L371
1922  0016 cd0000        	call	_assert_failed
1924  0019 5b04          	addw	sp,#4
1925  001b               L602:
1926                     ; 434   if (NewState != DISABLE)
1928  001b 0d01          	tnz	(OFST+1,sp)
1929  001d 2706          	jreq	L726
1930                     ; 437     UART1->CR2 |= UART1_CR2_RWU;
1932  001f 72125235      	bset	21045,#1
1934  0023 2004          	jra	L136
1935  0025               L726:
1936                     ; 442     UART1->CR2 &= ((uint8_t)~UART1_CR2_RWU);
1938  0025 72135235      	bres	21045,#1
1939  0029               L136:
1940                     ; 444 }
1943  0029 84            	pop	a
1944  002a 81            	ret
1967                     ; 451 uint8_t UART1_ReceiveData8(void)
1967                     ; 452 {
1968                     .text:	section	.text,new
1969  0000               _UART1_ReceiveData8:
1973                     ; 453   return ((uint8_t)UART1->DR);
1975  0000 c65231        	ld	a,21041
1978  0003 81            	ret
2012                     ; 461 uint16_t UART1_ReceiveData9(void)
2012                     ; 462 {
2013                     .text:	section	.text,new
2014  0000               _UART1_ReceiveData9:
2016  0000 89            	pushw	x
2017       00000002      OFST:	set	2
2020                     ; 463   uint16_t temp = 0;
2022  0001 5f            	clrw	x
2023  0002 1f01          	ldw	(OFST-1,sp),x
2024                     ; 465   temp = (uint16_t)(((uint16_t)( (uint16_t)UART1->CR1 & (uint16_t)UART1_CR1_R8)) << 1);
2026  0004 c65234        	ld	a,21044
2027  0007 5f            	clrw	x
2028  0008 a480          	and	a,#128
2029  000a 5f            	clrw	x
2030  000b 02            	rlwa	x,a
2031  000c 58            	sllw	x
2032  000d 1f01          	ldw	(OFST-1,sp),x
2033                     ; 466   return (uint16_t)( (((uint16_t) UART1->DR) | temp ) & ((uint16_t)0x01FF));
2035  000f c65231        	ld	a,21041
2036  0012 5f            	clrw	x
2037  0013 97            	ld	xl,a
2038  0014 01            	rrwa	x,a
2039  0015 1a02          	or	a,(OFST+0,sp)
2040  0017 01            	rrwa	x,a
2041  0018 1a01          	or	a,(OFST-1,sp)
2042  001a 01            	rrwa	x,a
2043  001b 01            	rrwa	x,a
2044  001c a4ff          	and	a,#255
2045  001e 01            	rrwa	x,a
2046  001f a401          	and	a,#1
2047  0021 01            	rrwa	x,a
2050  0022 5b02          	addw	sp,#2
2051  0024 81            	ret
2085                     ; 474 void UART1_SendData8(uint8_t Data)
2085                     ; 475 {
2086                     .text:	section	.text,new
2087  0000               _UART1_SendData8:
2091                     ; 477   UART1->DR = Data;
2093  0000 c75231        	ld	21041,a
2094                     ; 478 }
2097  0003 81            	ret
2131                     ; 486 void UART1_SendData9(uint16_t Data)
2131                     ; 487 {
2132                     .text:	section	.text,new
2133  0000               _UART1_SendData9:
2135  0000 89            	pushw	x
2136       00000000      OFST:	set	0
2139                     ; 489   UART1->CR1 &= ((uint8_t)~UART1_CR1_T8);
2141  0001 721d5234      	bres	21044,#6
2142                     ; 491   UART1->CR1 |= (uint8_t)(((uint8_t)(Data >> 2)) & UART1_CR1_T8);
2144  0005 54            	srlw	x
2145  0006 54            	srlw	x
2146  0007 9f            	ld	a,xl
2147  0008 a440          	and	a,#64
2148  000a ca5234        	or	a,21044
2149  000d c75234        	ld	21044,a
2150                     ; 493   UART1->DR   = (uint8_t)(Data);
2152  0010 7b02          	ld	a,(OFST+2,sp)
2153  0012 c75231        	ld	21041,a
2154                     ; 494 }
2157  0015 85            	popw	x
2158  0016 81            	ret
2181                     ; 501 void UART1_SendBreak(void)
2181                     ; 502 {
2182                     .text:	section	.text,new
2183  0000               _UART1_SendBreak:
2187                     ; 503   UART1->CR2 |= UART1_CR2_SBK;
2189  0000 72105235      	bset	21045,#0
2190                     ; 504 }
2193  0004 81            	ret
2228                     ; 511 void UART1_SetAddress(uint8_t UART1_Address)
2228                     ; 512 {
2229                     .text:	section	.text,new
2230  0000               _UART1_SetAddress:
2232  0000 88            	push	a
2233       00000000      OFST:	set	0
2236                     ; 514   assert_param(IS_UART1_ADDRESS_OK(UART1_Address));
2238  0001 a110          	cp	a,#16
2239  0003 2403          	jruge	L422
2240  0005 4f            	clr	a
2241  0006 2010          	jra	L622
2242  0008               L422:
2243  0008 ae0202        	ldw	x,#514
2244  000b 89            	pushw	x
2245  000c ae0000        	ldw	x,#0
2246  000f 89            	pushw	x
2247  0010 ae0008        	ldw	x,#L371
2248  0013 cd0000        	call	_assert_failed
2250  0016 5b04          	addw	sp,#4
2251  0018               L622:
2252                     ; 517   UART1->CR4 &= ((uint8_t)~UART1_CR4_ADD);
2254  0018 c65237        	ld	a,21047
2255  001b a4f0          	and	a,#240
2256  001d c75237        	ld	21047,a
2257                     ; 519   UART1->CR4 |= UART1_Address;
2259  0020 c65237        	ld	a,21047
2260  0023 1a01          	or	a,(OFST+1,sp)
2261  0025 c75237        	ld	21047,a
2262                     ; 520 }
2265  0028 84            	pop	a
2266  0029 81            	ret
2300                     ; 528 void UART1_SetGuardTime(uint8_t UART1_GuardTime)
2300                     ; 529 {
2301                     .text:	section	.text,new
2302  0000               _UART1_SetGuardTime:
2306                     ; 531   UART1->GTR = UART1_GuardTime;
2308  0000 c75239        	ld	21049,a
2309                     ; 532 }
2312  0003 81            	ret
2346                     ; 556 void UART1_SetPrescaler(uint8_t UART1_Prescaler)
2346                     ; 557 {
2347                     .text:	section	.text,new
2348  0000               _UART1_SetPrescaler:
2352                     ; 559   UART1->PSCR = UART1_Prescaler;
2354  0000 c7523a        	ld	21050,a
2355                     ; 560 }
2358  0003 81            	ret
2502                     ; 568 FlagStatus UART1_GetFlagStatus(UART1_Flag_TypeDef UART1_FLAG)
2502                     ; 569 {
2503                     .text:	section	.text,new
2504  0000               _UART1_GetFlagStatus:
2506  0000 89            	pushw	x
2507  0001 88            	push	a
2508       00000001      OFST:	set	1
2511                     ; 570   FlagStatus status = RESET;
2513  0002 0f01          	clr	(OFST+0,sp)
2514                     ; 573   assert_param(IS_UART1_FLAG_OK(UART1_FLAG));
2516  0004 a30080        	cpw	x,#128
2517  0007 272d          	jreq	L042
2518  0009 a30040        	cpw	x,#64
2519  000c 2728          	jreq	L042
2520  000e a30020        	cpw	x,#32
2521  0011 2723          	jreq	L042
2522  0013 a30010        	cpw	x,#16
2523  0016 271e          	jreq	L042
2524  0018 a30008        	cpw	x,#8
2525  001b 2719          	jreq	L042
2526  001d a30004        	cpw	x,#4
2527  0020 2714          	jreq	L042
2528  0022 a30002        	cpw	x,#2
2529  0025 270f          	jreq	L042
2530  0027 a30001        	cpw	x,#1
2531  002a 270a          	jreq	L042
2532  002c a30101        	cpw	x,#257
2533  002f 2705          	jreq	L042
2534  0031 a30210        	cpw	x,#528
2535  0034 2603          	jrne	L632
2536  0036               L042:
2537  0036 4f            	clr	a
2538  0037 2010          	jra	L242
2539  0039               L632:
2540  0039 ae023d        	ldw	x,#573
2541  003c 89            	pushw	x
2542  003d ae0000        	ldw	x,#0
2543  0040 89            	pushw	x
2544  0041 ae0008        	ldw	x,#L371
2545  0044 cd0000        	call	_assert_failed
2547  0047 5b04          	addw	sp,#4
2548  0049               L242:
2549                     ; 577   if (UART1_FLAG == UART1_FLAG_LBDF)
2551  0049 1e02          	ldw	x,(OFST+1,sp)
2552  004b a30210        	cpw	x,#528
2553  004e 2611          	jrne	L1601
2554                     ; 579     if ((UART1->CR4 & (uint8_t)UART1_FLAG) != (uint8_t)0x00)
2556  0050 c65237        	ld	a,21047
2557  0053 1503          	bcp	a,(OFST+2,sp)
2558  0055 2706          	jreq	L3601
2559                     ; 582       status = SET;
2561  0057 a601          	ld	a,#1
2562  0059 6b01          	ld	(OFST+0,sp),a
2564  005b 202b          	jra	L7601
2565  005d               L3601:
2566                     ; 587       status = RESET;
2568  005d 0f01          	clr	(OFST+0,sp)
2569  005f 2027          	jra	L7601
2570  0061               L1601:
2571                     ; 590   else if (UART1_FLAG == UART1_FLAG_SBK)
2573  0061 1e02          	ldw	x,(OFST+1,sp)
2574  0063 a30101        	cpw	x,#257
2575  0066 2611          	jrne	L1701
2576                     ; 592     if ((UART1->CR2 & (uint8_t)UART1_FLAG) != (uint8_t)0x00)
2578  0068 c65235        	ld	a,21045
2579  006b 1503          	bcp	a,(OFST+2,sp)
2580  006d 2706          	jreq	L3701
2581                     ; 595       status = SET;
2583  006f a601          	ld	a,#1
2584  0071 6b01          	ld	(OFST+0,sp),a
2586  0073 2013          	jra	L7601
2587  0075               L3701:
2588                     ; 600       status = RESET;
2590  0075 0f01          	clr	(OFST+0,sp)
2591  0077 200f          	jra	L7601
2592  0079               L1701:
2593                     ; 605     if ((UART1->SR & (uint8_t)UART1_FLAG) != (uint8_t)0x00)
2595  0079 c65230        	ld	a,21040
2596  007c 1503          	bcp	a,(OFST+2,sp)
2597  007e 2706          	jreq	L1011
2598                     ; 608       status = SET;
2600  0080 a601          	ld	a,#1
2601  0082 6b01          	ld	(OFST+0,sp),a
2603  0084 2002          	jra	L7601
2604  0086               L1011:
2605                     ; 613       status = RESET;
2607  0086 0f01          	clr	(OFST+0,sp)
2608  0088               L7601:
2609                     ; 617   return status;
2611  0088 7b01          	ld	a,(OFST+0,sp)
2614  008a 5b03          	addw	sp,#3
2615  008c 81            	ret
2651                     ; 646 void UART1_ClearFlag(UART1_Flag_TypeDef UART1_FLAG)
2651                     ; 647 {
2652                     .text:	section	.text,new
2653  0000               _UART1_ClearFlag:
2655  0000 89            	pushw	x
2656       00000000      OFST:	set	0
2659                     ; 648   assert_param(IS_UART1_CLEAR_FLAG_OK(UART1_FLAG));
2661  0001 a30020        	cpw	x,#32
2662  0004 2705          	jreq	L052
2663  0006 a30210        	cpw	x,#528
2664  0009 2603          	jrne	L642
2665  000b               L052:
2666  000b 4f            	clr	a
2667  000c 2010          	jra	L252
2668  000e               L642:
2669  000e ae0288        	ldw	x,#648
2670  0011 89            	pushw	x
2671  0012 ae0000        	ldw	x,#0
2672  0015 89            	pushw	x
2673  0016 ae0008        	ldw	x,#L371
2674  0019 cd0000        	call	_assert_failed
2676  001c 5b04          	addw	sp,#4
2677  001e               L252:
2678                     ; 651   if (UART1_FLAG == UART1_FLAG_RXNE)
2680  001e 1e01          	ldw	x,(OFST+1,sp)
2681  0020 a30020        	cpw	x,#32
2682  0023 2606          	jrne	L3211
2683                     ; 653     UART1->SR = (uint8_t)~(UART1_SR_RXNE);
2685  0025 35df5230      	mov	21040,#223
2687  0029 2004          	jra	L5211
2688  002b               L3211:
2689                     ; 658     UART1->CR4 &= (uint8_t)~(UART1_CR4_LBDF);
2691  002b 72195237      	bres	21047,#4
2692  002f               L5211:
2693                     ; 660 }
2696  002f 85            	popw	x
2697  0030 81            	ret
2780                     ; 675 ITStatus UART1_GetITStatus(UART1_IT_TypeDef UART1_IT)
2780                     ; 676 {
2781                     .text:	section	.text,new
2782  0000               _UART1_GetITStatus:
2784  0000 89            	pushw	x
2785  0001 89            	pushw	x
2786       00000002      OFST:	set	2
2789                     ; 677   ITStatus pendingbitstatus = RESET;
2791  0002 7b02          	ld	a,(OFST+0,sp)
2792  0004 97            	ld	xl,a
2793                     ; 678   uint8_t itpos = 0;
2795  0005 7b01          	ld	a,(OFST-1,sp)
2796  0007 97            	ld	xl,a
2797                     ; 679   uint8_t itmask1 = 0;
2799  0008 7b02          	ld	a,(OFST+0,sp)
2800  000a 97            	ld	xl,a
2801                     ; 680   uint8_t itmask2 = 0;
2803  000b 7b02          	ld	a,(OFST+0,sp)
2804  000d 97            	ld	xl,a
2805                     ; 681   uint8_t enablestatus = 0;
2807  000e 7b02          	ld	a,(OFST+0,sp)
2808  0010 97            	ld	xl,a
2809                     ; 684   assert_param(IS_UART1_GET_IT_OK(UART1_IT));
2811  0011 1e03          	ldw	x,(OFST+1,sp)
2812  0013 a30277        	cpw	x,#631
2813  0016 272a          	jreq	L062
2814  0018 1e03          	ldw	x,(OFST+1,sp)
2815  001a a30266        	cpw	x,#614
2816  001d 2723          	jreq	L062
2817  001f 1e03          	ldw	x,(OFST+1,sp)
2818  0021 a30255        	cpw	x,#597
2819  0024 271c          	jreq	L062
2820  0026 1e03          	ldw	x,(OFST+1,sp)
2821  0028 a30244        	cpw	x,#580
2822  002b 2715          	jreq	L062
2823  002d 1e03          	ldw	x,(OFST+1,sp)
2824  002f a30235        	cpw	x,#565
2825  0032 270e          	jreq	L062
2826  0034 1e03          	ldw	x,(OFST+1,sp)
2827  0036 a30346        	cpw	x,#838
2828  0039 2707          	jreq	L062
2829  003b 1e03          	ldw	x,(OFST+1,sp)
2830  003d a30100        	cpw	x,#256
2831  0040 2603          	jrne	L652
2832  0042               L062:
2833  0042 4f            	clr	a
2834  0043 2010          	jra	L262
2835  0045               L652:
2836  0045 ae02ac        	ldw	x,#684
2837  0048 89            	pushw	x
2838  0049 ae0000        	ldw	x,#0
2839  004c 89            	pushw	x
2840  004d ae0008        	ldw	x,#L371
2841  0050 cd0000        	call	_assert_failed
2843  0053 5b04          	addw	sp,#4
2844  0055               L262:
2845                     ; 687   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)UART1_IT & (uint8_t)0x0F));
2847  0055 7b04          	ld	a,(OFST+2,sp)
2848  0057 a40f          	and	a,#15
2849  0059 5f            	clrw	x
2850  005a 97            	ld	xl,a
2851  005b a601          	ld	a,#1
2852  005d 5d            	tnzw	x
2853  005e 2704          	jreq	L462
2854  0060               L662:
2855  0060 48            	sll	a
2856  0061 5a            	decw	x
2857  0062 26fc          	jrne	L662
2858  0064               L462:
2859  0064 6b01          	ld	(OFST-1,sp),a
2860                     ; 689   itmask1 = (uint8_t)((uint8_t)UART1_IT >> (uint8_t)4);
2862  0066 7b04          	ld	a,(OFST+2,sp)
2863  0068 4e            	swap	a
2864  0069 a40f          	and	a,#15
2865  006b 6b02          	ld	(OFST+0,sp),a
2866                     ; 691   itmask2 = (uint8_t)((uint8_t)1 << itmask1);
2868  006d 7b02          	ld	a,(OFST+0,sp)
2869  006f 5f            	clrw	x
2870  0070 97            	ld	xl,a
2871  0071 a601          	ld	a,#1
2872  0073 5d            	tnzw	x
2873  0074 2704          	jreq	L072
2874  0076               L272:
2875  0076 48            	sll	a
2876  0077 5a            	decw	x
2877  0078 26fc          	jrne	L272
2878  007a               L072:
2879  007a 6b02          	ld	(OFST+0,sp),a
2880                     ; 695   if (UART1_IT == UART1_IT_PE)
2882  007c 1e03          	ldw	x,(OFST+1,sp)
2883  007e a30100        	cpw	x,#256
2884  0081 261c          	jrne	L1711
2885                     ; 698     enablestatus = (uint8_t)((uint8_t)UART1->CR1 & itmask2);
2887  0083 c65234        	ld	a,21044
2888  0086 1402          	and	a,(OFST+0,sp)
2889  0088 6b02          	ld	(OFST+0,sp),a
2890                     ; 701     if (((UART1->SR & itpos) != (uint8_t)0x00) && enablestatus)
2892  008a c65230        	ld	a,21040
2893  008d 1501          	bcp	a,(OFST-1,sp)
2894  008f 270a          	jreq	L3711
2896  0091 0d02          	tnz	(OFST+0,sp)
2897  0093 2706          	jreq	L3711
2898                     ; 704       pendingbitstatus = SET;
2900  0095 a601          	ld	a,#1
2901  0097 6b02          	ld	(OFST+0,sp),a
2903  0099 2041          	jra	L7711
2904  009b               L3711:
2905                     ; 709       pendingbitstatus = RESET;
2907  009b 0f02          	clr	(OFST+0,sp)
2908  009d 203d          	jra	L7711
2909  009f               L1711:
2910                     ; 713   else if (UART1_IT == UART1_IT_LBDF)
2912  009f 1e03          	ldw	x,(OFST+1,sp)
2913  00a1 a30346        	cpw	x,#838
2914  00a4 261c          	jrne	L1021
2915                     ; 716     enablestatus = (uint8_t)((uint8_t)UART1->CR4 & itmask2);
2917  00a6 c65237        	ld	a,21047
2918  00a9 1402          	and	a,(OFST+0,sp)
2919  00ab 6b02          	ld	(OFST+0,sp),a
2920                     ; 718     if (((UART1->CR4 & itpos) != (uint8_t)0x00) && enablestatus)
2922  00ad c65237        	ld	a,21047
2923  00b0 1501          	bcp	a,(OFST-1,sp)
2924  00b2 270a          	jreq	L3021
2926  00b4 0d02          	tnz	(OFST+0,sp)
2927  00b6 2706          	jreq	L3021
2928                     ; 721       pendingbitstatus = SET;
2930  00b8 a601          	ld	a,#1
2931  00ba 6b02          	ld	(OFST+0,sp),a
2933  00bc 201e          	jra	L7711
2934  00be               L3021:
2935                     ; 726       pendingbitstatus = RESET;
2937  00be 0f02          	clr	(OFST+0,sp)
2938  00c0 201a          	jra	L7711
2939  00c2               L1021:
2940                     ; 732     enablestatus = (uint8_t)((uint8_t)UART1->CR2 & itmask2);
2942  00c2 c65235        	ld	a,21045
2943  00c5 1402          	and	a,(OFST+0,sp)
2944  00c7 6b02          	ld	(OFST+0,sp),a
2945                     ; 734     if (((UART1->SR & itpos) != (uint8_t)0x00) && enablestatus)
2947  00c9 c65230        	ld	a,21040
2948  00cc 1501          	bcp	a,(OFST-1,sp)
2949  00ce 270a          	jreq	L1121
2951  00d0 0d02          	tnz	(OFST+0,sp)
2952  00d2 2706          	jreq	L1121
2953                     ; 737       pendingbitstatus = SET;
2955  00d4 a601          	ld	a,#1
2956  00d6 6b02          	ld	(OFST+0,sp),a
2958  00d8 2002          	jra	L7711
2959  00da               L1121:
2960                     ; 742       pendingbitstatus = RESET;
2962  00da 0f02          	clr	(OFST+0,sp)
2963  00dc               L7711:
2964                     ; 747   return  pendingbitstatus;
2966  00dc 7b02          	ld	a,(OFST+0,sp)
2969  00de 5b04          	addw	sp,#4
2970  00e0 81            	ret
3007                     ; 775 void UART1_ClearITPendingBit(UART1_IT_TypeDef UART1_IT)
3007                     ; 776 {
3008                     .text:	section	.text,new
3009  0000               _UART1_ClearITPendingBit:
3011  0000 89            	pushw	x
3012       00000000      OFST:	set	0
3015                     ; 777   assert_param(IS_UART1_CLEAR_IT_OK(UART1_IT));
3017  0001 a30255        	cpw	x,#597
3018  0004 2705          	jreq	L003
3019  0006 a30346        	cpw	x,#838
3020  0009 2603          	jrne	L672
3021  000b               L003:
3022  000b 4f            	clr	a
3023  000c 2010          	jra	L203
3024  000e               L672:
3025  000e ae0309        	ldw	x,#777
3026  0011 89            	pushw	x
3027  0012 ae0000        	ldw	x,#0
3028  0015 89            	pushw	x
3029  0016 ae0008        	ldw	x,#L371
3030  0019 cd0000        	call	_assert_failed
3032  001c 5b04          	addw	sp,#4
3033  001e               L203:
3034                     ; 780   if (UART1_IT == UART1_IT_RXNE)
3036  001e 1e01          	ldw	x,(OFST+1,sp)
3037  0020 a30255        	cpw	x,#597
3038  0023 2606          	jrne	L3321
3039                     ; 782     UART1->SR = (uint8_t)~(UART1_SR_RXNE);
3041  0025 35df5230      	mov	21040,#223
3043  0029 2004          	jra	L5321
3044  002b               L3321:
3045                     ; 787     UART1->CR4 &= (uint8_t)~(UART1_CR4_LBDF);
3047  002b 72195237      	bres	21047,#4
3048  002f               L5321:
3049                     ; 789 }
3052  002f 85            	popw	x
3053  0030 81            	ret
3066                     	xdef	_UART1_ClearITPendingBit
3067                     	xdef	_UART1_GetITStatus
3068                     	xdef	_UART1_ClearFlag
3069                     	xdef	_UART1_GetFlagStatus
3070                     	xdef	_UART1_SetPrescaler
3071                     	xdef	_UART1_SetGuardTime
3072                     	xdef	_UART1_SetAddress
3073                     	xdef	_UART1_SendBreak
3074                     	xdef	_UART1_SendData9
3075                     	xdef	_UART1_SendData8
3076                     	xdef	_UART1_ReceiveData9
3077                     	xdef	_UART1_ReceiveData8
3078                     	xdef	_UART1_ReceiverWakeUpCmd
3079                     	xdef	_UART1_WakeUpConfig
3080                     	xdef	_UART1_SmartCardNACKCmd
3081                     	xdef	_UART1_SmartCardCmd
3082                     	xdef	_UART1_LINCmd
3083                     	xdef	_UART1_LINBreakDetectionConfig
3084                     	xdef	_UART1_IrDACmd
3085                     	xdef	_UART1_IrDAConfig
3086                     	xdef	_UART1_HalfDuplexCmd
3087                     	xdef	_UART1_ITConfig
3088                     	xdef	_UART1_Cmd
3089                     	xdef	_UART1_Init
3090                     	xdef	_UART1_DeInit
3091                     	xref	_assert_failed
3092                     	xref	_CLK_GetClockFreq
3093                     	switch	.const
3094  0008               L371:
3095  0008 2e2e5c2e2e5c  	dc.b	"..\..\..\libraries"
3096  001a 5c73746d3873  	dc.b	"\stm8s_stdperiph_d"
3097  002c 72697665725c  	dc.b	"river\src\stm8s_ua"
3098  003e 7274312e6300  	dc.b	"rt1.c",0
3099                     	xref.b	c_lreg
3119                     	xref	c_lursh
3120                     	xref	c_lsub
3121                     	xref	c_smul
3122                     	xref	c_ludv
3123                     	xref	c_rtol
3124                     	xref	c_llsh
3125                     	xref	c_lcmp
3126                     	xref	c_ltor
3127                     	end
