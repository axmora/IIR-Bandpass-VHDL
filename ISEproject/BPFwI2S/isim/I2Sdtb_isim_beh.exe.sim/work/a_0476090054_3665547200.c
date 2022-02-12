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
static const char *ng0 = "/home/alexis/Documents/ISE/TesisBPFwI2S/Float2Fixed.vhd";
extern char *IEEE_PROPOSED_P_0618294350;
extern char *IEEE_PROPOSED_P_0892474878;

char *ieee_proposed_p_0618294350_sub_4612294896994529372_3517329569(char *, char *, char *, char *, int , int );
char *ieee_proposed_p_0618294350_sub_4849566135908593852_3517329569(char *, char *, char *, char *, int , int , unsigned char , unsigned char , unsigned char , unsigned char );
char *ieee_proposed_p_0892474878_sub_16814536788894062381_450259796(char *, char *, char *, char *);


static void work_a_0476090054_3665547200_p_0(char *t0)
{
    char t1[16];
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    int t6;
    char *t7;
    int t8;
    char *t9;
    unsigned int t10;
    unsigned char t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;
    char *t17;

LAB0:    xsi_set_current_line(53, ng0);

LAB3:    t2 = (t0 + 1032U);
    t3 = *((char **)t2);
    t2 = (t0 + 5984U);
    t4 = ((IEEE_PROPOSED_P_0618294350) + 1168U);
    t5 = *((char **)t4);
    t6 = *((int *)t5);
    t4 = ((IEEE_PROPOSED_P_0618294350) + 1288U);
    t7 = *((char **)t4);
    t8 = *((int *)t7);
    t4 = ieee_proposed_p_0618294350_sub_4612294896994529372_3517329569(IEEE_PROPOSED_P_0618294350, t1, t3, t2, t6, t8);
    t9 = (t1 + 12U);
    t10 = *((unsigned int *)t9);
    t10 = (t10 * 1U);
    t11 = (32U != t10);
    if (t11 == 1)
        goto LAB5;

LAB6:    t12 = (t0 + 3832);
    t13 = (t12 + 56U);
    t14 = *((char **)t13);
    t15 = (t14 + 56U);
    t16 = *((char **)t15);
    memcpy(t16, t4, 32U);
    xsi_driver_first_trans_fast(t12);

LAB2:    t17 = (t0 + 3720);
    *((int *)t17) = 1;

LAB1:    return;
LAB4:    goto LAB2;

LAB5:    xsi_size_not_matching(32U, t10, 0);
    goto LAB6;

}

static void work_a_0476090054_3665547200_p_1(char *t0)
{
    char t1[16];
    char *t2;
    char *t3;
    char *t4;
    int t5;
    char *t6;
    char *t7;
    unsigned char t8;
    char *t9;
    unsigned char t10;
    char *t11;
    unsigned char t12;
    char *t13;
    unsigned char t14;
    char *t15;
    unsigned int t16;
    unsigned char t17;
    char *t18;
    char *t19;
    char *t20;
    char *t21;
    char *t22;
    char *t23;

LAB0:    xsi_set_current_line(54, ng0);

LAB3:    t2 = (t0 + 1352U);
    t3 = *((char **)t2);
    t2 = (t0 + 1360U);
    t4 = *((char **)t2);
    t5 = (24 - 1);
    t6 = ((IEEE_PROPOSED_P_0892474878) + 1288U);
    t7 = *((char **)t6);
    t8 = *((unsigned char *)t7);
    t6 = ((IEEE_PROPOSED_P_0892474878) + 1168U);
    t9 = *((char **)t6);
    t10 = *((unsigned char *)t9);
    t6 = ((IEEE_PROPOSED_P_0618294350) + 1648U);
    t11 = *((char **)t6);
    t12 = *((unsigned char *)t11);
    t6 = ((IEEE_PROPOSED_P_0618294350) + 1528U);
    t13 = *((char **)t6);
    t14 = *((unsigned char *)t13);
    t6 = ieee_proposed_p_0618294350_sub_4849566135908593852_3517329569(IEEE_PROPOSED_P_0618294350, t1, t3, t4, t5, 0, t8, t10, t12, t14);
    t15 = (t1 + 12U);
    t16 = *((unsigned int *)t15);
    t16 = (t16 * 1U);
    t17 = (24U != t16);
    if (t17 == 1)
        goto LAB5;

LAB6:    t18 = (t0 + 3896);
    t19 = (t18 + 56U);
    t20 = *((char **)t19);
    t21 = (t20 + 56U);
    t22 = *((char **)t21);
    memcpy(t22, t6, 24U);
    xsi_driver_first_trans_fast(t18);

LAB2:    t23 = (t0 + 3736);
    *((int *)t23) = 1;

LAB1:    return;
LAB4:    goto LAB2;

LAB5:    xsi_size_not_matching(24U, t16, 0);
    goto LAB6;

}

static void work_a_0476090054_3665547200_p_2(char *t0)
{
    char t1[16];
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    unsigned int t6;
    unsigned char t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;

LAB0:    xsi_set_current_line(55, ng0);

LAB3:    t2 = (t0 + 1512U);
    t3 = *((char **)t2);
    t2 = (t0 + 6016U);
    t4 = ieee_proposed_p_0892474878_sub_16814536788894062381_450259796(IEEE_PROPOSED_P_0892474878, t1, t3, t2);
    t5 = (t1 + 12U);
    t6 = *((unsigned int *)t5);
    t6 = (t6 * 1U);
    t7 = (24U != t6);
    if (t7 == 1)
        goto LAB5;

LAB6:    t8 = (t0 + 3960);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    t11 = (t10 + 56U);
    t12 = *((char **)t11);
    memcpy(t12, t4, 24U);
    xsi_driver_first_trans_fast_port(t8);

LAB2:    t13 = (t0 + 3752);
    *((int *)t13) = 1;

LAB1:    return;
LAB4:    goto LAB2;

LAB5:    xsi_size_not_matching(24U, t6, 0);
    goto LAB6;

}


extern void work_a_0476090054_3665547200_init()
{
	static char *pe[] = {(void *)work_a_0476090054_3665547200_p_0,(void *)work_a_0476090054_3665547200_p_1,(void *)work_a_0476090054_3665547200_p_2};
	xsi_register_didat("work_a_0476090054_3665547200", "isim/I2Sdtb_isim_beh.exe.sim/work/a_0476090054_3665547200.didat");
	xsi_register_executes(pe);
}
