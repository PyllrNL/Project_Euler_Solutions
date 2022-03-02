package body Problem_7 is

    function Solution_1( Num : Integer ) return Int64 is
        Primes : P.Vector;
        Prime_Count : Int64 := 1;
        Inc : Int64 := 3;
        Divisible : Boolean;
    begin
        if Num < 2 then
            return 0;
        end if;

        Primes.append(2);

        while Prime_Count /= Int64(Num) loop
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

        return Primes.Last_Element;
    end Solution_1;

    procedure Test_Solution_1 is
        Solution : constant Int64 := 104743;
    begin
        Assert( Solution_1(10_001) = Solution );
    end Test_Solution_1;

    function Get_Solutions return Solution_Case is
        Ret : Solution_Case;
    begin
        Set_Name( Ret, "Problem 7");
        Add_Test( Ret, Test_Solution_1'Access );
        return Ret;
    end Get_Solutions;

end Problem_7;
