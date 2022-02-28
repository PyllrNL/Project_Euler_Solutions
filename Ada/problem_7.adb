with Ada.Text_IO; use Ada.Text_IO;
with Ada.Containers.Vectors;

procedure problem_7 is

    type Int64 is range -2**63 .. 2**63 - 1;

    package P is new Ada.Containers.Vectors(Index_Type => Natural, Element_Type => Int64);

    Prime_Count : Int64 := 1;
    Inc : Int64 := 3;
    Primes : P.Vector;
    Divisible : Boolean;

begin

    Primes.append(2);

    while Prime_Count /= 10_001 loop
        Divisible := false;
        for E of Primes loop
            if Inc mod E = 0 then
                Divisible := Divisible or true;
            end if;
        end loop;
        if Divisible = false then
            Primes.append(Inc);
            Prime_Count := Prime_Count + 1;
        end if;
        Inc := Inc + 2;
    end loop;

    Put_Line(Int64'Image(Primes.Last_Element));

end problem_7;
