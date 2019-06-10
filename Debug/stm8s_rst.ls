   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
 119                     ; 54 FlagStatus RST_GetFlagStatus(RST_Flag_TypeDef RST_Flag)
 119                     ; 55 {
 121                     .text:	section	.text,new
 122  0000               _RST_GetFlagStatus:
 126                     ; 57   assert_param(IS_RST_FLAG_OK(RST_Flag));
 128                     ; 60   return((FlagStatus)(((uint8_t)(RST->SR & RST_Flag) == (uint8_t)0x00) ? RESET : SET));
 130  0000 c450b3        	and	a,20659
 131  0003 2603          	jrne	L6
 132  0005 4f            	clr	a
 133  0006 2002          	jra	L01
 134  0008               L6:
 135  0008 a601          	ld	a,#1
 136  000a               L01:
 139  000a 81            	ret
 174                     ; 69 void RST_ClearFlag(RST_Flag_TypeDef RST_Flag)
 174                     ; 70 {
 175                     .text:	section	.text,new
 176  0000               _RST_ClearFlag:
 180                     ; 72   assert_param(IS_RST_FLAG_OK(RST_Flag));
 182                     ; 74   RST->SR = (uint8_t)RST_Flag;
 184  0000 c750b3        	ld	20659,a
 185                     ; 75 }
 188  0003 81            	ret
 201                     	xdef	_RST_ClearFlag
 202                     	xdef	_RST_GetFlagStatus
 221                     	end
