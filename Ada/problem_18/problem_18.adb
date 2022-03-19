package body problem_18 is

    function Solution_1 return Integer is
        Triangle : array (Natural range 1 .. 15, Natural range 1 .. 15) of Natural := (
                (75, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
                (95, 64, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
                (17, 47, 82, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
                (18, 35, 87, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
                (20, 4, 82, 47, 65, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
                (19, 1, 23, 75, 3, 34, 0, 0, 0, 0, 0, 0, 0, 0, 0),
                (88, 2, 77, 73, 7, 63, 67, 0, 0, 0, 0, 0, 0, 0, 0),
                (99, 65, 4, 28, 6, 16, 70, 92, 0, 0, 0, 0, 0, 0, 0),
                (41, 41, 26, 56, 83, 40, 80, 70, 33, 0, 0, 0, 0, 0, 0),
                (41, 48, 72, 33, 47, 32, 37, 16, 94, 29, 0, 0, 0, 0, 0),
                (53, 71, 44, 65, 25, 43, 91, 52, 97, 51, 14, 0, 0, 0, 0),
                (70, 11, 33, 28, 77, 73, 17, 78, 39, 68, 17, 57, 0, 0, 0),
                (91, 71, 52, 38, 17, 14, 91, 43, 58, 50, 27, 29, 48, 0, 0),
                (63, 66, 4, 68, 89, 53, 67, 30, 73, 16, 69, 87, 40, 31, 0),
                (4, 62, 98, 27, 23, 9, 70, 98, 73, 93, 38, 53, 60, 4, 23)
            );
    begin
        for I in reverse Triangle'First(1) .. Triangle'Last(1) - 1 loop
            for J in 1 .. I loop
                if Triangle(I+1, J) > Triangle(I+1, J+1) then
                    Triangle(I,J) := Triangle(I,J) + Triangle(I+1, J);
                else
                    Triangle(I,J) := Triangle(I,J) + Triangle(I+1, J+1);
                end if;
            end loop;
        end loop;

        return Triangle(Triangle'First(1), Triangle'First(2));
    end Solution_1;

    procedure Test_Solution_1 is
        Solution : constant Integer := 1074;
    begin
        Assert( Solution_1 = Solution );
    end Test_Solution_1;

    function Get_Solutions return Solution_Case is
        Ret : Solution_Case;
    begin
        Set_Name( Ret, "Problem 18");
        Add_Test( Ret, Test_Solution_1'Access );
        return Ret;
    end Get_Solutions;

end problem_18;
