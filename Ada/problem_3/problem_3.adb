package body Problem_3 is

    function Solution_1( Comp : Int64 ) return Int64 is
        Primes : P.Vector := Prime_Factorization(Comp);
    begin
        return Int64(Primes.Last_Element.Prime);
    end Solution_1;

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

    procedure Test_Solution_1 is
        Solution : constant Int64 := 6857;
    begin
        Assert( Solution_1(600851475143) = Solution);
    end Test_Solution_1;

    function Get_Solutions return Solution_Case is
        Ret : Solution_Case;
    begin
        Set_Name( Ret, "Solutions to Problem 3");
        Add_Test( Ret, Test_Solution_1'Access );

        return Ret;
    end Get_Solutions;

end problem_3;
