with Test_Solution; use Test_Solution;

package problem_13 is

    type Int128 is range -2**127 .. 2**127 - 1;

    type Digit_50_Array is array( Natural range <> ) of String( 1 .. 50 );

    function solution_1( arr : Digit_50_Array ) return Int128;

    procedure Test_Solution_1;

    function Get_Solutions return Solution_Case;

end problem_13;
