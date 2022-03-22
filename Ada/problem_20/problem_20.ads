with Test_Solution; use Test_Solution;
with Ada.Text_IO; use Ada.Text_IO;

package problem_20 is

    type Int128 is range -2**127 .. 2**127 -1;

    function Solution_1 return Integer;

    procedure Test_Solution_1;

    function Get_Solutions return Solution_Case;

end problem_20;
