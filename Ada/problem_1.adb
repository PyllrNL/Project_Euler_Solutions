with Ada.Text_IO; use Ada.Text_IO;
with Ada.Calendar; use Ada.Calendar;

procedure Problem_1 is

    type Int64 is range -2**63 .. 2**63 - 1;

    function Solve_1( Max : Int64 ) return Int64 is
        Sum : Int64 := 0;
    begin
        for I in 3 .. Max - 1 loop
            if I mod 3 = 0 or else I mod 5 = 0 then
                Sum := Sum + I;
            end if;
        end loop;

        return Sum;
    end Solve_1;

    function Solve_2( Max : Int64 ) return Int64 is
        Sum : Int64 := 0;

        function Arithmetic_Sequence( N, Top : Int64 ) return Int64 is
            First_Term : Int64 := N;
            Last_Term : Int64 := Top - ( Top mod N );
            N_Terms : Int64 := Last_Term / N;
        begin
            return N_Terms * ( First_Term + Last_Term) / 2;
        end Arithmetic_Sequence;

    begin
        Sum := Arithmetic_Sequence( 3, Max - 1);
        Sum := Sum + Arithmetic_Sequence( 5, Max - 1);
        Sum := Sum - Arithmetic_Sequence( 3*5, Max - 1);
        return Sum;
    end Solve_2;

    Solution : Int64 := 233168;
    Test : Int64;

    Start_Time, End_Time : Time;
    Dur : Duration;

begin

    Put_Line("Running first Solution");
    Start_Time := Clock;
    for I in 1 .. 1_000 loop
        Test := Solve_1(1_000_000_0);
    end loop;
    End_Time := Clock;
    Dur := (End_Time - Start_Time) / 1_000;

    Put_Line("Runtime(Avg) = " & Duration'Image(Dur) & " ms");

    New_Line;

    Put_Line("Running second solution");
    Start_Time := Clock;
    for I in 1 .. 1_000 loop
        Test := Solve_1(1_000_000_0);
    end loop;
    End_Time := Clock;
    Dur := (End_Time - Start_Time) / 1_000;

    Put_Line("Runtime(Avg) = " & Duration'Image(Dur) & " ms");
end Problem_1;
