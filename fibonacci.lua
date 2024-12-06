function fib(x)
    if (x==0 or x==1) then
        return 1
    else
        return fib(x-1)+fib(x-2)
    end
end
print("enter a number")
user_input = io.read("*n")
result  = fib(user_input)
print("fibonacci is "..result..".")