/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0xfbc00daa */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "/home/alexis/Documents/ISE/TesisBPFwI2S/I2Stransmitter.vhd";
extern char *IEEE_P_1242562249;
extern char *IEEE_P_2592010699;

char *ieee_p_1242562249_sub_1006216973935652998_1035706684(char *, char *, char *, char *, int );
unsigned char ieee_p_1242562249_sub_3307759752501467860_1035706684(char *, char *, char *, int );
unsigned char ieee_p_1242562249_sub_3307759752501503797_1035706684(char *, char *, char *, int );
unsigned char ieee_p_2592010699_sub_374109322130769762_503743352(char *, unsigned char );


static void work_a_2080076552_3665547200_p_0(char *t0)
{
    char t14[16];
    char t25[16];
    char *t1;
    char *t2;
    unsigned char t3;
    unsigned char t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    unsigned char t10;
    unsigned char t11;
    int t12;
    int t13;
    unsigned int t15;
    unsigned int t16;
    char *t17;
    char *t18;
    char *t19;
    char *t20;
    int t21;
    int t22;
    unsigned int t23;
    unsigned char t24;
    unsigned int t26;
    unsigned char t27;

LAB0:    xsi_set_current_line(71, ng0);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)2);
    if (t4 != 0)
        goto LAB2;

LAB4:    t1 = (t0 + 1152U);
    t4 = xsi_signal_has_event(t1);
    if (t4 == 1)
        goto LAB7;

LAB8:    t3 = (unsigned char)0;

LAB9:    if (t3 != 0)
        goto LAB5;

LAB6:
LAB3:    t1 = (t0 + 5440);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(72, ng0);
    t1 = (t0 + 5552);
    t5 = (t1 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(73, ng0);
    t1 = (t0 + 5616);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(74, ng0);
    t1 = (t0 + 5680);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(75, ng0);
    t1 = xsi_get_transient_memory(24U);
    memset(t1, 0, 24U);
    t2 = t1;
    memset(t2, (unsigned char)2, 24U);
    t5 = (t0 + 5744);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 24U);
    xsi_driver_first_trans_fast(t5);
    xsi_set_current_line(76, ng0);
    t1 = xsi_get_transient_memory(6U);
    memset(t1, 0, 6U);
    t2 = t1;
    memset(t2, (unsigned char)2, 6U);
    t5 = (t0 + 5808);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 6U);
    xsi_driver_first_trans_fast(t5);
    xsi_set_current_line(77, ng0);
    t1 = xsi_get_transient_memory(1U);
    memset(t1, 0, 1U);
    t2 = t1;
    memset(t2, (unsigned char)2, 1U);
    t5 = (t0 + 5872);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 1U);
    xsi_driver_first_trans_fast(t5);
    xsi_set_current_line(78, ng0);
    t1 = (t0 + 5936);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(79, ng0);
    t1 = (t0 + 6000);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);
    goto LAB3;

LAB5:    xsi_set_current_line(81, ng0);
    t2 = (t0 + 5936);
    t6 = (t2 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    *((unsigned char *)t9) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t2);
    xsi_set_current_line(82, ng0);
    t1 = (t0 + 6000);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(84, ng0);
    t1 = (t0 + 3112U);
    t2 = *((char **)t1);
    t1 = (t0 + 9000U);
    t12 = (4 / 2);
    t13 = (t12 - 1);
    t3 = ieee_p_1242562249_sub_3307759752501467860_1035706684(IEEE_P_1242562249, t2, t1, t13);
    if (t3 != 0)
        goto LAB10;

LAB12:    xsi_set_current_line(87, ng0);
    t1 = xsi_get_transient_memory(1U);
    memset(t1, 0, 1U);
    t2 = t1;
    memset(t2, (unsigned char)2, 1U);
    t5 = (t0 + 5872);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 1U);
    xsi_driver_first_trans_fast(t5);
    xsi_set_current_line(88, ng0);
    t1 = (t0 + 2632U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = ieee_p_2592010699_sub_374109322130769762_503743352(IEEE_P_2592010699, t3);
    t1 = (t0 + 5616);
    t5 = (t1 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = t4;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(92, ng0);
    t1 = (t0 + 2952U);
    t2 = *((char **)t1);
    t1 = (t0 + 8984U);
    t12 = (64 - 1);
    t3 = ieee_p_1242562249_sub_3307759752501467860_1035706684(IEEE_P_1242562249, t2, t1, t12);
    if (t3 != 0)
        goto LAB15;

LAB17:    xsi_set_current_line(107, ng0);
    t1 = xsi_get_transient_memory(6U);
    memset(t1, 0, 6U);
    t2 = t1;
    memset(t2, (unsigned char)2, 6U);
    t5 = (t0 + 5808);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 6U);
    xsi_driver_first_trans_fast(t5);
    xsi_set_current_line(108, ng0);
    t1 = (t0 + 2472U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = ieee_p_2592010699_sub_374109322130769762_503743352(IEEE_P_2592010699, t3);
    t1 = (t0 + 5552);
    t5 = (t1 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = t4;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(109, ng0);
    t1 = (t0 + 2472U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)3);
    if (t4 != 0)
        goto LAB36;

LAB38:    xsi_set_current_line(112, ng0);
    t1 = (t0 + 1992U);
    t2 = *((char **)t1);
    t1 = (t0 + 5744);
    t5 = (t1 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    memcpy(t8, t2, 24U);
    xsi_driver_first_trans_fast(t1);

LAB37:
LAB16:
LAB11:    goto LAB3;

LAB7:    t2 = (t0 + 1192U);
    t5 = *((char **)t2);
    t10 = *((unsigned char *)t5);
    t11 = (t10 == (unsigned char)3);
    t3 = t11;
    goto LAB9;

LAB10:    xsi_set_current_line(85, ng0);
    t5 = (t0 + 3112U);
    t6 = *((char **)t5);
    t5 = (t0 + 9000U);
    t7 = ieee_p_1242562249_sub_1006216973935652998_1035706684(IEEE_P_1242562249, t14, t6, t5, 1);
    t8 = (t14 + 12U);
    t15 = *((unsigned int *)t8);
    t16 = (1U * t15);
    t4 = (1U != t16);
    if (t4 == 1)
        goto LAB13;

LAB14:    t9 = (t0 + 5872);
    t17 = (t9 + 56U);
    t18 = *((char **)t17);
    t19 = (t18 + 56U);
    t20 = *((char **)t19);
    memcpy(t20, t7, 1U);
    xsi_driver_first_trans_fast(t9);
    goto LAB11;

LAB13:    xsi_size_not_matching(1U, t16, 0);
    goto LAB14;

LAB15:    xsi_set_current_line(93, ng0);
    t5 = (t0 + 2952U);
    t6 = *((char **)t5);
    t5 = (t0 + 8984U);
    t7 = ieee_p_1242562249_sub_1006216973935652998_1035706684(IEEE_P_1242562249, t14, t6, t5, 1);
    t8 = (t14 + 12U);
    t15 = *((unsigned int *)t8);
    t16 = (1U * t15);
    t4 = (6U != t16);
    if (t4 == 1)
        goto LAB18;

LAB19:    t9 = (t0 + 5808);
    t17 = (t9 + 56U);
    t18 = *((char **)t17);
    t19 = (t18 + 56U);
    t20 = *((char **)t19);
    memcpy(t20, t7, 6U);
    xsi_driver_first_trans_fast(t9);
    xsi_set_current_line(95, ng0);
    t1 = (t0 + 2632U);
    t2 = *((char **)t1);
    t4 = *((unsigned char *)t2);
    t10 = (t4 == (unsigned char)3);
    if (t10 == 1)
        goto LAB23;

LAB24:    t3 = (unsigned char)0;

LAB25:    if (t3 != 0)
        goto LAB20;

LAB22:    t1 = (t0 + 2632U);
    t2 = *((char **)t1);
    t4 = *((unsigned char *)t2);
    t10 = (t4 == (unsigned char)3);
    if (t10 == 1)
        goto LAB30;

LAB31:    t3 = (unsigned char)0;

LAB32:    if (t3 != 0)
        goto LAB28;

LAB29:
LAB21:    goto LAB16;

LAB18:    xsi_size_not_matching(6U, t16, 0);
    goto LAB19;

LAB20:    xsi_set_current_line(96, ng0);
    t6 = (t0 + 2792U);
    t7 = *((char **)t6);
    t21 = (24 - 1);
    t22 = (t21 - 23);
    t15 = (t22 * -1);
    t16 = (1U * t15);
    t23 = (0 + t16);
    t6 = (t7 + t23);
    t24 = *((unsigned char *)t6);
    t8 = (t0 + 5680);
    t9 = (t8 + 56U);
    t17 = *((char **)t9);
    t18 = (t17 + 56U);
    t19 = *((char **)t18);
    *((unsigned char *)t19) = t24;
    xsi_driver_first_trans_fast_port(t8);
    xsi_set_current_line(97, ng0);
    t1 = (t0 + 2792U);
    t2 = *((char **)t1);
    t12 = (24 - 2);
    t15 = (23 - t12);
    t16 = (t15 * 1U);
    t23 = (0 + t16);
    t1 = (t2 + t23);
    t6 = ((IEEE_P_2592010699) + 4000);
    t7 = (t25 + 0U);
    t8 = (t7 + 0U);
    *((int *)t8) = 22;
    t8 = (t7 + 4U);
    *((int *)t8) = 0;
    t8 = (t7 + 8U);
    *((int *)t8) = -1;
    t13 = (0 - 22);
    t26 = (t13 * -1);
    t26 = (t26 + 1);
    t8 = (t7 + 12U);
    *((unsigned int *)t8) = t26;
    t5 = xsi_base_array_concat(t5, t14, t6, (char)97, t1, t25, (char)99, (unsigned char)2, (char)101);
    t26 = (23U + 1U);
    t3 = (24U != t26);
    if (t3 == 1)
        goto LAB26;

LAB27:    t8 = (t0 + 5744);
    t9 = (t8 + 56U);
    t17 = *((char **)t9);
    t18 = (t17 + 56U);
    t19 = *((char **)t18);
    memcpy(t19, t5, 24U);
    xsi_driver_first_trans_fast(t8);
    goto LAB21;

LAB23:    t1 = (t0 + 2952U);
    t5 = *((char **)t1);
    t1 = (t0 + 8984U);
    t12 = (24 * 2);
    t13 = (t12 + 3);
    t11 = ieee_p_1242562249_sub_3307759752501467860_1035706684(IEEE_P_1242562249, t5, t1, t13);
    t3 = t11;
    goto LAB25;

LAB26:    xsi_size_not_matching(24U, t26, 0);
    goto LAB27;

LAB28:    xsi_set_current_line(100, ng0);
    t6 = (t0 + 2472U);
    t7 = *((char **)t6);
    t24 = *((unsigned char *)t7);
    t27 = (t24 == (unsigned char)3);
    if (t27 != 0)
        goto LAB33;

LAB35:    xsi_set_current_line(103, ng0);
    t1 = (t0 + 5936);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t1);

LAB34:    goto LAB21;

LAB30:    t1 = (t0 + 2952U);
    t5 = *((char **)t1);
    t1 = (t0 + 8984U);
    t12 = (24 * 2);
    t13 = (t12 + 3);
    t11 = ieee_p_1242562249_sub_3307759752501503797_1035706684(IEEE_P_1242562249, t5, t1, t13);
    t3 = t11;
    goto LAB32;

LAB33:    xsi_set_current_line(101, ng0);
    t6 = (t0 + 6000);
    t8 = (t6 + 56U);
    t9 = *((char **)t8);
    t17 = (t9 + 56U);
    t18 = *((char **)t17);
    *((unsigned char *)t18) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t6);
    goto LAB34;

LAB36:    xsi_set_current_line(110, ng0);
    t1 = (t0 + 1832U);
    t5 = *((char **)t1);
    t1 = (t0 + 5744);
    t6 = (t1 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t5, 24U);
    xsi_driver_first_trans_fast(t1);
    goto LAB37;

}

static void work_a_2080076552_3665547200_p_1(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;

LAB0:    xsi_set_current_line(120, ng0);

LAB3:    t1 = (t0 + 2472U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t1 = (t0 + 6064);
    t4 = (t1 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = t3;
    xsi_driver_first_trans_fast_port(t1);

LAB2:    t8 = (t0 + 5456);
    *((int *)t8) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_2080076552_3665547200_p_2(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;

LAB0:    xsi_set_current_line(121, ng0);

LAB3:    t1 = (t0 + 2632U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t1 = (t0 + 6128);
    t4 = (t1 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = t3;
    xsi_driver_first_trans_fast_port(t1);

LAB2:    t8 = (t0 + 5472);
    *((int *)t8) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}


extern void work_a_2080076552_3665547200_init()
{
	static char *pe[] = {(void *)work_a_2080076552_3665547200_p_0,(void *)work_a_2080076552_3665547200_p_1,(void *)work_a_2080076552_3665547200_p_2};
	xsi_register_didat("work_a_2080076552_3665547200", "isim/I2Sdtb_isim_beh.exe.sim/work/a_2080076552_3665547200.didat");
	xsi_register_executes(pe);
}
