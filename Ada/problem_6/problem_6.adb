with Ada.Text_IO; use Ada.Text_IO;

procedure problem_6 is
   
    type Int64 is range -2**63 .. 2**63 - 1;

    function Solve_1 return Int64 is
        Sum_Of_Squares : Int64 := 0;
        Sum : Int64 := 0;
    begin
        for I in 1 .. 100 loop
            Sum_Of_Squares := Sum_Of_Squares + Int64(I*I);
            Sum := Sum + Int64(I);
        end loop;

        return (Sum * Sum ) - Sum_Of_Squares;
    end Solve_1;

    function Solve_2 return Int64 is
        Sum_Of_Squares : Constant Int64 := (100*(100 + 1)*(2*100 + 1)) / 6;
        Sum : Constant Int64 := (100*(100+1)) / 2;
    begin
        return (Sum*Sum) - Sum_Of_Squares;
    end Solve_2;

begin

    Put_Line(Int64'Image(Solve_1));
    Put_Line(Int64'Image(Solve_2));

end problem_6;
