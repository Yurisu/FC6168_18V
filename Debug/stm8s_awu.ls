   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
  17                     .const:	section	.text
  18  0000               _APR_Array:
  19  0000 00            	dc.b	0
  20  0001 1e            	dc.b	30
  21  0002 1e            	dc.b	30
  22  0003 1e            	dc.b	30
  23  0004 1e            	dc.b	30
  24  0005 1e            	dc.b	30
  25  0006 1e            	dc.b	30
  26  0007 1e            	dc.b	30
  27  0008 1e            	dc.b	30
  28  0009 1e            	dc.b	30
  29  000a 1e            	dc.b	30
  30  000b 1e            	dc.b	30
  31  000c 1e            	dc.b	30
  32  000d 3d            	dc.b	61
  33  000e 17            	dc.b	23
  34  000f 17            	dc.b	23
  35  0010 3e            	dc.b	62
  36  0011               _TBR_Array:
  37  0011 00            	dc.b	0
  38  0012 01            	dc.b	1
  39  0013 02            	dc.b	2
  40  0014 03            	dc.b	3
  41  0015 04            	dc.b	4
  42  0016 05            	dc.b	5
  43  0017 06            	dc.b	6
  44  0018 07            	dc.b	7
  45  0019 08            	dc.b	8
  46  001a 09            	dc.b	9
  47  001b 0a            	dc.b	10
  48  001c 0b            	dc.b	11
  49  001d 0c            	dc.b	12
  50  001e 0c            	dc.b	12
  51  001f 0e            	dc.b	14
  52  0020 0f            	dc.b	15
  53  0021 0f            	dc.b	15
  82                     ; 73 void AWU_DeInit(void)
  82                     ; 74 {
  84                     .text:	section	.text,new
  85  0000               _AWU_DeInit:
  89                     ; 75   AWU->CSR = AWU_CSR_RESET_VALUE;
  91  0000 725f50f0      	clr	20720
  92                     ; 76   AWU->APR = AWU_APR_RESET_VALUE;
  94  0004 353f50f1      	mov	20721,#63
  95                     ; 77   AWU->TBR = AWU_TBR_RESET_VALUE;
  97  0008 725f50f2      	clr	20722
  98                     ; 78 }
 101  000c 81            	ret
 263                     ; 88 void AWU_Init(AWU_Timebase_TypeDef AWU_TimeBase)
 263                     ; 89 {
 264                     .text:	section	.text,new
 265  0000               _AWU_Init:
 267  0000 88            	push	a
 268       00000000      OFST:	set	0
 271                     ; 91   assert_param(IS_AWU_TIMEBASE_OK(AWU_TimeBase));
 273                     ; 94   AWU->CSR |= AWU_CSR_AWUEN;
 275  0001 721850f0      	bset	20720,#4
 276                     ; 97   AWU->TBR &= (uint8_t)(~AWU_TBR_AWUTB);
 278  0005 c650f2        	ld	a,20722
 279  0008 a4f0          	and	a,#240
 280  000a c750f2        	ld	20722,a
 281                     ; 98   AWU->TBR |= TBR_Array[(uint8_t)AWU_TimeBase];
 283  000d 7b01          	ld	a,(OFST+1,sp)
 284  000f 5f            	clrw	x
 285  0010 97            	ld	xl,a
 286  0011 c650f2        	ld	a,20722
 287  0014 da0011        	or	a,(_TBR_Array,x)
 288  0017 c750f2        	ld	20722,a
 289                     ; 101   AWU->APR &= (uint8_t)(~AWU_APR_APR);
 291  001a c650f1        	ld	a,20721
 292  001d a4c0          	and	a,#192
 293  001f c750f1        	ld	20721,a
 294                     ; 102   AWU->APR |= APR_Array[(uint8_t)AWU_TimeBase];
 296  0022 7b01          	ld	a,(OFST+1,sp)
 297  0024 5f            	clrw	x
 298  0025 97            	ld	xl,a
 299  0026 c650f1        	ld	a,20721
 300  0029 da0000        	or	a,(_APR_Array,x)
 301  002c c750f1        	ld	20721,a
 302                     ; 103 }
 305  002f 84            	pop	a
 306  0030 81            	ret
 361                     ; 112 void AWU_Cmd(FunctionalState NewState)
 361                     ; 113 {
 362                     .text:	section	.text,new
 363  0000               _AWU_Cmd:
 367                     ; 114   if (NewState != DISABLE)
 369  0000 4d            	tnz	a
 370  0001 2706          	jreq	L331
 371                     ; 117     AWU->CSR |= AWU_CSR_AWUEN;
 373  0003 721850f0      	bset	20720,#4
 375  0007 2004          	jra	L531
 376  0009               L331:
 377                     ; 122     AWU->CSR &= (uint8_t)(~AWU_CSR_AWUEN);
 379  0009 721950f0      	bres	20720,#4
 380  000d               L531:
 381                     ; 124 }
 384  000d 81            	ret
 437                     	switch	.const
 438  0022               L41:
 439  0022 000003e8      	dc.l	1000
 440                     ; 139 void AWU_LSICalibrationConfig(uint32_t LSIFreqHz)
 440                     ; 140 {
 441                     .text:	section	.text,new
 442  0000               _AWU_LSICalibrationConfig:
 444  0000 5206          	subw	sp,#6
 445       00000006      OFST:	set	6
 448                     ; 141   uint16_t lsifreqkhz = 0x0;
 450                     ; 142   uint16_t A = 0x0;
 452                     ; 145   assert_param(IS_LSI_FREQUENCY_OK(LSIFreqHz));
 454                     ; 147   lsifreqkhz = (uint16_t)(LSIFreqHz / 1000); /* Converts value in kHz */
 456  0002 96            	ldw	x,sp
 457  0003 1c0009        	addw	x,#OFST+3
 458  0006 cd0000        	call	c_ltor
 460  0009 ae0022        	ldw	x,#L41
 461  000c cd0000        	call	c_ludv
 463  000f be02          	ldw	x,c_lreg+2
 464  0011 1f03          	ldw	(OFST-3,sp),x
 465                     ; 151   A = (uint16_t)(lsifreqkhz >> 2U); /* Division by 4, keep integer part only */
 467  0013 1e03          	ldw	x,(OFST-3,sp)
 468  0015 54            	srlw	x
 469  0016 54            	srlw	x
 470  0017 1f05          	ldw	(OFST-1,sp),x
 471                     ; 153   if ((4U * A) >= ((lsifreqkhz - (4U * A)) * (1U + (2U * A))))
 473  0019 1e05          	ldw	x,(OFST-1,sp)
 474  001b 58            	sllw	x
 475  001c 58            	sllw	x
 476  001d 1f01          	ldw	(OFST-5,sp),x
 477  001f 1e03          	ldw	x,(OFST-3,sp)
 478  0021 72f001        	subw	x,(OFST-5,sp)
 479  0024 1605          	ldw	y,(OFST-1,sp)
 480  0026 9058          	sllw	y
 481  0028 905c          	incw	y
 482  002a cd0000        	call	c_imul
 484  002d 1605          	ldw	y,(OFST-1,sp)
 485  002f 9058          	sllw	y
 486  0031 9058          	sllw	y
 487  0033 bf00          	ldw	c_x,x
 488  0035 90b300        	cpw	y,c_x
 489  0038 2509          	jrult	L561
 490                     ; 155     AWU->APR = (uint8_t)(A - 2U);
 492  003a 7b06          	ld	a,(OFST+0,sp)
 493  003c a002          	sub	a,#2
 494  003e c750f1        	ld	20721,a
 496  0041 2006          	jra	L761
 497  0043               L561:
 498                     ; 159     AWU->APR = (uint8_t)(A - 1U);
 500  0043 7b06          	ld	a,(OFST+0,sp)
 501  0045 4a            	dec	a
 502  0046 c750f1        	ld	20721,a
 503  0049               L761:
 504                     ; 161 }
 507  0049 5b06          	addw	sp,#6
 508  004b 81            	ret
 531                     ; 168 void AWU_IdleModeEnable(void)
 531                     ; 169 {
 532                     .text:	section	.text,new
 533  0000               _AWU_IdleModeEnable:
 537                     ; 171   AWU->CSR &= (uint8_t)(~AWU_CSR_AWUEN);
 539  0000 721950f0      	bres	20720,#4
 540                     ; 174   AWU->TBR = (uint8_t)(~AWU_TBR_AWUTB);
 542  0004 35f050f2      	mov	20722,#240
 543                     ; 175 }
 546  0008 81            	ret
 590                     ; 183 FlagStatus AWU_GetFlagStatus(void)
 590                     ; 184 {
 591                     .text:	section	.text,new
 592  0000               _AWU_GetFlagStatus:
 596                     ; 185   return((FlagStatus)(((uint8_t)(AWU->CSR & AWU_CSR_AWUF) == (uint8_t)0x00) ? RESET : SET));
 598  0000 c650f0        	ld	a,20720
 599  0003 a520          	bcp	a,#32
 600  0005 2603          	jrne	L22
 601  0007 4f            	clr	a
 602  0008 2002          	jra	L42
 603  000a               L22:
 604  000a a601          	ld	a,#1
 605  000c               L42:
 608  000c 81            	ret
 643                     	xdef	_TBR_Array
 644                     	xdef	_APR_Array
 645                     	xdef	_AWU_GetFlagStatus
 646                     	xdef	_AWU_IdleModeEnable
 647                     	xdef	_AWU_LSICalibrationConfig
 648                     	xdef	_AWU_Cmd
 649                     	xdef	_AWU_Init
 650                     	xdef	_AWU_DeInit
 651                     	xref.b	c_lreg
 652                     	xref.b	c_x
 671                     	xref	c_imul
 672                     	xref	c_ludv
 673                     	xref	c_ltor
 674                     	end
