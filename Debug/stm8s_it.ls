   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
  46                     ; 54 @near @interrupt void NonHandledInterrupt(void)
  46                     ; 55 {
  48                     .text:	section	.text,new
  49  0000               _NonHandledInterrupt:
  53                     ; 59   return;
  56  0000 80            	iret
  79                     ; 72 @near @interrupt void TRAP_IRQHandler(void)
  79                     ; 73 {
  80                     .text:	section	.text,new
  81  0000               _TRAP_IRQHandler:
  85                     ; 77   return;
  88  0000 80            	iret
 111                     ; 90 @near @interrupt void TLI_IRQHandler (void)
 111                     ; 91 {
 112                     .text:	section	.text,new
 113  0000               _TLI_IRQHandler:
 117                     ; 95   return;
 120  0000 80            	iret
 143                     ; 108 @near @interrupt void AWU_IRQHandler (void)
 143                     ; 109 {
 144                     .text:	section	.text,new
 145  0000               _AWU_IRQHandler:
 149                     ; 113 	AWU->CSR = AWU->CSR;                        /* 清除更新中断标志位 */ 
 151  0000 5550f050f0    	mov	20720,20720
 152                     ; 114   return;
 155  0005 80            	iret
 178                     ; 127 @near @interrupt void CLK_IRQHandler (void)
 178                     ; 128 {
 179                     .text:	section	.text,new
 180  0000               _CLK_IRQHandler:
 184                     ; 132   return;
 187  0000 80            	iret
 211                     ; 145 @near @interrupt void EXTI_PORTA_IRQHandler (void)
 211                     ; 146 {
 212                     .text:	section	.text,new
 213  0000               _EXTI_PORTA_IRQHandler:
 217                     ; 150   return;
 220  0000 80            	iret
 254                     ; 155 void IT_Delay(uint16_t Cnt)
 254                     ; 156 {
 255                     .text:	section	.text,new
 256  0000               _IT_Delay:
 258  0000 89            	pushw	x
 259       00000000      OFST:	set	0
 262  0001               L111:
 263                     ; 157   while(Cnt--);
 265  0001 1e01          	ldw	x,(OFST+1,sp)
 266  0003 1d0001        	subw	x,#1
 267  0006 1f01          	ldw	(OFST+1,sp),x
 268  0008 1c0001        	addw	x,#1
 269  000b a30000        	cpw	x,#0
 270  000e 26f1          	jrne	L111
 271                     ; 158 }
 274  0010 85            	popw	x
 275  0011 81            	ret
 299                     ; 170 @near @interrupt void EXTI_PORTB_IRQHandler (void)
 299                     ; 171 {
 300                     .text:	section	.text,new
 301  0000               _EXTI_PORTB_IRQHandler:
 305                     ; 211   return;
 308  0000 80            	iret
 332                     ; 224 @near @interrupt void EXTI_PORTC_IRQHandler (void)
 332                     ; 225 {
 333                     .text:	section	.text,new
 334  0000               _EXTI_PORTC_IRQHandler:
 338                     ; 229   return;
 341  0000 80            	iret
 365                     ; 242 @near @interrupt void EXTI_PORTD_IRQHandler (void)
 365                     ; 243 {
 366                     .text:	section	.text,new
 367  0000               _EXTI_PORTD_IRQHandler:
 371                     ; 247   return;
 374  0000 80            	iret
 398                     ; 260 @near @interrupt void EXTI_PORTE_IRQHandler (void)
 398                     ; 261 {
 399                     .text:	section	.text,new
 400  0000               _EXTI_PORTE_IRQHandler:
 404                     ; 265   return;
 407  0000 80            	iret
 430                     ; 335 @near @interrupt void SPI_IRQHandler (void)
 430                     ; 336 {
 431                     .text:	section	.text,new
 432  0000               _SPI_IRQHandler:
 436                     ; 340   return;
 439  0000 80            	iret
 463                     ; 353 @near @interrupt void TIM1_UPD_OVF_TRG_BRK_IRQHandler (void)
 463                     ; 354 {
 464                     .text:	section	.text,new
 465  0000               _TIM1_UPD_OVF_TRG_BRK_IRQHandler:
 469                     ; 358   return;
 472  0000 80            	iret
 496                     ; 371 @near @interrupt void TIM1_CAP_COM_IRQHandler (void)
 496                     ; 372 {
 497                     .text:	section	.text,new
 498  0000               _TIM1_CAP_COM_IRQHandler:
 502                     ; 376   return;
 505  0000 80            	iret
 529                     ; 426 @near @interrupt void TIM2_UPD_OVF_BRK_IRQHandler (void)
 529                     ; 427 {
 530                     .text:	section	.text,new
 531  0000               _TIM2_UPD_OVF_BRK_IRQHandler:
 535                     ; 431   return;
 538  0000 80            	iret
 562                     ; 444 @near @interrupt void TIM2_CAP_COM_IRQHandler (void)
 562                     ; 445 {
 563                     .text:	section	.text,new
 564  0000               _TIM2_CAP_COM_IRQHandler:
 568                     ; 449   return;
 571  0000 80            	iret
 595                     ; 502 @near @interrupt void UART1_TX_IRQHandler (void)
 595                     ; 503 {
 596                     .text:	section	.text,new
 597  0000               _UART1_TX_IRQHandler:
 601                     ; 504 return;
 604  0000 80            	iret
 628                     ; 517 @near @interrupt void UART1_RX_IRQHandler (void)
 628                     ; 518 {
 629                     .text:	section	.text,new
 630  0000               _UART1_RX_IRQHandler:
 634                     ; 522 }
 637  0000 80            	iret
 660                     ; 535 @near @interrupt void I2C_IRQHandler (void)
 660                     ; 536 {
 661                     .text:	section	.text,new
 662  0000               _I2C_IRQHandler:
 666                     ; 540   return;
 669  0000 80            	iret
 692                     ; 645 @near @interrupt void ADC1_IRQHandler (void)
 692                     ; 646 {
 693                     .text:	section	.text,new
 694  0000               _ADC1_IRQHandler:
 698                     ; 651     return;
 701  0000 80            	iret
 728                     ; 685 @near @interrupt void TIM4_UPD_OVF_IRQHandler (void)
 728                     ; 686 {
 729                     .text:	section	.text,new
 730  0000               _TIM4_UPD_OVF_IRQHandler:
 732  0000 3b0002        	push	c_x+2
 733  0003 be00          	ldw	x,c_x
 734  0005 89            	pushw	x
 735  0006 3b0002        	push	c_y+2
 736  0009 be00          	ldw	x,c_y
 737  000b 89            	pushw	x
 740                     ; 692 	TIM4_ClearITPendingBit(TIM4_IT_UPDATE);        //清除中断
 742  000c a601          	ld	a,#1
 743  000e cd0000        	call	_TIM4_ClearITPendingBit
 745                     ; 694 	offtime++;
 747  0011 ae0000        	ldw	x,#_offtime
 748  0014 a601          	ld	a,#1
 749  0016 cd0000        	call	c_lgadc
 751                     ; 695 	nowtime++;
 753  0019 ae0000        	ldw	x,#_nowtime
 754  001c a601          	ld	a,#1
 755  001e cd0000        	call	c_lgadc
 757                     ; 696   return;
 760  0021 85            	popw	x
 761  0022 bf00          	ldw	c_y,x
 762  0024 320002        	pop	c_y+2
 763  0027 85            	popw	x
 764  0028 bf00          	ldw	c_x,x
 765  002a 320002        	pop	c_x+2
 766  002d 80            	iret
 790                     ; 710 @near @interrupt void EEPROM_EEC_IRQHandler (void)
 790                     ; 711 {
 791                     .text:	section	.text,new
 792  0000               _EEPROM_EEC_IRQHandler:
 796                     ; 715   return;
 799  0000 80            	iret
 812                     	xdef	_IT_Delay
 813                     	xref.b	_offtime
 814                     	xref.b	_nowtime
 815                     	xref	_TIM4_ClearITPendingBit
 816                     	xdef	_EEPROM_EEC_IRQHandler
 817                     	xdef	_TIM4_UPD_OVF_IRQHandler
 818                     	xdef	_ADC1_IRQHandler
 819                     	xdef	_I2C_IRQHandler
 820                     	xdef	_UART1_RX_IRQHandler
 821                     	xdef	_UART1_TX_IRQHandler
 822                     	xdef	_TIM2_CAP_COM_IRQHandler
 823                     	xdef	_TIM2_UPD_OVF_BRK_IRQHandler
 824                     	xdef	_TIM1_UPD_OVF_TRG_BRK_IRQHandler
 825                     	xdef	_TIM1_CAP_COM_IRQHandler
 826                     	xdef	_SPI_IRQHandler
 827                     	xdef	_EXTI_PORTE_IRQHandler
 828                     	xdef	_EXTI_PORTD_IRQHandler
 829                     	xdef	_EXTI_PORTC_IRQHandler
 830                     	xdef	_EXTI_PORTB_IRQHandler
 831                     	xdef	_EXTI_PORTA_IRQHandler
 832                     	xdef	_CLK_IRQHandler
 833                     	xdef	_AWU_IRQHandler
 834                     	xdef	_TLI_IRQHandler
 835                     	xdef	_TRAP_IRQHandler
 836                     	xdef	_NonHandledInterrupt
 837                     	xref.b	c_x
 838                     	xref.b	c_y
 857                     	xref	c_lgadc
 858                     	end
