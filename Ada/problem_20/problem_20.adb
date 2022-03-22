package body problem_20 is

    function Solution_1 return Integer is
        Num : array( Natural range 0 .. 50 ) of Natural := (
            0 => 1, others => 0);
        Sum : Integer := 0;
        Carry : Integer := 1;
        Temp : Integer;
    begin
        for I in 2 .. 100 loop
            Carry := 0;
            for J in Num'Range loop
                Temp := (Num(J) * I) + Carry;
                Num(J) := Temp mod 10_000_000;
                Carry := Temp / 10_000_000;
            end loop;
        end loop;

        for I in Num'Range loop
            While Num(I) > 0 loop
                Sum := Sum + (Num(I) mod 10);
                Num(I) := Num(I) / 10;
            end loop;
        end loop;

        return Sum;
    end Solution_1;

    procedure Test_Solution_1 is
        Solution : constant Integer := 648;
    begin
        Assert( Solution = Solution_1 );
    end Test_Solution_1;

    function Get_Solutions return Solution_Case is
        Ret : Solution_Case;
    begin
        Set_Name( Ret, "problem 20" );
        Add_Test( Ret, Test_Solution_1'Access );
        return Ret;
    end Get_Solutions;

end problem_20;
