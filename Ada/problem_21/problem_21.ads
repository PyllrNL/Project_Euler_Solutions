with Test_Solution; use Test_Solution;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Numerics.Elementary_Functions;

package problem_21 is

    type Int64 is range -2**63 .. 2**63 - 1;

    function Solution_1 return Int64;

    procedure Test_Solution_1;

    function Get_Solutions return Solution_Case;

end problem_21;
