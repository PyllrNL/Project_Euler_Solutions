with Ada.Text_IO; use Ada.Text_IO;

procedure problem_2 is

    type Int64 is range -2**63 .. 2**63 - 1;

    N_1_Term : Int64 := 1;
    N_Term : Int64 := 1;
    Value : Int64 := 0;
    Sum : Int64 := 0;

begin

    while Value < 4_000_000 loop
        Value := N_1_Term + N_Term;
        if Value mod 2 = 0 then
            Sum := Sum + Value;
        end if;
        N_1_Term := N_Term;
        N_Term := Value;
    end loop;

    Put_Line(Int64'Image(Sum));

end problem_2;
