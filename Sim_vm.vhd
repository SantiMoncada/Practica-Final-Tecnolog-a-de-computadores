----------------------------------------------------------------------------------
-- Company: Antonio de Nebrija
-- Engineers: Ferrari Bedetti Agustín & Villarreal Vaquero Borja
-- Design Name: Vending_Machine_Chan_V8
-- Module Name: Vending_Machine
-- Project Name: Final Project
-- Target Devices: Nexys 4 DDR
-- Description: This hardware will simulate a vending machine and it's parts.
----------------------------------------------------------------------------------


--Definition and Standards to use
library IEEE;                       --Basic library
    use IEEE.STD_LOGIC_1164.ALL;        --Logic standard
    use IEEE.STD_LOGIC_UNSIGNED.ALL;    --Unsigned logic standard


--Entity (it's null because it's a simulation source)
entity Sim_vm is
end Sim_vm;


--Architecture
architecture Behavioral of Sim_vm is
    
    --Component of the Vending machine
    component Vending_Machine is
    Port (
        --Clock and reset                                   --Clock and resets
        clk      : in     STD_LOGIC;                            --Clock that controls the hardware
        rst_c    : in     STD_LOGIC;                            --Reset the cans       
        rst_m    : in     STD_LOGIC;                            --Reset the money (give back change)
        
        --Money and change                                  --Money state: money inserted; change and change received
        money    : in     STD_LOGIC_VECTOR (2 downto 0);        --Money that the user puts in
        change   : out    STD_LOGIC_VECTOR (2 downto 0) := "000";        --Change that the user will receive
        change_r : in     STD_LOGIC;                            --Input that says that the change was received
        
        --Can out and can received                          --Cans state: number of cans; received; requested and empty
        can      : out    STD_LOGIC := '0';                            --Output that says that the can
        r_can    : in     STD_LOGIC;                            --Input that tells the machine that the user requests a can
        can_r    : in     STD_LOGIC;                            --Input that says that the can was received
        empty    : out    STD_LOGIC := '0'                            --Output that tells that the are no more cans
    );
    end component;
    
    --Signals of the simulation                                 --Signals of the simulation
        --Clock and reset                                           --Clock and resets
        signal clk_s      : STD_LOGIC := '0';                           --Clock that controls the hardware
        signal rst_c_s    : STD_LOGIC := '0';                           --Reset the cans       
        signal rst_m_s    : STD_LOGIC := '0';                           --Reset the money (give back change)
        
        --Money and change                                          --Money state: money inserted; change and change received
        signal money_s    : STD_LOGIC_VECTOR (2 downto 0) := "000";     --Money that the user puts in
        signal change_s   : STD_LOGIC_VECTOR (2 downto 0);              --Change that the user will receive
        signal change_r_s : STD_LOGIC := '0';                           --Input that says that the change was received
        
        --Can out and can received                                  --Cans state: number of cans; received; requested and empty
        signal can_s      : STD_LOGIC;                                  --Output that says that the can
        signal r_can_s    : STD_LOGIC := '0';                                  --Input that tells the machine that the user requests a can
        signal can_r_s    : STD_LOGIC := '0';                           --Input that says that the can was received
        signal empty_s    : STD_LOGIC;                                  --Output that tells that the are no more cans
    
    --Processes and Design unit test
    begin
        --Design unit test
        DUT : Vending_Machine port map(  --DUT set
            --Clock and reset               --Clock and resets
            clk      => clk_s,                  --Clock that controls the hardware
            rst_c    => rst_c_s,                --Reset the cans   
            rst_m    => rst_m_s,                --Reset the money (give back change)
            
            --Money and change              --Money state: money inserted; change and change received
            money    => money_s,                --Money that the user puts in    
            change   => change_s,               --Change that the user will receive
            change_r => change_r_s,             --Input that says that the change was received
            
            --Can out and can received      --Cans state: number of cans; received; requested and empty
            can      => can_s,                  --Output that says that the can
            r_can    => r_can_s,                --Input that tells the machine that the user requests a can
            can_r    => can_r_s,                --Input that says that the can was received
            empty    => empty_s                 --Output that tells that the are no more cans
        );
        
        
        --Processes
        --CLK
        process begin                       --Process to make the clock
            while ( (0-0) = (0-0) ) loop        --Semi OwO true loop
                clk_s <= not clk_s;                 --Change the clock to not the actual value of the clock
                wait for 5ns;                       --Clock wait
            end loop;
        end process;
        
        --Test
        process begin
            --Starting wait for the machine to start
            wait for 100ns;
            
            --Less money test
            money_s    <= "001";    wait for 10 ns;         --Insert 1$
            money_s    <= "000";    wait for 10 ns;
            r_can_s    <= '1';      wait for 10 ns;         --Request one can
            r_can_s    <= '0';      wait for 10 ns;
            rst_m_s    <= '1';      wait for 10 ns;         --Request change
            rst_m_s    <= '0';      wait for 10 ns;
            change_r_s <= '1';      wait for 10 ns;         --Change received
            change_r_s <= '0';      wait for 10 ns;
            
            
            --Exact quantity of money test
            money_s    <= "010";    wait for 10 ns;         --Insert 2$
            money_s    <= "000";    wait for 10 ns;
            r_can_s    <= '1';      wait for 10 ns;         --Request one can
            r_can_s    <= '0';      wait for 10 ns;
            can_r_s    <= '1';      wait for 10 ns;         --Can received
            can_r_s    <= '0';      wait for 10 ns;
            change_r_s <= '1';      wait for 10 ns;         --Change received
            change_r_s <= '0';      wait for 10 ns;
            
            
            --More money test
            money_s    <= "101";    wait for 10 ns;         --More money than neccesary for can
            money_s    <= "000";    wait for 10 ns;
            r_can_s    <= '1';      wait for 10 ns;         --Request one can
            r_can_s    <= '0';      wait for 10 ns;
            can_r_s    <= '1';      wait for 10 ns;         --Can received
            can_r_s    <= '0';      wait for 10 ns;
            change_r_s <= '1';      wait for 10 ns;         --Change received
            change_r_s <= '0';      wait for 10 ns;
            
            
            --Empty the machine
            money_s    <= "010";    wait for 10 ns;         --Another request for empty the vending machine
            money_s    <= "000";    wait for 10 ns;
            r_can_s    <= '1';      wait for 10 ns;         --Request one can
            r_can_s    <= '0';      wait for 10 ns;
            can_r_s    <= '1';      wait for 10 ns;         --Can received
            can_r_s    <= '0';      wait for 10 ns;
            change_r_s <= '1';      wait for 10 ns;         --Change received
            change_r_s <= '0';      wait for 10 ns;
            
            
            --Not enough cans test
            money_s    <= "010";    wait for 10 ns;         --Insert 2$
            money_s    <= "000";    wait for 10 ns;
            r_can_s    <= '1';      wait for 10 ns;         --Request one can
            r_can_s    <= '0';      wait for 10 ns;
            change_r_s <= '1';      wait for 10 ns;         --Change received
            change_r_s <= '0';      wait for 10 ns;
            
            --Reset cans in the machine
            rst_c_s    <= '1';      wait for 10 ns;         --New cans added to the machine
            rst_c_s    <= '0';      wait for 10 ns;
            
            
            --End of test wait
            wait for 300ns;
            
            --End of test
        end process;
    --End of the processes
end Behavioral;