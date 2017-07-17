#ifndef __TIMER_H
#define __TIMER_H

#ifndef _TIMER_GLOBAL
#define TIEMR_EXT	extern
#else
#define TIEMR_EXT
#endif

TIEMR_EXT union  FLAG 		Flag1_;
#define Flag1 					Flag1_._flag_byte;
#define f_1ms						Flag1_._flag_bit.bit0
#define f_100ms					Flag1_._flag_bit.bit1
#define f_1s						Flag1_._flag_bit.bit2
TIEMR_EXT uint8_t systime_count2;
TIEMR_EXT uint16_t systime_count;

TIEMR_EXT void TIMER2_Init(void);
TIEMR_EXT void Init_Time4(void);
TIEMR_EXT void Sys_Time_Manage(void);
#ifdef _COSMIC_
@far @interrupt void TIM4InterruptHandle (void);
#else
void TIM4InterruptHandle (void) interrupt 23;
#endif

#ifdef _RAISONANCE_
void Timer2_ISR(void) interrupt 13;
#endif
#ifdef _COSMIC_
@far @interrupt void Timer2_ISR(void);
#endif

#endif