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

--Entity
entity Vending_Machine is
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
end Vending_Machine;


--Architecture
architecture Behavioral of Vending_Machine is
    --States                                                    --States
    type state_type is (S0, S1, S2, S3, S4);                        --States
    signal state : state_type;                                --Actual state
    signal state_n : state_type;                              --Next state
    
    --Signals and definitions                                   --Signals and definitions
    signal cans       : STD_LOGIC_VECTOR (2 downto 0)   := "011"; --Number of cans available
    signal money_in   : STD_LOGIC_VECTOR (2 downto 0)   := "000"; --Money inside the system
    signal rst_sign   : STD_LOGIC_VECTOR (1 downto 0)   := "00";  --Internal signal of resets
    signal buying     : STD_LOGIC_VECTOR (1 downto 0)   := "00";
    
    --Processes
    begin
        --Clock for the state change
        process(clk, rst_sign) begin       --Changes in clk or the rst
            if (NOT(rst_sign = "00")) then           --Reset signals
                if (rst_sign(0) = '1') then                       --Reset the cans
                    state <= S0;                                    --Go to the initial state
                end if;
                if (rst_sign(1) = '1') then                       --Reset the change
                    state <= S4;                                    --Go to the change state
                end if;
            elsif rising_edge(clk) then                 --Rising Edge in the clock
                state <= state_n;                           --Set the state to the next state
            end if;
        end process;


        --Button interaction
        process (rst_c) begin            --Reset can
            if (rst_c = '1') then
                rst_sign(0) <= '1';       --Signal active
            else
                rst_sign(0) <= '0';       --Signal not active
            end if;
        end process;
    
        process (rst_m) begin           --Reset change
            if (rst_m = '1') then
                rst_sign(1) <= '1';       --Signal active
            else
                rst_sign(1) <= '0';       --Signal not active
            end if;
        end process;
        
           
        --State change and item interaction
        process (state, money, r_can, can_r, change_r) begin      --State changes
            --Items received
            if (can_r = '1') then       --Can received
                can <= '0';                 --Disable can
            end if;
            if (change_r = '1') then    --Change received
                change <= "000";            --Change is 0
            end if;
            if (cans = "000") then      --Empty machine
                empty <= '1';               --Machine is empty
            end if;
            
            --States
            case state is                               --State switch
                when S0 =>                                  --Reset state goes
                --Reset the cans and empty                  --Reset the cans and empty
                cans  <= "011";                                 --3 cans available
                empty <= '0';                                   --Machine not empty
                
                --Go to the change state                    --Go to the change state
                state_n <= S4;                                      --Set the next state to the change state
                
                when S1 =>                                  --Initial state
                    --Buying                                    --Buying
                    if (buying = "11") then                         --If it came from change
                        buying <= "00";                                 --Buying reset
                    end if;

                    --Money enter                               --Money enter
                    if (money_in >= "010") then                     --There is enough money
                        state_n <= S2;                                  --Go to the next state
                    elsif (money > "000") then                      --There is money inserted
                        if (money = "001" or                            --Money is 1$
                            money = "010" or                            --Money is 2$
                            money = "101")                              --Money is 5$
                            then                                        --Money is inside the parameters
                                money_in <= (money_in + money);             --Add the money
                        else                                            --Return unknown quantity
                            change <= money;                                --Return the money
                        end if;
                    end if;
                    
                when S2 =>                                  --Cans enough state
                    if (r_can = '1' and buying = "00") then     --The can was requested and is not buying
                        if (cans > "000") then                      --There are more than 0 cans
                            --Go to the buy state                       --Go to the buy state
                            state_n <= S3;                                  --Go to the buy state
                            
                            --Buying lock                               --Buying lock
                            buying <= "01";                                 --Buying in S2 enable
                        else                                        --There are no cans give change
                            state_n <= S4;                              --Go to the change state
                        end if;
                    end if;
                    
                when S3 =>                                  --Buy state
                    if (buying = "01") then                      --Buying lock
                        --Buying lock                               --Buying lock
                        buying <= "10";                                 --Buying in S3 enable
                        
                        --Buy process                               --Buy process
                        money_in <= (money_in - "010");                 --Buys the quantity and subtracts it from the money inside
                        can      <= '1';                                --Sets the output of the can to 1
                        cans     <= (cans - "001");                     --Removes one can
                        
                        --Go to the change state                    --Go to the change state
                        state_n <= S4;                                      --Set the next state to the change state
                    end if;
                    
                when S4 =>                                  --Change state
                    if (buying = "10" or buying = "00") then    --Buying lock
                        --Buying lock                               --Buying lock
                        buying <= "11";                                 --Buying in S4 enable
                    
                        --Change check                              --Change check
                        change   <= money_in;                           --Set the change to the money inside the machine
                        money_in <= "000";                              --Set that there is no more money inside the machine
                        
                        --Go to the initial state                   --Go to the initial state
                        state_n <= S1;                                  --Set the next state to the initial state
                    end if;
                when others =>                              --Unknown state
                    state_n <= S0;                              --Go to the reset state
            end case;
        end process;
        
        
    --End of the processes
end Behavioral;