library ieee;
use ieee.std_logic_1164.all;

entity IR is
    port(ir_in : in std_logic_vector(15 downto 0);
        clk,ir_we : in std_logic;
        ir_out : out std_logic_vector(15 downto 0));
end IR;

architecture a_IR of IR is
begin
    process(clk,ir_we,ir_out)
    begin
        if ir_we = '1' then
            ir_out <= (others => '0');
        elsif (clk'event and clk='1') then
            ir_out <= ir_in;
        end if;
    end process;
end a_IR;
