function fib(x)
    if (x == 0 or x == 1) then
        return 1
    else
        return fib(x - 1) + fib(x - 2)
    end
end

print("enter a number")
local number = io.read("*n")
for i = 0, number, 1 do
    print(fib(i))
end
