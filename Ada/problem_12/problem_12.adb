package body Problem_12 is

    function Solution_1 return Int64 is
        Sum : Int64 := 1;
        Triangle_Num : Int64 := 1;
        Inc : Int64 := 1;
        Prime_Count : Int64;
        Temp : Int64;
        I : Int64 := 3;
    begin
        loop
            Sum := 1;
            Temp := Triangle_Num;
            Prime_Count := 1;

            while Temp mod 2 = 0 loop
                Prime_Count := Prime_Count + 1;
                Temp := Temp / 2;
            end loop;

            Sum := Sum * Prime_Count;

            I := 3;
            while Temp > 1 loop
                Prime_Count := 1;
                while Temp mod I = 0 loop
                    Prime_Count := Prime_Count + 1;
                    Temp := Temp / I;
                end loop;
                Sum := Sum * Prime_Count;
                I := I + 2;
            end loop;

            exit when Sum > 500;

            Inc := Inc + 1;
            Triangle_Num := Triangle_Num + Inc;
        end loop;
        return Triangle_Num;
    end Solution_1;

    procedure Test_Solution_1 is
        Solution: constant Int64 := 76576500;
    begin
        Assert( Solution_1 = Solution );
    end Test_Solution_1;

    function Get_Solutions return Solution_Case is
        Ret : Solution_Case;
    begin
        Set_Name( Ret, "Problem 12");
        Add_Test( Ret, Test_Solution_1'Access );
        return Ret;
    end Get_Solutions;

end Problem_12;
