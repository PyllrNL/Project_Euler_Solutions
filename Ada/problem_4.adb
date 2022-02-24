with Ada.Text_IO; use Ada.Text_IO;

procedure problem_4 is

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

    function Solve_1 return Integer is
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
    end Solve_1;

begin

    Put_Line(Integer'Image(Solve_1));

end problem_4;
