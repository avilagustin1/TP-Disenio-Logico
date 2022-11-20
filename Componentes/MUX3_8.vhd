library ieee;
use ieee.std_logic_1164.all;

entity MUX3_8 is
    port(a_in, b_in, c_in : in std_logic_vector(7 downto 0);
        selector : in std_logic_vector(1 downto 0);
        mux_out : out std_logic_vector(7 downto 0));
end MUX3_8;

architecture a_MUX3_8 of MUX3_8 is

begin
    with selector select
        mux_out <= a_in when "00",
                   b_in when "01",
                   c_in when "10",
                   "XXXXXXXX" when others;
end a_MUX3_8;
    