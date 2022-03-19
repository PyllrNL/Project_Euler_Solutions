package body problem_19 is

    function Solution_1 return Integer is
        Start_Year : constant Integer := 1901;
        End_Year : constant Integer := 2000;
        Sundays : Integer := 0;
        Offset : constant array (Natural range 0 .. 11) of Natural := (
                0, 3, 2, 5, 0, 3, 5, 1, 4, 6, 2, 4
            );
    begin
        for Year in Start_Year .. End_Year loop
            for Month in 0 .. 11 loop
                declare
                    Y : Integer := Year;
                    Dow : Integer;
                begin
                    if Month < 3 then
                        Y := Y - 1;
                    end if;
                    DOW := (1 + Y + (Y/4) - (Y/100) + (Y/400) + Offset(Month)) mod 7;
                    if DOW = 0 then
                        Sundays := Sundays + 1;
                    end if;
                end;
            end loop;
        end loop;

        return Sundays;
    end Solution_1;

    procedure Test_Solution_1 is
        Solution : constant Integer := 171;
    begin
        Assert( Solution_1 = Solution );
    end Test_Solution_1;

    function Get_Solutions return Solution_Case is
        Ret : Solution_Case;
    begin
        Set_Name( Ret, "Problem 19" );
        Add_Test( Ret, Test_Solution_1'Access );
        return Ret;
    end Get_Solutions;

end problem_19;
