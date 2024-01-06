/**
  **********************************  STM8S  ***********************************
  * @文件名     ： bsp_awu.h
  * @作者       ： strongerHuang
  * @库版本     ： V2.2.0
  * @文件版本   ： V1.0.0
  * @日期       ： 2017年05月10日
  * @摘要       ： 自动唤醒头文件
  ******************************************************************************/

/* 定义防止递归包含 ----------------------------------------------------------*/
#ifndef _BSP_AWU_H
#define _BSP_AWU_H

/* 包含的头文件 --------------------------------------------------------------*/
#include "stm8s.h"


/* 宏定义 --------------------------------------------------------------------*/

/* 函数申明 ------------------------------------------------------------------*/
uint32_t AWU_LSIMeasurement(void);
//void AWU_Initializes(void);


#endif /* _BSP_AWU_H */

/**** Copyright (C)2017 strongerHuang. All Rights Reserved **** END OF FILE ****/
