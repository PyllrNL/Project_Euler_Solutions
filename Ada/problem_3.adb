with Ada.Text_IO; use Ada.Text_IO;
with Ada.Numerics; use Ada.Numerics;
with Ada.Numerics.Elementary_Functions;
use Ada.Numerics.Elementary_Functions;

procedure problem_3 is

    type Int64 is range -2**63 .. 2**63 -1;

    type Prime_Count is record
        Prime : Integer;
        Count : Integer;
    end record;

    type Prime_List is array (Natural range <>) of Prime_Count;

    function Prime_Factorization( Num : Int64 ) return Prime_List is
        Upper : constant Int64 := Int64(Sqrt(Float(Num)));
        N : Int64 := Num;
        I : Int64 := 3;
        Inc : Integer := 0;
        Count : Integer := 0;
        Prime_Upper_Bound : Int64 := Upper / (Int64(Log(Float(Upper), Float(10))));
        Primes : Prime_List(0 .. Integer(Prime_Upper_Bound));
    begin
        Put_Line(Int64'Image(Prime_Upper_Bound));
        if N mod 2 = 0 then
            Count := 1;
            N := N / 2;
            while N mod 2 = 0 loop
                Count := Count + 1;
                N := N / 2;
            end loop;
            Primes(Inc) := (Prime => 2, Count => Count);
            Inc := Inc + 1;
        end if;

        outer:
        while I <= Upper loop
            if N mod I = 0 then
                Count := 1;
                N := N / I;
                while N mod I = 0 loop
                    Primes(Inc).Count := Primes(Inc).Count + 1;
                    N := N / I;
                end loop;
                Primes(Inc) := ( Prime => Integer(I), Count => Count );
                Inc := Inc + 1;
            end if;
            I := I + 2;
        end loop outer;

        declare
            Primes_Ret : Prime_List(0 .. Inc - 1) := Primes(0 .. Inc - 1);
        begin
            return Primes_Ret;
        end;
    end Prime_Factorization;

    function Solve_1( Comp : Int64 ) return Int64 is
        Primes : constant Prime_List := Prime_Factorization(600851475143);
    begin
        return Int64(Primes(Primes'Last).Prime);
    end Solve_1;

begin

    Put_Line(Int64'Image(Solve_1(600851475143)));

end problem_3;
