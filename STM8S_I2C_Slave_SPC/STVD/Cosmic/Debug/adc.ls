   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
   4                     	bsct
   5  0000               _adc_sample:
   6  0000 0000          	dc.w	0
   7  0002 000000000000  	ds.b	59
  40                     ; 15 void ADC_init(void)
  40                     ; 16 {
  42                     .text:	section	.text,new
  43  0000               _ADC_init:
  47                     ; 17 	ADC1_DeInit();
  49  0000 cd0000        	call	_ADC1_DeInit
  51                     ; 19 	ADC1_Init(ADC1_CONVERSIONMODE_CONTINUOUS, ADC1_CHANNEL_4, ADC1_PRESSEL_FCPU_D2,
  51                     ; 20 			ADC1_EXTTRIG_TIM, DISABLE, ADC1_ALIGN_RIGHT, ADC1_SCHMITTTRIG_CHANNEL8, ENABLE);
  53  0003 4b01          	push	#1
  54  0005 4b08          	push	#8
  55  0007 4b08          	push	#8
  56  0009 4b00          	push	#0
  57  000b 4b00          	push	#0
  58  000d 4b00          	push	#0
  59  000f ae0004        	ldw	x,#4
  60  0012 a601          	ld	a,#1
  61  0014 95            	ld	xh,a
  62  0015 cd0000        	call	_ADC1_Init
  64  0018 5b06          	addw	sp,#6
  65                     ; 22 	ADC1_Cmd(ENABLE);//使能 ADC
  67  001a a601          	ld	a,#1
  68  001c cd0000        	call	_ADC1_Cmd
  70                     ; 25 	adc_sample.current = 0;
  72  001f ae0000        	ldw	x,#0
  73  0022 bf0c          	ldw	_adc_sample+12,x
  74  0024 ae0000        	ldw	x,#0
  75  0027 bf0a          	ldw	_adc_sample+10,x
  76                     ; 26 	adc_sample.valMax = 0;
  78  0029 5f            	clrw	x
  79  002a bf02          	ldw	_adc_sample+2,x
  80                     ; 27 	adc_sample.valMin = 1023;
  82  002c ae03ff        	ldw	x,#1023
  83  002f bf04          	ldw	_adc_sample+4,x
  84                     ; 28 	adc_sample.current_cnt = 0;
  86  0031 3f14          	clr	_adc_sample+20
  87                     ; 29 	adc_sample.total_energy = 0;
  89  0033 5f            	clrw	x
  90  0034 bf12          	ldw	_adc_sample+18,x
  91                     ; 30 	adc_sample.power = 0;
  93  0036 ae0000        	ldw	x,#0
  94  0039 bf10          	ldw	_adc_sample+16,x
  95  003b ae0000        	ldw	x,#0
  96  003e bf0e          	ldw	_adc_sample+14,x
  97                     ; 32 }
 100  0040 81            	ret
 124                     ; 39 void adc_turn_once(void)
 124                     ; 40 {
 125                     .text:	section	.text,new
 126  0000               _adc_turn_once:
 130                     ; 42 	adc_sample.vpp = ((float)(adc_sample.valMax - adc_sample.valMin) / ADC_MAX) * VOLTAGE_MAX;
 132  0000 be02          	ldw	x,_adc_sample+2
 133  0002 72b00004      	subw	x,_adc_sample+4
 134  0006 cd0000        	call	c_uitof
 136  0009 ae0018        	ldw	x,#L53
 137  000c cd0000        	call	c_fdiv
 139  000f ae0014        	ldw	x,#L54
 140  0012 cd0000        	call	c_fmul
 142  0015 ae0006        	ldw	x,#_adc_sample+6
 143  0018 cd0000        	call	c_rtol
 145                     ; 43 	adc_sample.current = adc_sample.vpp * VOLTAGE_AND_CURRENT_RATIO;
 147  001b ae0006        	ldw	x,#_adc_sample+6
 148  001e cd0000        	call	c_ltor
 150  0021 ae0010        	ldw	x,#L55
 151  0024 cd0000        	call	c_fmul
 153  0027 ae000a        	ldw	x,#_adc_sample+10
 154  002a cd0000        	call	c_rtol
 156                     ; 46 	adc_sample.valMax = 0;
 158  002d 5f            	clrw	x
 159  002e bf02          	ldw	_adc_sample+2,x
 160                     ; 47 	adc_sample.valMin = 1023;
 162  0030 ae03ff        	ldw	x,#1023
 163  0033 bf04          	ldw	_adc_sample+4,x
 164                     ; 49 }
 167  0035 81            	ret
 220                     ; 55 void calculate_power_1s(void)
 220                     ; 56 {
 221                     .text:	section	.text,new
 222  0000               _calculate_power_1s:
 224  0000 5206          	subw	sp,#6
 225       00000006      OFST:	set	6
 228                     ; 57 	u8 i, j = 0;
 230  0002 7b01          	ld	a,(OFST-5,sp)
 231  0004 97            	ld	xl,a
 232                     ; 58 	float current = 0.0;
 234  0005 96            	ldw	x,sp
 235  0006 1c0002        	addw	x,#OFST-4
 236  0009 cd0000        	call	c_ltor
 238  000c ae001c        	ldw	x,#L311
 239  000f cd0000        	call	c_ltor
 241                     ; 60 	adc_sample.current_sav[adc_sample.current_cnt] = adc_sample.current;
 243  0012 b614          	ld	a,_adc_sample+20
 244  0014 97            	ld	xl,a
 245  0015 a604          	ld	a,#4
 246  0017 42            	mul	x,a
 247  0018 b60d          	ld	a,_adc_sample+13
 248  001a e718          	ld	(_adc_sample+24,x),a
 249  001c b60c          	ld	a,_adc_sample+12
 250  001e e717          	ld	(_adc_sample+23,x),a
 251  0020 b60b          	ld	a,_adc_sample+11
 252  0022 e716          	ld	(_adc_sample+22,x),a
 253  0024 b60a          	ld	a,_adc_sample+10
 254  0026 e715          	ld	(_adc_sample+21,x),a
 255                     ; 61 	adc_sample.current_cnt++;
 257  0028 3c14          	inc	_adc_sample+20
 258                     ; 63 	if(adc_sample.current_cnt >= CURRENT_SAVE_MAX){
 260  002a b614          	ld	a,_adc_sample+20
 261  002c a10a          	cp	a,#10
 262  002e 2402          	jruge	L21
 263  0030 207c          	jp	L711
 264  0032               L21:
 265                     ; 64 		adc_sample.current_cnt = 0;	
 267  0032 3f14          	clr	_adc_sample+20
 268                     ; 66 		current = 0.0;
 270  0034 ce001e        	ldw	x,L311+2
 271  0037 1f04          	ldw	(OFST-2,sp),x
 272  0039 ce001c        	ldw	x,L311
 273  003c 1f02          	ldw	(OFST-4,sp),x
 274                     ; 67 		j = 0;
 276  003e 0f01          	clr	(OFST-5,sp)
 277                     ; 68 		for(i=0; i<CURRENT_SAVE_MAX; i++ ){
 279  0040 0f06          	clr	(OFST+0,sp)
 280  0042               L121:
 281                     ; 69 			if((0.1 <= adc_sample.current_sav[i]) && (adc_sample.current_sav[i] < CURRENT_VALUE_MAX)){
 283  0042 9c            	rvf
 284  0043 7b06          	ld	a,(OFST+0,sp)
 285  0045 97            	ld	xl,a
 286  0046 a604          	ld	a,#4
 287  0048 42            	mul	x,a
 288  0049 1c0015        	addw	x,#_adc_sample+21
 289  004c cd0000        	call	c_ltor
 291  004f ae000c        	ldw	x,#L531
 292  0052 cd0000        	call	c_fcmp
 294  0055 2f2a          	jrslt	L721
 296  0057 9c            	rvf
 297  0058 7b06          	ld	a,(OFST+0,sp)
 298  005a 97            	ld	xl,a
 299  005b a604          	ld	a,#4
 300  005d 42            	mul	x,a
 301  005e 1c0015        	addw	x,#_adc_sample+21
 302  0061 cd0000        	call	c_ltor
 304  0064 ae0008        	ldw	x,#L541
 305  0067 cd0000        	call	c_fcmp
 307  006a 2e15          	jrsge	L721
 308                     ; 70 				j++;
 310  006c 0c01          	inc	(OFST-5,sp)
 311                     ; 71 				current += adc_sample.current_sav[i];
 313  006e 7b06          	ld	a,(OFST+0,sp)
 314  0070 97            	ld	xl,a
 315  0071 a604          	ld	a,#4
 316  0073 42            	mul	x,a
 317  0074 1c0015        	addw	x,#_adc_sample+21
 318  0077 cd0000        	call	c_ltor
 320  007a 96            	ldw	x,sp
 321  007b 1c0002        	addw	x,#OFST-4
 322  007e cd0000        	call	c_fgadd
 324  0081               L721:
 325                     ; 68 		for(i=0; i<CURRENT_SAVE_MAX; i++ ){
 327  0081 0c06          	inc	(OFST+0,sp)
 330  0083 7b06          	ld	a,(OFST+0,sp)
 331  0085 a10a          	cp	a,#10
 332  0087 25b9          	jrult	L121
 333                     ; 77 		if(j > 0){
 335  0089 0d01          	tnz	(OFST-5,sp)
 336  008b 2721          	jreq	L711
 337                     ; 78 			current = current / j;
 339  008d 7b01          	ld	a,(OFST-5,sp)
 340  008f 5f            	clrw	x
 341  0090 97            	ld	xl,a
 342  0091 cd0000        	call	c_itof
 344  0094 96            	ldw	x,sp
 345  0095 1c0002        	addw	x,#OFST-4
 346  0098 cd0000        	call	c_fgdiv
 348                     ; 79 			adc_sample.power += current * AC_ACTUAL_VOLTAGE;
 350  009b 96            	ldw	x,sp
 351  009c 1c0002        	addw	x,#OFST-4
 352  009f cd0000        	call	c_ltor
 354  00a2 ae0004        	ldw	x,#L751
 355  00a5 cd0000        	call	c_fmul
 357  00a8 ae000e        	ldw	x,#_adc_sample+14
 358  00ab cd0000        	call	c_fgadd
 360  00ae               L711:
 361                     ; 87 }
 364  00ae 5b06          	addw	sp,#6
 365  00b0 81            	ret
 368                     	bsct
 369  003d               L361_i:
 370  003d 00            	dc.b	0
 422                     .const:	section	.text
 423  0000               L61:
 424  0000 00000e10      	dc.l	3600
 425                     ; 93 void calculate_energy_1min(void)
 425                     ; 94 {
 426                     .text:	section	.text,new
 427  0000               _calculate_energy_1min:
 429  0000 5206          	subw	sp,#6
 430       00000006      OFST:	set	6
 433                     ; 97 	u16 	temp = 0;
 435  0002 1e01          	ldw	x,(OFST-5,sp)
 436                     ; 99 	u32	power = (u32)adc_sample.power;
 438  0004 ae000e        	ldw	x,#_adc_sample+14
 439  0007 cd0000        	call	c_ltor
 441  000a cd0000        	call	c_ftol
 443  000d 96            	ldw	x,sp
 444  000e 1c0003        	addw	x,#OFST-3
 445  0011 cd0000        	call	c_rtol
 447                     ; 101 	i++;
 449  0014 3c3d          	inc	L361_i
 450                     ; 102 	if(i >= 60){		/* 1min */
 452  0016 b63d          	ld	a,L361_i
 453  0018 a13c          	cp	a,#60
 454  001a 2530          	jrult	L312
 455                     ; 103 		i = 0;
 457  001c 3f3d          	clr	L361_i
 458                     ; 105 		temp = power / 3600;			// 功率为每秒钟的值累加起来的
 460  001e 96            	ldw	x,sp
 461  001f 1c0003        	addw	x,#OFST-3
 462  0022 cd0000        	call	c_ltor
 464  0025 ae0000        	ldw	x,#L61
 465  0028 cd0000        	call	c_ludv
 467  002b be02          	ldw	x,c_lreg+2
 468  002d 1f01          	ldw	(OFST-5,sp),x
 469                     ; 109 		adc_sample.power = (float)(power % 3600);	
 471  002f 96            	ldw	x,sp
 472  0030 1c0003        	addw	x,#OFST-3
 473  0033 cd0000        	call	c_ltor
 475  0036 ae0000        	ldw	x,#L61
 476  0039 cd0000        	call	c_lumd
 478  003c cd0000        	call	c_ultof
 480  003f ae000e        	ldw	x,#_adc_sample+14
 481  0042 cd0000        	call	c_rtol
 483                     ; 114 		adc_sample.total_energy += temp;
 485  0045 be12          	ldw	x,_adc_sample+18
 486  0047 72fb01        	addw	x,(OFST-5,sp)
 487  004a bf12          	ldw	_adc_sample+18,x
 488  004c               L312:
 489                     ; 122 }
 492  004c 5b06          	addw	sp,#6
 493  004e 81            	ret
 591                     	xdef	_calculate_energy_1min
 592                     	xdef	_calculate_power_1s
 593                     	xdef	_adc_turn_once
 594                     	xdef	_ADC_init
 595                     	xdef	_adc_sample
 596                     	xref	_ADC1_Cmd
 597                     	xref	_ADC1_Init
 598                     	xref	_ADC1_DeInit
 599                     	switch	.const
 600  0004               L751:
 601  0004 436a0000      	dc.w	17258,0
 602  0008               L541:
 603  0008 41f00000      	dc.w	16880,0
 604  000c               L531:
 605  000c 3dcccccc      	dc.w	15820,-13108
 606  0010               L55:
 607  0010 40cf0a3d      	dc.w	16591,2621
 608  0014               L54:
 609  0014 40533333      	dc.w	16467,13107
 610  0018               L53:
 611  0018 447fc000      	dc.w	17535,-16384
 612  001c               L311:
 613  001c 00000000      	dc.w	0,0
 614                     	xref.b	c_lreg
 634                     	xref	c_ultof
 635                     	xref	c_lumd
 636                     	xref	c_ludv
 637                     	xref	c_ftol
 638                     	xref	c_fgdiv
 639                     	xref	c_itof
 640                     	xref	c_fgadd
 641                     	xref	c_fcmp
 642                     	xref	c_ltor
 643                     	xref	c_rtol
 644                     	xref	c_fmul
 645                     	xref	c_fdiv
 646                     	xref	c_uitof
 647                     	end
