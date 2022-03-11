local M = {}

function Solution_1(Num)
    Sum = 0
    for i = 1, Num - 1, 1 do
        if i % 3 == 0 or i % 5 == 0 then
            Sum = Sum + i
        end
    end

    return Sum
end

function Arith_Sequence( N, Top )
    First = N
    Last = Top - ( Top % N )
    Terms = Last / N

    return (Terms * ( First + Last ) / 2);
end

function Solution_2(Num)
    Sum = Arith_Sequence( 3, Num - 1 )
    Sum = Sum + Arith_Sequence( 5, Num - 1)
    Sum = Sum - Arith_Sequence( 15, Num - 1)

    return (Sum | 0)
end

function Test_Solution_1()
    assert( Solution_1(1000) == 233168 )
end

function Test_Solution_2()
    assert( Solution_2(1000) == 233168 )
end

function M.Get_Solutions()
    func = {}
    func[1] = Test_Solution_1
    func[2] = Test_Solution_2
    return func
end

return M
