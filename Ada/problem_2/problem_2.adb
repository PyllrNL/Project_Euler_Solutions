package body Problem_2 is

    function Solution_1( Max : Int128 ) return Int128 is
        N_1_Term : Int128 := 1;
        N_Term : Int128 := 1;
        Value : Int128 := 0;
        Sum : Int128 := 0;
    begin
        loop
            Value := N_1_Term + N_Term;

            exit when Value > Max;

            if Value mod 2 = 0 then
                Sum := Sum + Value;
            end if;
            N_1_Term := N_Term;
            N_Term := Value;
        end loop;

        return Sum;
    end Solution_1;

    function Solution_2( Max : Int128 ) return Int128 is
        N_1_Term : Int128 := 2;
        N_Term : Int128 := 8;
        Sum : Int128 := N_1_Term + N_Term;
        Value : Int128 := 0;
    begin
        loop
            Value := 4*N_Term + N_1_Term;

            exit when Value > Max;

            Sum := Sum + Value;
            N_1_Term := N_Term;
            N_Term := Value;
        end loop;

        return Sum;
    end Solution_2;

    procedure Test_Solution_1 is
        Solution : constant Int128 := 4613732;
    begin
        Assert( Solution_1(4_000_000) = Solution);
    end Test_Solution_1;

    procedure Test_Solution_2 is
        Solution : constant Int128 := 4613732;
    begin
        Assert( Solution_2(4_000_000) = Solution);
    end Test_Solution_2;

    function Get_Solutions return Solution_Case is
        Ret : Solution_Case;
    begin
        Set_Name( Ret, "Solutions to Problem 2" );
        Add_Test( Ret, Test_Solution_1'Access );
        Add_Test( Ret, Test_Solution_2'Access );

        return Ret;
    end Get_Solutions;

end Problem_2;
