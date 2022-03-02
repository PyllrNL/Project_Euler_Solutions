with Test_Solution; use Test_Solution;
with Ada.Numerics.Elementary_Functions;
use Ada.Numerics.Elementary_Functions;

package Problem_9 is

    type Int64 is range -2**63 .. 2**63 - 1;

    function Solution_1 return Int64;

    procedure Test_Solution_1;

    function Get_Solutions return Solution_Case;

end Problem_9;
