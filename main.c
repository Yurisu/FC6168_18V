/* MAIN.C file
C:\Program Files (x86)\STMicroelectronics\st_toolset\stvp\
stvp_cmdline -BoardName=ST-LINK -Port=USB -Device=STM8S003F3 -ProgMode=SWIM -no_progData -no_progOption -FileProg="C:\Users\yuri\Documents\STM8\WORK\stm8s������\stm8s_������\Debug\stm8-1.s19"

 * Copyright (c) 2002-2005 STMicroelectronics
������:
np=36814==
pp=4678==
���ϱ�
np=34814
����:
��power=14230~16085==
��MAX=24074==

LED1=D1=���,����Ҫͣ��SWIN
LED2=C7=�͵���_��
LED3=C5=�͵���_��
LED4=C3=�е���_��
LED5=B4=�ߵ���_��
 
 
�����������,����ʱ�����м�ĵƻ���,���Ĵ�������ʶ�𵽵ĵ��cell��.

��ʱ��2��ΪPWM��ʱ��,Ƶ��Ϊ9K(8K����ʱ����е�������)

����������Դ��2.5s����100%ģʽ.�п����յ��.
�̰��л��ߵ͵��Ϳ���

���ֱ��ϵĵ�Դ��,�л��ػ��͵͵�
���ֱ��ϵ�MAX��,�л��͵��͸ߵ�


 */

//#include ��stm8s.h��
//#include "stm8s103f.h"

//#include "iostm8s103f3.h"
#include "stm8s.h"
#include "stm8s_exti.h"
#include "stm8s_adc1.h"
#include "stm8s_gpio.h"
#include "stm8s_awu.h"
#include "stm8s_clk.h"
#include "stm8s_tim2.h"
#include "stm8s_tim4.h"
#include "stm8s_flash.h"
#include "bsp_awu.h"

#define uchar unsigned char
#define uint unsigned int
#define ulong unsigned long


#define MOTO2_OFF() GPIO_WriteLow(GPIOD,GPIO_PIN_4)
#define MOTO2_ON() GPIO_WriteHigh(GPIOD,GPIO_PIN_4)


//moto1=timer2_ch3
#define MOTO1_OFF() GPIO_WriteLow(GPIOA,GPIO_PIN_3)
#define MOTO1_ON() GPIO_WriteHigh(GPIOA,GPIO_PIN_3)

#define ADCpower_ON() 		GPIO_WriteHigh(GPIOA,GPIO_PIN_1)
#define ADCpower_OFF()  	GPIO_WriteLow(GPIOA,GPIO_PIN_1)

#define power2_ON() 		GPIO_WriteHigh(GPIOA,GPIO_PIN_2)
#define power2_OFF()  	GPIO_WriteLow(GPIOA,GPIO_PIN_2)


#define LED1_ON() GPIO_WriteLow(GPIOD,GPIO_PIN_1)
#define LED1_OFF() GPIO_WriteHigh(GPIOD,GPIO_PIN_1)

#define LED2_ON() GPIO_WriteLow(GPIOC,GPIO_PIN_5)
#define LED2_OFF() GPIO_WriteHigh(GPIOC,GPIO_PIN_5)

#define LED3_ON() GPIO_WriteLow(GPIOC,GPIO_PIN_7)
#define LED3_OFF() GPIO_WriteHigh(GPIOC,GPIO_PIN_7)

#define LED4_ON() GPIO_WriteLow(GPIOC,GPIO_PIN_3)
#define LED4_OFF() GPIO_WriteHigh(GPIOC,GPIO_PIN_3)

#define LED5_ON() GPIO_WriteLow(GPIOB,GPIO_PIN_4)
#define LED5_OFF() GPIO_WriteHigh(GPIOB,GPIO_PIN_4)





uint8_t LEDtype,LEDtime;
//��ɫ����,1=��,2=��,3=��,4=��,5=��
//uint8_t LED_flash[5];

//set���õĵ������,runʵ������PWM��ʱ����ռ�ձ�
uint8_t moto_power_set=50,moto_power_run=0;
uint8_t moto_dang=0;


//ex,��ʱ��1ms�ж�һ��
uint32_t offtime,nowtime;

//�����͵������ٻ�ͣ���Ĵ�������
uint32_t moto_stop_time,moto_solw_time;
//���ƻ�����50ms(���ʱ���Ӱ������������ٶ�),�ػ�ʱ��20s,����ɨ������10ms(�������в�ˢ�µ���)
uint32_t moto_ctrl_delay,poweroff_delay,keysacn_delay;
//��������ĵ�ؽ���
uint8_t BAT_SSSCELL=0;
//����ɨ���м�������ʱ��N*10ms
uint8_t 	KEY[4]={0,0,0,0};


void Delay(int time)
{
    volatile unsigned int i;
		while(time--){
			i=5;//300
			while(i--);
		}
}

void Delay1ms(unsigned int time)
{
    //volatile unsigned int i;
		offtime =  0;
		while(offtime < time ){
		}
}

void TIMER_Initializes(void)
{
CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER4,ENABLE);
TIM4_TimeBaseInit(TIM4_PRESCALER_128, 125-1);  //��ʱ1ms (16M/128/125 = 1000)   //128K/32/80=20ms
//TIM4_TimeBaseInit(TIM4_PRESCALER_32, 80-1);  //��ʱ50ms (16M/128/125 = 1000)   //128K/32/80=20ms
TIM4_ClearFlag(TIM4_FLAG_UPDATE);              //�����־λ
TIM4_ITConfig(TIM4_IT_UPDATE, ENABLE);         //ʹ�ܸ���UPDATE�ж�
TIM4_Cmd(ENABLE);  
enableInterrupts();
}

void PWM_Init(void)
{//8K=16M/2/1000
//10K=16M/2/800
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER2,ENABLE);
  TIM2_TimeBaseInit(TIM2_PRESCALER_2, 900-1);
  TIM2_OC3Init(TIM2_OCMODE_PWM1, TIM2_OUTPUTSTATE_ENABLE,0, TIM2_OCPOLARITY_HIGH);//PWM1ģʽ��ʹ��ͨ������ֵ��С���������
  TIM2_OC3PreloadConfig(ENABLE);//ʹ��Ԥװ��
	
  //TIM2_CCxCmd(TIM2_CHANNEL_3, ENABLE); 
  //TIM2_CtrlPWMOutputs(ENABLE);
	
  TIM2_Cmd(ENABLE);//ʹ��TIM2
	enableInterrupts();

}

void PWM_SET(uint16_t pwm)
{//pwm=0~100
	
	if(pwm==0)
{
	  TIM2_OC3Init(TIM2_OCMODE_PWM1, TIM2_OUTPUTSTATE_ENABLE,0, TIM2_OCPOLARITY_HIGH);//PWM1ģʽ��ʹ��ͨ������ֵ��С���������
	  //TIM2_Cmd(DISABLE);//ʹ��TIM2
		MOTO1_OFF();
}
else
{
	//CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER2,ENABLE);
  //TIM2_TimeBaseInit(TIM2_PRESCALER_1, 800-1);
  TIM2_OC3Init(TIM2_OCMODE_PWM1, TIM2_OUTPUTSTATE_ENABLE,pwm*9, TIM2_OCPOLARITY_HIGH);//PWM1ģʽ��ʹ��ͨ������ֵ��С���������
  //TIM2_OC1PreloadConfig(ENABLE);//ʹ��Ԥװ��
	
  //TIM2_CCxCmd(TIM2_CHANNEL_3, ENABLE); 
  //TIM2_CtrlPWMOutputs(ENABLE);
	
  //TIM2_Cmd(ENABLE);//ʹ��TIM2
}
}

//���
void run_moto(void)//50msRUN
{
	if(moto_dang==0)
	{
		moto_power_set=0;
	}
	else if(moto_dang==1)
	{
		if(BAT_SSSCELL==3) moto_power_set=70;
		if(BAT_SSSCELL==4) moto_power_set=55;
		if(BAT_SSSCELL==5) moto_power_set=45;
		if(BAT_SSSCELL==6) moto_power_set=30;
	}
	else if(moto_dang==2)
	{
		if(BAT_SSSCELL==3) moto_power_set=100;
		if(BAT_SSSCELL==4) moto_power_set=90;
		if(BAT_SSSCELL==5) moto_power_set=80;
		if(BAT_SSSCELL==6) moto_power_set=70;
	}

	//������Ҫ����
		if(moto_power_run < moto_power_set)
		{
			moto_power_run++;
			PWM_SET(moto_power_run);
		}
		else
		{
			moto_power_run=moto_power_set;
			PWM_SET(moto_power_run);
		}
}

		


void Clk_Init(void)
{   //��ʼ��ʱ�ӣ�ѡ��ʱ��
CLK_DeInit();//��λʱ�ӼĴ���
CLK_HSICmd(ENABLE);//ʹ���ڲ�����ʱ��
CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV1);//CLK_PRESCALER_CPUDIV2
CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);//�����ڲ�����ʱ��(ʱ�ӷ�Ƶ��:1��Ƶ/16mhz),ϵͳʱ��16MHz
CLK_ClockSecuritySystemEnable();//����ʱ�Ӱ�ȫϵͳ
}

void INIT_SYS(void)
{    //�ر��豸ǰ������ϵͳ��ʱ�ӣ����ж�
// AWU_LSICalibrationConfig(AWU_LSIMeasurement());//У��LSIʱ
//����SWIM
//    CFG->GCR=0x01;//SWD���� ʹ��PD1����IO����		
	GPIO_Init(GPIOA,GPIO_PIN_2,GPIO_MODE_OUT_PP_HIGH_SLOW);//GPIO_MODE_OUT_PP_LOW_SLOW);
	GPIO_Init(GPIOA,GPIO_PIN_3,GPIO_MODE_OUT_PP_LOW_SLOW);//GPIO_MODE_OUT_PP_LOW_SLOW);
//LED1~5
GPIO_Init(GPIOB,GPIO_PIN_4,GPIO_MODE_OUT_PP_HIGH_SLOW);
GPIO_Init(GPIOC,GPIO_PIN_3,GPIO_MODE_OUT_PP_HIGH_SLOW);
GPIO_Init(GPIOC,GPIO_PIN_5,GPIO_MODE_OUT_PP_HIGH_SLOW);
GPIO_Init(GPIOC,GPIO_PIN_7,GPIO_MODE_OUT_PP_HIGH_SLOW);
GPIO_Init(GPIOD,GPIO_PIN_1,GPIO_MODE_OUT_PP_HIGH_SLOW);
//chr_PWM=10K
GPIO_Init(GPIOC,GPIO_PIN_6,GPIO_MODE_OUT_OD_LOW_FAST);
//MOTO 1 ,A3=MOTO1,
GPIO_Init(GPIOA,GPIO_PIN_1,GPIO_MODE_OUT_PP_HIGH_FAST);
//MOTO 2 ,D4=MOTO2,
GPIO_Init(GPIOD,GPIO_PIN_3,GPIO_MODE_OUT_PP_LOW_FAST);
//D2=AD3=��ѹ
//C4=AD2=������
//D5=AD5=�¶�103T
//D6=AD6=����
GPIO_Init(GPIOD,GPIO_PIN_2|GPIO_PIN_3|GPIO_PIN_5|GPIO_PIN_6,GPIO_MODE_IN_FL_NO_IT);
GPIO_Init(GPIOC, GPIO_PIN_4, GPIO_MODE_IN_FL_NO_IT);
}

void ADC_INIT(void)//ok
{
	//ADC_CR1 |= 0x01;    //��ʼ������ʼ����������һ��
	//ADC_CR1 |= 0x20; //ʹ��ת�������жϣ��õĲ�ѯ
  CLK_PeripheralClockConfig(CLK_PERIPHERAL_ADC,ENABLE);
	//ADC1_CONVERSIONMODE_SINGLE, ADC1_CONVERSIONMODE_CONTINUOUS
  ADC1_Init(ADC1_CONVERSIONMODE_CONTINUOUS, ADC1_CHANNEL_6, ADC1_PRESSEL_FCPU_D2, \
            ADC1_EXTTRIG_TIM, DISABLE, ADC1_ALIGN_RIGHT, ADC1_SCHMITTTRIG_ALL,\
            DISABLE);
	//ADC1_ConversionConfig(ADC1_CONVERSIONMODE_CONTINUOUS, ADC1_CHANNEL_6,ADC1_ALIGN_RIGHT);
  ADC1_Cmd(ENABLE);                              //ʹ��ADC

}

uint16_t Get_ADCCH_Value(ADC1_Channel_TypeDef ADC_Channel)//ok
{ 
  ADC1_Init(ADC1_CONVERSIONMODE_CONTINUOUS,ADC_Channel, ADC1_PRESSEL_FCPU_D2,
     ADC1_EXTTRIG_TIM, DISABLE, ADC1_ALIGN_RIGHT, ADC1_SCHMITTTRIG_ALL, DISABLE);



 //ADC1_ConversionConfig(ADC1_CONVERSIONMODE_CONTINUOUS, ADC_Channel,ADC1_ALIGN_RIGHT);

 ADC1_Cmd(ENABLE);     //����ADC

 while(ADC1_GetFlagStatus(ADC1_FLAG_EOC) == RESET);  //�ȴ�ת������
 ADC1_ClearFlag(ADC1_FLAG_EOC);  //���ת��������־



    return ADC1_GetConversionValue(); //����ADC���

}

/*
uint32_t ADC_Read_power(void)//������
{
  uint8_t  i;
  uint16_t adc_value = 0;
  uint32_t adc_voltage = 0;
	
  for(i=0; i<4; i++)
  {
    adc_value += Get_ADCCH_Value(ADC1_CHANNEL_2);       //��ȡת��
  }
  adc_voltage = adc_value / 4 ;//>> 2;                  //��ƽ��
  //adc_voltage = adc_value / 4 ;//>> 2;                  //��ƽ��
  //300m������,ÿ��ADCֵ=?A
  //adc_voltage = (adc_voltage*25265) >> 10;  //vcc=3.35      //
  return adc_voltage;
}
*/

uint32_t ADC_Read_Temperature(void)//28��=454
{
  uint8_t  i;
  uint16_t adc_value = 0;
  uint32_t adc_voltage = 0;
	
  for(i=0; i<4; i++)
  {
    adc_value += Get_ADCCH_Value(ADC1_CHANNEL_5);       //��ȡת��
  }
  adc_voltage = adc_value / 4 ;//>> 2;                  //��ƽ��

	

  return adc_voltage;//80��~=141
}

uint32_t ADC_Read_Battery(void)//OK
{
  uint8_t  i;
  uint16_t adc_value = 0;
  uint32_t adc_voltage = 0;
	


  for(i=0; i<4; i++)
  {
    adc_value += Get_ADCCH_Value(ADC1_CHANNEL_3);       //��ȡת��
		
  }

  adc_voltage = adc_value / 4 ;//>> 2;                  //��ƽ��
  //��ֵ25.8v=ÿ��ADCֵ=25265uV
  adc_voltage = (adc_voltage*24300) >> 10;  //vcc=5v      //
  return adc_voltage;
}

bool ADC_Read_Key(void)//OK
{
  uint8_t  i;
  uint16_t adc_value = 0;
  uint32_t adc_voltage = 0;


 
		adc_value = Get_ADCCH_Value(ADC1_CHANNEL_6);      //��ȡת��
		
		if(adc_value < 200 )//129
		{//����������Դ��
			// KEY[0]++;
			// KEY[1]=KEY[2]=0;
			return 1;
		}
		else if(adc_value < 450 )//394
		{//�����ֱ���Դ��
			// KEY[1]++;
			// KEY[0]=KEY[2]=0;
			return 2;
		}
		else if(adc_value < 800 )//654
		{//�����ֱ�MAX��
			// KEY[2]++;
			// KEY[0]=KEY[1]=0;
			return 3;
		}		
		else if(adc_value > 800 )
		{//û�а���
			//KEY[0]=KEY[1]=KEY[2]=0;
			return 0;
		}	
		//Delay(10);		
  
	
 //  for(i=0; i<4; i++)
 //  {
	// 	if(KEY[i]>5) return i+1;
	// }
		return 0;
}

void get_BATCELL(void)//ok
{
uint32_t power_voltage;
uint32_t SIG_BAT_LOW  = 3300;//mv
uint32_t SIG_BAT_HIGH = 4200;//mv

power_voltage=ADC_Read_Battery();


	if(power_voltage > SIG_BAT_LOW*3 && power_voltage < SIG_BAT_HIGH*3)
	{
		BAT_SSSCELL=3;
	}
	else if(power_voltage > SIG_BAT_LOW*4 && power_voltage < SIG_BAT_HIGH*4)
	{
		BAT_SSSCELL=4;
	}
	else if(power_voltage > SIG_BAT_LOW*5 && power_voltage < SIG_BAT_HIGH*5)
	{
		BAT_SSSCELL=5;
	}
	else if(power_voltage > SIG_BAT_LOW*6 && power_voltage < SIG_BAT_HIGH*6)
	{
		BAT_SSSCELL=6;
	}


}

void LED_show_cell(void)
{
	uint8_t i;
LED1_OFF();LED2_OFF();LED3_OFF();LED4_OFF();LED5_OFF();
	for ( i = 0; i < BAT_SSSCELL; ++i)
	{
		
		LED4_ON();//LED5_ON();LED3_ON();
		Delay1ms(500);
		LED1_OFF();LED2_OFF();LED3_OFF();LED4_OFF();LED5_OFF();
		Delay1ms(500);

	}
}

uint8_t BATT_LEVER=0;

void SHOW_BATTER(void)//OK
{
uint32_t power_voltage;
uint32_t SIG_BAT_LOW  = 3300;//mv
uint32_t SIG_BAT_HIGH = 4200;//mv


power_voltage=ADC_Read_Battery();

power_voltage = power_voltage / BAT_SSSCELL;


LED1_OFF();LED2_OFF();LED3_OFF();LED4_OFF();LED5_OFF();

if(power_voltage > 3750)//3.8   //36814
{
//LED1_ON();LED2_ON();
LED3_ON();
LED4_ON();
LED5_ON();
BATT_LEVER=5;
}
else if(power_voltage > 3600)  //3.7
{
//LED1_ON();LED2_ON();
LED3_ON();
LED4_ON();//LED5_ON();
BATT_LEVER=4;
}
else if(power_voltage > 3500)  //3.6
{
//LED1_ON();
LED3_ON();
BATT_LEVER=3;
}
else if(power_voltage > 3250)  //3.2
{
//LED1_ON();
LED2_ON();//LED3_ON();LED4_ON();LED5_ON();
BATT_LEVER=2;
}
else if(power_voltage <= 2900)  //3.1
{
LED1_ON();//LED2_ON();LED3_ON();LED4_ON();LED5_ON();
BATT_LEVER=1;
/*
MOTO1_OFF();
MOTO2_OFF();

power_voltage=30;//~=10s
while(power_voltage)
{
	power_voltage--;
LED1_ON();
Delay1ms(150);
LED1_OFF();
Delay1ms(200);
}
	ADCpower_OFF();
  power2_OFF();
*/
	
	
}


}





main()
{
uint16_t i;
uint32_t wwii=0,ttii=0;
uint8_t keymun;

	
//����SWIM
//    CFG->GCR=0x01;//SWD���� ʹ��PD1����IO����		

	
	
	
	Clk_Init();
//	INIT_SYS();
//���ֵ�Դ
//ADCpower_ON();
//power2_ON();


//	ADC1_DeInit();
//	TIM1_DeInit();
//	PWM_Init();
//	TIMER_Initializes();
//	ADC_INIT();
	
//	ADC_Read_Battery();	ADC_Read_Battery();	ADC_Read_Battery();
	
	//LED1_ON();Delay1ms(300);
	/*LED3_ON();Delay1ms(300);
	LED1_OFF();LED2_OFF();LED3_OFF();LED4_OFF();LED5_OFF();
	LED4_ON();Delay1ms(300);
	LED1_OFF();LED2_OFF();LED3_OFF();LED4_OFF();LED5_OFF();
	LED5_ON();Delay1ms(300);
	LED1_OFF();LED2_OFF();LED3_OFF();LED4_OFF();LED5_OFF();*/
//	PWM_Init();



  GPIO_Init(GPIOD,GPIO_PIN_3,GPIO_MODE_OUT_PP_LOW_FAST);

//8K=16M/2/1000
//10K=16M/2/800
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER2,ENABLE);
  TIM2_TimeBaseInit(TIM2_PRESCALER_4, 1);
  TIM2_OC2Init(TIM2_OCMODE_PWM1, TIM2_OUTPUTSTATE_ENABLE,1, TIM2_OCPOLARITY_HIGH);//PWM1ģʽ��ʹ��ͨ������ֵ��С���������
  TIM2_OC2PreloadConfig(ENABLE);//ʹ��Ԥװ��
	
  //TIM2_CCxCmd(TIM2_CHANNEL_3, ENABLE); 
  //TIM2_CtrlPWMOutputs(ENABLE);
	
  TIM2_Cmd(ENABLE);//ʹ��TIM2
	enableInterrupts();


	
	//TIM2_OC2Init(TIM2_OCMODE_PWM1, TIM2_OUTPUTSTATE_ENABLE,1, TIM2_OCPOLARITY_HIGH);//PWM1ģʽ��ʹ��ͨ������ֵ��С���������
	
	while(1);
	while (0)
	{
	//LED1_OFF();LED2_OFF();LED3_OFF();LED4_OFF();LED5_OFF();
	//MOTO1_OFF();MOTO2_OFF();
	//Delay1ms(1);


	if(nowtime > moto_ctrl_delay)
	{
		moto_ctrl_delay=nowtime + 50;
		run_moto();
	}
		
		
	if(moto_dang==0)
	{
		if(nowtime > poweroff_delay)
		{
			//guanji
			ADCpower_OFF();
			power2_OFF();
			while(1)
			{
				LED1_OFF(); LED2_OFF(); LED3_OFF(); LED4_OFF(); LED5_OFF();
				Delay1ms(100);
				LED2_ON(); //LED3_ON();LED4_ON();LED5_ON();
				Delay1ms(100);
			}
		}
	}
	else
	{
		poweroff_delay = nowtime + 20000;
	}





if(nowtime > keysacn_delay)
{
	keysacn_delay = nowtime + 15;
	//��ȡ���ƻ�
		keymun = ADC_Read_Key();
			
		if (keymun == 1) //main onoff
		{
			if(KEY[keymun] < 250 ) KEY[keymun]++;
			if(KEY[keymun] == 5)
			{
				LED1_OFF(); LED2_OFF(); LED3_OFF(); LED4_OFF(); LED5_OFF();
				//LED5_ON();
				if(moto_dang==0)
				{
					moto_dang=2;
				}
				else
				{
					moto_dang--;
				}
				//key_release=0;
				//MOTO1_ON();
			}
			else if(KEY[keymun] == 250)
			{
				LED5_ON();
				moto_dang = 3;
				//Delay1ms(1000);
				moto_power_set = 100;
				//PWM_SET(100);
				//KEY[0]++;
			}
		}
		else if (keymun == 2) //onoff2
		{
			if(KEY[keymun] < 250 ) KEY[keymun]++;
			if(KEY[keymun] == 5)
			{
				LED1_OFF(); LED2_OFF(); LED3_OFF(); LED4_OFF(); LED5_OFF();
				//LED4_ON();	
				if(moto_dang==0)
				{
					moto_dang=1;
				}
				else
				{
					moto_dang=0;
				}
			}
		}
		else if (keymun == 3) //MAX
		{
			if(KEY[keymun] < 250 ) KEY[keymun]++;
			if(KEY[keymun] == 5)
			{
				LED1_OFF(); LED2_OFF(); LED3_OFF(); LED4_OFF(); LED5_OFF();
				//LED2_ON();
				//MOTO2_ON();
				if(moto_dang==2)
				{
					moto_dang=1;
				}
				else
				{
					moto_dang=2;
				}
			}
		}
		else if (keymun == 0)
		{
			if(KEY[keymun] < 250 ) KEY[keymun]++;
			if(KEY[keymun] == 10)
			{
				KEY[0]=KEY[1]=KEY[2]=KEY[3]=0;
			}

	//���п��ƻ�
		if (ADC_Read_Temperature() < 141)//80��~=141,28��=454
		{
			//���¸澯297
			moto_dang=0;
		}	
		else
		{
			SHOW_BATTER(); // BATT_LEVER=1~5 //BAT_SSSCELL=3~6
			if(BATT_LEVER == 1)
			{
				//ͣ��
				moto_stop_time++;
				if(moto_stop_time > 3000)
				moto_dang=0;
			}
			else if(BATT_LEVER == 2)
			{
				moto_solw_time++;
				if(moto_solw_time > 1000)
				moto_dang=1;
			}
		}
	}	
	
}

	

}
}

	






