package body problem_1 is

    function Solution_1( Max : Int128 ) return Int128 is
        Sum : Int128 := 0;
    begin
        for I in 3 .. Max - 1 loop
            if I mod 3 = 0 or else I mod 5 = 0 then
                Sum := Sum + I;
            end if;
        end loop;

        return Sum;
    end Solution_1;

    function Solution_2( Max : Int128 ) return Int128 is
        Sum : Int128 := 0;
    begin
        Sum := Arithmetic_Sequence( 3, Max - 1);
        Sum := Sum + Arithmetic_Sequence( 5, Max - 1);
        Sum := Sum - Arithmetic_Sequence( 3*5, Max - 1);
        return Sum;
    end Solution_2;

    function Arithmetic_Sequence( N, Top : Int128 ) return Int128 is
        First_Term : constant Int128 := N;
        Last_Term : constant Int128 := Top - ( Top mod N );
        N_Terms : constant Int128 := Last_Term / N;
    begin
        return N_Terms * ( First_Term + Last_Term ) / 2;
    end Arithmetic_Sequence;

    procedure Test_Solution_1 is
        Solution : constant Int128 := 233168;
    begin
        Assert( Solution_1(1000) = Solution );
    end Test_Solution_1;

    procedure Test_Solution_2 is
        Solution : constant Int128 := 233168;
    begin
        Assert( Solution_1(1000) = Solution );
    end Test_Solution_2;

    function Get_Solutions return Solution_Case is
        Ret : Solution_Case;
    begin
        Set_Name( Ret, "Solutions Problem 1");
        Add_Test( Ret, Test_Solution_1'access );
        Add_Test( Ret, Test_Solution_2'access );

        return Ret;
    end Get_Solutions;

end Problem_1;
