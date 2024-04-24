/**
 *  Codasip s.r.o.
 * 
 *  CONFIDENTIAL
 * 
 *  Copyright 2024 Codasip s.r.o.
 * 
 *  All Rights Reserved.
 *  This file is part of the Codasip Studio product. No part of the Studio product, including this
 *  file, may be use, copied, modified, or distributed except in accordance with the terms contained
 *  in Codasip license agreement under which you obtained this file.
 * 
 *  \file
 *  \date    2024-04-23
 *  \author  Codasip (c) HW generator
 *  \version 9.4.2
 *  \brief   Contains module definition of the 'main_t' functional unit.
 */

module main_t(
    input  wire ACT,
    output wire ex1_stage_ACT,
    output wire ex2_stage_ACT,
    output wire ex_coordination_ACT,
    output wire flush_control_ACT,
    output wire id1_stage_ACT,
    output wire id2_stage_ACT,
    output wire id_coordination_ACT,
    output wire if_stage_ACT,
    output wire me1_stage_ACT,
    output wire me2_stage_ACT,
    output wire me_coordination_ACT,
    output wire pipeline_control_ACT,
    output wire wb1_stage_ACT,
    output wire wb2_stage_ACT,
    output wire wb_coordination_ACT
);
    // data-path code:
    // /home/project/superscalar/model/ca/events/ca_main_reset.codal:66:18
    // ex1_stage();
    assign ex1_stage_ACT = (ACT == 1'b1) ? 1'b1 : 1'b0;
    // /home/project/superscalar/model/ca/events/ca_main_reset.codal:67:18
    // ex2_stage();
    assign ex2_stage_ACT = (ACT == 1'b1) ? 1'b1 : 1'b0;
    // /home/project/superscalar/model/ca/events/ca_main_reset.codal:68:24
    // ex_coordination();
    assign ex_coordination_ACT = (ACT == 1'b1) ? 1'b1 : 1'b0;
    // /home/project/superscalar/model/ca/events/ca_main_reset.codal:73:22
    // flush_control();
    assign flush_control_ACT = (ACT == 1'b1) ? 1'b1 : 1'b0;
    // /home/project/superscalar/model/ca/events/ca_main_reset.codal:69:18
    // id1_stage();
    assign id1_stage_ACT = (ACT == 1'b1) ? 1'b1 : 1'b0;
    // /home/project/superscalar/model/ca/events/ca_main_reset.codal:70:18
    // id2_stage();
    assign id2_stage_ACT = (ACT == 1'b1) ? 1'b1 : 1'b0;
    // /home/project/superscalar/model/ca/events/ca_main_reset.codal:71:24
    // id_coordination();
    assign id_coordination_ACT = (ACT == 1'b1) ? 1'b1 : 1'b0;
    // /home/project/superscalar/model/ca/events/ca_main_reset.codal:72:17
    // if_stage();
    assign if_stage_ACT = (ACT == 1'b1) ? 1'b1 : 1'b0;
    // /home/project/superscalar/model/ca/events/ca_main_reset.codal:63:18
    // me1_stage();
    assign me1_stage_ACT = (ACT == 1'b1) ? 1'b1 : 1'b0;
    // /home/project/superscalar/model/ca/events/ca_main_reset.codal:64:18
    // me2_stage();
    assign me2_stage_ACT = (ACT == 1'b1) ? 1'b1 : 1'b0;
    // /home/project/superscalar/model/ca/events/ca_main_reset.codal:65:24
    // me_coordination();
    assign me_coordination_ACT = (ACT == 1'b1) ? 1'b1 : 1'b0;
    // /home/project/superscalar/model/ca/events/ca_main_reset.codal:74:25
    // pipeline_control();
    assign pipeline_control_ACT = (ACT == 1'b1) ? 1'b1 : 1'b0;
    // /home/project/superscalar/model/ca/events/ca_main_reset.codal:61:18
    // wb1_stage();
    assign wb1_stage_ACT = (ACT == 1'b1) ? 1'b1 : 1'b0;
    // /home/project/superscalar/model/ca/events/ca_main_reset.codal:62:18
    // wb2_stage();
    assign wb2_stage_ACT = (ACT == 1'b1) ? 1'b1 : 1'b0;
    // /home/project/superscalar/model/ca/events/ca_main_reset.codal:60:24
    // wb_coordination();
    assign wb_coordination_ACT = (ACT == 1'b1) ? 1'b1 : 1'b0;
endmodule // main_t
