package body problem_15 is

    function Solution_1 return Int128 is
        Solutions : array( Natural range 0 .. 20, Natural range 0 .. 20 )
            of Int128;
    begin

        for I in Solutions'Range(1) loop
            Solutions(I, 0) := 1;
        end loop;

        for I in Solutions'Range(2) loop
            Solutions(0, I) := 1;
        end loop;

        for I in 1 .. Solutions'Last(1) loop
            for J in 1 .. Solutions'Last(2) loop
                Solutions(I, J) := Solutions( I-1, J) + Solutions( I, J-1);
            end loop;
        end loop;

        return Solutions(20, 20);

    end Solution_1;

    procedure Test_Solution_1 is
        Solution : constant Int128 := 137846528820;
    begin
        Assert( Solution_1 = Solution );
    end Test_Solution_1;

    function Get_Solutions return Solution_Case is
        Ret : Solution_Case;
    begin
        Set_Name( Ret, "Problem 15" );
        Add_Test( Ret, Test_Solution_1'Access );
        return Ret;
    end Get_Solutions;

end problem_15;
