function Solve_1()
    Sum = 0
    for i = 1, 999, 1 do
        if i % 3 == 0 or i % 5 == 0 then
            Sum = Sum + i
        end
    end

    return Sum
end

print(Solve_1())
