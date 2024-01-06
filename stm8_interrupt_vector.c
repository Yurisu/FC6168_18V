/* BASIC INTERRUPT VECTORS TABLE FOR STM8 devices
 * Copyright (c) 2009 STMicroelectronics
 */

#include "stm8s_it.h"

extern void @near _stext(); /* startup routine */

void @near (* const _vectab[])() =
{
  
  (void @near (*)())0x8200,
  _stext, /* RESET */
  
  (void @near (*)())0x8200,
  TRAP_IRQHandler, /* TRAP - Software interrupt */
  
  (void @near (*)())0x8200,
  TLI_IRQHandler, /* irq0 - External Top Level interrupt (TLI) */
  
  (void @near (*)())0x8200,
  AWU_IRQHandler, /* irq1 - Auto Wake Up from Halt interrupt */

  (void @near (*)())0x8200,
  CLK_IRQHandler, /* irq2 - Clock Controller interrupt */

  (void @near (*)())0x8200,
  EXTI_PORTA_IRQHandler, /* irq3 - External interrupt 0 (GPIOA) */

  (void @near (*)())0x8200,
  EXTI_PORTB_IRQHandler, /* irq4 - External interrupt 1 (GPIOB) */

  (void @near (*)())0x8200,
  EXTI_PORTC_IRQHandler, /* irq5 - External interrupt 2 (GPIOC) */

  (void @near (*)())0x8200,
  EXTI_PORTD_IRQHandler, /* irq6 - External interrupt 3 (GPIOD) */

  (void @near (*)())0x8200,
  EXTI_PORTE_IRQHandler, /* irq7 - External interrupt 4 (GPIOE) */
	
#ifdef STM8S208
  (void @near (*)())0x8200,
  CAN_RX_IRQHandler, /* irq8 - CAN Rx interrupt */

  (void @near (*)())0x8200,
  CAN_TX_IRQHandler, /* irq9 - CAN Tx/ER/SC interrupt */
	
#elif defined (STM8S903)
  (void @near (*)())0x8200,
	EXTI_PORTF_IRQHandler, /* irq8 - External interrupt 5 (GPIOF) */

  (void @near (*)())0x8200,
  NonHandledInterrupt, /* irq9 - Reserved */
#else /*STM8S207, STM8S105 or STM8S103*/
  (void @near (*)())0x8200,
  NonHandledInterrupt, /* irq8 - Reserved */

  (void @near (*)())0x8200,
  NonHandledInterrupt, /* irq9 - Reserved */
#endif /*STM8S208*/

  (void @near (*)())0x8200,
  SPI_IRQHandler, /* irq10 - SPI End of transfer interrupt */

  (void @near (*)())0x8200,
  TIM1_UPD_OVF_TRG_BRK_IRQHandler, /* irq11 - TIM1 Update/Overflow/Trigger/Break interrupt */

  (void @near (*)())0x8200,
  TIM1_CAP_COM_IRQHandler, /* irq12 - TIM1 Capture/Compare interrupt */
  
#ifdef STM8S903
  (void @near (*)())0x8200,
  TIM5_UPD_OVF_BRK_TRG_IRQHandler, /* irq13 - TIM5 Update/Overflow/Break/Trigger interrupt  */

  (void @near (*)())0x8200,
  TIM5_CAP_COM_IRQHandler, /* irq14 - TIM5 Capture/Compare interrupt */
	
#else /*STM8S208, STM8S207, STM8S105 or STM8S103*/
	(void @near (*)())0x8200,
	TIM2_UPD_OVF_BRK_IRQHandler, /* irq13 - TIM2 Update/Overflow/Break interrupt  */

  (void @near (*)())0x8200,
  TIM2_CAP_COM_IRQHandler, /* irq14 - TIM2 Capture/Compare interrupt */
#endif /*STM8S903*/
	
#if defined (STM8S208) || defined(STM8S207) || defined(STM8S105)
  (void @near (*)())0x8200,
  TIM3_UPD_OVF_BRK_IRQHandler, /* irq15 - TIM3 Update/Overflow/Break interrupt */

  (void @near (*)())0x8200,
  TIM3_CAP_COM_IRQHandler, /* irq16 - TIM3 Capture/Compare interrupt */

#else
	(void @near (*)())0x8200,
  NonHandledInterrupt, /* irq15 - Reserved */

  (void @near (*)())0x8200,
  NonHandledInterrupt, /* irq16 - Reserved */
#endif /*STM8S208, STM8S207 or STM8S105*/
	
#ifdef STM8S105
  (void @near (*)())0x8200,
  NonHandledInterrupt, /* irq17 - Reserved */

  (void @near (*)())0x8200,
  NonHandledInterrupt, /* irq18 - Reserved */
#else
	(void @near (*)())0x8200,
  UART1_TX_IRQHandler, /* irq17 - UART1 Tx complete interrupt */
  (void @near (*)())0x8200,
  UART1_RX_IRQHandler, /* irq18 - UART1 Rx interrupt */
#endif /*STM8S105*/

  (void @near (*)())0x8200,
  I2C_IRQHandler, /* irq19 - I2C interrupt */

#if defined(STM8S208) || defined(STM8S207)
	(void @near (*)())0x8200,
  UART3_TX_IRQHandler, /* irq20 - UART3 Tx interrupt */

  (void @near (*)())0x8200,
  UART3_RX_IRQHandler, /* irq21 - UART3 Rx interrupt */
#elif defined (STM8S105)
  (void @near (*)())0x8200,
  UART2_TX_IRQHandler, /* irq20 - UART2 Tx interrupt */

  (void @near (*)())0x8200,
  UART2_RX_IRQHandler, /* irq21 - UART2 Rx interrupt */
#else /* STM8S103, STM8S903 */
	(void @near (*)())0x8200,
  NonHandledInterrupt, /* irq20 - Reserved */

  (void @near (*)())0x8200,
  NonHandledInterrupt, /* irq21 - Reserved */
#endif /* STM8S208, STM8S207 */

#if defined(STM8S208) || defined(STM8S207)
  (void @near (*)())0x8200,
  ADC2_IRQHandler, /* irq22 - ADC2 end of conversion interrupt */
#else /* STM8S105, STM8S103, STM8S903 */
	(void @near (*)())0x8200,
  ADC1_IRQHandler, /* irq22 - ADC1 end of conversion/Analog watchdog interrupts */
#endif /* STM8S208, STM8S207 */

#ifdef STM8S903
  (void @near (*)())0x8200,
  TIM6_UPD_OVF_TRG_IRQHandler, /* irq23 - TIM6 Update/Overflow/Trigger interrupt */
#else
  (void @near (*)())0x8200,
  TIM4_UPD_OVF_IRQHandler, /* irq23 - TIM4 Update/Overflow interrupt */
#endif /*STM8S903*/

	(void @near (*)())0x8200,
  EEPROM_EEC_IRQHandler, /* irq24 - FLASH interrupt */

  (void @near (*)())0x8200,
  NonHandledInterrupt, /* irq25 - Reserved */

  (void @near (*)())0x8200,
  NonHandledInterrupt, /* irq26 - Reserved */

  (void @near (*)())0x8200,
  NonHandledInterrupt, /* irq27 - Reserved */

  (void @near (*)())0x8200,
  NonHandledInterrupt, /* irq28 - Reserved */

  (void @near (*)())0x8200,
  NonHandledInterrupt, /* irq29 - Reserved */

};

/******************* (C) COPYRIGHT 2009 STMicroelectronics *****END OF FILE****/
