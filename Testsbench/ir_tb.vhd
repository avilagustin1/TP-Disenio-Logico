library ieee;
use ieee.std_logic_1164.all;

entity IR_tb is
end IR_tb;

architecture a_IR_tb of IR_tb is
	component IR
    	port(ir_in : in std_logic_vector(15 downto 0);
    		clk, reset : in std_logic;
    		ir_out : out std_logic_vector(15 downto 0));
    end component;
    signal s_ir_in, s_ir_out : std_logic_vector(15 downto 0);
    signal clk, reset : std_logic;
    constant espera : time := 10 ns;
begin
	uut : IR
    	port map(ir_in=>s_ir_in, clk=>clk, reset=>reset, ir_out=>s_ir_out);
    tb : process
    begin
                        --reset bajo, clock bajo, a con valor--
    	reset <= '0';
    	clk <= '0';
        s_ir_in <= "1111111111111111";
        wait for espera;
        assert s_ir_out="XXXXXXXXXXXXXXXX" report "s/f" severity warning;
                        --flanco de reloj--
        clk <= '1';
        s_ir_in <= "0000000000000000";
        wait for espera;
        assert s_ir_out=s_ir_in report "f" severity warning;
        clk <= '0';
        s_ir_in <= "1111111111111111";
        wait for espera;
                        --reset alto
    	reset <= '1';
        wait for espera;
        assert s_ir_out="0000000000000000" report "r1" severity warning;
        clk <= '1';
        wait for espera;
        assert s_ir_out="0000000000000000" report "r2" severity warning;
        clk <= '0';
        wait for espera;
        reset <= '0';
        s_ir_in <= "1111111100000000";
        wait for espera;
        assert s_ir_out="0000000000000000" report "r3" severity warning;
        wait for espera;
        clk <= '1';
        wait for espera;
        assert s_ir_out=s_ir_in report "af" severity warning;
        wait;
    end process;