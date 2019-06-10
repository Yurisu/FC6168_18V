   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
  17                     .const:	section	.text
  18  0000               _HSIDivFactor:
  19  0000 01            	dc.b	1
  20  0001 02            	dc.b	2
  21  0002 04            	dc.b	4
  22  0003 08            	dc.b	8
  23  0004               _CLKPrescTable:
  24  0004 01            	dc.b	1
  25  0005 02            	dc.b	2
  26  0006 04            	dc.b	4
  27  0007 08            	dc.b	8
  28  0008 0a            	dc.b	10
  29  0009 10            	dc.b	16
  30  000a 14            	dc.b	20
  31  000b 28            	dc.b	40
  60                     ; 72 void CLK_DeInit(void)
  60                     ; 73 {
  62                     .text:	section	.text,new
  63  0000               _CLK_DeInit:
  67                     ; 74   CLK->ICKR = CLK_ICKR_RESET_VALUE;
  69  0000 350150c0      	mov	20672,#1
  70                     ; 75   CLK->ECKR = CLK_ECKR_RESET_VALUE;
  72  0004 725f50c1      	clr	20673
  73                     ; 76   CLK->SWR  = CLK_SWR_RESET_VALUE;
  75  0008 35e150c4      	mov	20676,#225
  76                     ; 77   CLK->SWCR = CLK_SWCR_RESET_VALUE;
  78  000c 725f50c5      	clr	20677
  79                     ; 78   CLK->CKDIVR = CLK_CKDIVR_RESET_VALUE;
  81  0010 351850c6      	mov	20678,#24
  82                     ; 79   CLK->PCKENR1 = CLK_PCKENR1_RESET_VALUE;
  84  0014 35ff50c7      	mov	20679,#255
  85                     ; 80   CLK->PCKENR2 = CLK_PCKENR2_RESET_VALUE;
  87  0018 35ff50ca      	mov	20682,#255
  88                     ; 81   CLK->CSSR = CLK_CSSR_RESET_VALUE;
  90  001c 725f50c8      	clr	20680
  91                     ; 82   CLK->CCOR = CLK_CCOR_RESET_VALUE;
  93  0020 725f50c9      	clr	20681
  95  0024               L52:
  96                     ; 83   while ((CLK->CCOR & CLK_CCOR_CCOEN)!= 0)
  98  0024 c650c9        	ld	a,20681
  99  0027 a501          	bcp	a,#1
 100  0029 26f9          	jrne	L52
 101                     ; 85   CLK->CCOR = CLK_CCOR_RESET_VALUE;
 103  002b 725f50c9      	clr	20681
 104                     ; 86   CLK->HSITRIMR = CLK_HSITRIMR_RESET_VALUE;
 106  002f 725f50cc      	clr	20684
 107                     ; 87   CLK->SWIMCCR = CLK_SWIMCCR_RESET_VALUE;
 109  0033 725f50cd      	clr	20685
 110                     ; 88 }
 113  0037 81            	ret
 169                     ; 99 void CLK_FastHaltWakeUpCmd(FunctionalState NewState)
 169                     ; 100 {
 170                     .text:	section	.text,new
 171  0000               _CLK_FastHaltWakeUpCmd:
 175                     ; 102   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 177                     ; 104   if (NewState != DISABLE)
 179  0000 4d            	tnz	a
 180  0001 2706          	jreq	L75
 181                     ; 107     CLK->ICKR |= CLK_ICKR_FHWU;
 183  0003 721450c0      	bset	20672,#2
 185  0007 2004          	jra	L16
 186  0009               L75:
 187                     ; 112     CLK->ICKR &= (uint8_t)(~CLK_ICKR_FHWU);
 189  0009 721550c0      	bres	20672,#2
 190  000d               L16:
 191                     ; 114 }
 194  000d 81            	ret
 229                     ; 121 void CLK_HSECmd(FunctionalState NewState)
 229                     ; 122 {
 230                     .text:	section	.text,new
 231  0000               _CLK_HSECmd:
 235                     ; 124   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 237                     ; 126   if (NewState != DISABLE)
 239  0000 4d            	tnz	a
 240  0001 2706          	jreq	L101
 241                     ; 129     CLK->ECKR |= CLK_ECKR_HSEEN;
 243  0003 721050c1      	bset	20673,#0
 245  0007 2004          	jra	L301
 246  0009               L101:
 247                     ; 134     CLK->ECKR &= (uint8_t)(~CLK_ECKR_HSEEN);
 249  0009 721150c1      	bres	20673,#0
 250  000d               L301:
 251                     ; 136 }
 254  000d 81            	ret
 289                     ; 143 void CLK_HSICmd(FunctionalState NewState)
 289                     ; 144 {
 290                     .text:	section	.text,new
 291  0000               _CLK_HSICmd:
 295                     ; 146   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 297                     ; 148   if (NewState != DISABLE)
 299  0000 4d            	tnz	a
 300  0001 2706          	jreq	L321
 301                     ; 151     CLK->ICKR |= CLK_ICKR_HSIEN;
 303  0003 721050c0      	bset	20672,#0
 305  0007 2004          	jra	L521
 306  0009               L321:
 307                     ; 156     CLK->ICKR &= (uint8_t)(~CLK_ICKR_HSIEN);
 309  0009 721150c0      	bres	20672,#0
 310  000d               L521:
 311                     ; 158 }
 314  000d 81            	ret
 349                     ; 166 void CLK_LSICmd(FunctionalState NewState)
 349                     ; 167 {
 350                     .text:	section	.text,new
 351  0000               _CLK_LSICmd:
 355                     ; 169   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 357                     ; 171   if (NewState != DISABLE)
 359  0000 4d            	tnz	a
 360  0001 2706          	jreq	L541
 361                     ; 174     CLK->ICKR |= CLK_ICKR_LSIEN;
 363  0003 721650c0      	bset	20672,#3
 365  0007 2004          	jra	L741
 366  0009               L541:
 367                     ; 179     CLK->ICKR &= (uint8_t)(~CLK_ICKR_LSIEN);
 369  0009 721750c0      	bres	20672,#3
 370  000d               L741:
 371                     ; 181 }
 374  000d 81            	ret
 409                     ; 189 void CLK_CCOCmd(FunctionalState NewState)
 409                     ; 190 {
 410                     .text:	section	.text,new
 411  0000               _CLK_CCOCmd:
 415                     ; 192   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 417                     ; 194   if (NewState != DISABLE)
 419  0000 4d            	tnz	a
 420  0001 2706          	jreq	L761
 421                     ; 197     CLK->CCOR |= CLK_CCOR_CCOEN;
 423  0003 721050c9      	bset	20681,#0
 425  0007 2004          	jra	L171
 426  0009               L761:
 427                     ; 202     CLK->CCOR &= (uint8_t)(~CLK_CCOR_CCOEN);
 429  0009 721150c9      	bres	20681,#0
 430  000d               L171:
 431                     ; 204 }
 434  000d 81            	ret
 469                     ; 213 void CLK_ClockSwitchCmd(FunctionalState NewState)
 469                     ; 214 {
 470                     .text:	section	.text,new
 471  0000               _CLK_ClockSwitchCmd:
 475                     ; 216   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 477                     ; 218   if (NewState != DISABLE )
 479  0000 4d            	tnz	a
 480  0001 2706          	jreq	L112
 481                     ; 221     CLK->SWCR |= CLK_SWCR_SWEN;
 483  0003 721250c5      	bset	20677,#1
 485  0007 2004          	jra	L312
 486  0009               L112:
 487                     ; 226     CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWEN);
 489  0009 721350c5      	bres	20677,#1
 490  000d               L312:
 491                     ; 228 }
 494  000d 81            	ret
 530                     ; 238 void CLK_SlowActiveHaltWakeUpCmd(FunctionalState NewState)
 530                     ; 239 {
 531                     .text:	section	.text,new
 532  0000               _CLK_SlowActiveHaltWakeUpCmd:
 536                     ; 241   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 538                     ; 243   if (NewState != DISABLE)
 540  0000 4d            	tnz	a
 541  0001 2706          	jreq	L332
 542                     ; 246     CLK->ICKR |= CLK_ICKR_SWUAH;
 544  0003 721a50c0      	bset	20672,#5
 546  0007 2004          	jra	L532
 547  0009               L332:
 548                     ; 251     CLK->ICKR &= (uint8_t)(~CLK_ICKR_SWUAH);
 550  0009 721b50c0      	bres	20672,#5
 551  000d               L532:
 552                     ; 253 }
 555  000d 81            	ret
 714                     ; 263 void CLK_PeripheralClockConfig(CLK_Peripheral_TypeDef CLK_Peripheral, FunctionalState NewState)
 714                     ; 264 {
 715                     .text:	section	.text,new
 716  0000               _CLK_PeripheralClockConfig:
 718  0000 89            	pushw	x
 719       00000000      OFST:	set	0
 722                     ; 266   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 724                     ; 267   assert_param(IS_CLK_PERIPHERAL_OK(CLK_Peripheral));
 726                     ; 269   if (((uint8_t)CLK_Peripheral & (uint8_t)0x10) == 0x00)
 728  0001 9e            	ld	a,xh
 729  0002 a510          	bcp	a,#16
 730  0004 2633          	jrne	L123
 731                     ; 271     if (NewState != DISABLE)
 733  0006 0d02          	tnz	(OFST+2,sp)
 734  0008 2717          	jreq	L323
 735                     ; 274       CLK->PCKENR1 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
 737  000a 7b01          	ld	a,(OFST+1,sp)
 738  000c a40f          	and	a,#15
 739  000e 5f            	clrw	x
 740  000f 97            	ld	xl,a
 741  0010 a601          	ld	a,#1
 742  0012 5d            	tnzw	x
 743  0013 2704          	jreq	L62
 744  0015               L03:
 745  0015 48            	sll	a
 746  0016 5a            	decw	x
 747  0017 26fc          	jrne	L03
 748  0019               L62:
 749  0019 ca50c7        	or	a,20679
 750  001c c750c7        	ld	20679,a
 752  001f 2049          	jra	L723
 753  0021               L323:
 754                     ; 279       CLK->PCKENR1 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
 756  0021 7b01          	ld	a,(OFST+1,sp)
 757  0023 a40f          	and	a,#15
 758  0025 5f            	clrw	x
 759  0026 97            	ld	xl,a
 760  0027 a601          	ld	a,#1
 761  0029 5d            	tnzw	x
 762  002a 2704          	jreq	L23
 763  002c               L43:
 764  002c 48            	sll	a
 765  002d 5a            	decw	x
 766  002e 26fc          	jrne	L43
 767  0030               L23:
 768  0030 43            	cpl	a
 769  0031 c450c7        	and	a,20679
 770  0034 c750c7        	ld	20679,a
 771  0037 2031          	jra	L723
 772  0039               L123:
 773                     ; 284     if (NewState != DISABLE)
 775  0039 0d02          	tnz	(OFST+2,sp)
 776  003b 2717          	jreq	L133
 777                     ; 287       CLK->PCKENR2 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
 779  003d 7b01          	ld	a,(OFST+1,sp)
 780  003f a40f          	and	a,#15
 781  0041 5f            	clrw	x
 782  0042 97            	ld	xl,a
 783  0043 a601          	ld	a,#1
 784  0045 5d            	tnzw	x
 785  0046 2704          	jreq	L63
 786  0048               L04:
 787  0048 48            	sll	a
 788  0049 5a            	decw	x
 789  004a 26fc          	jrne	L04
 790  004c               L63:
 791  004c ca50ca        	or	a,20682
 792  004f c750ca        	ld	20682,a
 794  0052 2016          	jra	L723
 795  0054               L133:
 796                     ; 292       CLK->PCKENR2 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
 798  0054 7b01          	ld	a,(OFST+1,sp)
 799  0056 a40f          	and	a,#15
 800  0058 5f            	clrw	x
 801  0059 97            	ld	xl,a
 802  005a a601          	ld	a,#1
 803  005c 5d            	tnzw	x
 804  005d 2704          	jreq	L24
 805  005f               L44:
 806  005f 48            	sll	a
 807  0060 5a            	decw	x
 808  0061 26fc          	jrne	L44
 809  0063               L24:
 810  0063 43            	cpl	a
 811  0064 c450ca        	and	a,20682
 812  0067 c750ca        	ld	20682,a
 813  006a               L723:
 814                     ; 295 }
 817  006a 85            	popw	x
 818  006b 81            	ret
1006                     ; 309 ErrorStatus CLK_ClockSwitchConfig(CLK_SwitchMode_TypeDef CLK_SwitchMode, CLK_Source_TypeDef CLK_NewClock, FunctionalState ITState, CLK_CurrentClockState_TypeDef CLK_CurrentClockState)
1006                     ; 310 {
1007                     .text:	section	.text,new
1008  0000               _CLK_ClockSwitchConfig:
1010  0000 89            	pushw	x
1011  0001 5204          	subw	sp,#4
1012       00000004      OFST:	set	4
1015                     ; 312   uint16_t DownCounter = CLK_TIMEOUT;
1017  0003 aeffff        	ldw	x,#65535
1018  0006 1f03          	ldw	(OFST-1,sp),x
1019                     ; 313   ErrorStatus Swif = ERROR;
1021                     ; 316   assert_param(IS_CLK_SOURCE_OK(CLK_NewClock));
1023                     ; 317   assert_param(IS_CLK_SWITCHMODE_OK(CLK_SwitchMode));
1025                     ; 318   assert_param(IS_FUNCTIONALSTATE_OK(ITState));
1027                     ; 319   assert_param(IS_CLK_CURRENTCLOCKSTATE_OK(CLK_CurrentClockState));
1029                     ; 322   clock_master = (CLK_Source_TypeDef)CLK->CMSR;
1031  0008 c650c3        	ld	a,20675
1032  000b 6b01          	ld	(OFST-3,sp),a
1033                     ; 325   if (CLK_SwitchMode == CLK_SWITCHMODE_AUTO)
1035  000d 7b05          	ld	a,(OFST+1,sp)
1036  000f a101          	cp	a,#1
1037  0011 264b          	jrne	L544
1038                     ; 328     CLK->SWCR |= CLK_SWCR_SWEN;
1040  0013 721250c5      	bset	20677,#1
1041                     ; 331     if (ITState != DISABLE)
1043  0017 0d09          	tnz	(OFST+5,sp)
1044  0019 2706          	jreq	L744
1045                     ; 333       CLK->SWCR |= CLK_SWCR_SWIEN;
1047  001b 721450c5      	bset	20677,#2
1049  001f 2004          	jra	L154
1050  0021               L744:
1051                     ; 337       CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIEN);
1053  0021 721550c5      	bres	20677,#2
1054  0025               L154:
1055                     ; 341     CLK->SWR = (uint8_t)CLK_NewClock;
1057  0025 7b06          	ld	a,(OFST+2,sp)
1058  0027 c750c4        	ld	20676,a
1060  002a 2007          	jra	L754
1061  002c               L354:
1062                     ; 346       DownCounter--;
1064  002c 1e03          	ldw	x,(OFST-1,sp)
1065  002e 1d0001        	subw	x,#1
1066  0031 1f03          	ldw	(OFST-1,sp),x
1067  0033               L754:
1068                     ; 344     while((((CLK->SWCR & CLK_SWCR_SWBSY) != 0 )&& (DownCounter != 0)))
1070  0033 c650c5        	ld	a,20677
1071  0036 a501          	bcp	a,#1
1072  0038 2704          	jreq	L364
1074  003a 1e03          	ldw	x,(OFST-1,sp)
1075  003c 26ee          	jrne	L354
1076  003e               L364:
1077                     ; 349     if(DownCounter != 0)
1079  003e 1e03          	ldw	x,(OFST-1,sp)
1080  0040 2706          	jreq	L564
1081                     ; 351       Swif = SUCCESS;
1083  0042 a601          	ld	a,#1
1084  0044 6b02          	ld	(OFST-2,sp),a
1086  0046 2002          	jra	L174
1087  0048               L564:
1088                     ; 355       Swif = ERROR;
1090  0048 0f02          	clr	(OFST-2,sp)
1091  004a               L174:
1092                     ; 390   if(Swif != ERROR)
1094  004a 0d02          	tnz	(OFST-2,sp)
1095  004c 2767          	jreq	L515
1096                     ; 393     if((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_HSI))
1098  004e 0d0a          	tnz	(OFST+6,sp)
1099  0050 2645          	jrne	L715
1101  0052 7b01          	ld	a,(OFST-3,sp)
1102  0054 a1e1          	cp	a,#225
1103  0056 263f          	jrne	L715
1104                     ; 395       CLK->ICKR &= (uint8_t)(~CLK_ICKR_HSIEN);
1106  0058 721150c0      	bres	20672,#0
1108  005c 2057          	jra	L515
1109  005e               L544:
1110                     ; 361     if (ITState != DISABLE)
1112  005e 0d09          	tnz	(OFST+5,sp)
1113  0060 2706          	jreq	L374
1114                     ; 363       CLK->SWCR |= CLK_SWCR_SWIEN;
1116  0062 721450c5      	bset	20677,#2
1118  0066 2004          	jra	L574
1119  0068               L374:
1120                     ; 367       CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIEN);
1122  0068 721550c5      	bres	20677,#2
1123  006c               L574:
1124                     ; 371     CLK->SWR = (uint8_t)CLK_NewClock;
1126  006c 7b06          	ld	a,(OFST+2,sp)
1127  006e c750c4        	ld	20676,a
1129  0071 2007          	jra	L305
1130  0073               L774:
1131                     ; 376       DownCounter--;
1133  0073 1e03          	ldw	x,(OFST-1,sp)
1134  0075 1d0001        	subw	x,#1
1135  0078 1f03          	ldw	(OFST-1,sp),x
1136  007a               L305:
1137                     ; 374     while((((CLK->SWCR & CLK_SWCR_SWIF) != 0 ) && (DownCounter != 0)))
1139  007a c650c5        	ld	a,20677
1140  007d a508          	bcp	a,#8
1141  007f 2704          	jreq	L705
1143  0081 1e03          	ldw	x,(OFST-1,sp)
1144  0083 26ee          	jrne	L774
1145  0085               L705:
1146                     ; 379     if(DownCounter != 0)
1148  0085 1e03          	ldw	x,(OFST-1,sp)
1149  0087 270a          	jreq	L115
1150                     ; 382       CLK->SWCR |= CLK_SWCR_SWEN;
1152  0089 721250c5      	bset	20677,#1
1153                     ; 383       Swif = SUCCESS;
1155  008d a601          	ld	a,#1
1156  008f 6b02          	ld	(OFST-2,sp),a
1158  0091 20b7          	jra	L174
1159  0093               L115:
1160                     ; 387       Swif = ERROR;
1162  0093 0f02          	clr	(OFST-2,sp)
1163  0095 20b3          	jra	L174
1164  0097               L715:
1165                     ; 397     else if((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_LSI))
1167  0097 0d0a          	tnz	(OFST+6,sp)
1168  0099 260c          	jrne	L325
1170  009b 7b01          	ld	a,(OFST-3,sp)
1171  009d a1d2          	cp	a,#210
1172  009f 2606          	jrne	L325
1173                     ; 399       CLK->ICKR &= (uint8_t)(~CLK_ICKR_LSIEN);
1175  00a1 721750c0      	bres	20672,#3
1177  00a5 200e          	jra	L515
1178  00a7               L325:
1179                     ; 401     else if ((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_HSE))
1181  00a7 0d0a          	tnz	(OFST+6,sp)
1182  00a9 260a          	jrne	L515
1184  00ab 7b01          	ld	a,(OFST-3,sp)
1185  00ad a1b4          	cp	a,#180
1186  00af 2604          	jrne	L515
1187                     ; 403       CLK->ECKR &= (uint8_t)(~CLK_ECKR_HSEEN);
1189  00b1 721150c1      	bres	20673,#0
1190  00b5               L515:
1191                     ; 406   return(Swif);
1193  00b5 7b02          	ld	a,(OFST-2,sp)
1196  00b7 5b06          	addw	sp,#6
1197  00b9 81            	ret
1335                     ; 415 void CLK_HSIPrescalerConfig(CLK_Prescaler_TypeDef HSIPrescaler)
1335                     ; 416 {
1336                     .text:	section	.text,new
1337  0000               _CLK_HSIPrescalerConfig:
1339  0000 88            	push	a
1340       00000000      OFST:	set	0
1343                     ; 418   assert_param(IS_CLK_HSIPRESCALER_OK(HSIPrescaler));
1345                     ; 421   CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
1347  0001 c650c6        	ld	a,20678
1348  0004 a4e7          	and	a,#231
1349  0006 c750c6        	ld	20678,a
1350                     ; 424   CLK->CKDIVR |= (uint8_t)HSIPrescaler;
1352  0009 c650c6        	ld	a,20678
1353  000c 1a01          	or	a,(OFST+1,sp)
1354  000e c750c6        	ld	20678,a
1355                     ; 425 }
1358  0011 84            	pop	a
1359  0012 81            	ret
1494                     ; 436 void CLK_CCOConfig(CLK_Output_TypeDef CLK_CCO)
1494                     ; 437 {
1495                     .text:	section	.text,new
1496  0000               _CLK_CCOConfig:
1498  0000 88            	push	a
1499       00000000      OFST:	set	0
1502                     ; 439   assert_param(IS_CLK_OUTPUT_OK(CLK_CCO));
1504                     ; 442   CLK->CCOR &= (uint8_t)(~CLK_CCOR_CCOSEL);
1506  0001 c650c9        	ld	a,20681
1507  0004 a4e1          	and	a,#225
1508  0006 c750c9        	ld	20681,a
1509                     ; 445   CLK->CCOR |= (uint8_t)CLK_CCO;
1511  0009 c650c9        	ld	a,20681
1512  000c 1a01          	or	a,(OFST+1,sp)
1513  000e c750c9        	ld	20681,a
1514                     ; 448   CLK->CCOR |= CLK_CCOR_CCOEN;
1516  0011 721050c9      	bset	20681,#0
1517                     ; 449 }
1520  0015 84            	pop	a
1521  0016 81            	ret
1586                     ; 459 void CLK_ITConfig(CLK_IT_TypeDef CLK_IT, FunctionalState NewState)
1586                     ; 460 {
1587                     .text:	section	.text,new
1588  0000               _CLK_ITConfig:
1590  0000 89            	pushw	x
1591       00000000      OFST:	set	0
1594                     ; 462   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1596                     ; 463   assert_param(IS_CLK_IT_OK(CLK_IT));
1598                     ; 465   if (NewState != DISABLE)
1600  0001 9f            	ld	a,xl
1601  0002 4d            	tnz	a
1602  0003 2719          	jreq	L527
1603                     ; 467     switch (CLK_IT)
1605  0005 9e            	ld	a,xh
1607                     ; 475     default:
1607                     ; 476       break;
1608  0006 a00c          	sub	a,#12
1609  0008 270a          	jreq	L166
1610  000a a010          	sub	a,#16
1611  000c 2624          	jrne	L337
1612                     ; 469     case CLK_IT_SWIF: /* Enable the clock switch interrupt */
1612                     ; 470       CLK->SWCR |= CLK_SWCR_SWIEN;
1614  000e 721450c5      	bset	20677,#2
1615                     ; 471       break;
1617  0012 201e          	jra	L337
1618  0014               L166:
1619                     ; 472     case CLK_IT_CSSD: /* Enable the clock security system detection interrupt */
1619                     ; 473       CLK->CSSR |= CLK_CSSR_CSSDIE;
1621  0014 721450c8      	bset	20680,#2
1622                     ; 474       break;
1624  0018 2018          	jra	L337
1625  001a               L366:
1626                     ; 475     default:
1626                     ; 476       break;
1628  001a 2016          	jra	L337
1629  001c               L137:
1631  001c 2014          	jra	L337
1632  001e               L527:
1633                     ; 481     switch (CLK_IT)
1635  001e 7b01          	ld	a,(OFST+1,sp)
1637                     ; 489     default:
1637                     ; 490       break;
1638  0020 a00c          	sub	a,#12
1639  0022 270a          	jreq	L766
1640  0024 a010          	sub	a,#16
1641  0026 260a          	jrne	L337
1642                     ; 483     case CLK_IT_SWIF: /* Disable the clock switch interrupt */
1642                     ; 484       CLK->SWCR  &= (uint8_t)(~CLK_SWCR_SWIEN);
1644  0028 721550c5      	bres	20677,#2
1645                     ; 485       break;
1647  002c 2004          	jra	L337
1648  002e               L766:
1649                     ; 486     case CLK_IT_CSSD: /* Disable the clock security system detection interrupt */
1649                     ; 487       CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSDIE);
1651  002e 721550c8      	bres	20680,#2
1652                     ; 488       break;
1653  0032               L337:
1654                     ; 493 }
1657  0032 85            	popw	x
1658  0033 81            	ret
1659  0034               L176:
1660                     ; 489     default:
1660                     ; 490       break;
1662  0034 20fc          	jra	L337
1663  0036               L737:
1664  0036 20fa          	jra	L337
1699                     ; 500 void CLK_SYSCLKConfig(CLK_Prescaler_TypeDef CLK_Prescaler)
1699                     ; 501 {
1700                     .text:	section	.text,new
1701  0000               _CLK_SYSCLKConfig:
1703  0000 88            	push	a
1704       00000000      OFST:	set	0
1707                     ; 503   assert_param(IS_CLK_PRESCALER_OK(CLK_Prescaler));
1709                     ; 505   if (((uint8_t)CLK_Prescaler & (uint8_t)0x80) == 0x00) /* Bit7 = 0 means HSI divider */
1711  0001 a580          	bcp	a,#128
1712  0003 2614          	jrne	L757
1713                     ; 507     CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
1715  0005 c650c6        	ld	a,20678
1716  0008 a4e7          	and	a,#231
1717  000a c750c6        	ld	20678,a
1718                     ; 508     CLK->CKDIVR |= (uint8_t)((uint8_t)CLK_Prescaler & (uint8_t)CLK_CKDIVR_HSIDIV);
1720  000d 7b01          	ld	a,(OFST+1,sp)
1721  000f a418          	and	a,#24
1722  0011 ca50c6        	or	a,20678
1723  0014 c750c6        	ld	20678,a
1725  0017 2012          	jra	L167
1726  0019               L757:
1727                     ; 512     CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_CPUDIV);
1729  0019 c650c6        	ld	a,20678
1730  001c a4f8          	and	a,#248
1731  001e c750c6        	ld	20678,a
1732                     ; 513     CLK->CKDIVR |= (uint8_t)((uint8_t)CLK_Prescaler & (uint8_t)CLK_CKDIVR_CPUDIV);
1734  0021 7b01          	ld	a,(OFST+1,sp)
1735  0023 a407          	and	a,#7
1736  0025 ca50c6        	or	a,20678
1737  0028 c750c6        	ld	20678,a
1738  002b               L167:
1739                     ; 515 }
1742  002b 84            	pop	a
1743  002c 81            	ret
1799                     ; 523 void CLK_SWIMConfig(CLK_SWIMDivider_TypeDef CLK_SWIMDivider)
1799                     ; 524 {
1800                     .text:	section	.text,new
1801  0000               _CLK_SWIMConfig:
1805                     ; 526   assert_param(IS_CLK_SWIMDIVIDER_OK(CLK_SWIMDivider));
1807                     ; 528   if (CLK_SWIMDivider != CLK_SWIMDIVIDER_2)
1809  0000 4d            	tnz	a
1810  0001 2706          	jreq	L1101
1811                     ; 531     CLK->SWIMCCR |= CLK_SWIMCCR_SWIMDIV;
1813  0003 721050cd      	bset	20685,#0
1815  0007 2004          	jra	L3101
1816  0009               L1101:
1817                     ; 536     CLK->SWIMCCR &= (uint8_t)(~CLK_SWIMCCR_SWIMDIV);
1819  0009 721150cd      	bres	20685,#0
1820  000d               L3101:
1821                     ; 538 }
1824  000d 81            	ret
1848                     ; 547 void CLK_ClockSecuritySystemEnable(void)
1848                     ; 548 {
1849                     .text:	section	.text,new
1850  0000               _CLK_ClockSecuritySystemEnable:
1854                     ; 550   CLK->CSSR |= CLK_CSSR_CSSEN;
1856  0000 721050c8      	bset	20680,#0
1857                     ; 551 }
1860  0004 81            	ret
1885                     ; 559 CLK_Source_TypeDef CLK_GetSYSCLKSource(void)
1885                     ; 560 {
1886                     .text:	section	.text,new
1887  0000               _CLK_GetSYSCLKSource:
1891                     ; 561   return((CLK_Source_TypeDef)CLK->CMSR);
1893  0000 c650c3        	ld	a,20675
1896  0003 81            	ret
1959                     ; 569 uint32_t CLK_GetClockFreq(void)
1959                     ; 570 {
1960                     .text:	section	.text,new
1961  0000               _CLK_GetClockFreq:
1963  0000 5209          	subw	sp,#9
1964       00000009      OFST:	set	9
1967                     ; 571   uint32_t clockfrequency = 0;
1969                     ; 572   CLK_Source_TypeDef clocksource = CLK_SOURCE_HSI;
1971                     ; 573   uint8_t tmp = 0, presc = 0;
1975                     ; 576   clocksource = (CLK_Source_TypeDef)CLK->CMSR;
1977  0002 c650c3        	ld	a,20675
1978  0005 6b09          	ld	(OFST+0,sp),a
1979                     ; 578   if (clocksource == CLK_SOURCE_HSI)
1981  0007 7b09          	ld	a,(OFST+0,sp)
1982  0009 a1e1          	cp	a,#225
1983  000b 2641          	jrne	L7601
1984                     ; 580     tmp = (uint8_t)(CLK->CKDIVR & CLK_CKDIVR_HSIDIV);
1986  000d c650c6        	ld	a,20678
1987  0010 a418          	and	a,#24
1988  0012 6b09          	ld	(OFST+0,sp),a
1989                     ; 581     tmp = (uint8_t)(tmp >> 3);
1991  0014 0409          	srl	(OFST+0,sp)
1992  0016 0409          	srl	(OFST+0,sp)
1993  0018 0409          	srl	(OFST+0,sp)
1994                     ; 582     presc = HSIDivFactor[tmp];
1996  001a 7b09          	ld	a,(OFST+0,sp)
1997  001c 5f            	clrw	x
1998  001d 97            	ld	xl,a
1999  001e d60000        	ld	a,(_HSIDivFactor,x)
2000  0021 6b09          	ld	(OFST+0,sp),a
2001                     ; 583     clockfrequency = HSI_VALUE / presc;
2003  0023 7b09          	ld	a,(OFST+0,sp)
2004  0025 b703          	ld	c_lreg+3,a
2005  0027 3f02          	clr	c_lreg+2
2006  0029 3f01          	clr	c_lreg+1
2007  002b 3f00          	clr	c_lreg
2008  002d 96            	ldw	x,sp
2009  002e 1c0001        	addw	x,#OFST-8
2010  0031 cd0000        	call	c_rtol
2012  0034 ae2400        	ldw	x,#9216
2013  0037 bf02          	ldw	c_lreg+2,x
2014  0039 ae00f4        	ldw	x,#244
2015  003c bf00          	ldw	c_lreg,x
2016  003e 96            	ldw	x,sp
2017  003f 1c0001        	addw	x,#OFST-8
2018  0042 cd0000        	call	c_ludv
2020  0045 96            	ldw	x,sp
2021  0046 1c0005        	addw	x,#OFST-4
2022  0049 cd0000        	call	c_rtol
2025  004c 201c          	jra	L1701
2026  004e               L7601:
2027                     ; 585   else if ( clocksource == CLK_SOURCE_LSI)
2029  004e 7b09          	ld	a,(OFST+0,sp)
2030  0050 a1d2          	cp	a,#210
2031  0052 260c          	jrne	L3701
2032                     ; 587     clockfrequency = LSI_VALUE;
2034  0054 aef400        	ldw	x,#62464
2035  0057 1f07          	ldw	(OFST-2,sp),x
2036  0059 ae0001        	ldw	x,#1
2037  005c 1f05          	ldw	(OFST-4,sp),x
2039  005e 200a          	jra	L1701
2040  0060               L3701:
2041                     ; 591     clockfrequency = HSE_VALUE;
2043  0060 ae2400        	ldw	x,#9216
2044  0063 1f07          	ldw	(OFST-2,sp),x
2045  0065 ae00f4        	ldw	x,#244
2046  0068 1f05          	ldw	(OFST-4,sp),x
2047  006a               L1701:
2048                     ; 594   return((uint32_t)clockfrequency);
2050  006a 96            	ldw	x,sp
2051  006b 1c0005        	addw	x,#OFST-4
2052  006e cd0000        	call	c_ltor
2056  0071 5b09          	addw	sp,#9
2057  0073 81            	ret
2156                     ; 604 void CLK_AdjustHSICalibrationValue(CLK_HSITrimValue_TypeDef CLK_HSICalibrationValue)
2156                     ; 605 {
2157                     .text:	section	.text,new
2158  0000               _CLK_AdjustHSICalibrationValue:
2160  0000 88            	push	a
2161       00000000      OFST:	set	0
2164                     ; 607   assert_param(IS_CLK_HSITRIMVALUE_OK(CLK_HSICalibrationValue));
2166                     ; 610   CLK->HSITRIMR = (uint8_t)( (uint8_t)(CLK->HSITRIMR & (uint8_t)(~CLK_HSITRIMR_HSITRIM))|((uint8_t)CLK_HSICalibrationValue));
2168  0001 c650cc        	ld	a,20684
2169  0004 a4f8          	and	a,#248
2170  0006 1a01          	or	a,(OFST+1,sp)
2171  0008 c750cc        	ld	20684,a
2172                     ; 611 }
2175  000b 84            	pop	a
2176  000c 81            	ret
2200                     ; 622 void CLK_SYSCLKEmergencyClear(void)
2200                     ; 623 {
2201                     .text:	section	.text,new
2202  0000               _CLK_SYSCLKEmergencyClear:
2206                     ; 624   CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWBSY);
2208  0000 721150c5      	bres	20677,#0
2209                     ; 625 }
2212  0004 81            	ret
2365                     ; 634 FlagStatus CLK_GetFlagStatus(CLK_Flag_TypeDef CLK_FLAG)
2365                     ; 635 {
2366                     .text:	section	.text,new
2367  0000               _CLK_GetFlagStatus:
2369  0000 89            	pushw	x
2370  0001 5203          	subw	sp,#3
2371       00000003      OFST:	set	3
2374                     ; 636   uint16_t statusreg = 0;
2376                     ; 637   uint8_t tmpreg = 0;
2378                     ; 638   FlagStatus bitstatus = RESET;
2380                     ; 641   assert_param(IS_CLK_FLAG_OK(CLK_FLAG));
2382                     ; 644   statusreg = (uint16_t)((uint16_t)CLK_FLAG & (uint16_t)0xFF00);
2384  0003 01            	rrwa	x,a
2385  0004 9f            	ld	a,xl
2386  0005 a4ff          	and	a,#255
2387  0007 97            	ld	xl,a
2388  0008 4f            	clr	a
2389  0009 02            	rlwa	x,a
2390  000a 1f01          	ldw	(OFST-2,sp),x
2391  000c 01            	rrwa	x,a
2392                     ; 647   if (statusreg == 0x0100) /* The flag to check is in ICKRregister */
2394  000d 1e01          	ldw	x,(OFST-2,sp)
2395  000f a30100        	cpw	x,#256
2396  0012 2607          	jrne	L1421
2397                     ; 649     tmpreg = CLK->ICKR;
2399  0014 c650c0        	ld	a,20672
2400  0017 6b03          	ld	(OFST+0,sp),a
2402  0019 202f          	jra	L3421
2403  001b               L1421:
2404                     ; 651   else if (statusreg == 0x0200) /* The flag to check is in ECKRregister */
2406  001b 1e01          	ldw	x,(OFST-2,sp)
2407  001d a30200        	cpw	x,#512
2408  0020 2607          	jrne	L5421
2409                     ; 653     tmpreg = CLK->ECKR;
2411  0022 c650c1        	ld	a,20673
2412  0025 6b03          	ld	(OFST+0,sp),a
2414  0027 2021          	jra	L3421
2415  0029               L5421:
2416                     ; 655   else if (statusreg == 0x0300) /* The flag to check is in SWIC register */
2418  0029 1e01          	ldw	x,(OFST-2,sp)
2419  002b a30300        	cpw	x,#768
2420  002e 2607          	jrne	L1521
2421                     ; 657     tmpreg = CLK->SWCR;
2423  0030 c650c5        	ld	a,20677
2424  0033 6b03          	ld	(OFST+0,sp),a
2426  0035 2013          	jra	L3421
2427  0037               L1521:
2428                     ; 659   else if (statusreg == 0x0400) /* The flag to check is in CSS register */
2430  0037 1e01          	ldw	x,(OFST-2,sp)
2431  0039 a30400        	cpw	x,#1024
2432  003c 2607          	jrne	L5521
2433                     ; 661     tmpreg = CLK->CSSR;
2435  003e c650c8        	ld	a,20680
2436  0041 6b03          	ld	(OFST+0,sp),a
2438  0043 2005          	jra	L3421
2439  0045               L5521:
2440                     ; 665     tmpreg = CLK->CCOR;
2442  0045 c650c9        	ld	a,20681
2443  0048 6b03          	ld	(OFST+0,sp),a
2444  004a               L3421:
2445                     ; 668   if ((tmpreg & (uint8_t)CLK_FLAG) != (uint8_t)RESET)
2447  004a 7b05          	ld	a,(OFST+2,sp)
2448  004c 1503          	bcp	a,(OFST+0,sp)
2449  004e 2706          	jreq	L1621
2450                     ; 670     bitstatus = SET;
2452  0050 a601          	ld	a,#1
2453  0052 6b03          	ld	(OFST+0,sp),a
2455  0054 2002          	jra	L3621
2456  0056               L1621:
2457                     ; 674     bitstatus = RESET;
2459  0056 0f03          	clr	(OFST+0,sp)
2460  0058               L3621:
2461                     ; 678   return((FlagStatus)bitstatus);
2463  0058 7b03          	ld	a,(OFST+0,sp)
2466  005a 5b05          	addw	sp,#5
2467  005c 81            	ret
2513                     ; 687 ITStatus CLK_GetITStatus(CLK_IT_TypeDef CLK_IT)
2513                     ; 688 {
2514                     .text:	section	.text,new
2515  0000               _CLK_GetITStatus:
2517  0000 88            	push	a
2518  0001 88            	push	a
2519       00000001      OFST:	set	1
2522                     ; 689   ITStatus bitstatus = RESET;
2524                     ; 692   assert_param(IS_CLK_IT_OK(CLK_IT));
2526                     ; 694   if (CLK_IT == CLK_IT_SWIF)
2528  0002 a11c          	cp	a,#28
2529  0004 2611          	jrne	L7031
2530                     ; 697     if ((CLK->SWCR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
2532  0006 c450c5        	and	a,20677
2533  0009 a10c          	cp	a,#12
2534  000b 2606          	jrne	L1131
2535                     ; 699       bitstatus = SET;
2537  000d a601          	ld	a,#1
2538  000f 6b01          	ld	(OFST+0,sp),a
2540  0011 2015          	jra	L5131
2541  0013               L1131:
2542                     ; 703       bitstatus = RESET;
2544  0013 0f01          	clr	(OFST+0,sp)
2545  0015 2011          	jra	L5131
2546  0017               L7031:
2547                     ; 709     if ((CLK->CSSR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
2549  0017 c650c8        	ld	a,20680
2550  001a 1402          	and	a,(OFST+1,sp)
2551  001c a10c          	cp	a,#12
2552  001e 2606          	jrne	L7131
2553                     ; 711       bitstatus = SET;
2555  0020 a601          	ld	a,#1
2556  0022 6b01          	ld	(OFST+0,sp),a
2558  0024 2002          	jra	L5131
2559  0026               L7131:
2560                     ; 715       bitstatus = RESET;
2562  0026 0f01          	clr	(OFST+0,sp)
2563  0028               L5131:
2564                     ; 720   return bitstatus;
2566  0028 7b01          	ld	a,(OFST+0,sp)
2569  002a 85            	popw	x
2570  002b 81            	ret
2606                     ; 729 void CLK_ClearITPendingBit(CLK_IT_TypeDef CLK_IT)
2606                     ; 730 {
2607                     .text:	section	.text,new
2608  0000               _CLK_ClearITPendingBit:
2612                     ; 732   assert_param(IS_CLK_IT_OK(CLK_IT));
2614                     ; 734   if (CLK_IT == (uint8_t)CLK_IT_CSSD)
2616  0000 a10c          	cp	a,#12
2617  0002 2606          	jrne	L1431
2618                     ; 737     CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSD);
2620  0004 721750c8      	bres	20680,#3
2622  0008 2004          	jra	L3431
2623  000a               L1431:
2624                     ; 742     CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIF);
2626  000a 721750c5      	bres	20677,#3
2627  000e               L3431:
2628                     ; 745 }
2631  000e 81            	ret
2666                     	xdef	_CLKPrescTable
2667                     	xdef	_HSIDivFactor
2668                     	xdef	_CLK_ClearITPendingBit
2669                     	xdef	_CLK_GetITStatus
2670                     	xdef	_CLK_GetFlagStatus
2671                     	xdef	_CLK_GetSYSCLKSource
2672                     	xdef	_CLK_GetClockFreq
2673                     	xdef	_CLK_AdjustHSICalibrationValue
2674                     	xdef	_CLK_SYSCLKEmergencyClear
2675                     	xdef	_CLK_ClockSecuritySystemEnable
2676                     	xdef	_CLK_SWIMConfig
2677                     	xdef	_CLK_SYSCLKConfig
2678                     	xdef	_CLK_ITConfig
2679                     	xdef	_CLK_CCOConfig
2680                     	xdef	_CLK_HSIPrescalerConfig
2681                     	xdef	_CLK_ClockSwitchConfig
2682                     	xdef	_CLK_PeripheralClockConfig
2683                     	xdef	_CLK_SlowActiveHaltWakeUpCmd
2684                     	xdef	_CLK_FastHaltWakeUpCmd
2685                     	xdef	_CLK_ClockSwitchCmd
2686                     	xdef	_CLK_CCOCmd
2687                     	xdef	_CLK_LSICmd
2688                     	xdef	_CLK_HSICmd
2689                     	xdef	_CLK_HSECmd
2690                     	xdef	_CLK_DeInit
2691                     	xref.b	c_lreg
2692                     	xref.b	c_x
2711                     	xref	c_ltor
2712                     	xref	c_ludv
2713                     	xref	c_rtol
2714                     	end
