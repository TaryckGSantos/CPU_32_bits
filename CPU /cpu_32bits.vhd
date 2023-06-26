library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_signed.all;

entity CPU_32bits is
port ( i_clk : in std_logic);
		 
end CPU_32bits;

architecture arc_1 of CPU_32bits is
	
component ULA is
port ( i_A            : in std_logic_vector (31 downto 0);
		 i_B            : in std_logic_vector (31 downto 0);
		 i_ControlULA   : in std_logic_vector (3 downto 0);
		 o_R            : out std_logic_vector (31 downto 0);
		 o_Zero         : out std_logic);
end component;

component ULA_control 
port ( i_Funct : in std_logic_vector(5 downto 0);
		 i_OpULA : in std_logic_vector(1 downto 0);
		 o_OP : out std_logic_vector(3 downto 0));
end component;

component somadorPC 
port (	i_PC : in std_logic_vector (31 downto 0);
			o_somadorPC : out std_logic_vector (31 downto 0));
end component;

component add_path 
port (	i_PC : in std_logic_vector (31 downto 0);
			i_Inst_Extended : in std_logic_vector (31 downto 0);
			o_Dest : out std_logic_vector (31 downto 0));
end component;

component shift_left_28bits 
port ( i_R : in std_logic_vector(25 downto 0);
		 o_Q : out std_logic_vector(27 downto 0));
end component;

component shift_left_32bits
port ( i_R : in std_logic_vector(31 downto 0);
		 o_Q : out std_logic_vector(31 downto 0));
end component;

component RegisterFile
port ( i_clk : in std_logic;
		 i_ReadReg1  : in std_logic_vector (4 downto 0);
		 i_ReadReg2  : in std_logic_vector (4 downto 0);
		 i_WriteReg  : in std_logic_vector (4 downto 0);
		 i_writeData : in std_logic_vector (31 downto 0);
		 i_RegWrite  : in std_logic;
		 o_readData1 : out std_logic_vector (31 downto 0);
		 o_readData2 : out std_logic_vector (31 downto 0));
end component;

component program_counter
port ( i_clk : in std_logic;
		 i_pc_D : in std_logic_vector(31 downto 0);
		 o_pc_Q : out std_logic_vector(31 downto 0));
end component;

component mux_2x1_5bits
port ( i_R0 : in std_logic_vector(4 downto 0);
		 i_R1 : in std_logic_vector(4 downto 0);
		 i_S : in std_logic;
		 o_Q : out std_logic_vector(4 downto 0));
end component;

component mux_2x1_32bits
port ( i_R1 : in std_logic_vector(31 downto 0);
		 i_R0 : in std_logic_vector(31 downto 0);
		 i_S : in std_logic;
		 o_Q : out std_logic_vector(31 downto 0));
end component;

component instructionMemory 
port ( i_readAddress : in std_logic_vector (31 downto 0);
		 o_instruction : out std_logic_vector (31 downto 0));
end component;

component DataMemory
port ( i_clk: in std_logic;
		 i_Address   : in std_logic_vector (31 downto 0);
		 i_WriteData : in std_logic_vector (31 downto 0);
		 i_MemRead   : in std_logic;
		 i_MemWrite  : in std_logic;
		 o_ReadData  : out std_logic_vector (31 downto 0));
end component;

component control
port ( i_instrucao : in std_logic_vector(5 downto 0);
		 o_RegDst :  out std_logic; -- 
		 o_Jump :  out std_logic; -- 
		 o_OrigALU :  out std_logic;
		 o_MemToReg :  out std_logic; -- 
		 o_WriteReg :  out std_logic; -- 
		 o_WriteMem :  out std_logic; -- 
		 o_MemRead :  out std_logic; -- 
		 o_Branch:  out std_logic; -- 
		 o_ALUOp : out std_logic_vector(1 downto 0)); -- 
end component;

component sign_extended
port (
    i_16bits : in std_logic_vector(15 downto 0);
    o_32bits : out std_logic_vector(31 downto 0));
end component;
			
signal w_o_pc_Q, w_o_somadorPC, w_o_instruction, w_o_mux_32bits_DataMemory, w_o_readData1, 
		 w_o_readData2, w_o_sign_extended, w_o_mux_32bits_ULA, w_ULA_Result, w_DataMemory_Result,
		 w_o_shift_left_32bits, w_o_addPath, w_o_mux_32bits_addPath, w_o_mux_32bits_jump : std_logic_vector(31 downto 0);
		 
signal w_o_RegDst, w_o_Jump, w_o_OrigALU, w_o_MemToReg, w_o_WriteReg, w_o_WriteMem, w_o_MemRead, w_o_Branch, w_ULA_Zero: std_logic;

signal w_o_ALUOp : std_logic_vector(1 downto 0);

signal w_o_mux_5bits_RF : std_logic_vector(4 downto 0);

signal w_ULA_OP : std_logic_vector(3 downto 0);

signal w_o_shift_left_28bits : std_logic_vector(27 downto 0);

begin
	
	u_ProgramCounter : program_counter port map (i_clk, w_o_mux_32bits_jump, w_o_pc_Q);
	
	u_InstructionMemory : instructionMemory port map (w_o_pc_Q, w_o_instruction);
	
	u_somadorPC : somadorPC port map(w_o_pc_Q, w_o_somadorPC); -- 
	
	u_mux_5bits_RF : mux_2x1_5bits port map(w_o_instruction(20 downto 16), w_o_instruction(15 downto 11), w_o_RegDst, w_o_mux_5bits_RF); --
	
	u_RegisterFile : RegisterFile port map(i_clk, w_o_instruction(25 downto 21), w_o_instruction(20 downto 16), 
														w_o_mux_5bits_RF, w_o_mux_32bits_DataMemory, w_o_WriteReg, w_o_readData1, w_o_readData2); --
	
	u_control : control port map(w_o_instruction(31 downto 26), w_o_RegDst, w_o_Jump, w_o_OrigALU, w_o_MemToReg, 
										  w_o_WriteReg, w_o_WriteMem, w_o_MemRead, w_o_Branch, w_o_ALUOp); --
	
	u_shift_left_32bits : shift_left_32bits port map(w_o_sign_extended, w_o_shift_left_32bits); -- 
	
	u_shift_left_28bits : shift_left_28bits port map(w_o_instruction(25 downto 0), w_o_shift_left_28bits); -- 
	
	u_sign_extended : sign_extended port map(w_o_instruction(15 downto 0), w_o_sign_extended); --
	
	u_mux_32bits_ULA : mux_2x1_32bits port map(w_o_readData2, w_o_sign_extended, w_o_OrigALU, w_o_mux_32bits_ULA); -- 
	
	u_ULA_control : ULA_control port map(w_o_instruction(5 downto 0), w_o_ALUOp, w_ULA_OP); --
	
	u_ULA : ULA port map (w_o_readData1, w_o_mux_32bits_ULA, w_ULA_OP, w_ULA_Result, w_ULA_Zero); -- 
	
	u_add_path : add_path port map(w_o_somadorPC, w_o_shift_left_32bits, w_o_addPath); -- 
	
	u_mux_32bits_add_path : mux_2x1_32bits port map(w_o_somadorPC, w_o_addPath, (w_o_Branch and  w_ULA_Zero), w_o_mux_32bits_addPath); -- 
	
	u_mux_32bits_jump : mux_2x1_32bits port map(w_o_mux_32bits_addPath, (w_o_somadorPC(31 downto 28) & w_o_shift_left_28bits), 
															  w_o_Jump, w_o_mux_32bits_jump); 	
	
	u_DataMemory : DataMemory port map(i_clk, w_ULA_Result, w_o_readData2, w_o_MemRead, w_o_WriteMem, w_DataMemory_Result); -- 
	
	u_mux_32bits_DataMemory : mux_2x1_32bits port map(w_ULA_Result, w_DataMemory_Result, w_o_MemToReg, w_o_mux_32bits_DataMemory); --
		
end arc_1;
