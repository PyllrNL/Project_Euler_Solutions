with Ada.Text_IO; use Ada.Text_IO;
with Ada.Numerics; use Ada.Numerics;
with Ada.Numerics.Elementary_Functions;
use Ada.Numerics.Elementary_Functions;

procedure problem_3 is

    type Int64 is range -2**63 .. 2**63 -1;

    function Solve_1( Comp : Int64 ) return Int64 is
        Largest_Prime_Factor : Int64 := 0;
        Upper : constant Int64 := Int64(Sqrt(Float(Comp)));
        N : Int64 := Comp;
        I : Int64 := 3;
    begin

        while N mod 2 = 0 loop
            Largest_Prime_Factor := 2;
            N := N / 2;
        end loop;

        outer:
        while I < Upper loop
            while N mod I = 0 loop
                Largest_Prime_Factor := I;
                N := N / I;
                if N = 1 then
                    exit outer;
                end if;
            end loop;
            I := I + 2;
        end loop outer;

        return Largest_Prime_Factor;
    end Solve_1;

begin

    Put_Line(Int64'Image(Solve_1(600851475143)));

end problem_3;
