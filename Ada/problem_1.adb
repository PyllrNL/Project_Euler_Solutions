with Ada.Text_IO; use Ada.Text_IO;
with Ada.Calendar; use Ada.Calendar;

procedure Problem_1 is
    Sum_Of_Multiples: Integer := 0;

    function Solve_1( Max : Integer ) return Integer is
        Sum : Integer := 0;
    begin
        for I in 3 .. Max - 1 loop
            if I mod 3 = 0 or else I mod 5 = 0 then
                Sum := Sum + I;
            end if;
        end loop;

        return Sum;
    end Solve_1;

    function Solve_2( Max : Integer ) return Integer is
        Sum : Integer := 0;

        function Arithmetic_Sequence( N, Top : Integer ) return Integer is
            First_Term : Integer := N;
            Last_Term : Integer := Top - ( Top mod N );
            N_Terms : Integer := Last_Term / N;
        begin
            return N_Terms * ( First_Term + Last_Term) / 2;
        end Arithmetic_Sequence;

    begin
        Sum := Arithmetic_Sequence( 3, Max - 1);
        Sum := Sum + Arithmetic_Sequence( 5, Max - 1);
        Sum := Sum - Arithmetic_Sequence( 3*5, Max - 1);
        return Sum;
    end Solve_2;

    Solution : Integer := 233168;
    Test : Integer;

    Start_Time, End_Time : Time;
    Dur : Duration;

begin

    Put_Line("Running first Solution");
    Start_Time := Clock;
    for I in 1 .. 1_000 loop
        Test := Solve_1(1_000);
    end loop;
    End_Time := Clock;
    Dur := (End_Time - Start_Time) / 1_000;

    if Test = Solution then
        Put_Line("Expected Result of" & Integer'Image(Test) & " Has been returned");
    end if;

    Put_Line("Runtime(Avg) = " & Duration'Image(Dur) & " ms");

    New_Line;

    Put_Line("Running second solution");
    Start_Time := Clock;
    for I in 1 .. 1_000 loop
        Test := Solve_1(1_000);
    end loop;
    End_Time := Clock;
    Dur := (End_Time - Start_Time) / 1_000;

    if Test = Solution then
        Put_Line("Expected Result of" & Integer'Image(Test) & " Has been returned");
    end if;

    Put_Line("Runtime(Avg) = " & Duration'Image(Dur) & " ms");
end Problem_1;
