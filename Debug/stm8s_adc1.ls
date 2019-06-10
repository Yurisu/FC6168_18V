   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
  45                     ; 52 void ADC1_DeInit(void)
  45                     ; 53 {
  47                     .text:	section	.text,new
  48  0000               _ADC1_DeInit:
  52                     ; 54   ADC1->CSR  = ADC1_CSR_RESET_VALUE;
  54  0000 725f5400      	clr	21504
  55                     ; 55   ADC1->CR1  = ADC1_CR1_RESET_VALUE;
  57  0004 725f5401      	clr	21505
  58                     ; 56   ADC1->CR2  = ADC1_CR2_RESET_VALUE;
  60  0008 725f5402      	clr	21506
  61                     ; 57   ADC1->CR3  = ADC1_CR3_RESET_VALUE;
  63  000c 725f5403      	clr	21507
  64                     ; 58   ADC1->TDRH = ADC1_TDRH_RESET_VALUE;
  66  0010 725f5406      	clr	21510
  67                     ; 59   ADC1->TDRL = ADC1_TDRL_RESET_VALUE;
  69  0014 725f5407      	clr	21511
  70                     ; 60   ADC1->HTRH = ADC1_HTRH_RESET_VALUE;
  72  0018 35ff5408      	mov	21512,#255
  73                     ; 61   ADC1->HTRL = ADC1_HTRL_RESET_VALUE;
  75  001c 35035409      	mov	21513,#3
  76                     ; 62   ADC1->LTRH = ADC1_LTRH_RESET_VALUE;
  78  0020 725f540a      	clr	21514
  79                     ; 63   ADC1->LTRL = ADC1_LTRL_RESET_VALUE;
  81  0024 725f540b      	clr	21515
  82                     ; 64   ADC1->AWCRH = ADC1_AWCRH_RESET_VALUE;
  84  0028 725f540e      	clr	21518
  85                     ; 65   ADC1->AWCRL = ADC1_AWCRL_RESET_VALUE;
  87  002c 725f540f      	clr	21519
  88                     ; 66 }
  91  0030 81            	ret
 542                     ; 88 void ADC1_Init(ADC1_ConvMode_TypeDef ADC1_ConversionMode, ADC1_Channel_TypeDef ADC1_Channel, ADC1_PresSel_TypeDef ADC1_PrescalerSelection, ADC1_ExtTrig_TypeDef ADC1_ExtTrigger, FunctionalState ADC1_ExtTriggerState, ADC1_Align_TypeDef ADC1_Align, ADC1_SchmittTrigg_TypeDef ADC1_SchmittTriggerChannel, FunctionalState ADC1_SchmittTriggerState)
 542                     ; 89 {
 543                     .text:	section	.text,new
 544  0000               _ADC1_Init:
 546  0000 89            	pushw	x
 547       00000000      OFST:	set	0
 550                     ; 91   assert_param(IS_ADC1_CONVERSIONMODE_OK(ADC1_ConversionMode));
 552                     ; 92   assert_param(IS_ADC1_CHANNEL_OK(ADC1_Channel));
 554                     ; 93   assert_param(IS_ADC1_PRESSEL_OK(ADC1_PrescalerSelection));
 556                     ; 94   assert_param(IS_ADC1_EXTTRIG_OK(ADC1_ExtTrigger));
 558                     ; 95   assert_param(IS_FUNCTIONALSTATE_OK(((ADC1_ExtTriggerState))));
 560                     ; 96   assert_param(IS_ADC1_ALIGN_OK(ADC1_Align));
 562                     ; 97   assert_param(IS_ADC1_SCHMITTTRIG_OK(ADC1_SchmittTriggerChannel));
 564                     ; 98   assert_param(IS_FUNCTIONALSTATE_OK(ADC1_SchmittTriggerState));
 566                     ; 103   ADC1_ConversionConfig(ADC1_ConversionMode, ADC1_Channel, ADC1_Align);
 568  0001 7b08          	ld	a,(OFST+8,sp)
 569  0003 88            	push	a
 570  0004 9f            	ld	a,xl
 571  0005 97            	ld	xl,a
 572  0006 7b02          	ld	a,(OFST+2,sp)
 573  0008 95            	ld	xh,a
 574  0009 cd0000        	call	_ADC1_ConversionConfig
 576  000c 84            	pop	a
 577                     ; 105   ADC1_PrescalerConfig(ADC1_PrescalerSelection);
 579  000d 7b05          	ld	a,(OFST+5,sp)
 580  000f cd0000        	call	_ADC1_PrescalerConfig
 582                     ; 110   ADC1_ExternalTriggerConfig(ADC1_ExtTrigger, ADC1_ExtTriggerState);
 584  0012 7b07          	ld	a,(OFST+7,sp)
 585  0014 97            	ld	xl,a
 586  0015 7b06          	ld	a,(OFST+6,sp)
 587  0017 95            	ld	xh,a
 588  0018 cd0000        	call	_ADC1_ExternalTriggerConfig
 590                     ; 115   ADC1_SchmittTriggerConfig(ADC1_SchmittTriggerChannel, ADC1_SchmittTriggerState);
 592  001b 7b0a          	ld	a,(OFST+10,sp)
 593  001d 97            	ld	xl,a
 594  001e 7b09          	ld	a,(OFST+9,sp)
 595  0020 95            	ld	xh,a
 596  0021 cd0000        	call	_ADC1_SchmittTriggerConfig
 598                     ; 118   ADC1->CR1 |= ADC1_CR1_ADON;
 600  0024 72105401      	bset	21505,#0
 601                     ; 119 }
 604  0028 85            	popw	x
 605  0029 81            	ret
 640                     ; 126 void ADC1_Cmd(FunctionalState NewState)
 640                     ; 127 {
 641                     .text:	section	.text,new
 642  0000               _ADC1_Cmd:
 646                     ; 129   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 648                     ; 131   if (NewState != DISABLE)
 650  0000 4d            	tnz	a
 651  0001 2706          	jreq	L362
 652                     ; 133     ADC1->CR1 |= ADC1_CR1_ADON;
 654  0003 72105401      	bset	21505,#0
 656  0007 2004          	jra	L562
 657  0009               L362:
 658                     ; 137     ADC1->CR1 &= (uint8_t)(~ADC1_CR1_ADON);
 660  0009 72115401      	bres	21505,#0
 661  000d               L562:
 662                     ; 139 }
 665  000d 81            	ret
 700                     ; 146 void ADC1_ScanModeCmd(FunctionalState NewState)
 700                     ; 147 {
 701                     .text:	section	.text,new
 702  0000               _ADC1_ScanModeCmd:
 706                     ; 149   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 708                     ; 151   if (NewState != DISABLE)
 710  0000 4d            	tnz	a
 711  0001 2706          	jreq	L503
 712                     ; 153     ADC1->CR2 |= ADC1_CR2_SCAN;
 714  0003 72125402      	bset	21506,#1
 716  0007 2004          	jra	L703
 717  0009               L503:
 718                     ; 157     ADC1->CR2 &= (uint8_t)(~ADC1_CR2_SCAN);
 720  0009 72135402      	bres	21506,#1
 721  000d               L703:
 722                     ; 159 }
 725  000d 81            	ret
 760                     ; 166 void ADC1_DataBufferCmd(FunctionalState NewState)
 760                     ; 167 {
 761                     .text:	section	.text,new
 762  0000               _ADC1_DataBufferCmd:
 766                     ; 169   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 768                     ; 171   if (NewState != DISABLE)
 770  0000 4d            	tnz	a
 771  0001 2706          	jreq	L723
 772                     ; 173     ADC1->CR3 |= ADC1_CR3_DBUF;
 774  0003 721e5403      	bset	21507,#7
 776  0007 2004          	jra	L133
 777  0009               L723:
 778                     ; 177     ADC1->CR3 &= (uint8_t)(~ADC1_CR3_DBUF);
 780  0009 721f5403      	bres	21507,#7
 781  000d               L133:
 782                     ; 179 }
 785  000d 81            	ret
 941                     ; 190 void ADC1_ITConfig(ADC1_IT_TypeDef ADC1_IT, FunctionalState NewState)
 941                     ; 191 {
 942                     .text:	section	.text,new
 943  0000               _ADC1_ITConfig:
 945  0000 89            	pushw	x
 946       00000000      OFST:	set	0
 949                     ; 193   assert_param(IS_ADC1_IT_OK(ADC1_IT));
 951                     ; 194   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 953                     ; 196   if (NewState != DISABLE)
 955  0001 0d05          	tnz	(OFST+5,sp)
 956  0003 2709          	jreq	L714
 957                     ; 199     ADC1->CSR |= (uint8_t)ADC1_IT;
 959  0005 9f            	ld	a,xl
 960  0006 ca5400        	or	a,21504
 961  0009 c75400        	ld	21504,a
 963  000c 2009          	jra	L124
 964  000e               L714:
 965                     ; 204     ADC1->CSR &= (uint8_t)((uint16_t)~(uint16_t)ADC1_IT);
 967  000e 7b02          	ld	a,(OFST+2,sp)
 968  0010 43            	cpl	a
 969  0011 c45400        	and	a,21504
 970  0014 c75400        	ld	21504,a
 971  0017               L124:
 972                     ; 206 }
 975  0017 85            	popw	x
 976  0018 81            	ret
1012                     ; 214 void ADC1_PrescalerConfig(ADC1_PresSel_TypeDef ADC1_Prescaler)
1012                     ; 215 {
1013                     .text:	section	.text,new
1014  0000               _ADC1_PrescalerConfig:
1016  0000 88            	push	a
1017       00000000      OFST:	set	0
1020                     ; 217   assert_param(IS_ADC1_PRESSEL_OK(ADC1_Prescaler));
1022                     ; 220   ADC1->CR1 &= (uint8_t)(~ADC1_CR1_SPSEL);
1024  0001 c65401        	ld	a,21505
1025  0004 a48f          	and	a,#143
1026  0006 c75401        	ld	21505,a
1027                     ; 222   ADC1->CR1 |= (uint8_t)(ADC1_Prescaler);
1029  0009 c65401        	ld	a,21505
1030  000c 1a01          	or	a,(OFST+1,sp)
1031  000e c75401        	ld	21505,a
1032                     ; 223 }
1035  0011 84            	pop	a
1036  0012 81            	ret
1083                     ; 233 void ADC1_SchmittTriggerConfig(ADC1_SchmittTrigg_TypeDef ADC1_SchmittTriggerChannel, FunctionalState NewState)
1083                     ; 234 {
1084                     .text:	section	.text,new
1085  0000               _ADC1_SchmittTriggerConfig:
1087  0000 89            	pushw	x
1088       00000000      OFST:	set	0
1091                     ; 236   assert_param(IS_ADC1_SCHMITTTRIG_OK(ADC1_SchmittTriggerChannel));
1093                     ; 237   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1095                     ; 239   if (ADC1_SchmittTriggerChannel == ADC1_SCHMITTTRIG_ALL)
1097  0001 9e            	ld	a,xh
1098  0002 a1ff          	cp	a,#255
1099  0004 2620          	jrne	L364
1100                     ; 241     if (NewState != DISABLE)
1102  0006 9f            	ld	a,xl
1103  0007 4d            	tnz	a
1104  0008 270a          	jreq	L564
1105                     ; 243       ADC1->TDRL &= (uint8_t)0x0;
1107  000a 725f5407      	clr	21511
1108                     ; 244       ADC1->TDRH &= (uint8_t)0x0;
1110  000e 725f5406      	clr	21510
1112  0012 2078          	jra	L174
1113  0014               L564:
1114                     ; 248       ADC1->TDRL |= (uint8_t)0xFF;
1116  0014 c65407        	ld	a,21511
1117  0017 aaff          	or	a,#255
1118  0019 c75407        	ld	21511,a
1119                     ; 249       ADC1->TDRH |= (uint8_t)0xFF;
1121  001c c65406        	ld	a,21510
1122  001f aaff          	or	a,#255
1123  0021 c75406        	ld	21510,a
1124  0024 2066          	jra	L174
1125  0026               L364:
1126                     ; 252   else if (ADC1_SchmittTriggerChannel < ADC1_SCHMITTTRIG_CHANNEL8)
1128  0026 7b01          	ld	a,(OFST+1,sp)
1129  0028 a108          	cp	a,#8
1130  002a 242f          	jruge	L374
1131                     ; 254     if (NewState != DISABLE)
1133  002c 0d02          	tnz	(OFST+2,sp)
1134  002e 2716          	jreq	L574
1135                     ; 256       ADC1->TDRL &= (uint8_t)(~(uint8_t)((uint8_t)0x01 << (uint8_t)ADC1_SchmittTriggerChannel));
1137  0030 7b01          	ld	a,(OFST+1,sp)
1138  0032 5f            	clrw	x
1139  0033 97            	ld	xl,a
1140  0034 a601          	ld	a,#1
1141  0036 5d            	tnzw	x
1142  0037 2704          	jreq	L42
1143  0039               L62:
1144  0039 48            	sll	a
1145  003a 5a            	decw	x
1146  003b 26fc          	jrne	L62
1147  003d               L42:
1148  003d 43            	cpl	a
1149  003e c45407        	and	a,21511
1150  0041 c75407        	ld	21511,a
1152  0044 2046          	jra	L174
1153  0046               L574:
1154                     ; 260       ADC1->TDRL |= (uint8_t)((uint8_t)0x01 << (uint8_t)ADC1_SchmittTriggerChannel);
1156  0046 7b01          	ld	a,(OFST+1,sp)
1157  0048 5f            	clrw	x
1158  0049 97            	ld	xl,a
1159  004a a601          	ld	a,#1
1160  004c 5d            	tnzw	x
1161  004d 2704          	jreq	L03
1162  004f               L23:
1163  004f 48            	sll	a
1164  0050 5a            	decw	x
1165  0051 26fc          	jrne	L23
1166  0053               L03:
1167  0053 ca5407        	or	a,21511
1168  0056 c75407        	ld	21511,a
1169  0059 2031          	jra	L174
1170  005b               L374:
1171                     ; 265     if (NewState != DISABLE)
1173  005b 0d02          	tnz	(OFST+2,sp)
1174  005d 2718          	jreq	L305
1175                     ; 267       ADC1->TDRH &= (uint8_t)(~(uint8_t)((uint8_t)0x01 << ((uint8_t)ADC1_SchmittTriggerChannel - (uint8_t)8)));
1177  005f 7b01          	ld	a,(OFST+1,sp)
1178  0061 a008          	sub	a,#8
1179  0063 5f            	clrw	x
1180  0064 97            	ld	xl,a
1181  0065 a601          	ld	a,#1
1182  0067 5d            	tnzw	x
1183  0068 2704          	jreq	L43
1184  006a               L63:
1185  006a 48            	sll	a
1186  006b 5a            	decw	x
1187  006c 26fc          	jrne	L63
1188  006e               L43:
1189  006e 43            	cpl	a
1190  006f c45406        	and	a,21510
1191  0072 c75406        	ld	21510,a
1193  0075 2015          	jra	L174
1194  0077               L305:
1195                     ; 271       ADC1->TDRH |= (uint8_t)((uint8_t)0x01 << ((uint8_t)ADC1_SchmittTriggerChannel - (uint8_t)8));
1197  0077 7b01          	ld	a,(OFST+1,sp)
1198  0079 a008          	sub	a,#8
1199  007b 5f            	clrw	x
1200  007c 97            	ld	xl,a
1201  007d a601          	ld	a,#1
1202  007f 5d            	tnzw	x
1203  0080 2704          	jreq	L04
1204  0082               L24:
1205  0082 48            	sll	a
1206  0083 5a            	decw	x
1207  0084 26fc          	jrne	L24
1208  0086               L04:
1209  0086 ca5406        	or	a,21510
1210  0089 c75406        	ld	21510,a
1211  008c               L174:
1212                     ; 274 }
1215  008c 85            	popw	x
1216  008d 81            	ret
1273                     ; 286 void ADC1_ConversionConfig(ADC1_ConvMode_TypeDef ADC1_ConversionMode, ADC1_Channel_TypeDef ADC1_Channel, ADC1_Align_TypeDef ADC1_Align)
1273                     ; 287 {
1274                     .text:	section	.text,new
1275  0000               _ADC1_ConversionConfig:
1277  0000 89            	pushw	x
1278       00000000      OFST:	set	0
1281                     ; 289   assert_param(IS_ADC1_CONVERSIONMODE_OK(ADC1_ConversionMode));
1283                     ; 290   assert_param(IS_ADC1_CHANNEL_OK(ADC1_Channel));
1285                     ; 291   assert_param(IS_ADC1_ALIGN_OK(ADC1_Align));
1287                     ; 294   ADC1->CR2 &= (uint8_t)(~ADC1_CR2_ALIGN);
1289  0001 72175402      	bres	21506,#3
1290                     ; 296   ADC1->CR2 |= (uint8_t)(ADC1_Align);
1292  0005 c65402        	ld	a,21506
1293  0008 1a05          	or	a,(OFST+5,sp)
1294  000a c75402        	ld	21506,a
1295                     ; 298   if (ADC1_ConversionMode == ADC1_CONVERSIONMODE_CONTINUOUS)
1297  000d 9e            	ld	a,xh
1298  000e a101          	cp	a,#1
1299  0010 2606          	jrne	L535
1300                     ; 301     ADC1->CR1 |= ADC1_CR1_CONT;
1302  0012 72125401      	bset	21505,#1
1304  0016 2004          	jra	L735
1305  0018               L535:
1306                     ; 306     ADC1->CR1 &= (uint8_t)(~ADC1_CR1_CONT);
1308  0018 72135401      	bres	21505,#1
1309  001c               L735:
1310                     ; 310   ADC1->CSR &= (uint8_t)(~ADC1_CSR_CH);
1312  001c c65400        	ld	a,21504
1313  001f a4f0          	and	a,#240
1314  0021 c75400        	ld	21504,a
1315                     ; 312   ADC1->CSR |= (uint8_t)(ADC1_Channel);
1317  0024 c65400        	ld	a,21504
1318  0027 1a02          	or	a,(OFST+2,sp)
1319  0029 c75400        	ld	21504,a
1320                     ; 313 }
1323  002c 85            	popw	x
1324  002d 81            	ret
1370                     ; 325 void ADC1_ExternalTriggerConfig(ADC1_ExtTrig_TypeDef ADC1_ExtTrigger, FunctionalState NewState)
1370                     ; 326 {
1371                     .text:	section	.text,new
1372  0000               _ADC1_ExternalTriggerConfig:
1374  0000 89            	pushw	x
1375       00000000      OFST:	set	0
1378                     ; 328   assert_param(IS_ADC1_EXTTRIG_OK(ADC1_ExtTrigger));
1380                     ; 329   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1382                     ; 332   ADC1->CR2 &= (uint8_t)(~ADC1_CR2_EXTSEL);
1384  0001 c65402        	ld	a,21506
1385  0004 a4cf          	and	a,#207
1386  0006 c75402        	ld	21506,a
1387                     ; 334   if (NewState != DISABLE)
1389  0009 9f            	ld	a,xl
1390  000a 4d            	tnz	a
1391  000b 2706          	jreq	L365
1392                     ; 337     ADC1->CR2 |= (uint8_t)(ADC1_CR2_EXTTRIG);
1394  000d 721c5402      	bset	21506,#6
1396  0011 2004          	jra	L565
1397  0013               L365:
1398                     ; 342     ADC1->CR2 &= (uint8_t)(~ADC1_CR2_EXTTRIG);
1400  0013 721d5402      	bres	21506,#6
1401  0017               L565:
1402                     ; 346   ADC1->CR2 |= (uint8_t)(ADC1_ExtTrigger);
1404  0017 c65402        	ld	a,21506
1405  001a 1a01          	or	a,(OFST+1,sp)
1406  001c c75402        	ld	21506,a
1407                     ; 347 }
1410  001f 85            	popw	x
1411  0020 81            	ret
1435                     ; 358 void ADC1_StartConversion(void)
1435                     ; 359 {
1436                     .text:	section	.text,new
1437  0000               _ADC1_StartConversion:
1441                     ; 360   ADC1->CR1 |= ADC1_CR1_ADON;
1443  0000 72105401      	bset	21505,#0
1444                     ; 361 }
1447  0004 81            	ret
1491                     ; 370 uint16_t ADC1_GetConversionValue(void)
1491                     ; 371 {
1492                     .text:	section	.text,new
1493  0000               _ADC1_GetConversionValue:
1495  0000 5205          	subw	sp,#5
1496       00000005      OFST:	set	5
1499                     ; 372   uint16_t temph = 0;
1501                     ; 373   uint8_t templ = 0;
1503                     ; 375   if ((ADC1->CR2 & ADC1_CR2_ALIGN) != 0) /* Right alignment */
1505  0002 c65402        	ld	a,21506
1506  0005 a508          	bcp	a,#8
1507  0007 2715          	jreq	L126
1508                     ; 378     templ = ADC1->DRL;
1510  0009 c65405        	ld	a,21509
1511  000c 6b03          	ld	(OFST-2,sp),a
1512                     ; 380     temph = ADC1->DRH;
1514  000e c65404        	ld	a,21508
1515  0011 5f            	clrw	x
1516  0012 97            	ld	xl,a
1517  0013 1f04          	ldw	(OFST-1,sp),x
1518                     ; 382     temph = (uint16_t)(templ | (uint16_t)(temph << (uint8_t)8));
1520  0015 1e04          	ldw	x,(OFST-1,sp)
1521  0017 7b03          	ld	a,(OFST-2,sp)
1522  0019 02            	rlwa	x,a
1523  001a 1f04          	ldw	(OFST-1,sp),x
1525  001c 2021          	jra	L326
1526  001e               L126:
1527                     ; 387     temph = ADC1->DRH;
1529  001e c65404        	ld	a,21508
1530  0021 5f            	clrw	x
1531  0022 97            	ld	xl,a
1532  0023 1f04          	ldw	(OFST-1,sp),x
1533                     ; 389     templ = ADC1->DRL;
1535  0025 c65405        	ld	a,21509
1536  0028 6b03          	ld	(OFST-2,sp),a
1537                     ; 391     temph = (uint16_t)((uint16_t)((uint16_t)templ << 6) | (uint16_t)((uint16_t)temph << 8));
1539  002a 1e04          	ldw	x,(OFST-1,sp)
1540  002c 4f            	clr	a
1541  002d 02            	rlwa	x,a
1542  002e 1f01          	ldw	(OFST-4,sp),x
1543  0030 7b03          	ld	a,(OFST-2,sp)
1544  0032 97            	ld	xl,a
1545  0033 a640          	ld	a,#64
1546  0035 42            	mul	x,a
1547  0036 01            	rrwa	x,a
1548  0037 1a02          	or	a,(OFST-3,sp)
1549  0039 01            	rrwa	x,a
1550  003a 1a01          	or	a,(OFST-4,sp)
1551  003c 01            	rrwa	x,a
1552  003d 1f04          	ldw	(OFST-1,sp),x
1553  003f               L326:
1554                     ; 394   return ((uint16_t)temph);
1556  003f 1e04          	ldw	x,(OFST-1,sp)
1559  0041 5b05          	addw	sp,#5
1560  0043 81            	ret
1606                     ; 405 void ADC1_AWDChannelConfig(ADC1_Channel_TypeDef Channel, FunctionalState NewState)
1606                     ; 406 {
1607                     .text:	section	.text,new
1608  0000               _ADC1_AWDChannelConfig:
1610  0000 89            	pushw	x
1611       00000000      OFST:	set	0
1614                     ; 408   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1616                     ; 409   assert_param(IS_ADC1_CHANNEL_OK(Channel));
1618                     ; 411   if (Channel < (uint8_t)8)
1620  0001 9e            	ld	a,xh
1621  0002 a108          	cp	a,#8
1622  0004 242e          	jruge	L746
1623                     ; 413     if (NewState != DISABLE)
1625  0006 9f            	ld	a,xl
1626  0007 4d            	tnz	a
1627  0008 2714          	jreq	L156
1628                     ; 415       ADC1->AWCRL |= (uint8_t)((uint8_t)1 << Channel);
1630  000a 9e            	ld	a,xh
1631  000b 5f            	clrw	x
1632  000c 97            	ld	xl,a
1633  000d a601          	ld	a,#1
1634  000f 5d            	tnzw	x
1635  0010 2704          	jreq	L65
1636  0012               L06:
1637  0012 48            	sll	a
1638  0013 5a            	decw	x
1639  0014 26fc          	jrne	L06
1640  0016               L65:
1641  0016 ca540f        	or	a,21519
1642  0019 c7540f        	ld	21519,a
1644  001c 2047          	jra	L556
1645  001e               L156:
1646                     ; 419       ADC1->AWCRL &= (uint8_t)~(uint8_t)((uint8_t)1 << Channel);
1648  001e 7b01          	ld	a,(OFST+1,sp)
1649  0020 5f            	clrw	x
1650  0021 97            	ld	xl,a
1651  0022 a601          	ld	a,#1
1652  0024 5d            	tnzw	x
1653  0025 2704          	jreq	L26
1654  0027               L46:
1655  0027 48            	sll	a
1656  0028 5a            	decw	x
1657  0029 26fc          	jrne	L46
1658  002b               L26:
1659  002b 43            	cpl	a
1660  002c c4540f        	and	a,21519
1661  002f c7540f        	ld	21519,a
1662  0032 2031          	jra	L556
1663  0034               L746:
1664                     ; 424     if (NewState != DISABLE)
1666  0034 0d02          	tnz	(OFST+2,sp)
1667  0036 2717          	jreq	L756
1668                     ; 426       ADC1->AWCRH |= (uint8_t)((uint8_t)1 << (Channel - (uint8_t)8));
1670  0038 7b01          	ld	a,(OFST+1,sp)
1671  003a a008          	sub	a,#8
1672  003c 5f            	clrw	x
1673  003d 97            	ld	xl,a
1674  003e a601          	ld	a,#1
1675  0040 5d            	tnzw	x
1676  0041 2704          	jreq	L66
1677  0043               L07:
1678  0043 48            	sll	a
1679  0044 5a            	decw	x
1680  0045 26fc          	jrne	L07
1681  0047               L66:
1682  0047 ca540e        	or	a,21518
1683  004a c7540e        	ld	21518,a
1685  004d 2016          	jra	L556
1686  004f               L756:
1687                     ; 430       ADC1->AWCRH &= (uint8_t)~(uint8_t)((uint8_t)1 << (uint8_t)(Channel - (uint8_t)8));
1689  004f 7b01          	ld	a,(OFST+1,sp)
1690  0051 a008          	sub	a,#8
1691  0053 5f            	clrw	x
1692  0054 97            	ld	xl,a
1693  0055 a601          	ld	a,#1
1694  0057 5d            	tnzw	x
1695  0058 2704          	jreq	L27
1696  005a               L47:
1697  005a 48            	sll	a
1698  005b 5a            	decw	x
1699  005c 26fc          	jrne	L47
1700  005e               L27:
1701  005e 43            	cpl	a
1702  005f c4540e        	and	a,21518
1703  0062 c7540e        	ld	21518,a
1704  0065               L556:
1705                     ; 433 }
1708  0065 85            	popw	x
1709  0066 81            	ret
1744                     ; 441 void ADC1_SetHighThreshold(uint16_t Threshold)
1744                     ; 442 {
1745                     .text:	section	.text,new
1746  0000               _ADC1_SetHighThreshold:
1748  0000 89            	pushw	x
1749       00000000      OFST:	set	0
1752                     ; 443   ADC1->HTRH = (uint8_t)(Threshold >> (uint8_t)2);
1754  0001 54            	srlw	x
1755  0002 54            	srlw	x
1756  0003 9f            	ld	a,xl
1757  0004 c75408        	ld	21512,a
1758                     ; 444   ADC1->HTRL = (uint8_t)Threshold;
1760  0007 7b02          	ld	a,(OFST+2,sp)
1761  0009 c75409        	ld	21513,a
1762                     ; 445 }
1765  000c 85            	popw	x
1766  000d 81            	ret
1801                     ; 453 void ADC1_SetLowThreshold(uint16_t Threshold)
1801                     ; 454 {
1802                     .text:	section	.text,new
1803  0000               _ADC1_SetLowThreshold:
1807                     ; 455   ADC1->LTRL = (uint8_t)Threshold;
1809  0000 9f            	ld	a,xl
1810  0001 c7540b        	ld	21515,a
1811                     ; 456   ADC1->LTRH = (uint8_t)(Threshold >> (uint8_t)2);
1813  0004 54            	srlw	x
1814  0005 54            	srlw	x
1815  0006 9f            	ld	a,xl
1816  0007 c7540a        	ld	21514,a
1817                     ; 457 }
1820  000a 81            	ret
1873                     ; 466 uint16_t ADC1_GetBufferValue(uint8_t Buffer)
1873                     ; 467 {
1874                     .text:	section	.text,new
1875  0000               _ADC1_GetBufferValue:
1877  0000 88            	push	a
1878  0001 5205          	subw	sp,#5
1879       00000005      OFST:	set	5
1882                     ; 468   uint16_t temph = 0;
1884                     ; 469   uint8_t templ = 0;
1886                     ; 472   assert_param(IS_ADC1_BUFFER_OK(Buffer));
1888                     ; 474   if ((ADC1->CR2 & ADC1_CR2_ALIGN) != 0) /* Right alignment */
1890  0003 c65402        	ld	a,21506
1891  0006 a508          	bcp	a,#8
1892  0008 271f          	jreq	L547
1893                     ; 477     templ = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1) + 1);
1895  000a 7b06          	ld	a,(OFST+1,sp)
1896  000c 48            	sll	a
1897  000d 5f            	clrw	x
1898  000e 97            	ld	xl,a
1899  000f d653e1        	ld	a,(21473,x)
1900  0012 6b03          	ld	(OFST-2,sp),a
1901                     ; 479     temph = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1));
1903  0014 7b06          	ld	a,(OFST+1,sp)
1904  0016 48            	sll	a
1905  0017 5f            	clrw	x
1906  0018 97            	ld	xl,a
1907  0019 d653e0        	ld	a,(21472,x)
1908  001c 5f            	clrw	x
1909  001d 97            	ld	xl,a
1910  001e 1f04          	ldw	(OFST-1,sp),x
1911                     ; 481     temph = (uint16_t)(templ | (uint16_t)(temph << (uint8_t)8));
1913  0020 1e04          	ldw	x,(OFST-1,sp)
1914  0022 7b03          	ld	a,(OFST-2,sp)
1915  0024 02            	rlwa	x,a
1916  0025 1f04          	ldw	(OFST-1,sp),x
1918  0027 202b          	jra	L747
1919  0029               L547:
1920                     ; 486     temph = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1));
1922  0029 7b06          	ld	a,(OFST+1,sp)
1923  002b 48            	sll	a
1924  002c 5f            	clrw	x
1925  002d 97            	ld	xl,a
1926  002e d653e0        	ld	a,(21472,x)
1927  0031 5f            	clrw	x
1928  0032 97            	ld	xl,a
1929  0033 1f04          	ldw	(OFST-1,sp),x
1930                     ; 488     templ = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1) + 1);
1932  0035 7b06          	ld	a,(OFST+1,sp)
1933  0037 48            	sll	a
1934  0038 5f            	clrw	x
1935  0039 97            	ld	xl,a
1936  003a d653e1        	ld	a,(21473,x)
1937  003d 6b03          	ld	(OFST-2,sp),a
1938                     ; 490     temph = (uint16_t)((uint16_t)((uint16_t)templ << 6) | (uint16_t)(temph << 8));
1940  003f 1e04          	ldw	x,(OFST-1,sp)
1941  0041 4f            	clr	a
1942  0042 02            	rlwa	x,a
1943  0043 1f01          	ldw	(OFST-4,sp),x
1944  0045 7b03          	ld	a,(OFST-2,sp)
1945  0047 97            	ld	xl,a
1946  0048 a640          	ld	a,#64
1947  004a 42            	mul	x,a
1948  004b 01            	rrwa	x,a
1949  004c 1a02          	or	a,(OFST-3,sp)
1950  004e 01            	rrwa	x,a
1951  004f 1a01          	or	a,(OFST-4,sp)
1952  0051 01            	rrwa	x,a
1953  0052 1f04          	ldw	(OFST-1,sp),x
1954  0054               L747:
1955                     ; 493   return ((uint16_t)temph);
1957  0054 1e04          	ldw	x,(OFST-1,sp)
1960  0056 5b06          	addw	sp,#6
1961  0058 81            	ret
2027                     ; 502 FlagStatus ADC1_GetAWDChannelStatus(ADC1_Channel_TypeDef Channel)
2027                     ; 503 {
2028                     .text:	section	.text,new
2029  0000               _ADC1_GetAWDChannelStatus:
2031  0000 88            	push	a
2032  0001 88            	push	a
2033       00000001      OFST:	set	1
2036                     ; 504   uint8_t status = 0;
2038                     ; 507   assert_param(IS_ADC1_CHANNEL_OK(Channel));
2040                     ; 509   if (Channel < (uint8_t)8)
2042  0002 a108          	cp	a,#8
2043  0004 2412          	jruge	L3001
2044                     ; 511     status = (uint8_t)(ADC1->AWSRL & (uint8_t)((uint8_t)1 << Channel));
2046  0006 5f            	clrw	x
2047  0007 97            	ld	xl,a
2048  0008 a601          	ld	a,#1
2049  000a 5d            	tnzw	x
2050  000b 2704          	jreq	L601
2051  000d               L011:
2052  000d 48            	sll	a
2053  000e 5a            	decw	x
2054  000f 26fc          	jrne	L011
2055  0011               L601:
2056  0011 c4540d        	and	a,21517
2057  0014 6b01          	ld	(OFST+0,sp),a
2059  0016 2014          	jra	L5001
2060  0018               L3001:
2061                     ; 515     status = (uint8_t)(ADC1->AWSRH & (uint8_t)((uint8_t)1 << (Channel - (uint8_t)8)));
2063  0018 7b02          	ld	a,(OFST+1,sp)
2064  001a a008          	sub	a,#8
2065  001c 5f            	clrw	x
2066  001d 97            	ld	xl,a
2067  001e a601          	ld	a,#1
2068  0020 5d            	tnzw	x
2069  0021 2704          	jreq	L211
2070  0023               L411:
2071  0023 48            	sll	a
2072  0024 5a            	decw	x
2073  0025 26fc          	jrne	L411
2074  0027               L211:
2075  0027 c4540c        	and	a,21516
2076  002a 6b01          	ld	(OFST+0,sp),a
2077  002c               L5001:
2078                     ; 518   return ((FlagStatus)status);
2080  002c 7b01          	ld	a,(OFST+0,sp)
2083  002e 85            	popw	x
2084  002f 81            	ret
2242                     ; 527 FlagStatus ADC1_GetFlagStatus(ADC1_Flag_TypeDef Flag)
2242                     ; 528 {
2243                     .text:	section	.text,new
2244  0000               _ADC1_GetFlagStatus:
2246  0000 88            	push	a
2247  0001 88            	push	a
2248       00000001      OFST:	set	1
2251                     ; 529   uint8_t flagstatus = 0;
2253                     ; 530   uint8_t temp = 0;
2255                     ; 533   assert_param(IS_ADC1_FLAG_OK(Flag));
2257                     ; 535   if ((Flag & 0x0F) == 0x01)
2259  0002 a40f          	and	a,#15
2260  0004 a101          	cp	a,#1
2261  0006 2609          	jrne	L5701
2262                     ; 538     flagstatus = (uint8_t)(ADC1->CR3 & ADC1_CR3_OVR);
2264  0008 c65403        	ld	a,21507
2265  000b a440          	and	a,#64
2266  000d 6b01          	ld	(OFST+0,sp),a
2268  000f 2045          	jra	L7701
2269  0011               L5701:
2270                     ; 540   else if ((Flag & 0xF0) == 0x10)
2272  0011 7b02          	ld	a,(OFST+1,sp)
2273  0013 a4f0          	and	a,#240
2274  0015 a110          	cp	a,#16
2275  0017 2636          	jrne	L1011
2276                     ; 543     temp = (uint8_t)(Flag & (uint8_t)0x0F);
2278  0019 7b02          	ld	a,(OFST+1,sp)
2279  001b a40f          	and	a,#15
2280  001d 6b01          	ld	(OFST+0,sp),a
2281                     ; 544     if (temp < 8)
2283  001f 7b01          	ld	a,(OFST+0,sp)
2284  0021 a108          	cp	a,#8
2285  0023 2414          	jruge	L3011
2286                     ; 546       flagstatus = (uint8_t)(ADC1->AWSRL & (uint8_t)((uint8_t)1 << temp));
2288  0025 7b01          	ld	a,(OFST+0,sp)
2289  0027 5f            	clrw	x
2290  0028 97            	ld	xl,a
2291  0029 a601          	ld	a,#1
2292  002b 5d            	tnzw	x
2293  002c 2704          	jreq	L021
2294  002e               L221:
2295  002e 48            	sll	a
2296  002f 5a            	decw	x
2297  0030 26fc          	jrne	L221
2298  0032               L021:
2299  0032 c4540d        	and	a,21517
2300  0035 6b01          	ld	(OFST+0,sp),a
2302  0037 201d          	jra	L7701
2303  0039               L3011:
2304                     ; 550       flagstatus = (uint8_t)(ADC1->AWSRH & (uint8_t)((uint8_t)1 << (temp - 8)));
2306  0039 7b01          	ld	a,(OFST+0,sp)
2307  003b a008          	sub	a,#8
2308  003d 5f            	clrw	x
2309  003e 97            	ld	xl,a
2310  003f a601          	ld	a,#1
2311  0041 5d            	tnzw	x
2312  0042 2704          	jreq	L421
2313  0044               L621:
2314  0044 48            	sll	a
2315  0045 5a            	decw	x
2316  0046 26fc          	jrne	L621
2317  0048               L421:
2318  0048 c4540c        	and	a,21516
2319  004b 6b01          	ld	(OFST+0,sp),a
2320  004d 2007          	jra	L7701
2321  004f               L1011:
2322                     ; 555     flagstatus = (uint8_t)(ADC1->CSR & Flag);
2324  004f c65400        	ld	a,21504
2325  0052 1402          	and	a,(OFST+1,sp)
2326  0054 6b01          	ld	(OFST+0,sp),a
2327  0056               L7701:
2328                     ; 557   return ((FlagStatus)flagstatus);
2330  0056 7b01          	ld	a,(OFST+0,sp)
2333  0058 85            	popw	x
2334  0059 81            	ret
2378                     ; 567 void ADC1_ClearFlag(ADC1_Flag_TypeDef Flag)
2378                     ; 568 {
2379                     .text:	section	.text,new
2380  0000               _ADC1_ClearFlag:
2382  0000 88            	push	a
2383  0001 88            	push	a
2384       00000001      OFST:	set	1
2387                     ; 569   uint8_t temp = 0;
2389                     ; 572   assert_param(IS_ADC1_FLAG_OK(Flag));
2391                     ; 574   if ((Flag & 0x0F) == 0x01)
2393  0002 a40f          	and	a,#15
2394  0004 a101          	cp	a,#1
2395  0006 2606          	jrne	L3311
2396                     ; 577     ADC1->CR3 &= (uint8_t)(~ADC1_CR3_OVR);
2398  0008 721d5403      	bres	21507,#6
2400  000c 204b          	jra	L5311
2401  000e               L3311:
2402                     ; 579   else if ((Flag & 0xF0) == 0x10)
2404  000e 7b02          	ld	a,(OFST+1,sp)
2405  0010 a4f0          	and	a,#240
2406  0012 a110          	cp	a,#16
2407  0014 263a          	jrne	L7311
2408                     ; 582     temp = (uint8_t)(Flag & (uint8_t)0x0F);
2410  0016 7b02          	ld	a,(OFST+1,sp)
2411  0018 a40f          	and	a,#15
2412  001a 6b01          	ld	(OFST+0,sp),a
2413                     ; 583     if (temp < 8)
2415  001c 7b01          	ld	a,(OFST+0,sp)
2416  001e a108          	cp	a,#8
2417  0020 2416          	jruge	L1411
2418                     ; 585       ADC1->AWSRL &= (uint8_t)~(uint8_t)((uint8_t)1 << temp);
2420  0022 7b01          	ld	a,(OFST+0,sp)
2421  0024 5f            	clrw	x
2422  0025 97            	ld	xl,a
2423  0026 a601          	ld	a,#1
2424  0028 5d            	tnzw	x
2425  0029 2704          	jreq	L231
2426  002b               L431:
2427  002b 48            	sll	a
2428  002c 5a            	decw	x
2429  002d 26fc          	jrne	L431
2430  002f               L231:
2431  002f 43            	cpl	a
2432  0030 c4540d        	and	a,21517
2433  0033 c7540d        	ld	21517,a
2435  0036 2021          	jra	L5311
2436  0038               L1411:
2437                     ; 589       ADC1->AWSRH &= (uint8_t)~(uint8_t)((uint8_t)1 << (temp - 8));
2439  0038 7b01          	ld	a,(OFST+0,sp)
2440  003a a008          	sub	a,#8
2441  003c 5f            	clrw	x
2442  003d 97            	ld	xl,a
2443  003e a601          	ld	a,#1
2444  0040 5d            	tnzw	x
2445  0041 2704          	jreq	L631
2446  0043               L041:
2447  0043 48            	sll	a
2448  0044 5a            	decw	x
2449  0045 26fc          	jrne	L041
2450  0047               L631:
2451  0047 43            	cpl	a
2452  0048 c4540c        	and	a,21516
2453  004b c7540c        	ld	21516,a
2454  004e 2009          	jra	L5311
2455  0050               L7311:
2456                     ; 594     ADC1->CSR &= (uint8_t) (~Flag);
2458  0050 7b02          	ld	a,(OFST+1,sp)
2459  0052 43            	cpl	a
2460  0053 c45400        	and	a,21504
2461  0056 c75400        	ld	21504,a
2462  0059               L5311:
2463                     ; 596 }
2466  0059 85            	popw	x
2467  005a 81            	ret
2522                     ; 616 ITStatus ADC1_GetITStatus(ADC1_IT_TypeDef ITPendingBit)
2522                     ; 617 {
2523                     .text:	section	.text,new
2524  0000               _ADC1_GetITStatus:
2526  0000 89            	pushw	x
2527  0001 88            	push	a
2528       00000001      OFST:	set	1
2531                     ; 618   ITStatus itstatus = RESET;
2533                     ; 619   uint8_t temp = 0;
2535                     ; 622   assert_param(IS_ADC1_ITPENDINGBIT_OK(ITPendingBit));
2537                     ; 624   if (((uint16_t)ITPendingBit & 0xF0) == 0x10)
2539  0002 01            	rrwa	x,a
2540  0003 a4f0          	and	a,#240
2541  0005 5f            	clrw	x
2542  0006 02            	rlwa	x,a
2543  0007 a30010        	cpw	x,#16
2544  000a 2636          	jrne	L5711
2545                     ; 627     temp = (uint8_t)((uint16_t)ITPendingBit & 0x0F);
2547  000c 7b03          	ld	a,(OFST+2,sp)
2548  000e a40f          	and	a,#15
2549  0010 6b01          	ld	(OFST+0,sp),a
2550                     ; 628     if (temp < 8)
2552  0012 7b01          	ld	a,(OFST+0,sp)
2553  0014 a108          	cp	a,#8
2554  0016 2414          	jruge	L7711
2555                     ; 630       itstatus = (ITStatus)(ADC1->AWSRL & (uint8_t)((uint8_t)1 << temp));
2557  0018 7b01          	ld	a,(OFST+0,sp)
2558  001a 5f            	clrw	x
2559  001b 97            	ld	xl,a
2560  001c a601          	ld	a,#1
2561  001e 5d            	tnzw	x
2562  001f 2704          	jreq	L441
2563  0021               L641:
2564  0021 48            	sll	a
2565  0022 5a            	decw	x
2566  0023 26fc          	jrne	L641
2567  0025               L441:
2568  0025 c4540d        	and	a,21517
2569  0028 6b01          	ld	(OFST+0,sp),a
2571  002a 201d          	jra	L3021
2572  002c               L7711:
2573                     ; 634       itstatus = (ITStatus)(ADC1->AWSRH & (uint8_t)((uint8_t)1 << (temp - 8)));
2575  002c 7b01          	ld	a,(OFST+0,sp)
2576  002e a008          	sub	a,#8
2577  0030 5f            	clrw	x
2578  0031 97            	ld	xl,a
2579  0032 a601          	ld	a,#1
2580  0034 5d            	tnzw	x
2581  0035 2704          	jreq	L051
2582  0037               L251:
2583  0037 48            	sll	a
2584  0038 5a            	decw	x
2585  0039 26fc          	jrne	L251
2586  003b               L051:
2587  003b c4540c        	and	a,21516
2588  003e 6b01          	ld	(OFST+0,sp),a
2589  0040 2007          	jra	L3021
2590  0042               L5711:
2591                     ; 639     itstatus = (ITStatus)(ADC1->CSR & (uint8_t)ITPendingBit);
2593  0042 c65400        	ld	a,21504
2594  0045 1403          	and	a,(OFST+2,sp)
2595  0047 6b01          	ld	(OFST+0,sp),a
2596  0049               L3021:
2597                     ; 641   return ((ITStatus)itstatus);
2599  0049 7b01          	ld	a,(OFST+0,sp)
2602  004b 5b03          	addw	sp,#3
2603  004d 81            	ret
2648                     ; 662 void ADC1_ClearITPendingBit(ADC1_IT_TypeDef ITPendingBit)
2648                     ; 663 {
2649                     .text:	section	.text,new
2650  0000               _ADC1_ClearITPendingBit:
2652  0000 89            	pushw	x
2653  0001 88            	push	a
2654       00000001      OFST:	set	1
2657                     ; 664   uint8_t temp = 0;
2659                     ; 667   assert_param(IS_ADC1_ITPENDINGBIT_OK(ITPendingBit));
2661                     ; 669   if (((uint16_t)ITPendingBit & 0xF0) == 0x10)
2663  0002 01            	rrwa	x,a
2664  0003 a4f0          	and	a,#240
2665  0005 5f            	clrw	x
2666  0006 02            	rlwa	x,a
2667  0007 a30010        	cpw	x,#16
2668  000a 263a          	jrne	L7221
2669                     ; 672     temp = (uint8_t)((uint16_t)ITPendingBit & 0x0F);
2671  000c 7b03          	ld	a,(OFST+2,sp)
2672  000e a40f          	and	a,#15
2673  0010 6b01          	ld	(OFST+0,sp),a
2674                     ; 673     if (temp < 8)
2676  0012 7b01          	ld	a,(OFST+0,sp)
2677  0014 a108          	cp	a,#8
2678  0016 2416          	jruge	L1321
2679                     ; 675       ADC1->AWSRL &= (uint8_t)~(uint8_t)((uint8_t)1 << temp);
2681  0018 7b01          	ld	a,(OFST+0,sp)
2682  001a 5f            	clrw	x
2683  001b 97            	ld	xl,a
2684  001c a601          	ld	a,#1
2685  001e 5d            	tnzw	x
2686  001f 2704          	jreq	L651
2687  0021               L061:
2688  0021 48            	sll	a
2689  0022 5a            	decw	x
2690  0023 26fc          	jrne	L061
2691  0025               L651:
2692  0025 43            	cpl	a
2693  0026 c4540d        	and	a,21517
2694  0029 c7540d        	ld	21517,a
2696  002c 2021          	jra	L5321
2697  002e               L1321:
2698                     ; 679       ADC1->AWSRH &= (uint8_t)~(uint8_t)((uint8_t)1 << (temp - 8));
2700  002e 7b01          	ld	a,(OFST+0,sp)
2701  0030 a008          	sub	a,#8
2702  0032 5f            	clrw	x
2703  0033 97            	ld	xl,a
2704  0034 a601          	ld	a,#1
2705  0036 5d            	tnzw	x
2706  0037 2704          	jreq	L261
2707  0039               L461:
2708  0039 48            	sll	a
2709  003a 5a            	decw	x
2710  003b 26fc          	jrne	L461
2711  003d               L261:
2712  003d 43            	cpl	a
2713  003e c4540c        	and	a,21516
2714  0041 c7540c        	ld	21516,a
2715  0044 2009          	jra	L5321
2716  0046               L7221:
2717                     ; 684     ADC1->CSR &= (uint8_t)((uint16_t)~(uint16_t)ITPendingBit);
2719  0046 7b03          	ld	a,(OFST+2,sp)
2720  0048 43            	cpl	a
2721  0049 c45400        	and	a,21504
2722  004c c75400        	ld	21504,a
2723  004f               L5321:
2724                     ; 686 }
2727  004f 5b03          	addw	sp,#3
2728  0051 81            	ret
2741                     	xdef	_ADC1_ClearITPendingBit
2742                     	xdef	_ADC1_GetITStatus
2743                     	xdef	_ADC1_ClearFlag
2744                     	xdef	_ADC1_GetFlagStatus
2745                     	xdef	_ADC1_GetAWDChannelStatus
2746                     	xdef	_ADC1_GetBufferValue
2747                     	xdef	_ADC1_SetLowThreshold
2748                     	xdef	_ADC1_SetHighThreshold
2749                     	xdef	_ADC1_GetConversionValue
2750                     	xdef	_ADC1_StartConversion
2751                     	xdef	_ADC1_AWDChannelConfig
2752                     	xdef	_ADC1_ExternalTriggerConfig
2753                     	xdef	_ADC1_ConversionConfig
2754                     	xdef	_ADC1_SchmittTriggerConfig
2755                     	xdef	_ADC1_PrescalerConfig
2756                     	xdef	_ADC1_ITConfig
2757                     	xdef	_ADC1_DataBufferCmd
2758                     	xdef	_ADC1_ScanModeCmd
2759                     	xdef	_ADC1_Cmd
2760                     	xdef	_ADC1_Init
2761                     	xdef	_ADC1_DeInit
2780                     	end
