with Test_Solution; use Test_Solution;

package Problem_6 is
   
    type Int64 is range -2**63 .. 2**63 - 1;

    function Solution_1 return Int64;

    function Solution_2 return Int64;

    procedure Test_Solution_1;
    procedure Test_Solution_2;

    function Get_Solutions return Solution_Case;

end Problem_6;
