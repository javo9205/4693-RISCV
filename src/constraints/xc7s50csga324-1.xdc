# clk input is from the 100 MHz oscillator on Boolean board
#create_clock -period 10.000 -name gclk [get_ports clk_100MHz]
set_property -dict {PACKAGE_PIN F14 IOSTANDARD LVCMOS33} [get_ports {CLK}];

## Set Bank 0 voltage
#set_property CFGBVS VCCO [current_design]
#set_property CONFIG_VOLTAGE 3.3 [current_design]

## On-board Slide Switches
set_property -dict {PACKAGE_PIN V2 IOSTANDARD LVCMOS33} [get_ports {SW[0]}];
set_property -dict {PACKAGE_PIN U2 IOSTANDARD LVCMOS33} [get_ports {SW[1]}];
set_property -dict {PACKAGE_PIN U1 IOSTANDARD LVCMOS33} [get_ports {SW[2]}];
set_property -dict {PACKAGE_PIN T2 IOSTANDARD LVCMOS33} [get_ports {SW[3]}];
set_property -dict {PACKAGE_PIN T1 IOSTANDARD LVCMOS33} [get_ports {SW[4]}];
set_property -dict {PACKAGE_PIN R2 IOSTANDARD LVCMOS33} [get_ports {SW[5]}];
set_property -dict {PACKAGE_PIN R1 IOSTANDARD LVCMOS33} [get_ports {SW[6]}];
set_property -dict {PACKAGE_PIN P2 IOSTANDARD LVCMOS33} [get_ports {SW[7]}];
set_property -dict {PACKAGE_PIN P1 IOSTANDARD LVCMOS33} [get_ports {SW[8]}];
set_property -dict {PACKAGE_PIN N2 IOSTANDARD LVCMOS33} [get_ports {SW[9]}];
set_property -dict {PACKAGE_PIN N1 IOSTANDARD LVCMOS33} [get_ports {SW[10]}];
set_property -dict {PACKAGE_PIN M2 IOSTANDARD LVCMOS33} [get_ports {SW[11]}];
set_property -dict {PACKAGE_PIN M1 IOSTANDARD LVCMOS33} [get_ports {SW[12]}];
set_property -dict {PACKAGE_PIN L1 IOSTANDARD LVCMOS33} [get_ports {SW[13]}];
set_property -dict {PACKAGE_PIN K2 IOSTANDARD LVCMOS33} [get_ports {SW[14]}];
set_property -dict {PACKAGE_PIN K1 IOSTANDARD LVCMOS33} [get_ports {SW[15]}];

## On-board LEDs
set_property -dict {PACKAGE_PIN G1 IOSTANDARD LVCMOS33} [get_ports {LED[0]}];
set_property -dict {PACKAGE_PIN G2 IOSTANDARD LVCMOS33} [get_ports {LED[1]}];
set_property -dict {PACKAGE_PIN F1 IOSTANDARD LVCMOS33} [get_ports {LED[2]}];
set_property -dict {PACKAGE_PIN F2 IOSTANDARD LVCMOS33} [get_ports {LED[3]}];
set_property -dict {PACKAGE_PIN E1 IOSTANDARD LVCMOS33} [get_ports {LED[4]}];
set_property -dict {PACKAGE_PIN E2 IOSTANDARD LVCMOS33} [get_ports {LED[5]}];
set_property -dict {PACKAGE_PIN E3 IOSTANDARD LVCMOS33} [get_ports {LED[6]}];
set_property -dict {PACKAGE_PIN E5 IOSTANDARD LVCMOS33} [get_ports {LED[7]}];
set_property -dict {PACKAGE_PIN E6 IOSTANDARD LVCMOS33} [get_ports {LED[8]}];
set_property -dict {PACKAGE_PIN C3 IOSTANDARD LVCMOS33} [get_ports {LED[9]}];
set_property -dict {PACKAGE_PIN B2 IOSTANDARD LVCMOS33} [get_ports {LED[10]}];
set_property -dict {PACKAGE_PIN A2 IOSTANDARD LVCMOS33} [get_ports {LED[11]}];
set_property -dict {PACKAGE_PIN B3 IOSTANDARD LVCMOS33} [get_ports {LED[12]}];
set_property -dict {PACKAGE_PIN A3 IOSTANDARD LVCMOS33} [get_ports {LED[13]}];
set_property -dict {PACKAGE_PIN B4 IOSTANDARD LVCMOS33} [get_ports {LED[14]}];
set_property -dict {PACKAGE_PIN A4 IOSTANDARD LVCMOS33} [get_ports {LED[15]}];

## On-board Buttons
set_property -dict {PACKAGE_PIN J2 IOSTANDARD LVCMOS33} [get_ports {btn[0]}];
set_property -dict {PACKAGE_PIN J5 IOSTANDARD LVCMOS33} [get_ports {btn[1]}];
set_property -dict {PACKAGE_PIN H2 IOSTANDARD LVCMOS33} [get_ports {btn[2]}]
set_property -dict {PACKAGE_PIN J1 IOSTANDARD LVCMOS33} [get_ports {btn[3]}]
##set_property -dict {CLOCK_DEDICATED_ROUTE FALSE} [get_nets {btn[0]}]

## On-board color LEDs
set_property -dict {PACKAGE_PIN V6 IOSTANDARD LVCMOS33} [get_ports {RGB[0]}];   # RBG0_R
set_property -dict {PACKAGE_PIN V4 IOSTANDARD LVCMOS33} [get_ports {RGB[1]}];   # RBG0_G
set_property -dict {PACKAGE_PIN U6 IOSTANDARD LVCMOS33} [get_ports {RGB[2]}];   # RBG0_B
set_property -dict {PACKAGE_PIN U3 IOSTANDARD LVCMOS33} [get_ports {RGB[3]}];   # RBG1_R
set_property -dict {PACKAGE_PIN V3 IOSTANDARD LVCMOS33} [get_ports {RGB[4]}];   # RBG1_G
set_property -dict {PACKAGE_PIN V5 IOSTANDARD LVCMOS33} [get_ports {RGB[5]}];   # RBG1_B

## On-board 7-Segment Display Enable Pins
set_property -dict {PACKAGE_PIN D5 IOSTANDARD LVCMOS33} [get_ports {EN_7SEG[0]}];
set_property -dict {PACKAGE_PIN C4 IOSTANDARD LVCMOS33} [get_ports {EN_7SEG[1]}];
set_property -dict {PACKAGE_PIN C7 IOSTANDARD LVCMOS33} [get_ports {EN_7SEG[2]}];
set_property -dict {PACKAGE_PIN A8 IOSTANDARD LVCMOS33} [get_ports {EN_7SEG[3]}];
set_property -dict {PACKAGE_PIN H3 IOSTANDARD LVCMOS33} [get_ports {EN_7SEG[4]}];
set_property -dict {PACKAGE_PIN J4 IOSTANDARD LVCMOS33} [get_ports {EN_7SEG[5]}];
set_property -dict {PACKAGE_PIN F3 IOSTANDARD LVCMOS33} [get_ports {EN_7SEG[6]}];
set_property -dict {PACKAGE_PIN E4 IOSTANDARD LVCMOS33} [get_ports {EN_7SEG[7]}];

## On-board 7-Segment Display Digit Pins
set_property -dict {PACKAGE_PIN D7 IOSTANDARD LVCMOS33} [get_ports {D_7SEG[0]}];
set_property -dict {PACKAGE_PIN C5 IOSTANDARD LVCMOS33} [get_ports {D_7SEG[1]}];
set_property -dict {PACKAGE_PIN A5 IOSTANDARD LVCMOS33} [get_ports {D_7SEG[2]}];
set_property -dict {PACKAGE_PIN B7 IOSTANDARD LVCMOS33} [get_ports {D_7SEG[3]}];
set_property -dict {PACKAGE_PIN A7 IOSTANDARD LVCMOS33} [get_ports {D_7SEG[4]}];
set_property -dict {PACKAGE_PIN D6 IOSTANDARD LVCMOS33} [get_ports {D_7SEG[5]}];
set_property -dict {PACKAGE_PIN B5 IOSTANDARD LVCMOS33} [get_ports {D_7SEG[6]}];
set_property -dict {PACKAGE_PIN A6 IOSTANDARD LVCMOS33} [get_ports {D_7SEG[7]}];
set_property -dict {PACKAGE_PIN F4 IOSTANDARD LVCMOS33} [get_ports {D_7SEG[8]}];
set_property -dict {PACKAGE_PIN J3 IOSTANDARD LVCMOS33} [get_ports {D_7SEG[9]}];
set_property -dict {PACKAGE_PIN D2 IOSTANDARD LVCMOS33} [get_ports {D_7SEG[10]}];
set_property -dict {PACKAGE_PIN C2 IOSTANDARD LVCMOS33} [get_ports {D_7SEG[11]}];
set_property -dict {PACKAGE_PIN B1 IOSTANDARD LVCMOS33} [get_ports {D_7SEG[12]}];
set_property -dict {PACKAGE_PIN H4 IOSTANDARD LVCMOS33} [get_ports {D_7SEG[13]}];
set_property -dict {PACKAGE_PIN D1 IOSTANDARD LVCMOS33} [get_ports {D_7SEG[14]}];
set_property -dict {PACKAGE_PIN C1 IOSTANDARD LVCMOS33} [get_ports {D_7SEG[15]}];


## Expansion Connectors
## PmodA
set_property -dict {PACKAGE_PIN B13 IOSTANDARD LVCMOS33} [get_ports {PmodA[0]}];
set_property -dict {PACKAGE_PIN A13 IOSTANDARD LVCMOS33} [get_ports {PmodA[1]}];
set_property -dict {PACKAGE_PIN B14 IOSTANDARD LVCMOS33} [get_ports {PmodA[2]}];
set_property -dict {PACKAGE_PIN A14 IOSTANDARD LVCMOS33} [get_ports {PmodA[3]}];
set_property -dict {PACKAGE_PIN E12 IOSTANDARD LVCMOS33} [get_ports {PmodA[4]}];
set_property -dict {PACKAGE_PIN D12 IOSTANDARD LVCMOS33} [get_ports {PmodA[5]}];
set_property -dict {PACKAGE_PIN C13 IOSTANDARD LVCMOS33} [get_ports {PmodA[6]}];
set_property -dict {PACKAGE_PIN C14 IOSTANDARD LVCMOS33} [get_ports {PmodA[7]}];

##PmodB
set_property -dict {PACKAGE_PIN B15 IOSTANDARD LVCMOS33} [get_ports {PmodB[0]}];
set_property -dict {PACKAGE_PIN A15 IOSTANDARD LVCMOS33} [get_ports {PmodB[1]}];
set_property -dict {PACKAGE_PIN B16 IOSTANDARD LVCMOS33} [get_ports {PmodB[2]}];
set_property -dict {PACKAGE_PIN A16 IOSTANDARD LVCMOS33} [get_ports {PmodB[3]}];
set_property -dict {PACKAGE_PIN B17 IOSTANDARD LVCMOS33} [get_ports {PmodB[4]}];
set_property -dict {PACKAGE_PIN A17 IOSTANDARD LVCMOS33} [get_ports {PmodB[5]}];
set_property -dict {PACKAGE_PIN C17 IOSTANDARD LVCMOS33} [get_ports {PmodB[6]}];
set_property -dict {PACKAGE_PIN B18 IOSTANDARD LVCMOS33} [get_ports {PmodB[7]}];

##PmodAB
set_property -dict {PACKAGE_PIN C18 IOSTANDARD LVCMOS33} [get_ports {PmodAB[0]}];
set_property -dict {PACKAGE_PIN E18 IOSTANDARD LVCMOS33} [get_ports {PmodAB[1]}];
set_property -dict {PACKAGE_PIN G18 IOSTANDARD LVCMOS33} [get_ports {PmodAB[2]}];
set_property -dict {PACKAGE_PIN H18 IOSTANDARD LVCMOS33} [get_ports {PmodAB[3]}];
set_property -dict {PACKAGE_PIN F18 IOSTANDARD LVCMOS33} [get_ports {PmodAB[4]}];
set_property -dict {PACKAGE_PIN D18 IOSTANDARD LVCMOS33} [get_ports {PmodAB[5]}];

## Expansion Connectors
## PmodC
set_property -dict {PACKAGE_PIN T6 IOSTANDARD LVCMOS33} [get_ports {PmodC[0]}];
set_property -dict {PACKAGE_PIN T5 IOSTANDARD LVCMOS33} [get_ports {PmodC[1]}];
set_property -dict {PACKAGE_PIN R5 IOSTANDARD LVCMOS33} [get_ports {PmodC[2]}];
set_property -dict {PACKAGE_PIN T4 IOSTANDARD LVCMOS33} [get_ports {PmodC[3]}];
set_property -dict {PACKAGE_PIN R7 IOSTANDARD LVCMOS33} [get_ports {PmodC[4]}];
set_property -dict {PACKAGE_PIN R6 IOSTANDARD LVCMOS33} [get_ports {PmodC[5]}];
set_property -dict {PACKAGE_PIN P6 IOSTANDARD LVCMOS33} [get_ports {PmodC[6]}];
set_property -dict {PACKAGE_PIN P5 IOSTANDARD LVCMOS33} [get_ports {PmodC[7]}];

##PmodD
set_property -dict {PACKAGE_PIN R5 IOSTANDARD LVCMOS33} [get_ports {PmodD[0]}];
set_property -dict {PACKAGE_PIN T3 IOSTANDARD LVCMOS33} [get_ports {PmodD[1]}];
set_property -dict {PACKAGE_PIN N5 IOSTANDARD LVCMOS33} [get_ports {PmodD[2]}];
set_property -dict {PACKAGE_PIN N4 IOSTANDARD LVCMOS33} [get_ports {PmodD[3]}];
set_property -dict {PACKAGE_PIN L5 IOSTANDARD LVCMOS33} [get_ports {PmodD[4]}];
set_property -dict {PACKAGE_PIN M4 IOSTANDARD LVCMOS33} [get_ports {PmodD[5]}];
set_property -dict {PACKAGE_PIN K4 IOSTANDARD LVCMOS33} [get_ports {PmodD[6]}];
set_property -dict {PACKAGE_PIN L4 IOSTANDARD LVCMOS33} [get_ports {PmodD[7]}];

##PmodCD
set_property -dict {PACKAGE_PIN K6 IOSTANDARD LVCMOS33} [get_ports {PmodAB[0]}];
set_property -dict {PACKAGE_PIN L6 IOSTANDARD LVCMOS33} [get_ports {PmodAB[1]}];
set_property -dict {PACKAGE_PIN M5 IOSTANDARD LVCMOS33} [get_ports {PmodAB[2]}];
set_property -dict {PACKAGE_PIN M3 IOSTANDARD LVCMOS33} [get_ports {PmodAB[3]}];
set_property -dict {PACKAGE_PIN K3 IOSTANDARD LVCMOS33} [get_ports {PmodAB[4]}];
set_property -dict {PACKAGE_PIN J6 IOSTANDARD LVCMOS33} [get_ports {PmodAB[5]}];
## UART
set_property -dict {PACKAGE_PIN V12 IOSTANDARD LVCMOS33} [get_ports {UART_rxd}]
set_property -dict {PACKAGE_PIN U11 IOSTANDARD LVCMOS33} [get_ports {UART_txd}]

##HDMI Signals
#set_property -dict { PACKAGE_PIN T14   IOSTANDARD TMDS_33 } [get_ports {hdmi_clk_n}]
#set_property -dict { PACKAGE_PIN R14   IOSTANDARD TMDS_33 } [get_ports {hdmi_clk_p}]

#set_property -dict { PACKAGE_PIN T15   IOSTANDARD TMDS_33  } [get_ports {hdmi_tx_n[0]}]
#set_property -dict { PACKAGE_PIN R17   IOSTANDARD TMDS_33  } [get_ports {hdmi_tx_n[1]}]
#set_property -dict { PACKAGE_PIN P16   IOSTANDARD TMDS_33  } [get_ports {hdmi_tx_n[2]}]
                                    
#set_property -dict { PACKAGE_PIN R15   IOSTANDARD TMDS_33  } [get_ports {hdmi_tx_p[0]}]
#set_property -dict { PACKAGE_PIN R16   IOSTANDARD TMDS_33  } [get_ports {hdmi_tx_p[1]}]
#set_property -dict { PACKAGE_PIN N15   IOSTANDARD TMDS_33  } [get_ports {hdmi_tx_p[2]}]

## PWM audio signals
set_property -dict {PACKAGE_PIN N13 IOSTANDARD LVCMOS33} [get_ports {left_audio_out}]
set_property -dict {PACKAGE_PIN N14 IOSTANDARD LVCMOS33} [get_ports {right_audio_out}]

##
# J10 and K9 potentialometer



## BLE UART signals
#set_property -dict {PACKAGE_PIN G5 IOSTANDARD LVCMOS33} [get_ports {ble_uart_tx}]
#set_property -dict {PACKAGE_PIN F5 IOSTANDARD LVCMOS33} [get_ports {ble_uart_rx}]
#set_property -dict {PACKAGE_PIN H6 IOSTANDARD LVCMOS33} [get_ports {ble_uart_rts}]
#set_property -dict {PACKAGE_PIN G6 IOSTANDARD LVCMOS33} [get_ports {ble_uart_cts}]

## Servomotor signals
#set_property -dict {PACKAGE_PIN M14 IOSTANDARD LVCMOS33} [get_ports {servo0}]
#set_property -dict {PACKAGE_PIN M16 IOSTANDARD LVCMOS33} [get_ports {servo1}]
#set_property -dict {PACKAGE_PIN L15 IOSTANDARD LVCMOS33} [get_ports {servo2}]
#set_property -dict {PACKAGE_PIN L16 IOSTANDARD LVCMOS33} [get_ports {servo3}]
