   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
  77                     ; 87 void FLASH_Unlock(FLASH_MemType_TypeDef FLASH_MemType)
  77                     ; 88 {
  79                     .text:	section	.text,new
  80  0000               _FLASH_Unlock:
  84                     ; 90   assert_param(IS_MEMORY_TYPE_OK(FLASH_MemType));
  86                     ; 93   if(FLASH_MemType == FLASH_MEMTYPE_PROG)
  88  0000 a1fd          	cp	a,#253
  89  0002 260a          	jrne	L73
  90                     ; 95     FLASH->PUKR = FLASH_RASS_KEY1;
  92  0004 35565062      	mov	20578,#86
  93                     ; 96     FLASH->PUKR = FLASH_RASS_KEY2;
  95  0008 35ae5062      	mov	20578,#174
  97  000c 2008          	jra	L14
  98  000e               L73:
  99                     ; 101     FLASH->DUKR = FLASH_RASS_KEY2; /* Warning: keys are reversed on data memory !!! */
 101  000e 35ae5064      	mov	20580,#174
 102                     ; 102     FLASH->DUKR = FLASH_RASS_KEY1;
 104  0012 35565064      	mov	20580,#86
 105  0016               L14:
 106                     ; 104 }
 109  0016 81            	ret
 144                     ; 112 void FLASH_Lock(FLASH_MemType_TypeDef FLASH_MemType)
 144                     ; 113 {
 145                     .text:	section	.text,new
 146  0000               _FLASH_Lock:
 150                     ; 115   assert_param(IS_MEMORY_TYPE_OK(FLASH_MemType));
 152                     ; 118   FLASH->IAPSR &= (uint8_t)FLASH_MemType;
 154  0000 c4505f        	and	a,20575
 155  0003 c7505f        	ld	20575,a
 156                     ; 119 }
 159  0006 81            	ret
 182                     ; 126 void FLASH_DeInit(void)
 182                     ; 127 {
 183                     .text:	section	.text,new
 184  0000               _FLASH_DeInit:
 188                     ; 128   FLASH->CR1 = FLASH_CR1_RESET_VALUE;
 190  0000 725f505a      	clr	20570
 191                     ; 129   FLASH->CR2 = FLASH_CR2_RESET_VALUE;
 193  0004 725f505b      	clr	20571
 194                     ; 130   FLASH->NCR2 = FLASH_NCR2_RESET_VALUE;
 196  0008 35ff505c      	mov	20572,#255
 197                     ; 131   FLASH->IAPSR &= (uint8_t)(~FLASH_IAPSR_DUL);
 199  000c 7217505f      	bres	20575,#3
 200                     ; 132   FLASH->IAPSR &= (uint8_t)(~FLASH_IAPSR_PUL);
 202  0010 7213505f      	bres	20575,#1
 203                     ; 133   (void) FLASH->IAPSR; /* Reading of this register causes the clearing of status flags */
 205  0014 c6505f        	ld	a,20575
 206                     ; 134 }
 209  0017 81            	ret
 264                     ; 142 void FLASH_ITConfig(FunctionalState NewState)
 264                     ; 143 {
 265                     .text:	section	.text,new
 266  0000               _FLASH_ITConfig:
 270                     ; 145   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 272                     ; 147   if(NewState != DISABLE)
 274  0000 4d            	tnz	a
 275  0001 2706          	jreq	L711
 276                     ; 149     FLASH->CR1 |= FLASH_CR1_IE; /* Enables the interrupt sources */
 278  0003 7212505a      	bset	20570,#1
 280  0007 2004          	jra	L121
 281  0009               L711:
 282                     ; 153     FLASH->CR1 &= (uint8_t)(~FLASH_CR1_IE); /* Disables the interrupt sources */
 284  0009 7213505a      	bres	20570,#1
 285  000d               L121:
 286                     ; 155 }
 289  000d 81            	ret
 323                     ; 164 void FLASH_EraseByte(uint32_t Address)
 323                     ; 165 {
 324                     .text:	section	.text,new
 325  0000               _FLASH_EraseByte:
 327       00000000      OFST:	set	0
 330                     ; 167   assert_param(IS_FLASH_ADDRESS_OK(Address));
 332                     ; 170   *(PointerAttr uint8_t*) (MemoryAddressCast)Address = FLASH_CLEAR_BYTE; 
 334  0000 1e05          	ldw	x,(OFST+5,sp)
 335  0002 7f            	clr	(x)
 336                     ; 171 }
 339  0003 81            	ret
 382                     ; 181 void FLASH_ProgramByte(uint32_t Address, uint8_t Data)
 382                     ; 182 {
 383                     .text:	section	.text,new
 384  0000               _FLASH_ProgramByte:
 386       00000000      OFST:	set	0
 389                     ; 184   assert_param(IS_FLASH_ADDRESS_OK(Address));
 391                     ; 185   *(PointerAttr uint8_t*) (MemoryAddressCast)Address = Data;
 393  0000 7b07          	ld	a,(OFST+7,sp)
 394  0002 1e05          	ldw	x,(OFST+5,sp)
 395  0004 f7            	ld	(x),a
 396                     ; 186 }
 399  0005 81            	ret
 433                     ; 195 uint8_t FLASH_ReadByte(uint32_t Address)
 433                     ; 196 {
 434                     .text:	section	.text,new
 435  0000               _FLASH_ReadByte:
 437       00000000      OFST:	set	0
 440                     ; 198   assert_param(IS_FLASH_ADDRESS_OK(Address));
 442                     ; 201   return(*(PointerAttr uint8_t *) (MemoryAddressCast)Address); 
 444  0000 1e05          	ldw	x,(OFST+5,sp)
 445  0002 f6            	ld	a,(x)
 448  0003 81            	ret
 491                     ; 212 void FLASH_ProgramWord(uint32_t Address, uint32_t Data)
 491                     ; 213 {
 492                     .text:	section	.text,new
 493  0000               _FLASH_ProgramWord:
 495       00000000      OFST:	set	0
 498                     ; 215   assert_param(IS_FLASH_ADDRESS_OK(Address));
 500                     ; 218   FLASH->CR2 |= FLASH_CR2_WPRG;
 502  0000 721c505b      	bset	20571,#6
 503                     ; 219   FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NWPRG);
 505  0004 721d505c      	bres	20572,#6
 506                     ; 222   *((PointerAttr uint8_t*)(MemoryAddressCast)Address)       = *((uint8_t*)(&Data));
 508  0008 7b07          	ld	a,(OFST+7,sp)
 509  000a 1e05          	ldw	x,(OFST+5,sp)
 510  000c f7            	ld	(x),a
 511                     ; 224   *(((PointerAttr uint8_t*)(MemoryAddressCast)Address) + 1) = *((uint8_t*)(&Data)+1); 
 513  000d 7b08          	ld	a,(OFST+8,sp)
 514  000f 1e05          	ldw	x,(OFST+5,sp)
 515  0011 e701          	ld	(1,x),a
 516                     ; 226   *(((PointerAttr uint8_t*)(MemoryAddressCast)Address) + 2) = *((uint8_t*)(&Data)+2); 
 518  0013 7b09          	ld	a,(OFST+9,sp)
 519  0015 1e05          	ldw	x,(OFST+5,sp)
 520  0017 e702          	ld	(2,x),a
 521                     ; 228   *(((PointerAttr uint8_t*)(MemoryAddressCast)Address) + 3) = *((uint8_t*)(&Data)+3); 
 523  0019 7b0a          	ld	a,(OFST+10,sp)
 524  001b 1e05          	ldw	x,(OFST+5,sp)
 525  001d e703          	ld	(3,x),a
 526                     ; 229 }
 529  001f 81            	ret
 574                     ; 237 void FLASH_ProgramOptionByte(uint16_t Address, uint8_t Data)
 574                     ; 238 {
 575                     .text:	section	.text,new
 576  0000               _FLASH_ProgramOptionByte:
 578  0000 89            	pushw	x
 579       00000000      OFST:	set	0
 582                     ; 240   assert_param(IS_OPTION_BYTE_ADDRESS_OK(Address));
 584                     ; 243   FLASH->CR2 |= FLASH_CR2_OPT;
 586  0001 721e505b      	bset	20571,#7
 587                     ; 244   FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NOPT);
 589  0005 721f505c      	bres	20572,#7
 590                     ; 247   if(Address == 0x4800)
 592  0009 a34800        	cpw	x,#18432
 593  000c 2607          	jrne	L542
 594                     ; 250     *((NEAR uint8_t*)Address) = Data;
 596  000e 7b05          	ld	a,(OFST+5,sp)
 597  0010 1e01          	ldw	x,(OFST+1,sp)
 598  0012 f7            	ld	(x),a
 600  0013 200c          	jra	L742
 601  0015               L542:
 602                     ; 255     *((NEAR uint8_t*)Address) = Data;
 604  0015 7b05          	ld	a,(OFST+5,sp)
 605  0017 1e01          	ldw	x,(OFST+1,sp)
 606  0019 f7            	ld	(x),a
 607                     ; 256     *((NEAR uint8_t*)((uint16_t)(Address + 1))) = (uint8_t)(~Data);
 609  001a 7b05          	ld	a,(OFST+5,sp)
 610  001c 43            	cpl	a
 611  001d 1e01          	ldw	x,(OFST+1,sp)
 612  001f e701          	ld	(1,x),a
 613  0021               L742:
 614                     ; 258   FLASH_WaitForLastOperation(FLASH_MEMTYPE_PROG);
 616  0021 a6fd          	ld	a,#253
 617  0023 cd0000        	call	_FLASH_WaitForLastOperation
 619                     ; 261   FLASH->CR2 &= (uint8_t)(~FLASH_CR2_OPT);
 621  0026 721f505b      	bres	20571,#7
 622                     ; 262   FLASH->NCR2 |= FLASH_NCR2_NOPT;
 624  002a 721e505c      	bset	20572,#7
 625                     ; 263 }
 628  002e 85            	popw	x
 629  002f 81            	ret
 665                     ; 270 void FLASH_EraseOptionByte(uint16_t Address)
 665                     ; 271 {
 666                     .text:	section	.text,new
 667  0000               _FLASH_EraseOptionByte:
 669  0000 89            	pushw	x
 670       00000000      OFST:	set	0
 673                     ; 273   assert_param(IS_OPTION_BYTE_ADDRESS_OK(Address));
 675                     ; 276   FLASH->CR2 |= FLASH_CR2_OPT;
 677  0001 721e505b      	bset	20571,#7
 678                     ; 277   FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NOPT);
 680  0005 721f505c      	bres	20572,#7
 681                     ; 280   if(Address == 0x4800)
 683  0009 a34800        	cpw	x,#18432
 684  000c 2603          	jrne	L762
 685                     ; 283     *((NEAR uint8_t*)Address) = FLASH_CLEAR_BYTE;
 687  000e 7f            	clr	(x)
 689  000f 2009          	jra	L172
 690  0011               L762:
 691                     ; 288     *((NEAR uint8_t*)Address) = FLASH_CLEAR_BYTE;
 693  0011 1e01          	ldw	x,(OFST+1,sp)
 694  0013 7f            	clr	(x)
 695                     ; 289     *((NEAR uint8_t*)((uint16_t)(Address + (uint16_t)1 ))) = FLASH_SET_BYTE;
 697  0014 1e01          	ldw	x,(OFST+1,sp)
 698  0016 a6ff          	ld	a,#255
 699  0018 e701          	ld	(1,x),a
 700  001a               L172:
 701                     ; 291   FLASH_WaitForLastOperation(FLASH_MEMTYPE_PROG);
 703  001a a6fd          	ld	a,#253
 704  001c cd0000        	call	_FLASH_WaitForLastOperation
 706                     ; 294   FLASH->CR2 &= (uint8_t)(~FLASH_CR2_OPT);
 708  001f 721f505b      	bres	20571,#7
 709                     ; 295   FLASH->NCR2 |= FLASH_NCR2_NOPT;
 711  0023 721e505c      	bset	20572,#7
 712                     ; 296 }
 715  0027 85            	popw	x
 716  0028 81            	ret
 779                     ; 303 uint16_t FLASH_ReadOptionByte(uint16_t Address)
 779                     ; 304 {
 780                     .text:	section	.text,new
 781  0000               _FLASH_ReadOptionByte:
 783  0000 5204          	subw	sp,#4
 784       00000004      OFST:	set	4
 787                     ; 305   uint8_t value_optbyte, value_optbyte_complement = 0;
 789                     ; 306   uint16_t res_value = 0;
 791                     ; 309   assert_param(IS_OPTION_BYTE_ADDRESS_OK(Address));
 793                     ; 311   value_optbyte = *((NEAR uint8_t*)Address); /* Read option byte */
 795  0002 f6            	ld	a,(x)
 796  0003 6b02          	ld	(OFST-2,sp),a
 797                     ; 312   value_optbyte_complement = *(((NEAR uint8_t*)Address) + 1); /* Read option byte complement */
 799  0005 e601          	ld	a,(1,x)
 800  0007 6b01          	ld	(OFST-3,sp),a
 801                     ; 315   if(Address == 0x4800)	 
 803  0009 a34800        	cpw	x,#18432
 804  000c 2608          	jrne	L523
 805                     ; 317     res_value =	 value_optbyte;
 807  000e 7b02          	ld	a,(OFST-2,sp)
 808  0010 5f            	clrw	x
 809  0011 97            	ld	xl,a
 810  0012 1f03          	ldw	(OFST-1,sp),x
 812  0014 2023          	jra	L723
 813  0016               L523:
 814                     ; 321     if(value_optbyte == (uint8_t)(~value_optbyte_complement))
 816  0016 7b01          	ld	a,(OFST-3,sp)
 817  0018 43            	cpl	a
 818  0019 1102          	cp	a,(OFST-2,sp)
 819  001b 2617          	jrne	L133
 820                     ; 323       res_value = (uint16_t)((uint16_t)value_optbyte << 8);
 822  001d 7b02          	ld	a,(OFST-2,sp)
 823  001f 5f            	clrw	x
 824  0020 97            	ld	xl,a
 825  0021 4f            	clr	a
 826  0022 02            	rlwa	x,a
 827  0023 1f03          	ldw	(OFST-1,sp),x
 828                     ; 324       res_value = res_value | (uint16_t)value_optbyte_complement;
 830  0025 7b01          	ld	a,(OFST-3,sp)
 831  0027 5f            	clrw	x
 832  0028 97            	ld	xl,a
 833  0029 01            	rrwa	x,a
 834  002a 1a04          	or	a,(OFST+0,sp)
 835  002c 01            	rrwa	x,a
 836  002d 1a03          	or	a,(OFST-1,sp)
 837  002f 01            	rrwa	x,a
 838  0030 1f03          	ldw	(OFST-1,sp),x
 840  0032 2005          	jra	L723
 841  0034               L133:
 842                     ; 328       res_value = FLASH_OPTIONBYTE_ERROR;
 844  0034 ae5555        	ldw	x,#21845
 845  0037 1f03          	ldw	(OFST-1,sp),x
 846  0039               L723:
 847                     ; 331   return(res_value);
 849  0039 1e03          	ldw	x,(OFST-1,sp)
 852  003b 5b04          	addw	sp,#4
 853  003d 81            	ret
 927                     ; 340 void FLASH_SetLowPowerMode(FLASH_LPMode_TypeDef FLASH_LPMode)
 927                     ; 341 {
 928                     .text:	section	.text,new
 929  0000               _FLASH_SetLowPowerMode:
 931  0000 88            	push	a
 932       00000000      OFST:	set	0
 935                     ; 343   assert_param(IS_FLASH_LOW_POWER_MODE_OK(FLASH_LPMode));
 937                     ; 346   FLASH->CR1 &= (uint8_t)(~(FLASH_CR1_HALT | FLASH_CR1_AHALT)); 
 939  0001 c6505a        	ld	a,20570
 940  0004 a4f3          	and	a,#243
 941  0006 c7505a        	ld	20570,a
 942                     ; 349   FLASH->CR1 |= (uint8_t)FLASH_LPMode; 
 944  0009 c6505a        	ld	a,20570
 945  000c 1a01          	or	a,(OFST+1,sp)
 946  000e c7505a        	ld	20570,a
 947                     ; 350 }
 950  0011 84            	pop	a
 951  0012 81            	ret
1009                     ; 358 void FLASH_SetProgrammingTime(FLASH_ProgramTime_TypeDef FLASH_ProgTime)
1009                     ; 359 {
1010                     .text:	section	.text,new
1011  0000               _FLASH_SetProgrammingTime:
1015                     ; 361   assert_param(IS_FLASH_PROGRAM_TIME_OK(FLASH_ProgTime));
1017                     ; 363   FLASH->CR1 &= (uint8_t)(~FLASH_CR1_FIX);
1019  0000 7211505a      	bres	20570,#0
1020                     ; 364   FLASH->CR1 |= (uint8_t)FLASH_ProgTime;
1022  0004 ca505a        	or	a,20570
1023  0007 c7505a        	ld	20570,a
1024                     ; 365 }
1027  000a 81            	ret
1052                     ; 372 FLASH_LPMode_TypeDef FLASH_GetLowPowerMode(void)
1052                     ; 373 {
1053                     .text:	section	.text,new
1054  0000               _FLASH_GetLowPowerMode:
1058                     ; 374   return((FLASH_LPMode_TypeDef)(FLASH->CR1 & (uint8_t)(FLASH_CR1_HALT | FLASH_CR1_AHALT)));
1060  0000 c6505a        	ld	a,20570
1061  0003 a40c          	and	a,#12
1064  0005 81            	ret
1089                     ; 382 FLASH_ProgramTime_TypeDef FLASH_GetProgrammingTime(void)
1089                     ; 383 {
1090                     .text:	section	.text,new
1091  0000               _FLASH_GetProgrammingTime:
1095                     ; 384   return((FLASH_ProgramTime_TypeDef)(FLASH->CR1 & FLASH_CR1_FIX));
1097  0000 c6505a        	ld	a,20570
1098  0003 a401          	and	a,#1
1101  0005 81            	ret
1135                     ; 392 uint32_t FLASH_GetBootSize(void)
1135                     ; 393 {
1136                     .text:	section	.text,new
1137  0000               _FLASH_GetBootSize:
1139  0000 5204          	subw	sp,#4
1140       00000004      OFST:	set	4
1143                     ; 394   uint32_t temp = 0;
1145                     ; 397   temp = (uint32_t)((uint32_t)FLASH->FPR * (uint32_t)512);
1147  0002 c6505d        	ld	a,20573
1148  0005 5f            	clrw	x
1149  0006 97            	ld	xl,a
1150  0007 90ae0200      	ldw	y,#512
1151  000b cd0000        	call	c_umul
1153  000e 96            	ldw	x,sp
1154  000f 1c0001        	addw	x,#OFST-3
1155  0012 cd0000        	call	c_rtol
1157                     ; 400   if(FLASH->FPR == 0xFF)
1159  0015 c6505d        	ld	a,20573
1160  0018 a1ff          	cp	a,#255
1161  001a 2611          	jrne	L354
1162                     ; 402     temp += 512;
1164  001c ae0200        	ldw	x,#512
1165  001f bf02          	ldw	c_lreg+2,x
1166  0021 ae0000        	ldw	x,#0
1167  0024 bf00          	ldw	c_lreg,x
1168  0026 96            	ldw	x,sp
1169  0027 1c0001        	addw	x,#OFST-3
1170  002a cd0000        	call	c_lgadd
1172  002d               L354:
1173                     ; 406   return(temp);
1175  002d 96            	ldw	x,sp
1176  002e 1c0001        	addw	x,#OFST-3
1177  0031 cd0000        	call	c_ltor
1181  0034 5b04          	addw	sp,#4
1182  0036 81            	ret
1284                     ; 417 FlagStatus FLASH_GetFlagStatus(FLASH_Flag_TypeDef FLASH_FLAG)
1284                     ; 418 {
1285                     .text:	section	.text,new
1286  0000               _FLASH_GetFlagStatus:
1288  0000 88            	push	a
1289       00000001      OFST:	set	1
1292                     ; 419   FlagStatus status = RESET;
1294                     ; 421   assert_param(IS_FLASH_FLAGS_OK(FLASH_FLAG));
1296                     ; 424   if((FLASH->IAPSR & (uint8_t)FLASH_FLAG) != (uint8_t)RESET)
1298  0001 c4505f        	and	a,20575
1299  0004 2706          	jreq	L325
1300                     ; 426     status = SET; /* FLASH_FLAG is set */
1302  0006 a601          	ld	a,#1
1303  0008 6b01          	ld	(OFST+0,sp),a
1305  000a 2002          	jra	L525
1306  000c               L325:
1307                     ; 430     status = RESET; /* FLASH_FLAG is reset*/
1309  000c 0f01          	clr	(OFST+0,sp)
1310  000e               L525:
1311                     ; 434   return status;
1313  000e 7b01          	ld	a,(OFST+0,sp)
1316  0010 5b01          	addw	sp,#1
1317  0012 81            	ret
1402                     ; 549 IN_RAM(FLASH_Status_TypeDef FLASH_WaitForLastOperation(FLASH_MemType_TypeDef FLASH_MemType)) 
1402                     ; 550 {
1403                     .text:	section	.text,new
1404  0000               _FLASH_WaitForLastOperation:
1406  0000 5203          	subw	sp,#3
1407       00000003      OFST:	set	3
1410                     ; 551   uint8_t flagstatus = 0x00;
1412  0002 0f03          	clr	(OFST+0,sp)
1413                     ; 552   uint16_t timeout = OPERATION_TIMEOUT;
1415  0004 aeffff        	ldw	x,#65535
1416  0007 1f01          	ldw	(OFST-2,sp),x
1418  0009 200e          	jra	L375
1419  000b               L765:
1420                     ; 578     flagstatus = (uint8_t)(FLASH->IAPSR & (FLASH_IAPSR_EOP | FLASH_IAPSR_WR_PG_DIS));
1422  000b c6505f        	ld	a,20575
1423  000e a405          	and	a,#5
1424  0010 6b03          	ld	(OFST+0,sp),a
1425                     ; 579     timeout--;
1427  0012 1e01          	ldw	x,(OFST-2,sp)
1428  0014 1d0001        	subw	x,#1
1429  0017 1f01          	ldw	(OFST-2,sp),x
1430  0019               L375:
1431                     ; 576   while((flagstatus == 0x00) && (timeout != 0x00))
1433  0019 0d03          	tnz	(OFST+0,sp)
1434  001b 2604          	jrne	L775
1436  001d 1e01          	ldw	x,(OFST-2,sp)
1437  001f 26ea          	jrne	L765
1438  0021               L775:
1439                     ; 583   if(timeout == 0x00 )
1441  0021 1e01          	ldw	x,(OFST-2,sp)
1442  0023 2604          	jrne	L106
1443                     ; 585     flagstatus = FLASH_STATUS_TIMEOUT;
1445  0025 a602          	ld	a,#2
1446  0027 6b03          	ld	(OFST+0,sp),a
1447  0029               L106:
1448                     ; 588   return((FLASH_Status_TypeDef)flagstatus);
1450  0029 7b03          	ld	a,(OFST+0,sp)
1453  002b 5b03          	addw	sp,#3
1454  002d 81            	ret
1517                     ; 598 IN_RAM(void FLASH_EraseBlock(uint16_t BlockNum, FLASH_MemType_TypeDef FLASH_MemType))
1517                     ; 599 {
1518                     .text:	section	.text,new
1519  0000               _FLASH_EraseBlock:
1521  0000 89            	pushw	x
1522  0001 5206          	subw	sp,#6
1523       00000006      OFST:	set	6
1526                     ; 600   uint32_t startaddress = 0;
1528                     ; 610   assert_param(IS_MEMORY_TYPE_OK(FLASH_MemType));
1530                     ; 611   if(FLASH_MemType == FLASH_MEMTYPE_PROG)
1532  0003 7b0b          	ld	a,(OFST+5,sp)
1533  0005 a1fd          	cp	a,#253
1534  0007 260c          	jrne	L536
1535                     ; 613     assert_param(IS_FLASH_PROG_BLOCK_NUMBER_OK(BlockNum));
1537                     ; 614     startaddress = FLASH_PROG_START_PHYSICAL_ADDRESS;
1539  0009 ae8000        	ldw	x,#32768
1540  000c 1f05          	ldw	(OFST-1,sp),x
1541  000e ae0000        	ldw	x,#0
1542  0011 1f03          	ldw	(OFST-3,sp),x
1544  0013 200a          	jra	L736
1545  0015               L536:
1546                     ; 618     assert_param(IS_FLASH_DATA_BLOCK_NUMBER_OK(BlockNum));
1548                     ; 619     startaddress = FLASH_DATA_START_PHYSICAL_ADDRESS;
1550  0015 ae4000        	ldw	x,#16384
1551  0018 1f05          	ldw	(OFST-1,sp),x
1552  001a ae0000        	ldw	x,#0
1553  001d 1f03          	ldw	(OFST-3,sp),x
1554  001f               L736:
1555                     ; 627     pwFlash = (PointerAttr uint32_t *)(MemoryAddressCast)(startaddress + ((uint32_t)BlockNum * FLASH_BLOCK_SIZE));
1557  001f 1e07          	ldw	x,(OFST+1,sp)
1558  0021 a640          	ld	a,#64
1559  0023 cd0000        	call	c_cmulx
1561  0026 96            	ldw	x,sp
1562  0027 1c0003        	addw	x,#OFST-3
1563  002a cd0000        	call	c_ladd
1565  002d be02          	ldw	x,c_lreg+2
1566  002f 1f01          	ldw	(OFST-5,sp),x
1567                     ; 631   FLASH->CR2 |= FLASH_CR2_ERASE;
1569  0031 721a505b      	bset	20571,#5
1570                     ; 632   FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NERASE);
1572  0035 721b505c      	bres	20572,#5
1573                     ; 636     *pwFlash = (uint32_t)0;
1575  0039 1e01          	ldw	x,(OFST-5,sp)
1576  003b a600          	ld	a,#0
1577  003d e703          	ld	(3,x),a
1578  003f a600          	ld	a,#0
1579  0041 e702          	ld	(2,x),a
1580  0043 a600          	ld	a,#0
1581  0045 e701          	ld	(1,x),a
1582  0047 a600          	ld	a,#0
1583  0049 f7            	ld	(x),a
1584                     ; 644 }
1587  004a 5b08          	addw	sp,#8
1588  004c 81            	ret
1692                     ; 655 IN_RAM(void FLASH_ProgramBlock(uint16_t BlockNum, FLASH_MemType_TypeDef FLASH_MemType, 
1692                     ; 656                         FLASH_ProgramMode_TypeDef FLASH_ProgMode, uint8_t *Buffer))
1692                     ; 657 {
1693                     .text:	section	.text,new
1694  0000               _FLASH_ProgramBlock:
1696  0000 89            	pushw	x
1697  0001 5206          	subw	sp,#6
1698       00000006      OFST:	set	6
1701                     ; 658   uint16_t Count = 0;
1703                     ; 659   uint32_t startaddress = 0;
1705                     ; 662   assert_param(IS_MEMORY_TYPE_OK(FLASH_MemType));
1707                     ; 663   assert_param(IS_FLASH_PROGRAM_MODE_OK(FLASH_ProgMode));
1709                     ; 664   if(FLASH_MemType == FLASH_MEMTYPE_PROG)
1711  0003 7b0b          	ld	a,(OFST+5,sp)
1712  0005 a1fd          	cp	a,#253
1713  0007 260c          	jrne	L317
1714                     ; 666     assert_param(IS_FLASH_PROG_BLOCK_NUMBER_OK(BlockNum));
1716                     ; 667     startaddress = FLASH_PROG_START_PHYSICAL_ADDRESS;
1718  0009 ae8000        	ldw	x,#32768
1719  000c 1f03          	ldw	(OFST-3,sp),x
1720  000e ae0000        	ldw	x,#0
1721  0011 1f01          	ldw	(OFST-5,sp),x
1723  0013 200a          	jra	L517
1724  0015               L317:
1725                     ; 671     assert_param(IS_FLASH_DATA_BLOCK_NUMBER_OK(BlockNum));
1727                     ; 672     startaddress = FLASH_DATA_START_PHYSICAL_ADDRESS;
1729  0015 ae4000        	ldw	x,#16384
1730  0018 1f03          	ldw	(OFST-3,sp),x
1731  001a ae0000        	ldw	x,#0
1732  001d 1f01          	ldw	(OFST-5,sp),x
1733  001f               L517:
1734                     ; 676   startaddress = startaddress + ((uint32_t)BlockNum * FLASH_BLOCK_SIZE);
1736  001f 1e07          	ldw	x,(OFST+1,sp)
1737  0021 a640          	ld	a,#64
1738  0023 cd0000        	call	c_cmulx
1740  0026 96            	ldw	x,sp
1741  0027 1c0001        	addw	x,#OFST-5
1742  002a cd0000        	call	c_lgadd
1744                     ; 679   if(FLASH_ProgMode == FLASH_PROGRAMMODE_STANDARD)
1746  002d 0d0c          	tnz	(OFST+6,sp)
1747  002f 260a          	jrne	L717
1748                     ; 682     FLASH->CR2 |= FLASH_CR2_PRG;
1750  0031 7210505b      	bset	20571,#0
1751                     ; 683     FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NPRG);
1753  0035 7211505c      	bres	20572,#0
1755  0039 2008          	jra	L127
1756  003b               L717:
1757                     ; 688     FLASH->CR2 |= FLASH_CR2_FPRG;
1759  003b 7218505b      	bset	20571,#4
1760                     ; 689     FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NFPRG);
1762  003f 7219505c      	bres	20572,#4
1763  0043               L127:
1764                     ; 693   for(Count = 0; Count < FLASH_BLOCK_SIZE; Count++)
1766  0043 5f            	clrw	x
1767  0044 1f05          	ldw	(OFST-1,sp),x
1768  0046               L327:
1769                     ; 695     *((PointerAttr uint8_t*) (MemoryAddressCast)startaddress + Count) = ((uint8_t)(Buffer[Count]));
1771  0046 1e0d          	ldw	x,(OFST+7,sp)
1772  0048 72fb05        	addw	x,(OFST-1,sp)
1773  004b f6            	ld	a,(x)
1774  004c 1e03          	ldw	x,(OFST-3,sp)
1775  004e 72fb05        	addw	x,(OFST-1,sp)
1776  0051 f7            	ld	(x),a
1777                     ; 693   for(Count = 0; Count < FLASH_BLOCK_SIZE; Count++)
1779  0052 1e05          	ldw	x,(OFST-1,sp)
1780  0054 1c0001        	addw	x,#1
1781  0057 1f05          	ldw	(OFST-1,sp),x
1784  0059 1e05          	ldw	x,(OFST-1,sp)
1785  005b a30040        	cpw	x,#64
1786  005e 25e6          	jrult	L327
1787                     ; 697 }
1790  0060 5b08          	addw	sp,#8
1791  0062 81            	ret
1804                     	xdef	_FLASH_WaitForLastOperation
1805                     	xdef	_FLASH_ProgramBlock
1806                     	xdef	_FLASH_EraseBlock
1807                     	xdef	_FLASH_GetFlagStatus
1808                     	xdef	_FLASH_GetBootSize
1809                     	xdef	_FLASH_GetProgrammingTime
1810                     	xdef	_FLASH_GetLowPowerMode
1811                     	xdef	_FLASH_SetProgrammingTime
1812                     	xdef	_FLASH_SetLowPowerMode
1813                     	xdef	_FLASH_EraseOptionByte
1814                     	xdef	_FLASH_ProgramOptionByte
1815                     	xdef	_FLASH_ReadOptionByte
1816                     	xdef	_FLASH_ProgramWord
1817                     	xdef	_FLASH_ReadByte
1818                     	xdef	_FLASH_ProgramByte
1819                     	xdef	_FLASH_EraseByte
1820                     	xdef	_FLASH_ITConfig
1821                     	xdef	_FLASH_DeInit
1822                     	xdef	_FLASH_Lock
1823                     	xdef	_FLASH_Unlock
1824                     	xref.b	c_lreg
1825                     	xref.b	c_x
1826                     	xref.b	c_y
1845                     	xref	c_ladd
1846                     	xref	c_cmulx
1847                     	xref	c_ltor
1848                     	xref	c_lgadd
1849                     	xref	c_rtol
1850                     	xref	c_umul
1851                     	end
