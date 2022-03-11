local M = {}

function Solution_1()
    term_cur = 2
    term_last = 1
    sum = 0
    while term_cur < 4000000 do
        if term_cur % 2 == 0 then
            sum = sum + term_cur
        end
        temp = term_cur
        term_cur = term_cur + term_last
        term_last = temp
    end
    return sum
end

function Test_Solution_1()
    assert( Solution_1() == 4613732 )
end

function M.Get_Solutions()
    func = {}
    func[1] = Test_Solution_1
    return func
end

return M
