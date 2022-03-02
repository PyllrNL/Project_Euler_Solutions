package body Problem_6 is

    function Solution_1 return Int64 is
        Sum_Of_Squares : Int64 := 0;
        Sum : Int64 := 0;
    begin
        for I in 1 .. 100 loop
            Sum_Of_Squares := Sum_Of_Squares + Int64(I*I);
            Sum := Sum + Int64(I);
        end loop;

        return (Sum * Sum ) - Sum_Of_Squares;
    end Solution_1;

    function Solution_2 return Int64 is
        Sum_Of_Squares : Constant Int64 := (100*(100 + 1)*(2*100 + 1)) / 6;
        Sum : Constant Int64 := (100*(100+1)) / 2;
    begin
        return (Sum*Sum) - Sum_Of_Squares;
    end Solution_2;

    procedure Test_Solution_1 is
        Solution : constant Int64 := 25164150;
    begin
        Assert( Solution_1 = Solution );
    end Test_Solution_1;

    procedure Test_Solution_2 is
        Solution : constant Int64 := 25164150;
    begin
        Assert( Solution_1 = Solution );
    end Test_Solution_2;

    function Get_Solutions return Solution_Case is
        Ret : Solution_Case;
    begin
        Set_Name( Ret, "Problem 6");
        Add_Test( Ret, Test_Solution_1'Access );
        Add_Test( Ret, Test_Solution_2'Access );
        return Ret;
    end Get_Solutions;

end Problem_6;
