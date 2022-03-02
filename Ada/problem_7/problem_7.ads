with Test_Solution; use Test_Solution;
with Ada.Containers.Vectors;

package Problem_7 is

    type Int64 is range -2**63 .. 2**63 - 1;

    package P is new Ada.Containers.Vectors(Index_Type => Natural, Element_Type => Int64);

    function Solution_1( Num : Integer ) return Int64;

    procedure Test_Solution_1;

    function Get_Solutions return Solution_Case;

end Problem_7;
