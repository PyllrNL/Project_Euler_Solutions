with Ada.Text_IO; use Ada.Text_IO;
with Ada.Numerics; use Ada.Numerics;
with Ada.Numerics.Elementary_Functions;
use Ada.Numerics.Elementary_Functions;
with Ada.Containers.Vectors;

procedure problem_5 is

    type Int64 is range -2**63 .. 2**63 - 1;

    type Prime_Count is record
        Prime : Int64;
        Count : Int64;
    end record;

    package P is new Ada.Containers.Vectors(Index_Type => Natural,
    Element_Type => Prime_Count);

    function Solve_1( Min, Max : Integer ) return Int64 is
        Num : Int64 := 1;
        Primes : P.Vector;
    begin

        for I in Min .. Max loop
            declare
                Upper : constant Int64 := Int64(I);
                N : Int64 := Int64(I);
                J : Int64 := 3;
                Inc : Integer := 0;
                Count : Integer := 0;
                Found : Boolean := false;
                Prime : Prime_Count;
            begin
                if N mod 2 = 0 then
                    Count := 1;
                    N := N / 2;
                    while N mod 2 = 0 loop
                        Count := Count + 1;
                        N := N / 2;
                    end loop;
                    for E of Primes loop
                        if E.Prime = 2 then
                            Found := true;
                            if Int64(Count) > E.Count then
                                E.Count := Int64(Count);
                            end if;
                        end if;
                    end loop;
                    if Found = false then
                        Prime := ( Prime => 2, Count => Int64(Count) );
                        Primes.append(Prime);
                    end if;
                end if;

                outer:
                while J <= Upper loop
                    Found := false;
                    if N mod J = 0 then
                        Count := 1;
                        N := N / J;
                        while N mod J = 0 loop
                            Count := Count + 1;
                            N := N / J;
                        end loop;
                        for E of Primes loop
                            if E.Prime = J then
                                Found := True;
                                if Int64(Count) > E.Count then
                                    E.Count := Int64(Count);
                                end if;
                            end if;
                        end loop;
                        if Found = false then
                            Prime := ( Prime => J, Count => Int64(Count));
                            Primes.append(Prime);
                        end if;
                    end if;
                    J := J + 2;
                end loop outer;
            end;
        end loop;

        for E of Primes loop
            for I in 1 .. E.Count loop
                Num := Num * E.Prime;
            end loop;
        end loop;

        return Num;

    end Solve_1;

    function Greatest_Common_Divisor( A, B : Integer ) return Integer is
        X : Integer := A;
        Y : Integer := B;
        Temp : Integer;
    begin
        loop
            Temp := Y mod X;
            Y := X;
            X := Temp;
            exit when Temp = 0;
        end loop;

        return Y;
    end Greatest_Common_Divisor;

    function Least_Common_Multiple( A, B : Integer ) return Integer is
        X : Constant Integer := (if A >= 0 then A else -A);
        Y : Constant Integer := (if B >= 0 then B else -B);
    begin
        return (X / Greatest_Common_Divisor( A, B)) * Y;
    end Least_Common_Multiple;

    function Solve_2( Min, Max : Integer ) return Int64 is
        Temp : Integer := Min;
    begin
        for I in (Min + 1) .. Max loop
            Temp := Least_Common_Multiple( Temp, I );
        end loop;

        return Int64(Temp);
    end Solve_2;

begin

    Put_Line(Int64'Image(Solve_1(1, 20)));
    Put_Line(Int64'Image(Solve_2(1, 20)));

end problem_5;
