with Ada.Numerics; use Ada.Numerics;
with Ada.Numerics.Elementary_Functions;
use Ada.Numerics.Elementary_Functions;
with Ada.Containers.Vectors;

with Test_Solution; use Test_Solution;

package Problem_3 is

    type Int64 is range -2**63 .. 2**63 -1;

    type Prime_Count is record
        Prime : Integer;
        Count : Integer;
    end record;

    package P is new Ada.Containers.Vectors(Index_Type => Natural,
    Element_Type => Prime_Count);

    function Solution_1( Comp : Int64 ) return Int64;

    procedure Test_Solution_1;

    function Get_Solutions return Solution_Case;

private

    function Prime_Factorization( Num : Int64 ) return P.Vector;


end Problem_3;
