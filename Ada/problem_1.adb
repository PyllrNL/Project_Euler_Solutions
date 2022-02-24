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
            First_Term : constant Int64 := N;
            Last_Term : constant Int64 := Top - ( Top mod N );
            N_Terms : constant Int64 := Last_Term / N;
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
    Input : Int64 := 1;

begin

    for I in 1 .. 9 loop
        Put(Int64'Image(Input));
        Start_Time := Clock;
        for I in 1 .. 1_000 loop
            Test := Solve_1(Input);
        end loop;
        End_Time := Clock;
        Dur := (End_Time - Start_Time) / 1_000;

        Put(Duration'Image(Dur));
        Start_Time := Clock;
        for I in 1 .. 1_000 loop
            Test := Solve_2(Input);
        end loop;
        End_Time := Clock;
        Dur := (End_Time - Start_Time) / 1_000;
        Put(Duration'Image(Dur));

        Input := Input * 10;
        New_Line;
    end loop;

end Problem_1;
