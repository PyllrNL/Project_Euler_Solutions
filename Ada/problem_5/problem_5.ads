with Test_Solution; use Test_Solution;
with Ada.Numerics; use Ada.Numerics;
with Ada.Numerics.Elementary_Functions;
use Ada.Numerics.Elementary_Functions;
with Ada.Containers.Vectors;

package Problem_5 is

    type Int64 is range -2**63 .. 2**63 - 1;

    type Prime_Count is record
        Prime : Int64;
        Count : Int64;
    end record;

    package P is new Ada.Containers.Vectors(Index_Type => Natural,
    Element_Type => Prime_Count);

    function Solution_1( Min, Max : Integer ) return Int64;

    function Solution_2( Min, Max : Integer ) return Int64;

    procedure Test_Solution_1;
    procedure Test_Solution_2;

    function Get_Solutions return Solution_Case;

private

    function Greatest_Common_Divisor( A, B : Integer ) return Integer;
    function Least_Common_Multiple( A, B : Integer ) return Integer;

end Problem_5;
