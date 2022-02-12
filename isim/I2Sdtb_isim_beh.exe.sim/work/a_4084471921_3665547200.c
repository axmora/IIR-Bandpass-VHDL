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
static const char *ng0 = "/home/alexis/Documents/ISE/TesisBPFwI2S/TopDriver.vhd";
extern char *IEEE_P_2592010699;
extern char *IEEE_P_1242562249;

char *ieee_p_1242562249_sub_1006216973935652998_1035706684(char *, char *, char *, char *, int );
unsigned char ieee_p_1242562249_sub_3307759752501467860_1035706684(char *, char *, char *, int );
unsigned char ieee_p_2592010699_sub_3488546069778340532_503743352(char *, unsigned char , unsigned char );
unsigned char ieee_p_2592010699_sub_374109322130769762_503743352(char *, unsigned char );


static void work_a_4084471921_3665547200_p_0(char *t0)
{
    char t17[16];
    char *t1;
    char *t2;
    unsigned char t3;
    unsigned char t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    unsigned char t9;
    unsigned char t10;
    unsigned char t11;
    unsigned char t12;
    char *t13;
    char *t14;
    int t15;
    int t16;
    unsigned int t18;
    unsigned int t19;
    char *t20;
    char *t21;
    char *t22;
    char *t23;

LAB0:    xsi_set_current_line(159, ng0);
    t1 = (t0 + 1192U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)2);
    if (t4 != 0)
        goto LAB2;

LAB4:    t1 = (t0 + 992U);
    t4 = xsi_signal_has_event(t1);
    if (t4 == 1)
        goto LAB7;

LAB8:    t3 = (unsigned char)0;

LAB9:    if (t3 != 0)
        goto LAB5;

LAB6:
LAB3:    t1 = (t0 + 9136);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(160, ng0);
    t1 = (t0 + 9280);
    t5 = (t1 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(161, ng0);
    t1 = (t0 + 9344);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(162, ng0);
    t1 = (t0 + 9408);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);
    goto LAB3;

LAB5:    xsi_set_current_line(164, ng0);
    t2 = (t0 + 2632U);
    t6 = *((char **)t2);
    t11 = *((unsigned char *)t6);
    t12 = ieee_p_2592010699_sub_374109322130769762_503743352(IEEE_P_2592010699, t11);
    t2 = (t0 + 9280);
    t7 = (t2 + 56U);
    t8 = *((char **)t7);
    t13 = (t8 + 56U);
    t14 = *((char **)t13);
    *((unsigned char *)t14) = t12;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(165, ng0);
    t1 = (t0 + 6312U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)3);
    if (t4 != 0)
        goto LAB10;

LAB12:
LAB11:    xsi_set_current_line(168, ng0);
    t1 = (t0 + 5672U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t1 = (t0 + 6152U);
    t5 = *((char **)t1);
    t4 = *((unsigned char *)t5);
    t9 = ieee_p_2592010699_sub_3488546069778340532_503743352(IEEE_P_2592010699, t3, t4);
    t10 = (t9 == (unsigned char)3);
    if (t10 != 0)
        goto LAB13;

LAB15:
LAB14:    xsi_set_current_line(172, ng0);
    t1 = (t0 + 4392U);
    t2 = *((char **)t1);
    t1 = (t0 + 15264U);
    t15 = (4 / 2);
    t16 = (t15 - 1);
    t3 = ieee_p_1242562249_sub_3307759752501467860_1035706684(IEEE_P_1242562249, t2, t1, t16);
    if (t3 != 0)
        goto LAB16;

LAB18:    xsi_set_current_line(175, ng0);
    t1 = xsi_get_transient_memory(1U);
    memset(t1, 0, 1U);
    t2 = t1;
    memset(t2, (unsigned char)2, 1U);
    t5 = (t0 + 9472);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t13 = *((char **)t8);
    memcpy(t13, t1, 1U);
    xsi_driver_first_trans_fast(t5);
    xsi_set_current_line(176, ng0);
    t1 = (t0 + 4232U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = ieee_p_2592010699_sub_374109322130769762_503743352(IEEE_P_2592010699, t3);
    t1 = (t0 + 9536);
    t5 = (t1 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = t4;
    xsi_driver_first_trans_fast(t1);

LAB17:    xsi_set_current_line(179, ng0);
    t1 = (t0 + 3112U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)3);
    if (t4 != 0)
        goto LAB21;

LAB23:
LAB22:    xsi_set_current_line(182, ng0);
    t1 = (t0 + 4712U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)3);
    if (t4 != 0)
        goto LAB24;

LAB26:
LAB25:    xsi_set_current_line(193, ng0);
    t1 = (t0 + 3272U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)3);
    if (t4 != 0)
        goto LAB32;

LAB34:
LAB33:    xsi_set_current_line(196, ng0);
    t1 = (t0 + 5032U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)3);
    if (t4 != 0)
        goto LAB35;

LAB37:
LAB36:    goto LAB3;

LAB7:    t2 = (t0 + 1032U);
    t5 = *((char **)t2);
    t9 = *((unsigned char *)t5);
    t10 = (t9 == (unsigned char)3);
    t3 = t10;
    goto LAB9;

LAB10:    xsi_set_current_line(166, ng0);
    t1 = (t0 + 3432U);
    t5 = *((char **)t1);
    t9 = *((unsigned char *)t5);
    t10 = ieee_p_2592010699_sub_374109322130769762_503743352(IEEE_P_2592010699, t9);
    t1 = (t0 + 9344);
    t6 = (t1 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t13 = *((char **)t8);
    *((unsigned char *)t13) = t10;
    xsi_driver_first_trans_fast(t1);
    goto LAB11;

LAB13:    xsi_set_current_line(169, ng0);
    t1 = (t0 + 9408);
    t6 = (t1 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t13 = *((char **)t8);
    *((unsigned char *)t13) = (unsigned char)3;
    xsi_driver_first_trans_fast(t1);
    goto LAB14;

LAB16:    xsi_set_current_line(173, ng0);
    t5 = (t0 + 4392U);
    t6 = *((char **)t5);
    t5 = (t0 + 15264U);
    t7 = ieee_p_1242562249_sub_1006216973935652998_1035706684(IEEE_P_1242562249, t17, t6, t5, 1);
    t8 = (t17 + 12U);
    t18 = *((unsigned int *)t8);
    t19 = (1U * t18);
    t4 = (1U != t19);
    if (t4 == 1)
        goto LAB19;

LAB20:    t13 = (t0 + 9472);
    t14 = (t13 + 56U);
    t20 = *((char **)t14);
    t21 = (t20 + 56U);
    t22 = *((char **)t21);
    memcpy(t22, t7, 1U);
    xsi_driver_first_trans_fast(t13);
    goto LAB17;

LAB19:    xsi_size_not_matching(1U, t19, 0);
    goto LAB20;

LAB21:    xsi_set_current_line(180, ng0);
    t1 = (t0 + 9600);
    t5 = (t1 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)3;
    xsi_driver_first_trans_fast(t1);
    goto LAB22;

LAB24:    xsi_set_current_line(185, ng0);
    t1 = (t0 + 5192U);
    t5 = *((char **)t1);
    t1 = (t0 + 15280U);
    t15 = (4 - 2);
    t9 = ieee_p_1242562249_sub_3307759752501467860_1035706684(IEEE_P_1242562249, t5, t1, t15);
    if (t9 != 0)
        goto LAB27;

LAB29:    xsi_set_current_line(188, ng0);
    t1 = xsi_get_transient_memory(2U);
    memset(t1, 0, 2U);
    t2 = t1;
    memset(t2, (unsigned char)2, 2U);
    t5 = (t0 + 9664);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t13 = *((char **)t8);
    memcpy(t13, t1, 2U);
    xsi_driver_first_trans_fast(t5);
    xsi_set_current_line(189, ng0);
    t1 = (t0 + 9600);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);

LAB28:    goto LAB25;

LAB27:    xsi_set_current_line(186, ng0);
    t6 = (t0 + 5192U);
    t7 = *((char **)t6);
    t6 = (t0 + 15280U);
    t8 = ieee_p_1242562249_sub_1006216973935652998_1035706684(IEEE_P_1242562249, t17, t7, t6, 1);
    t13 = (t17 + 12U);
    t18 = *((unsigned int *)t13);
    t19 = (1U * t18);
    t10 = (2U != t19);
    if (t10 == 1)
        goto LAB30;

LAB31:    t14 = (t0 + 9664);
    t20 = (t14 + 56U);
    t21 = *((char **)t20);
    t22 = (t21 + 56U);
    t23 = *((char **)t22);
    memcpy(t23, t8, 2U);
    xsi_driver_first_trans_fast(t14);
    goto LAB28;

LAB30:    xsi_size_not_matching(2U, t19, 0);
    goto LAB31;

LAB32:    xsi_set_current_line(194, ng0);
    t1 = (t0 + 9728);
    t5 = (t1 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)3;
    xsi_driver_first_trans_fast(t1);
    goto LAB33;

LAB35:    xsi_set_current_line(199, ng0);
    t1 = (t0 + 5192U);
    t5 = *((char **)t1);
    t1 = (t0 + 15280U);
    t15 = (4 - 2);
    t9 = ieee_p_1242562249_sub_3307759752501467860_1035706684(IEEE_P_1242562249, t5, t1, t15);
    if (t9 != 0)
        goto LAB38;

LAB40:    xsi_set_current_line(202, ng0);
    t1 = xsi_get_transient_memory(2U);
    memset(t1, 0, 2U);
    t2 = t1;
    memset(t2, (unsigned char)2, 2U);
    t5 = (t0 + 9664);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t13 = *((char **)t8);
    memcpy(t13, t1, 2U);
    xsi_driver_first_trans_fast(t5);
    xsi_set_current_line(203, ng0);
    t1 = (t0 + 9728);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);

LAB39:    goto LAB36;

LAB38:    xsi_set_current_line(200, ng0);
    t6 = (t0 + 5192U);
    t7 = *((char **)t6);
    t6 = (t0 + 15280U);
    t8 = ieee_p_1242562249_sub_1006216973935652998_1035706684(IEEE_P_1242562249, t17, t7, t6, 1);
    t13 = (t17 + 12U);
    t18 = *((unsigned int *)t13);
    t19 = (1U * t18);
    t10 = (2U != t19);
    if (t10 == 1)
        goto LAB41;

LAB42:    t14 = (t0 + 9664);
    t20 = (t14 + 56U);
    t21 = *((char **)t20);
    t22 = (t21 + 56U);
    t23 = *((char **)t22);
    memcpy(t23, t8, 2U);
    xsi_driver_first_trans_fast(t14);
    goto LAB39;

LAB41:    xsi_size_not_matching(2U, t19, 0);
    goto LAB42;

}

static void work_a_4084471921_3665547200_p_1(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;

LAB0:    xsi_set_current_line(284, ng0);

LAB3:    t1 = (t0 + 2632U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t1 = (t0 + 9792);
    t4 = (t1 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = t3;
    xsi_driver_first_trans_fast_port(t1);

LAB2:    t8 = (t0 + 9152);
    *((int *)t8) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_4084471921_3665547200_p_2(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;

LAB0:    xsi_set_current_line(285, ng0);

LAB3:    t1 = (t0 + 3432U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t1 = (t0 + 9856);
    t4 = (t1 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = t3;
    xsi_driver_first_trans_fast_port(t1);

LAB2:    t8 = (t0 + 9168);
    *((int *)t8) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_4084471921_3665547200_p_3(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    char *t4;
    unsigned char t5;
    unsigned char t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;

LAB0:    xsi_set_current_line(287, ng0);

LAB3:    t1 = (t0 + 4712U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t1 = (t0 + 3112U);
    t4 = *((char **)t1);
    t5 = *((unsigned char *)t4);
    t6 = ieee_p_2592010699_sub_3488546069778340532_503743352(IEEE_P_2592010699, t3, t5);
    t1 = (t0 + 9920);
    t7 = (t1 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    *((unsigned char *)t10) = t6;
    xsi_driver_first_trans_fast(t1);

LAB2:    t11 = (t0 + 9184);
    *((int *)t11) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_4084471921_3665547200_p_4(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    char *t4;
    unsigned char t5;
    unsigned char t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;

LAB0:    xsi_set_current_line(288, ng0);

LAB3:    t1 = (t0 + 5032U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t1 = (t0 + 3272U);
    t4 = *((char **)t1);
    t5 = *((unsigned char *)t4);
    t6 = ieee_p_2592010699_sub_3488546069778340532_503743352(IEEE_P_2592010699, t3, t5);
    t1 = (t0 + 9984);
    t7 = (t1 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    *((unsigned char *)t10) = t6;
    xsi_driver_first_trans_fast(t1);

LAB2:    t11 = (t0 + 9200);
    *((int *)t11) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}


extern void work_a_4084471921_3665547200_init()
{
	static char *pe[] = {(void *)work_a_4084471921_3665547200_p_0,(void *)work_a_4084471921_3665547200_p_1,(void *)work_a_4084471921_3665547200_p_2,(void *)work_a_4084471921_3665547200_p_3,(void *)work_a_4084471921_3665547200_p_4};
	xsi_register_didat("work_a_4084471921_3665547200", "isim/I2Sdtb_isim_beh.exe.sim/work/a_4084471921_3665547200.didat");
	xsi_register_executes(pe);
}
