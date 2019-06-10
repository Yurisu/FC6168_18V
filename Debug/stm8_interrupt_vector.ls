   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
  17                     .const:	section	.text
  18  0000               __vectab:
  19  0000 8200          	dc.w	-32256
  21  0002 0000          	dc.w	__stext
  22  0004 8200          	dc.w	-32256
  24  0006 0000          	dc.w	_TRAP_IRQHandler
  25  0008 8200          	dc.w	-32256
  27  000a 0000          	dc.w	_TLI_IRQHandler
  28  000c 8200          	dc.w	-32256
  30  000e 0000          	dc.w	_AWU_IRQHandler
  31  0010 8200          	dc.w	-32256
  33  0012 0000          	dc.w	_CLK_IRQHandler
  34  0014 8200          	dc.w	-32256
  36  0016 0000          	dc.w	_EXTI_PORTA_IRQHandler
  37  0018 8200          	dc.w	-32256
  39  001a 0000          	dc.w	_EXTI_PORTB_IRQHandler
  40  001c 8200          	dc.w	-32256
  42  001e 0000          	dc.w	_EXTI_PORTC_IRQHandler
  43  0020 8200          	dc.w	-32256
  45  0022 0000          	dc.w	_EXTI_PORTD_IRQHandler
  46  0024 8200          	dc.w	-32256
  48  0026 0000          	dc.w	_EXTI_PORTE_IRQHandler
  49  0028 8200          	dc.w	-32256
  51  002a 0000          	dc.w	_NonHandledInterrupt
  52  002c 8200          	dc.w	-32256
  54  002e 0000          	dc.w	_NonHandledInterrupt
  55  0030 8200          	dc.w	-32256
  57  0032 0000          	dc.w	_SPI_IRQHandler
  58  0034 8200          	dc.w	-32256
  60  0036 0000          	dc.w	_TIM1_UPD_OVF_TRG_BRK_IRQHandler
  61  0038 8200          	dc.w	-32256
  63  003a 0000          	dc.w	_TIM1_CAP_COM_IRQHandler
  64  003c 8200          	dc.w	-32256
  66  003e 0000          	dc.w	_TIM2_UPD_OVF_BRK_IRQHandler
  67  0040 8200          	dc.w	-32256
  69  0042 0000          	dc.w	_TIM2_CAP_COM_IRQHandler
  70  0044 8200          	dc.w	-32256
  72  0046 0000          	dc.w	_NonHandledInterrupt
  73  0048 8200          	dc.w	-32256
  75  004a 0000          	dc.w	_NonHandledInterrupt
  76  004c 8200          	dc.w	-32256
  78  004e 0000          	dc.w	_UART1_TX_IRQHandler
  79  0050 8200          	dc.w	-32256
  81  0052 0000          	dc.w	_UART1_RX_IRQHandler
  82  0054 8200          	dc.w	-32256
  84  0056 0000          	dc.w	_I2C_IRQHandler
  85  0058 8200          	dc.w	-32256
  87  005a 0000          	dc.w	_NonHandledInterrupt
  88  005c 8200          	dc.w	-32256
  90  005e 0000          	dc.w	_NonHandledInterrupt
  91  0060 8200          	dc.w	-32256
  93  0062 0000          	dc.w	_ADC1_IRQHandler
  94  0064 8200          	dc.w	-32256
  96  0066 0000          	dc.w	_TIM4_UPD_OVF_IRQHandler
  97  0068 8200          	dc.w	-32256
  99  006a 0000          	dc.w	_EEPROM_EEC_IRQHandler
 100  006c 8200          	dc.w	-32256
 102  006e 0000          	dc.w	_NonHandledInterrupt
 103  0070 8200          	dc.w	-32256
 105  0072 0000          	dc.w	_NonHandledInterrupt
 106  0074 8200          	dc.w	-32256
 108  0076 0000          	dc.w	_NonHandledInterrupt
 109  0078 8200          	dc.w	-32256
 111  007a 0000          	dc.w	_NonHandledInterrupt
 112  007c 8200          	dc.w	-32256
 114  007e 0000          	dc.w	_NonHandledInterrupt
 148                     	xdef	__vectab
 149                     	xref	_EEPROM_EEC_IRQHandler
 150                     	xref	_TIM4_UPD_OVF_IRQHandler
 151                     	xref	_ADC1_IRQHandler
 152                     	xref	_I2C_IRQHandler
 153                     	xref	_UART1_RX_IRQHandler
 154                     	xref	_UART1_TX_IRQHandler
 155                     	xref	_TIM2_CAP_COM_IRQHandler
 156                     	xref	_TIM2_UPD_OVF_BRK_IRQHandler
 157                     	xref	_TIM1_UPD_OVF_TRG_BRK_IRQHandler
 158                     	xref	_TIM1_CAP_COM_IRQHandler
 159                     	xref	_SPI_IRQHandler
 160                     	xref	_EXTI_PORTE_IRQHandler
 161                     	xref	_EXTI_PORTD_IRQHandler
 162                     	xref	_EXTI_PORTC_IRQHandler
 163                     	xref	_EXTI_PORTB_IRQHandler
 164                     	xref	_EXTI_PORTA_IRQHandler
 165                     	xref	_CLK_IRQHandler
 166                     	xref	_AWU_IRQHandler
 167                     	xref	_TLI_IRQHandler
 168                     	xref	_TRAP_IRQHandler
 169                     	xref	_NonHandledInterrupt
 170                     	xref	__stext
 189                     	end
