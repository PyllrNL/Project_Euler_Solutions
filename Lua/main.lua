
local modules = {
    "problem_1",
    "problem_2"
}

for _, module in ipairs(modules) do
    local f = require(module).Get_Solutions()
    print("Loading module", module)
    for x, func in ipairs(f) do
        print("Calling Function", x)
        func()
        print("Passed")
    end
end
