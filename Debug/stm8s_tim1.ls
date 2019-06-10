   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
  45                     ; 58 void TIM1_DeInit(void)
  45                     ; 59 {
  47                     .text:	section	.text,new
  48  0000               _TIM1_DeInit:
  52                     ; 60   TIM1->CR1  = TIM1_CR1_RESET_VALUE;
  54  0000 725f5250      	clr	21072
  55                     ; 61   TIM1->CR2  = TIM1_CR2_RESET_VALUE;
  57  0004 725f5251      	clr	21073
  58                     ; 62   TIM1->SMCR = TIM1_SMCR_RESET_VALUE;
  60  0008 725f5252      	clr	21074
  61                     ; 63   TIM1->ETR  = TIM1_ETR_RESET_VALUE;
  63  000c 725f5253      	clr	21075
  64                     ; 64   TIM1->IER  = TIM1_IER_RESET_VALUE;
  66  0010 725f5254      	clr	21076
  67                     ; 65   TIM1->SR2  = TIM1_SR2_RESET_VALUE;
  69  0014 725f5256      	clr	21078
  70                     ; 67   TIM1->CCER1 = TIM1_CCER1_RESET_VALUE;
  72  0018 725f525c      	clr	21084
  73                     ; 68   TIM1->CCER2 = TIM1_CCER2_RESET_VALUE;
  75  001c 725f525d      	clr	21085
  76                     ; 70   TIM1->CCMR1 = 0x01;
  78  0020 35015258      	mov	21080,#1
  79                     ; 71   TIM1->CCMR2 = 0x01;
  81  0024 35015259      	mov	21081,#1
  82                     ; 72   TIM1->CCMR3 = 0x01;
  84  0028 3501525a      	mov	21082,#1
  85                     ; 73   TIM1->CCMR4 = 0x01;
  87  002c 3501525b      	mov	21083,#1
  88                     ; 75   TIM1->CCER1 = TIM1_CCER1_RESET_VALUE;
  90  0030 725f525c      	clr	21084
  91                     ; 76   TIM1->CCER2 = TIM1_CCER2_RESET_VALUE;
  93  0034 725f525d      	clr	21085
  94                     ; 77   TIM1->CCMR1 = TIM1_CCMR1_RESET_VALUE;
  96  0038 725f5258      	clr	21080
  97                     ; 78   TIM1->CCMR2 = TIM1_CCMR2_RESET_VALUE;
  99  003c 725f5259      	clr	21081
 100                     ; 79   TIM1->CCMR3 = TIM1_CCMR3_RESET_VALUE;
 102  0040 725f525a      	clr	21082
 103                     ; 80   TIM1->CCMR4 = TIM1_CCMR4_RESET_VALUE;
 105  0044 725f525b      	clr	21083
 106                     ; 81   TIM1->CNTRH = TIM1_CNTRH_RESET_VALUE;
 108  0048 725f525e      	clr	21086
 109                     ; 82   TIM1->CNTRL = TIM1_CNTRL_RESET_VALUE;
 111  004c 725f525f      	clr	21087
 112                     ; 83   TIM1->PSCRH = TIM1_PSCRH_RESET_VALUE;
 114  0050 725f5260      	clr	21088
 115                     ; 84   TIM1->PSCRL = TIM1_PSCRL_RESET_VALUE;
 117  0054 725f5261      	clr	21089
 118                     ; 85   TIM1->ARRH  = TIM1_ARRH_RESET_VALUE;
 120  0058 35ff5262      	mov	21090,#255
 121                     ; 86   TIM1->ARRL  = TIM1_ARRL_RESET_VALUE;
 123  005c 35ff5263      	mov	21091,#255
 124                     ; 87   TIM1->CCR1H = TIM1_CCR1H_RESET_VALUE;
 126  0060 725f5265      	clr	21093
 127                     ; 88   TIM1->CCR1L = TIM1_CCR1L_RESET_VALUE;
 129  0064 725f5266      	clr	21094
 130                     ; 89   TIM1->CCR2H = TIM1_CCR2H_RESET_VALUE;
 132  0068 725f5267      	clr	21095
 133                     ; 90   TIM1->CCR2L = TIM1_CCR2L_RESET_VALUE;
 135  006c 725f5268      	clr	21096
 136                     ; 91   TIM1->CCR3H = TIM1_CCR3H_RESET_VALUE;
 138  0070 725f5269      	clr	21097
 139                     ; 92   TIM1->CCR3L = TIM1_CCR3L_RESET_VALUE;
 141  0074 725f526a      	clr	21098
 142                     ; 93   TIM1->CCR4H = TIM1_CCR4H_RESET_VALUE;
 144  0078 725f526b      	clr	21099
 145                     ; 94   TIM1->CCR4L = TIM1_CCR4L_RESET_VALUE;
 147  007c 725f526c      	clr	21100
 148                     ; 95   TIM1->OISR  = TIM1_OISR_RESET_VALUE;
 150  0080 725f526f      	clr	21103
 151                     ; 96   TIM1->EGR   = 0x01; /* TIM1_EGR_UG */
 153  0084 35015257      	mov	21079,#1
 154                     ; 97   TIM1->DTR   = TIM1_DTR_RESET_VALUE;
 156  0088 725f526e      	clr	21102
 157                     ; 98   TIM1->BKR   = TIM1_BKR_RESET_VALUE;
 159  008c 725f526d      	clr	21101
 160                     ; 99   TIM1->RCR   = TIM1_RCR_RESET_VALUE;
 162  0090 725f5264      	clr	21092
 163                     ; 100   TIM1->SR1   = TIM1_SR1_RESET_VALUE;
 165  0094 725f5255      	clr	21077
 166                     ; 101 }
 169  0098 81            	ret
 278                     ; 111 void TIM1_TimeBaseInit(uint16_t TIM1_Prescaler,
 278                     ; 112                        TIM1_CounterMode_TypeDef TIM1_CounterMode,
 278                     ; 113                        uint16_t TIM1_Period,
 278                     ; 114                        uint8_t TIM1_RepetitionCounter)
 278                     ; 115 {
 279                     .text:	section	.text,new
 280  0000               _TIM1_TimeBaseInit:
 282  0000 89            	pushw	x
 283       00000000      OFST:	set	0
 286                     ; 117   assert_param(IS_TIM1_COUNTER_MODE_OK(TIM1_CounterMode));
 288                     ; 120   TIM1->ARRH = (uint8_t)(TIM1_Period >> 8);
 290  0001 7b06          	ld	a,(OFST+6,sp)
 291  0003 c75262        	ld	21090,a
 292                     ; 121   TIM1->ARRL = (uint8_t)(TIM1_Period);
 294  0006 7b07          	ld	a,(OFST+7,sp)
 295  0008 c75263        	ld	21091,a
 296                     ; 124   TIM1->PSCRH = (uint8_t)(TIM1_Prescaler >> 8);
 298  000b 9e            	ld	a,xh
 299  000c c75260        	ld	21088,a
 300                     ; 125   TIM1->PSCRL = (uint8_t)(TIM1_Prescaler);
 302  000f 9f            	ld	a,xl
 303  0010 c75261        	ld	21089,a
 304                     ; 128   TIM1->CR1 = (uint8_t)((uint8_t)(TIM1->CR1 & (uint8_t)(~(TIM1_CR1_CMS | TIM1_CR1_DIR)))
 304                     ; 129                         | (uint8_t)(TIM1_CounterMode));
 306  0013 c65250        	ld	a,21072
 307  0016 a48f          	and	a,#143
 308  0018 1a05          	or	a,(OFST+5,sp)
 309  001a c75250        	ld	21072,a
 310                     ; 132   TIM1->RCR = TIM1_RepetitionCounter;
 312  001d 7b08          	ld	a,(OFST+8,sp)
 313  001f c75264        	ld	21092,a
 314                     ; 133 }
 317  0022 85            	popw	x
 318  0023 81            	ret
 603                     ; 154 void TIM1_OC1Init(TIM1_OCMode_TypeDef TIM1_OCMode,
 603                     ; 155                   TIM1_OutputState_TypeDef TIM1_OutputState,
 603                     ; 156                   TIM1_OutputNState_TypeDef TIM1_OutputNState,
 603                     ; 157                   uint16_t TIM1_Pulse,
 603                     ; 158                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
 603                     ; 159                   TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity,
 603                     ; 160                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState,
 603                     ; 161                   TIM1_OCNIdleState_TypeDef TIM1_OCNIdleState)
 603                     ; 162 {
 604                     .text:	section	.text,new
 605  0000               _TIM1_OC1Init:
 607  0000 89            	pushw	x
 608  0001 5203          	subw	sp,#3
 609       00000003      OFST:	set	3
 612                     ; 164   assert_param(IS_TIM1_OC_MODE_OK(TIM1_OCMode));
 614                     ; 165   assert_param(IS_TIM1_OUTPUT_STATE_OK(TIM1_OutputState));
 616                     ; 166   assert_param(IS_TIM1_OUTPUTN_STATE_OK(TIM1_OutputNState));
 618                     ; 167   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
 620                     ; 168   assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
 622                     ; 169   assert_param(IS_TIM1_OCIDLE_STATE_OK(TIM1_OCIdleState));
 624                     ; 170   assert_param(IS_TIM1_OCNIDLE_STATE_OK(TIM1_OCNIdleState));
 626                     ; 174   TIM1->CCER1 &= (uint8_t)(~( TIM1_CCER1_CC1E | TIM1_CCER1_CC1NE 
 626                     ; 175                              | TIM1_CCER1_CC1P | TIM1_CCER1_CC1NP));
 628  0003 c6525c        	ld	a,21084
 629  0006 a4f0          	and	a,#240
 630  0008 c7525c        	ld	21084,a
 631                     ; 178   TIM1->CCER1 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER1_CC1E)
 631                     ; 179                                      | (uint8_t)(TIM1_OutputNState & TIM1_CCER1_CC1NE))
 631                     ; 180                            | (uint8_t)( (uint8_t)(TIM1_OCPolarity  & TIM1_CCER1_CC1P)
 631                     ; 181                                        | (uint8_t)(TIM1_OCNPolarity & TIM1_CCER1_CC1NP)));
 633  000b 7b0c          	ld	a,(OFST+9,sp)
 634  000d a408          	and	a,#8
 635  000f 6b03          	ld	(OFST+0,sp),a
 636  0011 7b0b          	ld	a,(OFST+8,sp)
 637  0013 a402          	and	a,#2
 638  0015 1a03          	or	a,(OFST+0,sp)
 639  0017 6b02          	ld	(OFST-1,sp),a
 640  0019 7b08          	ld	a,(OFST+5,sp)
 641  001b a404          	and	a,#4
 642  001d 6b01          	ld	(OFST-2,sp),a
 643  001f 9f            	ld	a,xl
 644  0020 a401          	and	a,#1
 645  0022 1a01          	or	a,(OFST-2,sp)
 646  0024 1a02          	or	a,(OFST-1,sp)
 647  0026 ca525c        	or	a,21084
 648  0029 c7525c        	ld	21084,a
 649                     ; 184   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_OCM)) | 
 649                     ; 185                           (uint8_t)TIM1_OCMode);
 651  002c c65258        	ld	a,21080
 652  002f a48f          	and	a,#143
 653  0031 1a04          	or	a,(OFST+1,sp)
 654  0033 c75258        	ld	21080,a
 655                     ; 188   TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS1 | TIM1_OISR_OIS1N));
 657  0036 c6526f        	ld	a,21103
 658  0039 a4fc          	and	a,#252
 659  003b c7526f        	ld	21103,a
 660                     ; 190   TIM1->OISR |= (uint8_t)((uint8_t)( TIM1_OCIdleState & TIM1_OISR_OIS1 ) | 
 660                     ; 191                           (uint8_t)( TIM1_OCNIdleState & TIM1_OISR_OIS1N ));
 662  003e 7b0e          	ld	a,(OFST+11,sp)
 663  0040 a402          	and	a,#2
 664  0042 6b03          	ld	(OFST+0,sp),a
 665  0044 7b0d          	ld	a,(OFST+10,sp)
 666  0046 a401          	and	a,#1
 667  0048 1a03          	or	a,(OFST+0,sp)
 668  004a ca526f        	or	a,21103
 669  004d c7526f        	ld	21103,a
 670                     ; 194   TIM1->CCR1H = (uint8_t)(TIM1_Pulse >> 8);
 672  0050 7b09          	ld	a,(OFST+6,sp)
 673  0052 c75265        	ld	21093,a
 674                     ; 195   TIM1->CCR1L = (uint8_t)(TIM1_Pulse);
 676  0055 7b0a          	ld	a,(OFST+7,sp)
 677  0057 c75266        	ld	21094,a
 678                     ; 196 }
 681  005a 5b05          	addw	sp,#5
 682  005c 81            	ret
 786                     ; 217 void TIM1_OC2Init(TIM1_OCMode_TypeDef TIM1_OCMode,
 786                     ; 218                   TIM1_OutputState_TypeDef TIM1_OutputState,
 786                     ; 219                   TIM1_OutputNState_TypeDef TIM1_OutputNState,
 786                     ; 220                   uint16_t TIM1_Pulse,
 786                     ; 221                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
 786                     ; 222                   TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity,
 786                     ; 223                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState,
 786                     ; 224                   TIM1_OCNIdleState_TypeDef TIM1_OCNIdleState)
 786                     ; 225 {
 787                     .text:	section	.text,new
 788  0000               _TIM1_OC2Init:
 790  0000 89            	pushw	x
 791  0001 5203          	subw	sp,#3
 792       00000003      OFST:	set	3
 795                     ; 227   assert_param(IS_TIM1_OC_MODE_OK(TIM1_OCMode));
 797                     ; 228   assert_param(IS_TIM1_OUTPUT_STATE_OK(TIM1_OutputState));
 799                     ; 229   assert_param(IS_TIM1_OUTPUTN_STATE_OK(TIM1_OutputNState));
 801                     ; 230   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
 803                     ; 231   assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
 805                     ; 232   assert_param(IS_TIM1_OCIDLE_STATE_OK(TIM1_OCIdleState));
 807                     ; 233   assert_param(IS_TIM1_OCNIDLE_STATE_OK(TIM1_OCNIdleState));
 809                     ; 237   TIM1->CCER1 &= (uint8_t)(~( TIM1_CCER1_CC2E | TIM1_CCER1_CC2NE | 
 809                     ; 238                              TIM1_CCER1_CC2P | TIM1_CCER1_CC2NP));
 811  0003 c6525c        	ld	a,21084
 812  0006 a40f          	and	a,#15
 813  0008 c7525c        	ld	21084,a
 814                     ; 242   TIM1->CCER1 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER1_CC2E  ) | 
 814                     ; 243                                      (uint8_t)(TIM1_OutputNState & TIM1_CCER1_CC2NE )) | 
 814                     ; 244                            (uint8_t)((uint8_t)(TIM1_OCPolarity  & TIM1_CCER1_CC2P  ) | 
 814                     ; 245                                      (uint8_t)(TIM1_OCNPolarity & TIM1_CCER1_CC2NP )));
 816  000b 7b0c          	ld	a,(OFST+9,sp)
 817  000d a480          	and	a,#128
 818  000f 6b03          	ld	(OFST+0,sp),a
 819  0011 7b0b          	ld	a,(OFST+8,sp)
 820  0013 a420          	and	a,#32
 821  0015 1a03          	or	a,(OFST+0,sp)
 822  0017 6b02          	ld	(OFST-1,sp),a
 823  0019 7b08          	ld	a,(OFST+5,sp)
 824  001b a440          	and	a,#64
 825  001d 6b01          	ld	(OFST-2,sp),a
 826  001f 9f            	ld	a,xl
 827  0020 a410          	and	a,#16
 828  0022 1a01          	or	a,(OFST-2,sp)
 829  0024 1a02          	or	a,(OFST-1,sp)
 830  0026 ca525c        	or	a,21084
 831  0029 c7525c        	ld	21084,a
 832                     ; 248   TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM)) | 
 832                     ; 249                           (uint8_t)TIM1_OCMode);
 834  002c c65259        	ld	a,21081
 835  002f a48f          	and	a,#143
 836  0031 1a04          	or	a,(OFST+1,sp)
 837  0033 c75259        	ld	21081,a
 838                     ; 252   TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS2 | TIM1_OISR_OIS2N));
 840  0036 c6526f        	ld	a,21103
 841  0039 a4f3          	and	a,#243
 842  003b c7526f        	ld	21103,a
 843                     ; 254   TIM1->OISR |= (uint8_t)((uint8_t)(TIM1_OISR_OIS2 & TIM1_OCIdleState) | 
 843                     ; 255                           (uint8_t)(TIM1_OISR_OIS2N & TIM1_OCNIdleState));
 845  003e 7b0e          	ld	a,(OFST+11,sp)
 846  0040 a408          	and	a,#8
 847  0042 6b03          	ld	(OFST+0,sp),a
 848  0044 7b0d          	ld	a,(OFST+10,sp)
 849  0046 a404          	and	a,#4
 850  0048 1a03          	or	a,(OFST+0,sp)
 851  004a ca526f        	or	a,21103
 852  004d c7526f        	ld	21103,a
 853                     ; 258   TIM1->CCR2H = (uint8_t)(TIM1_Pulse >> 8);
 855  0050 7b09          	ld	a,(OFST+6,sp)
 856  0052 c75267        	ld	21095,a
 857                     ; 259   TIM1->CCR2L = (uint8_t)(TIM1_Pulse);
 859  0055 7b0a          	ld	a,(OFST+7,sp)
 860  0057 c75268        	ld	21096,a
 861                     ; 260 }
 864  005a 5b05          	addw	sp,#5
 865  005c 81            	ret
 969                     ; 281 void TIM1_OC3Init(TIM1_OCMode_TypeDef TIM1_OCMode,
 969                     ; 282                   TIM1_OutputState_TypeDef TIM1_OutputState,
 969                     ; 283                   TIM1_OutputNState_TypeDef TIM1_OutputNState,
 969                     ; 284                   uint16_t TIM1_Pulse,
 969                     ; 285                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
 969                     ; 286                   TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity,
 969                     ; 287                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState,
 969                     ; 288                   TIM1_OCNIdleState_TypeDef TIM1_OCNIdleState)
 969                     ; 289 {
 970                     .text:	section	.text,new
 971  0000               _TIM1_OC3Init:
 973  0000 89            	pushw	x
 974  0001 5203          	subw	sp,#3
 975       00000003      OFST:	set	3
 978                     ; 291   assert_param(IS_TIM1_OC_MODE_OK(TIM1_OCMode));
 980                     ; 292   assert_param(IS_TIM1_OUTPUT_STATE_OK(TIM1_OutputState));
 982                     ; 293   assert_param(IS_TIM1_OUTPUTN_STATE_OK(TIM1_OutputNState));
 984                     ; 294   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
 986                     ; 295   assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
 988                     ; 296   assert_param(IS_TIM1_OCIDLE_STATE_OK(TIM1_OCIdleState));
 990                     ; 297   assert_param(IS_TIM1_OCNIDLE_STATE_OK(TIM1_OCNIdleState));
 992                     ; 301   TIM1->CCER2 &= (uint8_t)(~( TIM1_CCER2_CC3E | TIM1_CCER2_CC3NE | 
 992                     ; 302                              TIM1_CCER2_CC3P | TIM1_CCER2_CC3NP));
 994  0003 c6525d        	ld	a,21085
 995  0006 a4f0          	and	a,#240
 996  0008 c7525d        	ld	21085,a
 997                     ; 305   TIM1->CCER2 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState  & TIM1_CCER2_CC3E   ) |
 997                     ; 306                                      (uint8_t)(TIM1_OutputNState & TIM1_CCER2_CC3NE  )) | 
 997                     ; 307                            (uint8_t)((uint8_t)(TIM1_OCPolarity   & TIM1_CCER2_CC3P   ) | 
 997                     ; 308                                      (uint8_t)(TIM1_OCNPolarity  & TIM1_CCER2_CC3NP  )));
 999  000b 7b0c          	ld	a,(OFST+9,sp)
1000  000d a408          	and	a,#8
1001  000f 6b03          	ld	(OFST+0,sp),a
1002  0011 7b0b          	ld	a,(OFST+8,sp)
1003  0013 a402          	and	a,#2
1004  0015 1a03          	or	a,(OFST+0,sp)
1005  0017 6b02          	ld	(OFST-1,sp),a
1006  0019 7b08          	ld	a,(OFST+5,sp)
1007  001b a404          	and	a,#4
1008  001d 6b01          	ld	(OFST-2,sp),a
1009  001f 9f            	ld	a,xl
1010  0020 a401          	and	a,#1
1011  0022 1a01          	or	a,(OFST-2,sp)
1012  0024 1a02          	or	a,(OFST-1,sp)
1013  0026 ca525d        	or	a,21085
1014  0029 c7525d        	ld	21085,a
1015                     ; 311   TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM)) | 
1015                     ; 312                           (uint8_t)TIM1_OCMode);
1017  002c c6525a        	ld	a,21082
1018  002f a48f          	and	a,#143
1019  0031 1a04          	or	a,(OFST+1,sp)
1020  0033 c7525a        	ld	21082,a
1021                     ; 315   TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS3 | TIM1_OISR_OIS3N));
1023  0036 c6526f        	ld	a,21103
1024  0039 a4cf          	and	a,#207
1025  003b c7526f        	ld	21103,a
1026                     ; 317   TIM1->OISR |= (uint8_t)((uint8_t)(TIM1_OISR_OIS3 & TIM1_OCIdleState) | 
1026                     ; 318                           (uint8_t)(TIM1_OISR_OIS3N & TIM1_OCNIdleState));
1028  003e 7b0e          	ld	a,(OFST+11,sp)
1029  0040 a420          	and	a,#32
1030  0042 6b03          	ld	(OFST+0,sp),a
1031  0044 7b0d          	ld	a,(OFST+10,sp)
1032  0046 a410          	and	a,#16
1033  0048 1a03          	or	a,(OFST+0,sp)
1034  004a ca526f        	or	a,21103
1035  004d c7526f        	ld	21103,a
1036                     ; 321   TIM1->CCR3H = (uint8_t)(TIM1_Pulse >> 8);
1038  0050 7b09          	ld	a,(OFST+6,sp)
1039  0052 c75269        	ld	21097,a
1040                     ; 322   TIM1->CCR3L = (uint8_t)(TIM1_Pulse);
1042  0055 7b0a          	ld	a,(OFST+7,sp)
1043  0057 c7526a        	ld	21098,a
1044                     ; 323 }
1047  005a 5b05          	addw	sp,#5
1048  005c 81            	ret
1122                     ; 338 void TIM1_OC4Init(TIM1_OCMode_TypeDef TIM1_OCMode,
1122                     ; 339                   TIM1_OutputState_TypeDef TIM1_OutputState,
1122                     ; 340                   uint16_t TIM1_Pulse,
1122                     ; 341                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
1122                     ; 342                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState)
1122                     ; 343 {
1123                     .text:	section	.text,new
1124  0000               _TIM1_OC4Init:
1126  0000 89            	pushw	x
1127  0001 88            	push	a
1128       00000001      OFST:	set	1
1131                     ; 345   assert_param(IS_TIM1_OC_MODE_OK(TIM1_OCMode));
1133                     ; 346   assert_param(IS_TIM1_OUTPUT_STATE_OK(TIM1_OutputState));
1135                     ; 347   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
1137                     ; 348   assert_param(IS_TIM1_OCIDLE_STATE_OK(TIM1_OCIdleState));
1139                     ; 351   TIM1->CCER2 &= (uint8_t)(~(TIM1_CCER2_CC4E | TIM1_CCER2_CC4P));
1141  0002 c6525d        	ld	a,21085
1142  0005 a4cf          	and	a,#207
1143  0007 c7525d        	ld	21085,a
1144                     ; 353   TIM1->CCER2 |= (uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER2_CC4E ) |  
1144                     ; 354                            (uint8_t)(TIM1_OCPolarity  & TIM1_CCER2_CC4P ));
1146  000a 7b08          	ld	a,(OFST+7,sp)
1147  000c a420          	and	a,#32
1148  000e 6b01          	ld	(OFST+0,sp),a
1149  0010 9f            	ld	a,xl
1150  0011 a410          	and	a,#16
1151  0013 1a01          	or	a,(OFST+0,sp)
1152  0015 ca525d        	or	a,21085
1153  0018 c7525d        	ld	21085,a
1154                     ; 357   TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_OCM)) | 
1154                     ; 358                           TIM1_OCMode);
1156  001b c6525b        	ld	a,21083
1157  001e a48f          	and	a,#143
1158  0020 1a02          	or	a,(OFST+1,sp)
1159  0022 c7525b        	ld	21083,a
1160                     ; 361   if (TIM1_OCIdleState != TIM1_OCIDLESTATE_RESET)
1162  0025 0d09          	tnz	(OFST+8,sp)
1163  0027 270a          	jreq	L534
1164                     ; 363     TIM1->OISR |= (uint8_t)(~TIM1_CCER2_CC4P);
1166  0029 c6526f        	ld	a,21103
1167  002c aadf          	or	a,#223
1168  002e c7526f        	ld	21103,a
1170  0031 2004          	jra	L734
1171  0033               L534:
1172                     ; 367     TIM1->OISR &= (uint8_t)(~TIM1_OISR_OIS4);
1174  0033 721d526f      	bres	21103,#6
1175  0037               L734:
1176                     ; 371   TIM1->CCR4H = (uint8_t)(TIM1_Pulse >> 8);
1178  0037 7b06          	ld	a,(OFST+5,sp)
1179  0039 c7526b        	ld	21099,a
1180                     ; 372   TIM1->CCR4L = (uint8_t)(TIM1_Pulse);
1182  003c 7b07          	ld	a,(OFST+6,sp)
1183  003e c7526c        	ld	21100,a
1184                     ; 373 }
1187  0041 5b03          	addw	sp,#3
1188  0043 81            	ret
1393                     ; 388 void TIM1_BDTRConfig(TIM1_OSSIState_TypeDef TIM1_OSSIState,
1393                     ; 389                      TIM1_LockLevel_TypeDef TIM1_LockLevel,
1393                     ; 390                      uint8_t TIM1_DeadTime,
1393                     ; 391                      TIM1_BreakState_TypeDef TIM1_Break,
1393                     ; 392                      TIM1_BreakPolarity_TypeDef TIM1_BreakPolarity,
1393                     ; 393                      TIM1_AutomaticOutput_TypeDef TIM1_AutomaticOutput)
1393                     ; 394 {
1394                     .text:	section	.text,new
1395  0000               _TIM1_BDTRConfig:
1397  0000 89            	pushw	x
1398  0001 88            	push	a
1399       00000001      OFST:	set	1
1402                     ; 396   assert_param(IS_TIM1_OSSI_STATE_OK(TIM1_OSSIState));
1404                     ; 397   assert_param(IS_TIM1_LOCK_LEVEL_OK(TIM1_LockLevel));
1406                     ; 398   assert_param(IS_TIM1_BREAK_STATE_OK(TIM1_Break));
1408                     ; 399   assert_param(IS_TIM1_BREAK_POLARITY_OK(TIM1_BreakPolarity));
1410                     ; 400   assert_param(IS_TIM1_AUTOMATIC_OUTPUT_STATE_OK(TIM1_AutomaticOutput));
1412                     ; 402   TIM1->DTR = (uint8_t)(TIM1_DeadTime);
1414  0002 7b06          	ld	a,(OFST+5,sp)
1415  0004 c7526e        	ld	21102,a
1416                     ; 406   TIM1->BKR  =  (uint8_t)((uint8_t)(TIM1_OSSIState | (uint8_t)TIM1_LockLevel)  | 
1416                     ; 407                           (uint8_t)((uint8_t)(TIM1_Break | (uint8_t)TIM1_BreakPolarity)  | 
1416                     ; 408                           (uint8_t)TIM1_AutomaticOutput));
1418  0007 7b07          	ld	a,(OFST+6,sp)
1419  0009 1a08          	or	a,(OFST+7,sp)
1420  000b 1a09          	or	a,(OFST+8,sp)
1421  000d 6b01          	ld	(OFST+0,sp),a
1422  000f 9f            	ld	a,xl
1423  0010 1a02          	or	a,(OFST+1,sp)
1424  0012 1a01          	or	a,(OFST+0,sp)
1425  0014 c7526d        	ld	21101,a
1426                     ; 409 }
1429  0017 5b03          	addw	sp,#3
1430  0019 81            	ret
1632                     ; 423 void TIM1_ICInit(TIM1_Channel_TypeDef TIM1_Channel,
1632                     ; 424                  TIM1_ICPolarity_TypeDef TIM1_ICPolarity,
1632                     ; 425                  TIM1_ICSelection_TypeDef TIM1_ICSelection,
1632                     ; 426                  TIM1_ICPSC_TypeDef TIM1_ICPrescaler,
1632                     ; 427                  uint8_t TIM1_ICFilter)
1632                     ; 428 {
1633                     .text:	section	.text,new
1634  0000               _TIM1_ICInit:
1636  0000 89            	pushw	x
1637       00000000      OFST:	set	0
1640                     ; 430   assert_param(IS_TIM1_CHANNEL_OK(TIM1_Channel));
1642                     ; 431   assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_ICPolarity));
1644                     ; 432   assert_param(IS_TIM1_IC_SELECTION_OK(TIM1_ICSelection));
1646                     ; 433   assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_ICPrescaler));
1648                     ; 434   assert_param(IS_TIM1_IC_FILTER_OK(TIM1_ICFilter));
1650                     ; 436   if (TIM1_Channel == TIM1_CHANNEL_1)
1652  0001 9e            	ld	a,xh
1653  0002 4d            	tnz	a
1654  0003 2614          	jrne	L766
1655                     ; 439     TI1_Config((uint8_t)TIM1_ICPolarity,
1655                     ; 440                (uint8_t)TIM1_ICSelection,
1655                     ; 441                (uint8_t)TIM1_ICFilter);
1657  0005 7b07          	ld	a,(OFST+7,sp)
1658  0007 88            	push	a
1659  0008 7b06          	ld	a,(OFST+6,sp)
1660  000a 97            	ld	xl,a
1661  000b 7b03          	ld	a,(OFST+3,sp)
1662  000d 95            	ld	xh,a
1663  000e cd0000        	call	L3_TI1_Config
1665  0011 84            	pop	a
1666                     ; 443     TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
1668  0012 7b06          	ld	a,(OFST+6,sp)
1669  0014 cd0000        	call	_TIM1_SetIC1Prescaler
1672  0017 2046          	jra	L176
1673  0019               L766:
1674                     ; 445   else if (TIM1_Channel == TIM1_CHANNEL_2)
1676  0019 7b01          	ld	a,(OFST+1,sp)
1677  001b a101          	cp	a,#1
1678  001d 2614          	jrne	L376
1679                     ; 448     TI2_Config((uint8_t)TIM1_ICPolarity,
1679                     ; 449                (uint8_t)TIM1_ICSelection,
1679                     ; 450                (uint8_t)TIM1_ICFilter);
1681  001f 7b07          	ld	a,(OFST+7,sp)
1682  0021 88            	push	a
1683  0022 7b06          	ld	a,(OFST+6,sp)
1684  0024 97            	ld	xl,a
1685  0025 7b03          	ld	a,(OFST+3,sp)
1686  0027 95            	ld	xh,a
1687  0028 cd0000        	call	L5_TI2_Config
1689  002b 84            	pop	a
1690                     ; 452     TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
1692  002c 7b06          	ld	a,(OFST+6,sp)
1693  002e cd0000        	call	_TIM1_SetIC2Prescaler
1696  0031 202c          	jra	L176
1697  0033               L376:
1698                     ; 454   else if (TIM1_Channel == TIM1_CHANNEL_3)
1700  0033 7b01          	ld	a,(OFST+1,sp)
1701  0035 a102          	cp	a,#2
1702  0037 2614          	jrne	L776
1703                     ; 457     TI3_Config((uint8_t)TIM1_ICPolarity,
1703                     ; 458                (uint8_t)TIM1_ICSelection,
1703                     ; 459                (uint8_t)TIM1_ICFilter);
1705  0039 7b07          	ld	a,(OFST+7,sp)
1706  003b 88            	push	a
1707  003c 7b06          	ld	a,(OFST+6,sp)
1708  003e 97            	ld	xl,a
1709  003f 7b03          	ld	a,(OFST+3,sp)
1710  0041 95            	ld	xh,a
1711  0042 cd0000        	call	L7_TI3_Config
1713  0045 84            	pop	a
1714                     ; 461     TIM1_SetIC3Prescaler(TIM1_ICPrescaler);
1716  0046 7b06          	ld	a,(OFST+6,sp)
1717  0048 cd0000        	call	_TIM1_SetIC3Prescaler
1720  004b 2012          	jra	L176
1721  004d               L776:
1722                     ; 466     TI4_Config((uint8_t)TIM1_ICPolarity,
1722                     ; 467                (uint8_t)TIM1_ICSelection,
1722                     ; 468                (uint8_t)TIM1_ICFilter);
1724  004d 7b07          	ld	a,(OFST+7,sp)
1725  004f 88            	push	a
1726  0050 7b06          	ld	a,(OFST+6,sp)
1727  0052 97            	ld	xl,a
1728  0053 7b03          	ld	a,(OFST+3,sp)
1729  0055 95            	ld	xh,a
1730  0056 cd0000        	call	L11_TI4_Config
1732  0059 84            	pop	a
1733                     ; 470     TIM1_SetIC4Prescaler(TIM1_ICPrescaler);
1735  005a 7b06          	ld	a,(OFST+6,sp)
1736  005c cd0000        	call	_TIM1_SetIC4Prescaler
1738  005f               L176:
1739                     ; 472 }
1742  005f 85            	popw	x
1743  0060 81            	ret
1839                     ; 488 void TIM1_PWMIConfig(TIM1_Channel_TypeDef TIM1_Channel,
1839                     ; 489                      TIM1_ICPolarity_TypeDef TIM1_ICPolarity,
1839                     ; 490                      TIM1_ICSelection_TypeDef TIM1_ICSelection,
1839                     ; 491                      TIM1_ICPSC_TypeDef TIM1_ICPrescaler,
1839                     ; 492                      uint8_t TIM1_ICFilter)
1839                     ; 493 {
1840                     .text:	section	.text,new
1841  0000               _TIM1_PWMIConfig:
1843  0000 89            	pushw	x
1844  0001 89            	pushw	x
1845       00000002      OFST:	set	2
1848                     ; 494   uint8_t icpolarity = TIM1_ICPOLARITY_RISING;
1850                     ; 495   uint8_t icselection = TIM1_ICSELECTION_DIRECTTI;
1852                     ; 498   assert_param(IS_TIM1_PWMI_CHANNEL_OK(TIM1_Channel));
1854                     ; 499   assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_ICPolarity));
1856                     ; 500   assert_param(IS_TIM1_IC_SELECTION_OK(TIM1_ICSelection));
1858                     ; 501   assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_ICPrescaler));
1860                     ; 504   if (TIM1_ICPolarity != TIM1_ICPOLARITY_FALLING)
1862  0002 9f            	ld	a,xl
1863  0003 a101          	cp	a,#1
1864  0005 2706          	jreq	L157
1865                     ; 506     icpolarity = TIM1_ICPOLARITY_FALLING;
1867  0007 a601          	ld	a,#1
1868  0009 6b01          	ld	(OFST-1,sp),a
1870  000b 2002          	jra	L357
1871  000d               L157:
1872                     ; 510     icpolarity = TIM1_ICPOLARITY_RISING;
1874  000d 0f01          	clr	(OFST-1,sp)
1875  000f               L357:
1876                     ; 514   if (TIM1_ICSelection == TIM1_ICSELECTION_DIRECTTI)
1878  000f 7b07          	ld	a,(OFST+5,sp)
1879  0011 a101          	cp	a,#1
1880  0013 2606          	jrne	L557
1881                     ; 516     icselection = TIM1_ICSELECTION_INDIRECTTI;
1883  0015 a602          	ld	a,#2
1884  0017 6b02          	ld	(OFST+0,sp),a
1886  0019 2004          	jra	L757
1887  001b               L557:
1888                     ; 520     icselection = TIM1_ICSELECTION_DIRECTTI;
1890  001b a601          	ld	a,#1
1891  001d 6b02          	ld	(OFST+0,sp),a
1892  001f               L757:
1893                     ; 523   if (TIM1_Channel == TIM1_CHANNEL_1)
1895  001f 0d03          	tnz	(OFST+1,sp)
1896  0021 2626          	jrne	L167
1897                     ; 526     TI1_Config((uint8_t)TIM1_ICPolarity, (uint8_t)TIM1_ICSelection,
1897                     ; 527                (uint8_t)TIM1_ICFilter);
1899  0023 7b09          	ld	a,(OFST+7,sp)
1900  0025 88            	push	a
1901  0026 7b08          	ld	a,(OFST+6,sp)
1902  0028 97            	ld	xl,a
1903  0029 7b05          	ld	a,(OFST+3,sp)
1904  002b 95            	ld	xh,a
1905  002c cd0000        	call	L3_TI1_Config
1907  002f 84            	pop	a
1908                     ; 530     TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
1910  0030 7b08          	ld	a,(OFST+6,sp)
1911  0032 cd0000        	call	_TIM1_SetIC1Prescaler
1913                     ; 533     TI2_Config(icpolarity, icselection, TIM1_ICFilter);
1915  0035 7b09          	ld	a,(OFST+7,sp)
1916  0037 88            	push	a
1917  0038 7b03          	ld	a,(OFST+1,sp)
1918  003a 97            	ld	xl,a
1919  003b 7b02          	ld	a,(OFST+0,sp)
1920  003d 95            	ld	xh,a
1921  003e cd0000        	call	L5_TI2_Config
1923  0041 84            	pop	a
1924                     ; 536     TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
1926  0042 7b08          	ld	a,(OFST+6,sp)
1927  0044 cd0000        	call	_TIM1_SetIC2Prescaler
1930  0047 2024          	jra	L367
1931  0049               L167:
1932                     ; 541     TI2_Config((uint8_t)TIM1_ICPolarity, (uint8_t)TIM1_ICSelection,
1932                     ; 542                (uint8_t)TIM1_ICFilter);
1934  0049 7b09          	ld	a,(OFST+7,sp)
1935  004b 88            	push	a
1936  004c 7b08          	ld	a,(OFST+6,sp)
1937  004e 97            	ld	xl,a
1938  004f 7b05          	ld	a,(OFST+3,sp)
1939  0051 95            	ld	xh,a
1940  0052 cd0000        	call	L5_TI2_Config
1942  0055 84            	pop	a
1943                     ; 545     TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
1945  0056 7b08          	ld	a,(OFST+6,sp)
1946  0058 cd0000        	call	_TIM1_SetIC2Prescaler
1948                     ; 548     TI1_Config(icpolarity, icselection, TIM1_ICFilter);
1950  005b 7b09          	ld	a,(OFST+7,sp)
1951  005d 88            	push	a
1952  005e 7b03          	ld	a,(OFST+1,sp)
1953  0060 97            	ld	xl,a
1954  0061 7b02          	ld	a,(OFST+0,sp)
1955  0063 95            	ld	xh,a
1956  0064 cd0000        	call	L3_TI1_Config
1958  0067 84            	pop	a
1959                     ; 551     TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
1961  0068 7b08          	ld	a,(OFST+6,sp)
1962  006a cd0000        	call	_TIM1_SetIC1Prescaler
1964  006d               L367:
1965                     ; 553 }
1968  006d 5b04          	addw	sp,#4
1969  006f 81            	ret
2024                     ; 561 void TIM1_Cmd(FunctionalState NewState)
2024                     ; 562 {
2025                     .text:	section	.text,new
2026  0000               _TIM1_Cmd:
2030                     ; 564   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2032                     ; 567   if (NewState != DISABLE)
2034  0000 4d            	tnz	a
2035  0001 2706          	jreq	L3101
2036                     ; 569     TIM1->CR1 |= TIM1_CR1_CEN;
2038  0003 72105250      	bset	21072,#0
2040  0007 2004          	jra	L5101
2041  0009               L3101:
2042                     ; 573     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_CEN);
2044  0009 72115250      	bres	21072,#0
2045  000d               L5101:
2046                     ; 575 }
2049  000d 81            	ret
2085                     ; 583 void TIM1_CtrlPWMOutputs(FunctionalState NewState)
2085                     ; 584 {
2086                     .text:	section	.text,new
2087  0000               _TIM1_CtrlPWMOutputs:
2091                     ; 586   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2093                     ; 590   if (NewState != DISABLE)
2095  0000 4d            	tnz	a
2096  0001 2706          	jreq	L5301
2097                     ; 592     TIM1->BKR |= TIM1_BKR_MOE;
2099  0003 721e526d      	bset	21101,#7
2101  0007 2004          	jra	L7301
2102  0009               L5301:
2103                     ; 596     TIM1->BKR &= (uint8_t)(~TIM1_BKR_MOE);
2105  0009 721f526d      	bres	21101,#7
2106  000d               L7301:
2107                     ; 598 }
2110  000d 81            	ret
2217                     ; 617 void TIM1_ITConfig(TIM1_IT_TypeDef  TIM1_IT, FunctionalState NewState)
2217                     ; 618 {
2218                     .text:	section	.text,new
2219  0000               _TIM1_ITConfig:
2221  0000 89            	pushw	x
2222       00000000      OFST:	set	0
2225                     ; 620   assert_param(IS_TIM1_IT_OK(TIM1_IT));
2227                     ; 621   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2229                     ; 623   if (NewState != DISABLE)
2231  0001 9f            	ld	a,xl
2232  0002 4d            	tnz	a
2233  0003 2709          	jreq	L7011
2234                     ; 626     TIM1->IER |= (uint8_t)TIM1_IT;
2236  0005 9e            	ld	a,xh
2237  0006 ca5254        	or	a,21076
2238  0009 c75254        	ld	21076,a
2240  000c 2009          	jra	L1111
2241  000e               L7011:
2242                     ; 631     TIM1->IER &= (uint8_t)(~(uint8_t)TIM1_IT);
2244  000e 7b01          	ld	a,(OFST+1,sp)
2245  0010 43            	cpl	a
2246  0011 c45254        	and	a,21076
2247  0014 c75254        	ld	21076,a
2248  0017               L1111:
2249                     ; 633 }
2252  0017 85            	popw	x
2253  0018 81            	ret
2277                     ; 640 void TIM1_InternalClockConfig(void)
2277                     ; 641 {
2278                     .text:	section	.text,new
2279  0000               _TIM1_InternalClockConfig:
2283                     ; 643   TIM1->SMCR &= (uint8_t)(~TIM1_SMCR_SMS);
2285  0000 c65252        	ld	a,21074
2286  0003 a4f8          	and	a,#248
2287  0005 c75252        	ld	21074,a
2288                     ; 644 }
2291  0008 81            	ret
2408                     ; 662 void TIM1_ETRClockMode1Config(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
2408                     ; 663                               TIM1_ExtTRGPolarity_TypeDef TIM1_ExtTRGPolarity,
2408                     ; 664                               uint8_t ExtTRGFilter)
2408                     ; 665 {
2409                     .text:	section	.text,new
2410  0000               _TIM1_ETRClockMode1Config:
2412  0000 89            	pushw	x
2413       00000000      OFST:	set	0
2416                     ; 667   assert_param(IS_TIM1_EXT_PRESCALER_OK(TIM1_ExtTRGPrescaler));
2418                     ; 668   assert_param(IS_TIM1_EXT_POLARITY_OK(TIM1_ExtTRGPolarity));
2420                     ; 671   TIM1_ETRConfig(TIM1_ExtTRGPrescaler, TIM1_ExtTRGPolarity, ExtTRGFilter);
2422  0001 7b05          	ld	a,(OFST+5,sp)
2423  0003 88            	push	a
2424  0004 9f            	ld	a,xl
2425  0005 97            	ld	xl,a
2426  0006 7b02          	ld	a,(OFST+2,sp)
2427  0008 95            	ld	xh,a
2428  0009 cd0000        	call	_TIM1_ETRConfig
2430  000c 84            	pop	a
2431                     ; 674   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~(uint8_t)(TIM1_SMCR_SMS | TIM1_SMCR_TS )))
2431                     ; 675                          | (uint8_t)((uint8_t)TIM1_SLAVEMODE_EXTERNAL1 | TIM1_TS_ETRF ));
2433  000d c65252        	ld	a,21074
2434  0010 a488          	and	a,#136
2435  0012 aa77          	or	a,#119
2436  0014 c75252        	ld	21074,a
2437                     ; 676 }
2440  0017 85            	popw	x
2441  0018 81            	ret
2499                     ; 694 void TIM1_ETRClockMode2Config(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
2499                     ; 695                               TIM1_ExtTRGPolarity_TypeDef TIM1_ExtTRGPolarity,
2499                     ; 696                               uint8_t ExtTRGFilter)
2499                     ; 697 {
2500                     .text:	section	.text,new
2501  0000               _TIM1_ETRClockMode2Config:
2503  0000 89            	pushw	x
2504       00000000      OFST:	set	0
2507                     ; 699   assert_param(IS_TIM1_EXT_PRESCALER_OK(TIM1_ExtTRGPrescaler));
2509                     ; 700   assert_param(IS_TIM1_EXT_POLARITY_OK(TIM1_ExtTRGPolarity));
2511                     ; 703   TIM1_ETRConfig(TIM1_ExtTRGPrescaler, TIM1_ExtTRGPolarity, ExtTRGFilter);
2513  0001 7b05          	ld	a,(OFST+5,sp)
2514  0003 88            	push	a
2515  0004 9f            	ld	a,xl
2516  0005 97            	ld	xl,a
2517  0006 7b02          	ld	a,(OFST+2,sp)
2518  0008 95            	ld	xh,a
2519  0009 cd0000        	call	_TIM1_ETRConfig
2521  000c 84            	pop	a
2522                     ; 706   TIM1->ETR |= TIM1_ETR_ECE;
2524  000d 721c5253      	bset	21075,#6
2525                     ; 707 }
2528  0011 85            	popw	x
2529  0012 81            	ret
2585                     ; 725 void TIM1_ETRConfig(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
2585                     ; 726                     TIM1_ExtTRGPolarity_TypeDef TIM1_ExtTRGPolarity,
2585                     ; 727                     uint8_t ExtTRGFilter)
2585                     ; 728 {
2586                     .text:	section	.text,new
2587  0000               _TIM1_ETRConfig:
2589  0000 89            	pushw	x
2590       00000000      OFST:	set	0
2593                     ; 730   assert_param(IS_TIM1_EXT_TRG_FILTER_OK(ExtTRGFilter));
2595                     ; 732   TIM1->ETR |= (uint8_t)((uint8_t)(TIM1_ExtTRGPrescaler | (uint8_t)TIM1_ExtTRGPolarity )|
2595                     ; 733                          (uint8_t)ExtTRGFilter );
2597  0001 9f            	ld	a,xl
2598  0002 1a01          	or	a,(OFST+1,sp)
2599  0004 1a05          	or	a,(OFST+5,sp)
2600  0006 ca5253        	or	a,21075
2601  0009 c75253        	ld	21075,a
2602                     ; 734 }
2605  000c 85            	popw	x
2606  000d 81            	ret
2695                     ; 751 void TIM1_TIxExternalClockConfig(TIM1_TIxExternalCLK1Source_TypeDef TIM1_TIxExternalCLKSource,
2695                     ; 752                                  TIM1_ICPolarity_TypeDef TIM1_ICPolarity,
2695                     ; 753                                  uint8_t ICFilter)
2695                     ; 754 {
2696                     .text:	section	.text,new
2697  0000               _TIM1_TIxExternalClockConfig:
2699  0000 89            	pushw	x
2700       00000000      OFST:	set	0
2703                     ; 756   assert_param(IS_TIM1_TIXCLK_SOURCE_OK(TIM1_TIxExternalCLKSource));
2705                     ; 757   assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_ICPolarity));
2707                     ; 758   assert_param(IS_TIM1_IC_FILTER_OK(ICFilter));
2709                     ; 761   if (TIM1_TIxExternalCLKSource == TIM1_TIXEXTERNALCLK1SOURCE_TI2)
2711  0001 9e            	ld	a,xh
2712  0002 a160          	cp	a,#96
2713  0004 260f          	jrne	L1131
2714                     ; 763     TI2_Config((uint8_t)TIM1_ICPolarity, (uint8_t)TIM1_ICSELECTION_DIRECTTI, (uint8_t)ICFilter);
2716  0006 7b05          	ld	a,(OFST+5,sp)
2717  0008 88            	push	a
2718  0009 ae0001        	ldw	x,#1
2719  000c 7b03          	ld	a,(OFST+3,sp)
2720  000e 95            	ld	xh,a
2721  000f cd0000        	call	L5_TI2_Config
2723  0012 84            	pop	a
2725  0013 200d          	jra	L3131
2726  0015               L1131:
2727                     ; 767     TI1_Config((uint8_t)TIM1_ICPolarity, (uint8_t)TIM1_ICSELECTION_DIRECTTI, (uint8_t)ICFilter);
2729  0015 7b05          	ld	a,(OFST+5,sp)
2730  0017 88            	push	a
2731  0018 ae0001        	ldw	x,#1
2732  001b 7b03          	ld	a,(OFST+3,sp)
2733  001d 95            	ld	xh,a
2734  001e cd0000        	call	L3_TI1_Config
2736  0021 84            	pop	a
2737  0022               L3131:
2738                     ; 771   TIM1_SelectInputTrigger((TIM1_TS_TypeDef)TIM1_TIxExternalCLKSource);
2740  0022 7b01          	ld	a,(OFST+1,sp)
2741  0024 cd0000        	call	_TIM1_SelectInputTrigger
2743                     ; 774   TIM1->SMCR |= (uint8_t)(TIM1_SLAVEMODE_EXTERNAL1);
2745  0027 c65252        	ld	a,21074
2746  002a aa07          	or	a,#7
2747  002c c75252        	ld	21074,a
2748                     ; 775 }
2751  002f 85            	popw	x
2752  0030 81            	ret
2837                     ; 787 void TIM1_SelectInputTrigger(TIM1_TS_TypeDef TIM1_InputTriggerSource)
2837                     ; 788 {
2838                     .text:	section	.text,new
2839  0000               _TIM1_SelectInputTrigger:
2841  0000 88            	push	a
2842       00000000      OFST:	set	0
2845                     ; 790   assert_param(IS_TIM1_TRIGGER_SELECTION_OK(TIM1_InputTriggerSource));
2847                     ; 793   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~TIM1_SMCR_TS)) | (uint8_t)TIM1_InputTriggerSource);
2849  0001 c65252        	ld	a,21074
2850  0004 a48f          	and	a,#143
2851  0006 1a01          	or	a,(OFST+1,sp)
2852  0008 c75252        	ld	21074,a
2853                     ; 794 }
2856  000b 84            	pop	a
2857  000c 81            	ret
2893                     ; 803 void TIM1_UpdateDisableConfig(FunctionalState NewState)
2893                     ; 804 {
2894                     .text:	section	.text,new
2895  0000               _TIM1_UpdateDisableConfig:
2899                     ; 806   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2901                     ; 809   if (NewState != DISABLE)
2903  0000 4d            	tnz	a
2904  0001 2706          	jreq	L1731
2905                     ; 811     TIM1->CR1 |= TIM1_CR1_UDIS;
2907  0003 72125250      	bset	21072,#1
2909  0007 2004          	jra	L3731
2910  0009               L1731:
2911                     ; 815     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_UDIS);
2913  0009 72135250      	bres	21072,#1
2914  000d               L3731:
2915                     ; 817 }
2918  000d 81            	ret
2976                     ; 827 void TIM1_UpdateRequestConfig(TIM1_UpdateSource_TypeDef TIM1_UpdateSource)
2976                     ; 828 {
2977                     .text:	section	.text,new
2978  0000               _TIM1_UpdateRequestConfig:
2982                     ; 830   assert_param(IS_TIM1_UPDATE_SOURCE_OK(TIM1_UpdateSource));
2984                     ; 833   if (TIM1_UpdateSource != TIM1_UPDATESOURCE_GLOBAL)
2986  0000 4d            	tnz	a
2987  0001 2706          	jreq	L3241
2988                     ; 835     TIM1->CR1 |= TIM1_CR1_URS;
2990  0003 72145250      	bset	21072,#2
2992  0007 2004          	jra	L5241
2993  0009               L3241:
2994                     ; 839     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_URS);
2996  0009 72155250      	bres	21072,#2
2997  000d               L5241:
2998                     ; 841 }
3001  000d 81            	ret
3037                     ; 849 void TIM1_SelectHallSensor(FunctionalState NewState)
3037                     ; 850 {
3038                     .text:	section	.text,new
3039  0000               _TIM1_SelectHallSensor:
3043                     ; 852   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
3045                     ; 855   if (NewState != DISABLE)
3047  0000 4d            	tnz	a
3048  0001 2706          	jreq	L5441
3049                     ; 857     TIM1->CR2 |= TIM1_CR2_TI1S;
3051  0003 721e5251      	bset	21073,#7
3053  0007 2004          	jra	L7441
3054  0009               L5441:
3055                     ; 861     TIM1->CR2 &= (uint8_t)(~TIM1_CR2_TI1S);
3057  0009 721f5251      	bres	21073,#7
3058  000d               L7441:
3059                     ; 863 }
3062  000d 81            	ret
3119                     ; 873 void TIM1_SelectOnePulseMode(TIM1_OPMode_TypeDef TIM1_OPMode)
3119                     ; 874 {
3120                     .text:	section	.text,new
3121  0000               _TIM1_SelectOnePulseMode:
3125                     ; 876   assert_param(IS_TIM1_OPM_MODE_OK(TIM1_OPMode));
3127                     ; 879   if (TIM1_OPMode != TIM1_OPMODE_REPETITIVE)
3129  0000 4d            	tnz	a
3130  0001 2706          	jreq	L7741
3131                     ; 881     TIM1->CR1 |= TIM1_CR1_OPM;
3133  0003 72165250      	bset	21072,#3
3135  0007 2004          	jra	L1051
3136  0009               L7741:
3137                     ; 885     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_OPM);
3139  0009 72175250      	bres	21072,#3
3140  000d               L1051:
3141                     ; 888 }
3144  000d 81            	ret
3242                     ; 903 void TIM1_SelectOutputTrigger(TIM1_TRGOSource_TypeDef TIM1_TRGOSource)
3242                     ; 904 {
3243                     .text:	section	.text,new
3244  0000               _TIM1_SelectOutputTrigger:
3246  0000 88            	push	a
3247       00000000      OFST:	set	0
3250                     ; 906   assert_param(IS_TIM1_TRGO_SOURCE_OK(TIM1_TRGOSource));
3252                     ; 909   TIM1->CR2 = (uint8_t)((uint8_t)(TIM1->CR2 & (uint8_t)(~TIM1_CR2_MMS)) | 
3252                     ; 910                         (uint8_t) TIM1_TRGOSource);
3254  0001 c65251        	ld	a,21073
3255  0004 a48f          	and	a,#143
3256  0006 1a01          	or	a,(OFST+1,sp)
3257  0008 c75251        	ld	21073,a
3258                     ; 911 }
3261  000b 84            	pop	a
3262  000c 81            	ret
3336                     ; 923 void TIM1_SelectSlaveMode(TIM1_SlaveMode_TypeDef TIM1_SlaveMode)
3336                     ; 924 {
3337                     .text:	section	.text,new
3338  0000               _TIM1_SelectSlaveMode:
3340  0000 88            	push	a
3341       00000000      OFST:	set	0
3344                     ; 926   assert_param(IS_TIM1_SLAVE_MODE_OK(TIM1_SlaveMode));
3346                     ; 929   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~TIM1_SMCR_SMS)) |
3346                     ; 930                          (uint8_t)TIM1_SlaveMode);
3348  0001 c65252        	ld	a,21074
3349  0004 a4f8          	and	a,#248
3350  0006 1a01          	or	a,(OFST+1,sp)
3351  0008 c75252        	ld	21074,a
3352                     ; 931 }
3355  000b 84            	pop	a
3356  000c 81            	ret
3392                     ; 939 void TIM1_SelectMasterSlaveMode(FunctionalState NewState)
3392                     ; 940 {
3393                     .text:	section	.text,new
3394  0000               _TIM1_SelectMasterSlaveMode:
3398                     ; 942   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
3400                     ; 945   if (NewState != DISABLE)
3402  0000 4d            	tnz	a
3403  0001 2706          	jreq	L3161
3404                     ; 947     TIM1->SMCR |= TIM1_SMCR_MSM;
3406  0003 721e5252      	bset	21074,#7
3408  0007 2004          	jra	L5161
3409  0009               L3161:
3410                     ; 951     TIM1->SMCR &= (uint8_t)(~TIM1_SMCR_MSM);
3412  0009 721f5252      	bres	21074,#7
3413  000d               L5161:
3414                     ; 953 }
3417  000d 81            	ret
3503                     ; 975 void TIM1_EncoderInterfaceConfig(TIM1_EncoderMode_TypeDef TIM1_EncoderMode,
3503                     ; 976                                  TIM1_ICPolarity_TypeDef TIM1_IC1Polarity,
3503                     ; 977                                  TIM1_ICPolarity_TypeDef TIM1_IC2Polarity)
3503                     ; 978 {
3504                     .text:	section	.text,new
3505  0000               _TIM1_EncoderInterfaceConfig:
3507  0000 89            	pushw	x
3508       00000000      OFST:	set	0
3511                     ; 980   assert_param(IS_TIM1_ENCODER_MODE_OK(TIM1_EncoderMode));
3513                     ; 981   assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_IC1Polarity));
3515                     ; 982   assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_IC2Polarity));
3517                     ; 985   if (TIM1_IC1Polarity != TIM1_ICPOLARITY_RISING)
3519  0001 9f            	ld	a,xl
3520  0002 4d            	tnz	a
3521  0003 2706          	jreq	L7561
3522                     ; 987     TIM1->CCER1 |= TIM1_CCER1_CC1P;
3524  0005 7212525c      	bset	21084,#1
3526  0009 2004          	jra	L1661
3527  000b               L7561:
3528                     ; 991     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1P);
3530  000b 7213525c      	bres	21084,#1
3531  000f               L1661:
3532                     ; 994   if (TIM1_IC2Polarity != TIM1_ICPOLARITY_RISING)
3534  000f 0d05          	tnz	(OFST+5,sp)
3535  0011 2706          	jreq	L3661
3536                     ; 996     TIM1->CCER1 |= TIM1_CCER1_CC2P;
3538  0013 721a525c      	bset	21084,#5
3540  0017 2004          	jra	L5661
3541  0019               L3661:
3542                     ; 1000     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2P);
3544  0019 721b525c      	bres	21084,#5
3545  001d               L5661:
3546                     ; 1003   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(TIM1_SMCR_MSM | TIM1_SMCR_TS))
3546                     ; 1004                          | (uint8_t) TIM1_EncoderMode);
3548  001d c65252        	ld	a,21074
3549  0020 a4f0          	and	a,#240
3550  0022 1a01          	or	a,(OFST+1,sp)
3551  0024 c75252        	ld	21074,a
3552                     ; 1007   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_CCxS)) 
3552                     ; 1008                           | (uint8_t) CCMR_TIxDirect_Set);
3554  0027 c65258        	ld	a,21080
3555  002a a4fc          	and	a,#252
3556  002c aa01          	or	a,#1
3557  002e c75258        	ld	21080,a
3558                     ; 1009   TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_CCxS))
3558                     ; 1010                           | (uint8_t) CCMR_TIxDirect_Set);
3560  0031 c65259        	ld	a,21081
3561  0034 a4fc          	and	a,#252
3562  0036 aa01          	or	a,#1
3563  0038 c75259        	ld	21081,a
3564                     ; 1011 }
3567  003b 85            	popw	x
3568  003c 81            	ret
3635                     ; 1023 void TIM1_PrescalerConfig(uint16_t Prescaler,
3635                     ; 1024                           TIM1_PSCReloadMode_TypeDef TIM1_PSCReloadMode)
3635                     ; 1025 {
3636                     .text:	section	.text,new
3637  0000               _TIM1_PrescalerConfig:
3639  0000 89            	pushw	x
3640       00000000      OFST:	set	0
3643                     ; 1027   assert_param(IS_TIM1_PRESCALER_RELOAD_OK(TIM1_PSCReloadMode));
3645                     ; 1030   TIM1->PSCRH = (uint8_t)(Prescaler >> 8);
3647  0001 9e            	ld	a,xh
3648  0002 c75260        	ld	21088,a
3649                     ; 1031   TIM1->PSCRL = (uint8_t)(Prescaler);
3651  0005 9f            	ld	a,xl
3652  0006 c75261        	ld	21089,a
3653                     ; 1034   TIM1->EGR = (uint8_t)TIM1_PSCReloadMode;
3655  0009 7b05          	ld	a,(OFST+5,sp)
3656  000b c75257        	ld	21079,a
3657                     ; 1035 }
3660  000e 85            	popw	x
3661  000f 81            	ret
3697                     ; 1048 void TIM1_CounterModeConfig(TIM1_CounterMode_TypeDef TIM1_CounterMode)
3697                     ; 1049 {
3698                     .text:	section	.text,new
3699  0000               _TIM1_CounterModeConfig:
3701  0000 88            	push	a
3702       00000000      OFST:	set	0
3705                     ; 1051   assert_param(IS_TIM1_COUNTER_MODE_OK(TIM1_CounterMode));
3707                     ; 1055   TIM1->CR1 = (uint8_t)((uint8_t)(TIM1->CR1 & (uint8_t)((uint8_t)(~TIM1_CR1_CMS) & (uint8_t)(~TIM1_CR1_DIR)))
3707                     ; 1056                         | (uint8_t)TIM1_CounterMode);
3709  0001 c65250        	ld	a,21072
3710  0004 a48f          	and	a,#143
3711  0006 1a01          	or	a,(OFST+1,sp)
3712  0008 c75250        	ld	21072,a
3713                     ; 1057 }
3716  000b 84            	pop	a
3717  000c 81            	ret
3775                     ; 1067 void TIM1_ForcedOC1Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
3775                     ; 1068 {
3776                     .text:	section	.text,new
3777  0000               _TIM1_ForcedOC1Config:
3779  0000 88            	push	a
3780       00000000      OFST:	set	0
3783                     ; 1070   assert_param(IS_TIM1_FORCED_ACTION_OK(TIM1_ForcedAction));
3785                     ; 1073   TIM1->CCMR1 =  (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_OCM))|
3785                     ; 1074                            (uint8_t)TIM1_ForcedAction);
3787  0001 c65258        	ld	a,21080
3788  0004 a48f          	and	a,#143
3789  0006 1a01          	or	a,(OFST+1,sp)
3790  0008 c75258        	ld	21080,a
3791                     ; 1075 }
3794  000b 84            	pop	a
3795  000c 81            	ret
3831                     ; 1085 void TIM1_ForcedOC2Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
3831                     ; 1086 {
3832                     .text:	section	.text,new
3833  0000               _TIM1_ForcedOC2Config:
3835  0000 88            	push	a
3836       00000000      OFST:	set	0
3839                     ; 1088   assert_param(IS_TIM1_FORCED_ACTION_OK(TIM1_ForcedAction));
3841                     ; 1091   TIM1->CCMR2  =  (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM))
3841                     ; 1092                             | (uint8_t)TIM1_ForcedAction);
3843  0001 c65259        	ld	a,21081
3844  0004 a48f          	and	a,#143
3845  0006 1a01          	or	a,(OFST+1,sp)
3846  0008 c75259        	ld	21081,a
3847                     ; 1093 }
3850  000b 84            	pop	a
3851  000c 81            	ret
3887                     ; 1104 void TIM1_ForcedOC3Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
3887                     ; 1105 {
3888                     .text:	section	.text,new
3889  0000               _TIM1_ForcedOC3Config:
3891  0000 88            	push	a
3892       00000000      OFST:	set	0
3895                     ; 1107   assert_param(IS_TIM1_FORCED_ACTION_OK(TIM1_ForcedAction));
3897                     ; 1110   TIM1->CCMR3  =  (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM))  
3897                     ; 1111                             | (uint8_t)TIM1_ForcedAction);
3899  0001 c6525a        	ld	a,21082
3900  0004 a48f          	and	a,#143
3901  0006 1a01          	or	a,(OFST+1,sp)
3902  0008 c7525a        	ld	21082,a
3903                     ; 1112 }
3906  000b 84            	pop	a
3907  000c 81            	ret
3943                     ; 1123 void TIM1_ForcedOC4Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
3943                     ; 1124 {
3944                     .text:	section	.text,new
3945  0000               _TIM1_ForcedOC4Config:
3947  0000 88            	push	a
3948       00000000      OFST:	set	0
3951                     ; 1126   assert_param(IS_TIM1_FORCED_ACTION_OK(TIM1_ForcedAction));
3953                     ; 1129   TIM1->CCMR4  =  (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_OCM)) 
3953                     ; 1130                             | (uint8_t)TIM1_ForcedAction);
3955  0001 c6525b        	ld	a,21083
3956  0004 a48f          	and	a,#143
3957  0006 1a01          	or	a,(OFST+1,sp)
3958  0008 c7525b        	ld	21083,a
3959                     ; 1131 }
3962  000b 84            	pop	a
3963  000c 81            	ret
3999                     ; 1139 void TIM1_ARRPreloadConfig(FunctionalState NewState)
3999                     ; 1140 {
4000                     .text:	section	.text,new
4001  0000               _TIM1_ARRPreloadConfig:
4005                     ; 1142   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4007                     ; 1145   if (NewState != DISABLE)
4009  0000 4d            	tnz	a
4010  0001 2706          	jreq	L5502
4011                     ; 1147     TIM1->CR1 |= TIM1_CR1_ARPE;
4013  0003 721e5250      	bset	21072,#7
4015  0007 2004          	jra	L7502
4016  0009               L5502:
4017                     ; 1151     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_ARPE);
4019  0009 721f5250      	bres	21072,#7
4020  000d               L7502:
4021                     ; 1153 }
4024  000d 81            	ret
4059                     ; 1161 void TIM1_SelectCOM(FunctionalState NewState)
4059                     ; 1162 {
4060                     .text:	section	.text,new
4061  0000               _TIM1_SelectCOM:
4065                     ; 1164   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4067                     ; 1167   if (NewState != DISABLE)
4069  0000 4d            	tnz	a
4070  0001 2706          	jreq	L7702
4071                     ; 1169     TIM1->CR2 |= TIM1_CR2_COMS;
4073  0003 72145251      	bset	21073,#2
4075  0007 2004          	jra	L1012
4076  0009               L7702:
4077                     ; 1173     TIM1->CR2 &= (uint8_t)(~TIM1_CR2_COMS);
4079  0009 72155251      	bres	21073,#2
4080  000d               L1012:
4081                     ; 1175 }
4084  000d 81            	ret
4120                     ; 1183 void TIM1_CCPreloadControl(FunctionalState NewState)
4120                     ; 1184 {
4121                     .text:	section	.text,new
4122  0000               _TIM1_CCPreloadControl:
4126                     ; 1186   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4128                     ; 1189   if (NewState != DISABLE)
4130  0000 4d            	tnz	a
4131  0001 2706          	jreq	L1212
4132                     ; 1191     TIM1->CR2 |= TIM1_CR2_CCPC;
4134  0003 72105251      	bset	21073,#0
4136  0007 2004          	jra	L3212
4137  0009               L1212:
4138                     ; 1195     TIM1->CR2 &= (uint8_t)(~TIM1_CR2_CCPC);
4140  0009 72115251      	bres	21073,#0
4141  000d               L3212:
4142                     ; 1197 }
4145  000d 81            	ret
4181                     ; 1205 void TIM1_OC1PreloadConfig(FunctionalState NewState)
4181                     ; 1206 {
4182                     .text:	section	.text,new
4183  0000               _TIM1_OC1PreloadConfig:
4187                     ; 1208   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4189                     ; 1211   if (NewState != DISABLE)
4191  0000 4d            	tnz	a
4192  0001 2706          	jreq	L3412
4193                     ; 1213     TIM1->CCMR1 |= TIM1_CCMR_OCxPE;
4195  0003 72165258      	bset	21080,#3
4197  0007 2004          	jra	L5412
4198  0009               L3412:
4199                     ; 1217     TIM1->CCMR1 &= (uint8_t)(~TIM1_CCMR_OCxPE);
4201  0009 72175258      	bres	21080,#3
4202  000d               L5412:
4203                     ; 1219 }
4206  000d 81            	ret
4242                     ; 1227 void TIM1_OC2PreloadConfig(FunctionalState NewState)
4242                     ; 1228 {
4243                     .text:	section	.text,new
4244  0000               _TIM1_OC2PreloadConfig:
4248                     ; 1230   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4250                     ; 1233   if (NewState != DISABLE)
4252  0000 4d            	tnz	a
4253  0001 2706          	jreq	L5612
4254                     ; 1235     TIM1->CCMR2 |= TIM1_CCMR_OCxPE;
4256  0003 72165259      	bset	21081,#3
4258  0007 2004          	jra	L7612
4259  0009               L5612:
4260                     ; 1239     TIM1->CCMR2 &= (uint8_t)(~TIM1_CCMR_OCxPE);
4262  0009 72175259      	bres	21081,#3
4263  000d               L7612:
4264                     ; 1241 }
4267  000d 81            	ret
4303                     ; 1249 void TIM1_OC3PreloadConfig(FunctionalState NewState)
4303                     ; 1250 {
4304                     .text:	section	.text,new
4305  0000               _TIM1_OC3PreloadConfig:
4309                     ; 1252   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4311                     ; 1255   if (NewState != DISABLE)
4313  0000 4d            	tnz	a
4314  0001 2706          	jreq	L7022
4315                     ; 1257     TIM1->CCMR3 |= TIM1_CCMR_OCxPE;
4317  0003 7216525a      	bset	21082,#3
4319  0007 2004          	jra	L1122
4320  0009               L7022:
4321                     ; 1261     TIM1->CCMR3 &= (uint8_t)(~TIM1_CCMR_OCxPE);
4323  0009 7217525a      	bres	21082,#3
4324  000d               L1122:
4325                     ; 1263 }
4328  000d 81            	ret
4364                     ; 1271 void TIM1_OC4PreloadConfig(FunctionalState NewState)
4364                     ; 1272 {
4365                     .text:	section	.text,new
4366  0000               _TIM1_OC4PreloadConfig:
4370                     ; 1274   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4372                     ; 1277   if (NewState != DISABLE)
4374  0000 4d            	tnz	a
4375  0001 2706          	jreq	L1322
4376                     ; 1279     TIM1->CCMR4 |= TIM1_CCMR_OCxPE;
4378  0003 7216525b      	bset	21083,#3
4380  0007 2004          	jra	L3322
4381  0009               L1322:
4382                     ; 1283     TIM1->CCMR4 &= (uint8_t)(~TIM1_CCMR_OCxPE);
4384  0009 7217525b      	bres	21083,#3
4385  000d               L3322:
4386                     ; 1285 }
4389  000d 81            	ret
4424                     ; 1293 void TIM1_OC1FastConfig(FunctionalState NewState)
4424                     ; 1294 {
4425                     .text:	section	.text,new
4426  0000               _TIM1_OC1FastConfig:
4430                     ; 1296   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4432                     ; 1299   if (NewState != DISABLE)
4434  0000 4d            	tnz	a
4435  0001 2706          	jreq	L3522
4436                     ; 1301     TIM1->CCMR1 |= TIM1_CCMR_OCxFE;
4438  0003 72145258      	bset	21080,#2
4440  0007 2004          	jra	L5522
4441  0009               L3522:
4442                     ; 1305     TIM1->CCMR1 &= (uint8_t)(~TIM1_CCMR_OCxFE);
4444  0009 72155258      	bres	21080,#2
4445  000d               L5522:
4446                     ; 1307 }
4449  000d 81            	ret
4484                     ; 1315 void TIM1_OC2FastConfig(FunctionalState NewState)
4484                     ; 1316 {
4485                     .text:	section	.text,new
4486  0000               _TIM1_OC2FastConfig:
4490                     ; 1318   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4492                     ; 1321   if (NewState != DISABLE)
4494  0000 4d            	tnz	a
4495  0001 2706          	jreq	L5722
4496                     ; 1323     TIM1->CCMR2 |= TIM1_CCMR_OCxFE;
4498  0003 72145259      	bset	21081,#2
4500  0007 2004          	jra	L7722
4501  0009               L5722:
4502                     ; 1327     TIM1->CCMR2 &= (uint8_t)(~TIM1_CCMR_OCxFE);
4504  0009 72155259      	bres	21081,#2
4505  000d               L7722:
4506                     ; 1329 }
4509  000d 81            	ret
4544                     ; 1337 void TIM1_OC3FastConfig(FunctionalState NewState)
4544                     ; 1338 {
4545                     .text:	section	.text,new
4546  0000               _TIM1_OC3FastConfig:
4550                     ; 1340   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4552                     ; 1343   if (NewState != DISABLE)
4554  0000 4d            	tnz	a
4555  0001 2706          	jreq	L7132
4556                     ; 1345     TIM1->CCMR3 |= TIM1_CCMR_OCxFE;
4558  0003 7214525a      	bset	21082,#2
4560  0007 2004          	jra	L1232
4561  0009               L7132:
4562                     ; 1349     TIM1->CCMR3 &= (uint8_t)(~TIM1_CCMR_OCxFE);
4564  0009 7215525a      	bres	21082,#2
4565  000d               L1232:
4566                     ; 1351 }
4569  000d 81            	ret
4604                     ; 1359 void TIM1_OC4FastConfig(FunctionalState NewState)
4604                     ; 1360 {
4605                     .text:	section	.text,new
4606  0000               _TIM1_OC4FastConfig:
4610                     ; 1362   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4612                     ; 1365   if (NewState != DISABLE)
4614  0000 4d            	tnz	a
4615  0001 2706          	jreq	L1432
4616                     ; 1367     TIM1->CCMR4 |= TIM1_CCMR_OCxFE;
4618  0003 7214525b      	bset	21083,#2
4620  0007 2004          	jra	L3432
4621  0009               L1432:
4622                     ; 1371     TIM1->CCMR4 &= (uint8_t)(~TIM1_CCMR_OCxFE);
4624  0009 7215525b      	bres	21083,#2
4625  000d               L3432:
4626                     ; 1373 }
4629  000d 81            	ret
4734                     ; 1389 void TIM1_GenerateEvent(TIM1_EventSource_TypeDef TIM1_EventSource)
4734                     ; 1390 {
4735                     .text:	section	.text,new
4736  0000               _TIM1_GenerateEvent:
4740                     ; 1392   assert_param(IS_TIM1_EVENT_SOURCE_OK(TIM1_EventSource));
4742                     ; 1395   TIM1->EGR = (uint8_t)TIM1_EventSource;
4744  0000 c75257        	ld	21079,a
4745                     ; 1396 }
4748  0003 81            	ret
4784                     ; 1406 void TIM1_OC1PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
4784                     ; 1407 {
4785                     .text:	section	.text,new
4786  0000               _TIM1_OC1PolarityConfig:
4790                     ; 1409   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
4792                     ; 1412   if (TIM1_OCPolarity != TIM1_OCPOLARITY_HIGH)
4794  0000 4d            	tnz	a
4795  0001 2706          	jreq	L5242
4796                     ; 1414     TIM1->CCER1 |= TIM1_CCER1_CC1P;
4798  0003 7212525c      	bset	21084,#1
4800  0007 2004          	jra	L7242
4801  0009               L5242:
4802                     ; 1418     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1P);
4804  0009 7213525c      	bres	21084,#1
4805  000d               L7242:
4806                     ; 1420 }
4809  000d 81            	ret
4845                     ; 1430 void TIM1_OC1NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
4845                     ; 1431 {
4846                     .text:	section	.text,new
4847  0000               _TIM1_OC1NPolarityConfig:
4851                     ; 1433   assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
4853                     ; 1436   if (TIM1_OCNPolarity != TIM1_OCNPOLARITY_HIGH)
4855  0000 4d            	tnz	a
4856  0001 2706          	jreq	L7442
4857                     ; 1438     TIM1->CCER1 |= TIM1_CCER1_CC1NP;
4859  0003 7216525c      	bset	21084,#3
4861  0007 2004          	jra	L1542
4862  0009               L7442:
4863                     ; 1442     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1NP);
4865  0009 7217525c      	bres	21084,#3
4866  000d               L1542:
4867                     ; 1444 }
4870  000d 81            	ret
4906                     ; 1454 void TIM1_OC2PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
4906                     ; 1455 {
4907                     .text:	section	.text,new
4908  0000               _TIM1_OC2PolarityConfig:
4912                     ; 1457   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
4914                     ; 1460   if (TIM1_OCPolarity != TIM1_OCPOLARITY_HIGH)
4916  0000 4d            	tnz	a
4917  0001 2706          	jreq	L1742
4918                     ; 1462     TIM1->CCER1 |= TIM1_CCER1_CC2P;
4920  0003 721a525c      	bset	21084,#5
4922  0007 2004          	jra	L3742
4923  0009               L1742:
4924                     ; 1466     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2P);
4926  0009 721b525c      	bres	21084,#5
4927  000d               L3742:
4928                     ; 1468 }
4931  000d 81            	ret
4967                     ; 1478 void TIM1_OC2NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
4967                     ; 1479 {
4968                     .text:	section	.text,new
4969  0000               _TIM1_OC2NPolarityConfig:
4973                     ; 1481   assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
4975                     ; 1484   if (TIM1_OCNPolarity != TIM1_OCNPOLARITY_HIGH)
4977  0000 4d            	tnz	a
4978  0001 2706          	jreq	L3152
4979                     ; 1486     TIM1->CCER1 |= TIM1_CCER1_CC2NP;
4981  0003 721e525c      	bset	21084,#7
4983  0007 2004          	jra	L5152
4984  0009               L3152:
4985                     ; 1490     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2NP);
4987  0009 721f525c      	bres	21084,#7
4988  000d               L5152:
4989                     ; 1492 }
4992  000d 81            	ret
5028                     ; 1502 void TIM1_OC3PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
5028                     ; 1503 {
5029                     .text:	section	.text,new
5030  0000               _TIM1_OC3PolarityConfig:
5034                     ; 1505   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
5036                     ; 1508   if (TIM1_OCPolarity != TIM1_OCPOLARITY_HIGH)
5038  0000 4d            	tnz	a
5039  0001 2706          	jreq	L5352
5040                     ; 1510     TIM1->CCER2 |= TIM1_CCER2_CC3P;
5042  0003 7212525d      	bset	21085,#1
5044  0007 2004          	jra	L7352
5045  0009               L5352:
5046                     ; 1514     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3P);
5048  0009 7213525d      	bres	21085,#1
5049  000d               L7352:
5050                     ; 1516 }
5053  000d 81            	ret
5089                     ; 1527 void TIM1_OC3NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
5089                     ; 1528 {
5090                     .text:	section	.text,new
5091  0000               _TIM1_OC3NPolarityConfig:
5095                     ; 1530   assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
5097                     ; 1533   if (TIM1_OCNPolarity != TIM1_OCNPOLARITY_HIGH)
5099  0000 4d            	tnz	a
5100  0001 2706          	jreq	L7552
5101                     ; 1535     TIM1->CCER2 |= TIM1_CCER2_CC3NP;
5103  0003 7216525d      	bset	21085,#3
5105  0007 2004          	jra	L1652
5106  0009               L7552:
5107                     ; 1539     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3NP);
5109  0009 7217525d      	bres	21085,#3
5110  000d               L1652:
5111                     ; 1541 }
5114  000d 81            	ret
5150                     ; 1551 void TIM1_OC4PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
5150                     ; 1552 {
5151                     .text:	section	.text,new
5152  0000               _TIM1_OC4PolarityConfig:
5156                     ; 1554   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
5158                     ; 1557   if (TIM1_OCPolarity != TIM1_OCPOLARITY_HIGH)
5160  0000 4d            	tnz	a
5161  0001 2706          	jreq	L1062
5162                     ; 1559     TIM1->CCER2 |= TIM1_CCER2_CC4P;
5164  0003 721a525d      	bset	21085,#5
5166  0007 2004          	jra	L3062
5167  0009               L1062:
5168                     ; 1563     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4P);
5170  0009 721b525d      	bres	21085,#5
5171  000d               L3062:
5172                     ; 1565 }
5175  000d 81            	ret
5220                     ; 1579 void TIM1_CCxCmd(TIM1_Channel_TypeDef TIM1_Channel, FunctionalState NewState)
5220                     ; 1580 {
5221                     .text:	section	.text,new
5222  0000               _TIM1_CCxCmd:
5224  0000 89            	pushw	x
5225       00000000      OFST:	set	0
5228                     ; 1582   assert_param(IS_TIM1_CHANNEL_OK(TIM1_Channel));
5230                     ; 1583   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
5232                     ; 1585   if (TIM1_Channel == TIM1_CHANNEL_1)
5234  0001 9e            	ld	a,xh
5235  0002 4d            	tnz	a
5236  0003 2610          	jrne	L7262
5237                     ; 1588     if (NewState != DISABLE)
5239  0005 9f            	ld	a,xl
5240  0006 4d            	tnz	a
5241  0007 2706          	jreq	L1362
5242                     ; 1590       TIM1->CCER1 |= TIM1_CCER1_CC1E;
5244  0009 7210525c      	bset	21084,#0
5246  000d 2040          	jra	L5362
5247  000f               L1362:
5248                     ; 1594       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
5250  000f 7211525c      	bres	21084,#0
5251  0013 203a          	jra	L5362
5252  0015               L7262:
5253                     ; 1598   else if (TIM1_Channel == TIM1_CHANNEL_2)
5255  0015 7b01          	ld	a,(OFST+1,sp)
5256  0017 a101          	cp	a,#1
5257  0019 2610          	jrne	L7362
5258                     ; 1601     if (NewState != DISABLE)
5260  001b 0d02          	tnz	(OFST+2,sp)
5261  001d 2706          	jreq	L1462
5262                     ; 1603       TIM1->CCER1 |= TIM1_CCER1_CC2E;
5264  001f 7218525c      	bset	21084,#4
5266  0023 202a          	jra	L5362
5267  0025               L1462:
5268                     ; 1607       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2E);
5270  0025 7219525c      	bres	21084,#4
5271  0029 2024          	jra	L5362
5272  002b               L7362:
5273                     ; 1610   else if (TIM1_Channel == TIM1_CHANNEL_3)
5275  002b 7b01          	ld	a,(OFST+1,sp)
5276  002d a102          	cp	a,#2
5277  002f 2610          	jrne	L7462
5278                     ; 1613     if (NewState != DISABLE)
5280  0031 0d02          	tnz	(OFST+2,sp)
5281  0033 2706          	jreq	L1562
5282                     ; 1615       TIM1->CCER2 |= TIM1_CCER2_CC3E;
5284  0035 7210525d      	bset	21085,#0
5286  0039 2014          	jra	L5362
5287  003b               L1562:
5288                     ; 1619       TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3E);
5290  003b 7211525d      	bres	21085,#0
5291  003f 200e          	jra	L5362
5292  0041               L7462:
5293                     ; 1625     if (NewState != DISABLE)
5295  0041 0d02          	tnz	(OFST+2,sp)
5296  0043 2706          	jreq	L7562
5297                     ; 1627       TIM1->CCER2 |= TIM1_CCER2_CC4E;
5299  0045 7218525d      	bset	21085,#4
5301  0049 2004          	jra	L5362
5302  004b               L7562:
5303                     ; 1631       TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4E);
5305  004b 7219525d      	bres	21085,#4
5306  004f               L5362:
5307                     ; 1634 }
5310  004f 85            	popw	x
5311  0050 81            	ret
5356                     ; 1647 void TIM1_CCxNCmd(TIM1_Channel_TypeDef TIM1_Channel, FunctionalState NewState)
5356                     ; 1648 {
5357                     .text:	section	.text,new
5358  0000               _TIM1_CCxNCmd:
5360  0000 89            	pushw	x
5361       00000000      OFST:	set	0
5364                     ; 1650   assert_param(IS_TIM1_COMPLEMENTARY_CHANNEL_OK(TIM1_Channel));
5366                     ; 1651   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
5368                     ; 1653   if (TIM1_Channel == TIM1_CHANNEL_1)
5370  0001 9e            	ld	a,xh
5371  0002 4d            	tnz	a
5372  0003 2610          	jrne	L5072
5373                     ; 1656     if (NewState != DISABLE)
5375  0005 9f            	ld	a,xl
5376  0006 4d            	tnz	a
5377  0007 2706          	jreq	L7072
5378                     ; 1658       TIM1->CCER1 |= TIM1_CCER1_CC1NE;
5380  0009 7214525c      	bset	21084,#2
5382  000d 202a          	jra	L3172
5383  000f               L7072:
5384                     ; 1662       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1NE);
5386  000f 7215525c      	bres	21084,#2
5387  0013 2024          	jra	L3172
5388  0015               L5072:
5389                     ; 1665   else if (TIM1_Channel == TIM1_CHANNEL_2)
5391  0015 7b01          	ld	a,(OFST+1,sp)
5392  0017 a101          	cp	a,#1
5393  0019 2610          	jrne	L5172
5394                     ; 1668     if (NewState != DISABLE)
5396  001b 0d02          	tnz	(OFST+2,sp)
5397  001d 2706          	jreq	L7172
5398                     ; 1670       TIM1->CCER1 |= TIM1_CCER1_CC2NE;
5400  001f 721c525c      	bset	21084,#6
5402  0023 2014          	jra	L3172
5403  0025               L7172:
5404                     ; 1674       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2NE);
5406  0025 721d525c      	bres	21084,#6
5407  0029 200e          	jra	L3172
5408  002b               L5172:
5409                     ; 1680     if (NewState != DISABLE)
5411  002b 0d02          	tnz	(OFST+2,sp)
5412  002d 2706          	jreq	L5272
5413                     ; 1682       TIM1->CCER2 |= TIM1_CCER2_CC3NE;
5415  002f 7214525d      	bset	21085,#2
5417  0033 2004          	jra	L3172
5418  0035               L5272:
5419                     ; 1686       TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3NE);
5421  0035 7215525d      	bres	21085,#2
5422  0039               L3172:
5423                     ; 1689 }
5426  0039 85            	popw	x
5427  003a 81            	ret
5472                     ; 1712 void TIM1_SelectOCxM(TIM1_Channel_TypeDef TIM1_Channel, TIM1_OCMode_TypeDef TIM1_OCMode)
5472                     ; 1713 {
5473                     .text:	section	.text,new
5474  0000               _TIM1_SelectOCxM:
5476  0000 89            	pushw	x
5477       00000000      OFST:	set	0
5480                     ; 1715   assert_param(IS_TIM1_CHANNEL_OK(TIM1_Channel));
5482                     ; 1716   assert_param(IS_TIM1_OCM_OK(TIM1_OCMode));
5484                     ; 1718   if (TIM1_Channel == TIM1_CHANNEL_1)
5486  0001 9e            	ld	a,xh
5487  0002 4d            	tnz	a
5488  0003 2610          	jrne	L3572
5489                     ; 1721     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
5491  0005 7211525c      	bres	21084,#0
5492                     ; 1724     TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_OCM)) 
5492                     ; 1725                             | (uint8_t)TIM1_OCMode);
5494  0009 c65258        	ld	a,21080
5495  000c a48f          	and	a,#143
5496  000e 1a02          	or	a,(OFST+2,sp)
5497  0010 c75258        	ld	21080,a
5499  0013 203a          	jra	L5572
5500  0015               L3572:
5501                     ; 1727   else if (TIM1_Channel == TIM1_CHANNEL_2)
5503  0015 7b01          	ld	a,(OFST+1,sp)
5504  0017 a101          	cp	a,#1
5505  0019 2610          	jrne	L7572
5506                     ; 1730     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2E);
5508  001b 7219525c      	bres	21084,#4
5509                     ; 1733     TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM))
5509                     ; 1734                             | (uint8_t)TIM1_OCMode);
5511  001f c65259        	ld	a,21081
5512  0022 a48f          	and	a,#143
5513  0024 1a02          	or	a,(OFST+2,sp)
5514  0026 c75259        	ld	21081,a
5516  0029 2024          	jra	L5572
5517  002b               L7572:
5518                     ; 1736   else if (TIM1_Channel == TIM1_CHANNEL_3)
5520  002b 7b01          	ld	a,(OFST+1,sp)
5521  002d a102          	cp	a,#2
5522  002f 2610          	jrne	L3672
5523                     ; 1739     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3E);
5525  0031 7211525d      	bres	21085,#0
5526                     ; 1742     TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM)) 
5526                     ; 1743                             | (uint8_t)TIM1_OCMode);
5528  0035 c6525a        	ld	a,21082
5529  0038 a48f          	and	a,#143
5530  003a 1a02          	or	a,(OFST+2,sp)
5531  003c c7525a        	ld	21082,a
5533  003f 200e          	jra	L5572
5534  0041               L3672:
5535                     ; 1748     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4E);
5537  0041 7219525d      	bres	21085,#4
5538                     ; 1751     TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_OCM)) 
5538                     ; 1752                             | (uint8_t)TIM1_OCMode);
5540  0045 c6525b        	ld	a,21083
5541  0048 a48f          	and	a,#143
5542  004a 1a02          	or	a,(OFST+2,sp)
5543  004c c7525b        	ld	21083,a
5544  004f               L5572:
5545                     ; 1754 }
5548  004f 85            	popw	x
5549  0050 81            	ret
5583                     ; 1762 void TIM1_SetCounter(uint16_t Counter)
5583                     ; 1763 {
5584                     .text:	section	.text,new
5585  0000               _TIM1_SetCounter:
5589                     ; 1765   TIM1->CNTRH = (uint8_t)(Counter >> 8);
5591  0000 9e            	ld	a,xh
5592  0001 c7525e        	ld	21086,a
5593                     ; 1766   TIM1->CNTRL = (uint8_t)(Counter);
5595  0004 9f            	ld	a,xl
5596  0005 c7525f        	ld	21087,a
5597                     ; 1767 }
5600  0008 81            	ret
5634                     ; 1775 void TIM1_SetAutoreload(uint16_t Autoreload)
5634                     ; 1776 {
5635                     .text:	section	.text,new
5636  0000               _TIM1_SetAutoreload:
5640                     ; 1778   TIM1->ARRH = (uint8_t)(Autoreload >> 8);
5642  0000 9e            	ld	a,xh
5643  0001 c75262        	ld	21090,a
5644                     ; 1779   TIM1->ARRL = (uint8_t)(Autoreload);
5646  0004 9f            	ld	a,xl
5647  0005 c75263        	ld	21091,a
5648                     ; 1780  }
5651  0008 81            	ret
5685                     ; 1788 void TIM1_SetCompare1(uint16_t Compare1)
5685                     ; 1789 {
5686                     .text:	section	.text,new
5687  0000               _TIM1_SetCompare1:
5691                     ; 1791   TIM1->CCR1H = (uint8_t)(Compare1 >> 8);
5693  0000 9e            	ld	a,xh
5694  0001 c75265        	ld	21093,a
5695                     ; 1792   TIM1->CCR1L = (uint8_t)(Compare1);
5697  0004 9f            	ld	a,xl
5698  0005 c75266        	ld	21094,a
5699                     ; 1793 }
5702  0008 81            	ret
5736                     ; 1801 void TIM1_SetCompare2(uint16_t Compare2)
5736                     ; 1802 {
5737                     .text:	section	.text,new
5738  0000               _TIM1_SetCompare2:
5742                     ; 1804   TIM1->CCR2H = (uint8_t)(Compare2 >> 8);
5744  0000 9e            	ld	a,xh
5745  0001 c75267        	ld	21095,a
5746                     ; 1805   TIM1->CCR2L = (uint8_t)(Compare2);
5748  0004 9f            	ld	a,xl
5749  0005 c75268        	ld	21096,a
5750                     ; 1806 }
5753  0008 81            	ret
5787                     ; 1814 void TIM1_SetCompare3(uint16_t Compare3)
5787                     ; 1815 {
5788                     .text:	section	.text,new
5789  0000               _TIM1_SetCompare3:
5793                     ; 1817   TIM1->CCR3H = (uint8_t)(Compare3 >> 8);
5795  0000 9e            	ld	a,xh
5796  0001 c75269        	ld	21097,a
5797                     ; 1818   TIM1->CCR3L = (uint8_t)(Compare3);
5799  0004 9f            	ld	a,xl
5800  0005 c7526a        	ld	21098,a
5801                     ; 1819 }
5804  0008 81            	ret
5838                     ; 1827 void TIM1_SetCompare4(uint16_t Compare4)
5838                     ; 1828 {
5839                     .text:	section	.text,new
5840  0000               _TIM1_SetCompare4:
5844                     ; 1830   TIM1->CCR4H = (uint8_t)(Compare4 >> 8);
5846  0000 9e            	ld	a,xh
5847  0001 c7526b        	ld	21099,a
5848                     ; 1831   TIM1->CCR4L = (uint8_t)(Compare4);
5850  0004 9f            	ld	a,xl
5851  0005 c7526c        	ld	21100,a
5852                     ; 1832 }
5855  0008 81            	ret
5891                     ; 1844 void TIM1_SetIC1Prescaler(TIM1_ICPSC_TypeDef TIM1_IC1Prescaler)
5891                     ; 1845 {
5892                     .text:	section	.text,new
5893  0000               _TIM1_SetIC1Prescaler:
5895  0000 88            	push	a
5896       00000000      OFST:	set	0
5899                     ; 1847   assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_IC1Prescaler));
5901                     ; 1850   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_ICxPSC)) 
5901                     ; 1851                           | (uint8_t)TIM1_IC1Prescaler);
5903  0001 c65258        	ld	a,21080
5904  0004 a4f3          	and	a,#243
5905  0006 1a01          	or	a,(OFST+1,sp)
5906  0008 c75258        	ld	21080,a
5907                     ; 1852 }
5910  000b 84            	pop	a
5911  000c 81            	ret
5947                     ; 1864 void TIM1_SetIC2Prescaler(TIM1_ICPSC_TypeDef TIM1_IC2Prescaler)
5947                     ; 1865 {
5948                     .text:	section	.text,new
5949  0000               _TIM1_SetIC2Prescaler:
5951  0000 88            	push	a
5952       00000000      OFST:	set	0
5955                     ; 1868   assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_IC2Prescaler));
5957                     ; 1871   TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_ICxPSC))
5957                     ; 1872                           | (uint8_t)TIM1_IC2Prescaler);
5959  0001 c65259        	ld	a,21081
5960  0004 a4f3          	and	a,#243
5961  0006 1a01          	or	a,(OFST+1,sp)
5962  0008 c75259        	ld	21081,a
5963                     ; 1873 }
5966  000b 84            	pop	a
5967  000c 81            	ret
6003                     ; 1885 void TIM1_SetIC3Prescaler(TIM1_ICPSC_TypeDef TIM1_IC3Prescaler)
6003                     ; 1886 {
6004                     .text:	section	.text,new
6005  0000               _TIM1_SetIC3Prescaler:
6007  0000 88            	push	a
6008       00000000      OFST:	set	0
6011                     ; 1889   assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_IC3Prescaler));
6013                     ; 1892   TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_ICxPSC)) | 
6013                     ; 1893                           (uint8_t)TIM1_IC3Prescaler);
6015  0001 c6525a        	ld	a,21082
6016  0004 a4f3          	and	a,#243
6017  0006 1a01          	or	a,(OFST+1,sp)
6018  0008 c7525a        	ld	21082,a
6019                     ; 1894 }
6022  000b 84            	pop	a
6023  000c 81            	ret
6059                     ; 1906 void TIM1_SetIC4Prescaler(TIM1_ICPSC_TypeDef TIM1_IC4Prescaler)
6059                     ; 1907 {
6060                     .text:	section	.text,new
6061  0000               _TIM1_SetIC4Prescaler:
6063  0000 88            	push	a
6064       00000000      OFST:	set	0
6067                     ; 1910   assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_IC4Prescaler));
6069                     ; 1913   TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_ICxPSC)) |
6069                     ; 1914                           (uint8_t)TIM1_IC4Prescaler);
6071  0001 c6525b        	ld	a,21083
6072  0004 a4f3          	and	a,#243
6073  0006 1a01          	or	a,(OFST+1,sp)
6074  0008 c7525b        	ld	21083,a
6075                     ; 1915 }
6078  000b 84            	pop	a
6079  000c 81            	ret
6131                     ; 1922 uint16_t TIM1_GetCapture1(void)
6131                     ; 1923 {
6132                     .text:	section	.text,new
6133  0000               _TIM1_GetCapture1:
6135  0000 5204          	subw	sp,#4
6136       00000004      OFST:	set	4
6139                     ; 1926   uint16_t tmpccr1 = 0;
6141                     ; 1927   uint8_t tmpccr1l=0, tmpccr1h=0;
6145                     ; 1929   tmpccr1h = TIM1->CCR1H;
6147  0002 c65265        	ld	a,21093
6148  0005 6b02          	ld	(OFST-2,sp),a
6149                     ; 1930   tmpccr1l = TIM1->CCR1L;
6151  0007 c65266        	ld	a,21094
6152  000a 6b01          	ld	(OFST-3,sp),a
6153                     ; 1932   tmpccr1 = (uint16_t)(tmpccr1l);
6155  000c 7b01          	ld	a,(OFST-3,sp)
6156  000e 5f            	clrw	x
6157  000f 97            	ld	xl,a
6158  0010 1f03          	ldw	(OFST-1,sp),x
6159                     ; 1933   tmpccr1 |= (uint16_t)((uint16_t)tmpccr1h << 8);
6161  0012 7b02          	ld	a,(OFST-2,sp)
6162  0014 5f            	clrw	x
6163  0015 97            	ld	xl,a
6164  0016 4f            	clr	a
6165  0017 02            	rlwa	x,a
6166  0018 01            	rrwa	x,a
6167  0019 1a04          	or	a,(OFST+0,sp)
6168  001b 01            	rrwa	x,a
6169  001c 1a03          	or	a,(OFST-1,sp)
6170  001e 01            	rrwa	x,a
6171  001f 1f03          	ldw	(OFST-1,sp),x
6172                     ; 1935   return (uint16_t)tmpccr1;
6174  0021 1e03          	ldw	x,(OFST-1,sp)
6177  0023 5b04          	addw	sp,#4
6178  0025 81            	ret
6230                     ; 1943 uint16_t TIM1_GetCapture2(void)
6230                     ; 1944 {
6231                     .text:	section	.text,new
6232  0000               _TIM1_GetCapture2:
6234  0000 5204          	subw	sp,#4
6235       00000004      OFST:	set	4
6238                     ; 1947   uint16_t tmpccr2 = 0;
6240                     ; 1948   uint8_t tmpccr2l=0, tmpccr2h=0;
6244                     ; 1950   tmpccr2h = TIM1->CCR2H;
6246  0002 c65267        	ld	a,21095
6247  0005 6b02          	ld	(OFST-2,sp),a
6248                     ; 1951   tmpccr2l = TIM1->CCR2L;
6250  0007 c65268        	ld	a,21096
6251  000a 6b01          	ld	(OFST-3,sp),a
6252                     ; 1953   tmpccr2 = (uint16_t)(tmpccr2l);
6254  000c 7b01          	ld	a,(OFST-3,sp)
6255  000e 5f            	clrw	x
6256  000f 97            	ld	xl,a
6257  0010 1f03          	ldw	(OFST-1,sp),x
6258                     ; 1954   tmpccr2 |= (uint16_t)((uint16_t)tmpccr2h << 8);
6260  0012 7b02          	ld	a,(OFST-2,sp)
6261  0014 5f            	clrw	x
6262  0015 97            	ld	xl,a
6263  0016 4f            	clr	a
6264  0017 02            	rlwa	x,a
6265  0018 01            	rrwa	x,a
6266  0019 1a04          	or	a,(OFST+0,sp)
6267  001b 01            	rrwa	x,a
6268  001c 1a03          	or	a,(OFST-1,sp)
6269  001e 01            	rrwa	x,a
6270  001f 1f03          	ldw	(OFST-1,sp),x
6271                     ; 1956   return (uint16_t)tmpccr2;
6273  0021 1e03          	ldw	x,(OFST-1,sp)
6276  0023 5b04          	addw	sp,#4
6277  0025 81            	ret
6329                     ; 1964 uint16_t TIM1_GetCapture3(void)
6329                     ; 1965 {
6330                     .text:	section	.text,new
6331  0000               _TIM1_GetCapture3:
6333  0000 5204          	subw	sp,#4
6334       00000004      OFST:	set	4
6337                     ; 1967   uint16_t tmpccr3 = 0;
6339                     ; 1968   uint8_t tmpccr3l=0, tmpccr3h=0;
6343                     ; 1970   tmpccr3h = TIM1->CCR3H;
6345  0002 c65269        	ld	a,21097
6346  0005 6b02          	ld	(OFST-2,sp),a
6347                     ; 1971   tmpccr3l = TIM1->CCR3L;
6349  0007 c6526a        	ld	a,21098
6350  000a 6b01          	ld	(OFST-3,sp),a
6351                     ; 1973   tmpccr3 = (uint16_t)(tmpccr3l);
6353  000c 7b01          	ld	a,(OFST-3,sp)
6354  000e 5f            	clrw	x
6355  000f 97            	ld	xl,a
6356  0010 1f03          	ldw	(OFST-1,sp),x
6357                     ; 1974   tmpccr3 |= (uint16_t)((uint16_t)tmpccr3h << 8);
6359  0012 7b02          	ld	a,(OFST-2,sp)
6360  0014 5f            	clrw	x
6361  0015 97            	ld	xl,a
6362  0016 4f            	clr	a
6363  0017 02            	rlwa	x,a
6364  0018 01            	rrwa	x,a
6365  0019 1a04          	or	a,(OFST+0,sp)
6366  001b 01            	rrwa	x,a
6367  001c 1a03          	or	a,(OFST-1,sp)
6368  001e 01            	rrwa	x,a
6369  001f 1f03          	ldw	(OFST-1,sp),x
6370                     ; 1976   return (uint16_t)tmpccr3;
6372  0021 1e03          	ldw	x,(OFST-1,sp)
6375  0023 5b04          	addw	sp,#4
6376  0025 81            	ret
6428                     ; 1984 uint16_t TIM1_GetCapture4(void)
6428                     ; 1985 {
6429                     .text:	section	.text,new
6430  0000               _TIM1_GetCapture4:
6432  0000 5204          	subw	sp,#4
6433       00000004      OFST:	set	4
6436                     ; 1987   uint16_t tmpccr4 = 0;
6438                     ; 1988   uint8_t tmpccr4l=0, tmpccr4h=0;
6442                     ; 1990   tmpccr4h = TIM1->CCR4H;
6444  0002 c6526b        	ld	a,21099
6445  0005 6b02          	ld	(OFST-2,sp),a
6446                     ; 1991   tmpccr4l = TIM1->CCR4L;
6448  0007 c6526c        	ld	a,21100
6449  000a 6b01          	ld	(OFST-3,sp),a
6450                     ; 1993   tmpccr4 = (uint16_t)(tmpccr4l);
6452  000c 7b01          	ld	a,(OFST-3,sp)
6453  000e 5f            	clrw	x
6454  000f 97            	ld	xl,a
6455  0010 1f03          	ldw	(OFST-1,sp),x
6456                     ; 1994   tmpccr4 |= (uint16_t)((uint16_t)tmpccr4h << 8);
6458  0012 7b02          	ld	a,(OFST-2,sp)
6459  0014 5f            	clrw	x
6460  0015 97            	ld	xl,a
6461  0016 4f            	clr	a
6462  0017 02            	rlwa	x,a
6463  0018 01            	rrwa	x,a
6464  0019 1a04          	or	a,(OFST+0,sp)
6465  001b 01            	rrwa	x,a
6466  001c 1a03          	or	a,(OFST-1,sp)
6467  001e 01            	rrwa	x,a
6468  001f 1f03          	ldw	(OFST-1,sp),x
6469                     ; 1996   return (uint16_t)tmpccr4;
6471  0021 1e03          	ldw	x,(OFST-1,sp)
6474  0023 5b04          	addw	sp,#4
6475  0025 81            	ret
6509                     ; 2004 uint16_t TIM1_GetCounter(void)
6509                     ; 2005 {
6510                     .text:	section	.text,new
6511  0000               _TIM1_GetCounter:
6513  0000 89            	pushw	x
6514       00000002      OFST:	set	2
6517                     ; 2006   uint16_t tmpcntr = 0;
6519                     ; 2008   tmpcntr = ((uint16_t)TIM1->CNTRH << 8);
6521  0001 c6525e        	ld	a,21086
6522  0004 5f            	clrw	x
6523  0005 97            	ld	xl,a
6524  0006 4f            	clr	a
6525  0007 02            	rlwa	x,a
6526  0008 1f01          	ldw	(OFST-1,sp),x
6527                     ; 2011   return (uint16_t)(tmpcntr | (uint16_t)(TIM1->CNTRL));
6529  000a c6525f        	ld	a,21087
6530  000d 5f            	clrw	x
6531  000e 97            	ld	xl,a
6532  000f 01            	rrwa	x,a
6533  0010 1a02          	or	a,(OFST+0,sp)
6534  0012 01            	rrwa	x,a
6535  0013 1a01          	or	a,(OFST-1,sp)
6536  0015 01            	rrwa	x,a
6539  0016 5b02          	addw	sp,#2
6540  0018 81            	ret
6574                     ; 2019 uint16_t TIM1_GetPrescaler(void)
6574                     ; 2020 {
6575                     .text:	section	.text,new
6576  0000               _TIM1_GetPrescaler:
6578  0000 89            	pushw	x
6579       00000002      OFST:	set	2
6582                     ; 2021   uint16_t temp = 0;
6584                     ; 2023   temp = ((uint16_t)TIM1->PSCRH << 8);
6586  0001 c65260        	ld	a,21088
6587  0004 5f            	clrw	x
6588  0005 97            	ld	xl,a
6589  0006 4f            	clr	a
6590  0007 02            	rlwa	x,a
6591  0008 1f01          	ldw	(OFST-1,sp),x
6592                     ; 2026   return (uint16_t)( temp | (uint16_t)(TIM1->PSCRL));
6594  000a c65261        	ld	a,21089
6595  000d 5f            	clrw	x
6596  000e 97            	ld	xl,a
6597  000f 01            	rrwa	x,a
6598  0010 1a02          	or	a,(OFST+0,sp)
6599  0012 01            	rrwa	x,a
6600  0013 1a01          	or	a,(OFST-1,sp)
6601  0015 01            	rrwa	x,a
6604  0016 5b02          	addw	sp,#2
6605  0018 81            	ret
6779                     ; 2047 FlagStatus TIM1_GetFlagStatus(TIM1_FLAG_TypeDef TIM1_FLAG)
6779                     ; 2048 {
6780                     .text:	section	.text,new
6781  0000               _TIM1_GetFlagStatus:
6783  0000 89            	pushw	x
6784  0001 89            	pushw	x
6785       00000002      OFST:	set	2
6788                     ; 2049   FlagStatus bitstatus = RESET;
6790                     ; 2050   uint8_t tim1_flag_l = 0, tim1_flag_h = 0;
6794                     ; 2053   assert_param(IS_TIM1_GET_FLAG_OK(TIM1_FLAG));
6796                     ; 2055   tim1_flag_l = (uint8_t)(TIM1->SR1 & (uint8_t)TIM1_FLAG);
6798  0002 9f            	ld	a,xl
6799  0003 c45255        	and	a,21077
6800  0006 6b01          	ld	(OFST-1,sp),a
6801                     ; 2056   tim1_flag_h = (uint8_t)((uint16_t)TIM1_FLAG >> 8);
6803  0008 7b03          	ld	a,(OFST+1,sp)
6804  000a 6b02          	ld	(OFST+0,sp),a
6805                     ; 2058   if ((tim1_flag_l | (uint8_t)(TIM1->SR2 & tim1_flag_h)) != 0)
6807  000c c65256        	ld	a,21078
6808  000f 1402          	and	a,(OFST+0,sp)
6809  0011 1a01          	or	a,(OFST-1,sp)
6810  0013 2706          	jreq	L5643
6811                     ; 2060     bitstatus = SET;
6813  0015 a601          	ld	a,#1
6814  0017 6b02          	ld	(OFST+0,sp),a
6816  0019 2002          	jra	L7643
6817  001b               L5643:
6818                     ; 2064     bitstatus = RESET;
6820  001b 0f02          	clr	(OFST+0,sp)
6821  001d               L7643:
6822                     ; 2066   return (FlagStatus)(bitstatus);
6824  001d 7b02          	ld	a,(OFST+0,sp)
6827  001f 5b04          	addw	sp,#4
6828  0021 81            	ret
6863                     ; 2087 void TIM1_ClearFlag(TIM1_FLAG_TypeDef TIM1_FLAG)
6863                     ; 2088 {
6864                     .text:	section	.text,new
6865  0000               _TIM1_ClearFlag:
6867  0000 89            	pushw	x
6868       00000000      OFST:	set	0
6871                     ; 2090   assert_param(IS_TIM1_CLEAR_FLAG_OK(TIM1_FLAG));
6873                     ; 2093   TIM1->SR1 = (uint8_t)(~(uint8_t)(TIM1_FLAG));
6875  0001 9f            	ld	a,xl
6876  0002 43            	cpl	a
6877  0003 c75255        	ld	21077,a
6878                     ; 2094   TIM1->SR2 = (uint8_t)((uint8_t)(~((uint8_t)((uint16_t)TIM1_FLAG >> 8))) & 
6878                     ; 2095                         (uint8_t)0x1E);
6880  0006 7b01          	ld	a,(OFST+1,sp)
6881  0008 43            	cpl	a
6882  0009 a41e          	and	a,#30
6883  000b c75256        	ld	21078,a
6884                     ; 2096 }
6887  000e 85            	popw	x
6888  000f 81            	ret
6952                     ; 2112 ITStatus TIM1_GetITStatus(TIM1_IT_TypeDef TIM1_IT)
6952                     ; 2113 {
6953                     .text:	section	.text,new
6954  0000               _TIM1_GetITStatus:
6956  0000 88            	push	a
6957  0001 89            	pushw	x
6958       00000002      OFST:	set	2
6961                     ; 2114   ITStatus bitstatus = RESET;
6963                     ; 2115   uint8_t TIM1_itStatus = 0, TIM1_itEnable = 0;
6967                     ; 2118   assert_param(IS_TIM1_GET_IT_OK(TIM1_IT));
6969                     ; 2120   TIM1_itStatus = (uint8_t)(TIM1->SR1 & (uint8_t)TIM1_IT);
6971  0002 c45255        	and	a,21077
6972  0005 6b01          	ld	(OFST-1,sp),a
6973                     ; 2122   TIM1_itEnable = (uint8_t)(TIM1->IER & (uint8_t)TIM1_IT);
6975  0007 c65254        	ld	a,21076
6976  000a 1403          	and	a,(OFST+1,sp)
6977  000c 6b02          	ld	(OFST+0,sp),a
6978                     ; 2124   if ((TIM1_itStatus != (uint8_t)RESET ) && (TIM1_itEnable != (uint8_t)RESET ))
6980  000e 0d01          	tnz	(OFST-1,sp)
6981  0010 270a          	jreq	L1453
6983  0012 0d02          	tnz	(OFST+0,sp)
6984  0014 2706          	jreq	L1453
6985                     ; 2126     bitstatus = SET;
6987  0016 a601          	ld	a,#1
6988  0018 6b02          	ld	(OFST+0,sp),a
6990  001a 2002          	jra	L3453
6991  001c               L1453:
6992                     ; 2130     bitstatus = RESET;
6994  001c 0f02          	clr	(OFST+0,sp)
6995  001e               L3453:
6996                     ; 2132   return (ITStatus)(bitstatus);
6998  001e 7b02          	ld	a,(OFST+0,sp)
7001  0020 5b03          	addw	sp,#3
7002  0022 81            	ret
7038                     ; 2149 void TIM1_ClearITPendingBit(TIM1_IT_TypeDef TIM1_IT)
7038                     ; 2150 {
7039                     .text:	section	.text,new
7040  0000               _TIM1_ClearITPendingBit:
7044                     ; 2152   assert_param(IS_TIM1_IT_OK(TIM1_IT));
7046                     ; 2155   TIM1->SR1 = (uint8_t)(~(uint8_t)TIM1_IT);
7048  0000 43            	cpl	a
7049  0001 c75255        	ld	21077,a
7050                     ; 2156 }
7053  0004 81            	ret
7105                     ; 2174 static void TI1_Config(uint8_t TIM1_ICPolarity,
7105                     ; 2175                        uint8_t TIM1_ICSelection,
7105                     ; 2176                        uint8_t TIM1_ICFilter)
7105                     ; 2177 {
7106                     .text:	section	.text,new
7107  0000               L3_TI1_Config:
7109  0000 89            	pushw	x
7110  0001 88            	push	a
7111       00000001      OFST:	set	1
7114                     ; 2179   TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
7116  0002 7211525c      	bres	21084,#0
7117                     ; 2182   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~(uint8_t)( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF ))) | 
7117                     ; 2183                           (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
7119  0006 7b06          	ld	a,(OFST+5,sp)
7120  0008 97            	ld	xl,a
7121  0009 a610          	ld	a,#16
7122  000b 42            	mul	x,a
7123  000c 9f            	ld	a,xl
7124  000d 1a03          	or	a,(OFST+2,sp)
7125  000f 6b01          	ld	(OFST+0,sp),a
7126  0011 c65258        	ld	a,21080
7127  0014 a40c          	and	a,#12
7128  0016 1a01          	or	a,(OFST+0,sp)
7129  0018 c75258        	ld	21080,a
7130                     ; 2186   if (TIM1_ICPolarity != TIM1_ICPOLARITY_RISING)
7132  001b 0d02          	tnz	(OFST+1,sp)
7133  001d 2706          	jreq	L1163
7134                     ; 2188     TIM1->CCER1 |= TIM1_CCER1_CC1P;
7136  001f 7212525c      	bset	21084,#1
7138  0023 2004          	jra	L3163
7139  0025               L1163:
7140                     ; 2192     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1P);
7142  0025 7213525c      	bres	21084,#1
7143  0029               L3163:
7144                     ; 2196   TIM1->CCER1 |=  TIM1_CCER1_CC1E;
7146  0029 7210525c      	bset	21084,#0
7147                     ; 2197 }
7150  002d 5b03          	addw	sp,#3
7151  002f 81            	ret
7203                     ; 2215 static void TI2_Config(uint8_t TIM1_ICPolarity,
7203                     ; 2216                        uint8_t TIM1_ICSelection,
7203                     ; 2217                        uint8_t TIM1_ICFilter)
7203                     ; 2218 {
7204                     .text:	section	.text,new
7205  0000               L5_TI2_Config:
7207  0000 89            	pushw	x
7208  0001 88            	push	a
7209       00000001      OFST:	set	1
7212                     ; 2220   TIM1->CCER1 &=  (uint8_t)(~TIM1_CCER1_CC2E);
7214  0002 7219525c      	bres	21084,#4
7215                     ; 2223   TIM1->CCMR2  = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~(uint8_t)( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF ))) 
7215                     ; 2224                            | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
7217  0006 7b06          	ld	a,(OFST+5,sp)
7218  0008 97            	ld	xl,a
7219  0009 a610          	ld	a,#16
7220  000b 42            	mul	x,a
7221  000c 9f            	ld	a,xl
7222  000d 1a03          	or	a,(OFST+2,sp)
7223  000f 6b01          	ld	(OFST+0,sp),a
7224  0011 c65259        	ld	a,21081
7225  0014 a40c          	and	a,#12
7226  0016 1a01          	or	a,(OFST+0,sp)
7227  0018 c75259        	ld	21081,a
7228                     ; 2226   if (TIM1_ICPolarity != TIM1_ICPOLARITY_RISING)
7230  001b 0d02          	tnz	(OFST+1,sp)
7231  001d 2706          	jreq	L3463
7232                     ; 2228     TIM1->CCER1 |= TIM1_CCER1_CC2P;
7234  001f 721a525c      	bset	21084,#5
7236  0023 2004          	jra	L5463
7237  0025               L3463:
7238                     ; 2232     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2P);
7240  0025 721b525c      	bres	21084,#5
7241  0029               L5463:
7242                     ; 2235   TIM1->CCER1 |=  TIM1_CCER1_CC2E;
7244  0029 7218525c      	bset	21084,#4
7245                     ; 2236 }
7248  002d 5b03          	addw	sp,#3
7249  002f 81            	ret
7301                     ; 2254 static void TI3_Config(uint8_t TIM1_ICPolarity,
7301                     ; 2255                        uint8_t TIM1_ICSelection,
7301                     ; 2256                        uint8_t TIM1_ICFilter)
7301                     ; 2257 {
7302                     .text:	section	.text,new
7303  0000               L7_TI3_Config:
7305  0000 89            	pushw	x
7306  0001 88            	push	a
7307       00000001      OFST:	set	1
7310                     ; 2259   TIM1->CCER2 &=  (uint8_t)(~TIM1_CCER2_CC3E);
7312  0002 7211525d      	bres	21085,#0
7313                     ; 2262   TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~(uint8_t)( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF))) 
7313                     ; 2263                           | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
7315  0006 7b06          	ld	a,(OFST+5,sp)
7316  0008 97            	ld	xl,a
7317  0009 a610          	ld	a,#16
7318  000b 42            	mul	x,a
7319  000c 9f            	ld	a,xl
7320  000d 1a03          	or	a,(OFST+2,sp)
7321  000f 6b01          	ld	(OFST+0,sp),a
7322  0011 c6525a        	ld	a,21082
7323  0014 a40c          	and	a,#12
7324  0016 1a01          	or	a,(OFST+0,sp)
7325  0018 c7525a        	ld	21082,a
7326                     ; 2266   if (TIM1_ICPolarity != TIM1_ICPOLARITY_RISING)
7328  001b 0d02          	tnz	(OFST+1,sp)
7329  001d 2706          	jreq	L5763
7330                     ; 2268     TIM1->CCER2 |= TIM1_CCER2_CC3P;
7332  001f 7212525d      	bset	21085,#1
7334  0023 2004          	jra	L7763
7335  0025               L5763:
7336                     ; 2272     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3P);
7338  0025 7213525d      	bres	21085,#1
7339  0029               L7763:
7340                     ; 2275   TIM1->CCER2 |=  TIM1_CCER2_CC3E;
7342  0029 7210525d      	bset	21085,#0
7343                     ; 2276 }
7346  002d 5b03          	addw	sp,#3
7347  002f 81            	ret
7399                     ; 2294 static void TI4_Config(uint8_t TIM1_ICPolarity,
7399                     ; 2295                        uint8_t TIM1_ICSelection,
7399                     ; 2296                        uint8_t TIM1_ICFilter)
7399                     ; 2297 {
7400                     .text:	section	.text,new
7401  0000               L11_TI4_Config:
7403  0000 89            	pushw	x
7404  0001 88            	push	a
7405       00000001      OFST:	set	1
7408                     ; 2299   TIM1->CCER2 &=  (uint8_t)(~TIM1_CCER2_CC4E);
7410  0002 7219525d      	bres	21085,#4
7411                     ; 2302   TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~(uint8_t)( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF )))
7411                     ; 2303                           | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
7413  0006 7b06          	ld	a,(OFST+5,sp)
7414  0008 97            	ld	xl,a
7415  0009 a610          	ld	a,#16
7416  000b 42            	mul	x,a
7417  000c 9f            	ld	a,xl
7418  000d 1a03          	or	a,(OFST+2,sp)
7419  000f 6b01          	ld	(OFST+0,sp),a
7420  0011 c6525b        	ld	a,21083
7421  0014 a40c          	and	a,#12
7422  0016 1a01          	or	a,(OFST+0,sp)
7423  0018 c7525b        	ld	21083,a
7424                     ; 2306   if (TIM1_ICPolarity != TIM1_ICPOLARITY_RISING)
7426  001b 0d02          	tnz	(OFST+1,sp)
7427  001d 2706          	jreq	L7273
7428                     ; 2308     TIM1->CCER2 |= TIM1_CCER2_CC4P;
7430  001f 721a525d      	bset	21085,#5
7432  0023 2004          	jra	L1373
7433  0025               L7273:
7434                     ; 2312     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4P);
7436  0025 721b525d      	bres	21085,#5
7437  0029               L1373:
7438                     ; 2316   TIM1->CCER2 |=  TIM1_CCER2_CC4E;
7440  0029 7218525d      	bset	21085,#4
7441                     ; 2317 }
7444  002d 5b03          	addw	sp,#3
7445  002f 81            	ret
7458                     	xdef	_TIM1_ClearITPendingBit
7459                     	xdef	_TIM1_GetITStatus
7460                     	xdef	_TIM1_ClearFlag
7461                     	xdef	_TIM1_GetFlagStatus
7462                     	xdef	_TIM1_GetPrescaler
7463                     	xdef	_TIM1_GetCounter
7464                     	xdef	_TIM1_GetCapture4
7465                     	xdef	_TIM1_GetCapture3
7466                     	xdef	_TIM1_GetCapture2
7467                     	xdef	_TIM1_GetCapture1
7468                     	xdef	_TIM1_SetIC4Prescaler
7469                     	xdef	_TIM1_SetIC3Prescaler
7470                     	xdef	_TIM1_SetIC2Prescaler
7471                     	xdef	_TIM1_SetIC1Prescaler
7472                     	xdef	_TIM1_SetCompare4
7473                     	xdef	_TIM1_SetCompare3
7474                     	xdef	_TIM1_SetCompare2
7475                     	xdef	_TIM1_SetCompare1
7476                     	xdef	_TIM1_SetAutoreload
7477                     	xdef	_TIM1_SetCounter
7478                     	xdef	_TIM1_SelectOCxM
7479                     	xdef	_TIM1_CCxNCmd
7480                     	xdef	_TIM1_CCxCmd
7481                     	xdef	_TIM1_OC4PolarityConfig
7482                     	xdef	_TIM1_OC3NPolarityConfig
7483                     	xdef	_TIM1_OC3PolarityConfig
7484                     	xdef	_TIM1_OC2NPolarityConfig
7485                     	xdef	_TIM1_OC2PolarityConfig
7486                     	xdef	_TIM1_OC1NPolarityConfig
7487                     	xdef	_TIM1_OC1PolarityConfig
7488                     	xdef	_TIM1_GenerateEvent
7489                     	xdef	_TIM1_OC4FastConfig
7490                     	xdef	_TIM1_OC3FastConfig
7491                     	xdef	_TIM1_OC2FastConfig
7492                     	xdef	_TIM1_OC1FastConfig
7493                     	xdef	_TIM1_OC4PreloadConfig
7494                     	xdef	_TIM1_OC3PreloadConfig
7495                     	xdef	_TIM1_OC2PreloadConfig
7496                     	xdef	_TIM1_OC1PreloadConfig
7497                     	xdef	_TIM1_CCPreloadControl
7498                     	xdef	_TIM1_SelectCOM
7499                     	xdef	_TIM1_ARRPreloadConfig
7500                     	xdef	_TIM1_ForcedOC4Config
7501                     	xdef	_TIM1_ForcedOC3Config
7502                     	xdef	_TIM1_ForcedOC2Config
7503                     	xdef	_TIM1_ForcedOC1Config
7504                     	xdef	_TIM1_CounterModeConfig
7505                     	xdef	_TIM1_PrescalerConfig
7506                     	xdef	_TIM1_EncoderInterfaceConfig
7507                     	xdef	_TIM1_SelectMasterSlaveMode
7508                     	xdef	_TIM1_SelectSlaveMode
7509                     	xdef	_TIM1_SelectOutputTrigger
7510                     	xdef	_TIM1_SelectOnePulseMode
7511                     	xdef	_TIM1_SelectHallSensor
7512                     	xdef	_TIM1_UpdateRequestConfig
7513                     	xdef	_TIM1_UpdateDisableConfig
7514                     	xdef	_TIM1_SelectInputTrigger
7515                     	xdef	_TIM1_TIxExternalClockConfig
7516                     	xdef	_TIM1_ETRConfig
7517                     	xdef	_TIM1_ETRClockMode2Config
7518                     	xdef	_TIM1_ETRClockMode1Config
7519                     	xdef	_TIM1_InternalClockConfig
7520                     	xdef	_TIM1_ITConfig
7521                     	xdef	_TIM1_CtrlPWMOutputs
7522                     	xdef	_TIM1_Cmd
7523                     	xdef	_TIM1_PWMIConfig
7524                     	xdef	_TIM1_ICInit
7525                     	xdef	_TIM1_BDTRConfig
7526                     	xdef	_TIM1_OC4Init
7527                     	xdef	_TIM1_OC3Init
7528                     	xdef	_TIM1_OC2Init
7529                     	xdef	_TIM1_OC1Init
7530                     	xdef	_TIM1_TimeBaseInit
7531                     	xdef	_TIM1_DeInit
7550                     	end
