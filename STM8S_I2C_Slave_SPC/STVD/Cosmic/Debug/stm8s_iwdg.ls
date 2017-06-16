   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
  68                     ; 48 void IWDG_WriteAccessCmd(IWDG_WriteAccess_TypeDef IWDG_WriteAccess)
  68                     ; 49 {
  70                     .text:	section	.text,new
  71  0000               _IWDG_WriteAccessCmd:
  73  0000 88            	push	a
  74       00000000      OFST:	set	0
  77                     ; 51   assert_param(IS_IWDG_WRITEACCESS_MODE_OK(IWDG_WriteAccess));
  79  0001 a155          	cp	a,#85
  80  0003 2703          	jreq	L01
  81  0005 4d            	tnz	a
  82  0006 2603          	jrne	L6
  83  0008               L01:
  84  0008 4f            	clr	a
  85  0009 2010          	jra	L21
  86  000b               L6:
  87  000b ae0033        	ldw	x,#51
  88  000e 89            	pushw	x
  89  000f ae0000        	ldw	x,#0
  90  0012 89            	pushw	x
  91  0013 ae0000        	ldw	x,#L73
  92  0016 cd0000        	call	_assert_failed
  94  0019 5b04          	addw	sp,#4
  95  001b               L21:
  96                     ; 53   IWDG->KR = (uint8_t)IWDG_WriteAccess; /* Write Access */
  98  001b 7b01          	ld	a,(OFST+1,sp)
  99  001d c750e0        	ld	20704,a
 100                     ; 54 }
 103  0020 84            	pop	a
 104  0021 81            	ret
 195                     ; 63 void IWDG_SetPrescaler(IWDG_Prescaler_TypeDef IWDG_Prescaler)
 195                     ; 64 {
 196                     .text:	section	.text,new
 197  0000               _IWDG_SetPrescaler:
 199  0000 88            	push	a
 200       00000000      OFST:	set	0
 203                     ; 66   assert_param(IS_IWDG_PRESCALER_OK(IWDG_Prescaler));
 205  0001 4d            	tnz	a
 206  0002 2718          	jreq	L02
 207  0004 a101          	cp	a,#1
 208  0006 2714          	jreq	L02
 209  0008 a102          	cp	a,#2
 210  000a 2710          	jreq	L02
 211  000c a103          	cp	a,#3
 212  000e 270c          	jreq	L02
 213  0010 a104          	cp	a,#4
 214  0012 2708          	jreq	L02
 215  0014 a105          	cp	a,#5
 216  0016 2704          	jreq	L02
 217  0018 a106          	cp	a,#6
 218  001a 2603          	jrne	L61
 219  001c               L02:
 220  001c 4f            	clr	a
 221  001d 2010          	jra	L22
 222  001f               L61:
 223  001f ae0042        	ldw	x,#66
 224  0022 89            	pushw	x
 225  0023 ae0000        	ldw	x,#0
 226  0026 89            	pushw	x
 227  0027 ae0000        	ldw	x,#L73
 228  002a cd0000        	call	_assert_failed
 230  002d 5b04          	addw	sp,#4
 231  002f               L22:
 232                     ; 68   IWDG->PR = (uint8_t)IWDG_Prescaler;
 234  002f 7b01          	ld	a,(OFST+1,sp)
 235  0031 c750e1        	ld	20705,a
 236                     ; 69 }
 239  0034 84            	pop	a
 240  0035 81            	ret
 274                     ; 78 void IWDG_SetReload(uint8_t IWDG_Reload)
 274                     ; 79 {
 275                     .text:	section	.text,new
 276  0000               _IWDG_SetReload:
 280                     ; 80   IWDG->RLR = IWDG_Reload;
 282  0000 c750e2        	ld	20706,a
 283                     ; 81 }
 286  0003 81            	ret
 309                     ; 89 void IWDG_ReloadCounter(void)
 309                     ; 90 {
 310                     .text:	section	.text,new
 311  0000               _IWDG_ReloadCounter:
 315                     ; 91   IWDG->KR = IWDG_KEY_REFRESH;
 317  0000 35aa50e0      	mov	20704,#170
 318                     ; 92 }
 321  0004 81            	ret
 344                     ; 99 void IWDG_Enable(void)
 344                     ; 100 {
 345                     .text:	section	.text,new
 346  0000               _IWDG_Enable:
 350                     ; 101   IWDG->KR = IWDG_KEY_ENABLE;
 352  0000 35cc50e0      	mov	20704,#204
 353                     ; 102 }
 356  0004 81            	ret
 369                     	xdef	_IWDG_Enable
 370                     	xdef	_IWDG_ReloadCounter
 371                     	xdef	_IWDG_SetReload
 372                     	xdef	_IWDG_SetPrescaler
 373                     	xdef	_IWDG_WriteAccessCmd
 374                     	xref	_assert_failed
 375                     .const:	section	.text
 376  0000               L73:
 377  0000 2e2e5c2e2e5c  	dc.b	"..\..\..\libraries"
 378  0012 5c73746d3873  	dc.b	"\stm8s_stdperiph_d"
 379  0024 72697665725c  	dc.b	"river\src\stm8s_iw"
 380  0036 64672e6300    	dc.b	"dg.c",0
 400                     	end
