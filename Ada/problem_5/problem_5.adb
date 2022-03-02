package body Problem_5 is

    function Solution_1( Min, Max : Integer ) return Int64 is
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

    end Solution_1;

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

    function Solution_2( Min, Max : Integer ) return Int64 is
        Temp : Integer := Min;
    begin
        for I in (Min + 1) .. Max loop
            Temp := Least_Common_Multiple( Temp, I );
        end loop;

        return Int64(Temp);
    end Solution_2;

    procedure Test_Solution_1 is
        Solution : constant Int64 := 232792560;
    begin
        Assert( Solution_1(1, 20) = Solution );
    end Test_Solution_1;

    procedure Test_Solution_2 is
        Solution : constant Int64 := 232792560;
    begin
        Assert( Solution_2(1, 20) = Solution );
    end Test_Solution_2;

    function Get_Solutions return Solution_Case is
        Ret : Solution_Case;
    begin
        Set_Name( Ret, "Problem 5");
        Add_Test( Ret, Test_Solution_1'Access );
        Add_Test( Ret, Test_Solution_2'Access );
        return Ret;
    end Get_Solutions;

end Problem_5;
