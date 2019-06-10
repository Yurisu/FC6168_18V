   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
  88                     ; 26 uint32_t AWU_LSIMeasurement(void)
  88                     ; 27 {
  90                     .text:	section	.text,new
  91  0000               _AWU_LSIMeasurement:
  93  0000 520c          	subw	sp,#12
  94       0000000c      OFST:	set	12
  97                     ; 28   uint32_t lsi_freq_hz = 0x0;
  99                     ; 29   uint32_t fmaster = 0x0;
 101                     ; 30   uint16_t ICValue1 = 0x0;
 103                     ; 31   uint16_t ICValue2 = 0x0;
 105                     ; 34   fmaster = CLK_GetClockFreq();
 107  0002 cd0000        	call	_CLK_GetClockFreq
 109  0005 96            	ldw	x,sp
 110  0006 1c0009        	addw	x,#OFST-3
 111  0009 cd0000        	call	c_rtol
 113                     ; 37   AWU->CSR |= AWU_CSR_MSR;
 115  000c 721050f0      	bset	20720,#0
 116                     ; 44 	TIM1_ICInit(TIM1_CHANNEL_1, TIM1_ICPOLARITY_RISING, TIM1_ICSELECTION_DIRECTTI, TIM1_ICPSC_DIV8, 0);
 118  0010 4b00          	push	#0
 119  0012 4b0c          	push	#12
 120  0014 4b01          	push	#1
 121  0016 5f            	clrw	x
 122  0017 4f            	clr	a
 123  0018 95            	ld	xh,a
 124  0019 cd0000        	call	_TIM1_ICInit
 126  001c 5b03          	addw	sp,#3
 127                     ; 47   TIM1_Cmd(ENABLE);
 129  001e a601          	ld	a,#1
 130  0020 cd0000        	call	_TIM1_Cmd
 133  0023               L54:
 134                     ; 50   while((TIM1->SR1 & TIM1_FLAG_CC1) != TIM1_FLAG_CC1);
 136  0023 c65255        	ld	a,21077
 137  0026 a402          	and	a,#2
 138  0028 a102          	cp	a,#2
 139  002a 26f7          	jrne	L54
 140                     ; 52   ICValue1 = TIM1_GetCapture1();
 142  002c cd0000        	call	_TIM1_GetCapture1
 144  002f 1f05          	ldw	(OFST-7,sp),x
 145                     ; 53   TIM1_ClearFlag(TIM1_FLAG_CC1);
 147  0031 ae0002        	ldw	x,#2
 148  0034 cd0000        	call	_TIM1_ClearFlag
 151  0037               L35:
 152                     ; 56   while((TIM1->SR1 & TIM1_FLAG_CC1) != TIM1_FLAG_CC1);
 154  0037 c65255        	ld	a,21077
 155  003a a402          	and	a,#2
 156  003c a102          	cp	a,#2
 157  003e 26f7          	jrne	L35
 158                     ; 58   ICValue2 = TIM1_GetCapture1();
 160  0040 cd0000        	call	_TIM1_GetCapture1
 162  0043 1f07          	ldw	(OFST-5,sp),x
 163                     ; 59   TIM1_ClearFlag(TIM1_FLAG_CC1);
 165  0045 ae0002        	ldw	x,#2
 166  0048 cd0000        	call	_TIM1_ClearFlag
 168                     ; 62   TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
 170  004b 7211525c      	bres	21084,#0
 171                     ; 64   TIM1_Cmd(DISABLE);
 173  004f 4f            	clr	a
 174  0050 cd0000        	call	_TIM1_Cmd
 176                     ; 95   lsi_freq_hz = (8 * fmaster) / (ICValue2 - ICValue1);
 178  0053 1e07          	ldw	x,(OFST-5,sp)
 179  0055 72f005        	subw	x,(OFST-7,sp)
 180  0058 cd0000        	call	c_uitolx
 182  005b 96            	ldw	x,sp
 183  005c 1c0001        	addw	x,#OFST-11
 184  005f cd0000        	call	c_rtol
 186  0062 96            	ldw	x,sp
 187  0063 1c0009        	addw	x,#OFST-3
 188  0066 cd0000        	call	c_ltor
 190  0069 a603          	ld	a,#3
 191  006b cd0000        	call	c_llsh
 193  006e 96            	ldw	x,sp
 194  006f 1c0001        	addw	x,#OFST-11
 195  0072 cd0000        	call	c_ludv
 197  0075 96            	ldw	x,sp
 198  0076 1c0009        	addw	x,#OFST-3
 199  0079 cd0000        	call	c_rtol
 201                     ; 98   AWU->CSR &= (uint8_t)(~AWU_CSR_MSR);
 203  007c 721150f0      	bres	20720,#0
 204                     ; 100  return (lsi_freq_hz);
 206  0080 96            	ldw	x,sp
 207  0081 1c0009        	addw	x,#OFST-3
 208  0084 cd0000        	call	c_ltor
 212  0087 5b0c          	addw	sp,#12
 213  0089 81            	ret
 226                     	xdef	_AWU_LSIMeasurement
 227                     	xref	_TIM1_ClearFlag
 228                     	xref	_TIM1_GetCapture1
 229                     	xref	_TIM1_Cmd
 230                     	xref	_TIM1_ICInit
 231                     	xref	_CLK_GetClockFreq
 232                     	xref.b	c_x
 251                     	xref	c_ludv
 252                     	xref	c_uitolx
 253                     	xref	c_llsh
 254                     	xref	c_ltor
 255                     	xref	c_rtol
 256                     	end
