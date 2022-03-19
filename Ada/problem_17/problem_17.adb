package body problem_17 is

    function Letter_In_Num( Num : Integer ) return Integer is
        Single : constant array( Natural range 0 .. 9 ) of Positive := (
                0 => 4, 1 => 3, 2 => 3, 3 => 5, 4 => 4,
                5 => 4, 6 => 3, 7 => 5, 8 => 5, 9 => 4
            );
        doubles : constant array ( Natural range 2 .. 9 ) of Positive := (
                2 => 6, 3 => 6, 4 => 5, 5 => 5, 6 => 5,
                7 => 7, 8 => 6, 9 => 6
            );
        Tens : constant array( Natural range 0 .. 9 ) of Positive := (
                0 => 3, 1 => 6, 2 => 6, 3 => 8, 4 => 8,
                5 => 7, 6 => 7, 7 => 9, 8 => 8, 9 => 8
            );
        Hundred : constant Integer := 7;
        Thousand : constant Integer := 8;
        AAnd : constant Integer := 3;

        Local : Integer := Num;
        Temp : Integer;
        Letters : Integer := 0;
    begin
        loop
            exit when Local = 0;
            if Local < 10 then
                Letters := Letters + Single(Local);
                Local := 0;
            elsif Local < 20 then
                Letters := Letters + Tens( Local mod 10 );
                Local := 0;
            elsif Local < 100 then
                Temp := Local / 10;
                Letters := Letters + Doubles( Temp );
                Local := Local - (Temp * 10);
            elsif Local < 1000 then
                Temp := Local / 100;
                Letters := Letters + Single( Temp ) + Hundred;
                Local := Local - (Temp * 100);
                if Local > 0 then
                    Letters := Letters + AAnd;
                end if;
            else
                Temp := Local / 1000;
                Letters := Letters + Single( Temp ) + Thousand;
                Local := Local - (Temp * 1000);
                if Local > 0 then
                    Letters := Letters + AAnd;
                end if;
            end if;
        end loop;

        return Letters;
    end Letter_In_Num;

    function Solution_1( Min, Max : Integer ) return Integer is
        Sum : Integer := 0;
    begin

        for I in Min .. Max loop
            Sum := Sum + Letter_In_Num( I );
        end loop;

        return Sum;

    end Solution_1;

    procedure Test_Solution_1 is
        Solution: constant Integer := 21124;
    begin
        Assert( Solution_1(1, 1000) = Solution);
    end Test_Solution_1;

    function Get_Solutions return Solution_Case is
        Ret : Solution_Case;
    begin
        Set_Name( Ret, "Problem 17" );
        Add_Test( Ret, Test_Solution_1'Access );
        return Ret;
    end Get_Solutions;

end problem_17;
