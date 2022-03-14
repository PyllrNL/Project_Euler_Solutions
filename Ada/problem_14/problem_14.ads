with Test_Solution; use Test_Solution;
with Ada.Text_IO; use Ada.Text_IO;

package problem_14 is

    type Int64 is range -2**63 .. 2**63 - 1;

    function Solution_1 return Integer;

    procedure Test_Solution_1;

    function Get_Solutions return Solution_Case;

end problem_14;
