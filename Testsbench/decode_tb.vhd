library ieee;
use ieee.std_logic_1164.all;

entity decode_tb is
end decode_tb;

architecture test of decode_tb is

    component decode
        port(
            in_dec : in std_logic_vector(7 downto 0);
            alu_op : out std_logic_vector(2 downto 0);
            bus_sel: out std_logic_vector(1 downto 0);
            out_we, reg_we, reg_a_we : out std_logic);
    end component;
end test;