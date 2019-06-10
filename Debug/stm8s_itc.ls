   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
  45                     ; 50 uint8_t ITC_GetCPUCC(void)
  45                     ; 51 {
  47                     .text:	section	.text,new
  48  0000               _ITC_GetCPUCC:
  52                     ; 53   _asm("push cc");
  55  0000 8a            push cc
  57                     ; 54   _asm("pop a");
  60  0001 84            pop a
  62                     ; 55   return; /* Ignore compiler warning, the returned value is in A register */
  65  0002 81            	ret
  88                     ; 80 void ITC_DeInit(void)
  88                     ; 81 {
  89                     .text:	section	.text,new
  90  0000               _ITC_DeInit:
  94                     ; 82   ITC->ISPR1 = ITC_SPRX_RESET_VALUE;
  96  0000 35ff7f70      	mov	32624,#255
  97                     ; 83   ITC->ISPR2 = ITC_SPRX_RESET_VALUE;
  99  0004 35ff7f71      	mov	32625,#255
 100                     ; 84   ITC->ISPR3 = ITC_SPRX_RESET_VALUE;
 102  0008 35ff7f72      	mov	32626,#255
 103                     ; 85   ITC->ISPR4 = ITC_SPRX_RESET_VALUE;
 105  000c 35ff7f73      	mov	32627,#255
 106                     ; 86   ITC->ISPR5 = ITC_SPRX_RESET_VALUE;
 108  0010 35ff7f74      	mov	32628,#255
 109                     ; 87   ITC->ISPR6 = ITC_SPRX_RESET_VALUE;
 111  0014 35ff7f75      	mov	32629,#255
 112                     ; 88   ITC->ISPR7 = ITC_SPRX_RESET_VALUE;
 114  0018 35ff7f76      	mov	32630,#255
 115                     ; 89   ITC->ISPR8 = ITC_SPRX_RESET_VALUE;
 117  001c 35ff7f77      	mov	32631,#255
 118                     ; 90 }
 121  0020 81            	ret
 146                     ; 97 uint8_t ITC_GetSoftIntStatus(void)
 146                     ; 98 {
 147                     .text:	section	.text,new
 148  0000               _ITC_GetSoftIntStatus:
 152                     ; 99   return (uint8_t)(ITC_GetCPUCC() & CPU_CC_I1I0);
 154  0000 cd0000        	call	_ITC_GetCPUCC
 156  0003 a428          	and	a,#40
 159  0005 81            	ret
 408                     .const:	section	.text
 409  0000               L22:
 410  0000 0023          	dc.w	L14
 411  0002 0023          	dc.w	L14
 412  0004 0023          	dc.w	L14
 413  0006 0023          	dc.w	L14
 414  0008 002c          	dc.w	L34
 415  000a 002c          	dc.w	L34
 416  000c 002c          	dc.w	L34
 417  000e 002c          	dc.w	L34
 418  0010 0060          	dc.w	L302
 419  0012 0060          	dc.w	L302
 420  0014 0035          	dc.w	L54
 421  0016 0035          	dc.w	L54
 422  0018 003e          	dc.w	L74
 423  001a 003e          	dc.w	L74
 424  001c 003e          	dc.w	L74
 425  001e 003e          	dc.w	L74
 426  0020 0047          	dc.w	L15
 427  0022 0047          	dc.w	L15
 428  0024 0047          	dc.w	L15
 429  0026 0047          	dc.w	L15
 430  0028 0060          	dc.w	L302
 431  002a 0060          	dc.w	L302
 432  002c 0050          	dc.w	L35
 433  002e 0050          	dc.w	L35
 434  0030 0059          	dc.w	L55
 435                     ; 107 ITC_PriorityLevel_TypeDef ITC_GetSoftwarePriority(ITC_Irq_TypeDef IrqNum)
 435                     ; 108 {
 436                     .text:	section	.text,new
 437  0000               _ITC_GetSoftwarePriority:
 439  0000 88            	push	a
 440  0001 89            	pushw	x
 441       00000002      OFST:	set	2
 444                     ; 109   uint8_t Value = 0;
 446  0002 0f02          	clr	(OFST+0,sp)
 447                     ; 110   uint8_t Mask = 0;
 449                     ; 113   assert_param(IS_ITC_IRQ_OK((uint8_t)IrqNum));
 451                     ; 116   Mask = (uint8_t)(0x03U << (((uint8_t)IrqNum % 4U) * 2U));
 453  0004 a403          	and	a,#3
 454  0006 48            	sll	a
 455  0007 5f            	clrw	x
 456  0008 97            	ld	xl,a
 457  0009 a603          	ld	a,#3
 458  000b 5d            	tnzw	x
 459  000c 2704          	jreq	L41
 460  000e               L61:
 461  000e 48            	sll	a
 462  000f 5a            	decw	x
 463  0010 26fc          	jrne	L61
 464  0012               L41:
 465  0012 6b01          	ld	(OFST-1,sp),a
 466                     ; 118   switch (IrqNum)
 468  0014 7b03          	ld	a,(OFST+1,sp)
 470                     ; 198   default:
 470                     ; 199     break;
 471  0016 a119          	cp	a,#25
 472  0018 2407          	jruge	L02
 473  001a 5f            	clrw	x
 474  001b 97            	ld	xl,a
 475  001c 58            	sllw	x
 476  001d de0000        	ldw	x,(L22,x)
 477  0020 fc            	jp	(x)
 478  0021               L02:
 479  0021 203d          	jra	L302
 480  0023               L14:
 481                     ; 120   case ITC_IRQ_TLI: /* TLI software priority can be read but has no meaning */
 481                     ; 121   case ITC_IRQ_AWU:
 481                     ; 122   case ITC_IRQ_CLK:
 481                     ; 123   case ITC_IRQ_PORTA:
 481                     ; 124     Value = (uint8_t)(ITC->ISPR1 & Mask); /* Read software priority */
 483  0023 c67f70        	ld	a,32624
 484  0026 1401          	and	a,(OFST-1,sp)
 485  0028 6b02          	ld	(OFST+0,sp),a
 486                     ; 125     break;
 488  002a 2034          	jra	L302
 489  002c               L34:
 490                     ; 127   case ITC_IRQ_PORTB:
 490                     ; 128   case ITC_IRQ_PORTC:
 490                     ; 129   case ITC_IRQ_PORTD:
 490                     ; 130   case ITC_IRQ_PORTE:
 490                     ; 131     Value = (uint8_t)(ITC->ISPR2 & Mask); /* Read software priority */
 492  002c c67f71        	ld	a,32625
 493  002f 1401          	and	a,(OFST-1,sp)
 494  0031 6b02          	ld	(OFST+0,sp),a
 495                     ; 132     break;
 497  0033 202b          	jra	L302
 498  0035               L54:
 499                     ; 141   case ITC_IRQ_SPI:
 499                     ; 142   case ITC_IRQ_TIM1_OVF:
 499                     ; 143     Value = (uint8_t)(ITC->ISPR3 & Mask); /* Read software priority */
 501  0035 c67f72        	ld	a,32626
 502  0038 1401          	and	a,(OFST-1,sp)
 503  003a 6b02          	ld	(OFST+0,sp),a
 504                     ; 144     break;
 506  003c 2022          	jra	L302
 507  003e               L74:
 508                     ; 146   case ITC_IRQ_TIM1_CAPCOM:
 508                     ; 147 #if defined (STM8S903) || defined (STM8AF622x)
 508                     ; 148   case ITC_IRQ_TIM5_OVFTRI:
 508                     ; 149   case ITC_IRQ_TIM5_CAPCOM:
 508                     ; 150 #else
 508                     ; 151   case ITC_IRQ_TIM2_OVF:
 508                     ; 152   case ITC_IRQ_TIM2_CAPCOM:
 508                     ; 153 #endif /* STM8S903 or STM8AF622x*/
 508                     ; 154   case ITC_IRQ_TIM3_OVF:
 508                     ; 155     Value = (uint8_t)(ITC->ISPR4 & Mask); /* Read software priority */
 510  003e c67f73        	ld	a,32627
 511  0041 1401          	and	a,(OFST-1,sp)
 512  0043 6b02          	ld	(OFST+0,sp),a
 513                     ; 156     break;
 515  0045 2019          	jra	L302
 516  0047               L15:
 517                     ; 158   case ITC_IRQ_TIM3_CAPCOM:
 517                     ; 159 #if defined(STM8S208) ||defined(STM8S207) || defined (STM8S007) || defined(STM8S103) || \
 517                     ; 160     defined(STM8S003) ||defined(STM8S903) || defined (STM8AF52Ax) || defined (STM8AF62Ax)
 517                     ; 161   case ITC_IRQ_UART1_TX:
 517                     ; 162   case ITC_IRQ_UART1_RX:
 517                     ; 163 #endif /*STM8S208 or STM8S207 or STM8S007 or STM8S103 or STM8S003 or STM8S903 or STM8AF52Ax or STM8AF62Ax */ 
 517                     ; 164 #if defined(STM8AF622x)
 517                     ; 165   case ITC_IRQ_UART4_TX:
 517                     ; 166   case ITC_IRQ_UART4_RX:
 517                     ; 167 #endif /*STM8AF622x */
 517                     ; 168   case ITC_IRQ_I2C:
 517                     ; 169     Value = (uint8_t)(ITC->ISPR5 & Mask); /* Read software priority */
 519  0047 c67f74        	ld	a,32628
 520  004a 1401          	and	a,(OFST-1,sp)
 521  004c 6b02          	ld	(OFST+0,sp),a
 522                     ; 170     break;
 524  004e 2010          	jra	L302
 525  0050               L35:
 526                     ; 184   case ITC_IRQ_ADC1:
 526                     ; 185 #endif /*STM8S105, STM8S005, STM8S103 or STM8S003 or STM8S903 or STM8AF626x or STM8AF622x */
 526                     ; 186 #if defined (STM8S903) || defined (STM8AF622x)
 526                     ; 187   case ITC_IRQ_TIM6_OVFTRI:
 526                     ; 188 #else
 526                     ; 189   case ITC_IRQ_TIM4_OVF:
 526                     ; 190 #endif /*STM8S903 or STM8AF622x */
 526                     ; 191     Value = (uint8_t)(ITC->ISPR6 & Mask); /* Read software priority */
 528  0050 c67f75        	ld	a,32629
 529  0053 1401          	and	a,(OFST-1,sp)
 530  0055 6b02          	ld	(OFST+0,sp),a
 531                     ; 192     break;
 533  0057 2007          	jra	L302
 534  0059               L55:
 535                     ; 194   case ITC_IRQ_EEPROM_EEC:
 535                     ; 195     Value = (uint8_t)(ITC->ISPR7 & Mask); /* Read software priority */
 537  0059 c67f76        	ld	a,32630
 538  005c 1401          	and	a,(OFST-1,sp)
 539  005e 6b02          	ld	(OFST+0,sp),a
 540                     ; 196     break;
 542  0060               L75:
 543                     ; 198   default:
 543                     ; 199     break;
 545  0060               L302:
 546                     ; 202   Value >>= (uint8_t)(((uint8_t)IrqNum % 4u) * 2u);
 548  0060 7b03          	ld	a,(OFST+1,sp)
 549  0062 a403          	and	a,#3
 550  0064 48            	sll	a
 551  0065 5f            	clrw	x
 552  0066 97            	ld	xl,a
 553  0067 7b02          	ld	a,(OFST+0,sp)
 554  0069 5d            	tnzw	x
 555  006a 2704          	jreq	L42
 556  006c               L62:
 557  006c 44            	srl	a
 558  006d 5a            	decw	x
 559  006e 26fc          	jrne	L62
 560  0070               L42:
 561  0070 6b02          	ld	(OFST+0,sp),a
 562                     ; 204   return((ITC_PriorityLevel_TypeDef)Value);
 564  0072 7b02          	ld	a,(OFST+0,sp)
 567  0074 5b03          	addw	sp,#3
 568  0076 81            	ret
 632                     	switch	.const
 633  0032               L44:
 634  0032 0035          	dc.w	L502
 635  0034 0035          	dc.w	L502
 636  0036 0035          	dc.w	L502
 637  0038 0035          	dc.w	L502
 638  003a 0047          	dc.w	L702
 639  003c 0047          	dc.w	L702
 640  003e 0047          	dc.w	L702
 641  0040 0047          	dc.w	L702
 642  0042 00b1          	dc.w	L162
 643  0044 00b1          	dc.w	L162
 644  0046 0059          	dc.w	L112
 645  0048 0059          	dc.w	L112
 646  004a 006b          	dc.w	L312
 647  004c 006b          	dc.w	L312
 648  004e 006b          	dc.w	L312
 649  0050 006b          	dc.w	L312
 650  0052 007d          	dc.w	L512
 651  0054 007d          	dc.w	L512
 652  0056 007d          	dc.w	L512
 653  0058 007d          	dc.w	L512
 654  005a 00b1          	dc.w	L162
 655  005c 00b1          	dc.w	L162
 656  005e 008f          	dc.w	L712
 657  0060 008f          	dc.w	L712
 658  0062 00a1          	dc.w	L122
 659                     ; 220 void ITC_SetSoftwarePriority(ITC_Irq_TypeDef IrqNum, ITC_PriorityLevel_TypeDef PriorityValue)
 659                     ; 221 {
 660                     .text:	section	.text,new
 661  0000               _ITC_SetSoftwarePriority:
 663  0000 89            	pushw	x
 664  0001 89            	pushw	x
 665       00000002      OFST:	set	2
 668                     ; 222   uint8_t Mask = 0;
 670                     ; 223   uint8_t NewPriority = 0;
 672                     ; 226   assert_param(IS_ITC_IRQ_OK((uint8_t)IrqNum));
 674                     ; 227   assert_param(IS_ITC_PRIORITY_OK(PriorityValue));
 676                     ; 230   assert_param(IS_ITC_INTERRUPTS_DISABLED);
 678                     ; 234   Mask = (uint8_t)(~(uint8_t)(0x03U << (((uint8_t)IrqNum % 4U) * 2U)));
 680  0002 9e            	ld	a,xh
 681  0003 a403          	and	a,#3
 682  0005 48            	sll	a
 683  0006 5f            	clrw	x
 684  0007 97            	ld	xl,a
 685  0008 a603          	ld	a,#3
 686  000a 5d            	tnzw	x
 687  000b 2704          	jreq	L23
 688  000d               L43:
 689  000d 48            	sll	a
 690  000e 5a            	decw	x
 691  000f 26fc          	jrne	L43
 692  0011               L23:
 693  0011 43            	cpl	a
 694  0012 6b01          	ld	(OFST-1,sp),a
 695                     ; 237   NewPriority = (uint8_t)((uint8_t)(PriorityValue) << (((uint8_t)IrqNum % 4U) * 2U));
 697  0014 7b03          	ld	a,(OFST+1,sp)
 698  0016 a403          	and	a,#3
 699  0018 48            	sll	a
 700  0019 5f            	clrw	x
 701  001a 97            	ld	xl,a
 702  001b 7b04          	ld	a,(OFST+2,sp)
 703  001d 5d            	tnzw	x
 704  001e 2704          	jreq	L63
 705  0020               L04:
 706  0020 48            	sll	a
 707  0021 5a            	decw	x
 708  0022 26fc          	jrne	L04
 709  0024               L63:
 710  0024 6b02          	ld	(OFST+0,sp),a
 711                     ; 239   switch (IrqNum)
 713  0026 7b03          	ld	a,(OFST+1,sp)
 715                     ; 329   default:
 715                     ; 330     break;
 716  0028 a119          	cp	a,#25
 717  002a 2407          	jruge	L24
 718  002c 5f            	clrw	x
 719  002d 97            	ld	xl,a
 720  002e 58            	sllw	x
 721  002f de0032        	ldw	x,(L44,x)
 722  0032 fc            	jp	(x)
 723  0033               L24:
 724  0033 207c          	jra	L162
 725  0035               L502:
 726                     ; 241   case ITC_IRQ_TLI: /* TLI software priority can be written but has no meaning */
 726                     ; 242   case ITC_IRQ_AWU:
 726                     ; 243   case ITC_IRQ_CLK:
 726                     ; 244   case ITC_IRQ_PORTA:
 726                     ; 245     ITC->ISPR1 &= Mask;
 728  0035 c67f70        	ld	a,32624
 729  0038 1401          	and	a,(OFST-1,sp)
 730  003a c77f70        	ld	32624,a
 731                     ; 246     ITC->ISPR1 |= NewPriority;
 733  003d c67f70        	ld	a,32624
 734  0040 1a02          	or	a,(OFST+0,sp)
 735  0042 c77f70        	ld	32624,a
 736                     ; 247     break;
 738  0045 206a          	jra	L162
 739  0047               L702:
 740                     ; 249   case ITC_IRQ_PORTB:
 740                     ; 250   case ITC_IRQ_PORTC:
 740                     ; 251   case ITC_IRQ_PORTD:
 740                     ; 252   case ITC_IRQ_PORTE:
 740                     ; 253     ITC->ISPR2 &= Mask;
 742  0047 c67f71        	ld	a,32625
 743  004a 1401          	and	a,(OFST-1,sp)
 744  004c c77f71        	ld	32625,a
 745                     ; 254     ITC->ISPR2 |= NewPriority;
 747  004f c67f71        	ld	a,32625
 748  0052 1a02          	or	a,(OFST+0,sp)
 749  0054 c77f71        	ld	32625,a
 750                     ; 255     break;
 752  0057 2058          	jra	L162
 753  0059               L112:
 754                     ; 264   case ITC_IRQ_SPI:
 754                     ; 265   case ITC_IRQ_TIM1_OVF:
 754                     ; 266     ITC->ISPR3 &= Mask;
 756  0059 c67f72        	ld	a,32626
 757  005c 1401          	and	a,(OFST-1,sp)
 758  005e c77f72        	ld	32626,a
 759                     ; 267     ITC->ISPR3 |= NewPriority;
 761  0061 c67f72        	ld	a,32626
 762  0064 1a02          	or	a,(OFST+0,sp)
 763  0066 c77f72        	ld	32626,a
 764                     ; 268     break;
 766  0069 2046          	jra	L162
 767  006b               L312:
 768                     ; 270   case ITC_IRQ_TIM1_CAPCOM:
 768                     ; 271 #if defined(STM8S903) || defined(STM8AF622x) 
 768                     ; 272   case ITC_IRQ_TIM5_OVFTRI:
 768                     ; 273   case ITC_IRQ_TIM5_CAPCOM:
 768                     ; 274 #else
 768                     ; 275   case ITC_IRQ_TIM2_OVF:
 768                     ; 276   case ITC_IRQ_TIM2_CAPCOM:
 768                     ; 277 #endif /*STM8S903 or STM8AF622x */
 768                     ; 278   case ITC_IRQ_TIM3_OVF:
 768                     ; 279     ITC->ISPR4 &= Mask;
 770  006b c67f73        	ld	a,32627
 771  006e 1401          	and	a,(OFST-1,sp)
 772  0070 c77f73        	ld	32627,a
 773                     ; 280     ITC->ISPR4 |= NewPriority;
 775  0073 c67f73        	ld	a,32627
 776  0076 1a02          	or	a,(OFST+0,sp)
 777  0078 c77f73        	ld	32627,a
 778                     ; 281     break;
 780  007b 2034          	jra	L162
 781  007d               L512:
 782                     ; 283   case ITC_IRQ_TIM3_CAPCOM:
 782                     ; 284 #if defined(STM8S208) ||defined(STM8S207) || defined (STM8S007) || defined(STM8S103) || \
 782                     ; 285     defined(STM8S003) ||defined(STM8S903) || defined (STM8AF52Ax) || defined (STM8AF62Ax)
 782                     ; 286   case ITC_IRQ_UART1_TX:
 782                     ; 287   case ITC_IRQ_UART1_RX:
 782                     ; 288 #endif /*STM8S208 or STM8S207 or STM8S007 or STM8S103 or STM8S003 or STM8S903 or STM8AF52Ax or STM8AF62Ax */ 
 782                     ; 289 #if defined(STM8AF622x)
 782                     ; 290   case ITC_IRQ_UART4_TX:
 782                     ; 291   case ITC_IRQ_UART4_RX:
 782                     ; 292 #endif /*STM8AF622x */
 782                     ; 293   case ITC_IRQ_I2C:
 782                     ; 294     ITC->ISPR5 &= Mask;
 784  007d c67f74        	ld	a,32628
 785  0080 1401          	and	a,(OFST-1,sp)
 786  0082 c77f74        	ld	32628,a
 787                     ; 295     ITC->ISPR5 |= NewPriority;
 789  0085 c67f74        	ld	a,32628
 790  0088 1a02          	or	a,(OFST+0,sp)
 791  008a c77f74        	ld	32628,a
 792                     ; 296     break;
 794  008d 2022          	jra	L162
 795  008f               L712:
 796                     ; 312   case ITC_IRQ_ADC1:
 796                     ; 313 #endif /*STM8S105, STM8S005, STM8S103 or STM8S003 or STM8S903 or STM8AF626x or STM8AF622x */
 796                     ; 314     
 796                     ; 315 #if defined (STM8S903) || defined (STM8AF622x)
 796                     ; 316   case ITC_IRQ_TIM6_OVFTRI:
 796                     ; 317 #else
 796                     ; 318   case ITC_IRQ_TIM4_OVF:
 796                     ; 319 #endif /* STM8S903 or STM8AF622x */
 796                     ; 320     ITC->ISPR6 &= Mask;
 798  008f c67f75        	ld	a,32629
 799  0092 1401          	and	a,(OFST-1,sp)
 800  0094 c77f75        	ld	32629,a
 801                     ; 321     ITC->ISPR6 |= NewPriority;
 803  0097 c67f75        	ld	a,32629
 804  009a 1a02          	or	a,(OFST+0,sp)
 805  009c c77f75        	ld	32629,a
 806                     ; 322     break;
 808  009f 2010          	jra	L162
 809  00a1               L122:
 810                     ; 324   case ITC_IRQ_EEPROM_EEC:
 810                     ; 325     ITC->ISPR7 &= Mask;
 812  00a1 c67f76        	ld	a,32630
 813  00a4 1401          	and	a,(OFST-1,sp)
 814  00a6 c77f76        	ld	32630,a
 815                     ; 326     ITC->ISPR7 |= NewPriority;
 817  00a9 c67f76        	ld	a,32630
 818  00ac 1a02          	or	a,(OFST+0,sp)
 819  00ae c77f76        	ld	32630,a
 820                     ; 327     break;
 822  00b1               L322:
 823                     ; 329   default:
 823                     ; 330     break;
 825  00b1               L162:
 826                     ; 332 }
 829  00b1 5b04          	addw	sp,#4
 830  00b3 81            	ret
 843                     	xdef	_ITC_GetSoftwarePriority
 844                     	xdef	_ITC_SetSoftwarePriority
 845                     	xdef	_ITC_GetSoftIntStatus
 846                     	xdef	_ITC_DeInit
 847                     	xdef	_ITC_GetCPUCC
 866                     	end
