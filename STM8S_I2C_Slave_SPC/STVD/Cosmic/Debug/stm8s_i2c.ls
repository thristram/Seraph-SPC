   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
  32                     ; 67 void I2C_DeInit(void)
  32                     ; 68 {
  34                     .text:	section	.text,new
  35  0000               _I2C_DeInit:
  39                     ; 69   I2C->CR1 = I2C_CR1_RESET_VALUE;
  41  0000 725f5210      	clr	21008
  42                     ; 70   I2C->CR2 = I2C_CR2_RESET_VALUE;
  44  0004 725f5211      	clr	21009
  45                     ; 71   I2C->FREQR = I2C_FREQR_RESET_VALUE;
  47  0008 725f5212      	clr	21010
  48                     ; 72   I2C->OARL = I2C_OARL_RESET_VALUE;
  50  000c 725f5213      	clr	21011
  51                     ; 73   I2C->OARH = I2C_OARH_RESET_VALUE;
  53  0010 725f5214      	clr	21012
  54                     ; 74   I2C->ITR = I2C_ITR_RESET_VALUE;
  56  0014 725f521a      	clr	21018
  57                     ; 75   I2C->CCRL = I2C_CCRL_RESET_VALUE;
  59  0018 725f521b      	clr	21019
  60                     ; 76   I2C->CCRH = I2C_CCRH_RESET_VALUE;
  62  001c 725f521c      	clr	21020
  63                     ; 77   I2C->TRISER = I2C_TRISER_RESET_VALUE;
  65  0020 3502521d      	mov	21021,#2
  66                     ; 78 }
  69  0024 81            	ret
 249                     .const:	section	.text
 250  0000               L44:
 251  0000 00061a81      	dc.l	400001
 252  0004               L05:
 253  0004 000186a1      	dc.l	100001
 254  0008               L25:
 255  0008 000f4240      	dc.l	1000000
 256                     ; 96 void I2C_Init(uint32_t OutputClockFrequencyHz, uint16_t OwnAddress, 
 256                     ; 97               I2C_DutyCycle_TypeDef I2C_DutyCycle, I2C_Ack_TypeDef Ack, 
 256                     ; 98               I2C_AddMode_TypeDef AddMode, uint8_t InputClockFrequencyMHz )
 256                     ; 99 {
 257                     .text:	section	.text,new
 258  0000               _I2C_Init:
 260  0000 5209          	subw	sp,#9
 261       00000009      OFST:	set	9
 264                     ; 100   uint16_t result = 0x0004;
 266  0002 1e08          	ldw	x,(OFST-1,sp)
 267                     ; 101   uint16_t tmpval = 0;
 269  0004 1e05          	ldw	x,(OFST-4,sp)
 270                     ; 102   uint8_t tmpccrh = 0;
 272  0006 0f07          	clr	(OFST-2,sp)
 273                     ; 105   assert_param(IS_I2C_ACK_OK(Ack));
 275  0008 0d13          	tnz	(OFST+10,sp)
 276  000a 270c          	jreq	L21
 277  000c 7b13          	ld	a,(OFST+10,sp)
 278  000e a101          	cp	a,#1
 279  0010 2706          	jreq	L21
 280  0012 7b13          	ld	a,(OFST+10,sp)
 281  0014 a102          	cp	a,#2
 282  0016 2603          	jrne	L01
 283  0018               L21:
 284  0018 4f            	clr	a
 285  0019 2010          	jra	L41
 286  001b               L01:
 287  001b ae0069        	ldw	x,#105
 288  001e 89            	pushw	x
 289  001f ae0000        	ldw	x,#0
 290  0022 89            	pushw	x
 291  0023 ae000c        	ldw	x,#L131
 292  0026 cd0000        	call	_assert_failed
 294  0029 5b04          	addw	sp,#4
 295  002b               L41:
 296                     ; 106   assert_param(IS_I2C_ADDMODE_OK(AddMode));
 298  002b 0d14          	tnz	(OFST+11,sp)
 299  002d 2706          	jreq	L02
 300  002f 7b14          	ld	a,(OFST+11,sp)
 301  0031 a180          	cp	a,#128
 302  0033 2603          	jrne	L61
 303  0035               L02:
 304  0035 4f            	clr	a
 305  0036 2010          	jra	L22
 306  0038               L61:
 307  0038 ae006a        	ldw	x,#106
 308  003b 89            	pushw	x
 309  003c ae0000        	ldw	x,#0
 310  003f 89            	pushw	x
 311  0040 ae000c        	ldw	x,#L131
 312  0043 cd0000        	call	_assert_failed
 314  0046 5b04          	addw	sp,#4
 315  0048               L22:
 316                     ; 107   assert_param(IS_I2C_OWN_ADDRESS_OK(OwnAddress));
 318  0048 1e10          	ldw	x,(OFST+7,sp)
 319  004a a30400        	cpw	x,#1024
 320  004d 2403          	jruge	L42
 321  004f 4f            	clr	a
 322  0050 2010          	jra	L62
 323  0052               L42:
 324  0052 ae006b        	ldw	x,#107
 325  0055 89            	pushw	x
 326  0056 ae0000        	ldw	x,#0
 327  0059 89            	pushw	x
 328  005a ae000c        	ldw	x,#L131
 329  005d cd0000        	call	_assert_failed
 331  0060 5b04          	addw	sp,#4
 332  0062               L62:
 333                     ; 108   assert_param(IS_I2C_DUTYCYCLE_OK(I2C_DutyCycle));  
 335  0062 0d12          	tnz	(OFST+9,sp)
 336  0064 2706          	jreq	L23
 337  0066 7b12          	ld	a,(OFST+9,sp)
 338  0068 a140          	cp	a,#64
 339  006a 2603          	jrne	L03
 340  006c               L23:
 341  006c 4f            	clr	a
 342  006d 2010          	jra	L43
 343  006f               L03:
 344  006f ae006c        	ldw	x,#108
 345  0072 89            	pushw	x
 346  0073 ae0000        	ldw	x,#0
 347  0076 89            	pushw	x
 348  0077 ae000c        	ldw	x,#L131
 349  007a cd0000        	call	_assert_failed
 351  007d 5b04          	addw	sp,#4
 352  007f               L43:
 353                     ; 109   assert_param(IS_I2C_INPUT_CLOCK_FREQ_OK(InputClockFrequencyMHz));
 355  007f 0d15          	tnz	(OFST+12,sp)
 356  0081 2709          	jreq	L63
 357  0083 7b15          	ld	a,(OFST+12,sp)
 358  0085 a111          	cp	a,#17
 359  0087 2403          	jruge	L63
 360  0089 4f            	clr	a
 361  008a 2010          	jra	L04
 362  008c               L63:
 363  008c ae006d        	ldw	x,#109
 364  008f 89            	pushw	x
 365  0090 ae0000        	ldw	x,#0
 366  0093 89            	pushw	x
 367  0094 ae000c        	ldw	x,#L131
 368  0097 cd0000        	call	_assert_failed
 370  009a 5b04          	addw	sp,#4
 371  009c               L04:
 372                     ; 110   assert_param(IS_I2C_OUTPUT_CLOCK_FREQ_OK(OutputClockFrequencyHz));
 374  009c 96            	ldw	x,sp
 375  009d 1c000c        	addw	x,#OFST+3
 376  00a0 cd0000        	call	c_lzmp
 378  00a3 2712          	jreq	L24
 379  00a5 96            	ldw	x,sp
 380  00a6 1c000c        	addw	x,#OFST+3
 381  00a9 cd0000        	call	c_ltor
 383  00ac ae0000        	ldw	x,#L44
 384  00af cd0000        	call	c_lcmp
 386  00b2 2403          	jruge	L24
 387  00b4 4f            	clr	a
 388  00b5 2010          	jra	L64
 389  00b7               L24:
 390  00b7 ae006e        	ldw	x,#110
 391  00ba 89            	pushw	x
 392  00bb ae0000        	ldw	x,#0
 393  00be 89            	pushw	x
 394  00bf ae000c        	ldw	x,#L131
 395  00c2 cd0000        	call	_assert_failed
 397  00c5 5b04          	addw	sp,#4
 398  00c7               L64:
 399                     ; 115   I2C->FREQR &= (uint8_t)(~I2C_FREQR_FREQ);
 401  00c7 c65212        	ld	a,21010
 402  00ca a4c0          	and	a,#192
 403  00cc c75212        	ld	21010,a
 404                     ; 117   I2C->FREQR |= InputClockFrequencyMHz;
 406  00cf c65212        	ld	a,21010
 407  00d2 1a15          	or	a,(OFST+12,sp)
 408  00d4 c75212        	ld	21010,a
 409                     ; 121   I2C->CR1 &= (uint8_t)(~I2C_CR1_PE);
 411  00d7 72115210      	bres	21008,#0
 412                     ; 124   I2C->CCRH &= (uint8_t)(~(I2C_CCRH_FS | I2C_CCRH_DUTY | I2C_CCRH_CCR));
 414  00db c6521c        	ld	a,21020
 415  00de a430          	and	a,#48
 416  00e0 c7521c        	ld	21020,a
 417                     ; 125   I2C->CCRL &= (uint8_t)(~I2C_CCRL_CCR);
 419  00e3 725f521b      	clr	21019
 420                     ; 128   if (OutputClockFrequencyHz > I2C_MAX_STANDARD_FREQ) /* FAST MODE */
 422  00e7 96            	ldw	x,sp
 423  00e8 1c000c        	addw	x,#OFST+3
 424  00eb cd0000        	call	c_ltor
 426  00ee ae0004        	ldw	x,#L05
 427  00f1 cd0000        	call	c_lcmp
 429  00f4 2403          	jruge	L65
 430  00f6 cc0183        	jp	L331
 431  00f9               L65:
 432                     ; 131     tmpccrh = I2C_CCRH_FS;
 434  00f9 a680          	ld	a,#128
 435  00fb 6b07          	ld	(OFST-2,sp),a
 436                     ; 133     if (I2C_DutyCycle == I2C_DUTYCYCLE_2)
 438  00fd 0d12          	tnz	(OFST+9,sp)
 439  00ff 2630          	jrne	L531
 440                     ; 136       result = (uint16_t) ((InputClockFrequencyMHz * 1000000) / (OutputClockFrequencyHz * 3));
 442  0101 96            	ldw	x,sp
 443  0102 1c000c        	addw	x,#OFST+3
 444  0105 cd0000        	call	c_ltor
 446  0108 a603          	ld	a,#3
 447  010a cd0000        	call	c_smul
 449  010d 96            	ldw	x,sp
 450  010e 1c0001        	addw	x,#OFST-8
 451  0111 cd0000        	call	c_rtol
 453  0114 7b15          	ld	a,(OFST+12,sp)
 454  0116 b703          	ld	c_lreg+3,a
 455  0118 3f02          	clr	c_lreg+2
 456  011a 3f01          	clr	c_lreg+1
 457  011c 3f00          	clr	c_lreg
 458  011e ae0008        	ldw	x,#L25
 459  0121 cd0000        	call	c_lmul
 461  0124 96            	ldw	x,sp
 462  0125 1c0001        	addw	x,#OFST-8
 463  0128 cd0000        	call	c_ludv
 465  012b be02          	ldw	x,c_lreg+2
 466  012d 1f08          	ldw	(OFST-1,sp),x
 468  012f 2034          	jra	L731
 469  0131               L531:
 470                     ; 141       result = (uint16_t) ((InputClockFrequencyMHz * 1000000) / (OutputClockFrequencyHz * 25));
 472  0131 96            	ldw	x,sp
 473  0132 1c000c        	addw	x,#OFST+3
 474  0135 cd0000        	call	c_ltor
 476  0138 a619          	ld	a,#25
 477  013a cd0000        	call	c_smul
 479  013d 96            	ldw	x,sp
 480  013e 1c0001        	addw	x,#OFST-8
 481  0141 cd0000        	call	c_rtol
 483  0144 7b15          	ld	a,(OFST+12,sp)
 484  0146 b703          	ld	c_lreg+3,a
 485  0148 3f02          	clr	c_lreg+2
 486  014a 3f01          	clr	c_lreg+1
 487  014c 3f00          	clr	c_lreg
 488  014e ae0008        	ldw	x,#L25
 489  0151 cd0000        	call	c_lmul
 491  0154 96            	ldw	x,sp
 492  0155 1c0001        	addw	x,#OFST-8
 493  0158 cd0000        	call	c_ludv
 495  015b be02          	ldw	x,c_lreg+2
 496  015d 1f08          	ldw	(OFST-1,sp),x
 497                     ; 143       tmpccrh |= I2C_CCRH_DUTY;
 499  015f 7b07          	ld	a,(OFST-2,sp)
 500  0161 aa40          	or	a,#64
 501  0163 6b07          	ld	(OFST-2,sp),a
 502  0165               L731:
 503                     ; 147     if (result < (uint16_t)0x01)
 505  0165 1e08          	ldw	x,(OFST-1,sp)
 506  0167 2605          	jrne	L141
 507                     ; 150       result = (uint16_t)0x0001;
 509  0169 ae0001        	ldw	x,#1
 510  016c 1f08          	ldw	(OFST-1,sp),x
 511  016e               L141:
 512                     ; 156     tmpval = ((InputClockFrequencyMHz * 3) / 10) + 1;
 514  016e 7b15          	ld	a,(OFST+12,sp)
 515  0170 97            	ld	xl,a
 516  0171 a603          	ld	a,#3
 517  0173 42            	mul	x,a
 518  0174 a60a          	ld	a,#10
 519  0176 cd0000        	call	c_sdivx
 521  0179 5c            	incw	x
 522  017a 1f05          	ldw	(OFST-4,sp),x
 523                     ; 157     I2C->TRISER = (uint8_t)tmpval;
 525  017c 7b06          	ld	a,(OFST-3,sp)
 526  017e c7521d        	ld	21021,a
 528  0181 2043          	jra	L341
 529  0183               L331:
 530                     ; 164     result = (uint16_t)((InputClockFrequencyMHz * 1000000) / (OutputClockFrequencyHz << (uint8_t)1));
 532  0183 96            	ldw	x,sp
 533  0184 1c000c        	addw	x,#OFST+3
 534  0187 cd0000        	call	c_ltor
 536  018a 3803          	sll	c_lreg+3
 537  018c 3902          	rlc	c_lreg+2
 538  018e 3901          	rlc	c_lreg+1
 539  0190 3900          	rlc	c_lreg
 540  0192 96            	ldw	x,sp
 541  0193 1c0001        	addw	x,#OFST-8
 542  0196 cd0000        	call	c_rtol
 544  0199 7b15          	ld	a,(OFST+12,sp)
 545  019b b703          	ld	c_lreg+3,a
 546  019d 3f02          	clr	c_lreg+2
 547  019f 3f01          	clr	c_lreg+1
 548  01a1 3f00          	clr	c_lreg
 549  01a3 ae0008        	ldw	x,#L25
 550  01a6 cd0000        	call	c_lmul
 552  01a9 96            	ldw	x,sp
 553  01aa 1c0001        	addw	x,#OFST-8
 554  01ad cd0000        	call	c_ludv
 556  01b0 be02          	ldw	x,c_lreg+2
 557  01b2 1f08          	ldw	(OFST-1,sp),x
 558                     ; 167     if (result < (uint16_t)0x0004)
 560  01b4 1e08          	ldw	x,(OFST-1,sp)
 561  01b6 a30004        	cpw	x,#4
 562  01b9 2405          	jruge	L541
 563                     ; 170       result = (uint16_t)0x0004;
 565  01bb ae0004        	ldw	x,#4
 566  01be 1f08          	ldw	(OFST-1,sp),x
 567  01c0               L541:
 568                     ; 176     I2C->TRISER = (uint8_t)(InputClockFrequencyMHz + (uint8_t)1);
 570  01c0 7b15          	ld	a,(OFST+12,sp)
 571  01c2 4c            	inc	a
 572  01c3 c7521d        	ld	21021,a
 573  01c6               L341:
 574                     ; 181   I2C->CCRL = (uint8_t)result;
 576  01c6 7b09          	ld	a,(OFST+0,sp)
 577  01c8 c7521b        	ld	21019,a
 578                     ; 182   I2C->CCRH = (uint8_t)((uint8_t)((uint8_t)(result >> 8) & I2C_CCRH_CCR) | tmpccrh);
 580  01cb 7b08          	ld	a,(OFST-1,sp)
 581  01cd a40f          	and	a,#15
 582  01cf 1a07          	or	a,(OFST-2,sp)
 583  01d1 c7521c        	ld	21020,a
 584                     ; 185   I2C->CR1 |= I2C_CR1_PE;
 586  01d4 72105210      	bset	21008,#0
 587                     ; 188   I2C_AcknowledgeConfig(Ack);
 589  01d8 7b13          	ld	a,(OFST+10,sp)
 590  01da cd0000        	call	_I2C_AcknowledgeConfig
 592                     ; 191   I2C->OARL = (uint8_t)(OwnAddress);
 594  01dd 7b11          	ld	a,(OFST+8,sp)
 595  01df c75213        	ld	21011,a
 596                     ; 192   I2C->OARH = (uint8_t)((uint8_t)(AddMode | I2C_OARH_ADDCONF) |
 596                     ; 193                    (uint8_t)((OwnAddress & (uint16_t)0x0300) >> (uint8_t)7));
 598  01e2 7b10          	ld	a,(OFST+7,sp)
 599  01e4 97            	ld	xl,a
 600  01e5 7b11          	ld	a,(OFST+8,sp)
 601  01e7 9f            	ld	a,xl
 602  01e8 a403          	and	a,#3
 603  01ea 97            	ld	xl,a
 604  01eb 4f            	clr	a
 605  01ec 02            	rlwa	x,a
 606  01ed a607          	ld	a,#7
 607  01ef               L45:
 608  01ef 54            	srlw	x
 609  01f0 4a            	dec	a
 610  01f1 26fc          	jrne	L45
 611  01f3 9f            	ld	a,xl
 612  01f4 6b04          	ld	(OFST-5,sp),a
 613  01f6 7b14          	ld	a,(OFST+11,sp)
 614  01f8 aa40          	or	a,#64
 615  01fa 1a04          	or	a,(OFST-5,sp)
 616  01fc c75214        	ld	21012,a
 617                     ; 194 }
 620  01ff 5b09          	addw	sp,#9
 621  0201 81            	ret
 677                     ; 202 void I2C_Cmd(FunctionalState NewState)
 677                     ; 203 {
 678                     .text:	section	.text,new
 679  0000               _I2C_Cmd:
 681  0000 88            	push	a
 682       00000000      OFST:	set	0
 685                     ; 205   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 687  0001 4d            	tnz	a
 688  0002 2704          	jreq	L46
 689  0004 a101          	cp	a,#1
 690  0006 2603          	jrne	L26
 691  0008               L46:
 692  0008 4f            	clr	a
 693  0009 2010          	jra	L66
 694  000b               L26:
 695  000b ae00cd        	ldw	x,#205
 696  000e 89            	pushw	x
 697  000f ae0000        	ldw	x,#0
 698  0012 89            	pushw	x
 699  0013 ae000c        	ldw	x,#L131
 700  0016 cd0000        	call	_assert_failed
 702  0019 5b04          	addw	sp,#4
 703  001b               L66:
 704                     ; 207   if (NewState != DISABLE)
 706  001b 0d01          	tnz	(OFST+1,sp)
 707  001d 2706          	jreq	L571
 708                     ; 210     I2C->CR1 |= I2C_CR1_PE;
 710  001f 72105210      	bset	21008,#0
 712  0023 2004          	jra	L771
 713  0025               L571:
 714                     ; 215     I2C->CR1 &= (uint8_t)(~I2C_CR1_PE);
 716  0025 72115210      	bres	21008,#0
 717  0029               L771:
 718                     ; 217 }
 721  0029 84            	pop	a
 722  002a 81            	ret
 758                     ; 225 void I2C_GeneralCallCmd(FunctionalState NewState)
 758                     ; 226 {
 759                     .text:	section	.text,new
 760  0000               _I2C_GeneralCallCmd:
 762  0000 88            	push	a
 763       00000000      OFST:	set	0
 766                     ; 228   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 768  0001 4d            	tnz	a
 769  0002 2704          	jreq	L47
 770  0004 a101          	cp	a,#1
 771  0006 2603          	jrne	L27
 772  0008               L47:
 773  0008 4f            	clr	a
 774  0009 2010          	jra	L67
 775  000b               L27:
 776  000b ae00e4        	ldw	x,#228
 777  000e 89            	pushw	x
 778  000f ae0000        	ldw	x,#0
 779  0012 89            	pushw	x
 780  0013 ae000c        	ldw	x,#L131
 781  0016 cd0000        	call	_assert_failed
 783  0019 5b04          	addw	sp,#4
 784  001b               L67:
 785                     ; 230   if (NewState != DISABLE)
 787  001b 0d01          	tnz	(OFST+1,sp)
 788  001d 2706          	jreq	L712
 789                     ; 233     I2C->CR1 |= I2C_CR1_ENGC;
 791  001f 721c5210      	bset	21008,#6
 793  0023 2004          	jra	L122
 794  0025               L712:
 795                     ; 238     I2C->CR1 &= (uint8_t)(~I2C_CR1_ENGC);
 797  0025 721d5210      	bres	21008,#6
 798  0029               L122:
 799                     ; 240 }
 802  0029 84            	pop	a
 803  002a 81            	ret
 839                     ; 250 void I2C_GenerateSTART(FunctionalState NewState)
 839                     ; 251 {
 840                     .text:	section	.text,new
 841  0000               _I2C_GenerateSTART:
 843  0000 88            	push	a
 844       00000000      OFST:	set	0
 847                     ; 253   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 849  0001 4d            	tnz	a
 850  0002 2704          	jreq	L401
 851  0004 a101          	cp	a,#1
 852  0006 2603          	jrne	L201
 853  0008               L401:
 854  0008 4f            	clr	a
 855  0009 2010          	jra	L601
 856  000b               L201:
 857  000b ae00fd        	ldw	x,#253
 858  000e 89            	pushw	x
 859  000f ae0000        	ldw	x,#0
 860  0012 89            	pushw	x
 861  0013 ae000c        	ldw	x,#L131
 862  0016 cd0000        	call	_assert_failed
 864  0019 5b04          	addw	sp,#4
 865  001b               L601:
 866                     ; 255   if (NewState != DISABLE)
 868  001b 0d01          	tnz	(OFST+1,sp)
 869  001d 2706          	jreq	L142
 870                     ; 258     I2C->CR2 |= I2C_CR2_START;
 872  001f 72105211      	bset	21009,#0
 874  0023 2004          	jra	L342
 875  0025               L142:
 876                     ; 263     I2C->CR2 &= (uint8_t)(~I2C_CR2_START);
 878  0025 72115211      	bres	21009,#0
 879  0029               L342:
 880                     ; 265 }
 883  0029 84            	pop	a
 884  002a 81            	ret
 920                     ; 273 void I2C_GenerateSTOP(FunctionalState NewState)
 920                     ; 274 {
 921                     .text:	section	.text,new
 922  0000               _I2C_GenerateSTOP:
 924  0000 88            	push	a
 925       00000000      OFST:	set	0
 928                     ; 276   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 930  0001 4d            	tnz	a
 931  0002 2704          	jreq	L411
 932  0004 a101          	cp	a,#1
 933  0006 2603          	jrne	L211
 934  0008               L411:
 935  0008 4f            	clr	a
 936  0009 2010          	jra	L611
 937  000b               L211:
 938  000b ae0114        	ldw	x,#276
 939  000e 89            	pushw	x
 940  000f ae0000        	ldw	x,#0
 941  0012 89            	pushw	x
 942  0013 ae000c        	ldw	x,#L131
 943  0016 cd0000        	call	_assert_failed
 945  0019 5b04          	addw	sp,#4
 946  001b               L611:
 947                     ; 278   if (NewState != DISABLE)
 949  001b 0d01          	tnz	(OFST+1,sp)
 950  001d 2706          	jreq	L362
 951                     ; 281     I2C->CR2 |= I2C_CR2_STOP;
 953  001f 72125211      	bset	21009,#1
 955  0023 2004          	jra	L562
 956  0025               L362:
 957                     ; 286     I2C->CR2 &= (uint8_t)(~I2C_CR2_STOP);
 959  0025 72135211      	bres	21009,#1
 960  0029               L562:
 961                     ; 288 }
 964  0029 84            	pop	a
 965  002a 81            	ret
1002                     ; 296 void I2C_SoftwareResetCmd(FunctionalState NewState)
1002                     ; 297 {
1003                     .text:	section	.text,new
1004  0000               _I2C_SoftwareResetCmd:
1006  0000 88            	push	a
1007       00000000      OFST:	set	0
1010                     ; 299   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1012  0001 4d            	tnz	a
1013  0002 2704          	jreq	L421
1014  0004 a101          	cp	a,#1
1015  0006 2603          	jrne	L221
1016  0008               L421:
1017  0008 4f            	clr	a
1018  0009 2010          	jra	L621
1019  000b               L221:
1020  000b ae012b        	ldw	x,#299
1021  000e 89            	pushw	x
1022  000f ae0000        	ldw	x,#0
1023  0012 89            	pushw	x
1024  0013 ae000c        	ldw	x,#L131
1025  0016 cd0000        	call	_assert_failed
1027  0019 5b04          	addw	sp,#4
1028  001b               L621:
1029                     ; 301   if (NewState != DISABLE)
1031  001b 0d01          	tnz	(OFST+1,sp)
1032  001d 2706          	jreq	L503
1033                     ; 304     I2C->CR2 |= I2C_CR2_SWRST;
1035  001f 721e5211      	bset	21009,#7
1037  0023 2004          	jra	L703
1038  0025               L503:
1039                     ; 309     I2C->CR2 &= (uint8_t)(~I2C_CR2_SWRST);
1041  0025 721f5211      	bres	21009,#7
1042  0029               L703:
1043                     ; 311 }
1046  0029 84            	pop	a
1047  002a 81            	ret
1084                     ; 320 void I2C_StretchClockCmd(FunctionalState NewState)
1084                     ; 321 {
1085                     .text:	section	.text,new
1086  0000               _I2C_StretchClockCmd:
1088  0000 88            	push	a
1089       00000000      OFST:	set	0
1092                     ; 323   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1094  0001 4d            	tnz	a
1095  0002 2704          	jreq	L431
1096  0004 a101          	cp	a,#1
1097  0006 2603          	jrne	L231
1098  0008               L431:
1099  0008 4f            	clr	a
1100  0009 2010          	jra	L631
1101  000b               L231:
1102  000b ae0143        	ldw	x,#323
1103  000e 89            	pushw	x
1104  000f ae0000        	ldw	x,#0
1105  0012 89            	pushw	x
1106  0013 ae000c        	ldw	x,#L131
1107  0016 cd0000        	call	_assert_failed
1109  0019 5b04          	addw	sp,#4
1110  001b               L631:
1111                     ; 325   if (NewState != DISABLE)
1113  001b 0d01          	tnz	(OFST+1,sp)
1114  001d 2706          	jreq	L723
1115                     ; 328     I2C->CR1 &= (uint8_t)(~I2C_CR1_NOSTRETCH);
1117  001f 721f5210      	bres	21008,#7
1119  0023 2004          	jra	L133
1120  0025               L723:
1121                     ; 334     I2C->CR1 |= I2C_CR1_NOSTRETCH;
1123  0025 721e5210      	bset	21008,#7
1124  0029               L133:
1125                     ; 336 }
1128  0029 84            	pop	a
1129  002a 81            	ret
1166                     ; 345 void I2C_AcknowledgeConfig(I2C_Ack_TypeDef Ack)
1166                     ; 346 {
1167                     .text:	section	.text,new
1168  0000               _I2C_AcknowledgeConfig:
1170  0000 88            	push	a
1171       00000000      OFST:	set	0
1174                     ; 348   assert_param(IS_I2C_ACK_OK(Ack));
1176  0001 4d            	tnz	a
1177  0002 2708          	jreq	L441
1178  0004 a101          	cp	a,#1
1179  0006 2704          	jreq	L441
1180  0008 a102          	cp	a,#2
1181  000a 2603          	jrne	L241
1182  000c               L441:
1183  000c 4f            	clr	a
1184  000d 2010          	jra	L641
1185  000f               L241:
1186  000f ae015c        	ldw	x,#348
1187  0012 89            	pushw	x
1188  0013 ae0000        	ldw	x,#0
1189  0016 89            	pushw	x
1190  0017 ae000c        	ldw	x,#L131
1191  001a cd0000        	call	_assert_failed
1193  001d 5b04          	addw	sp,#4
1194  001f               L641:
1195                     ; 350   if (Ack == I2C_ACK_NONE)
1197  001f 0d01          	tnz	(OFST+1,sp)
1198  0021 2606          	jrne	L153
1199                     ; 353     I2C->CR2 &= (uint8_t)(~I2C_CR2_ACK);
1201  0023 72155211      	bres	21009,#2
1203  0027 2014          	jra	L353
1204  0029               L153:
1205                     ; 358     I2C->CR2 |= I2C_CR2_ACK;
1207  0029 72145211      	bset	21009,#2
1208                     ; 360     if (Ack == I2C_ACK_CURR)
1210  002d 7b01          	ld	a,(OFST+1,sp)
1211  002f a101          	cp	a,#1
1212  0031 2606          	jrne	L553
1213                     ; 363       I2C->CR2 &= (uint8_t)(~I2C_CR2_POS);
1215  0033 72175211      	bres	21009,#3
1217  0037 2004          	jra	L353
1218  0039               L553:
1219                     ; 368       I2C->CR2 |= I2C_CR2_POS;
1221  0039 72165211      	bset	21009,#3
1222  003d               L353:
1223                     ; 371 }
1226  003d 84            	pop	a
1227  003e 81            	ret
1300                     ; 381 void I2C_ITConfig(I2C_IT_TypeDef I2C_IT, FunctionalState NewState)
1300                     ; 382 {
1301                     .text:	section	.text,new
1302  0000               _I2C_ITConfig:
1304  0000 89            	pushw	x
1305       00000000      OFST:	set	0
1308                     ; 384   assert_param(IS_I2C_INTERRUPT_OK(I2C_IT));
1310  0001 9e            	ld	a,xh
1311  0002 a101          	cp	a,#1
1312  0004 271e          	jreq	L451
1313  0006 9e            	ld	a,xh
1314  0007 a102          	cp	a,#2
1315  0009 2719          	jreq	L451
1316  000b 9e            	ld	a,xh
1317  000c a104          	cp	a,#4
1318  000e 2714          	jreq	L451
1319  0010 9e            	ld	a,xh
1320  0011 a103          	cp	a,#3
1321  0013 270f          	jreq	L451
1322  0015 9e            	ld	a,xh
1323  0016 a105          	cp	a,#5
1324  0018 270a          	jreq	L451
1325  001a 9e            	ld	a,xh
1326  001b a106          	cp	a,#6
1327  001d 2705          	jreq	L451
1328  001f 9e            	ld	a,xh
1329  0020 a107          	cp	a,#7
1330  0022 2603          	jrne	L251
1331  0024               L451:
1332  0024 4f            	clr	a
1333  0025 2010          	jra	L651
1334  0027               L251:
1335  0027 ae0180        	ldw	x,#384
1336  002a 89            	pushw	x
1337  002b ae0000        	ldw	x,#0
1338  002e 89            	pushw	x
1339  002f ae000c        	ldw	x,#L131
1340  0032 cd0000        	call	_assert_failed
1342  0035 5b04          	addw	sp,#4
1343  0037               L651:
1344                     ; 385   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1346  0037 0d02          	tnz	(OFST+2,sp)
1347  0039 2706          	jreq	L261
1348  003b 7b02          	ld	a,(OFST+2,sp)
1349  003d a101          	cp	a,#1
1350  003f 2603          	jrne	L061
1351  0041               L261:
1352  0041 4f            	clr	a
1353  0042 2010          	jra	L461
1354  0044               L061:
1355  0044 ae0181        	ldw	x,#385
1356  0047 89            	pushw	x
1357  0048 ae0000        	ldw	x,#0
1358  004b 89            	pushw	x
1359  004c ae000c        	ldw	x,#L131
1360  004f cd0000        	call	_assert_failed
1362  0052 5b04          	addw	sp,#4
1363  0054               L461:
1364                     ; 387   if (NewState != DISABLE)
1366  0054 0d02          	tnz	(OFST+2,sp)
1367  0056 270a          	jreq	L514
1368                     ; 390     I2C->ITR |= (uint8_t)I2C_IT;
1370  0058 c6521a        	ld	a,21018
1371  005b 1a01          	or	a,(OFST+1,sp)
1372  005d c7521a        	ld	21018,a
1374  0060 2009          	jra	L714
1375  0062               L514:
1376                     ; 395     I2C->ITR &= (uint8_t)(~(uint8_t)I2C_IT);
1378  0062 7b01          	ld	a,(OFST+1,sp)
1379  0064 43            	cpl	a
1380  0065 c4521a        	and	a,21018
1381  0068 c7521a        	ld	21018,a
1382  006b               L714:
1383                     ; 397 }
1386  006b 85            	popw	x
1387  006c 81            	ret
1424                     ; 405 void I2C_FastModeDutyCycleConfig(I2C_DutyCycle_TypeDef I2C_DutyCycle)
1424                     ; 406 {
1425                     .text:	section	.text,new
1426  0000               _I2C_FastModeDutyCycleConfig:
1428  0000 88            	push	a
1429       00000000      OFST:	set	0
1432                     ; 408   assert_param(IS_I2C_DUTYCYCLE_OK(I2C_DutyCycle));
1434  0001 4d            	tnz	a
1435  0002 2704          	jreq	L271
1436  0004 a140          	cp	a,#64
1437  0006 2603          	jrne	L071
1438  0008               L271:
1439  0008 4f            	clr	a
1440  0009 2010          	jra	L471
1441  000b               L071:
1442  000b ae0198        	ldw	x,#408
1443  000e 89            	pushw	x
1444  000f ae0000        	ldw	x,#0
1445  0012 89            	pushw	x
1446  0013 ae000c        	ldw	x,#L131
1447  0016 cd0000        	call	_assert_failed
1449  0019 5b04          	addw	sp,#4
1450  001b               L471:
1451                     ; 410   if (I2C_DutyCycle == I2C_DUTYCYCLE_16_9)
1453  001b 7b01          	ld	a,(OFST+1,sp)
1454  001d a140          	cp	a,#64
1455  001f 2606          	jrne	L734
1456                     ; 413     I2C->CCRH |= I2C_CCRH_DUTY;
1458  0021 721c521c      	bset	21020,#6
1460  0025 2004          	jra	L144
1461  0027               L734:
1462                     ; 418     I2C->CCRH &= (uint8_t)(~I2C_CCRH_DUTY);
1464  0027 721d521c      	bres	21020,#6
1465  002b               L144:
1466                     ; 420 }
1469  002b 84            	pop	a
1470  002c 81            	ret
1493                     ; 427 uint8_t I2C_ReceiveData(void)
1493                     ; 428 {
1494                     .text:	section	.text,new
1495  0000               _I2C_ReceiveData:
1499                     ; 430   return ((uint8_t)I2C->DR);
1501  0000 c65216        	ld	a,21014
1504  0003 81            	ret
1570                     ; 440 void I2C_Send7bitAddress(uint8_t Address, I2C_Direction_TypeDef Direction)
1570                     ; 441 {
1571                     .text:	section	.text,new
1572  0000               _I2C_Send7bitAddress:
1574  0000 89            	pushw	x
1575       00000000      OFST:	set	0
1578                     ; 443   assert_param(IS_I2C_ADDRESS_OK(Address));
1580  0001 9e            	ld	a,xh
1581  0002 a501          	bcp	a,#1
1582  0004 2603          	jrne	L202
1583  0006 4f            	clr	a
1584  0007 2010          	jra	L402
1585  0009               L202:
1586  0009 ae01bb        	ldw	x,#443
1587  000c 89            	pushw	x
1588  000d ae0000        	ldw	x,#0
1589  0010 89            	pushw	x
1590  0011 ae000c        	ldw	x,#L131
1591  0014 cd0000        	call	_assert_failed
1593  0017 5b04          	addw	sp,#4
1594  0019               L402:
1595                     ; 444   assert_param(IS_I2C_DIRECTION_OK(Direction));
1597  0019 0d02          	tnz	(OFST+2,sp)
1598  001b 2706          	jreq	L012
1599  001d 7b02          	ld	a,(OFST+2,sp)
1600  001f a101          	cp	a,#1
1601  0021 2603          	jrne	L602
1602  0023               L012:
1603  0023 4f            	clr	a
1604  0024 2010          	jra	L212
1605  0026               L602:
1606  0026 ae01bc        	ldw	x,#444
1607  0029 89            	pushw	x
1608  002a ae0000        	ldw	x,#0
1609  002d 89            	pushw	x
1610  002e ae000c        	ldw	x,#L131
1611  0031 cd0000        	call	_assert_failed
1613  0034 5b04          	addw	sp,#4
1614  0036               L212:
1615                     ; 447   Address &= (uint8_t)0xFE;
1617  0036 7b01          	ld	a,(OFST+1,sp)
1618  0038 a4fe          	and	a,#254
1619  003a 6b01          	ld	(OFST+1,sp),a
1620                     ; 450   I2C->DR = (uint8_t)(Address | (uint8_t)Direction);
1622  003c 7b01          	ld	a,(OFST+1,sp)
1623  003e 1a02          	or	a,(OFST+2,sp)
1624  0040 c75216        	ld	21014,a
1625                     ; 451 }
1628  0043 85            	popw	x
1629  0044 81            	ret
1663                     ; 458 void I2C_SendData(uint8_t Data)
1663                     ; 459 {
1664                     .text:	section	.text,new
1665  0000               _I2C_SendData:
1669                     ; 461   I2C->DR = Data;
1671  0000 c75216        	ld	21014,a
1672                     ; 462 }
1675  0003 81            	ret
1900                     ; 578 ErrorStatus I2C_CheckEvent(I2C_Event_TypeDef I2C_Event)
1900                     ; 579 {
1901                     .text:	section	.text,new
1902  0000               _I2C_CheckEvent:
1904  0000 89            	pushw	x
1905  0001 5206          	subw	sp,#6
1906       00000006      OFST:	set	6
1909                     ; 580   __IO uint16_t lastevent = 0x00;
1911  0003 5f            	clrw	x
1912  0004 1f04          	ldw	(OFST-2,sp),x
1913                     ; 581   uint8_t flag1 = 0x00 ;
1915  0006 7b03          	ld	a,(OFST-3,sp)
1916  0008 97            	ld	xl,a
1917                     ; 582   uint8_t flag2 = 0x00;
1919  0009 7b06          	ld	a,(OFST+0,sp)
1920  000b 97            	ld	xl,a
1921                     ; 583   ErrorStatus status = ERROR;
1923  000c 7b06          	ld	a,(OFST+0,sp)
1924  000e 97            	ld	xl,a
1925                     ; 586   assert_param(IS_I2C_EVENT_OK(I2C_Event));
1927  000f 1e07          	ldw	x,(OFST+1,sp)
1928  0011 a30682        	cpw	x,#1666
1929  0014 2769          	jreq	L222
1930  0016 1e07          	ldw	x,(OFST+1,sp)
1931  0018 a30202        	cpw	x,#514
1932  001b 2762          	jreq	L222
1933  001d 1e07          	ldw	x,(OFST+1,sp)
1934  001f a31200        	cpw	x,#4608
1935  0022 275b          	jreq	L222
1936  0024 1e07          	ldw	x,(OFST+1,sp)
1937  0026 a30240        	cpw	x,#576
1938  0029 2754          	jreq	L222
1939  002b 1e07          	ldw	x,(OFST+1,sp)
1940  002d a30350        	cpw	x,#848
1941  0030 274d          	jreq	L222
1942  0032 1e07          	ldw	x,(OFST+1,sp)
1943  0034 a30684        	cpw	x,#1668
1944  0037 2746          	jreq	L222
1945  0039 1e07          	ldw	x,(OFST+1,sp)
1946  003b a30794        	cpw	x,#1940
1947  003e 273f          	jreq	L222
1948  0040 1e07          	ldw	x,(OFST+1,sp)
1949  0042 a30004        	cpw	x,#4
1950  0045 2738          	jreq	L222
1951  0047 1e07          	ldw	x,(OFST+1,sp)
1952  0049 a30010        	cpw	x,#16
1953  004c 2731          	jreq	L222
1954  004e 1e07          	ldw	x,(OFST+1,sp)
1955  0050 a30301        	cpw	x,#769
1956  0053 272a          	jreq	L222
1957  0055 1e07          	ldw	x,(OFST+1,sp)
1958  0057 a30782        	cpw	x,#1922
1959  005a 2723          	jreq	L222
1960  005c 1e07          	ldw	x,(OFST+1,sp)
1961  005e a30302        	cpw	x,#770
1962  0061 271c          	jreq	L222
1963  0063 1e07          	ldw	x,(OFST+1,sp)
1964  0065 a30340        	cpw	x,#832
1965  0068 2715          	jreq	L222
1966  006a 1e07          	ldw	x,(OFST+1,sp)
1967  006c a30784        	cpw	x,#1924
1968  006f 270e          	jreq	L222
1969  0071 1e07          	ldw	x,(OFST+1,sp)
1970  0073 a30780        	cpw	x,#1920
1971  0076 2707          	jreq	L222
1972  0078 1e07          	ldw	x,(OFST+1,sp)
1973  007a a30308        	cpw	x,#776
1974  007d 2603          	jrne	L022
1975  007f               L222:
1976  007f 4f            	clr	a
1977  0080 2010          	jra	L422
1978  0082               L022:
1979  0082 ae024a        	ldw	x,#586
1980  0085 89            	pushw	x
1981  0086 ae0000        	ldw	x,#0
1982  0089 89            	pushw	x
1983  008a ae000c        	ldw	x,#L131
1984  008d cd0000        	call	_assert_failed
1986  0090 5b04          	addw	sp,#4
1987  0092               L422:
1988                     ; 588   if (I2C_Event == I2C_EVENT_SLAVE_ACK_FAILURE)
1990  0092 1e07          	ldw	x,(OFST+1,sp)
1991  0094 a30004        	cpw	x,#4
1992  0097 260b          	jrne	L336
1993                     ; 590     lastevent = I2C->SR2 & I2C_SR2_AF;
1995  0099 c65218        	ld	a,21016
1996  009c a404          	and	a,#4
1997  009e 5f            	clrw	x
1998  009f 97            	ld	xl,a
1999  00a0 1f04          	ldw	(OFST-2,sp),x
2001  00a2 201f          	jra	L536
2002  00a4               L336:
2003                     ; 594     flag1 = I2C->SR1;
2005  00a4 c65217        	ld	a,21015
2006  00a7 6b03          	ld	(OFST-3,sp),a
2007                     ; 595     flag2 = I2C->SR3;
2009  00a9 c65219        	ld	a,21017
2010  00ac 6b06          	ld	(OFST+0,sp),a
2011                     ; 596     lastevent = ((uint16_t)((uint16_t)flag2 << (uint16_t)8) | (uint16_t)flag1);
2013  00ae 7b03          	ld	a,(OFST-3,sp)
2014  00b0 5f            	clrw	x
2015  00b1 97            	ld	xl,a
2016  00b2 1f01          	ldw	(OFST-5,sp),x
2017  00b4 7b06          	ld	a,(OFST+0,sp)
2018  00b6 5f            	clrw	x
2019  00b7 97            	ld	xl,a
2020  00b8 4f            	clr	a
2021  00b9 02            	rlwa	x,a
2022  00ba 01            	rrwa	x,a
2023  00bb 1a02          	or	a,(OFST-4,sp)
2024  00bd 01            	rrwa	x,a
2025  00be 1a01          	or	a,(OFST-5,sp)
2026  00c0 01            	rrwa	x,a
2027  00c1 1f04          	ldw	(OFST-2,sp),x
2028  00c3               L536:
2029                     ; 599   if (((uint16_t)lastevent & (uint16_t)I2C_Event) == (uint16_t)I2C_Event)
2031  00c3 1e04          	ldw	x,(OFST-2,sp)
2032  00c5 01            	rrwa	x,a
2033  00c6 1408          	and	a,(OFST+2,sp)
2034  00c8 01            	rrwa	x,a
2035  00c9 1407          	and	a,(OFST+1,sp)
2036  00cb 01            	rrwa	x,a
2037  00cc 1307          	cpw	x,(OFST+1,sp)
2038  00ce 2606          	jrne	L736
2039                     ; 602     status = SUCCESS;
2041  00d0 a601          	ld	a,#1
2042  00d2 6b06          	ld	(OFST+0,sp),a
2044  00d4 2002          	jra	L146
2045  00d6               L736:
2046                     ; 607     status = ERROR;
2048  00d6 0f06          	clr	(OFST+0,sp)
2049  00d8               L146:
2050                     ; 611   return status;
2052  00d8 7b06          	ld	a,(OFST+0,sp)
2055  00da 5b08          	addw	sp,#8
2056  00dc 81            	ret
2109                     ; 628 I2C_Event_TypeDef I2C_GetLastEvent(void)
2109                     ; 629 {
2110                     .text:	section	.text,new
2111  0000               _I2C_GetLastEvent:
2113  0000 5206          	subw	sp,#6
2114       00000006      OFST:	set	6
2117                     ; 630   __IO uint16_t lastevent = 0;
2119  0002 5f            	clrw	x
2120  0003 1f05          	ldw	(OFST-1,sp),x
2121                     ; 631   uint16_t flag1 = 0;
2123  0005 1e01          	ldw	x,(OFST-5,sp)
2124                     ; 632   uint16_t flag2 = 0;
2126  0007 1e03          	ldw	x,(OFST-3,sp)
2127                     ; 634   if ((I2C->SR2 & I2C_SR2_AF) != 0x00)
2129  0009 c65218        	ld	a,21016
2130  000c a504          	bcp	a,#4
2131  000e 2707          	jreq	L176
2132                     ; 636     lastevent = I2C_EVENT_SLAVE_ACK_FAILURE;
2134  0010 ae0004        	ldw	x,#4
2135  0013 1f05          	ldw	(OFST-1,sp),x
2137  0015 201b          	jra	L376
2138  0017               L176:
2139                     ; 641     flag1 = I2C->SR1;
2141  0017 c65217        	ld	a,21015
2142  001a 5f            	clrw	x
2143  001b 97            	ld	xl,a
2144  001c 1f01          	ldw	(OFST-5,sp),x
2145                     ; 642     flag2 = I2C->SR3;
2147  001e c65219        	ld	a,21017
2148  0021 5f            	clrw	x
2149  0022 97            	ld	xl,a
2150  0023 1f03          	ldw	(OFST-3,sp),x
2151                     ; 645     lastevent = ((uint16_t)((uint16_t)flag2 << 8) | (uint16_t)flag1);
2153  0025 1e03          	ldw	x,(OFST-3,sp)
2154  0027 4f            	clr	a
2155  0028 02            	rlwa	x,a
2156  0029 01            	rrwa	x,a
2157  002a 1a02          	or	a,(OFST-4,sp)
2158  002c 01            	rrwa	x,a
2159  002d 1a01          	or	a,(OFST-5,sp)
2160  002f 01            	rrwa	x,a
2161  0030 1f05          	ldw	(OFST-1,sp),x
2162  0032               L376:
2163                     ; 648   return (I2C_Event_TypeDef)lastevent;
2165  0032 1e05          	ldw	x,(OFST-1,sp)
2168  0034 5b06          	addw	sp,#6
2169  0036 81            	ret
2385                     ; 679 FlagStatus I2C_GetFlagStatus(I2C_Flag_TypeDef I2C_Flag)
2385                     ; 680 {
2386                     .text:	section	.text,new
2387  0000               _I2C_GetFlagStatus:
2389  0000 89            	pushw	x
2390  0001 89            	pushw	x
2391       00000002      OFST:	set	2
2394                     ; 681   uint8_t tempreg = 0;
2396  0002 0f02          	clr	(OFST+0,sp)
2397                     ; 682   uint8_t regindex = 0;
2399  0004 7b01          	ld	a,(OFST-1,sp)
2400  0006 97            	ld	xl,a
2401                     ; 683   FlagStatus bitstatus = RESET;
2403  0007 7b02          	ld	a,(OFST+0,sp)
2404  0009 97            	ld	xl,a
2405                     ; 686   assert_param(IS_I2C_FLAG_OK(I2C_Flag));
2407  000a 1e03          	ldw	x,(OFST+1,sp)
2408  000c a30180        	cpw	x,#384
2409  000f 2769          	jreq	L432
2410  0011 1e03          	ldw	x,(OFST+1,sp)
2411  0013 a30140        	cpw	x,#320
2412  0016 2762          	jreq	L432
2413  0018 1e03          	ldw	x,(OFST+1,sp)
2414  001a a30110        	cpw	x,#272
2415  001d 275b          	jreq	L432
2416  001f 1e03          	ldw	x,(OFST+1,sp)
2417  0021 a30108        	cpw	x,#264
2418  0024 2754          	jreq	L432
2419  0026 1e03          	ldw	x,(OFST+1,sp)
2420  0028 a30104        	cpw	x,#260
2421  002b 274d          	jreq	L432
2422  002d 1e03          	ldw	x,(OFST+1,sp)
2423  002f a30102        	cpw	x,#258
2424  0032 2746          	jreq	L432
2425  0034 1e03          	ldw	x,(OFST+1,sp)
2426  0036 a30101        	cpw	x,#257
2427  0039 273f          	jreq	L432
2428  003b 1e03          	ldw	x,(OFST+1,sp)
2429  003d a30220        	cpw	x,#544
2430  0040 2738          	jreq	L432
2431  0042 1e03          	ldw	x,(OFST+1,sp)
2432  0044 a30208        	cpw	x,#520
2433  0047 2731          	jreq	L432
2434  0049 1e03          	ldw	x,(OFST+1,sp)
2435  004b a30204        	cpw	x,#516
2436  004e 272a          	jreq	L432
2437  0050 1e03          	ldw	x,(OFST+1,sp)
2438  0052 a30202        	cpw	x,#514
2439  0055 2723          	jreq	L432
2440  0057 1e03          	ldw	x,(OFST+1,sp)
2441  0059 a30201        	cpw	x,#513
2442  005c 271c          	jreq	L432
2443  005e 1e03          	ldw	x,(OFST+1,sp)
2444  0060 a30310        	cpw	x,#784
2445  0063 2715          	jreq	L432
2446  0065 1e03          	ldw	x,(OFST+1,sp)
2447  0067 a30304        	cpw	x,#772
2448  006a 270e          	jreq	L432
2449  006c 1e03          	ldw	x,(OFST+1,sp)
2450  006e a30302        	cpw	x,#770
2451  0071 2707          	jreq	L432
2452  0073 1e03          	ldw	x,(OFST+1,sp)
2453  0075 a30301        	cpw	x,#769
2454  0078 2603          	jrne	L232
2455  007a               L432:
2456  007a 4f            	clr	a
2457  007b 2010          	jra	L632
2458  007d               L232:
2459  007d ae02ae        	ldw	x,#686
2460  0080 89            	pushw	x
2461  0081 ae0000        	ldw	x,#0
2462  0084 89            	pushw	x
2463  0085 ae000c        	ldw	x,#L131
2464  0088 cd0000        	call	_assert_failed
2466  008b 5b04          	addw	sp,#4
2467  008d               L632:
2468                     ; 689   regindex = (uint8_t)((uint16_t)I2C_Flag >> 8);
2470  008d 7b03          	ld	a,(OFST+1,sp)
2471  008f 6b01          	ld	(OFST-1,sp),a
2472                     ; 691   switch (regindex)
2474  0091 7b01          	ld	a,(OFST-1,sp)
2476                     ; 708     default:
2476                     ; 709       break;
2477  0093 4a            	dec	a
2478  0094 2708          	jreq	L576
2479  0096 4a            	dec	a
2480  0097 270c          	jreq	L776
2481  0099 4a            	dec	a
2482  009a 2710          	jreq	L107
2483  009c 2013          	jra	L5101
2484  009e               L576:
2485                     ; 694     case 0x01:
2485                     ; 695       tempreg = (uint8_t)I2C->SR1;
2487  009e c65217        	ld	a,21015
2488  00a1 6b02          	ld	(OFST+0,sp),a
2489                     ; 696       break;
2491  00a3 200c          	jra	L5101
2492  00a5               L776:
2493                     ; 699     case 0x02:
2493                     ; 700       tempreg = (uint8_t)I2C->SR2;
2495  00a5 c65218        	ld	a,21016
2496  00a8 6b02          	ld	(OFST+0,sp),a
2497                     ; 701       break;
2499  00aa 2005          	jra	L5101
2500  00ac               L107:
2501                     ; 704     case 0x03:
2501                     ; 705       tempreg = (uint8_t)I2C->SR3;
2503  00ac c65219        	ld	a,21017
2504  00af 6b02          	ld	(OFST+0,sp),a
2505                     ; 706       break;
2507  00b1               L307:
2508                     ; 708     default:
2508                     ; 709       break;
2510  00b1               L5101:
2511                     ; 713   if ((tempreg & (uint8_t)I2C_Flag ) != 0)
2513  00b1 7b04          	ld	a,(OFST+2,sp)
2514  00b3 1502          	bcp	a,(OFST+0,sp)
2515  00b5 2706          	jreq	L7101
2516                     ; 716     bitstatus = SET;
2518  00b7 a601          	ld	a,#1
2519  00b9 6b02          	ld	(OFST+0,sp),a
2521  00bb 2002          	jra	L1201
2522  00bd               L7101:
2523                     ; 721     bitstatus = RESET;
2525  00bd 0f02          	clr	(OFST+0,sp)
2526  00bf               L1201:
2527                     ; 724   return bitstatus;
2529  00bf 7b02          	ld	a,(OFST+0,sp)
2532  00c1 5b04          	addw	sp,#4
2533  00c3 81            	ret
2578                     ; 759 void I2C_ClearFlag(I2C_Flag_TypeDef I2C_FLAG)
2578                     ; 760 {
2579                     .text:	section	.text,new
2580  0000               _I2C_ClearFlag:
2582  0000 89            	pushw	x
2583  0001 89            	pushw	x
2584       00000002      OFST:	set	2
2587                     ; 761   uint16_t flagpos = 0;
2589  0002 5f            	clrw	x
2590  0003 1f01          	ldw	(OFST-1,sp),x
2591                     ; 763   assert_param(IS_I2C_CLEAR_FLAG_OK(I2C_FLAG));
2593  0005 7b03          	ld	a,(OFST+1,sp)
2594  0007 a5fd          	bcp	a,#253
2595  0009 2607          	jrne	L242
2596  000b 1e03          	ldw	x,(OFST+1,sp)
2597  000d 2703          	jreq	L242
2598  000f 4f            	clr	a
2599  0010 2010          	jra	L442
2600  0012               L242:
2601  0012 ae02fb        	ldw	x,#763
2602  0015 89            	pushw	x
2603  0016 ae0000        	ldw	x,#0
2604  0019 89            	pushw	x
2605  001a ae000c        	ldw	x,#L131
2606  001d cd0000        	call	_assert_failed
2608  0020 5b04          	addw	sp,#4
2609  0022               L442:
2610                     ; 766   flagpos = (uint16_t)I2C_FLAG & FLAG_Mask;
2612  0022 7b03          	ld	a,(OFST+1,sp)
2613  0024 97            	ld	xl,a
2614  0025 7b04          	ld	a,(OFST+2,sp)
2615  0027 a4ff          	and	a,#255
2616  0029 5f            	clrw	x
2617  002a 02            	rlwa	x,a
2618  002b 1f01          	ldw	(OFST-1,sp),x
2619  002d 01            	rrwa	x,a
2620                     ; 768   I2C->SR2 = (uint8_t)((uint16_t)(~flagpos));
2622  002e 7b02          	ld	a,(OFST+0,sp)
2623  0030 43            	cpl	a
2624  0031 c75218        	ld	21016,a
2625                     ; 769 }
2628  0034 5b04          	addw	sp,#4
2629  0036 81            	ret
2796                     ; 791 ITStatus I2C_GetITStatus(I2C_ITPendingBit_TypeDef I2C_ITPendingBit)
2796                     ; 792 {
2797                     .text:	section	.text,new
2798  0000               _I2C_GetITStatus:
2800  0000 89            	pushw	x
2801  0001 5204          	subw	sp,#4
2802       00000004      OFST:	set	4
2805                     ; 793   ITStatus bitstatus = RESET;
2807  0003 7b04          	ld	a,(OFST+0,sp)
2808  0005 97            	ld	xl,a
2809                     ; 794   __IO uint8_t enablestatus = 0;
2811  0006 0f03          	clr	(OFST-1,sp)
2812                     ; 795   uint16_t tempregister = 0;
2814  0008 1e01          	ldw	x,(OFST-3,sp)
2815                     ; 798     assert_param(IS_I2C_ITPENDINGBIT_OK(I2C_ITPendingBit));
2817  000a 1e05          	ldw	x,(OFST+1,sp)
2818  000c a31680        	cpw	x,#5760
2819  000f 274d          	jreq	L252
2820  0011 1e05          	ldw	x,(OFST+1,sp)
2821  0013 a31640        	cpw	x,#5696
2822  0016 2746          	jreq	L252
2823  0018 1e05          	ldw	x,(OFST+1,sp)
2824  001a a31210        	cpw	x,#4624
2825  001d 273f          	jreq	L252
2826  001f 1e05          	ldw	x,(OFST+1,sp)
2827  0021 a31208        	cpw	x,#4616
2828  0024 2738          	jreq	L252
2829  0026 1e05          	ldw	x,(OFST+1,sp)
2830  0028 a31204        	cpw	x,#4612
2831  002b 2731          	jreq	L252
2832  002d 1e05          	ldw	x,(OFST+1,sp)
2833  002f a31202        	cpw	x,#4610
2834  0032 272a          	jreq	L252
2835  0034 1e05          	ldw	x,(OFST+1,sp)
2836  0036 a31201        	cpw	x,#4609
2837  0039 2723          	jreq	L252
2838  003b 1e05          	ldw	x,(OFST+1,sp)
2839  003d a32220        	cpw	x,#8736
2840  0040 271c          	jreq	L252
2841  0042 1e05          	ldw	x,(OFST+1,sp)
2842  0044 a32108        	cpw	x,#8456
2843  0047 2715          	jreq	L252
2844  0049 1e05          	ldw	x,(OFST+1,sp)
2845  004b a32104        	cpw	x,#8452
2846  004e 270e          	jreq	L252
2847  0050 1e05          	ldw	x,(OFST+1,sp)
2848  0052 a32102        	cpw	x,#8450
2849  0055 2707          	jreq	L252
2850  0057 1e05          	ldw	x,(OFST+1,sp)
2851  0059 a32101        	cpw	x,#8449
2852  005c 2603          	jrne	L052
2853  005e               L252:
2854  005e 4f            	clr	a
2855  005f 2010          	jra	L452
2856  0061               L052:
2857  0061 ae031e        	ldw	x,#798
2858  0064 89            	pushw	x
2859  0065 ae0000        	ldw	x,#0
2860  0068 89            	pushw	x
2861  0069 ae000c        	ldw	x,#L131
2862  006c cd0000        	call	_assert_failed
2864  006f 5b04          	addw	sp,#4
2865  0071               L452:
2866                     ; 800   tempregister = (uint8_t)( ((uint16_t)((uint16_t)I2C_ITPendingBit & ITEN_Mask)) >> 8);
2868  0071 7b05          	ld	a,(OFST+1,sp)
2869  0073 97            	ld	xl,a
2870  0074 7b06          	ld	a,(OFST+2,sp)
2871  0076 9f            	ld	a,xl
2872  0077 a407          	and	a,#7
2873  0079 97            	ld	xl,a
2874  007a 4f            	clr	a
2875  007b 02            	rlwa	x,a
2876  007c 4f            	clr	a
2877  007d 01            	rrwa	x,a
2878  007e 9f            	ld	a,xl
2879  007f 5f            	clrw	x
2880  0080 97            	ld	xl,a
2881  0081 1f01          	ldw	(OFST-3,sp),x
2882                     ; 803   enablestatus = (uint8_t)(I2C->ITR & ( uint8_t)tempregister);
2884  0083 c6521a        	ld	a,21018
2885  0086 1402          	and	a,(OFST-2,sp)
2886  0088 6b03          	ld	(OFST-1,sp),a
2887                     ; 805   if ((uint16_t)((uint16_t)I2C_ITPendingBit & REGISTER_Mask) == REGISTER_SR1_Index)
2889  008a 7b05          	ld	a,(OFST+1,sp)
2890  008c 97            	ld	xl,a
2891  008d 7b06          	ld	a,(OFST+2,sp)
2892  008f 9f            	ld	a,xl
2893  0090 a430          	and	a,#48
2894  0092 97            	ld	xl,a
2895  0093 4f            	clr	a
2896  0094 02            	rlwa	x,a
2897  0095 a30100        	cpw	x,#256
2898  0098 2615          	jrne	L3311
2899                     ; 808     if (((I2C->SR1 & (uint8_t)I2C_ITPendingBit) != RESET) && enablestatus)
2901  009a c65217        	ld	a,21015
2902  009d 1506          	bcp	a,(OFST+2,sp)
2903  009f 270a          	jreq	L5311
2905  00a1 0d03          	tnz	(OFST-1,sp)
2906  00a3 2706          	jreq	L5311
2907                     ; 811       bitstatus = SET;
2909  00a5 a601          	ld	a,#1
2910  00a7 6b04          	ld	(OFST+0,sp),a
2912  00a9 2017          	jra	L1411
2913  00ab               L5311:
2914                     ; 816       bitstatus = RESET;
2916  00ab 0f04          	clr	(OFST+0,sp)
2917  00ad 2013          	jra	L1411
2918  00af               L3311:
2919                     ; 822     if (((I2C->SR2 & (uint8_t)I2C_ITPendingBit) != RESET) && enablestatus)
2921  00af c65218        	ld	a,21016
2922  00b2 1506          	bcp	a,(OFST+2,sp)
2923  00b4 270a          	jreq	L3411
2925  00b6 0d03          	tnz	(OFST-1,sp)
2926  00b8 2706          	jreq	L3411
2927                     ; 825       bitstatus = SET;
2929  00ba a601          	ld	a,#1
2930  00bc 6b04          	ld	(OFST+0,sp),a
2932  00be 2002          	jra	L1411
2933  00c0               L3411:
2934                     ; 830       bitstatus = RESET;
2936  00c0 0f04          	clr	(OFST+0,sp)
2937  00c2               L1411:
2938                     ; 834   return  bitstatus;
2940  00c2 7b04          	ld	a,(OFST+0,sp)
2943  00c4 5b06          	addw	sp,#6
2944  00c6 81            	ret
2990                     ; 871 void I2C_ClearITPendingBit(I2C_ITPendingBit_TypeDef I2C_ITPendingBit)
2990                     ; 872 {
2991                     .text:	section	.text,new
2992  0000               _I2C_ClearITPendingBit:
2994  0000 89            	pushw	x
2995  0001 89            	pushw	x
2996       00000002      OFST:	set	2
2999                     ; 873   uint16_t flagpos = 0;
3001  0002 5f            	clrw	x
3002  0003 1f01          	ldw	(OFST-1,sp),x
3003                     ; 876   assert_param(IS_I2C_CLEAR_ITPENDINGBIT_OK(I2C_ITPendingBit));
3005  0005 1e03          	ldw	x,(OFST+1,sp)
3006  0007 a32220        	cpw	x,#8736
3007  000a 271c          	jreq	L262
3008  000c 1e03          	ldw	x,(OFST+1,sp)
3009  000e a32108        	cpw	x,#8456
3010  0011 2715          	jreq	L262
3011  0013 1e03          	ldw	x,(OFST+1,sp)
3012  0015 a32104        	cpw	x,#8452
3013  0018 270e          	jreq	L262
3014  001a 1e03          	ldw	x,(OFST+1,sp)
3015  001c a32102        	cpw	x,#8450
3016  001f 2707          	jreq	L262
3017  0021 1e03          	ldw	x,(OFST+1,sp)
3018  0023 a32101        	cpw	x,#8449
3019  0026 2603          	jrne	L062
3020  0028               L262:
3021  0028 4f            	clr	a
3022  0029 2010          	jra	L462
3023  002b               L062:
3024  002b ae036c        	ldw	x,#876
3025  002e 89            	pushw	x
3026  002f ae0000        	ldw	x,#0
3027  0032 89            	pushw	x
3028  0033 ae000c        	ldw	x,#L131
3029  0036 cd0000        	call	_assert_failed
3031  0039 5b04          	addw	sp,#4
3032  003b               L462:
3033                     ; 879   flagpos = (uint16_t)I2C_ITPendingBit & FLAG_Mask;
3035  003b 7b03          	ld	a,(OFST+1,sp)
3036  003d 97            	ld	xl,a
3037  003e 7b04          	ld	a,(OFST+2,sp)
3038  0040 a4ff          	and	a,#255
3039  0042 5f            	clrw	x
3040  0043 02            	rlwa	x,a
3041  0044 1f01          	ldw	(OFST-1,sp),x
3042  0046 01            	rrwa	x,a
3043                     ; 882   I2C->SR2 = (uint8_t)((uint16_t)~flagpos);
3045  0047 7b02          	ld	a,(OFST+0,sp)
3046  0049 43            	cpl	a
3047  004a c75218        	ld	21016,a
3048                     ; 883 }
3051  004d 5b04          	addw	sp,#4
3052  004f 81            	ret
3065                     	xdef	_I2C_ClearITPendingBit
3066                     	xdef	_I2C_GetITStatus
3067                     	xdef	_I2C_ClearFlag
3068                     	xdef	_I2C_GetFlagStatus
3069                     	xdef	_I2C_GetLastEvent
3070                     	xdef	_I2C_CheckEvent
3071                     	xdef	_I2C_SendData
3072                     	xdef	_I2C_Send7bitAddress
3073                     	xdef	_I2C_ReceiveData
3074                     	xdef	_I2C_ITConfig
3075                     	xdef	_I2C_FastModeDutyCycleConfig
3076                     	xdef	_I2C_AcknowledgeConfig
3077                     	xdef	_I2C_StretchClockCmd
3078                     	xdef	_I2C_SoftwareResetCmd
3079                     	xdef	_I2C_GenerateSTOP
3080                     	xdef	_I2C_GenerateSTART
3081                     	xdef	_I2C_GeneralCallCmd
3082                     	xdef	_I2C_Cmd
3083                     	xdef	_I2C_Init
3084                     	xdef	_I2C_DeInit
3085                     	xref	_assert_failed
3086                     	switch	.const
3087  000c               L131:
3088  000c 2e2e5c2e2e5c  	dc.b	"..\..\..\libraries"
3089  001e 5c73746d3873  	dc.b	"\stm8s_stdperiph_d"
3090  0030 72697665725c  	dc.b	"river\src\stm8s_i2"
3091  0042 632e6300      	dc.b	"c.c",0
3092                     	xref.b	c_lreg
3112                     	xref	c_sdivx
3113                     	xref	c_ludv
3114                     	xref	c_rtol
3115                     	xref	c_smul
3116                     	xref	c_lmul
3117                     	xref	c_lcmp
3118                     	xref	c_ltor
3119                     	xref	c_lzmp
3120                     	end
