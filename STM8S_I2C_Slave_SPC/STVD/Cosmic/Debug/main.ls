   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
   4                     	bsct
   5  0000               _spc:
   6  0000 00            	dc.b	0
   7  0001 000000        	ds.b	3
   8  0004 000000000000  	ds.b	33
   9  0025               _last_ch1_status:
  10  0025 00            	dc.b	0
  11  0026               _last_ch2_status:
  12  0026 00            	dc.b	0
  13  0027               _last_ch3_status:
  14  0027 00            	dc.b	0
  72                     ; 56 void delay(u16 Count)
  72                     ; 57 {
  74                     .text:	section	.text,new
  75  0000               _delay:
  77  0000 89            	pushw	x
  78  0001 89            	pushw	x
  79       00000002      OFST:	set	2
  82  0002 2014          	jra	L14
  83  0004               L73:
  84                     ; 62 		for(i=0;i<100;i++)
  86  0004 0f01          	clr	(OFST-1,sp)
  87  0006               L54:
  88                     ; 63 		for(j=0;j<50;j++);
  90  0006 0f02          	clr	(OFST+0,sp)
  91  0008               L35:
  95  0008 0c02          	inc	(OFST+0,sp)
  98  000a 7b02          	ld	a,(OFST+0,sp)
  99  000c a132          	cp	a,#50
 100  000e 25f8          	jrult	L35
 101                     ; 62 		for(i=0;i<100;i++)
 103  0010 0c01          	inc	(OFST-1,sp)
 106  0012 7b01          	ld	a,(OFST-1,sp)
 107  0014 a164          	cp	a,#100
 108  0016 25ee          	jrult	L54
 109  0018               L14:
 110                     ; 60 	while (Count--)		//Count形参控制延时次数
 112  0018 1e03          	ldw	x,(OFST+1,sp)
 113  001a 1d0001        	subw	x,#1
 114  001d 1f03          	ldw	(OFST+1,sp),x
 115  001f 1c0001        	addw	x,#1
 116  0022 a30000        	cpw	x,#0
 117  0025 26dd          	jrne	L73
 118                     ; 66 }
 121  0027 5b04          	addw	sp,#4
 122  0029 81            	ret
 169                     .const:	section	.text
 170  0000               L01:
 171  0000 00004000      	dc.l	16384
 172                     ; 73  void MEEPROM_WriteByte(u16 dLocal_Addr, u8 dLocal_Data)
 172                     ; 74  {
 173                     .text:	section	.text,new
 174  0000               _MEEPROM_WriteByte:
 176  0000 89            	pushw	x
 177       00000000      OFST:	set	0
 180                     ; 75 	FLASH_Unlock(FLASH_MEMTYPE_DATA);
 182  0001 a6f7          	ld	a,#247
 183  0003 cd0000        	call	_FLASH_Unlock
 186  0006               L501:
 187                     ; 76 	while (FLASH_GetFlagStatus(FLASH_FLAG_DUL) == RESET);
 189  0006 a608          	ld	a,#8
 190  0008 cd0000        	call	_FLASH_GetFlagStatus
 192  000b 4d            	tnz	a
 193  000c 27f8          	jreq	L501
 194                     ; 78 	FLASH_ProgramByte(FLASH_DATA_START_PHYSICAL_ADDRESS + dLocal_Addr, dLocal_Data);
 196  000e 7b05          	ld	a,(OFST+5,sp)
 197  0010 88            	push	a
 198  0011 1e02          	ldw	x,(OFST+2,sp)
 199  0013 cd0000        	call	c_uitolx
 201  0016 ae0000        	ldw	x,#L01
 202  0019 cd0000        	call	c_ladd
 204  001c be02          	ldw	x,c_lreg+2
 205  001e 89            	pushw	x
 206  001f be00          	ldw	x,c_lreg
 207  0021 89            	pushw	x
 208  0022 cd0000        	call	_FLASH_ProgramByte
 210  0025 5b05          	addw	sp,#5
 211                     ; 79 	FLASH_Lock(FLASH_MEMTYPE_DATA);
 213  0027 a6f7          	ld	a,#247
 214  0029 cd0000        	call	_FLASH_Lock
 216                     ; 81  }
 219  002c 85            	popw	x
 220  002d 81            	ret
 264                     ; 88  u8 MEEPROM_ReadByte(u16 dLocal_Addr)
 264                     ; 89  {
 265                     .text:	section	.text,new
 266  0000               _MEEPROM_ReadByte:
 268  0000 88            	push	a
 269       00000001      OFST:	set	1
 272                     ; 91 	 dLocal_1 = FLASH_ReadByte(FLASH_DATA_START_PHYSICAL_ADDRESS + dLocal_Addr);
 274  0001 cd0000        	call	c_uitolx
 276  0004 ae0000        	ldw	x,#L01
 277  0007 cd0000        	call	c_ladd
 279  000a be02          	ldw	x,c_lreg+2
 280  000c 89            	pushw	x
 281  000d be00          	ldw	x,c_lreg
 282  000f 89            	pushw	x
 283  0010 cd0000        	call	_FLASH_ReadByte
 285  0013 5b04          	addw	sp,#4
 286  0015 6b01          	ld	(OFST+0,sp),a
 287                     ; 92 	 return dLocal_1;
 289  0017 7b01          	ld	a,(OFST+0,sp)
 292  0019 5b01          	addw	sp,#1
 293  001b 81            	ret
 334                     ; 100  void device_info_read(void)
 334                     ; 101  {
 335                     .text:	section	.text,new
 336  0000               _device_info_read:
 338  0000 88            	push	a
 339       00000001      OFST:	set	1
 342                     ; 102 	u8 temp = 0;
 344  0001 0f01          	clr	(OFST+0,sp)
 345                     ; 104 	spc.savFlag = 0;
 347  0003 3f1e          	clr	_spc+30
 348                     ; 106 	spc.model = FLASH_ReadByte(FLASH_DATA_START_PHYSICAL_ADDRESS + EEPROM_MODEL_ADDRESS);
 350  0005 ae400b        	ldw	x,#16395
 351  0008 89            	pushw	x
 352  0009 ae0000        	ldw	x,#0
 353  000c 89            	pushw	x
 354  000d cd0000        	call	_FLASH_ReadByte
 356  0010 5b04          	addw	sp,#4
 357  0012 b704          	ld	_spc+4,a
 358                     ; 107  	spc.firmware_version = FLASH_ReadByte(FLASH_DATA_START_PHYSICAL_ADDRESS + EEPROM_FW_VERSION_ADDRESS);	
 360  0014 ae400d        	ldw	x,#16397
 361  0017 89            	pushw	x
 362  0018 ae0000        	ldw	x,#0
 363  001b 89            	pushw	x
 364  001c cd0000        	call	_FLASH_ReadByte
 366  001f 5b04          	addw	sp,#4
 367  0021 b705          	ld	_spc+5,a
 368                     ; 108 	if(spc.firmware_version == 1){		/* 第一版本，device ID 4个字节  */		
 370  0023 b605          	ld	a,_spc+5
 371  0025 a101          	cp	a,#1
 372  0027 263c          	jrne	L151
 373                     ; 109 		spc.deviceID[0] = FLASH_ReadByte(FLASH_DATA_START_PHYSICAL_ADDRESS + EEPROM_DEVICEID_ADDRESS + 3);
 375  0029 ae4004        	ldw	x,#16388
 376  002c 89            	pushw	x
 377  002d ae0000        	ldw	x,#0
 378  0030 89            	pushw	x
 379  0031 cd0000        	call	_FLASH_ReadByte
 381  0034 5b04          	addw	sp,#4
 382  0036 b700          	ld	_spc,a
 383                     ; 110 		spc.deviceID[1] = FLASH_ReadByte(FLASH_DATA_START_PHYSICAL_ADDRESS + EEPROM_DEVICEID_ADDRESS + 2);
 385  0038 ae4003        	ldw	x,#16387
 386  003b 89            	pushw	x
 387  003c ae0000        	ldw	x,#0
 388  003f 89            	pushw	x
 389  0040 cd0000        	call	_FLASH_ReadByte
 391  0043 5b04          	addw	sp,#4
 392  0045 b701          	ld	_spc+1,a
 393                     ; 111 		spc.deviceID[2] = FLASH_ReadByte(FLASH_DATA_START_PHYSICAL_ADDRESS + EEPROM_DEVICEID_ADDRESS + 1);
 395  0047 ae4002        	ldw	x,#16386
 396  004a 89            	pushw	x
 397  004b ae0000        	ldw	x,#0
 398  004e 89            	pushw	x
 399  004f cd0000        	call	_FLASH_ReadByte
 401  0052 5b04          	addw	sp,#4
 402  0054 b702          	ld	_spc+2,a
 403                     ; 112 		spc.deviceID[3] = FLASH_ReadByte(FLASH_DATA_START_PHYSICAL_ADDRESS + EEPROM_DEVICEID_ADDRESS + 0);
 405  0056 ae4001        	ldw	x,#16385
 406  0059 89            	pushw	x
 407  005a ae0000        	ldw	x,#0
 408  005d 89            	pushw	x
 409  005e cd0000        	call	_FLASH_ReadByte
 411  0061 5b04          	addw	sp,#4
 412  0063 b703          	ld	_spc+3,a
 413  0065               L151:
 414                     ; 114 	spc.HW_version = FLASH_ReadByte(FLASH_DATA_START_PHYSICAL_ADDRESS + EEPROM_HW_VERSION_ADDRESS);
 416  0065 ae400f        	ldw	x,#16399
 417  0068 89            	pushw	x
 418  0069 ae0000        	ldw	x,#0
 419  006c 89            	pushw	x
 420  006d cd0000        	call	_FLASH_ReadByte
 422  0070 5b04          	addw	sp,#4
 423  0072 b706          	ld	_spc+6,a
 424                     ; 116 	temp = FLASH_ReadByte(FLASH_DATA_START_PHYSICAL_ADDRESS + EEPROM_BASH_ADDRESS + 0);
 426  0074 ae4011        	ldw	x,#16401
 427  0077 89            	pushw	x
 428  0078 ae0000        	ldw	x,#0
 429  007b 89            	pushw	x
 430  007c cd0000        	call	_FLASH_ReadByte
 432  007f 5b04          	addw	sp,#4
 433  0081 6b01          	ld	(OFST+0,sp),a
 434                     ; 117 	spc.bash = temp + 256 * FLASH_ReadByte(FLASH_DATA_START_PHYSICAL_ADDRESS + EEPROM_BASH_ADDRESS + 1);
 436  0083 ae4012        	ldw	x,#16402
 437  0086 89            	pushw	x
 438  0087 ae0000        	ldw	x,#0
 439  008a 89            	pushw	x
 440  008b cd0000        	call	_FLASH_ReadByte
 442  008e 5b04          	addw	sp,#4
 443  0090 5f            	clrw	x
 444  0091 97            	ld	xl,a
 445  0092 4f            	clr	a
 446  0093 02            	rlwa	x,a
 447  0094 01            	rrwa	x,a
 448  0095 1b01          	add	a,(OFST+0,sp)
 449  0097 2401          	jrnc	L61
 450  0099 5c            	incw	x
 451  009a               L61:
 452  009a b70c          	ld	_spc+12,a
 453  009c 9f            	ld	a,xl
 454  009d b70b          	ld	_spc+11,a
 455                     ; 119 	spc.manaYear = FLASH_ReadByte(FLASH_DATA_START_PHYSICAL_ADDRESS + EEPROM_MANA_YEAR_ADDRESS);
 457  009f ae4013        	ldw	x,#16403
 458  00a2 89            	pushw	x
 459  00a3 ae0000        	ldw	x,#0
 460  00a6 89            	pushw	x
 461  00a7 cd0000        	call	_FLASH_ReadByte
 463  00aa 5b04          	addw	sp,#4
 464  00ac b708          	ld	_spc+8,a
 465                     ; 120 	spc.manaMonth = FLASH_ReadByte(FLASH_DATA_START_PHYSICAL_ADDRESS + EEPROM_MANA_MONTH_ADDRESS);
 467  00ae ae4014        	ldw	x,#16404
 468  00b1 89            	pushw	x
 469  00b2 ae0000        	ldw	x,#0
 470  00b5 89            	pushw	x
 471  00b6 cd0000        	call	_FLASH_ReadByte
 473  00b9 5b04          	addw	sp,#4
 474  00bb b709          	ld	_spc+9,a
 475                     ; 121 	spc.manaDay = FLASH_ReadByte(FLASH_DATA_START_PHYSICAL_ADDRESS + EEPROM_MANA_DAY_ADDRESS);
 477  00bd ae4015        	ldw	x,#16405
 478  00c0 89            	pushw	x
 479  00c1 ae0000        	ldw	x,#0
 480  00c4 89            	pushw	x
 481  00c5 cd0000        	call	_FLASH_ReadByte
 483  00c8 5b04          	addw	sp,#4
 484  00ca b70a          	ld	_spc+10,a
 485                     ; 123 	spc.ch1_status = FLASH_ReadByte(FLASH_DATA_START_PHYSICAL_ADDRESS + EEPROM_CH1_STATUS_ADDRESS);
 487  00cc ae402d        	ldw	x,#16429
 488  00cf 89            	pushw	x
 489  00d0 ae0000        	ldw	x,#0
 490  00d3 89            	pushw	x
 491  00d4 cd0000        	call	_FLASH_ReadByte
 493  00d7 5b04          	addw	sp,#4
 494  00d9 b71f          	ld	_spc+31,a
 495                     ; 124 	spc.ch2_status = FLASH_ReadByte(FLASH_DATA_START_PHYSICAL_ADDRESS + EEPROM_CH2_STATUS_ADDRESS);
 497  00db ae402e        	ldw	x,#16430
 498  00de 89            	pushw	x
 499  00df ae0000        	ldw	x,#0
 500  00e2 89            	pushw	x
 501  00e3 cd0000        	call	_FLASH_ReadByte
 503  00e6 5b04          	addw	sp,#4
 504  00e8 b720          	ld	_spc+32,a
 505                     ; 125 	spc.ch3_status = FLASH_ReadByte(FLASH_DATA_START_PHYSICAL_ADDRESS + EEPROM_CH3_STATUS_ADDRESS);
 507  00ea ae402f        	ldw	x,#16431
 508  00ed 89            	pushw	x
 509  00ee ae0000        	ldw	x,#0
 510  00f1 89            	pushw	x
 511  00f2 cd0000        	call	_FLASH_ReadByte
 513  00f5 5b04          	addw	sp,#4
 514  00f7 b721          	ld	_spc+33,a
 515                     ; 126 	spc.ch4_status = FLASH_ReadByte(FLASH_DATA_START_PHYSICAL_ADDRESS + EEPROM_CH4_STATUS_ADDRESS);
 517  00f9 ae4030        	ldw	x,#16432
 518  00fc 89            	pushw	x
 519  00fd ae0000        	ldw	x,#0
 520  0100 89            	pushw	x
 521  0101 cd0000        	call	_FLASH_ReadByte
 523  0104 5b04          	addw	sp,#4
 524  0106 b722          	ld	_spc+34,a
 525                     ; 128 	last_ch1_status = spc.ch1_status;
 527  0108 451f25        	mov	_last_ch1_status,_spc+31
 528                     ; 129 	last_ch2_status = spc.ch2_status;
 530  010b 452026        	mov	_last_ch2_status,_spc+32
 531                     ; 130 	last_ch3_status = spc.ch3_status;
 533  010e 452127        	mov	_last_ch3_status,_spc+33
 534                     ; 133 	 if(spc.ch1_status){
 536  0111 3d1f          	tnz	_spc+31
 537  0113 270b          	jreq	L351
 538                     ; 134 		CH1_ON;
 540  0115 4b08          	push	#8
 541  0117 ae5000        	ldw	x,#20480
 542  011a cd0000        	call	_GPIO_WriteLow
 544  011d 84            	pop	a
 546  011e 2009          	jra	L551
 547  0120               L351:
 548                     ; 136 		CH1_OFF;
 550  0120 4b08          	push	#8
 551  0122 ae5000        	ldw	x,#20480
 552  0125 cd0000        	call	_GPIO_WriteHigh
 554  0128 84            	pop	a
 555  0129               L551:
 556                     ; 139 	 if(spc.ch2_status){
 558  0129 3d20          	tnz	_spc+32
 559  012b 270b          	jreq	L751
 560                     ; 140 		CH2_ON;
 562  012d 4b10          	push	#16
 563  012f ae500a        	ldw	x,#20490
 564  0132 cd0000        	call	_GPIO_WriteLow
 566  0135 84            	pop	a
 568  0136 2009          	jra	L161
 569  0138               L751:
 570                     ; 142 		CH2_OFF;
 572  0138 4b10          	push	#16
 573  013a ae500a        	ldw	x,#20490
 574  013d cd0000        	call	_GPIO_WriteHigh
 576  0140 84            	pop	a
 577  0141               L161:
 578                     ; 145 	 if(spc.ch3_status){
 580  0141 3d21          	tnz	_spc+33
 581  0143 270b          	jreq	L361
 582                     ; 146 		CH3_ON;
 584  0145 4b08          	push	#8
 585  0147 ae500a        	ldw	x,#20490
 586  014a cd0000        	call	_GPIO_WriteLow
 588  014d 84            	pop	a
 590  014e 2009          	jra	L561
 591  0150               L361:
 592                     ; 148 		CH3_OFF;
 594  0150 4b08          	push	#8
 595  0152 ae500a        	ldw	x,#20490
 596  0155 cd0000        	call	_GPIO_WriteHigh
 598  0158 84            	pop	a
 599  0159               L561:
 600                     ; 151  }
 603  0159 84            	pop	a
 604  015a 81            	ret
 633                     ; 158  void channel_status_save(void)
 633                     ; 159  {
 634                     .text:	section	.text,new
 635  0000               _channel_status_save:
 639                     ; 160 	 FLASH_Unlock(FLASH_MEMTYPE_DATA);
 641  0000 a6f7          	ld	a,#247
 642  0002 cd0000        	call	_FLASH_Unlock
 645  0005               L102:
 646                     ; 161 	 while (FLASH_GetFlagStatus(FLASH_FLAG_DUL) == RESET);
 648  0005 a608          	ld	a,#8
 649  0007 cd0000        	call	_FLASH_GetFlagStatus
 651  000a 4d            	tnz	a
 652  000b 27f8          	jreq	L102
 653                     ; 163 	 FLASH_ProgramByte(FLASH_DATA_START_PHYSICAL_ADDRESS + EEPROM_CH1_STATUS_ADDRESS, spc.ch1_status);
 655  000d 3b001f        	push	_spc+31
 656  0010 ae402d        	ldw	x,#16429
 657  0013 89            	pushw	x
 658  0014 ae0000        	ldw	x,#0
 659  0017 89            	pushw	x
 660  0018 cd0000        	call	_FLASH_ProgramByte
 662  001b 5b05          	addw	sp,#5
 663                     ; 164 	 FLASH_ProgramByte(FLASH_DATA_START_PHYSICAL_ADDRESS + EEPROM_CH2_STATUS_ADDRESS, spc.ch2_status);
 665  001d 3b0020        	push	_spc+32
 666  0020 ae402e        	ldw	x,#16430
 667  0023 89            	pushw	x
 668  0024 ae0000        	ldw	x,#0
 669  0027 89            	pushw	x
 670  0028 cd0000        	call	_FLASH_ProgramByte
 672  002b 5b05          	addw	sp,#5
 673                     ; 165 	 FLASH_ProgramByte(FLASH_DATA_START_PHYSICAL_ADDRESS + EEPROM_CH3_STATUS_ADDRESS, spc.ch3_status);
 675  002d 3b0021        	push	_spc+33
 676  0030 ae402f        	ldw	x,#16431
 677  0033 89            	pushw	x
 678  0034 ae0000        	ldw	x,#0
 679  0037 89            	pushw	x
 680  0038 cd0000        	call	_FLASH_ProgramByte
 682  003b 5b05          	addw	sp,#5
 683                     ; 168 	 FLASH_Lock(FLASH_MEMTYPE_DATA);
 685  003d a6f7          	ld	a,#247
 686  003f cd0000        	call	_FLASH_Lock
 688                     ; 170  }
 691  0042 81            	ret
 716                     ; 177  void default_info_set(void)
 716                     ; 178  {	 
 717                     .text:	section	.text,new
 718  0000               _default_info_set:
 722                     ; 180 	 spc.ch1_status = 100;
 724  0000 3564001f      	mov	_spc+31,#100
 725                     ; 181 	 spc.ch2_status = 100;
 727  0004 35640020      	mov	_spc+32,#100
 728                     ; 182 	 spc.ch3_status = 100;
 730  0008 35640021      	mov	_spc+33,#100
 731                     ; 183 	 spc.ch4_status = 100;
 733  000c 35640022      	mov	_spc+34,#100
 734                     ; 185 	 spc.energy_consume = 0;
 736  0010 5f            	clrw	x
 737  0011 bf23          	ldw	_spc+35,x
 738                     ; 187 	channel_status_save();
 740  0013 cd0000        	call	_channel_status_save
 742                     ; 189  }
 745  0016 81            	ret
 784                     ; 195  void MEEPROM_Init(void)
 784                     ; 196  {
 785                     .text:	section	.text,new
 786  0000               _MEEPROM_Init:
 788  0000 88            	push	a
 789       00000001      OFST:	set	1
 792                     ; 197 	u8 temp = 0;
 794  0001 0f01          	clr	(OFST+0,sp)
 795                     ; 199 	FLASH_DeInit();
 797  0003 cd0000        	call	_FLASH_DeInit
 799                     ; 200 	temp = MEEPROM_ReadByte(EEPROM_INIT_ADDRESS);
 801  0006 5f            	clrw	x
 802  0007 cd0000        	call	_MEEPROM_ReadByte
 804  000a 6b01          	ld	(OFST+0,sp),a
 805                     ; 203 	if(temp == EEPROM_INIT_FLAG) {		
 807  000c 7b01          	ld	a,(OFST+0,sp)
 808  000e a155          	cp	a,#85
 809  0010 260a          	jrne	L332
 810                     ; 204 		MEEPROM_WriteByte(EEPROM_INIT_ADDRESS, EEPROM_INIT_FLAG);
 812  0012 4b55          	push	#85
 813  0014 5f            	clrw	x
 814  0015 cd0000        	call	_MEEPROM_WriteByte
 816  0018 84            	pop	a
 817                     ; 205 		default_info_set();
 819  0019 cd0000        	call	_default_info_set
 821  001c               L332:
 822                     ; 208 	device_info_read();
 824  001c cd0000        	call	_device_info_read
 826                     ; 210  }
 829  001f 84            	pop	a
 830  0020 81            	ret
 853                     ; 217  void system_clock_set(void)
 853                     ; 218  {
 854                     .text:	section	.text,new
 855  0000               _system_clock_set:
 859                     ; 221 	 CLK->SWCR |= 0x02; //开启切换
 861  0000 721250c5      	bset	20677,#1
 862                     ; 223 	 CLK->SWR	= 0xb4; 	  //选择时钟为外部16M
 864  0004 35b450c4      	mov	20676,#180
 866  0008               L152:
 867                     ; 224 	 while((CLK->SWCR & 0x01) == 0x01);
 869  0008 c650c5        	ld	a,20677
 870  000b a401          	and	a,#1
 871  000d a101          	cp	a,#1
 872  000f 27f7          	jreq	L152
 873                     ; 225 	 CLK->CKDIVR = 0x80;	//不分频
 875  0011 358050c6      	mov	20678,#128
 876                     ; 227 	 CLK->SWCR	&= ~0x02; //关闭切换
 878  0015 721350c5      	bres	20677,#1
 879                     ; 229  }
 882  0019 81            	ret
 919                     ; 235  u8 system_addr_get(void)
 919                     ; 236  {
 920                     .text:	section	.text,new
 921  0000               _system_addr_get:
 923  0000 88            	push	a
 924       00000001      OFST:	set	1
 927                     ; 237 	uint8_t slave_address = 0;
 929  0001 0f01          	clr	(OFST+0,sp)
 930                     ; 240 	 slave_address = 0; 
 932  0003 0f01          	clr	(OFST+0,sp)
 933                     ; 241 	 GPIO_Init(GPIOD, (GPIO_Pin_TypeDef)GPIO_PIN_2, GPIO_MODE_IN_FL_NO_IT);
 935  0005 4b00          	push	#0
 936  0007 4b04          	push	#4
 937  0009 ae500f        	ldw	x,#20495
 938  000c cd0000        	call	_GPIO_Init
 940  000f 85            	popw	x
 941                     ; 242 	 GPIO_Init(GPIOC, (GPIO_Pin_TypeDef)GPIO_PIN_5, GPIO_MODE_IN_FL_NO_IT);
 943  0010 4b00          	push	#0
 944  0012 4b20          	push	#32
 945  0014 ae500a        	ldw	x,#20490
 946  0017 cd0000        	call	_GPIO_Init
 948  001a 85            	popw	x
 949                     ; 243 	 GPIO_Init(GPIOC, (GPIO_Pin_TypeDef)GPIO_PIN_6, GPIO_MODE_IN_FL_NO_IT);
 951  001b 4b00          	push	#0
 952  001d 4b40          	push	#64
 953  001f ae500a        	ldw	x,#20490
 954  0022 cd0000        	call	_GPIO_Init
 956  0025 85            	popw	x
 957                     ; 244 	 GPIO_Init(GPIOC, (GPIO_Pin_TypeDef)GPIO_PIN_7, GPIO_MODE_IN_FL_NO_IT);
 959  0026 4b00          	push	#0
 960  0028 4b80          	push	#128
 961  002a ae500a        	ldw	x,#20490
 962  002d cd0000        	call	_GPIO_Init
 964  0030 85            	popw	x
 965                     ; 247 	 delay(100);
 967  0031 ae0064        	ldw	x,#100
 968  0034 cd0000        	call	_delay
 970                     ; 249 	 if(GPIO_ReadInputData(GPIOD) & 0x04)	 slave_address |= 0x08;
 972  0037 ae500f        	ldw	x,#20495
 973  003a cd0000        	call	_GPIO_ReadInputData
 975  003d a504          	bcp	a,#4
 976  003f 2706          	jreq	L372
 979  0041 7b01          	ld	a,(OFST+0,sp)
 980  0043 aa08          	or	a,#8
 981  0045 6b01          	ld	(OFST+0,sp),a
 982  0047               L372:
 983                     ; 250 	 if(GPIO_ReadInputData(GPIOC) & 0x20)	 slave_address |= 0x04;
 985  0047 ae500a        	ldw	x,#20490
 986  004a cd0000        	call	_GPIO_ReadInputData
 988  004d a520          	bcp	a,#32
 989  004f 2706          	jreq	L572
 992  0051 7b01          	ld	a,(OFST+0,sp)
 993  0053 aa04          	or	a,#4
 994  0055 6b01          	ld	(OFST+0,sp),a
 995  0057               L572:
 996                     ; 251 	 if(GPIO_ReadInputData(GPIOC) & 0x40)	 slave_address |= 0x02;
 998  0057 ae500a        	ldw	x,#20490
 999  005a cd0000        	call	_GPIO_ReadInputData
1001  005d a540          	bcp	a,#64
1002  005f 2706          	jreq	L772
1005  0061 7b01          	ld	a,(OFST+0,sp)
1006  0063 aa02          	or	a,#2
1007  0065 6b01          	ld	(OFST+0,sp),a
1008  0067               L772:
1009                     ; 252 	 if(GPIO_ReadInputData(GPIOC) & 0x80)	 slave_address |= 0x01;
1011  0067 ae500a        	ldw	x,#20490
1012  006a cd0000        	call	_GPIO_ReadInputData
1014  006d a580          	bcp	a,#128
1015  006f 2706          	jreq	L103
1018  0071 7b01          	ld	a,(OFST+0,sp)
1019  0073 aa01          	or	a,#1
1020  0075 6b01          	ld	(OFST+0,sp),a
1021  0077               L103:
1022                     ; 254 	return slave_address;
1024  0077 7b01          	ld	a,(OFST+0,sp)
1027  0079 5b01          	addw	sp,#1
1028  007b 81            	ret
1056                     ; 261 void interrupt_priority_set(void)
1056                     ; 262 {
1057                     .text:	section	.text,new
1058  0000               _interrupt_priority_set:
1062                     ; 265 	disableInterrupts();
1065  0000 9b            sim
1067                     ; 267 	ITC_DeInit();
1070  0001 cd0000        	call	_ITC_DeInit
1072                     ; 268 	ITC_SetSoftwarePriority(ITC_IRQ_TIM2_OVF, ITC_PRIORITYLEVEL_3);
1074  0004 ae0003        	ldw	x,#3
1075  0007 a60d          	ld	a,#13
1076  0009 95            	ld	xh,a
1077  000a cd0000        	call	_ITC_SetSoftwarePriority
1079                     ; 269 	ITC_SetSoftwarePriority(ITC_IRQ_TIM4_OVF, ITC_PRIORITYLEVEL_1);
1081  000d ae0001        	ldw	x,#1
1082  0010 a617          	ld	a,#23
1083  0012 95            	ld	xh,a
1084  0013 cd0000        	call	_ITC_SetSoftwarePriority
1086                     ; 271 	ITC_SetSoftwarePriority(ITC_IRQ_UART1_TX, ITC_PRIORITYLEVEL_2);
1088  0016 5f            	clrw	x
1089  0017 a611          	ld	a,#17
1090  0019 95            	ld	xh,a
1091  001a cd0000        	call	_ITC_SetSoftwarePriority
1093                     ; 272 	ITC_SetSoftwarePriority(ITC_IRQ_UART1_RX, ITC_PRIORITYLEVEL_2);
1095  001d 5f            	clrw	x
1096  001e a612          	ld	a,#18
1097  0020 95            	ld	xh,a
1098  0021 cd0000        	call	_ITC_SetSoftwarePriority
1100                     ; 275 	enableInterrupts();
1103  0024 9a            rim
1105                     ; 278 }
1109  0025 81            	ret
1147                     ; 285 void main(void)
1147                     ; 286 {
1148                     .text:	section	.text,new
1149  0000               _main:
1153                     ; 288 	system_clock_set();
1155  0000 cd0000        	call	_system_clock_set
1157                     ; 291 	GPIO_Init(GPIOC, (GPIO_Pin_TypeDef)GPIO_PIN_3, GPIO_MODE_OUT_PP_LOW_SLOW);
1159  0003 4bc0          	push	#192
1160  0005 4b08          	push	#8
1161  0007 ae500a        	ldw	x,#20490
1162  000a cd0000        	call	_GPIO_Init
1164  000d 85            	popw	x
1165                     ; 292 	GPIO_Init(GPIOC, (GPIO_Pin_TypeDef)GPIO_PIN_4, GPIO_MODE_OUT_PP_LOW_SLOW);
1167  000e 4bc0          	push	#192
1168  0010 4b10          	push	#16
1169  0012 ae500a        	ldw	x,#20490
1170  0015 cd0000        	call	_GPIO_Init
1172  0018 85            	popw	x
1173                     ; 293 	GPIO_Init(GPIOA, (GPIO_Pin_TypeDef)GPIO_PIN_3, GPIO_MODE_OUT_PP_LOW_SLOW);
1175  0019 4bc0          	push	#192
1176  001b 4b08          	push	#8
1177  001d ae5000        	ldw	x,#20480
1178  0020 cd0000        	call	_GPIO_Init
1180  0023 85            	popw	x
1181                     ; 295 	spc.MDID = system_addr_get();
1183  0024 cd0000        	call	_system_addr_get
1185  0027 b71d          	ld	_spc+29,a
1186                     ; 297 	ADC_init();
1188  0029 cd0000        	call	_ADC_init
1190                     ; 300 	uart1_init();
1192  002c cd0000        	call	_uart1_init
1194                     ; 303 	timer2_init();
1196  002f cd0000        	call	_timer2_init
1198                     ; 306 	timer4_init();
1200  0032 cd0000        	call	_timer4_init
1202                     ; 309 	interrupt_priority_set();
1204  0035 cd0000        	call	_interrupt_priority_set
1206                     ; 312 	MEEPROM_Init();
1208  0038 cd0000        	call	_MEEPROM_Init
1210  003b               L323:
1211                     ; 317 		if(spc.savFlag == 2){
1213  003b b61e          	ld	a,_spc+30
1214  003d a102          	cp	a,#2
1215  003f 2605          	jrne	L723
1216                     ; 318 			spc.savFlag = 0;
1218  0041 3f1e          	clr	_spc+30
1219                     ; 319 			channel_status_save();
1221  0043 cd0000        	call	_channel_status_save
1223  0046               L723:
1224                     ; 323 		if(f_30ms){
1226  0046 b600          	ld	a,_Flag1_
1227  0048 a501          	bcp	a,#1
1228  004a 2707          	jreq	L133
1229                     ; 324 			f_30ms = 0;
1231  004c 72110000      	bres	_Flag1_,#0
1232                     ; 325 			adc_turn_once();
1234  0050 cd0000        	call	_adc_turn_once
1236  0053               L133:
1237                     ; 328 		if(f_100ms){
1239  0053 b600          	ld	a,_Flag1_
1240  0055 a508          	bcp	a,#8
1241  0057 2707          	jreq	L333
1242                     ; 329 			f_100ms = 0;
1244  0059 72170000      	bres	_Flag1_,#3
1245                     ; 330 			calculate_power_1s();
1247  005d cd0000        	call	_calculate_power_1s
1249  0060               L333:
1250                     ; 333 		if(f_1s){
1252  0060 b600          	ld	a,_Flag1_
1253  0062 a502          	bcp	a,#2
1254  0064 27d5          	jreq	L323
1255                     ; 334 			f_1s = 0;
1257  0066 72130000      	bres	_Flag1_,#1
1258                     ; 335 			calculate_energy_1min();
1260  006a cd0000        	call	_calculate_energy_1min
1262  006d 20cc          	jra	L323
1297                     ; 354 void assert_failed(uint8_t* file, uint32_t line)
1297                     ; 355 { 
1298                     .text:	section	.text,new
1299  0000               _assert_failed:
1303  0000               L553:
1304  0000 20fe          	jra	L553
1746                     	xdef	_assert_failed
1747                     	xdef	_main
1748                     	xdef	_interrupt_priority_set
1749                     	xdef	_system_addr_get
1750                     	xdef	_system_clock_set
1751                     	xdef	_MEEPROM_Init
1752                     	xdef	_default_info_set
1753                     	xdef	_channel_status_save
1754                     	xdef	_device_info_read
1755                     	xdef	_MEEPROM_ReadByte
1756                     	xdef	_MEEPROM_WriteByte
1757                     	xdef	_delay
1758                     	switch	.ubsct
1759  0000               _action_flag:
1760  0000 00            	ds.b	1
1761                     	xdef	_action_flag
1762                     	xdef	_last_ch3_status
1763                     	xdef	_last_ch2_status
1764                     	xdef	_last_ch1_status
1765  0001               _channel:
1766  0001 00            	ds.b	1
1767                     	xdef	_channel
1768                     	xdef	_spc
1769                     	xref	_uart1_init
1770                     	xref	_calculate_energy_1min
1771                     	xref	_calculate_power_1s
1772                     	xref	_adc_turn_once
1773                     	xref	_ADC_init
1774                     	xref	_timer4_init
1775                     	xref	_timer2_init
1776                     	xref.b	_Flag1_
1777                     	xref	_ITC_SetSoftwarePriority
1778                     	xref	_ITC_DeInit
1779                     	xref	_GPIO_ReadInputData
1780                     	xref	_GPIO_WriteLow
1781                     	xref	_GPIO_WriteHigh
1782                     	xref	_GPIO_Init
1783                     	xref	_FLASH_GetFlagStatus
1784                     	xref	_FLASH_ReadByte
1785                     	xref	_FLASH_ProgramByte
1786                     	xref	_FLASH_DeInit
1787                     	xref	_FLASH_Lock
1788                     	xref	_FLASH_Unlock
1789                     	xref.b	c_lreg
1809                     	xref	c_ladd
1810                     	xref	c_uitolx
1811                     	end
