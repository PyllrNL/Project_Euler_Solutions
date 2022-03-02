with Test_Solution; use Test_Solution;
with Ada.Containers.Vectors;

package Problem_10 is

    type Int128 is range -2**127 .. 2**127 - 1;

    package P is new Ada.Containers.Vectors( Index_Type => Natural, Element_Type
    => Natural );

    function Solution_1 return Int128;

    function Solution_2(Limit : Integer) return Int128;

    procedure Test_Solution_1;
    procedure Test_Solution_2;

    function Get_Solutions return Solution_Case;

end Problem_10;
