LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use IEEE.std_logic_unsigned.all;
-- Testbench 
ENTITY tb_ALU IS
END tb_ALU;
 
ARCHITECTURE behavior OF tb_ALU IS 
 
    -- Component Declaration for the 16-bit ALU
 
    COMPONENT ALU
    PORT(
         ABUS : IN  std_logic_vector(15 downto 0);
         BBUS : IN  std_logic_vector(15 downto 0);
         ALUctrl : IN  std_logic_vector(3 downto 0);
         ALUOUT : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
   
   --Inputs
   signal ABUS : std_logic_vector(15 downto 0) := (others => '0');
   signal BBUS : std_logic_vector(15 downto 0) := (others => '0');
   signal ALUctrl : std_logic_vector(3 downto 0) := (others => '0');

  --Outputs
   signal ALUOUT : std_logic_vector(15 downto 0);
 
BEGIN
 
 -- Instantiate the 16-bit ALU 
   uut: ALU PORT MAP (
          ABUS => ABUS,
          BBUS => BBUS,
          ALUctrl => ALUctrl,
          ALUOUT => ALUOUT
        );
   stim_proc: process
   begin  
      ABUS <= x"000A";
  BBUS <= x"0002";
  ALUctrl <= x"0";
  -- change ALU Control input
   for i in 0 to 15 loop 
  ALUctrl <= ALUctrl + x"1";
  wait for 100 ns;
   end loop;
      ABUS <= x"00F6";
  BBUS <= x"000A";
      wait;
   end process;

END;