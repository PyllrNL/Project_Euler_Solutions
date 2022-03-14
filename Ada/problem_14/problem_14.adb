package body problem_14 is

    function Solution_1 return Integer is
        Upper : constant Integer := 1_000_000;
        Max : Integer := 0;
        Ret : Integer;
        Num : Integer;
        Current : Int64;
    begin
        for I in reverse 1 .. Upper loop
            Num := 1;
            Current := Int64(I);
            while Current /= 1 loop
                if Current mod 2 = 0 then
                    Current := Current / 2;
                else
                    Current := 3*Current + 1;
                end if;
                Num := Num + 1;
            end loop;
            if Num > Max then
                Max := Num;
                Ret := I;
            end if;
        end loop;
        return Ret;
    end Solution_1;

    procedure Test_Solution_1 is
        Solution : constant Integer := 837799;
    begin
        Assert( Solution_1 = Solution );
    end;

    function Get_Solutions return Solution_Case is
        Ret : Solution_Case;
    begin
        Set_Name( Ret, "Problem 14" );
        Add_Test( Ret, Test_Solution_1'access );
        return Ret;
    end Get_Solutions;

end problem_14;
