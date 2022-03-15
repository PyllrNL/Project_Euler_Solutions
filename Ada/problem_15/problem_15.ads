with Test_Solution; use Test_Solution;

package problem_15 is

    type Int128 is range -2**127 .. 2**127 - 1;

    function Solution_1 return Int128;

    procedure Test_Solution_1;

    function Get_Solutions return Solution_Case;

end problem_15;
