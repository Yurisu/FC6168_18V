   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
  17                     	bsct
  18  0000               _moto_power_set:
  19  0000 32            	dc.b	50
  20  0001               _moto_power_run:
  21  0001 00            	dc.b	0
  22  0002               _moto_dang:
  23  0002 00            	dc.b	0
  24  0003               _BAT_SSSCELL:
  25  0003 00            	dc.b	0
  26  0004               _KEY:
  27  0004 00            	dc.b	0
  28  0005 00            	dc.b	0
  29  0006 00            	dc.b	0
  30  0007 00            	dc.b	0
  79                     ; 111 void Delay(int time)
  79                     ; 112 {
  81                     .text:	section	.text,new
  82  0000               _Delay:
  84  0000 89            	pushw	x
  85  0001 89            	pushw	x
  86       00000002      OFST:	set	2
  89  0002 2014          	jra	L53
  90  0004               L33:
  91                     ; 115 			i=5;//300
  93  0004 ae0005        	ldw	x,#5
  94  0007 1f01          	ldw	(OFST-1,sp),x
  96  0009               L54:
  97                     ; 116 			while(i--);
  99  0009 1e01          	ldw	x,(OFST-1,sp)
 100  000b 1d0001        	subw	x,#1
 101  000e 1f01          	ldw	(OFST-1,sp),x
 102  0010 1c0001        	addw	x,#1
 103  0013 a30000        	cpw	x,#0
 104  0016 26f1          	jrne	L54
 105  0018               L53:
 106                     ; 114 		while(time--){
 108  0018 1e03          	ldw	x,(OFST+1,sp)
 109  001a 1d0001        	subw	x,#1
 110  001d 1f03          	ldw	(OFST+1,sp),x
 111  001f 1c0001        	addw	x,#1
 112  0022 a30000        	cpw	x,#0
 113  0025 26dd          	jrne	L33
 114                     ; 118 }
 117  0027 5b04          	addw	sp,#4
 118  0029 81            	ret
 153                     ; 120 void Delay1ms(unsigned int time)
 153                     ; 121 {
 154                     .text:	section	.text,new
 155  0000               _Delay1ms:
 157  0000 89            	pushw	x
 158       00000000      OFST:	set	0
 161                     ; 123 		offtime =  0;
 163  0001 ae0000        	ldw	x,#0
 164  0004 bf1a          	ldw	_offtime+2,x
 165  0006 ae0000        	ldw	x,#0
 166  0009 bf18          	ldw	_offtime,x
 168  000b               L37:
 169                     ; 124 		while(offtime < time ){
 171  000b 1e01          	ldw	x,(OFST+1,sp)
 172  000d cd0000        	call	c_uitolx
 174  0010 ae0018        	ldw	x,#_offtime
 175  0013 cd0000        	call	c_lcmp
 177  0016 22f3          	jrugt	L37
 178                     ; 126 }
 181  0018 85            	popw	x
 182  0019 81            	ret
 211                     ; 128 void TIMER_Initializes(void)
 211                     ; 129 {
 212                     .text:	section	.text,new
 213  0000               _TIMER_Initializes:
 217                     ; 130 CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER4,ENABLE);
 219  0000 ae0001        	ldw	x,#1
 220  0003 a604          	ld	a,#4
 221  0005 95            	ld	xh,a
 222  0006 cd0000        	call	_CLK_PeripheralClockConfig
 224                     ; 131 TIM4_TimeBaseInit(TIM4_PRESCALER_128, 125-1);  //定时1ms (16M/128/125 = 1000)   //128K/32/80=20ms
 226  0009 ae007c        	ldw	x,#124
 227  000c a607          	ld	a,#7
 228  000e 95            	ld	xh,a
 229  000f cd0000        	call	_TIM4_TimeBaseInit
 231                     ; 133 TIM4_ClearFlag(TIM4_FLAG_UPDATE);              //清除标志位
 233  0012 a601          	ld	a,#1
 234  0014 cd0000        	call	_TIM4_ClearFlag
 236                     ; 134 TIM4_ITConfig(TIM4_IT_UPDATE, ENABLE);         //使能更新UPDATE中断
 238  0017 ae0001        	ldw	x,#1
 239  001a a601          	ld	a,#1
 240  001c 95            	ld	xh,a
 241  001d cd0000        	call	_TIM4_ITConfig
 243                     ; 135 TIM4_Cmd(ENABLE);  
 245  0020 a601          	ld	a,#1
 246  0022 cd0000        	call	_TIM4_Cmd
 248                     ; 136 enableInterrupts();
 251  0025 9a            rim
 253                     ; 137 }
 257  0026 81            	ret
 285                     ; 139 void PWM_Init(void)
 285                     ; 140 {//8K=16M/2/1000
 286                     .text:	section	.text,new
 287  0000               _PWM_Init:
 291                     ; 142 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER2,ENABLE);
 293  0000 ae0001        	ldw	x,#1
 294  0003 a605          	ld	a,#5
 295  0005 95            	ld	xh,a
 296  0006 cd0000        	call	_CLK_PeripheralClockConfig
 298                     ; 143   TIM2_TimeBaseInit(TIM2_PRESCALER_2, 900-1);
 300  0009 ae0383        	ldw	x,#899
 301  000c 89            	pushw	x
 302  000d a601          	ld	a,#1
 303  000f cd0000        	call	_TIM2_TimeBaseInit
 305  0012 85            	popw	x
 306                     ; 144   TIM2_OC3Init(TIM2_OCMODE_PWM1, TIM2_OUTPUTSTATE_ENABLE,0, TIM2_OCPOLARITY_HIGH);//PWM1模式，使能通道，比值大小，输出极性
 308  0013 4b00          	push	#0
 309  0015 5f            	clrw	x
 310  0016 89            	pushw	x
 311  0017 ae0011        	ldw	x,#17
 312  001a a660          	ld	a,#96
 313  001c 95            	ld	xh,a
 314  001d cd0000        	call	_TIM2_OC3Init
 316  0020 5b03          	addw	sp,#3
 317                     ; 145   TIM2_OC3PreloadConfig(ENABLE);//使能预装载
 319  0022 a601          	ld	a,#1
 320  0024 cd0000        	call	_TIM2_OC3PreloadConfig
 322                     ; 150   TIM2_Cmd(ENABLE);//使能TIM2
 324  0027 a601          	ld	a,#1
 325  0029 cd0000        	call	_TIM2_Cmd
 327                     ; 151 }
 330  002c 81            	ret
 366                     ; 153 void PWM_SET(uint16_t pwm)
 366                     ; 154 {//pwm=0~100
 367                     .text:	section	.text,new
 368  0000               _PWM_SET:
 370  0000 89            	pushw	x
 371       00000000      OFST:	set	0
 374                     ; 156 	if(pwm==0)
 376  0001 a30000        	cpw	x,#0
 377  0004 261a          	jrne	L531
 378                     ; 158 	  TIM2_OC3Init(TIM2_OCMODE_PWM1, TIM2_OUTPUTSTATE_ENABLE,0, TIM2_OCPOLARITY_HIGH);//PWM1模式，使能通道，比值大小，输出极性
 380  0006 4b00          	push	#0
 381  0008 5f            	clrw	x
 382  0009 89            	pushw	x
 383  000a ae0011        	ldw	x,#17
 384  000d a660          	ld	a,#96
 385  000f 95            	ld	xh,a
 386  0010 cd0000        	call	_TIM2_OC3Init
 388  0013 5b03          	addw	sp,#3
 389                     ; 160 		MOTO1_OFF();
 391  0015 4b08          	push	#8
 392  0017 ae5000        	ldw	x,#20480
 393  001a cd0000        	call	_GPIO_WriteLow
 395  001d 84            	pop	a
 397  001e 2017          	jra	L731
 398  0020               L531:
 399                     ; 166   TIM2_OC3Init(TIM2_OCMODE_PWM1, TIM2_OUTPUTSTATE_ENABLE,pwm*9, TIM2_OCPOLARITY_HIGH);//PWM1模式，使能通道，比值大小，输出极性
 401  0020 4b00          	push	#0
 402  0022 1e02          	ldw	x,(OFST+2,sp)
 403  0024 90ae0009      	ldw	y,#9
 404  0028 cd0000        	call	c_imul
 406  002b 89            	pushw	x
 407  002c ae0011        	ldw	x,#17
 408  002f a660          	ld	a,#96
 409  0031 95            	ld	xh,a
 410  0032 cd0000        	call	_TIM2_OC3Init
 412  0035 5b03          	addw	sp,#3
 413  0037               L731:
 414                     ; 174 }
 417  0037 85            	popw	x
 418  0038 81            	ret
 446                     ; 177 void run_moto(void)//50msRUN
 446                     ; 178 {
 447                     .text:	section	.text,new
 448  0000               _run_moto:
 452                     ; 179 	if(moto_dang==0)
 454  0000 3d02          	tnz	_moto_dang
 455  0002 2604          	jrne	L151
 456                     ; 181 		moto_power_set=0;
 458  0004 3f00          	clr	_moto_power_set
 460  0006 205e          	jra	L351
 461  0008               L151:
 462                     ; 183 	else if(moto_dang==1)
 464  0008 b602          	ld	a,_moto_dang
 465  000a a101          	cp	a,#1
 466  000c 262a          	jrne	L551
 467                     ; 185 		if(BAT_SSSCELL==3) moto_power_set=70;
 469  000e b603          	ld	a,_BAT_SSSCELL
 470  0010 a103          	cp	a,#3
 471  0012 2604          	jrne	L751
 474  0014 35460000      	mov	_moto_power_set,#70
 475  0018               L751:
 476                     ; 186 		if(BAT_SSSCELL==4) moto_power_set=55;
 478  0018 b603          	ld	a,_BAT_SSSCELL
 479  001a a104          	cp	a,#4
 480  001c 2604          	jrne	L161
 483  001e 35370000      	mov	_moto_power_set,#55
 484  0022               L161:
 485                     ; 187 		if(BAT_SSSCELL==5) moto_power_set=45;
 487  0022 b603          	ld	a,_BAT_SSSCELL
 488  0024 a105          	cp	a,#5
 489  0026 2604          	jrne	L361
 492  0028 352d0000      	mov	_moto_power_set,#45
 493  002c               L361:
 494                     ; 188 		if(BAT_SSSCELL==6) moto_power_set=30;
 496  002c b603          	ld	a,_BAT_SSSCELL
 497  002e a106          	cp	a,#6
 498  0030 2634          	jrne	L351
 501  0032 351e0000      	mov	_moto_power_set,#30
 502  0036 202e          	jra	L351
 503  0038               L551:
 504                     ; 190 	else if(moto_dang==2)
 506  0038 b602          	ld	a,_moto_dang
 507  003a a102          	cp	a,#2
 508  003c 2628          	jrne	L351
 509                     ; 192 		if(BAT_SSSCELL==3) moto_power_set=100;
 511  003e b603          	ld	a,_BAT_SSSCELL
 512  0040 a103          	cp	a,#3
 513  0042 2604          	jrne	L371
 516  0044 35640000      	mov	_moto_power_set,#100
 517  0048               L371:
 518                     ; 193 		if(BAT_SSSCELL==4) moto_power_set=90;
 520  0048 b603          	ld	a,_BAT_SSSCELL
 521  004a a104          	cp	a,#4
 522  004c 2604          	jrne	L571
 525  004e 355a0000      	mov	_moto_power_set,#90
 526  0052               L571:
 527                     ; 194 		if(BAT_SSSCELL==5) moto_power_set=80;
 529  0052 b603          	ld	a,_BAT_SSSCELL
 530  0054 a105          	cp	a,#5
 531  0056 2604          	jrne	L771
 534  0058 35500000      	mov	_moto_power_set,#80
 535  005c               L771:
 536                     ; 195 		if(BAT_SSSCELL==6) moto_power_set=70;
 538  005c b603          	ld	a,_BAT_SSSCELL
 539  005e a106          	cp	a,#6
 540  0060 2604          	jrne	L351
 543  0062 35460000      	mov	_moto_power_set,#70
 544  0066               L351:
 545                     ; 199 		if(moto_power_run < moto_power_set)
 547  0066 b601          	ld	a,_moto_power_run
 548  0068 b100          	cp	a,_moto_power_set
 549  006a 240b          	jruge	L302
 550                     ; 201 			moto_power_run++;
 552  006c 3c01          	inc	_moto_power_run
 553                     ; 202 			PWM_SET(moto_power_run);
 555  006e b601          	ld	a,_moto_power_run
 556  0070 5f            	clrw	x
 557  0071 97            	ld	xl,a
 558  0072 cd0000        	call	_PWM_SET
 561  0075 200a          	jra	L502
 562  0077               L302:
 563                     ; 206 			moto_power_run=moto_power_set;
 565  0077 450001        	mov	_moto_power_run,_moto_power_set
 566                     ; 207 			PWM_SET(moto_power_run);
 568  007a b601          	ld	a,_moto_power_run
 569  007c 5f            	clrw	x
 570  007d 97            	ld	xl,a
 571  007e cd0000        	call	_PWM_SET
 573  0081               L502:
 574                     ; 209 }
 577  0081 81            	ret
 605                     ; 214 void Clk_Init(void)
 605                     ; 215 {   //初始化时钟，选择时钟
 606                     .text:	section	.text,new
 607  0000               _Clk_Init:
 611                     ; 216 CLK_DeInit();//复位时钟寄存器
 613  0000 cd0000        	call	_CLK_DeInit
 615                     ; 217 CLK_HSICmd(ENABLE);//使能内部高速时钟
 617  0003 a601          	ld	a,#1
 618  0005 cd0000        	call	_CLK_HSICmd
 620                     ; 218 CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV1);//CLK_PRESCALER_CPUDIV2
 622  0008 a680          	ld	a,#128
 623  000a cd0000        	call	_CLK_SYSCLKConfig
 625                     ; 219 CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);//配置内部高速时钟(时钟分频器:1分频/16mhz),系统时钟16MHz
 627  000d 4f            	clr	a
 628  000e cd0000        	call	_CLK_HSIPrescalerConfig
 630                     ; 220 CLK_ClockSecuritySystemEnable();//开启时钟安全系统
 632  0011 cd0000        	call	_CLK_ClockSecuritySystemEnable
 634                     ; 221 }
 637  0014 81            	ret
 661                     ; 223 void INIT_SYS(void)
 661                     ; 224 {    //关闭设备前，设置系统主时钟，和中断
 662                     .text:	section	.text,new
 663  0000               _INIT_SYS:
 667                     ; 228 	GPIO_Init(GPIOA,GPIO_PIN_2,GPIO_MODE_OUT_PP_HIGH_SLOW);//GPIO_MODE_OUT_PP_LOW_SLOW);
 669  0000 4bd0          	push	#208
 670  0002 4b04          	push	#4
 671  0004 ae5000        	ldw	x,#20480
 672  0007 cd0000        	call	_GPIO_Init
 674  000a 85            	popw	x
 675                     ; 229 	GPIO_Init(GPIOA,GPIO_PIN_3,GPIO_MODE_OUT_PP_LOW_SLOW);//GPIO_MODE_OUT_PP_LOW_SLOW);
 677  000b 4bc0          	push	#192
 678  000d 4b08          	push	#8
 679  000f ae5000        	ldw	x,#20480
 680  0012 cd0000        	call	_GPIO_Init
 682  0015 85            	popw	x
 683                     ; 231 GPIO_Init(GPIOB,GPIO_PIN_4,GPIO_MODE_OUT_PP_HIGH_SLOW);
 685  0016 4bd0          	push	#208
 686  0018 4b10          	push	#16
 687  001a ae5005        	ldw	x,#20485
 688  001d cd0000        	call	_GPIO_Init
 690  0020 85            	popw	x
 691                     ; 232 GPIO_Init(GPIOC,GPIO_PIN_3,GPIO_MODE_OUT_PP_HIGH_SLOW);
 693  0021 4bd0          	push	#208
 694  0023 4b08          	push	#8
 695  0025 ae500a        	ldw	x,#20490
 696  0028 cd0000        	call	_GPIO_Init
 698  002b 85            	popw	x
 699                     ; 233 GPIO_Init(GPIOC,GPIO_PIN_5,GPIO_MODE_OUT_PP_HIGH_SLOW);
 701  002c 4bd0          	push	#208
 702  002e 4b20          	push	#32
 703  0030 ae500a        	ldw	x,#20490
 704  0033 cd0000        	call	_GPIO_Init
 706  0036 85            	popw	x
 707                     ; 234 GPIO_Init(GPIOC,GPIO_PIN_7,GPIO_MODE_OUT_PP_HIGH_SLOW);
 709  0037 4bd0          	push	#208
 710  0039 4b80          	push	#128
 711  003b ae500a        	ldw	x,#20490
 712  003e cd0000        	call	_GPIO_Init
 714  0041 85            	popw	x
 715                     ; 235 GPIO_Init(GPIOD,GPIO_PIN_1,GPIO_MODE_OUT_PP_HIGH_SLOW);
 717  0042 4bd0          	push	#208
 718  0044 4b02          	push	#2
 719  0046 ae500f        	ldw	x,#20495
 720  0049 cd0000        	call	_GPIO_Init
 722  004c 85            	popw	x
 723                     ; 237 GPIO_Init(GPIOC,GPIO_PIN_6,GPIO_MODE_OUT_OD_LOW_FAST);
 725  004d 4ba0          	push	#160
 726  004f 4b40          	push	#64
 727  0051 ae500a        	ldw	x,#20490
 728  0054 cd0000        	call	_GPIO_Init
 730  0057 85            	popw	x
 731                     ; 239 GPIO_Init(GPIOA,GPIO_PIN_1,GPIO_MODE_OUT_PP_HIGH_FAST);
 733  0058 4bf0          	push	#240
 734  005a 4b02          	push	#2
 735  005c ae5000        	ldw	x,#20480
 736  005f cd0000        	call	_GPIO_Init
 738  0062 85            	popw	x
 739                     ; 241 GPIO_Init(GPIOD,GPIO_PIN_4,GPIO_MODE_OUT_PP_LOW_FAST);
 741  0063 4be0          	push	#224
 742  0065 4b10          	push	#16
 743  0067 ae500f        	ldw	x,#20495
 744  006a cd0000        	call	_GPIO_Init
 746  006d 85            	popw	x
 747                     ; 246 GPIO_Init(GPIOD,GPIO_PIN_2|GPIO_PIN_3|GPIO_PIN_5|GPIO_PIN_6,GPIO_MODE_IN_FL_NO_IT);
 749  006e 4b00          	push	#0
 750  0070 4b6c          	push	#108
 751  0072 ae500f        	ldw	x,#20495
 752  0075 cd0000        	call	_GPIO_Init
 754  0078 85            	popw	x
 755                     ; 247 GPIO_Init(GPIOC, GPIO_PIN_4, GPIO_MODE_IN_FL_NO_IT);
 757  0079 4b00          	push	#0
 758  007b 4b10          	push	#16
 759  007d ae500a        	ldw	x,#20490
 760  0080 cd0000        	call	_GPIO_Init
 762  0083 85            	popw	x
 763                     ; 248 }
 766  0084 81            	ret
 792                     ; 250 void ADC_INIT(void)//ok
 792                     ; 251 {
 793                     .text:	section	.text,new
 794  0000               _ADC_INIT:
 798                     ; 254   CLK_PeripheralClockConfig(CLK_PERIPHERAL_ADC,ENABLE);
 800  0000 ae0001        	ldw	x,#1
 801  0003 a613          	ld	a,#19
 802  0005 95            	ld	xh,a
 803  0006 cd0000        	call	_CLK_PeripheralClockConfig
 805                     ; 256   ADC1_Init(ADC1_CONVERSIONMODE_CONTINUOUS, ADC1_CHANNEL_6, ADC1_PRESSEL_FCPU_D2, \
 805                     ; 257             ADC1_EXTTRIG_TIM, DISABLE, ADC1_ALIGN_RIGHT, ADC1_SCHMITTTRIG_ALL,\
 805                     ; 258             DISABLE);
 807  0009 4b00          	push	#0
 808  000b 4bff          	push	#255
 809  000d 4b08          	push	#8
 810  000f 4b00          	push	#0
 811  0011 4b00          	push	#0
 812  0013 4b00          	push	#0
 813  0015 ae0006        	ldw	x,#6
 814  0018 a601          	ld	a,#1
 815  001a 95            	ld	xh,a
 816  001b cd0000        	call	_ADC1_Init
 818  001e 5b06          	addw	sp,#6
 819                     ; 260   ADC1_Cmd(ENABLE);                              //使能ADC
 821  0020 a601          	ld	a,#1
 822  0022 cd0000        	call	_ADC1_Cmd
 824                     ; 262 }
 827  0025 81            	ret
 950                     ; 264 uint16_t Get_ADCCH_Value(ADC1_Channel_TypeDef ADC_Channel)//ok
 950                     ; 265 { 
 951                     .text:	section	.text,new
 952  0000               _Get_ADCCH_Value:
 956                     ; 266   ADC1_Init(ADC1_CONVERSIONMODE_CONTINUOUS,ADC_Channel, ADC1_PRESSEL_FCPU_D2,
 956                     ; 267      ADC1_EXTTRIG_TIM, DISABLE, ADC1_ALIGN_RIGHT, ADC1_SCHMITTTRIG_ALL, DISABLE);
 958  0000 4b00          	push	#0
 959  0002 4bff          	push	#255
 960  0004 4b08          	push	#8
 961  0006 4b00          	push	#0
 962  0008 4b00          	push	#0
 963  000a 4b00          	push	#0
 964  000c 97            	ld	xl,a
 965  000d a601          	ld	a,#1
 966  000f 95            	ld	xh,a
 967  0010 cd0000        	call	_ADC1_Init
 969  0013 5b06          	addw	sp,#6
 970                     ; 273  ADC1_Cmd(ENABLE);     //启动ADC
 972  0015 a601          	ld	a,#1
 973  0017 cd0000        	call	_ADC1_Cmd
 976  001a               L113:
 977                     ; 275  while(ADC1_GetFlagStatus(ADC1_FLAG_EOC) == RESET);  //等待转换结束
 979  001a a680          	ld	a,#128
 980  001c cd0000        	call	_ADC1_GetFlagStatus
 982  001f 4d            	tnz	a
 983  0020 27f8          	jreq	L113
 984                     ; 276  ADC1_ClearFlag(ADC1_FLAG_EOC);  //清除转换结束标志
 986  0022 a680          	ld	a,#128
 987  0024 cd0000        	call	_ADC1_ClearFlag
 989                     ; 280     return ADC1_GetConversionValue(); //返回ADC结果
 991  0027 cd0000        	call	_ADC1_GetConversionValue
 995  002a 81            	ret
1049                     ; 303 uint32_t ADC_Read_Temperature(void)//28度=454
1049                     ; 304 {
1050                     .text:	section	.text,new
1051  0000               _ADC_Read_Temperature:
1053  0000 5207          	subw	sp,#7
1054       00000007      OFST:	set	7
1057                     ; 306   uint16_t adc_value = 0;
1059  0002 5f            	clrw	x
1060  0003 1f05          	ldw	(OFST-2,sp),x
1061                     ; 307   uint32_t adc_voltage = 0;
1063                     ; 309   for(i=0; i<4; i++)
1065  0005 0f07          	clr	(OFST+0,sp)
1066  0007               L343:
1067                     ; 311     adc_value += Get_ADCCH_Value(ADC1_CHANNEL_5);       //读取转换
1069  0007 a605          	ld	a,#5
1070  0009 cd0000        	call	_Get_ADCCH_Value
1072  000c 72fb05        	addw	x,(OFST-2,sp)
1073  000f 1f05          	ldw	(OFST-2,sp),x
1074                     ; 309   for(i=0; i<4; i++)
1076  0011 0c07          	inc	(OFST+0,sp)
1079  0013 7b07          	ld	a,(OFST+0,sp)
1080  0015 a104          	cp	a,#4
1081  0017 25ee          	jrult	L343
1082                     ; 313   adc_voltage = adc_value / 4 ;//>> 2;                  //求平均
1084  0019 1e05          	ldw	x,(OFST-2,sp)
1085  001b 54            	srlw	x
1086  001c 54            	srlw	x
1087  001d cd0000        	call	c_uitolx
1089  0020 96            	ldw	x,sp
1090  0021 1c0001        	addw	x,#OFST-6
1091  0024 cd0000        	call	c_rtol
1093                     ; 317   return adc_voltage;//80度~=141
1095  0027 96            	ldw	x,sp
1096  0028 1c0001        	addw	x,#OFST-6
1097  002b cd0000        	call	c_ltor
1101  002e 5b07          	addw	sp,#7
1102  0030 81            	ret
1155                     .const:	section	.text
1156  0000               L43:
1157  0000 00005eec      	dc.l	24300
1158                     ; 320 uint32_t ADC_Read_Battery(void)//OK
1158                     ; 321 {
1159                     .text:	section	.text,new
1160  0000               _ADC_Read_Battery:
1162  0000 5207          	subw	sp,#7
1163       00000007      OFST:	set	7
1166                     ; 323   uint16_t adc_value = 0;
1168  0002 5f            	clrw	x
1169  0003 1f01          	ldw	(OFST-6,sp),x
1170                     ; 324   uint32_t adc_voltage = 0;
1172                     ; 328   for(i=0; i<4; i++)
1174  0005 0f07          	clr	(OFST+0,sp)
1175  0007               L773:
1176                     ; 330     adc_value += Get_ADCCH_Value(ADC1_CHANNEL_3);       //读取转换
1178  0007 a603          	ld	a,#3
1179  0009 cd0000        	call	_Get_ADCCH_Value
1181  000c 72fb01        	addw	x,(OFST-6,sp)
1182  000f 1f01          	ldw	(OFST-6,sp),x
1183                     ; 328   for(i=0; i<4; i++)
1185  0011 0c07          	inc	(OFST+0,sp)
1188  0013 7b07          	ld	a,(OFST+0,sp)
1189  0015 a104          	cp	a,#4
1190  0017 25ee          	jrult	L773
1191                     ; 334   adc_voltage = adc_value / 4 ;//>> 2;                  //求平均
1193  0019 1e01          	ldw	x,(OFST-6,sp)
1194  001b 54            	srlw	x
1195  001c 54            	srlw	x
1196  001d cd0000        	call	c_uitolx
1198  0020 96            	ldw	x,sp
1199  0021 1c0003        	addw	x,#OFST-4
1200  0024 cd0000        	call	c_rtol
1202                     ; 336   adc_voltage = (adc_voltage*24300) >> 10;  //vcc=5v      //
1204  0027 96            	ldw	x,sp
1205  0028 1c0003        	addw	x,#OFST-4
1206  002b cd0000        	call	c_ltor
1208  002e ae0000        	ldw	x,#L43
1209  0031 cd0000        	call	c_lmul
1211  0034 a60a          	ld	a,#10
1212  0036 cd0000        	call	c_lursh
1214  0039 96            	ldw	x,sp
1215  003a 1c0003        	addw	x,#OFST-4
1216  003d cd0000        	call	c_rtol
1218                     ; 337   return adc_voltage;
1220  0040 96            	ldw	x,sp
1221  0041 1c0003        	addw	x,#OFST-4
1222  0044 cd0000        	call	c_ltor
1226  0047 5b07          	addw	sp,#7
1227  0049 81            	ret
1292                     ; 340 bool ADC_Read_Key(void)//OK
1292                     ; 341 {
1293                     .text:	section	.text,new
1294  0000               _ADC_Read_Key:
1296  0000 5206          	subw	sp,#6
1297       00000006      OFST:	set	6
1300                     ; 343   uint16_t adc_value = 0;
1302                     ; 344   uint32_t adc_voltage = 0;
1304  0002 ae0000        	ldw	x,#0
1305  0005 1f03          	ldw	(OFST-3,sp),x
1306  0007 ae0000        	ldw	x,#0
1307  000a 1f01          	ldw	(OFST-5,sp),x
1308                     ; 348 		adc_value = Get_ADCCH_Value(ADC1_CHANNEL_6);      //读取转换
1310  000c a606          	ld	a,#6
1311  000e cd0000        	call	_Get_ADCCH_Value
1313  0011 1f05          	ldw	(OFST-1,sp),x
1314                     ; 350 		if(adc_value < 200 )//129
1316  0013 1e05          	ldw	x,(OFST-1,sp)
1317  0015 a300c8        	cpw	x,#200
1318  0018 2404          	jruge	L734
1319                     ; 354 			return 1;
1321  001a a601          	ld	a,#1
1323  001c 2009          	jra	L04
1324  001e               L734:
1325                     ; 356 		else if(adc_value < 450 )//394
1327  001e 1e05          	ldw	x,(OFST-1,sp)
1328  0020 a301c2        	cpw	x,#450
1329  0023 2405          	jruge	L344
1330                     ; 360 			return 2;
1332  0025 a602          	ld	a,#2
1334  0027               L04:
1336  0027 5b06          	addw	sp,#6
1337  0029 81            	ret
1338  002a               L344:
1339                     ; 362 		else if(adc_value < 800 )//654
1341  002a 1e05          	ldw	x,(OFST-1,sp)
1342  002c a30320        	cpw	x,#800
1343  002f 2404          	jruge	L744
1344                     ; 366 			return 3;
1346  0031 a603          	ld	a,#3
1348  0033 20f2          	jra	L04
1349  0035               L744:
1350                     ; 368 		else if(adc_value > 800 )
1352  0035 1e05          	ldw	x,(OFST-1,sp)
1353  0037 a30321        	cpw	x,#801
1354  003a 2503          	jrult	L144
1355                     ; 371 			return 0;
1357  003c 4f            	clr	a
1359  003d 20e8          	jra	L04
1360  003f               L144:
1361                     ; 380 		return 0;
1363  003f 4f            	clr	a
1365  0040 20e5          	jra	L04
1419                     ; 383 void get_BATCELL(void)//ok
1419                     ; 384 {
1420                     .text:	section	.text,new
1421  0000               _get_BATCELL:
1423  0000 520c          	subw	sp,#12
1424       0000000c      OFST:	set	12
1427                     ; 386 uint32_t SIG_BAT_LOW  = 3300;//mv
1429  0002 ae0ce4        	ldw	x,#3300
1430  0005 1f03          	ldw	(OFST-9,sp),x
1431  0007 ae0000        	ldw	x,#0
1432  000a 1f01          	ldw	(OFST-11,sp),x
1433                     ; 387 uint32_t SIG_BAT_HIGH = 4200;//mv
1435  000c ae1068        	ldw	x,#4200
1436  000f 1f07          	ldw	(OFST-5,sp),x
1437  0011 ae0000        	ldw	x,#0
1438  0014 1f05          	ldw	(OFST-7,sp),x
1439                     ; 389 power_voltage=ADC_Read_Battery();
1441  0016 cd0000        	call	_ADC_Read_Battery
1443  0019 96            	ldw	x,sp
1444  001a 1c0009        	addw	x,#OFST-3
1445  001d cd0000        	call	c_rtol
1447                     ; 392 	if(power_voltage > SIG_BAT_LOW*3 && power_voltage < SIG_BAT_HIGH*3)
1449  0020 96            	ldw	x,sp
1450  0021 1c0001        	addw	x,#OFST-11
1451  0024 cd0000        	call	c_ltor
1453  0027 a603          	ld	a,#3
1454  0029 cd0000        	call	c_smul
1456  002c 96            	ldw	x,sp
1457  002d 1c0009        	addw	x,#OFST-3
1458  0030 cd0000        	call	c_lcmp
1460  0033 241d          	jruge	L305
1462  0035 96            	ldw	x,sp
1463  0036 1c0005        	addw	x,#OFST-7
1464  0039 cd0000        	call	c_ltor
1466  003c a603          	ld	a,#3
1467  003e cd0000        	call	c_smul
1469  0041 96            	ldw	x,sp
1470  0042 1c0009        	addw	x,#OFST-3
1471  0045 cd0000        	call	c_lcmp
1473  0048 2308          	jrule	L305
1474                     ; 394 		BAT_SSSCELL=3;
1476  004a 35030003      	mov	_BAT_SSSCELL,#3
1478  004e ace000e0      	jpf	L505
1479  0052               L305:
1480                     ; 396 	else if(power_voltage > SIG_BAT_LOW*4 && power_voltage < SIG_BAT_HIGH*4)
1482  0052 96            	ldw	x,sp
1483  0053 1c0001        	addw	x,#OFST-11
1484  0056 cd0000        	call	c_ltor
1486  0059 a602          	ld	a,#2
1487  005b cd0000        	call	c_llsh
1489  005e 96            	ldw	x,sp
1490  005f 1c0009        	addw	x,#OFST-3
1491  0062 cd0000        	call	c_lcmp
1493  0065 241b          	jruge	L705
1495  0067 96            	ldw	x,sp
1496  0068 1c0005        	addw	x,#OFST-7
1497  006b cd0000        	call	c_ltor
1499  006e a602          	ld	a,#2
1500  0070 cd0000        	call	c_llsh
1502  0073 96            	ldw	x,sp
1503  0074 1c0009        	addw	x,#OFST-3
1504  0077 cd0000        	call	c_lcmp
1506  007a 2306          	jrule	L705
1507                     ; 398 		BAT_SSSCELL=4;
1509  007c 35040003      	mov	_BAT_SSSCELL,#4
1511  0080 205e          	jra	L505
1512  0082               L705:
1513                     ; 400 	else if(power_voltage > SIG_BAT_LOW*5 && power_voltage < SIG_BAT_HIGH*5)
1515  0082 96            	ldw	x,sp
1516  0083 1c0001        	addw	x,#OFST-11
1517  0086 cd0000        	call	c_ltor
1519  0089 a605          	ld	a,#5
1520  008b cd0000        	call	c_smul
1522  008e 96            	ldw	x,sp
1523  008f 1c0009        	addw	x,#OFST-3
1524  0092 cd0000        	call	c_lcmp
1526  0095 241b          	jruge	L315
1528  0097 96            	ldw	x,sp
1529  0098 1c0005        	addw	x,#OFST-7
1530  009b cd0000        	call	c_ltor
1532  009e a605          	ld	a,#5
1533  00a0 cd0000        	call	c_smul
1535  00a3 96            	ldw	x,sp
1536  00a4 1c0009        	addw	x,#OFST-3
1537  00a7 cd0000        	call	c_lcmp
1539  00aa 2306          	jrule	L315
1540                     ; 402 		BAT_SSSCELL=5;
1542  00ac 35050003      	mov	_BAT_SSSCELL,#5
1544  00b0 202e          	jra	L505
1545  00b2               L315:
1546                     ; 404 	else if(power_voltage > SIG_BAT_LOW*6 && power_voltage < SIG_BAT_HIGH*6)
1548  00b2 96            	ldw	x,sp
1549  00b3 1c0001        	addw	x,#OFST-11
1550  00b6 cd0000        	call	c_ltor
1552  00b9 a606          	ld	a,#6
1553  00bb cd0000        	call	c_smul
1555  00be 96            	ldw	x,sp
1556  00bf 1c0009        	addw	x,#OFST-3
1557  00c2 cd0000        	call	c_lcmp
1559  00c5 2419          	jruge	L505
1561  00c7 96            	ldw	x,sp
1562  00c8 1c0005        	addw	x,#OFST-7
1563  00cb cd0000        	call	c_ltor
1565  00ce a606          	ld	a,#6
1566  00d0 cd0000        	call	c_smul
1568  00d3 96            	ldw	x,sp
1569  00d4 1c0009        	addw	x,#OFST-3
1570  00d7 cd0000        	call	c_lcmp
1572  00da 2304          	jrule	L505
1573                     ; 406 		BAT_SSSCELL=6;
1575  00dc 35060003      	mov	_BAT_SSSCELL,#6
1576  00e0               L505:
1577                     ; 410 }
1580  00e0 5b0c          	addw	sp,#12
1581  00e2 81            	ret
1619                     ; 412 void LED_show_cell(void)
1619                     ; 413 {
1620                     .text:	section	.text,new
1621  0000               _LED_show_cell:
1623  0000 88            	push	a
1624       00000001      OFST:	set	1
1627                     ; 415 LED1_OFF();LED2_OFF();LED3_OFF();LED4_OFF();LED5_OFF();
1629  0001 4b02          	push	#2
1630  0003 ae500f        	ldw	x,#20495
1631  0006 cd0000        	call	_GPIO_WriteHigh
1633  0009 84            	pop	a
1636  000a 4b20          	push	#32
1637  000c ae500a        	ldw	x,#20490
1638  000f cd0000        	call	_GPIO_WriteHigh
1640  0012 84            	pop	a
1643  0013 4b80          	push	#128
1644  0015 ae500a        	ldw	x,#20490
1645  0018 cd0000        	call	_GPIO_WriteHigh
1647  001b 84            	pop	a
1650  001c 4b08          	push	#8
1651  001e ae500a        	ldw	x,#20490
1652  0021 cd0000        	call	_GPIO_WriteHigh
1654  0024 84            	pop	a
1657  0025 4b10          	push	#16
1658  0027 ae5005        	ldw	x,#20485
1659  002a cd0000        	call	_GPIO_WriteHigh
1661  002d 84            	pop	a
1662                     ; 416 	for ( i = 0; i < BAT_SSSCELL; ++i)
1664  002e 0f01          	clr	(OFST+0,sp)
1666  0030 2044          	jra	L345
1667  0032               L735:
1668                     ; 419 		LED4_ON();//LED5_ON();LED3_ON();
1670  0032 4b08          	push	#8
1671  0034 ae500a        	ldw	x,#20490
1672  0037 cd0000        	call	_GPIO_WriteLow
1674  003a 84            	pop	a
1675                     ; 420 		Delay1ms(500);
1677  003b ae01f4        	ldw	x,#500
1678  003e cd0000        	call	_Delay1ms
1680                     ; 421 		LED1_OFF();LED2_OFF();LED3_OFF();LED4_OFF();LED5_OFF();
1682  0041 4b02          	push	#2
1683  0043 ae500f        	ldw	x,#20495
1684  0046 cd0000        	call	_GPIO_WriteHigh
1686  0049 84            	pop	a
1689  004a 4b20          	push	#32
1690  004c ae500a        	ldw	x,#20490
1691  004f cd0000        	call	_GPIO_WriteHigh
1693  0052 84            	pop	a
1696  0053 4b80          	push	#128
1697  0055 ae500a        	ldw	x,#20490
1698  0058 cd0000        	call	_GPIO_WriteHigh
1700  005b 84            	pop	a
1703  005c 4b08          	push	#8
1704  005e ae500a        	ldw	x,#20490
1705  0061 cd0000        	call	_GPIO_WriteHigh
1707  0064 84            	pop	a
1710  0065 4b10          	push	#16
1711  0067 ae5005        	ldw	x,#20485
1712  006a cd0000        	call	_GPIO_WriteHigh
1714  006d 84            	pop	a
1715                     ; 422 		Delay1ms(500);
1717  006e ae01f4        	ldw	x,#500
1718  0071 cd0000        	call	_Delay1ms
1720                     ; 416 	for ( i = 0; i < BAT_SSSCELL; ++i)
1722  0074 0c01          	inc	(OFST+0,sp)
1723  0076               L345:
1726  0076 7b01          	ld	a,(OFST+0,sp)
1727  0078 b103          	cp	a,_BAT_SSSCELL
1728  007a 25b6          	jrult	L735
1729                     ; 425 }
1732  007c 84            	pop	a
1733  007d 81            	ret
1736                     	bsct
1737  0008               _BATT_LEVER:
1738  0008 00            	dc.b	0
1793                     	switch	.const
1794  0004               L05:
1795  0004 00000ea7      	dc.l	3751
1796  0008               L25:
1797  0008 00000e11      	dc.l	3601
1798  000c               L45:
1799  000c 00000dad      	dc.l	3501
1800  0010               L65:
1801  0010 00000cb3      	dc.l	3251
1802  0014               L06:
1803  0014 00000b55      	dc.l	2901
1804                     ; 429 void SHOW_BATTER(void)//OK
1804                     ; 430 {
1805                     .text:	section	.text,new
1806  0000               _SHOW_BATTER:
1808  0000 5210          	subw	sp,#16
1809       00000010      OFST:	set	16
1812                     ; 432 uint32_t SIG_BAT_LOW  = 3300;//mv
1814  0002 ae0ce4        	ldw	x,#3300
1815  0005 1f07          	ldw	(OFST-9,sp),x
1816  0007 ae0000        	ldw	x,#0
1817  000a 1f05          	ldw	(OFST-11,sp),x
1818                     ; 433 uint32_t SIG_BAT_HIGH = 4200;//mv
1820  000c ae1068        	ldw	x,#4200
1821  000f 1f0b          	ldw	(OFST-5,sp),x
1822  0011 ae0000        	ldw	x,#0
1823  0014 1f09          	ldw	(OFST-7,sp),x
1824                     ; 436 power_voltage=ADC_Read_Battery();
1826  0016 cd0000        	call	_ADC_Read_Battery
1828  0019 96            	ldw	x,sp
1829  001a 1c000d        	addw	x,#OFST-3
1830  001d cd0000        	call	c_rtol
1832                     ; 438 power_voltage = power_voltage / BAT_SSSCELL;
1834  0020 b603          	ld	a,_BAT_SSSCELL
1835  0022 b703          	ld	c_lreg+3,a
1836  0024 3f02          	clr	c_lreg+2
1837  0026 3f01          	clr	c_lreg+1
1838  0028 3f00          	clr	c_lreg
1839  002a 96            	ldw	x,sp
1840  002b 1c0001        	addw	x,#OFST-15
1841  002e cd0000        	call	c_rtol
1843  0031 96            	ldw	x,sp
1844  0032 1c000d        	addw	x,#OFST-3
1845  0035 cd0000        	call	c_ltor
1847  0038 96            	ldw	x,sp
1848  0039 1c0001        	addw	x,#OFST-15
1849  003c cd0000        	call	c_ludv
1851  003f 96            	ldw	x,sp
1852  0040 1c000d        	addw	x,#OFST-3
1853  0043 cd0000        	call	c_rtol
1855                     ; 441 LED1_OFF();LED2_OFF();LED3_OFF();LED4_OFF();LED5_OFF();
1857  0046 4b02          	push	#2
1858  0048 ae500f        	ldw	x,#20495
1859  004b cd0000        	call	_GPIO_WriteHigh
1861  004e 84            	pop	a
1864  004f 4b20          	push	#32
1865  0051 ae500a        	ldw	x,#20490
1866  0054 cd0000        	call	_GPIO_WriteHigh
1868  0057 84            	pop	a
1871  0058 4b80          	push	#128
1872  005a ae500a        	ldw	x,#20490
1873  005d cd0000        	call	_GPIO_WriteHigh
1875  0060 84            	pop	a
1878  0061 4b08          	push	#8
1879  0063 ae500a        	ldw	x,#20490
1880  0066 cd0000        	call	_GPIO_WriteHigh
1882  0069 84            	pop	a
1885  006a 4b10          	push	#16
1886  006c ae5005        	ldw	x,#20485
1887  006f cd0000        	call	_GPIO_WriteHigh
1889  0072 84            	pop	a
1890                     ; 443 if(power_voltage > 3750)//3.8   //36814
1892  0073 96            	ldw	x,sp
1893  0074 1c000d        	addw	x,#OFST-3
1894  0077 cd0000        	call	c_ltor
1896  007a ae0004        	ldw	x,#L05
1897  007d cd0000        	call	c_lcmp
1899  0080 2522          	jrult	L575
1900                     ; 446 LED3_ON();
1902  0082 4b80          	push	#128
1903  0084 ae500a        	ldw	x,#20490
1904  0087 cd0000        	call	_GPIO_WriteLow
1906  008a 84            	pop	a
1907                     ; 447 LED4_ON();
1909  008b 4b08          	push	#8
1910  008d ae500a        	ldw	x,#20490
1911  0090 cd0000        	call	_GPIO_WriteLow
1913  0093 84            	pop	a
1914                     ; 448 LED5_ON();
1916  0094 4b10          	push	#16
1917  0096 ae5005        	ldw	x,#20485
1918  0099 cd0000        	call	_GPIO_WriteLow
1920  009c 84            	pop	a
1921                     ; 449 BATT_LEVER=5;
1923  009d 35050008      	mov	_BATT_LEVER,#5
1925  00a1 cc0123        	jra	L775
1926  00a4               L575:
1927                     ; 451 else if(power_voltage > 3600)  //3.7
1929  00a4 96            	ldw	x,sp
1930  00a5 1c000d        	addw	x,#OFST-3
1931  00a8 cd0000        	call	c_ltor
1933  00ab ae0008        	ldw	x,#L25
1934  00ae cd0000        	call	c_lcmp
1936  00b1 2518          	jrult	L106
1937                     ; 454 LED3_ON();
1939  00b3 4b80          	push	#128
1940  00b5 ae500a        	ldw	x,#20490
1941  00b8 cd0000        	call	_GPIO_WriteLow
1943  00bb 84            	pop	a
1944                     ; 455 LED4_ON();//LED5_ON();
1946  00bc 4b08          	push	#8
1947  00be ae500a        	ldw	x,#20490
1948  00c1 cd0000        	call	_GPIO_WriteLow
1950  00c4 84            	pop	a
1951                     ; 456 BATT_LEVER=4;
1953  00c5 35040008      	mov	_BATT_LEVER,#4
1955  00c9 2058          	jra	L775
1956  00cb               L106:
1957                     ; 458 else if(power_voltage > 3500)  //3.6
1959  00cb 96            	ldw	x,sp
1960  00cc 1c000d        	addw	x,#OFST-3
1961  00cf cd0000        	call	c_ltor
1963  00d2 ae000c        	ldw	x,#L45
1964  00d5 cd0000        	call	c_lcmp
1966  00d8 250f          	jrult	L506
1967                     ; 461 LED3_ON();
1969  00da 4b80          	push	#128
1970  00dc ae500a        	ldw	x,#20490
1971  00df cd0000        	call	_GPIO_WriteLow
1973  00e2 84            	pop	a
1974                     ; 462 BATT_LEVER=3;
1976  00e3 35030008      	mov	_BATT_LEVER,#3
1978  00e7 203a          	jra	L775
1979  00e9               L506:
1980                     ; 464 else if(power_voltage > 3250)  //3.2
1982  00e9 96            	ldw	x,sp
1983  00ea 1c000d        	addw	x,#OFST-3
1984  00ed cd0000        	call	c_ltor
1986  00f0 ae0010        	ldw	x,#L65
1987  00f3 cd0000        	call	c_lcmp
1989  00f6 250f          	jrult	L116
1990                     ; 467 LED2_ON();//LED3_ON();LED4_ON();LED5_ON();
1992  00f8 4b20          	push	#32
1993  00fa ae500a        	ldw	x,#20490
1994  00fd cd0000        	call	_GPIO_WriteLow
1996  0100 84            	pop	a
1997                     ; 468 BATT_LEVER=2;
1999  0101 35020008      	mov	_BATT_LEVER,#2
2001  0105 201c          	jra	L775
2002  0107               L116:
2003                     ; 470 else if(power_voltage <= 2900)  //3.1
2005  0107 96            	ldw	x,sp
2006  0108 1c000d        	addw	x,#OFST-3
2007  010b cd0000        	call	c_ltor
2009  010e ae0014        	ldw	x,#L06
2010  0111 cd0000        	call	c_lcmp
2012  0114 240d          	jruge	L775
2013                     ; 472 LED1_ON();//LED2_ON();LED3_ON();LED4_ON();LED5_ON();
2015  0116 4b02          	push	#2
2016  0118 ae500f        	ldw	x,#20495
2017  011b cd0000        	call	_GPIO_WriteLow
2019  011e 84            	pop	a
2020                     ; 473 BATT_LEVER=1;
2022  011f 35010008      	mov	_BATT_LEVER,#1
2023  0123               L775:
2024                     ; 495 }
2027  0123 5b10          	addw	sp,#16
2028  0125 81            	ret
2106                     	switch	.const
2107  0018               L46:
2108  0018 00004e20      	dc.l	20000
2109  001c               L66:
2110  001c 0000008d      	dc.l	141
2111  0020               L07:
2112  0020 00000bb9      	dc.l	3001
2113  0024               L27:
2114  0024 000003e9      	dc.l	1001
2115                     ; 501 main()
2115                     ; 502 {
2116                     .text:	section	.text,new
2117  0000               _main:
2119  0000 5209          	subw	sp,#9
2120       00000009      OFST:	set	9
2123                     ; 504 uint32_t wwii=0,ttii=0;
2125  0002 ae0000        	ldw	x,#0
2126  0005 1f03          	ldw	(OFST-6,sp),x
2127  0007 ae0000        	ldw	x,#0
2128  000a 1f01          	ldw	(OFST-8,sp),x
2131  000c ae0000        	ldw	x,#0
2132  000f 1f07          	ldw	(OFST-2,sp),x
2133  0011 ae0000        	ldw	x,#0
2134  0014 1f05          	ldw	(OFST-4,sp),x
2135                     ; 514 	Clk_Init();
2137  0016 cd0000        	call	_Clk_Init
2139                     ; 515 	INIT_SYS();
2141  0019 cd0000        	call	_INIT_SYS
2143                     ; 521 	ADC1_DeInit();
2145  001c cd0000        	call	_ADC1_DeInit
2147                     ; 522 	TIM1_DeInit();
2149  001f cd0000        	call	_TIM1_DeInit
2151                     ; 524 	TIMER_Initializes();
2153  0022 cd0000        	call	_TIMER_Initializes
2155                     ; 525 	ADC_INIT();
2157  0025 cd0000        	call	_ADC_INIT
2159                     ; 530 	LED1_OFF();LED2_OFF();LED3_OFF();LED4_OFF();LED5_OFF();
2161  0028 4b02          	push	#2
2162  002a ae500f        	ldw	x,#20495
2163  002d cd0000        	call	_GPIO_WriteHigh
2165  0030 84            	pop	a
2168  0031 4b20          	push	#32
2169  0033 ae500a        	ldw	x,#20490
2170  0036 cd0000        	call	_GPIO_WriteHigh
2172  0039 84            	pop	a
2175  003a 4b80          	push	#128
2176  003c ae500a        	ldw	x,#20490
2177  003f cd0000        	call	_GPIO_WriteHigh
2179  0042 84            	pop	a
2182  0043 4b08          	push	#8
2183  0045 ae500a        	ldw	x,#20490
2184  0048 cd0000        	call	_GPIO_WriteHigh
2186  004b 84            	pop	a
2189  004c 4b10          	push	#16
2190  004e ae5005        	ldw	x,#20485
2191  0051 cd0000        	call	_GPIO_WriteHigh
2193  0054 84            	pop	a
2194                     ; 531 	LED1_ON();LED2_ON();Delay1ms(300);
2196  0055 4b02          	push	#2
2197  0057 ae500f        	ldw	x,#20495
2198  005a cd0000        	call	_GPIO_WriteLow
2200  005d 84            	pop	a
2203  005e 4b20          	push	#32
2204  0060 ae500a        	ldw	x,#20490
2205  0063 cd0000        	call	_GPIO_WriteLow
2207  0066 84            	pop	a
2210  0067 ae012c        	ldw	x,#300
2211  006a cd0000        	call	_Delay1ms
2213                     ; 532 	LED1_OFF();LED2_OFF();LED3_OFF();LED4_OFF();LED5_OFF();
2215  006d 4b02          	push	#2
2216  006f ae500f        	ldw	x,#20495
2217  0072 cd0000        	call	_GPIO_WriteHigh
2219  0075 84            	pop	a
2222  0076 4b20          	push	#32
2223  0078 ae500a        	ldw	x,#20490
2224  007b cd0000        	call	_GPIO_WriteHigh
2226  007e 84            	pop	a
2229  007f 4b80          	push	#128
2230  0081 ae500a        	ldw	x,#20490
2231  0084 cd0000        	call	_GPIO_WriteHigh
2233  0087 84            	pop	a
2236  0088 4b08          	push	#8
2237  008a ae500a        	ldw	x,#20490
2238  008d cd0000        	call	_GPIO_WriteHigh
2240  0090 84            	pop	a
2243  0091 4b10          	push	#16
2244  0093 ae5005        	ldw	x,#20485
2245  0096 cd0000        	call	_GPIO_WriteHigh
2247  0099 84            	pop	a
2248                     ; 541   	get_BATCELL();
2250  009a cd0000        	call	_get_BATCELL
2252                     ; 543   	LED_show_cell();
2254  009d cd0000        	call	_LED_show_cell
2256                     ; 545 	PWM_Init();
2258  00a0 cd0000        	call	_PWM_Init
2260                     ; 547 	nowtime=0;
2262  00a3 ae0000        	ldw	x,#0
2263  00a6 bf16          	ldw	_nowtime+2,x
2264  00a8 ae0000        	ldw	x,#0
2265  00ab bf14          	ldw	_nowtime,x
2266                     ; 548 	poweroff_delay=20000;
2268  00ad ae4e20        	ldw	x,#20000
2269  00b0 bf06          	ldw	_poweroff_delay+2,x
2270  00b2 ae0000        	ldw	x,#0
2271  00b5 bf04          	ldw	_poweroff_delay,x
2272  00b7               L546:
2273                     ; 557 	if(nowtime > moto_ctrl_delay)
2275  00b7 ae0014        	ldw	x,#_nowtime
2276  00ba cd0000        	call	c_ltor
2278  00bd ae0008        	ldw	x,#_moto_ctrl_delay
2279  00c0 cd0000        	call	c_lcmp
2281  00c3 2314          	jrule	L156
2282                     ; 559 		moto_ctrl_delay=nowtime + 50;
2284  00c5 ae0014        	ldw	x,#_nowtime
2285  00c8 cd0000        	call	c_ltor
2287  00cb a632          	ld	a,#50
2288  00cd cd0000        	call	c_ladc
2290  00d0 ae0008        	ldw	x,#_moto_ctrl_delay
2291  00d3 cd0000        	call	c_rtol
2293                     ; 560 		run_moto();
2295  00d6 cd0000        	call	_run_moto
2297  00d9               L156:
2298                     ; 564 	if(moto_dang==0)
2300  00d9 3d02          	tnz	_moto_dang
2301  00db 2664          	jrne	L356
2302                     ; 566 		if(nowtime > poweroff_delay)
2304  00dd ae0014        	ldw	x,#_nowtime
2305  00e0 cd0000        	call	c_ltor
2307  00e3 ae0004        	ldw	x,#_poweroff_delay
2308  00e6 cd0000        	call	c_lcmp
2310  00e9 2368          	jrule	L366
2311                     ; 569 			ADCpower_OFF();
2313  00eb 4b02          	push	#2
2314  00ed ae5000        	ldw	x,#20480
2315  00f0 cd0000        	call	_GPIO_WriteLow
2317  00f3 84            	pop	a
2318                     ; 570 			power2_OFF();
2320  00f4 4b04          	push	#4
2321  00f6 ae5000        	ldw	x,#20480
2322  00f9 cd0000        	call	_GPIO_WriteLow
2324  00fc 84            	pop	a
2325  00fd               L756:
2326                     ; 573 				LED1_OFF(); LED2_OFF(); LED3_OFF(); LED4_OFF(); LED5_OFF();
2328  00fd 4b02          	push	#2
2329  00ff ae500f        	ldw	x,#20495
2330  0102 cd0000        	call	_GPIO_WriteHigh
2332  0105 84            	pop	a
2335  0106 4b20          	push	#32
2336  0108 ae500a        	ldw	x,#20490
2337  010b cd0000        	call	_GPIO_WriteHigh
2339  010e 84            	pop	a
2342  010f 4b80          	push	#128
2343  0111 ae500a        	ldw	x,#20490
2344  0114 cd0000        	call	_GPIO_WriteHigh
2346  0117 84            	pop	a
2349  0118 4b08          	push	#8
2350  011a ae500a        	ldw	x,#20490
2351  011d cd0000        	call	_GPIO_WriteHigh
2353  0120 84            	pop	a
2356  0121 4b10          	push	#16
2357  0123 ae5005        	ldw	x,#20485
2358  0126 cd0000        	call	_GPIO_WriteHigh
2360  0129 84            	pop	a
2361                     ; 574 				Delay1ms(100);
2363  012a ae0064        	ldw	x,#100
2364  012d cd0000        	call	_Delay1ms
2366                     ; 575 				LED2_ON(); //LED3_ON();LED4_ON();LED5_ON();
2368  0130 4b20          	push	#32
2369  0132 ae500a        	ldw	x,#20490
2370  0135 cd0000        	call	_GPIO_WriteLow
2372  0138 84            	pop	a
2373                     ; 576 				Delay1ms(100);
2375  0139 ae0064        	ldw	x,#100
2376  013c cd0000        	call	_Delay1ms
2379  013f 20bc          	jra	L756
2380  0141               L356:
2381                     ; 582 		poweroff_delay = nowtime + 20000;
2383  0141 ae0014        	ldw	x,#_nowtime
2384  0144 cd0000        	call	c_ltor
2386  0147 ae0018        	ldw	x,#L46
2387  014a cd0000        	call	c_ladd
2389  014d ae0004        	ldw	x,#_poweroff_delay
2390  0150 cd0000        	call	c_rtol
2392  0153               L366:
2393                     ; 589 if(nowtime > keysacn_delay)
2395  0153 ae0014        	ldw	x,#_nowtime
2396  0156 cd0000        	call	c_ltor
2398  0159 ae0000        	ldw	x,#_keysacn_delay
2399  015c cd0000        	call	c_lcmp
2401  015f 2203          	jrugt	L47
2402  0161 cc00b7        	jp	L546
2403  0164               L47:
2404                     ; 591 	keysacn_delay = nowtime + 15;
2406  0164 ae0014        	ldw	x,#_nowtime
2407  0167 cd0000        	call	c_ltor
2409  016a a60f          	ld	a,#15
2410  016c cd0000        	call	c_ladc
2412  016f ae0000        	ldw	x,#_keysacn_delay
2413  0172 cd0000        	call	c_rtol
2415                     ; 593 		keymun = ADC_Read_Key();
2417  0175 cd0000        	call	_ADC_Read_Key
2419  0178 6b09          	ld	(OFST+0,sp),a
2420                     ; 595 		if (keymun == 1) //main onoff
2422  017a 7b09          	ld	a,(OFST+0,sp)
2423  017c a101          	cp	a,#1
2424  017e 267b          	jrne	L766
2425                     ; 597 			if(KEY[keymun] < 250 ) KEY[keymun]++;
2427  0180 7b09          	ld	a,(OFST+0,sp)
2428  0182 5f            	clrw	x
2429  0183 97            	ld	xl,a
2430  0184 e604          	ld	a,(_KEY,x)
2431  0186 a1fa          	cp	a,#250
2432  0188 2406          	jruge	L176
2435  018a 7b09          	ld	a,(OFST+0,sp)
2436  018c 5f            	clrw	x
2437  018d 97            	ld	xl,a
2438  018e 6c04          	inc	(_KEY,x)
2439  0190               L176:
2440                     ; 598 			if(KEY[keymun] == 5)
2442  0190 7b09          	ld	a,(OFST+0,sp)
2443  0192 5f            	clrw	x
2444  0193 97            	ld	xl,a
2445  0194 e604          	ld	a,(_KEY,x)
2446  0196 a105          	cp	a,#5
2447  0198 263f          	jrne	L376
2448                     ; 600 				LED1_OFF(); LED2_OFF(); LED3_OFF(); LED4_OFF(); LED5_OFF();
2450  019a 4b02          	push	#2
2451  019c ae500f        	ldw	x,#20495
2452  019f cd0000        	call	_GPIO_WriteHigh
2454  01a2 84            	pop	a
2457  01a3 4b20          	push	#32
2458  01a5 ae500a        	ldw	x,#20490
2459  01a8 cd0000        	call	_GPIO_WriteHigh
2461  01ab 84            	pop	a
2464  01ac 4b80          	push	#128
2465  01ae ae500a        	ldw	x,#20490
2466  01b1 cd0000        	call	_GPIO_WriteHigh
2468  01b4 84            	pop	a
2471  01b5 4b08          	push	#8
2472  01b7 ae500a        	ldw	x,#20490
2473  01ba cd0000        	call	_GPIO_WriteHigh
2475  01bd 84            	pop	a
2478  01be 4b10          	push	#16
2479  01c0 ae5005        	ldw	x,#20485
2480  01c3 cd0000        	call	_GPIO_WriteHigh
2482  01c6 84            	pop	a
2483                     ; 602 				if(moto_dang==0)
2485  01c7 3d02          	tnz	_moto_dang
2486  01c9 2608          	jrne	L576
2487                     ; 604 					moto_dang=2;
2489  01cb 35020002      	mov	_moto_dang,#2
2491  01cf acb700b7      	jpf	L546
2492  01d3               L576:
2493                     ; 608 					moto_dang--;
2495  01d3 3a02          	dec	_moto_dang
2496  01d5 acb700b7      	jpf	L546
2497  01d9               L376:
2498                     ; 613 			else if(KEY[keymun] == 250)
2500  01d9 7b09          	ld	a,(OFST+0,sp)
2501  01db 5f            	clrw	x
2502  01dc 97            	ld	xl,a
2503  01dd e604          	ld	a,(_KEY,x)
2504  01df a1fa          	cp	a,#250
2505  01e1 2703          	jreq	L67
2506  01e3 cc00b7        	jp	L546
2507  01e6               L67:
2508                     ; 615 				LED5_ON();
2510  01e6 4b10          	push	#16
2511  01e8 ae5005        	ldw	x,#20485
2512  01eb cd0000        	call	_GPIO_WriteLow
2514  01ee 84            	pop	a
2515                     ; 616 				moto_dang = 3;
2517  01ef 35030002      	mov	_moto_dang,#3
2518                     ; 618 				moto_power_set = 100;
2520  01f3 35640000      	mov	_moto_power_set,#100
2521  01f7 acb700b7      	jpf	L546
2522  01fb               L766:
2523                     ; 623 		else if (keymun == 2) //onoff2
2525  01fb 7b09          	ld	a,(OFST+0,sp)
2526  01fd a102          	cp	a,#2
2527  01ff 265c          	jrne	L707
2528                     ; 625 			if(KEY[keymun] < 250 ) KEY[keymun]++;
2530  0201 7b09          	ld	a,(OFST+0,sp)
2531  0203 5f            	clrw	x
2532  0204 97            	ld	xl,a
2533  0205 e604          	ld	a,(_KEY,x)
2534  0207 a1fa          	cp	a,#250
2535  0209 2406          	jruge	L117
2538  020b 7b09          	ld	a,(OFST+0,sp)
2539  020d 5f            	clrw	x
2540  020e 97            	ld	xl,a
2541  020f 6c04          	inc	(_KEY,x)
2542  0211               L117:
2543                     ; 626 			if(KEY[keymun] == 5)
2545  0211 7b09          	ld	a,(OFST+0,sp)
2546  0213 5f            	clrw	x
2547  0214 97            	ld	xl,a
2548  0215 e604          	ld	a,(_KEY,x)
2549  0217 a105          	cp	a,#5
2550  0219 2703          	jreq	L001
2551  021b cc00b7        	jp	L546
2552  021e               L001:
2553                     ; 628 				LED1_OFF(); LED2_OFF(); LED3_OFF(); LED4_OFF(); LED5_OFF();
2555  021e 4b02          	push	#2
2556  0220 ae500f        	ldw	x,#20495
2557  0223 cd0000        	call	_GPIO_WriteHigh
2559  0226 84            	pop	a
2562  0227 4b20          	push	#32
2563  0229 ae500a        	ldw	x,#20490
2564  022c cd0000        	call	_GPIO_WriteHigh
2566  022f 84            	pop	a
2569  0230 4b80          	push	#128
2570  0232 ae500a        	ldw	x,#20490
2571  0235 cd0000        	call	_GPIO_WriteHigh
2573  0238 84            	pop	a
2576  0239 4b08          	push	#8
2577  023b ae500a        	ldw	x,#20490
2578  023e cd0000        	call	_GPIO_WriteHigh
2580  0241 84            	pop	a
2583  0242 4b10          	push	#16
2584  0244 ae5005        	ldw	x,#20485
2585  0247 cd0000        	call	_GPIO_WriteHigh
2587  024a 84            	pop	a
2588                     ; 630 				if(moto_dang==0)
2590  024b 3d02          	tnz	_moto_dang
2591  024d 2608          	jrne	L517
2592                     ; 632 					moto_dang=1;
2594  024f 35010002      	mov	_moto_dang,#1
2596  0253 acb700b7      	jpf	L546
2597  0257               L517:
2598                     ; 636 					moto_dang=0;
2600  0257 3f02          	clr	_moto_dang
2601  0259 acb700b7      	jpf	L546
2602  025d               L707:
2603                     ; 640 		else if (keymun == 3) //MAX
2605  025d 7b09          	ld	a,(OFST+0,sp)
2606  025f a103          	cp	a,#3
2607  0261 2660          	jrne	L327
2608                     ; 642 			if(KEY[keymun] < 250 ) KEY[keymun]++;
2610  0263 7b09          	ld	a,(OFST+0,sp)
2611  0265 5f            	clrw	x
2612  0266 97            	ld	xl,a
2613  0267 e604          	ld	a,(_KEY,x)
2614  0269 a1fa          	cp	a,#250
2615  026b 2406          	jruge	L527
2618  026d 7b09          	ld	a,(OFST+0,sp)
2619  026f 5f            	clrw	x
2620  0270 97            	ld	xl,a
2621  0271 6c04          	inc	(_KEY,x)
2622  0273               L527:
2623                     ; 643 			if(KEY[keymun] == 5)
2625  0273 7b09          	ld	a,(OFST+0,sp)
2626  0275 5f            	clrw	x
2627  0276 97            	ld	xl,a
2628  0277 e604          	ld	a,(_KEY,x)
2629  0279 a105          	cp	a,#5
2630  027b 2703          	jreq	L201
2631  027d cc00b7        	jp	L546
2632  0280               L201:
2633                     ; 645 				LED1_OFF(); LED2_OFF(); LED3_OFF(); LED4_OFF(); LED5_OFF();
2635  0280 4b02          	push	#2
2636  0282 ae500f        	ldw	x,#20495
2637  0285 cd0000        	call	_GPIO_WriteHigh
2639  0288 84            	pop	a
2642  0289 4b20          	push	#32
2643  028b ae500a        	ldw	x,#20490
2644  028e cd0000        	call	_GPIO_WriteHigh
2646  0291 84            	pop	a
2649  0292 4b80          	push	#128
2650  0294 ae500a        	ldw	x,#20490
2651  0297 cd0000        	call	_GPIO_WriteHigh
2653  029a 84            	pop	a
2656  029b 4b08          	push	#8
2657  029d ae500a        	ldw	x,#20490
2658  02a0 cd0000        	call	_GPIO_WriteHigh
2660  02a3 84            	pop	a
2663  02a4 4b10          	push	#16
2664  02a6 ae5005        	ldw	x,#20485
2665  02a9 cd0000        	call	_GPIO_WriteHigh
2667  02ac 84            	pop	a
2668                     ; 648 				if(moto_dang==2)
2670  02ad b602          	ld	a,_moto_dang
2671  02af a102          	cp	a,#2
2672  02b1 2608          	jrne	L137
2673                     ; 650 					moto_dang=1;
2675  02b3 35010002      	mov	_moto_dang,#1
2677  02b7 acb700b7      	jpf	L546
2678  02bb               L137:
2679                     ; 654 					moto_dang=2;
2681  02bb 35020002      	mov	_moto_dang,#2
2682  02bf acb700b7      	jpf	L546
2683  02c3               L327:
2684                     ; 658 		else if (keymun == 0)
2686  02c3 0d09          	tnz	(OFST+0,sp)
2687  02c5 2703          	jreq	L401
2688  02c7 cc00b7        	jp	L546
2689  02ca               L401:
2690                     ; 660 			if(KEY[keymun] < 250 ) KEY[keymun]++;
2692  02ca 7b09          	ld	a,(OFST+0,sp)
2693  02cc 5f            	clrw	x
2694  02cd 97            	ld	xl,a
2695  02ce e604          	ld	a,(_KEY,x)
2696  02d0 a1fa          	cp	a,#250
2697  02d2 2406          	jruge	L147
2700  02d4 7b09          	ld	a,(OFST+0,sp)
2701  02d6 5f            	clrw	x
2702  02d7 97            	ld	xl,a
2703  02d8 6c04          	inc	(_KEY,x)
2704  02da               L147:
2705                     ; 661 			if(KEY[keymun] == 10)
2707  02da 7b09          	ld	a,(OFST+0,sp)
2708  02dc 5f            	clrw	x
2709  02dd 97            	ld	xl,a
2710  02de e604          	ld	a,(_KEY,x)
2711  02e0 a10a          	cp	a,#10
2712  02e2 2608          	jrne	L347
2713                     ; 663 				KEY[0]=KEY[1]=KEY[2]=KEY[3]=0;
2715  02e4 3f07          	clr	_KEY+3
2716  02e6 3f06          	clr	_KEY+2
2717  02e8 3f05          	clr	_KEY+1
2718  02ea 3f04          	clr	_KEY
2719  02ec               L347:
2720                     ; 667 		if (ADC_Read_Temperature() < 141)//80度~=141,28度=454
2722  02ec cd0000        	call	_ADC_Read_Temperature
2724  02ef ae001c        	ldw	x,#L66
2725  02f2 cd0000        	call	c_lcmp
2727  02f5 2406          	jruge	L547
2728                     ; 670 			moto_dang=0;
2730  02f7 3f02          	clr	_moto_dang
2732  02f9 acb700b7      	jpf	L546
2733  02fd               L547:
2734                     ; 674 			SHOW_BATTER(); // BATT_LEVER=1~5 //BAT_SSSCELL=3~6
2736  02fd cd0000        	call	_SHOW_BATTER
2738                     ; 675 			if(BATT_LEVER == 1)
2740  0300 b608          	ld	a,_BATT_LEVER
2741  0302 a101          	cp	a,#1
2742  0304 261f          	jrne	L157
2743                     ; 678 				moto_stop_time++;
2745  0306 ae0010        	ldw	x,#_moto_stop_time
2746  0309 a601          	ld	a,#1
2747  030b cd0000        	call	c_lgadc
2749                     ; 679 				if(moto_stop_time > 3000)
2751  030e ae0010        	ldw	x,#_moto_stop_time
2752  0311 cd0000        	call	c_ltor
2754  0314 ae0020        	ldw	x,#L07
2755  0317 cd0000        	call	c_lcmp
2757  031a 2403          	jruge	L601
2758  031c cc00b7        	jp	L546
2759  031f               L601:
2760                     ; 680 				moto_dang=0;
2762  031f 3f02          	clr	_moto_dang
2763  0321 acb700b7      	jpf	L546
2764  0325               L157:
2765                     ; 682 			else if(BATT_LEVER == 2)
2767  0325 b608          	ld	a,_BATT_LEVER
2768  0327 a102          	cp	a,#2
2769  0329 2703          	jreq	L011
2770  032b cc00b7        	jp	L546
2771  032e               L011:
2772                     ; 684 				moto_solw_time++;
2774  032e ae000c        	ldw	x,#_moto_solw_time
2775  0331 a601          	ld	a,#1
2776  0333 cd0000        	call	c_lgadc
2778                     ; 685 				if(moto_solw_time > 1000)
2780  0336 ae000c        	ldw	x,#_moto_solw_time
2781  0339 cd0000        	call	c_ltor
2783  033c ae0024        	ldw	x,#L27
2784  033f cd0000        	call	c_lcmp
2786  0342 2403          	jruge	L211
2787  0344 cc00b7        	jp	L546
2788  0347               L211:
2789                     ; 686 				moto_dang=1;
2791  0347 35010002      	mov	_moto_dang,#1
2792  034b acb700b7      	jpf	L546
2943                     	xdef	_main
2944                     	xdef	_SHOW_BATTER
2945                     	xdef	_BATT_LEVER
2946                     	xdef	_LED_show_cell
2947                     	xdef	_get_BATCELL
2948                     	xdef	_ADC_Read_Key
2949                     	xdef	_ADC_Read_Battery
2950                     	xdef	_ADC_Read_Temperature
2951                     	xdef	_Get_ADCCH_Value
2952                     	xdef	_ADC_INIT
2953                     	xdef	_INIT_SYS
2954                     	xdef	_Clk_Init
2955                     	xdef	_run_moto
2956                     	xdef	_PWM_SET
2957                     	xdef	_PWM_Init
2958                     	xdef	_TIMER_Initializes
2959                     	xdef	_Delay1ms
2960                     	xdef	_Delay
2961                     	xdef	_KEY
2962                     	xdef	_BAT_SSSCELL
2963                     	switch	.ubsct
2964  0000               _keysacn_delay:
2965  0000 00000000      	ds.b	4
2966                     	xdef	_keysacn_delay
2967  0004               _poweroff_delay:
2968  0004 00000000      	ds.b	4
2969                     	xdef	_poweroff_delay
2970  0008               _moto_ctrl_delay:
2971  0008 00000000      	ds.b	4
2972                     	xdef	_moto_ctrl_delay
2973  000c               _moto_solw_time:
2974  000c 00000000      	ds.b	4
2975                     	xdef	_moto_solw_time
2976  0010               _moto_stop_time:
2977  0010 00000000      	ds.b	4
2978                     	xdef	_moto_stop_time
2979  0014               _nowtime:
2980  0014 00000000      	ds.b	4
2981                     	xdef	_nowtime
2982  0018               _offtime:
2983  0018 00000000      	ds.b	4
2984                     	xdef	_offtime
2985                     	xdef	_moto_dang
2986                     	xdef	_moto_power_run
2987                     	xdef	_moto_power_set
2988  001c               _LEDtime:
2989  001c 00            	ds.b	1
2990                     	xdef	_LEDtime
2991  001d               _LEDtype:
2992  001d 00            	ds.b	1
2993                     	xdef	_LEDtype
2994                     	xref	_TIM4_ClearFlag
2995                     	xref	_TIM4_ITConfig
2996                     	xref	_TIM4_Cmd
2997                     	xref	_TIM4_TimeBaseInit
2998                     	xref	_TIM2_OC3PreloadConfig
2999                     	xref	_TIM2_Cmd
3000                     	xref	_TIM2_OC3Init
3001                     	xref	_TIM2_TimeBaseInit
3002                     	xref	_ADC1_ClearFlag
3003                     	xref	_ADC1_GetFlagStatus
3004                     	xref	_ADC1_GetConversionValue
3005                     	xref	_ADC1_Cmd
3006                     	xref	_ADC1_Init
3007                     	xref	_ADC1_DeInit
3008                     	xref	_TIM1_DeInit
3009                     	xref	_GPIO_WriteLow
3010                     	xref	_GPIO_WriteHigh
3011                     	xref	_GPIO_Init
3012                     	xref	_CLK_ClockSecuritySystemEnable
3013                     	xref	_CLK_SYSCLKConfig
3014                     	xref	_CLK_HSIPrescalerConfig
3015                     	xref	_CLK_PeripheralClockConfig
3016                     	xref	_CLK_HSICmd
3017                     	xref	_CLK_DeInit
3018                     	xref.b	c_lreg
3019                     	xref.b	c_x
3039                     	xref	c_lgadc
3040                     	xref	c_ladd
3041                     	xref	c_ladc
3042                     	xref	c_ludv
3043                     	xref	c_llsh
3044                     	xref	c_smul
3045                     	xref	c_lursh
3046                     	xref	c_lmul
3047                     	xref	c_ltor
3048                     	xref	c_rtol
3049                     	xref	c_imul
3050                     	xref	c_lcmp
3051                     	xref	c_uitolx
3052                     	end
