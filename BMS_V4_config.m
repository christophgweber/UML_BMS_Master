%------------------------------------------------------------------------%
% Description:  Parameter file for BMS-Master V2.2
%   
%
% Company:      University of Applied Sciences Kiel, Germany
% Author:       Hannes Rathmann, Fabian Franke
% Date:         27.02.2017
% Version:      Energiemanagement V 4.0
%
%------------------------------------------------------------------------%
clear all
% Timer System setup
% Fundamental Basetime
BASETIME = 0.0005;
% ePWM Block Parameter
% TBCLK = 128; HSPCLKDIV = 2
% time in s = value /(150MHz/(TBCLK*HSPCLKDIV)) 586=1ms
CLK_CYC_timer_1 = 586;   % 1   ms 
CLK_CYC_timer_2 = 5860;  % 10  ms 
CLK_CYC_timer_3 = 280; % 1.x ms 
CLK_CYC_timer_4 = 586*100; % 1.x ms 
CLK_CYC_timer_5 = 5800*2; % Limit monitoring  
CLK_CYC_timer_6 = 320;
%CLK_CYC_timer_7 = 746;
%
% PSO-----------------------------
NUM_OF_PARTICLE = single(150);
P_L_BOUND = single([0.05;0.01;0.1;0.01;0.1]);
P_U_BOUND = single([0.50;0.20;0.9;0.06;60]);
PARTICLE_INIT = single(create_startparticle(P_L_BOUND,P_U_BOUND,NUM_OF_PARTICLE));
% Defines
LAST_SOC_POINT_INDEX_INIT    = uint16(34);
% 
COUNTER_ERROR                = uint16(10);
% Voltage 1 Bit = 100uV
BALANCE_CHARGE_V_CELL_MAX    = uint16(36000);
CELL_OCV_100                 = uint16(36500);
CELL_OCV_0                   = uint16(20000);
SCC_MIN_CELL_VOLTAGE         = uint16(27000);
SOC_STEP_SCC                 = int32(1*1e6);
IMU_CC_SCC_INIT              = int32(100*1e6);
MIN_CELL_VOLTAGE_INIT        = uint16(33000);
MAX_CELL_VOLTAGE_INIT        = uint16(33000);
% Limit Monitoring
% Voltage 1 Bit = 100uV
ERR_V_CELL_HIGH     = uint16(37000);
ERR_V_CELL_LOW      = uint16(19500);
WAR_V_CELL_HIGH     = uint16(35500);
WAR_V_CELL_LOW      = uint16(21000);
 
ERR_V_BAT_HIGH      = uint32(59*1e4);
ERR_V_BAT_LOW       = uint32(30.4*1e4);
WAR_V_BAT_HIGH      = uint32(58*1e4);
WAR_V_BAT_LOW       = uint32(32*1e4);

% Temperature 1 Bit = 0.01 °C (+/-)
ERR_T_CELL_HIGH     = int16(60*single(100));
ERR_T_CELL_LOW      = int16(0*single(100));
WAR_T_CELL_HIGH     = int16(55*single(100));
WAR_T_CELL_LOW      = int16(10*single(100));
% Current 1 Bit = 1uA (+/-)
ERR_I_BAT_HIGH      = int32(100*1e6);
ERR_I_BAT_LOW       = int32(-100*1e6);
WAR_I_BAT_HIGH      = int32(90*1e6);
WAR_I_BAT_LOW       = int32(-90*1e6);
%
% SoC 1 Bit = 1u% (+/-)
ERR_SOC_CELL_HIGH      = int32(100*1e6);
ERR_SOC_CELL_LOW       = int32(0*1e6);
WAR_SOC_CELL_HIGH      = int32(95*1e6);
WAR_SOC_CELL_LOW       = int32(5*1e6);
%



%
% Bitmask for setting state bits
% cell states
SET_CELL_V_ERR      = uint32(bin2dec('1000 0000 0000 0000'));
SET_CELL_V_WAR      = uint32(bin2dec('0100 0000 0000 0000'));
% global error or warning 0x010; 0x020
SET_CELL_V_HIGH     = uint16(bin2dec('0000 0000 0000 0001'));
SET_CELL_V_LOW      = uint16(bin2dec('0000 0000 0000 0010'));
SET_BAT_V_HIGH      = uint16(bin2dec('0000 0000 0000 0100'));
SET_BAT_V_LOW       = uint16(bin2dec('0000 0000 0000 1000'));
SET_BAT_I_HIGH      = uint16(bin2dec('0000 0000 0001 0000'));
SET_BAT_I_LOW       = uint16(bin2dec('0000 0000 0010 0000'));
SET_CELL_T_HIGH     = uint16(bin2dec('0000 0000 0100 0000'));
SET_CELL_T_LOW      = uint16(bin2dec('0000 0000 1000 0000'));
SET_CELL_SOC_HIGH   = uint16(bin2dec('0000 0001 0000 0000'));
SET_CELL_SOC_LOW    = uint16(bin2dec('0000 0010 0000 0000'));
SET_COM_GATEWAY     = uint16(bin2dec('0000 0100 0000 0000'));
SET_COM_SLAVE       = uint16(bin2dec('0000 1000 0000 0000'));
SET_SLAVE_T_HIGH    = uint16(bin2dec('0001 0000 0000 0000'));
% Defines for CANA send data
ERROR               = uint16(1);
WARNING             = uint16(2);
CELL_STATE          = uint16(3);
LINE_CURRENT_CANA   = uint16(4);
CELL_VOLTAGE        = uint16(5);
CELL_TEMPERATURE    = uint16(6);
CELL_SOC            = uint16(7);
BALANCE_VEC         = uint16(8);
IMU_DEBUG           = uint16(9);
IMU_SEND_REAL       = uint16(10);
IMU_SEND_IMAG       = uint16(11);
SYSTEM_DEBUG        = uint16(12);
PSO_PARA_DEBUG      = uint16(13);
PARA_ACT_SEND       = uint16(101);
PARA_SCC_SEND       = uint16(102);
% Defines for Gateway request
CONTACTOR           = uint16(1);
INFO                = uint16(2);
LINE_CURRENT        = uint16(3);
BALANCE             = uint16(4);
CELLV_BURST         = uint16(5);
CELLT_BURST         = uint16(6);
IMU                 = uint16(7);
AKT_BALANCE         = uint16(8);
% Defines for information from Gateway
EXTERN_SIGNALS          = uint16(1);
SHUT_DOWN_BALANCE_ON    = uint16(2);
SHUT_DOWN_BALANCE_OFF   = uint16(3);
% Defines for IMU
FREQUENCY_ID            = uint16(hex2dec('10'));
% FREQUENCY_STEPS         = uint16([25 50 75 100 150 250 350 500 750 ...
%                                 1000 1500 2000 3000 4000 5000 10010 10040 ...
%                                 10150 10500 11000]);
% NUM_OF_FREQUENCIES      = uint16(20);
% NUM_OF_FREQUENCIES_GA   = uint16(15);
FREQUENCY_STEPS         = uint16([25 50 75 100 150 250 500 750 ...
                                    1000 1500 2500 5000 7500 ...
                                    10010 10015 10025 10050 10075 ...
                                    10100 10150 10250 10500 10750 ...
                                    11000 11500]);
                                
NUM_OF_FREQUENCIES      = uint16(25);
NUM_OF_FREQUENCIES_PSO  = uint16(14);
NUM_OF_SOC_POINTS       = uint16(110);
INIT_OFFSET_AMPLITUDE   = uint16(2);
START_IMU_MSL           = uint16(3);
START_IMU_NSR           = uint16(2);
START_IMU_SCC           = uint16(1);
SWITCH_IMU_ON           = uint16(1);
SWITCH_IMU_OFF          = uint16(2);
SWITCH_OFFSET_ON        = uint16(1);
SWITCH_OFFSET_OFF       = uint16(0);
SWITCH_IMU_ON_OFF       = uint16(4);
INDEX_REALPART          = uint16(1);
INDEX_IMAGPART          = uint16(2);
% Defines for imu states
IMU_INIT                        = uint16(1);
IMU_POWER_ON                    = uint16(21);
IMU_INIT_AMP_OFF                = uint16(22);
IMU_POWER_OFF                   = uint16(23);
MSL_SWITCH_OFFSET_ON            = uint16(61); 
MSL_START_LOCUS_MEAS            = uint16(62);
MSL_SWITCH_OFFSET_OFF           = uint16(63);
IMU_MFC_START                   = uint16(51);
IMU_MFC_GET_DATA                = uint16(52);
IMU_MFC_STORE_DATA              = uint16(53);
SCC_INIT                        = uint16(70);
SCC_SWITCH_OFFSET_ON            = uint16(71);
SCC_START_LOCUS_MEAS            = uint16(72);
SCC_CHECK_DELTA_SOC             = uint16(73);
SCC_MEAS_LAST_LOCUS             = uint16(74);
SCC_SWITCH_OFFSET_OFF           = uint16(75);

% Defines for mfc states 
MFC_INIT                        = uint16(1);
MFC_START                       = uint16(2);
MFC_POLLING                     = uint16(3);
% Defines for IMU request
IMU_POLLING                     = uint16(2);
IMU_GET_DATA_MSF                = uint16(3);
GET_REAL_PART_MSF               = uint16(3);
GET_IMAG_PART_MSF               = uint16(4);
IMU_AMP_OFF                     = uint16(5);
IMU_OFFSET_ON_OFF               = uint16(6);
IMU_START_MFC                   = uint16(7);
IMU_GET_DATA_MFC                = uint16(8);
GET_REAL_PART_MFC               = uint16(8);
GET_IMAG_PART_MFC               = uint16(9);
IMU_POWER                       = uint16(10);
IMU_OFFSET_POLLING              = uint16(11);
% Defines for IMU debug
DEBUG_SEND_STATES               = uint16(hex2dec('01'));
DEBUG_CELL_INFO                 = uint16(hex2dec('11'));
DEBUG_CELL_REAL                 = uint16(hex2dec('12'));
DEBUG_CELL_IMAG                 = uint16(hex2dec('13'));
% Defines for MRAM
SOC_CC_STORE                    = uint16(1);
SOC_ABS_STORE                   = uint16(2);
SOC_CC_READ                     = uint16(3);
SOC_ABS_READ                    = uint16(4);
IMU_DATA_STORE                  = uint16(5);
IMU_DATA_READ_LOCUS_ACT         = uint16(6);
IMU_DATA_READ_LOCUS_SCC         = uint16(7);
PARA_DATA_STORE_ACT             = uint16(8);
PARA_DATA_STORE_SCC             = uint16(9);
PARA_DATA_READ_ACT              = uint16(10);
PARA_DATA_READ_SCC              = uint16(11);
SOC_SCC_STORE                   = uint16(12);
SOC_SCC_READ                    = uint16(13);
STORE_LAST_SOC_INDEX_SCC        = uint16(14);
READ_LAST_SOC_INDEX_SCC         = uint16(15);


IMU_DATA_STORE_REAL             = uint16(8);
IMU_DATA_STORE_IMAG             = uint16(9);
IMU_DATA_STORE_SOC_POINT        = uint16(10);
IMU_DATA_READ_REAL              = uint16(11);
IMU_DATA_READ_IMAG              = uint16(12);
IMU_DATA_READ_SOC_POINT         = uint16(13);

STORE_LAST_SOC_INDEX            = uint16(90);
READ_LAST_SOC_INDEX             = uint16(91);


PARA_STORE_ACT                  = uint16(100);
PARA_STORE_SCC                  = uint16(101);
PARA_READ_ACT                   = uint16(102);
PARA_READ_SCC                   = uint16(103);

% Defines for user interface

USER_READ_SCC_FOR_CELLNO        = uint16(1);
USER_READ_ACT_FOR_CELLNO        = uint16(2);

USER_READ_PARA_SCC_FOR_CELLNO   = uint16(3);
USER_READ_PARA_ACT_FOR_CELLNO   = uint16(4);

USER_READ_SOC_SCC               = uint16(5);

% Basis address for up to 16 cells
ADDRESS_LAST_SOC_INDEX          = uint32(400000);
BASIS_ADDRESS_LOCUS_SCC         = uint32(1001);
BASIS_ADDRESS_LOCUS             = uint32(353001);
BASIS_ADDRESS_PARA_SCC          = uint32(356201);
BASIS_ADDRESS_PARA_ACT          = uint32(398441);
BASIS_ADDRESS_SOC               = uint32(398825);
BASIS_ADDRESS_SOC_SCC           = uint32(399017);
BASIS_ADDRESS_STATUS            = uint32(399457);
% Defines for system debug
CHANGE_SOC_CC_VALUE             = uint16(11);
CHANGE_SOC_CC_VALUE_UNBALANCED  = uint16(111);
CHANGE_SOC_ABS_VALUE            = uint16(12);
READ_SOC_CC_MRAM                = uint16(13);
READ_SOC_ABS_MRAM               = uint16(14);
%READ_ONE_LOCUS_MRAM             = uint16(15);
READ_ACT_LOCUS_CELLNO           = uint16(15);
READ_SCC_LOCUS_CELLNO           = uint16(16);
READ_ACT_PARA_CELLNO            = uint16(17);
READ_SCC_PARA_CELLNO            = uint16(18);


HARDWARE_RESET                  = uint16(19);
MANUAL_SOC_OCV_REF              = uint16(20);
BALANCE_CHARGE                  = uint16(21);

SET_LAST_SOC_POINT_INDEX        = uint16(22);


CHARGE_CELL_WITH_BALANCE_RESISTOR = uint16(100);

 
REQUEST_SOC_REF                 = uint16(1000);

SEND_CELL_SOC_ABS               = uint16(199);
ACTIVATE_BALANCE_CHARGE         = uint16(200);
DEACTIVATE_BALANCE_CHARGE       = uint16(201);
RESET_MASTER_SLAVE              = uint16(222);

% Defines for Genetic Algorithm
DETERMINE_MODEL_PARAMETER_ACT   = uint16(100);
DETERMINE_MODEL_PARAMETER_SCC   = uint16(101);
% Defines for system setup
CONTACTOR_UNLOCKED              = uint16(1); % 
CONTACTOR_LOCKED                = uint16(0); %
NUM_OF_LINES                    = uint16(1);
NUM_OF_CELLS                    = uint16(16);
TIMEOUT_GATEWAY                 = uint32(500); % send new msg after 5sec
TIMEOUT_CANA                    = uint32(5000); % send new msg after 5sec
LINE_CURRENT_SWITCH_THRESHOLD   = int32(2*1e6); % current channel select
MSF                             = uint16(2); %impedance measurement method single frequency
MFC                             = uint16(1); %impedance measurement method frequency collective
IMU_LINE_CURRENT_THRESHHOLD     = int32(0.1*1e6); 
CURRENT_CORRECTION_INIT         = single(2.497);
SCALE_FACTOR_CH1                = single(0.66666666);
SCALE_FACTOR_CH2                = single(0.66666666);

REF_IMU_OR_OCV = uint16(0);
%
%Defines for Parameter Estimation

NUM_OF_PARAMETER        = single(5);
% MRAM stores 6 parameter RS; RD; alpha; k; wg; L2!
%
% Init global variables
%
CELL_VOLTAGES_INIT      = uint16(zeros(NUM_OF_CELLS,NUM_OF_LINES));
CELL_TEMPERATURES_INIT  = int16(zeros(NUM_OF_CELLS,NUM_OF_LINES));
CELL_STATES_INIT        = uint32(zeros(NUM_OF_CELLS,NUM_OF_LINES));%
%LINE_CURRENT_INIT       = int32(zeros(NUM_OF_LINES));
LINE_CURRENT_INIT       = int32(zeros(NUM_OF_LINES,1));
SOC_POINTS_OF_SCC_INIT  = int32(zeros(NUM_OF_SOC_POINTS,1));
GATEWAY_REQUEST_INIT    = boolean(zeros(10,1));
SYSTEM_FUNCTION_INIT    = boolean(zeros(25,1));
CANA_SEND_DATA_INIT     = boolean(zeros(25,1));
MRAM_COMMAND_INIT       = boolean(zeros(15,1));
USER_INTERFACE_INIT     = boolean(zeros(10,1));
IMU_FUNCTION_INIT       = uint16(0);
IMU_OFFSET_INIT         = uint16(2000);
IMU_AMPLITUDE_INIT      = uint16(1000);
IMU_MEAS_METHOD_INIT    = MFC; % frequency collective measurement active
% Attention when only one line is in system following variables has to be 
% declared with minium 2 lines!!!!
CELL_SOC_CC_INIT        = int32(ones(NUM_OF_CELLS,2));
%CELL_SOC_ABS_INIT       = int32(zeros(NUM_OF_CELLS,2));
CELL_SOC_ABS_INIT       = int32(0);
IMU_ACT_SOC_INIT        = int32(zeros(NUM_OF_CELLS,2));
DETERMINED_SOC_GA_INIT  = int32(zeros(NUM_OF_CELLS,1));
%imu_soc=IMU_ACT_SOC_INIT;
BALANCE_VECTOR_INIT     = boolean(zeros(NUM_OF_CELLS,NUM_OF_LINES));
ONE_LOCUS_INIT          = single(zeros(NUM_OF_FREQUENCIES,2));
SOC_OF_ONE_LOCUS_INIT   = int32(0);
%ONE_LOCUS_SET_INIT      = single(zeros(NUM_OF_FREQUENCIES,2,12));
SOC_OF_LOCUS_SET_INIT   = int32(zeros(NUM_OF_CELLS,1));
%PARAMETER_SET_INIT      = single(zeros(NUM_OF_CELLS,6));
%load para_scc;       
%PARAMETER_SCC_INIT      = single(para);

PARAMETER_ONE_CELL_ACT_INIT = single(zeros(1,6));
PARAMETER_ONE_CELL_SCC_INIT = single(zeros(NUM_OF_SOC_POINTS,6));

%
% Timer initialisation
%clear 
%
TIMER_LIM_MON_STARTUP       = single(10);
%
TIMER_MASTER_INIT           = single(5);
% Timer for communication CAN B Gateway request
TIMER_VOLTAGE_REQUEST       = single(0.1);
TIMER_TEMPERATURE_REQUEST   = single(0.3);
TIMER_LINE_CURRENT_REQUEST  = single(0.01);
TIMER_INFO_REQUEST          = single(0.1);
TIMER_ACTIVE_BALANCE_REQUEST= single(0.2);
%
% Timer for communication CAN A transmitting BMS information
%
TIMER_CELL_VOLTAGE          = single(1);
TIMER_CELL_TEMPERATURE      = single(5);
TIMER_CELL_SOC              = single(2);
TIMER_LINE_CURRENT          = single(0.08);
TIMER_CELL_STATES           = single(1);
TIMER_BALANCE_VECTOR        = single(1);
TIMER_CELL_SOC_ABS          = single(2);
% 
% Timer IMU
%
TIMER_IMU_START_UP                  = single(3);
TIMER_IMU_POLLING                   = single(10);
TIMER_IMU_DEBUG_SEND_DATA           = single(0.03);
TIMER_IMU_DEBUG                     = single(0.1);
TIMER_OFFSET_TRANSIENT_RESPONSE     = single(40);
%
% Timer OCV
%
TIMER_OCV_REF               = single(30);
%
% Timer system
%
TIMER_SAFE_SOC_MRAM_REQUEST = single(10);
% CAN identifier
% CAN identifier for communicate with FH-Kiel BMS-Gateway V2.X
% for more Information look under CAN_BMS_Gateway_Master.dbc
% CAN B!
% BMS-Master send CAN id's
%
ID_INIT_CELLV_BURST         = hex2dec('100');           % mailbox 1
ID_INIT_CELLT_BURST         = hex2dec('200');           % mailbox 2
ID_INIT_LINE_CURRENT        = hex2dec('300');           % mailbox 3
ID_INIT_BALANCE             = hex2dec('400');           % mailbox 4
ID_INIT_ACTIVE_BALANCE      = hex2dec('410');           % mailbox 0
ID_INIT_INFO                = hex2dec('500');           % mailbox 5
ID_INIT_CONTACTOR           = hex2dec('600');           % mailbox 6
ID_INIT_CONTROL_IMU         = hex2dec('700');           % mailbox 13
%
% BMS-Master receive CAN id's
%
ID_CELLV_BURST              = hex2dec('101');           % mailbox 7        
ID_CELLT_BURST              = hex2dec('201');           % mailbox 8
ID_LINE_CURRENT             = hex2dec('721');           % mailbox 9    
ID_BALANCE_ACK              = hex2dec('401');           % mailbox 10
ID_ACTIVE_BALANCE_ACK       = hex2dec('411');           % mailbox 15
ID_INFO                     = hex2dec('501');           % mailbox 11
ID_CONTACTOR                = hex2dec('601');           % mailbox 12
ID_CONTROL_IMU              = hex2dec('701');           % mailbox 14

%
% CAN identifier for communicate with telemetrics
% CAN A!                  
%
ID_SEND_ERROR               = hex2dec('010');           % mailbox 16
ID_SEND_WARNING             = hex2dec('020');           % mailbox 31
ID_SEND_SYSTEM_STATES       = hex2dec('100');           % mailbox 17
ID_SEND_LINE_CURRENT        = hex2dec('110');           % mailbox 18 
ID_SEND_CELL_VOLTAGE        = hex2dec('200');           % mailbox 19 
ID_SEND_CELL_TEMPERATURE    = hex2dec('210');           % mailbox 20
ID_SEND_CELL_SOC            = hex2dec('220');           % mailbox 21
ID_SEND_BALANCE_VEC         = hex2dec('300');           % mailbox 22
ID_INIT_IMU_DEBUG           = hex2dec('700');           % mailbox 23
ID_IMU_DEBUG                = hex2dec('701');           % mailbox 24
ID_IMU_REAL                 = hex2dec('702');           % mailbox 27
ID_IMU_IMAG                 = hex2dec('703');           % mailbox 28
ID_INIT_SYSTEM_DEBUG        = hex2dec('500');           % mailbox 25
ID_SYSTEM_DEBUG             = hex2dec('501');           % mailbox 26
ID_INIT_PSO_DEBUG           = hex2dec('600');           % mailbox 29
ID_PSO_DEBUG                = hex2dec('601');           % mailbox 30
% free mailboxes: none
%
% Setup Energimanagement
%
%
MEAS_LOCUS_SOC_LIMIT    = int32(1000*1e6); %meas locus after 1000% charge
BALANCE_RESISTOR        = int32(5); % ohm
CN_CELLS                = int32(40*3600);  % Cell capacity in As
TS_SOC                  = single(0.010); % sample time for SoC calculation


%Balancing Parameter

DELTA_SOC_BALANCE = int32(5*1e6);  %Differenz for active balancing to start
DELTA_SOC_BALANCE_OFF = int32(1*1e5); % Differenz for deactivation of activ Balance

ACTIVE_BALANCE_VECTOR_INIT = uint32(zeros(NUM_OF_CELLS,4));
% 1 for active balance need
% 2 for amount of SoC for balance need
% 3 for active balance on
% 4 for amount of energy charged

BALANCE_FLAG_INIT = uint16(0);
%

%CAN sets
POLDEACT =  hex2dec('000008FF');
POLACT =    hex2dec('00000BFF');

CELLACTBITFIELD =   hex2dec('300');
CELLDEACTBITFIELD = hex2dec('100');


LINE_CURRENT_INIT(1) = int32(0*1e6);

V_INIT = uint16(33300);
CELL_VOLTAGES_INIT = (CELL_VOLTAGES_INIT+1).*V_INIT;
% 
% CELL_VOLTAGES_INIT(1,1) = V_INIT;
% CELL_VOLTAGES_INIT(2,1) = V_INIT;
% CELL_VOLTAGES_INIT(3,1) = V_INIT;
% CELL_VOLTAGES_INIT(4,1) = V_INIT;
% CELL_VOLTAGES_INIT(5,1) = V_INIT;
% CELL_VOLTAGES_INIT(6,1) = V_INIT;
% CELL_VOLTAGES_INIT(7,1) = V_INIT;
% CELL_VOLTAGES_INIT(8,1) = V_INIT;
% CELL_VOLTAGES_INIT(9,1) = V_INIT;
% CELL_VOLTAGES_INIT(10,1) = V_INIT;
% CELL_VOLTAGES_INIT(11,1) = V_INIT;
% CELL_VOLTAGES_INIT(12,1) = V_INIT;
% CELL_VOLTAGES_INIT(13,1) = V_INIT;
% CELL_VOLTAGES_INIT(14,1) = V_INIT;
% CELL_VOLTAGES_INIT(15,1) = V_INIT;
% CELL_VOLTAGES_INIT(16,1) = V_INIT;
% 

T_INIT = int16(21.3*single(100));

CELL_TEMPERATURES_INIT=(CELL_TEMPERATURES_INIT+1).*T_INIT;
% CELL_TEMPERATURES_INIT(1,1)  = T_INIT;
% CELL_TEMPERATURES_INIT(2,1)  = T_INIT;
% CELL_TEMPERATURES_INIT(3,1)  = T_INIT;
% CELL_TEMPERATURES_INIT(4,1)  = T_INIT;
% CELL_TEMPERATURES_INIT(5,1)  = T_INIT;
% CELL_TEMPERATURES_INIT(6,1)  = T_INIT;
% CELL_TEMPERATURES_INIT(7,1)  = T_INIT;
% CELL_TEMPERATURES_INIT(8,1)  = T_INIT;
% CELL_TEMPERATURES_INIT(9,1)  = T_INIT;
% CELL_TEMPERATURES_INIT(10,1) = T_INIT;
% CELL_TEMPERATURES_INIT(11,1) = T_INIT;
% CELL_TEMPERATURES_INIT(12,1) = T_INIT;
% CELL_TEMPERATURES_INIT(13,1) = T_INIT;
% CELL_TEMPERATURES_INIT(14,1) = T_INIT;
% CELL_TEMPERATURES_INIT(15,1) = T_INIT;
% CELL_TEMPERATURES_INIT(16,1) = T_INIT;

