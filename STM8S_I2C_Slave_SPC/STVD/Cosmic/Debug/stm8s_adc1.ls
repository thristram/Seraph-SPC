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
 529                     ; 88 void ADC1_Init(ADC1_ConvMode_TypeDef ADC1_ConversionMode, ADC1_Channel_TypeDef ADC1_Channel, ADC1_PresSel_TypeDef ADC1_PrescalerSelection, ADC1_ExtTrig_TypeDef ADC1_ExtTrigger, FunctionalState ADC1_ExtTriggerState, ADC1_Align_TypeDef ADC1_Align, ADC1_SchmittTrigg_TypeDef ADC1_SchmittTriggerChannel, FunctionalState ADC1_SchmittTriggerState)
 529                     ; 89 {
 530                     .text:	section	.text,new
 531  0000               _ADC1_Init:
 533  0000 89            	pushw	x
 534       00000000      OFST:	set	0
 537                     ; 91   assert_param(IS_ADC1_CONVERSIONMODE_OK(ADC1_ConversionMode));
 539                     ; 92   assert_param(IS_ADC1_CHANNEL_OK(ADC1_Channel));
 541                     ; 93   assert_param(IS_ADC1_PRESSEL_OK(ADC1_PrescalerSelection));
 543                     ; 94   assert_param(IS_ADC1_EXTTRIG_OK(ADC1_ExtTrigger));
 545                     ; 95   assert_param(IS_FUNCTIONALSTATE_OK(((ADC1_ExtTriggerState))));
 547                     ; 96   assert_param(IS_ADC1_ALIGN_OK(ADC1_Align));
 549                     ; 97   assert_param(IS_ADC1_SCHMITTTRIG_OK(ADC1_SchmittTriggerChannel));
 551                     ; 98   assert_param(IS_FUNCTIONALSTATE_OK(ADC1_SchmittTriggerState));
 553                     ; 103   ADC1_ConversionConfig(ADC1_ConversionMode, ADC1_Channel, ADC1_Align);
 555  0001 7b08          	ld	a,(OFST+8,sp)
 556  0003 88            	push	a
 557  0004 9f            	ld	a,xl
 558  0005 97            	ld	xl,a
 559  0006 7b02          	ld	a,(OFST+2,sp)
 560  0008 95            	ld	xh,a
 561  0009 cd0000        	call	_ADC1_ConversionConfig
 563  000c 84            	pop	a
 564                     ; 105   ADC1_PrescalerConfig(ADC1_PrescalerSelection);
 566  000d 7b05          	ld	a,(OFST+5,sp)
 567  000f cd0000        	call	_ADC1_PrescalerConfig
 569                     ; 110   ADC1_ExternalTriggerConfig(ADC1_ExtTrigger, ADC1_ExtTriggerState);
 571  0012 7b07          	ld	a,(OFST+7,sp)
 572  0014 97            	ld	xl,a
 573  0015 7b06          	ld	a,(OFST+6,sp)
 574  0017 95            	ld	xh,a
 575  0018 cd0000        	call	_ADC1_ExternalTriggerConfig
 577                     ; 115   ADC1_SchmittTriggerConfig(ADC1_SchmittTriggerChannel, ADC1_SchmittTriggerState);
 579  001b 7b0a          	ld	a,(OFST+10,sp)
 580  001d 97            	ld	xl,a
 581  001e 7b09          	ld	a,(OFST+9,sp)
 582  0020 95            	ld	xh,a
 583  0021 cd0000        	call	_ADC1_SchmittTriggerConfig
 585                     ; 118   ADC1->CR1 |= ADC1_CR1_ADON;
 587  0024 72105401      	bset	21505,#0
 588                     ; 119 }
 591  0028 85            	popw	x
 592  0029 81            	ret
 627                     ; 126 void ADC1_Cmd(FunctionalState NewState)
 627                     ; 127 {
 628                     .text:	section	.text,new
 629  0000               _ADC1_Cmd:
 633                     ; 129   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 635                     ; 131   if (NewState != DISABLE)
 637  0000 4d            	tnz	a
 638  0001 2706          	jreq	L362
 639                     ; 133     ADC1->CR1 |= ADC1_CR1_ADON;
 641  0003 72105401      	bset	21505,#0
 643  0007 2004          	jra	L562
 644  0009               L362:
 645                     ; 137     ADC1->CR1 &= (uint8_t)(~ADC1_CR1_ADON);
 647  0009 72115401      	bres	21505,#0
 648  000d               L562:
 649                     ; 139 }
 652  000d 81            	ret
 687                     ; 146 void ADC1_ScanModeCmd(FunctionalState NewState)
 687                     ; 147 {
 688                     .text:	section	.text,new
 689  0000               _ADC1_ScanModeCmd:
 693                     ; 149   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 695                     ; 151   if (NewState != DISABLE)
 697  0000 4d            	tnz	a
 698  0001 2706          	jreq	L503
 699                     ; 153     ADC1->CR2 |= ADC1_CR2_SCAN;
 701  0003 72125402      	bset	21506,#1
 703  0007 2004          	jra	L703
 704  0009               L503:
 705                     ; 157     ADC1->CR2 &= (uint8_t)(~ADC1_CR2_SCAN);
 707  0009 72135402      	bres	21506,#1
 708  000d               L703:
 709                     ; 159 }
 712  000d 81            	ret
 747                     ; 166 void ADC1_DataBufferCmd(FunctionalState NewState)
 747                     ; 167 {
 748                     .text:	section	.text,new
 749  0000               _ADC1_DataBufferCmd:
 753                     ; 169   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 755                     ; 171   if (NewState != DISABLE)
 757  0000 4d            	tnz	a
 758  0001 2706          	jreq	L723
 759                     ; 173     ADC1->CR3 |= ADC1_CR3_DBUF;
 761  0003 721e5403      	bset	21507,#7
 763  0007 2004          	jra	L133
 764  0009               L723:
 765                     ; 177     ADC1->CR3 &= (uint8_t)(~ADC1_CR3_DBUF);
 767  0009 721f5403      	bres	21507,#7
 768  000d               L133:
 769                     ; 179 }
 772  000d 81            	ret
 928                     ; 190 void ADC1_ITConfig(ADC1_IT_TypeDef ADC1_IT, FunctionalState NewState)
 928                     ; 191 {
 929                     .text:	section	.text,new
 930  0000               _ADC1_ITConfig:
 932  0000 89            	pushw	x
 933       00000000      OFST:	set	0
 936                     ; 193   assert_param(IS_ADC1_IT_OK(ADC1_IT));
 938                     ; 194   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 940                     ; 196   if (NewState != DISABLE)
 942  0001 0d05          	tnz	(OFST+5,sp)
 943  0003 2709          	jreq	L714
 944                     ; 199     ADC1->CSR |= (uint8_t)ADC1_IT;
 946  0005 9f            	ld	a,xl
 947  0006 ca5400        	or	a,21504
 948  0009 c75400        	ld	21504,a
 950  000c 2009          	jra	L124
 951  000e               L714:
 952                     ; 204     ADC1->CSR &= (uint8_t)((uint16_t)~(uint16_t)ADC1_IT);
 954  000e 7b02          	ld	a,(OFST+2,sp)
 955  0010 43            	cpl	a
 956  0011 c45400        	and	a,21504
 957  0014 c75400        	ld	21504,a
 958  0017               L124:
 959                     ; 206 }
 962  0017 85            	popw	x
 963  0018 81            	ret
 999                     ; 214 void ADC1_PrescalerConfig(ADC1_PresSel_TypeDef ADC1_Prescaler)
 999                     ; 215 {
1000                     .text:	section	.text,new
1001  0000               _ADC1_PrescalerConfig:
1003  0000 88            	push	a
1004       00000000      OFST:	set	0
1007                     ; 217   assert_param(IS_ADC1_PRESSEL_OK(ADC1_Prescaler));
1009                     ; 220   ADC1->CR1 &= (uint8_t)(~ADC1_CR1_SPSEL);
1011  0001 c65401        	ld	a,21505
1012  0004 a48f          	and	a,#143
1013  0006 c75401        	ld	21505,a
1014                     ; 222   ADC1->CR1 |= (uint8_t)(ADC1_Prescaler);
1016  0009 c65401        	ld	a,21505
1017  000c 1a01          	or	a,(OFST+1,sp)
1018  000e c75401        	ld	21505,a
1019                     ; 223 }
1022  0011 84            	pop	a
1023  0012 81            	ret
1070                     ; 233 void ADC1_SchmittTriggerConfig(ADC1_SchmittTrigg_TypeDef ADC1_SchmittTriggerChannel, FunctionalState NewState)
1070                     ; 234 {
1071                     .text:	section	.text,new
1072  0000               _ADC1_SchmittTriggerConfig:
1074  0000 89            	pushw	x
1075       00000000      OFST:	set	0
1078                     ; 236   assert_param(IS_ADC1_SCHMITTTRIG_OK(ADC1_SchmittTriggerChannel));
1080                     ; 237   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1082                     ; 239   if (ADC1_SchmittTriggerChannel == ADC1_SCHMITTTRIG_ALL)
1084  0001 9e            	ld	a,xh
1085  0002 a1ff          	cp	a,#255
1086  0004 2620          	jrne	L364
1087                     ; 241     if (NewState != DISABLE)
1089  0006 9f            	ld	a,xl
1090  0007 4d            	tnz	a
1091  0008 270a          	jreq	L564
1092                     ; 243       ADC1->TDRL &= (uint8_t)0x0;
1094  000a 725f5407      	clr	21511
1095                     ; 244       ADC1->TDRH &= (uint8_t)0x0;
1097  000e 725f5406      	clr	21510
1099  0012 2078          	jra	L174
1100  0014               L564:
1101                     ; 248       ADC1->TDRL |= (uint8_t)0xFF;
1103  0014 c65407        	ld	a,21511
1104  0017 aaff          	or	a,#255
1105  0019 c75407        	ld	21511,a
1106                     ; 249       ADC1->TDRH |= (uint8_t)0xFF;
1108  001c c65406        	ld	a,21510
1109  001f aaff          	or	a,#255
1110  0021 c75406        	ld	21510,a
1111  0024 2066          	jra	L174
1112  0026               L364:
1113                     ; 252   else if (ADC1_SchmittTriggerChannel < ADC1_SCHMITTTRIG_CHANNEL8)
1115  0026 7b01          	ld	a,(OFST+1,sp)
1116  0028 a108          	cp	a,#8
1117  002a 242f          	jruge	L374
1118                     ; 254     if (NewState != DISABLE)
1120  002c 0d02          	tnz	(OFST+2,sp)
1121  002e 2716          	jreq	L574
1122                     ; 256       ADC1->TDRL &= (uint8_t)(~(uint8_t)((uint8_t)0x01 << (uint8_t)ADC1_SchmittTriggerChannel));
1124  0030 7b01          	ld	a,(OFST+1,sp)
1125  0032 5f            	clrw	x
1126  0033 97            	ld	xl,a
1127  0034 a601          	ld	a,#1
1128  0036 5d            	tnzw	x
1129  0037 2704          	jreq	L42
1130  0039               L62:
1131  0039 48            	sll	a
1132  003a 5a            	decw	x
1133  003b 26fc          	jrne	L62
1134  003d               L42:
1135  003d 43            	cpl	a
1136  003e c45407        	and	a,21511
1137  0041 c75407        	ld	21511,a
1139  0044 2046          	jra	L174
1140  0046               L574:
1141                     ; 260       ADC1->TDRL |= (uint8_t)((uint8_t)0x01 << (uint8_t)ADC1_SchmittTriggerChannel);
1143  0046 7b01          	ld	a,(OFST+1,sp)
1144  0048 5f            	clrw	x
1145  0049 97            	ld	xl,a
1146  004a a601          	ld	a,#1
1147  004c 5d            	tnzw	x
1148  004d 2704          	jreq	L03
1149  004f               L23:
1150  004f 48            	sll	a
1151  0050 5a            	decw	x
1152  0051 26fc          	jrne	L23
1153  0053               L03:
1154  0053 ca5407        	or	a,21511
1155  0056 c75407        	ld	21511,a
1156  0059 2031          	jra	L174
1157  005b               L374:
1158                     ; 265     if (NewState != DISABLE)
1160  005b 0d02          	tnz	(OFST+2,sp)
1161  005d 2718          	jreq	L305
1162                     ; 267       ADC1->TDRH &= (uint8_t)(~(uint8_t)((uint8_t)0x01 << ((uint8_t)ADC1_SchmittTriggerChannel - (uint8_t)8)));
1164  005f 7b01          	ld	a,(OFST+1,sp)
1165  0061 a008          	sub	a,#8
1166  0063 5f            	clrw	x
1167  0064 97            	ld	xl,a
1168  0065 a601          	ld	a,#1
1169  0067 5d            	tnzw	x
1170  0068 2704          	jreq	L43
1171  006a               L63:
1172  006a 48            	sll	a
1173  006b 5a            	decw	x
1174  006c 26fc          	jrne	L63
1175  006e               L43:
1176  006e 43            	cpl	a
1177  006f c45406        	and	a,21510
1178  0072 c75406        	ld	21510,a
1180  0075 2015          	jra	L174
1181  0077               L305:
1182                     ; 271       ADC1->TDRH |= (uint8_t)((uint8_t)0x01 << ((uint8_t)ADC1_SchmittTriggerChannel - (uint8_t)8));
1184  0077 7b01          	ld	a,(OFST+1,sp)
1185  0079 a008          	sub	a,#8
1186  007b 5f            	clrw	x
1187  007c 97            	ld	xl,a
1188  007d a601          	ld	a,#1
1189  007f 5d            	tnzw	x
1190  0080 2704          	jreq	L04
1191  0082               L24:
1192  0082 48            	sll	a
1193  0083 5a            	decw	x
1194  0084 26fc          	jrne	L24
1195  0086               L04:
1196  0086 ca5406        	or	a,21510
1197  0089 c75406        	ld	21510,a
1198  008c               L174:
1199                     ; 274 }
1202  008c 85            	popw	x
1203  008d 81            	ret
1260                     ; 286 void ADC1_ConversionConfig(ADC1_ConvMode_TypeDef ADC1_ConversionMode, ADC1_Channel_TypeDef ADC1_Channel, ADC1_Align_TypeDef ADC1_Align)
1260                     ; 287 {
1261                     .text:	section	.text,new
1262  0000               _ADC1_ConversionConfig:
1264  0000 89            	pushw	x
1265       00000000      OFST:	set	0
1268                     ; 289   assert_param(IS_ADC1_CONVERSIONMODE_OK(ADC1_ConversionMode));
1270                     ; 290   assert_param(IS_ADC1_CHANNEL_OK(ADC1_Channel));
1272                     ; 291   assert_param(IS_ADC1_ALIGN_OK(ADC1_Align));
1274                     ; 294   ADC1->CR2 &= (uint8_t)(~ADC1_CR2_ALIGN);
1276  0001 72175402      	bres	21506,#3
1277                     ; 296   ADC1->CR2 |= (uint8_t)(ADC1_Align);
1279  0005 c65402        	ld	a,21506
1280  0008 1a05          	or	a,(OFST+5,sp)
1281  000a c75402        	ld	21506,a
1282                     ; 298   if (ADC1_ConversionMode == ADC1_CONVERSIONMODE_CONTINUOUS)
1284  000d 9e            	ld	a,xh
1285  000e a101          	cp	a,#1
1286  0010 2606          	jrne	L535
1287                     ; 301     ADC1->CR1 |= ADC1_CR1_CONT;
1289  0012 72125401      	bset	21505,#1
1291  0016 2004          	jra	L735
1292  0018               L535:
1293                     ; 306     ADC1->CR1 &= (uint8_t)(~ADC1_CR1_CONT);
1295  0018 72135401      	bres	21505,#1
1296  001c               L735:
1297                     ; 310   ADC1->CSR &= (uint8_t)(~ADC1_CSR_CH);
1299  001c c65400        	ld	a,21504
1300  001f a4f0          	and	a,#240
1301  0021 c75400        	ld	21504,a
1302                     ; 312   ADC1->CSR |= (uint8_t)(ADC1_Channel);
1304  0024 c65400        	ld	a,21504
1305  0027 1a02          	or	a,(OFST+2,sp)
1306  0029 c75400        	ld	21504,a
1307                     ; 313 }
1310  002c 85            	popw	x
1311  002d 81            	ret
1357                     ; 325 void ADC1_ExternalTriggerConfig(ADC1_ExtTrig_TypeDef ADC1_ExtTrigger, FunctionalState NewState)
1357                     ; 326 {
1358                     .text:	section	.text,new
1359  0000               _ADC1_ExternalTriggerConfig:
1361  0000 89            	pushw	x
1362       00000000      OFST:	set	0
1365                     ; 328   assert_param(IS_ADC1_EXTTRIG_OK(ADC1_ExtTrigger));
1367                     ; 329   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1369                     ; 332   ADC1->CR2 &= (uint8_t)(~ADC1_CR2_EXTSEL);
1371  0001 c65402        	ld	a,21506
1372  0004 a4cf          	and	a,#207
1373  0006 c75402        	ld	21506,a
1374                     ; 334   if (NewState != DISABLE)
1376  0009 9f            	ld	a,xl
1377  000a 4d            	tnz	a
1378  000b 2706          	jreq	L365
1379                     ; 337     ADC1->CR2 |= (uint8_t)(ADC1_CR2_EXTTRIG);
1381  000d 721c5402      	bset	21506,#6
1383  0011 2004          	jra	L565
1384  0013               L365:
1385                     ; 342     ADC1->CR2 &= (uint8_t)(~ADC1_CR2_EXTTRIG);
1387  0013 721d5402      	bres	21506,#6
1388  0017               L565:
1389                     ; 346   ADC1->CR2 |= (uint8_t)(ADC1_ExtTrigger);
1391  0017 c65402        	ld	a,21506
1392  001a 1a01          	or	a,(OFST+1,sp)
1393  001c c75402        	ld	21506,a
1394                     ; 347 }
1397  001f 85            	popw	x
1398  0020 81            	ret
1422                     ; 358 void ADC1_StartConversion(void)
1422                     ; 359 {
1423                     .text:	section	.text,new
1424  0000               _ADC1_StartConversion:
1428                     ; 360   ADC1->CR1 |= ADC1_CR1_ADON;
1430  0000 72105401      	bset	21505,#0
1431                     ; 361 }
1434  0004 81            	ret
1478                     ; 370 uint16_t ADC1_GetConversionValue(void)
1478                     ; 371 {
1479                     .text:	section	.text,new
1480  0000               _ADC1_GetConversionValue:
1482  0000 5205          	subw	sp,#5
1483       00000005      OFST:	set	5
1486                     ; 372   uint16_t temph = 0;
1488  0002 1e04          	ldw	x,(OFST-1,sp)
1489                     ; 373   uint8_t templ = 0;
1491  0004 7b03          	ld	a,(OFST-2,sp)
1492  0006 97            	ld	xl,a
1493                     ; 375   if ((ADC1->CR2 & ADC1_CR2_ALIGN) != 0) /* Right alignment */
1495  0007 c65402        	ld	a,21506
1496  000a a508          	bcp	a,#8
1497  000c 2719          	jreq	L126
1498                     ; 378     templ = ADC1->DRL;
1500  000e c65405        	ld	a,21509
1501  0011 6b03          	ld	(OFST-2,sp),a
1502                     ; 380     temph = ADC1->DRH;
1504  0013 c65404        	ld	a,21508
1505  0016 5f            	clrw	x
1506  0017 97            	ld	xl,a
1507  0018 1f04          	ldw	(OFST-1,sp),x
1508                     ; 382     temph = (uint16_t)(templ | (uint16_t)(temph << (uint8_t)8));
1510  001a 1e04          	ldw	x,(OFST-1,sp)
1511  001c 4f            	clr	a
1512  001d 02            	rlwa	x,a
1513  001e 01            	rrwa	x,a
1514  001f 1a03          	or	a,(OFST-2,sp)
1515  0021 02            	rlwa	x,a
1516  0022 1f04          	ldw	(OFST-1,sp),x
1517  0024 01            	rrwa	x,a
1519  0025 2021          	jra	L326
1520  0027               L126:
1521                     ; 387     temph = ADC1->DRH;
1523  0027 c65404        	ld	a,21508
1524  002a 5f            	clrw	x
1525  002b 97            	ld	xl,a
1526  002c 1f04          	ldw	(OFST-1,sp),x
1527                     ; 389     templ = ADC1->DRL;
1529  002e c65405        	ld	a,21509
1530  0031 6b03          	ld	(OFST-2,sp),a
1531                     ; 391     temph = (uint16_t)((uint16_t)((uint16_t)templ << 6) | (uint16_t)((uint16_t)temph << 8));
1533  0033 1e04          	ldw	x,(OFST-1,sp)
1534  0035 4f            	clr	a
1535  0036 02            	rlwa	x,a
1536  0037 1f01          	ldw	(OFST-4,sp),x
1537  0039 7b03          	ld	a,(OFST-2,sp)
1538  003b 97            	ld	xl,a
1539  003c a640          	ld	a,#64
1540  003e 42            	mul	x,a
1541  003f 01            	rrwa	x,a
1542  0040 1a02          	or	a,(OFST-3,sp)
1543  0042 01            	rrwa	x,a
1544  0043 1a01          	or	a,(OFST-4,sp)
1545  0045 01            	rrwa	x,a
1546  0046 1f04          	ldw	(OFST-1,sp),x
1547  0048               L326:
1548                     ; 394   return ((uint16_t)temph);
1550  0048 1e04          	ldw	x,(OFST-1,sp)
1553  004a 5b05          	addw	sp,#5
1554  004c 81            	ret
1600                     ; 405 void ADC1_AWDChannelConfig(ADC1_Channel_TypeDef Channel, FunctionalState NewState)
1600                     ; 406 {
1601                     .text:	section	.text,new
1602  0000               _ADC1_AWDChannelConfig:
1604  0000 89            	pushw	x
1605       00000000      OFST:	set	0
1608                     ; 408   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1610                     ; 409   assert_param(IS_ADC1_CHANNEL_OK(Channel));
1612                     ; 411   if (Channel < (uint8_t)8)
1614  0001 9e            	ld	a,xh
1615  0002 a108          	cp	a,#8
1616  0004 242e          	jruge	L746
1617                     ; 413     if (NewState != DISABLE)
1619  0006 9f            	ld	a,xl
1620  0007 4d            	tnz	a
1621  0008 2714          	jreq	L156
1622                     ; 415       ADC1->AWCRL |= (uint8_t)((uint8_t)1 << Channel);
1624  000a 9e            	ld	a,xh
1625  000b 5f            	clrw	x
1626  000c 97            	ld	xl,a
1627  000d a601          	ld	a,#1
1628  000f 5d            	tnzw	x
1629  0010 2704          	jreq	L65
1630  0012               L06:
1631  0012 48            	sll	a
1632  0013 5a            	decw	x
1633  0014 26fc          	jrne	L06
1634  0016               L65:
1635  0016 ca540f        	or	a,21519
1636  0019 c7540f        	ld	21519,a
1638  001c 2047          	jra	L556
1639  001e               L156:
1640                     ; 419       ADC1->AWCRL &= (uint8_t)~(uint8_t)((uint8_t)1 << Channel);
1642  001e 7b01          	ld	a,(OFST+1,sp)
1643  0020 5f            	clrw	x
1644  0021 97            	ld	xl,a
1645  0022 a601          	ld	a,#1
1646  0024 5d            	tnzw	x
1647  0025 2704          	jreq	L26
1648  0027               L46:
1649  0027 48            	sll	a
1650  0028 5a            	decw	x
1651  0029 26fc          	jrne	L46
1652  002b               L26:
1653  002b 43            	cpl	a
1654  002c c4540f        	and	a,21519
1655  002f c7540f        	ld	21519,a
1656  0032 2031          	jra	L556
1657  0034               L746:
1658                     ; 424     if (NewState != DISABLE)
1660  0034 0d02          	tnz	(OFST+2,sp)
1661  0036 2717          	jreq	L756
1662                     ; 426       ADC1->AWCRH |= (uint8_t)((uint8_t)1 << (Channel - (uint8_t)8));
1664  0038 7b01          	ld	a,(OFST+1,sp)
1665  003a a008          	sub	a,#8
1666  003c 5f            	clrw	x
1667  003d 97            	ld	xl,a
1668  003e a601          	ld	a,#1
1669  0040 5d            	tnzw	x
1670  0041 2704          	jreq	L66
1671  0043               L07:
1672  0043 48            	sll	a
1673  0044 5a            	decw	x
1674  0045 26fc          	jrne	L07
1675  0047               L66:
1676  0047 ca540e        	or	a,21518
1677  004a c7540e        	ld	21518,a
1679  004d 2016          	jra	L556
1680  004f               L756:
1681                     ; 430       ADC1->AWCRH &= (uint8_t)~(uint8_t)((uint8_t)1 << (uint8_t)(Channel - (uint8_t)8));
1683  004f 7b01          	ld	a,(OFST+1,sp)
1684  0051 a008          	sub	a,#8
1685  0053 5f            	clrw	x
1686  0054 97            	ld	xl,a
1687  0055 a601          	ld	a,#1
1688  0057 5d            	tnzw	x
1689  0058 2704          	jreq	L27
1690  005a               L47:
1691  005a 48            	sll	a
1692  005b 5a            	decw	x
1693  005c 26fc          	jrne	L47
1694  005e               L27:
1695  005e 43            	cpl	a
1696  005f c4540e        	and	a,21518
1697  0062 c7540e        	ld	21518,a
1698  0065               L556:
1699                     ; 433 }
1702  0065 85            	popw	x
1703  0066 81            	ret
1738                     ; 441 void ADC1_SetHighThreshold(uint16_t Threshold)
1738                     ; 442 {
1739                     .text:	section	.text,new
1740  0000               _ADC1_SetHighThreshold:
1742  0000 89            	pushw	x
1743       00000000      OFST:	set	0
1746                     ; 443   ADC1->HTRH = (uint8_t)(Threshold >> (uint8_t)2);
1748  0001 54            	srlw	x
1749  0002 54            	srlw	x
1750  0003 9f            	ld	a,xl
1751  0004 c75408        	ld	21512,a
1752                     ; 444   ADC1->HTRL = (uint8_t)Threshold;
1754  0007 7b02          	ld	a,(OFST+2,sp)
1755  0009 c75409        	ld	21513,a
1756                     ; 445 }
1759  000c 85            	popw	x
1760  000d 81            	ret
1795                     ; 453 void ADC1_SetLowThreshold(uint16_t Threshold)
1795                     ; 454 {
1796                     .text:	section	.text,new
1797  0000               _ADC1_SetLowThreshold:
1801                     ; 455   ADC1->LTRL = (uint8_t)Threshold;
1803  0000 9f            	ld	a,xl
1804  0001 c7540b        	ld	21515,a
1805                     ; 456   ADC1->LTRH = (uint8_t)(Threshold >> (uint8_t)2);
1807  0004 54            	srlw	x
1808  0005 54            	srlw	x
1809  0006 9f            	ld	a,xl
1810  0007 c7540a        	ld	21514,a
1811                     ; 457 }
1814  000a 81            	ret
1867                     ; 466 uint16_t ADC1_GetBufferValue(uint8_t Buffer)
1867                     ; 467 {
1868                     .text:	section	.text,new
1869  0000               _ADC1_GetBufferValue:
1871  0000 88            	push	a
1872  0001 5205          	subw	sp,#5
1873       00000005      OFST:	set	5
1876                     ; 468   uint16_t temph = 0;
1878  0003 1e04          	ldw	x,(OFST-1,sp)
1879                     ; 469   uint8_t templ = 0;
1881  0005 7b03          	ld	a,(OFST-2,sp)
1882  0007 97            	ld	xl,a
1883                     ; 472   assert_param(IS_ADC1_BUFFER_OK(Buffer));
1885                     ; 474   if ((ADC1->CR2 & ADC1_CR2_ALIGN) != 0) /* Right alignment */
1887  0008 c65402        	ld	a,21506
1888  000b a508          	bcp	a,#8
1889  000d 2723          	jreq	L547
1890                     ; 477     templ = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1) + 1);
1892  000f 7b06          	ld	a,(OFST+1,sp)
1893  0011 48            	sll	a
1894  0012 5f            	clrw	x
1895  0013 97            	ld	xl,a
1896  0014 d653e1        	ld	a,(21473,x)
1897  0017 6b03          	ld	(OFST-2,sp),a
1898                     ; 479     temph = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1));
1900  0019 7b06          	ld	a,(OFST+1,sp)
1901  001b 48            	sll	a
1902  001c 5f            	clrw	x
1903  001d 97            	ld	xl,a
1904  001e d653e0        	ld	a,(21472,x)
1905  0021 5f            	clrw	x
1906  0022 97            	ld	xl,a
1907  0023 1f04          	ldw	(OFST-1,sp),x
1908                     ; 481     temph = (uint16_t)(templ | (uint16_t)(temph << (uint8_t)8));
1910  0025 1e04          	ldw	x,(OFST-1,sp)
1911  0027 4f            	clr	a
1912  0028 02            	rlwa	x,a
1913  0029 01            	rrwa	x,a
1914  002a 1a03          	or	a,(OFST-2,sp)
1915  002c 02            	rlwa	x,a
1916  002d 1f04          	ldw	(OFST-1,sp),x
1917  002f 01            	rrwa	x,a
1919  0030 202b          	jra	L747
1920  0032               L547:
1921                     ; 486     temph = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1));
1923  0032 7b06          	ld	a,(OFST+1,sp)
1924  0034 48            	sll	a
1925  0035 5f            	clrw	x
1926  0036 97            	ld	xl,a
1927  0037 d653e0        	ld	a,(21472,x)
1928  003a 5f            	clrw	x
1929  003b 97            	ld	xl,a
1930  003c 1f04          	ldw	(OFST-1,sp),x
1931                     ; 488     templ = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1) + 1);
1933  003e 7b06          	ld	a,(OFST+1,sp)
1934  0040 48            	sll	a
1935  0041 5f            	clrw	x
1936  0042 97            	ld	xl,a
1937  0043 d653e1        	ld	a,(21473,x)
1938  0046 6b03          	ld	(OFST-2,sp),a
1939                     ; 490     temph = (uint16_t)((uint16_t)((uint16_t)templ << 6) | (uint16_t)(temph << 8));
1941  0048 1e04          	ldw	x,(OFST-1,sp)
1942  004a 4f            	clr	a
1943  004b 02            	rlwa	x,a
1944  004c 1f01          	ldw	(OFST-4,sp),x
1945  004e 7b03          	ld	a,(OFST-2,sp)
1946  0050 97            	ld	xl,a
1947  0051 a640          	ld	a,#64
1948  0053 42            	mul	x,a
1949  0054 01            	rrwa	x,a
1950  0055 1a02          	or	a,(OFST-3,sp)
1951  0057 01            	rrwa	x,a
1952  0058 1a01          	or	a,(OFST-4,sp)
1953  005a 01            	rrwa	x,a
1954  005b 1f04          	ldw	(OFST-1,sp),x
1955  005d               L747:
1956                     ; 493   return ((uint16_t)temph);
1958  005d 1e04          	ldw	x,(OFST-1,sp)
1961  005f 5b06          	addw	sp,#6
1962  0061 81            	ret
2028                     ; 502 FlagStatus ADC1_GetAWDChannelStatus(ADC1_Channel_TypeDef Channel)
2028                     ; 503 {
2029                     .text:	section	.text,new
2030  0000               _ADC1_GetAWDChannelStatus:
2032  0000 88            	push	a
2033  0001 88            	push	a
2034       00000001      OFST:	set	1
2037                     ; 504   uint8_t status = 0;
2039  0002 0f01          	clr	(OFST+0,sp)
2040                     ; 507   assert_param(IS_ADC1_CHANNEL_OK(Channel));
2042                     ; 509   if (Channel < (uint8_t)8)
2044  0004 a108          	cp	a,#8
2045  0006 2412          	jruge	L3001
2046                     ; 511     status = (uint8_t)(ADC1->AWSRL & (uint8_t)((uint8_t)1 << Channel));
2048  0008 5f            	clrw	x
2049  0009 97            	ld	xl,a
2050  000a a601          	ld	a,#1
2051  000c 5d            	tnzw	x
2052  000d 2704          	jreq	L601
2053  000f               L011:
2054  000f 48            	sll	a
2055  0010 5a            	decw	x
2056  0011 26fc          	jrne	L011
2057  0013               L601:
2058  0013 c4540d        	and	a,21517
2059  0016 6b01          	ld	(OFST+0,sp),a
2061  0018 2014          	jra	L5001
2062  001a               L3001:
2063                     ; 515     status = (uint8_t)(ADC1->AWSRH & (uint8_t)((uint8_t)1 << (Channel - (uint8_t)8)));
2065  001a 7b02          	ld	a,(OFST+1,sp)
2066  001c a008          	sub	a,#8
2067  001e 5f            	clrw	x
2068  001f 97            	ld	xl,a
2069  0020 a601          	ld	a,#1
2070  0022 5d            	tnzw	x
2071  0023 2704          	jreq	L211
2072  0025               L411:
2073  0025 48            	sll	a
2074  0026 5a            	decw	x
2075  0027 26fc          	jrne	L411
2076  0029               L211:
2077  0029 c4540c        	and	a,21516
2078  002c 6b01          	ld	(OFST+0,sp),a
2079  002e               L5001:
2080                     ; 518   return ((FlagStatus)status);
2082  002e 7b01          	ld	a,(OFST+0,sp)
2085  0030 85            	popw	x
2086  0031 81            	ret
2244                     ; 527 FlagStatus ADC1_GetFlagStatus(ADC1_Flag_TypeDef Flag)
2244                     ; 528 {
2245                     .text:	section	.text,new
2246  0000               _ADC1_GetFlagStatus:
2248  0000 88            	push	a
2249  0001 88            	push	a
2250       00000001      OFST:	set	1
2253                     ; 529   uint8_t flagstatus = 0;
2255  0002 7b01          	ld	a,(OFST+0,sp)
2256  0004 97            	ld	xl,a
2257                     ; 530   uint8_t temp = 0;
2259  0005 7b01          	ld	a,(OFST+0,sp)
2260  0007 97            	ld	xl,a
2261                     ; 533   assert_param(IS_ADC1_FLAG_OK(Flag));
2263                     ; 535   if ((Flag & 0x0F) == 0x01)
2265  0008 7b02          	ld	a,(OFST+1,sp)
2266  000a a40f          	and	a,#15
2267  000c a101          	cp	a,#1
2268  000e 2609          	jrne	L5701
2269                     ; 538     flagstatus = (uint8_t)(ADC1->CR3 & ADC1_CR3_OVR);
2271  0010 c65403        	ld	a,21507
2272  0013 a440          	and	a,#64
2273  0015 6b01          	ld	(OFST+0,sp),a
2275  0017 2045          	jra	L7701
2276  0019               L5701:
2277                     ; 540   else if ((Flag & 0xF0) == 0x10)
2279  0019 7b02          	ld	a,(OFST+1,sp)
2280  001b a4f0          	and	a,#240
2281  001d a110          	cp	a,#16
2282  001f 2636          	jrne	L1011
2283                     ; 543     temp = (uint8_t)(Flag & (uint8_t)0x0F);
2285  0021 7b02          	ld	a,(OFST+1,sp)
2286  0023 a40f          	and	a,#15
2287  0025 6b01          	ld	(OFST+0,sp),a
2288                     ; 544     if (temp < 8)
2290  0027 7b01          	ld	a,(OFST+0,sp)
2291  0029 a108          	cp	a,#8
2292  002b 2414          	jruge	L3011
2293                     ; 546       flagstatus = (uint8_t)(ADC1->AWSRL & (uint8_t)((uint8_t)1 << temp));
2295  002d 7b01          	ld	a,(OFST+0,sp)
2296  002f 5f            	clrw	x
2297  0030 97            	ld	xl,a
2298  0031 a601          	ld	a,#1
2299  0033 5d            	tnzw	x
2300  0034 2704          	jreq	L021
2301  0036               L221:
2302  0036 48            	sll	a
2303  0037 5a            	decw	x
2304  0038 26fc          	jrne	L221
2305  003a               L021:
2306  003a c4540d        	and	a,21517
2307  003d 6b01          	ld	(OFST+0,sp),a
2309  003f 201d          	jra	L7701
2310  0041               L3011:
2311                     ; 550       flagstatus = (uint8_t)(ADC1->AWSRH & (uint8_t)((uint8_t)1 << (temp - 8)));
2313  0041 7b01          	ld	a,(OFST+0,sp)
2314  0043 a008          	sub	a,#8
2315  0045 5f            	clrw	x
2316  0046 97            	ld	xl,a
2317  0047 a601          	ld	a,#1
2318  0049 5d            	tnzw	x
2319  004a 2704          	jreq	L421
2320  004c               L621:
2321  004c 48            	sll	a
2322  004d 5a            	decw	x
2323  004e 26fc          	jrne	L621
2324  0050               L421:
2325  0050 c4540c        	and	a,21516
2326  0053 6b01          	ld	(OFST+0,sp),a
2327  0055 2007          	jra	L7701
2328  0057               L1011:
2329                     ; 555     flagstatus = (uint8_t)(ADC1->CSR & Flag);
2331  0057 c65400        	ld	a,21504
2332  005a 1402          	and	a,(OFST+1,sp)
2333  005c 6b01          	ld	(OFST+0,sp),a
2334  005e               L7701:
2335                     ; 557   return ((FlagStatus)flagstatus);
2337  005e 7b01          	ld	a,(OFST+0,sp)
2340  0060 85            	popw	x
2341  0061 81            	ret
2385                     ; 567 void ADC1_ClearFlag(ADC1_Flag_TypeDef Flag)
2385                     ; 568 {
2386                     .text:	section	.text,new
2387  0000               _ADC1_ClearFlag:
2389  0000 88            	push	a
2390  0001 88            	push	a
2391       00000001      OFST:	set	1
2394                     ; 569   uint8_t temp = 0;
2396  0002 0f01          	clr	(OFST+0,sp)
2397                     ; 572   assert_param(IS_ADC1_FLAG_OK(Flag));
2399                     ; 574   if ((Flag & 0x0F) == 0x01)
2401  0004 a40f          	and	a,#15
2402  0006 a101          	cp	a,#1
2403  0008 2606          	jrne	L3311
2404                     ; 577     ADC1->CR3 &= (uint8_t)(~ADC1_CR3_OVR);
2406  000a 721d5403      	bres	21507,#6
2408  000e 204b          	jra	L5311
2409  0010               L3311:
2410                     ; 579   else if ((Flag & 0xF0) == 0x10)
2412  0010 7b02          	ld	a,(OFST+1,sp)
2413  0012 a4f0          	and	a,#240
2414  0014 a110          	cp	a,#16
2415  0016 263a          	jrne	L7311
2416                     ; 582     temp = (uint8_t)(Flag & (uint8_t)0x0F);
2418  0018 7b02          	ld	a,(OFST+1,sp)
2419  001a a40f          	and	a,#15
2420  001c 6b01          	ld	(OFST+0,sp),a
2421                     ; 583     if (temp < 8)
2423  001e 7b01          	ld	a,(OFST+0,sp)
2424  0020 a108          	cp	a,#8
2425  0022 2416          	jruge	L1411
2426                     ; 585       ADC1->AWSRL &= (uint8_t)~(uint8_t)((uint8_t)1 << temp);
2428  0024 7b01          	ld	a,(OFST+0,sp)
2429  0026 5f            	clrw	x
2430  0027 97            	ld	xl,a
2431  0028 a601          	ld	a,#1
2432  002a 5d            	tnzw	x
2433  002b 2704          	jreq	L231
2434  002d               L431:
2435  002d 48            	sll	a
2436  002e 5a            	decw	x
2437  002f 26fc          	jrne	L431
2438  0031               L231:
2439  0031 43            	cpl	a
2440  0032 c4540d        	and	a,21517
2441  0035 c7540d        	ld	21517,a
2443  0038 2021          	jra	L5311
2444  003a               L1411:
2445                     ; 589       ADC1->AWSRH &= (uint8_t)~(uint8_t)((uint8_t)1 << (temp - 8));
2447  003a 7b01          	ld	a,(OFST+0,sp)
2448  003c a008          	sub	a,#8
2449  003e 5f            	clrw	x
2450  003f 97            	ld	xl,a
2451  0040 a601          	ld	a,#1
2452  0042 5d            	tnzw	x
2453  0043 2704          	jreq	L631
2454  0045               L041:
2455  0045 48            	sll	a
2456  0046 5a            	decw	x
2457  0047 26fc          	jrne	L041
2458  0049               L631:
2459  0049 43            	cpl	a
2460  004a c4540c        	and	a,21516
2461  004d c7540c        	ld	21516,a
2462  0050 2009          	jra	L5311
2463  0052               L7311:
2464                     ; 594     ADC1->CSR &= (uint8_t) (~Flag);
2466  0052 7b02          	ld	a,(OFST+1,sp)
2467  0054 43            	cpl	a
2468  0055 c45400        	and	a,21504
2469  0058 c75400        	ld	21504,a
2470  005b               L5311:
2471                     ; 596 }
2474  005b 85            	popw	x
2475  005c 81            	ret
2530                     ; 616 ITStatus ADC1_GetITStatus(ADC1_IT_TypeDef ITPendingBit)
2530                     ; 617 {
2531                     .text:	section	.text,new
2532  0000               _ADC1_GetITStatus:
2534  0000 89            	pushw	x
2535  0001 88            	push	a
2536       00000001      OFST:	set	1
2539                     ; 618   ITStatus itstatus = RESET;
2541  0002 7b01          	ld	a,(OFST+0,sp)
2542  0004 97            	ld	xl,a
2543                     ; 619   uint8_t temp = 0;
2545  0005 7b01          	ld	a,(OFST+0,sp)
2546  0007 97            	ld	xl,a
2547                     ; 622   assert_param(IS_ADC1_ITPENDINGBIT_OK(ITPendingBit));
2549                     ; 624   if (((uint16_t)ITPendingBit & 0xF0) == 0x10)
2551  0008 7b02          	ld	a,(OFST+1,sp)
2552  000a 97            	ld	xl,a
2553  000b 7b03          	ld	a,(OFST+2,sp)
2554  000d a4f0          	and	a,#240
2555  000f 5f            	clrw	x
2556  0010 02            	rlwa	x,a
2557  0011 a30010        	cpw	x,#16
2558  0014 2636          	jrne	L5711
2559                     ; 627     temp = (uint8_t)((uint16_t)ITPendingBit & 0x0F);
2561  0016 7b03          	ld	a,(OFST+2,sp)
2562  0018 a40f          	and	a,#15
2563  001a 6b01          	ld	(OFST+0,sp),a
2564                     ; 628     if (temp < 8)
2566  001c 7b01          	ld	a,(OFST+0,sp)
2567  001e a108          	cp	a,#8
2568  0020 2414          	jruge	L7711
2569                     ; 630       itstatus = (ITStatus)(ADC1->AWSRL & (uint8_t)((uint8_t)1 << temp));
2571  0022 7b01          	ld	a,(OFST+0,sp)
2572  0024 5f            	clrw	x
2573  0025 97            	ld	xl,a
2574  0026 a601          	ld	a,#1
2575  0028 5d            	tnzw	x
2576  0029 2704          	jreq	L441
2577  002b               L641:
2578  002b 48            	sll	a
2579  002c 5a            	decw	x
2580  002d 26fc          	jrne	L641
2581  002f               L441:
2582  002f c4540d        	and	a,21517
2583  0032 6b01          	ld	(OFST+0,sp),a
2585  0034 201d          	jra	L3021
2586  0036               L7711:
2587                     ; 634       itstatus = (ITStatus)(ADC1->AWSRH & (uint8_t)((uint8_t)1 << (temp - 8)));
2589  0036 7b01          	ld	a,(OFST+0,sp)
2590  0038 a008          	sub	a,#8
2591  003a 5f            	clrw	x
2592  003b 97            	ld	xl,a
2593  003c a601          	ld	a,#1
2594  003e 5d            	tnzw	x
2595  003f 2704          	jreq	L051
2596  0041               L251:
2597  0041 48            	sll	a
2598  0042 5a            	decw	x
2599  0043 26fc          	jrne	L251
2600  0045               L051:
2601  0045 c4540c        	and	a,21516
2602  0048 6b01          	ld	(OFST+0,sp),a
2603  004a 2007          	jra	L3021
2604  004c               L5711:
2605                     ; 639     itstatus = (ITStatus)(ADC1->CSR & (uint8_t)ITPendingBit);
2607  004c c65400        	ld	a,21504
2608  004f 1403          	and	a,(OFST+2,sp)
2609  0051 6b01          	ld	(OFST+0,sp),a
2610  0053               L3021:
2611                     ; 641   return ((ITStatus)itstatus);
2613  0053 7b01          	ld	a,(OFST+0,sp)
2616  0055 5b03          	addw	sp,#3
2617  0057 81            	ret
2662                     ; 662 void ADC1_ClearITPendingBit(ADC1_IT_TypeDef ITPendingBit)
2662                     ; 663 {
2663                     .text:	section	.text,new
2664  0000               _ADC1_ClearITPendingBit:
2666  0000 89            	pushw	x
2667  0001 88            	push	a
2668       00000001      OFST:	set	1
2671                     ; 664   uint8_t temp = 0;
2673  0002 0f01          	clr	(OFST+0,sp)
2674                     ; 667   assert_param(IS_ADC1_ITPENDINGBIT_OK(ITPendingBit));
2676                     ; 669   if (((uint16_t)ITPendingBit & 0xF0) == 0x10)
2678  0004 01            	rrwa	x,a
2679  0005 a4f0          	and	a,#240
2680  0007 5f            	clrw	x
2681  0008 02            	rlwa	x,a
2682  0009 a30010        	cpw	x,#16
2683  000c 263a          	jrne	L7221
2684                     ; 672     temp = (uint8_t)((uint16_t)ITPendingBit & 0x0F);
2686  000e 7b03          	ld	a,(OFST+2,sp)
2687  0010 a40f          	and	a,#15
2688  0012 6b01          	ld	(OFST+0,sp),a
2689                     ; 673     if (temp < 8)
2691  0014 7b01          	ld	a,(OFST+0,sp)
2692  0016 a108          	cp	a,#8
2693  0018 2416          	jruge	L1321
2694                     ; 675       ADC1->AWSRL &= (uint8_t)~(uint8_t)((uint8_t)1 << temp);
2696  001a 7b01          	ld	a,(OFST+0,sp)
2697  001c 5f            	clrw	x
2698  001d 97            	ld	xl,a
2699  001e a601          	ld	a,#1
2700  0020 5d            	tnzw	x
2701  0021 2704          	jreq	L651
2702  0023               L061:
2703  0023 48            	sll	a
2704  0024 5a            	decw	x
2705  0025 26fc          	jrne	L061
2706  0027               L651:
2707  0027 43            	cpl	a
2708  0028 c4540d        	and	a,21517
2709  002b c7540d        	ld	21517,a
2711  002e 2021          	jra	L5321
2712  0030               L1321:
2713                     ; 679       ADC1->AWSRH &= (uint8_t)~(uint8_t)((uint8_t)1 << (temp - 8));
2715  0030 7b01          	ld	a,(OFST+0,sp)
2716  0032 a008          	sub	a,#8
2717  0034 5f            	clrw	x
2718  0035 97            	ld	xl,a
2719  0036 a601          	ld	a,#1
2720  0038 5d            	tnzw	x
2721  0039 2704          	jreq	L261
2722  003b               L461:
2723  003b 48            	sll	a
2724  003c 5a            	decw	x
2725  003d 26fc          	jrne	L461
2726  003f               L261:
2727  003f 43            	cpl	a
2728  0040 c4540c        	and	a,21516
2729  0043 c7540c        	ld	21516,a
2730  0046 2009          	jra	L5321
2731  0048               L7221:
2732                     ; 684     ADC1->CSR &= (uint8_t)((uint16_t)~(uint16_t)ITPendingBit);
2734  0048 7b03          	ld	a,(OFST+2,sp)
2735  004a 43            	cpl	a
2736  004b c45400        	and	a,21504
2737  004e c75400        	ld	21504,a
2738  0051               L5321:
2739                     ; 686 }
2742  0051 5b03          	addw	sp,#3
2743  0053 81            	ret
2756                     	xdef	_ADC1_ClearITPendingBit
2757                     	xdef	_ADC1_GetITStatus
2758                     	xdef	_ADC1_ClearFlag
2759                     	xdef	_ADC1_GetFlagStatus
2760                     	xdef	_ADC1_GetAWDChannelStatus
2761                     	xdef	_ADC1_GetBufferValue
2762                     	xdef	_ADC1_SetLowThreshold
2763                     	xdef	_ADC1_SetHighThreshold
2764                     	xdef	_ADC1_GetConversionValue
2765                     	xdef	_ADC1_StartConversion
2766                     	xdef	_ADC1_AWDChannelConfig
2767                     	xdef	_ADC1_ExternalTriggerConfig
2768                     	xdef	_ADC1_ConversionConfig
2769                     	xdef	_ADC1_SchmittTriggerConfig
2770                     	xdef	_ADC1_PrescalerConfig
2771                     	xdef	_ADC1_ITConfig
2772                     	xdef	_ADC1_DataBufferCmd
2773                     	xdef	_ADC1_ScanModeCmd
2774                     	xdef	_ADC1_Cmd
2775                     	xdef	_ADC1_Init
2776                     	xdef	_ADC1_DeInit
2795                     	end
