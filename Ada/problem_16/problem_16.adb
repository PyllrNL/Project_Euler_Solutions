package body problem_16 is

    function Solution_1( I : Integer) return Integer is
        Length : constant Integer := 1 + Integer(Float(I)*0.30103);
        Arr : array( Natural range 0 .. Length) of Natural :=
            (0 => 1, others => 0);
        Carry : Integer := 0;
        Sum : Integer := 0;
    begin
        for J in 1 .. I loop

            Carry := 0;

            for Z in 0 .. Length loop

                declare
                    Product : Integer := 2*Arr(Z) + Carry;
                begin
                    Arr(z) := Product mod 10;
                    Carry := Product / 10;
                end;

            end loop;
        end loop;

        for J in 0 .. Length loop
            Sum := Sum + Arr(J);
        end loop;

        return Sum;
    end Solution_1;

    procedure Test_Solution_1 is
        Solution : constant Integer := 1366;
    begin
        Assert( Solution_1(1000) = Solution );
    end Test_Solution_1;

    function Get_Solutions return Solution_Case is
        Ret : Solution_Case;
    begin
        Set_Name( Ret, "Problem 16" );
        Add_Test( Ret, Test_Solution_1'Access );
        return Ret;
    end Get_Solutions;

end problem_16;
