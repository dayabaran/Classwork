-- MIPS Processor VHDL Behavioral Model
--
-- ALU module (implements the data ALU and Branch Address Adder)
--
-- 
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_SIGNED.ALL;

ENTITY  ALU IS
	PORT(	Read_data_1 		: IN 	STD_LOGIC_VECTOR( 31 DOWNTO 0 );
			Read_data_2 		: IN 	STD_LOGIC_VECTOR( 31 DOWNTO 0 );
			ALUOp 				: IN 	STD_LOGIC_VECTOR( 3 DOWNTO 0 );
			shin				: IN	STD_LOGIC_VECTOR( 31 DOWNTO 0);
			ALU_Result 			: OUT	STD_LOGIC_VECTOR( 31 DOWNTO 0 ) );
END ALU;

ARCHITECTURE behavior OF ALU IS
SIGNAL Ainput, Binput 		: STD_LOGIC_VECTOR( 31 DOWNTO 0 );
SIGNAL ALU_output_mux		: STD_LOGIC_VECTOR( 31 DOWNTO 0 );
SIGNAL slt			: STD_LOGIC_VECTOR( 31 DOWNTO 0 );
BEGIN
						-- ALU input from register file
	Ainput <= Read_data_1;
						-- ALU input from mux -- don't forget external mux!!
	Binput <= Read_data_2;
						-- Generate ALU control bits
						-- Generate Zero Flag
						-- Select ALU output        
	ALU_result <= ALU_output_mux;
	slt <= X"00000001" 
		WHEN (Ainput < Binput)
		ELSE X"00000000";

PROCESS ( ALUOp, Ainput, Binput )
	BEGIN 
					-- Select ALU operation
		
 	CASE ALUOp IS
							--add
		WHEN "0000"	=>	ALU_output_mux <= Ainput + Binput;
		
							--addu
		WHEN "0001"	=>	ALU_output_mux <= Ainput + Binput;
		
							--sub
		WHEN "0010"	=>	ALU_output_mux <= Ainput - Binput;
		
							--subu
		WHEN "0011"	=>	ALU_output_mux <= Ainput - Binput;
		
							--and
		WHEN "0100"	=>	ALU_output_mux <= Ainput AND Binput;
		
							--or
		WHEN "0101"	=>	ALU_output_mux <= Ainput OR Binput;
		
							--nor
		WHEN "0110"	=>	ALU_output_mux <= Ainput NOR Binput;
		
							--slt
		WHEN "0111"	=>	ALU_output_mux <= slt;
							-- need shamt input to execute this instruction
							--sll, sra, lui
		WHEN "1000"	=>	ALU_output_mux <= shin;
		
		WHEN OTHERS		=>  ALU_output_mux 	<= X"00000000" ;
  	END CASE;
  END PROCESS;
END behavior;
