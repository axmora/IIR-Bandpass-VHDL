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

#include "xsi.h"

struct XSI_INFO xsi_info;

char *IEEE_P_2592010699;
char *STD_STANDARD;
char *IEEE_PROPOSED_P_2011092313;
char *IEEE_PROPOSED_P_0892474878;
char *STD_TEXTIO;
char *IEEE_P_1242562249;
char *IEEE_P_3972351953;
char *IEEE_PROPOSED_P_0618294350;


int main(int argc, char **argv)
{
    xsi_init_design(argc, argv);
    xsi_register_info(&xsi_info);

    xsi_register_min_prec_unit(-12);
    ieee_p_2592010699_init();
    ieee_p_1242562249_init();
    ieee_proposed_p_2011092313_init();
    std_textio_init();
    ieee_p_3972351953_init();
    ieee_proposed_p_0892474878_init();
    ieee_proposed_p_0618294350_init();
    work_a_1419919198_3665547200_init();
    work_a_2080076552_3665547200_init();
    work_a_0693137138_3665547200_init();
    work_a_1566835999_3665547200_init();
    work_a_1551404066_3665547200_init();
    work_a_0476090054_3665547200_init();
    work_a_4084471921_3665547200_init();
    work_a_4244145761_2372691052_init();


    xsi_register_tops("work_a_4244145761_2372691052");

    IEEE_P_2592010699 = xsi_get_engine_memory("ieee_p_2592010699");
    xsi_register_ieee_std_logic_1164(IEEE_P_2592010699);
    STD_STANDARD = xsi_get_engine_memory("std_standard");
    IEEE_PROPOSED_P_2011092313 = xsi_get_engine_memory("ieee_proposed_p_2011092313");
    IEEE_PROPOSED_P_0892474878 = xsi_get_engine_memory("ieee_proposed_p_0892474878");
    STD_TEXTIO = xsi_get_engine_memory("std_textio");
    IEEE_P_1242562249 = xsi_get_engine_memory("ieee_p_1242562249");
    IEEE_P_3972351953 = xsi_get_engine_memory("ieee_p_3972351953");
    IEEE_PROPOSED_P_0618294350 = xsi_get_engine_memory("ieee_proposed_p_0618294350");

    return xsi_run_simulation(argc, argv);

}
