   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
  98                     ; 53 void GPIO_DeInit(GPIO_TypeDef* GPIOx)
  98                     ; 54 {
 100                     .text:	section	.text,new
 101  0000               _GPIO_DeInit:
 105                     ; 55   GPIOx->ODR = GPIO_ODR_RESET_VALUE; /* Reset Output Data Register */
 107  0000 7f            	clr	(x)
 108                     ; 56   GPIOx->DDR = GPIO_DDR_RESET_VALUE; /* Reset Data Direction Register */
 110  0001 6f02          	clr	(2,x)
 111                     ; 57   GPIOx->CR1 = GPIO_CR1_RESET_VALUE; /* Reset Control Register 1 */
 113  0003 6f03          	clr	(3,x)
 114                     ; 58   GPIOx->CR2 = GPIO_CR2_RESET_VALUE; /* Reset Control Register 2 */
 116  0005 6f04          	clr	(4,x)
 117                     ; 59 }
 120  0007 81            	ret
 360                     ; 71 void GPIO_Init(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin, GPIO_Mode_TypeDef GPIO_Mode)
 360                     ; 72 {
 361                     .text:	section	.text,new
 362  0000               _GPIO_Init:
 364  0000 89            	pushw	x
 365       00000000      OFST:	set	0
 368                     ; 77   assert_param(IS_GPIO_MODE_OK(GPIO_Mode));
 370                     ; 78   assert_param(IS_GPIO_PIN_OK(GPIO_Pin));
 372                     ; 81   GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
 374  0001 7b05          	ld	a,(OFST+5,sp)
 375  0003 43            	cpl	a
 376  0004 e404          	and	a,(4,x)
 377  0006 e704          	ld	(4,x),a
 378                     ; 87   if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x80) != (uint8_t)0x00) /* Output mode */
 380  0008 7b06          	ld	a,(OFST+6,sp)
 381  000a a580          	bcp	a,#128
 382  000c 271d          	jreq	L771
 383                     ; 89     if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x10) != (uint8_t)0x00) /* High level */
 385  000e 7b06          	ld	a,(OFST+6,sp)
 386  0010 a510          	bcp	a,#16
 387  0012 2706          	jreq	L102
 388                     ; 91       GPIOx->ODR |= (uint8_t)GPIO_Pin;
 390  0014 f6            	ld	a,(x)
 391  0015 1a05          	or	a,(OFST+5,sp)
 392  0017 f7            	ld	(x),a
 394  0018 2007          	jra	L302
 395  001a               L102:
 396                     ; 95       GPIOx->ODR &= (uint8_t)(~(GPIO_Pin));
 398  001a 1e01          	ldw	x,(OFST+1,sp)
 399  001c 7b05          	ld	a,(OFST+5,sp)
 400  001e 43            	cpl	a
 401  001f f4            	and	a,(x)
 402  0020 f7            	ld	(x),a
 403  0021               L302:
 404                     ; 98     GPIOx->DDR |= (uint8_t)GPIO_Pin;
 406  0021 1e01          	ldw	x,(OFST+1,sp)
 407  0023 e602          	ld	a,(2,x)
 408  0025 1a05          	or	a,(OFST+5,sp)
 409  0027 e702          	ld	(2,x),a
 411  0029 2009          	jra	L502
 412  002b               L771:
 413                     ; 103     GPIOx->DDR &= (uint8_t)(~(GPIO_Pin));
 415  002b 1e01          	ldw	x,(OFST+1,sp)
 416  002d 7b05          	ld	a,(OFST+5,sp)
 417  002f 43            	cpl	a
 418  0030 e402          	and	a,(2,x)
 419  0032 e702          	ld	(2,x),a
 420  0034               L502:
 421                     ; 110   if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x40) != (uint8_t)0x00) /* Pull-Up or Push-Pull */
 423  0034 7b06          	ld	a,(OFST+6,sp)
 424  0036 a540          	bcp	a,#64
 425  0038 270a          	jreq	L702
 426                     ; 112     GPIOx->CR1 |= (uint8_t)GPIO_Pin;
 428  003a 1e01          	ldw	x,(OFST+1,sp)
 429  003c e603          	ld	a,(3,x)
 430  003e 1a05          	or	a,(OFST+5,sp)
 431  0040 e703          	ld	(3,x),a
 433  0042 2009          	jra	L112
 434  0044               L702:
 435                     ; 116     GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
 437  0044 1e01          	ldw	x,(OFST+1,sp)
 438  0046 7b05          	ld	a,(OFST+5,sp)
 439  0048 43            	cpl	a
 440  0049 e403          	and	a,(3,x)
 441  004b e703          	ld	(3,x),a
 442  004d               L112:
 443                     ; 123   if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x20) != (uint8_t)0x00) /* Interrupt or Slow slope */
 445  004d 7b06          	ld	a,(OFST+6,sp)
 446  004f a520          	bcp	a,#32
 447  0051 270a          	jreq	L312
 448                     ; 125     GPIOx->CR2 |= (uint8_t)GPIO_Pin;
 450  0053 1e01          	ldw	x,(OFST+1,sp)
 451  0055 e604          	ld	a,(4,x)
 452  0057 1a05          	or	a,(OFST+5,sp)
 453  0059 e704          	ld	(4,x),a
 455  005b 2009          	jra	L512
 456  005d               L312:
 457                     ; 129     GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
 459  005d 1e01          	ldw	x,(OFST+1,sp)
 460  005f 7b05          	ld	a,(OFST+5,sp)
 461  0061 43            	cpl	a
 462  0062 e404          	and	a,(4,x)
 463  0064 e704          	ld	(4,x),a
 464  0066               L512:
 465                     ; 131 }
 468  0066 85            	popw	x
 469  0067 81            	ret
 515                     ; 141 void GPIO_Write(GPIO_TypeDef* GPIOx, uint8_t PortVal)
 515                     ; 142 {
 516                     .text:	section	.text,new
 517  0000               _GPIO_Write:
 519  0000 89            	pushw	x
 520       00000000      OFST:	set	0
 523                     ; 143   GPIOx->ODR = PortVal;
 525  0001 7b05          	ld	a,(OFST+5,sp)
 526  0003 1e01          	ldw	x,(OFST+1,sp)
 527  0005 f7            	ld	(x),a
 528                     ; 144 }
 531  0006 85            	popw	x
 532  0007 81            	ret
 579                     ; 154 void GPIO_WriteHigh(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
 579                     ; 155 {
 580                     .text:	section	.text,new
 581  0000               _GPIO_WriteHigh:
 583  0000 89            	pushw	x
 584       00000000      OFST:	set	0
 587                     ; 156   GPIOx->ODR |= (uint8_t)PortPins;
 589  0001 f6            	ld	a,(x)
 590  0002 1a05          	or	a,(OFST+5,sp)
 591  0004 f7            	ld	(x),a
 592                     ; 157 }
 595  0005 85            	popw	x
 596  0006 81            	ret
 643                     ; 167 void GPIO_WriteLow(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
 643                     ; 168 {
 644                     .text:	section	.text,new
 645  0000               _GPIO_WriteLow:
 647  0000 89            	pushw	x
 648       00000000      OFST:	set	0
 651                     ; 169   GPIOx->ODR &= (uint8_t)(~PortPins);
 653  0001 7b05          	ld	a,(OFST+5,sp)
 654  0003 43            	cpl	a
 655  0004 f4            	and	a,(x)
 656  0005 f7            	ld	(x),a
 657                     ; 170 }
 660  0006 85            	popw	x
 661  0007 81            	ret
 708                     ; 180 void GPIO_WriteReverse(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
 708                     ; 181 {
 709                     .text:	section	.text,new
 710  0000               _GPIO_WriteReverse:
 712  0000 89            	pushw	x
 713       00000000      OFST:	set	0
 716                     ; 182   GPIOx->ODR ^= (uint8_t)PortPins;
 718  0001 f6            	ld	a,(x)
 719  0002 1805          	xor	a,	(OFST+5,sp)
 720  0004 f7            	ld	(x),a
 721                     ; 183 }
 724  0005 85            	popw	x
 725  0006 81            	ret
 763                     ; 191 uint8_t GPIO_ReadOutputData(GPIO_TypeDef* GPIOx)
 763                     ; 192 {
 764                     .text:	section	.text,new
 765  0000               _GPIO_ReadOutputData:
 769                     ; 193   return ((uint8_t)GPIOx->ODR);
 771  0000 f6            	ld	a,(x)
 774  0001 81            	ret
 811                     ; 202 uint8_t GPIO_ReadInputData(GPIO_TypeDef* GPIOx)
 811                     ; 203 {
 812                     .text:	section	.text,new
 813  0000               _GPIO_ReadInputData:
 817                     ; 204   return ((uint8_t)GPIOx->IDR);
 819  0000 e601          	ld	a,(1,x)
 822  0002 81            	ret
 890                     ; 213 BitStatus GPIO_ReadInputPin(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin)
 890                     ; 214 {
 891                     .text:	section	.text,new
 892  0000               _GPIO_ReadInputPin:
 894  0000 89            	pushw	x
 895       00000000      OFST:	set	0
 898                     ; 215   return ((BitStatus)(GPIOx->IDR & (uint8_t)GPIO_Pin));
 900  0001 e601          	ld	a,(1,x)
 901  0003 1405          	and	a,(OFST+5,sp)
 904  0005 85            	popw	x
 905  0006 81            	ret
 983                     ; 225 void GPIO_ExternalPullUpConfig(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin, FunctionalState NewState)
 983                     ; 226 {
 984                     .text:	section	.text,new
 985  0000               _GPIO_ExternalPullUpConfig:
 987  0000 89            	pushw	x
 988       00000000      OFST:	set	0
 991                     ; 228   assert_param(IS_GPIO_PIN_OK(GPIO_Pin));
 993                     ; 229   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 995                     ; 231   if (NewState != DISABLE) /* External Pull-Up Set*/
 997  0001 0d06          	tnz	(OFST+6,sp)
 998  0003 2708          	jreq	L374
 999                     ; 233     GPIOx->CR1 |= (uint8_t)GPIO_Pin;
1001  0005 e603          	ld	a,(3,x)
1002  0007 1a05          	or	a,(OFST+5,sp)
1003  0009 e703          	ld	(3,x),a
1005  000b 2009          	jra	L574
1006  000d               L374:
1007                     ; 236     GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
1009  000d 1e01          	ldw	x,(OFST+1,sp)
1010  000f 7b05          	ld	a,(OFST+5,sp)
1011  0011 43            	cpl	a
1012  0012 e403          	and	a,(3,x)
1013  0014 e703          	ld	(3,x),a
1014  0016               L574:
1015                     ; 238 }
1018  0016 85            	popw	x
1019  0017 81            	ret
1032                     	xdef	_GPIO_ExternalPullUpConfig
1033                     	xdef	_GPIO_ReadInputPin
1034                     	xdef	_GPIO_ReadOutputData
1035                     	xdef	_GPIO_ReadInputData
1036                     	xdef	_GPIO_WriteReverse
1037                     	xdef	_GPIO_WriteLow
1038                     	xdef	_GPIO_WriteHigh
1039                     	xdef	_GPIO_Write
1040                     	xdef	_GPIO_Init
1041                     	xdef	_GPIO_DeInit
1060                     	end
