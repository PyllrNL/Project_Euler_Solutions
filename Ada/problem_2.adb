with Ada.Text_IO; use Ada.Text_IO;

procedure problem_2 is

    type Int64 is range -2**63 .. 2**63 - 1;

    function Solve_1( Max : Int64 ) return Int64 is
        N_1_Term : Int64 := 1;
        N_Term : Int64 := 1;
        Value : Int64 := 0;
        Sum : Int64 := 0;
    begin
        loop
            Value := N_1_Term + N_Term;

            exit when Value > Max;

            if Value mod 2 = 0 then
                Sum := Sum + Value;
            end if;
            N_1_Term := N_Term;
            N_Term := Value;
        end loop;

        return Sum;
    end Solve_1;

    function Solve_2( Max : Int64 ) return Int64 is
        N_1_Term : Int64 := 2;
        N_Term : Int64 := 8;
        Sum : Int64 := N_1_Term + N_Term;
        Value : Int64 := 0;
    begin
        loop
            Value := 4*N_Term + N_1_Term;

            exit when Value > Max;

            Sum := Sum + Value;
            N_1_Term := N_Term;
            N_Term := Value;
        end loop;

        return Sum;
    end Solve_2;

begin

    Put_Line(Int64'Image(Solve_1(4_000_000)));
    Put_Line(Int64'Image(Solve_2(4_000_000)));

end problem_2;
