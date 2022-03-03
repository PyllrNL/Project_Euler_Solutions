with Test_Solution; use Test_Solution;

package Problem_11 is

    type Grid is array(Natural range <>, Natural range <>) of Natural;

    function Solution_1( G : Grid ) return Integer
        with Pre => G'Length(1) = G'Length(2);

    procedure Test_Solution_1;

    function Get_Solutions return Solution_Case;

end Problem_11;
