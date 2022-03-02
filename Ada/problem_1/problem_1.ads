with Test_Solution; use Test_Solution;

package problem_1 is
    type Int64 is range -2**63 .. 2**63 - 1;
    type Int128 is range -2**127 .. 2**127 - 1;

    function Solution_1( Max : Int128 ) return Int128;

    function Solution_2( Max : Int128 ) return Int128;

    procedure Test_Solution_1;
    procedure Test_Solution_2;

    function Get_Solutions return Solution_Case;

private

    function Arithmetic_Sequence( N, Top : Int128 ) return Int128;

end problem_1;
