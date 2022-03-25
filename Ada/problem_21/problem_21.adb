package body problem_21 is

    function Sum_Of_Divisors( Num : Integer ) return Integer is
        Sum : Integer := 1;
        I : Integer := 2;
    begin
        for I in 2 .. (Num / 2) loop
            if Num mod I = 0 then
                Sum := Sum + I;
            end if;
        end loop;

        return Sum;
    end Sum_Of_Divisors;

    function Solution_1 return Int64 is
        Solution : Integer := 0;
        Sum : Int64 := 0;
    begin
        for I in 1 .. 9999 loop
            Solution := Sum_Of_Divisors(I);
            if Sum_Of_Divisors(Solution) = I then
                if I /= Solution then
                    Sum := Sum + Int64(I);
                end if;
            end if;
        end loop;

        return Sum;
    end Solution_1;

    procedure Test_Solution_1 is
        Solution : constant Int64 := 31626;
    begin
        Assert( Solution = Solution_1 );
    end Test_Solution_1;

    function Get_Solutions return Solution_Case is
        Ret : Solution_Case;
    begin
        Set_Name( Ret, "Problem 21" );
        Add_Test( Ret, Test_Solution_1'Access );
        return Ret;
    end Get_Solutions;

end problem_21;
