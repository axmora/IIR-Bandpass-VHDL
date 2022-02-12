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
static const char *ng0 = "/home/alexis/Documents/ISE/TesisBPFwI2S/I2Sdtb.vhd";
extern char *IEEE_P_2592010699;



static void work_a_4244145761_2372691052_p_0(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    int64 t7;
    int64 t8;

LAB0:    t1 = (t0 + 4904U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(104, ng0);
    t2 = (t0 + 5784);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(105, ng0);
    t2 = (t0 + 3568U);
    t3 = *((char **)t2);
    t7 = *((int64 *)t3);
    t8 = (t7 / 2);
    t2 = (t0 + 4712);
    xsi_process_wait(t2, t8);

LAB6:    *((char **)t1) = &&LAB7;

LAB1:    return;
LAB4:    xsi_set_current_line(106, ng0);
    t2 = (t0 + 5784);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(107, ng0);
    t2 = (t0 + 3568U);
    t3 = *((char **)t2);
    t7 = *((int64 *)t3);
    t8 = (t7 / 2);
    t2 = (t0 + 4712);
    xsi_process_wait(t2, t8);

LAB10:    *((char **)t1) = &&LAB11;
    goto LAB1;

LAB5:    goto LAB4;

LAB7:    goto LAB5;

LAB8:    goto LAB2;

LAB9:    goto LAB8;

LAB11:    goto LAB9;

}

static void work_a_4244145761_2372691052_p_1(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    int64 t4;
    int64 t5;
    int t6;
    unsigned char t7;
    char *t8;
    int t9;
    int t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;

LAB0:    t1 = (t0 + 5152U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(112, ng0);
    t2 = (t0 + 3568U);
    t3 = *((char **)t2);
    t4 = *((int64 *)t3);
    t5 = (t4 / 2);
    t2 = (t0 + 4960);
    xsi_process_wait(t2, t5);

LAB6:    *((char **)t1) = &&LAB7;

LAB1:    return;
LAB4:    xsi_set_current_line(113, ng0);
    t2 = (t0 + 2792U);
    t3 = *((char **)t2);
    t6 = *((int *)t3);
    t7 = (t6 < 255);
    if (t7 != 0)
        goto LAB8;

LAB10:    xsi_set_current_line(116, ng0);
    t2 = (t0 + 5848);
    t3 = (t2 + 56U);
    t8 = *((char **)t3);
    t11 = (t8 + 56U);
    t12 = *((char **)t11);
    *((int *)t12) = 0;
    xsi_driver_first_trans_fast(t2);

LAB9:    xsi_set_current_line(118, ng0);
    t2 = (t0 + 2792U);
    t3 = *((char **)t2);
    t6 = *((int *)t3);
    t7 = (t6 == 6);
    if (t7 != 0)
        goto LAB11;

LAB13:
LAB12:    xsi_set_current_line(122, ng0);
    t2 = (t0 + 3568U);
    t3 = *((char **)t2);
    t4 = *((int64 *)t3);
    t5 = (t4 / 2);
    t2 = (t0 + 4960);
    xsi_process_wait(t2, t5);

LAB16:    *((char **)t1) = &&LAB17;
    goto LAB1;

LAB5:    goto LAB4;

LAB7:    goto LAB5;

LAB8:    xsi_set_current_line(114, ng0);
    t2 = (t0 + 2792U);
    t8 = *((char **)t2);
    t9 = *((int *)t8);
    t10 = (t9 + 1);
    t2 = (t0 + 5848);
    t11 = (t2 + 56U);
    t12 = *((char **)t11);
    t13 = (t12 + 56U);
    t14 = *((char **)t13);
    *((int *)t14) = t10;
    xsi_driver_first_trans_fast(t2);
    goto LAB9;

LAB11:    xsi_set_current_line(119, ng0);
    t2 = (t0 + 5912);
    t8 = (t2 + 56U);
    t11 = *((char **)t8);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    *((unsigned char *)t13) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(120, ng0);
    t2 = (t0 + 2792U);
    t3 = *((char **)t2);
    t6 = *((int *)t3);
    t9 = (t6 + 1);
    t2 = (t0 + 5848);
    t8 = (t2 + 56U);
    t11 = *((char **)t8);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    *((int *)t13) = t9;
    xsi_driver_first_trans_fast(t2);
    goto LAB12;

LAB14:    goto LAB2;

LAB15:    goto LAB14;

LAB17:    goto LAB15;

}

static void work_a_4244145761_2372691052_p_2(char *t0)
{
    char t20[16];
    char t21[16];
    char *t1;
    char *t2;
    char *t3;
    int64 t4;
    int64 t5;
    int t6;
    unsigned char t7;
    char *t8;
    int t9;
    unsigned char t10;
    char *t11;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    char *t15;
    char *t16;
    char *t17;
    char *t18;
    char *t19;
    unsigned int t22;
    char *t23;
    char *t24;
    unsigned char t25;
    int t26;

LAB0:    t1 = (t0 + 5400U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(127, ng0);
    t2 = (t0 + 3568U);
    t3 = *((char **)t2);
    t4 = *((int64 *)t3);
    t5 = (t4 / 2);
    t2 = (t0 + 5208);
    xsi_process_wait(t2, t5);

LAB6:    *((char **)t1) = &&LAB7;

LAB1:    return;
LAB4:    xsi_set_current_line(128, ng0);
    t2 = (t0 + 2792U);
    t3 = *((char **)t2);
    t6 = *((int *)t3);
    t7 = (t6 < 6);
    if (t7 != 0)
        goto LAB8;

LAB10:    t2 = (t0 + 2792U);
    t3 = *((char **)t2);
    t6 = *((int *)t3);
    t7 = (t6 == 6);
    if (t7 != 0)
        goto LAB24;

LAB25:
LAB9:    xsi_set_current_line(147, ng0);
    t2 = (t0 + 2952U);
    t3 = *((char **)t2);
    t7 = *((unsigned char *)t3);
    t10 = (t7 == (unsigned char)3);
    if (t10 != 0)
        goto LAB28;

LAB30:
LAB29:    xsi_set_current_line(156, ng0);
    t2 = (t0 + 3568U);
    t3 = *((char **)t2);
    t4 = *((int64 *)t3);
    t5 = (t4 / 2);
    t2 = (t0 + 5208);
    xsi_process_wait(t2, t5);

LAB38:    *((char **)t1) = &&LAB39;
    goto LAB1;

LAB5:    goto LAB4;

LAB7:    goto LAB5;

LAB8:    xsi_set_current_line(129, ng0);
    t2 = (t0 + 3272U);
    t8 = *((char **)t2);
    t9 = *((int *)t8);
    t10 = (t9 == 0);
    if (t10 != 0)
        goto LAB11;

LAB13:    t2 = (t0 + 3272U);
    t3 = *((char **)t2);
    t6 = *((int *)t3);
    t7 = (t6 == 1);
    if (t7 != 0)
        goto LAB14;

LAB15:    t2 = (t0 + 3272U);
    t3 = *((char **)t2);
    t6 = *((int *)t3);
    t7 = (t6 == 2);
    if (t7 != 0)
        goto LAB16;

LAB17:    t2 = (t0 + 3272U);
    t3 = *((char **)t2);
    t6 = *((int *)t3);
    t7 = (t6 == 3);
    if (t7 != 0)
        goto LAB18;

LAB19:    t2 = (t0 + 3272U);
    t3 = *((char **)t2);
    t6 = *((int *)t3);
    t7 = (t6 == 4);
    if (t7 != 0)
        goto LAB20;

LAB21:    t2 = (t0 + 3272U);
    t3 = *((char **)t2);
    t6 = *((int *)t3);
    t7 = (t6 == 5);
    if (t7 != 0)
        goto LAB22;

LAB23:
LAB12:    goto LAB9;

LAB11:    xsi_set_current_line(130, ng0);
    t2 = (t0 + 3688U);
    t11 = *((char **)t2);
    t12 = (23 - 23);
    t13 = (t12 * 1U);
    t14 = (0 + t13);
    t2 = (t11 + t14);
    t15 = (t0 + 5976);
    t16 = (t15 + 56U);
    t17 = *((char **)t16);
    t18 = (t17 + 56U);
    t19 = *((char **)t18);
    memcpy(t19, t2, 24U);
    xsi_driver_first_trans_fast(t15);
    goto LAB12;

LAB14:    xsi_set_current_line(132, ng0);
    t2 = (t0 + 3688U);
    t8 = *((char **)t2);
    t12 = (23 - 23);
    t13 = (t12 * 1U);
    t14 = (0 + t13);
    t2 = (t8 + t14);
    t11 = (t0 + 5976);
    t15 = (t11 + 56U);
    t16 = *((char **)t15);
    t17 = (t16 + 56U);
    t18 = *((char **)t17);
    memcpy(t18, t2, 24U);
    xsi_driver_first_trans_fast(t11);
    goto LAB12;

LAB16:    xsi_set_current_line(134, ng0);
    t2 = (t0 + 3808U);
    t8 = *((char **)t2);
    t12 = (23 - 23);
    t13 = (t12 * 1U);
    t14 = (0 + t13);
    t2 = (t8 + t14);
    t11 = (t0 + 5976);
    t15 = (t11 + 56U);
    t16 = *((char **)t15);
    t17 = (t16 + 56U);
    t18 = *((char **)t17);
    memcpy(t18, t2, 24U);
    xsi_driver_first_trans_fast(t11);
    goto LAB12;

LAB18:    xsi_set_current_line(136, ng0);
    t2 = (t0 + 3808U);
    t8 = *((char **)t2);
    t12 = (23 - 23);
    t13 = (t12 * 1U);
    t14 = (0 + t13);
    t2 = (t8 + t14);
    t11 = (t0 + 5976);
    t15 = (t11 + 56U);
    t16 = *((char **)t15);
    t17 = (t16 + 56U);
    t18 = *((char **)t17);
    memcpy(t18, t2, 24U);
    xsi_driver_first_trans_fast(t11);
    goto LAB12;

LAB20:    xsi_set_current_line(138, ng0);
    t2 = (t0 + 3928U);
    t8 = *((char **)t2);
    t12 = (23 - 23);
    t13 = (t12 * 1U);
    t14 = (0 + t13);
    t2 = (t8 + t14);
    t11 = (t0 + 5976);
    t15 = (t11 + 56U);
    t16 = *((char **)t15);
    t17 = (t16 + 56U);
    t18 = *((char **)t17);
    memcpy(t18, t2, 24U);
    xsi_driver_first_trans_fast(t11);
    goto LAB12;

LAB22:    xsi_set_current_line(140, ng0);
    t2 = (t0 + 3928U);
    t8 = *((char **)t2);
    t12 = (23 - 23);
    t13 = (t12 * 1U);
    t14 = (0 + t13);
    t2 = (t8 + t14);
    t11 = (t0 + 5976);
    t15 = (t11 + 56U);
    t16 = *((char **)t15);
    t17 = (t16 + 56U);
    t18 = *((char **)t17);
    memcpy(t18, t2, 24U);
    xsi_driver_first_trans_fast(t11);
    goto LAB12;

LAB24:    xsi_set_current_line(143, ng0);
    t2 = (t0 + 2632U);
    t8 = *((char **)t2);
    t12 = (23 - 22);
    t13 = (t12 * 1U);
    t14 = (0 + t13);
    t2 = (t8 + t14);
    t15 = ((IEEE_P_2592010699) + 4000);
    t16 = (t21 + 0U);
    t17 = (t16 + 0U);
    *((int *)t17) = 22;
    t17 = (t16 + 4U);
    *((int *)t17) = 0;
    t17 = (t16 + 8U);
    *((int *)t17) = -1;
    t9 = (0 - 22);
    t22 = (t9 * -1);
    t22 = (t22 + 1);
    t17 = (t16 + 12U);
    *((unsigned int *)t17) = t22;
    t11 = xsi_base_array_concat(t11, t20, t15, (char)97, t2, t21, (char)99, (unsigned char)2, (char)101);
    t22 = (23U + 1U);
    t10 = (24U != t22);
    if (t10 == 1)
        goto LAB26;

LAB27:    t17 = (t0 + 5976);
    t18 = (t17 + 56U);
    t19 = *((char **)t18);
    t23 = (t19 + 56U);
    t24 = *((char **)t23);
    memcpy(t24, t11, 24U);
    xsi_driver_first_trans_fast(t17);
    xsi_set_current_line(144, ng0);
    t2 = (t0 + 2632U);
    t3 = *((char **)t2);
    t6 = (23 - 23);
    t12 = (t6 * -1);
    t13 = (1U * t12);
    t14 = (0 + t13);
    t2 = (t3 + t14);
    t7 = *((unsigned char *)t2);
    t8 = (t0 + 6040);
    t11 = (t8 + 56U);
    t15 = *((char **)t11);
    t16 = (t15 + 56U);
    t17 = *((char **)t16);
    *((unsigned char *)t17) = t7;
    xsi_driver_first_trans_fast(t8);
    xsi_set_current_line(145, ng0);
    t2 = (t0 + 3272U);
    t3 = *((char **)t2);
    t6 = *((int *)t3);
    t9 = (t6 + 1);
    t2 = (t0 + 6104);
    t8 = (t2 + 56U);
    t11 = *((char **)t8);
    t15 = (t11 + 56U);
    t16 = *((char **)t15);
    *((int *)t16) = t9;
    xsi_driver_first_trans_fast(t2);
    goto LAB9;

LAB26:    xsi_size_not_matching(24U, t22, 0);
    goto LAB27;

LAB28:    xsi_set_current_line(148, ng0);
    t2 = (t0 + 3112U);
    t8 = *((char **)t2);
    t6 = *((int *)t8);
    t25 = (t6 < 7);
    if (t25 != 0)
        goto LAB31;

LAB33:    xsi_set_current_line(151, ng0);
    t2 = (t0 + 6168);
    t3 = (t2 + 56U);
    t8 = *((char **)t3);
    t11 = (t8 + 56U);
    t15 = *((char **)t11);
    *((int *)t15) = 0;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(152, ng0);
    t2 = (t0 + 2632U);
    t3 = *((char **)t2);
    t12 = (23 - 22);
    t13 = (t12 * 1U);
    t14 = (0 + t13);
    t2 = (t3 + t14);
    t11 = ((IEEE_P_2592010699) + 4000);
    t15 = (t21 + 0U);
    t16 = (t15 + 0U);
    *((int *)t16) = 22;
    t16 = (t15 + 4U);
    *((int *)t16) = 0;
    t16 = (t15 + 8U);
    *((int *)t16) = -1;
    t6 = (0 - 22);
    t22 = (t6 * -1);
    t22 = (t22 + 1);
    t16 = (t15 + 12U);
    *((unsigned int *)t16) = t22;
    t8 = xsi_base_array_concat(t8, t20, t11, (char)97, t2, t21, (char)99, (unsigned char)2, (char)101);
    t22 = (23U + 1U);
    t7 = (24U != t22);
    if (t7 == 1)
        goto LAB34;

LAB35:    t16 = (t0 + 5976);
    t17 = (t16 + 56U);
    t18 = *((char **)t17);
    t19 = (t18 + 56U);
    t23 = *((char **)t19);
    memcpy(t23, t8, 24U);
    xsi_driver_first_trans_fast(t16);
    xsi_set_current_line(153, ng0);
    t2 = (t0 + 2632U);
    t3 = *((char **)t2);
    t6 = (23 - 23);
    t12 = (t6 * -1);
    t13 = (1U * t12);
    t14 = (0 + t13);
    t2 = (t3 + t14);
    t7 = *((unsigned char *)t2);
    t8 = (t0 + 6040);
    t11 = (t8 + 56U);
    t15 = *((char **)t11);
    t16 = (t15 + 56U);
    t17 = *((char **)t16);
    *((unsigned char *)t17) = t7;
    xsi_driver_first_trans_fast(t8);

LAB32:    goto LAB29;

LAB31:    xsi_set_current_line(149, ng0);
    t2 = (t0 + 3112U);
    t11 = *((char **)t2);
    t9 = *((int *)t11);
    t26 = (t9 + 1);
    t2 = (t0 + 6168);
    t15 = (t2 + 56U);
    t16 = *((char **)t15);
    t17 = (t16 + 56U);
    t18 = *((char **)t17);
    *((int *)t18) = t26;
    xsi_driver_first_trans_fast(t2);
    goto LAB32;

LAB34:    xsi_size_not_matching(24U, t22, 0);
    goto LAB35;

LAB36:    goto LAB2;

LAB37:    goto LAB36;

LAB39:    goto LAB37;

}


extern void work_a_4244145761_2372691052_init()
{
	static char *pe[] = {(void *)work_a_4244145761_2372691052_p_0,(void *)work_a_4244145761_2372691052_p_1,(void *)work_a_4244145761_2372691052_p_2};
	xsi_register_didat("work_a_4244145761_2372691052", "isim/I2Sdtb_isim_beh.exe.sim/work/a_4244145761_2372691052.didat");
	xsi_register_executes(pe);
}
