with Ada.Text_IO; use Ada.Text_IO;
with Ada.Numerics; use Ada.Numerics;
with Ada.Numerics.Elementary_Functions;
use Ada.Numerics.Elementary_Functions;
with Ada.Containers.Vectors;

procedure problem_3 is

    type Int64 is range -2**63 .. 2**63 -1;

    type Prime_Count is record
        Prime : Integer;
        Count : Integer;
    end record;

    package P is new Ada.Containers.Vectors(Index_Type => Natural,
    Element_Type => Prime_Count);

    function Prime_Factorization( Num : Int64 ) return P.Vector is
        Upper : constant Int64 := Int64(Sqrt(Float(Num)));
        N : Int64 := Num;
        I : Int64 := 3;
        Inc : Integer := 0;
        Count : Integer := 0;
        Prime : Prime_Count;
        Primes : P.Vector;
    begin
        if N mod 2 = 0 then
            Count := 1;
            N := N / 2;
            while N mod 2 = 0 loop
                Count := Count + 1;
                N := N / 2;
            end loop;
            Prime := (Prime => 2, Count => Count);
            Primes.append( Prime );
            Inc := Inc + 1;
        end if;

        outer:
        while I <= Upper loop
            if N mod I = 0 then
                Count := 1;
                N := N / I;
                while N mod I = 0 loop
                    Count := Count + 1;
                    N := N / I;
                end loop;
                Prime := (Prime => Integer(I), Count => Count);
                Primes.append( Prime );
                Inc := Inc + 1;
            end if;
            I := I + 2;
        end loop outer;

        return Primes;

    end Prime_Factorization;

    function Solve_1( Comp : Int64 ) return Int64 is
        Primes : P.Vector := Prime_Factorization(600851475143);
    begin
        return Int64(Primes.Last_Element.Prime);
    end Solve_1;

begin

    Put_Line(Int64'Image(Solve_1(600851475143)));

end problem_3;
