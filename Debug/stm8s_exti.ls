   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
  45                     ; 53 void EXTI_DeInit(void)
  45                     ; 54 {
  47                     .text:	section	.text,new
  48  0000               _EXTI_DeInit:
  52                     ; 55   EXTI->CR1 = EXTI_CR1_RESET_VALUE;
  54  0000 725f50a0      	clr	20640
  55                     ; 56   EXTI->CR2 = EXTI_CR2_RESET_VALUE;
  57  0004 725f50a1      	clr	20641
  58                     ; 57 }
  61  0008 81            	ret
 186                     ; 70 void EXTI_SetExtIntSensitivity(EXTI_Port_TypeDef Port, EXTI_Sensitivity_TypeDef SensitivityValue)
 186                     ; 71 {
 187                     .text:	section	.text,new
 188  0000               _EXTI_SetExtIntSensitivity:
 190  0000 89            	pushw	x
 191       00000000      OFST:	set	0
 194                     ; 73   assert_param(IS_EXTI_PORT_OK(Port));
 196                     ; 74   assert_param(IS_EXTI_SENSITIVITY_OK(SensitivityValue));
 198                     ; 77   switch (Port)
 200  0001 9e            	ld	a,xh
 202                     ; 99   default:
 202                     ; 100     break;
 203  0002 4d            	tnz	a
 204  0003 270e          	jreq	L12
 205  0005 4a            	dec	a
 206  0006 271d          	jreq	L32
 207  0008 4a            	dec	a
 208  0009 272e          	jreq	L52
 209  000b 4a            	dec	a
 210  000c 2742          	jreq	L72
 211  000e 4a            	dec	a
 212  000f 2756          	jreq	L13
 213  0011 2064          	jra	L311
 214  0013               L12:
 215                     ; 79   case EXTI_PORT_GPIOA:
 215                     ; 80     EXTI->CR1 &= (uint8_t)(~EXTI_CR1_PAIS);
 217  0013 c650a0        	ld	a,20640
 218  0016 a4fc          	and	a,#252
 219  0018 c750a0        	ld	20640,a
 220                     ; 81     EXTI->CR1 |= (uint8_t)(SensitivityValue);
 222  001b c650a0        	ld	a,20640
 223  001e 1a02          	or	a,(OFST+2,sp)
 224  0020 c750a0        	ld	20640,a
 225                     ; 82     break;
 227  0023 2052          	jra	L311
 228  0025               L32:
 229                     ; 83   case EXTI_PORT_GPIOB:
 229                     ; 84     EXTI->CR1 &= (uint8_t)(~EXTI_CR1_PBIS);
 231  0025 c650a0        	ld	a,20640
 232  0028 a4f3          	and	a,#243
 233  002a c750a0        	ld	20640,a
 234                     ; 85     EXTI->CR1 |= (uint8_t)((uint8_t)(SensitivityValue) << 2);
 236  002d 7b02          	ld	a,(OFST+2,sp)
 237  002f 48            	sll	a
 238  0030 48            	sll	a
 239  0031 ca50a0        	or	a,20640
 240  0034 c750a0        	ld	20640,a
 241                     ; 86     break;
 243  0037 203e          	jra	L311
 244  0039               L52:
 245                     ; 87   case EXTI_PORT_GPIOC:
 245                     ; 88     EXTI->CR1 &= (uint8_t)(~EXTI_CR1_PCIS);
 247  0039 c650a0        	ld	a,20640
 248  003c a4cf          	and	a,#207
 249  003e c750a0        	ld	20640,a
 250                     ; 89     EXTI->CR1 |= (uint8_t)((uint8_t)(SensitivityValue) << 4);
 252  0041 7b02          	ld	a,(OFST+2,sp)
 253  0043 97            	ld	xl,a
 254  0044 a610          	ld	a,#16
 255  0046 42            	mul	x,a
 256  0047 9f            	ld	a,xl
 257  0048 ca50a0        	or	a,20640
 258  004b c750a0        	ld	20640,a
 259                     ; 90     break;
 261  004e 2027          	jra	L311
 262  0050               L72:
 263                     ; 91   case EXTI_PORT_GPIOD:
 263                     ; 92     EXTI->CR1 &= (uint8_t)(~EXTI_CR1_PDIS);
 265  0050 c650a0        	ld	a,20640
 266  0053 a43f          	and	a,#63
 267  0055 c750a0        	ld	20640,a
 268                     ; 93     EXTI->CR1 |= (uint8_t)((uint8_t)(SensitivityValue) << 6);
 270  0058 7b02          	ld	a,(OFST+2,sp)
 271  005a 97            	ld	xl,a
 272  005b a640          	ld	a,#64
 273  005d 42            	mul	x,a
 274  005e 9f            	ld	a,xl
 275  005f ca50a0        	or	a,20640
 276  0062 c750a0        	ld	20640,a
 277                     ; 94     break;
 279  0065 2010          	jra	L311
 280  0067               L13:
 281                     ; 95   case EXTI_PORT_GPIOE:
 281                     ; 96     EXTI->CR2 &= (uint8_t)(~EXTI_CR2_PEIS);
 283  0067 c650a1        	ld	a,20641
 284  006a a4fc          	and	a,#252
 285  006c c750a1        	ld	20641,a
 286                     ; 97     EXTI->CR2 |= (uint8_t)(SensitivityValue);
 288  006f c650a1        	ld	a,20641
 289  0072 1a02          	or	a,(OFST+2,sp)
 290  0074 c750a1        	ld	20641,a
 291                     ; 98     break;
 293  0077               L33:
 294                     ; 99   default:
 294                     ; 100     break;
 296  0077               L311:
 297                     ; 102 }
 300  0077 85            	popw	x
 301  0078 81            	ret
 359                     ; 111 void EXTI_SetTLISensitivity(EXTI_TLISensitivity_TypeDef SensitivityValue)
 359                     ; 112 {
 360                     .text:	section	.text,new
 361  0000               _EXTI_SetTLISensitivity:
 365                     ; 114   assert_param(IS_EXTI_TLISENSITIVITY_OK(SensitivityValue));
 367                     ; 117   EXTI->CR2 &= (uint8_t)(~EXTI_CR2_TLIS);
 369  0000 721550a1      	bres	20641,#2
 370                     ; 118   EXTI->CR2 |= (uint8_t)(SensitivityValue);
 372  0004 ca50a1        	or	a,20641
 373  0007 c750a1        	ld	20641,a
 374                     ; 119 }
 377  000a 81            	ret
 423                     ; 126 EXTI_Sensitivity_TypeDef EXTI_GetExtIntSensitivity(EXTI_Port_TypeDef Port)
 423                     ; 127 {
 424                     .text:	section	.text,new
 425  0000               _EXTI_GetExtIntSensitivity:
 427  0000 88            	push	a
 428       00000001      OFST:	set	1
 431                     ; 128   uint8_t value = 0;
 433  0001 0f01          	clr	(OFST+0,sp)
 434                     ; 131   assert_param(IS_EXTI_PORT_OK(Port));
 436                     ; 133   switch (Port)
 439                     ; 150   default:
 439                     ; 151     break;
 440  0003 4d            	tnz	a
 441  0004 270e          	jreq	L341
 442  0006 4a            	dec	a
 443  0007 2714          	jreq	L541
 444  0009 4a            	dec	a
 445  000a 271c          	jreq	L741
 446  000c 4a            	dec	a
 447  000d 2725          	jreq	L151
 448  000f 4a            	dec	a
 449  0010 2730          	jreq	L351
 450  0012 2035          	jra	L302
 451  0014               L341:
 452                     ; 135   case EXTI_PORT_GPIOA:
 452                     ; 136     value = (uint8_t)(EXTI->CR1 & EXTI_CR1_PAIS);
 454  0014 c650a0        	ld	a,20640
 455  0017 a403          	and	a,#3
 456  0019 6b01          	ld	(OFST+0,sp),a
 457                     ; 137     break;
 459  001b 202c          	jra	L302
 460  001d               L541:
 461                     ; 138   case EXTI_PORT_GPIOB:
 461                     ; 139     value = (uint8_t)((uint8_t)(EXTI->CR1 & EXTI_CR1_PBIS) >> 2);
 463  001d c650a0        	ld	a,20640
 464  0020 a40c          	and	a,#12
 465  0022 44            	srl	a
 466  0023 44            	srl	a
 467  0024 6b01          	ld	(OFST+0,sp),a
 468                     ; 140     break;
 470  0026 2021          	jra	L302
 471  0028               L741:
 472                     ; 141   case EXTI_PORT_GPIOC:
 472                     ; 142     value = (uint8_t)((uint8_t)(EXTI->CR1 & EXTI_CR1_PCIS) >> 4);
 474  0028 c650a0        	ld	a,20640
 475  002b a430          	and	a,#48
 476  002d 4e            	swap	a
 477  002e a40f          	and	a,#15
 478  0030 6b01          	ld	(OFST+0,sp),a
 479                     ; 143     break;
 481  0032 2015          	jra	L302
 482  0034               L151:
 483                     ; 144   case EXTI_PORT_GPIOD:
 483                     ; 145     value = (uint8_t)((uint8_t)(EXTI->CR1 & EXTI_CR1_PDIS) >> 6);
 485  0034 c650a0        	ld	a,20640
 486  0037 a4c0          	and	a,#192
 487  0039 4e            	swap	a
 488  003a 44            	srl	a
 489  003b 44            	srl	a
 490  003c a403          	and	a,#3
 491  003e 6b01          	ld	(OFST+0,sp),a
 492                     ; 146     break;
 494  0040 2007          	jra	L302
 495  0042               L351:
 496                     ; 147   case EXTI_PORT_GPIOE:
 496                     ; 148     value = (uint8_t)(EXTI->CR2 & EXTI_CR2_PEIS);
 498  0042 c650a1        	ld	a,20641
 499  0045 a403          	and	a,#3
 500  0047 6b01          	ld	(OFST+0,sp),a
 501                     ; 149     break;
 503  0049               L551:
 504                     ; 150   default:
 504                     ; 151     break;
 506  0049               L302:
 507                     ; 154   return((EXTI_Sensitivity_TypeDef)value);
 509  0049 7b01          	ld	a,(OFST+0,sp)
 512  004b 5b01          	addw	sp,#1
 513  004d 81            	ret
 549                     ; 162 EXTI_TLISensitivity_TypeDef EXTI_GetTLISensitivity(void)
 549                     ; 163 {
 550                     .text:	section	.text,new
 551  0000               _EXTI_GetTLISensitivity:
 553  0000 88            	push	a
 554       00000001      OFST:	set	1
 557                     ; 164   uint8_t value = 0;
 559                     ; 167   value = (uint8_t)(EXTI->CR2 & EXTI_CR2_TLIS);
 561  0001 c650a1        	ld	a,20641
 562  0004 a404          	and	a,#4
 563  0006 6b01          	ld	(OFST+0,sp),a
 564                     ; 169   return((EXTI_TLISensitivity_TypeDef)value);
 566  0008 7b01          	ld	a,(OFST+0,sp)
 569  000a 5b01          	addw	sp,#1
 570  000c 81            	ret
 583                     	xdef	_EXTI_GetTLISensitivity
 584                     	xdef	_EXTI_GetExtIntSensitivity
 585                     	xdef	_EXTI_SetTLISensitivity
 586                     	xdef	_EXTI_SetExtIntSensitivity
 587                     	xdef	_EXTI_DeInit
 606                     	end
