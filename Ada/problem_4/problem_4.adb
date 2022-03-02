package body Problem_4 is

    function Solution_1 return Integer is
        Minimum : constant Integer := 100;
        Maximum : constant Integer := 999;
        Max_Palindrome : Integer := 0;
        Temp : Integer := 0;
    begin
        for I in Minimum .. Maximum loop
            for J in Minimum .. Maximum loop
                Temp := I * J;
                if Is_Palindrome(Temp) = True then
                    if Temp > Max_Palindrome then
                        Max_Palindrome := Temp;
                    end if;
                end if;
            end loop;
        end loop;

        return Max_Palindrome;
    end Solution_1;

    function Is_Palindrome( Num : Integer ) return Boolean is
        Reverse_Num : Integer := 0;
        Input_Num : Integer := Num;
    begin
        while Input_Num > 1 loop
            Reverse_Num := 10 * Reverse_Num;
            Reverse_Num := Reverse_Num + (Input_Num mod 10);
            Input_Num := Input_Num / 10;
        end loop;

        return Reverse_Num = Num;
    end Is_Palindrome;

    procedure Test_Solution_1 is
    begin
        Assert(Solution_1 = 906609);
    end Test_Solution_1;

    function Get_Solutions return Solution_Case is
        Ret : Solution_Case;
    begin
        Set_Name( Ret, "problem 4");
        Add_Test( Ret, Test_Solution_1'Access );
        return Ret;
    end Get_Solutions;

end Problem_4;
