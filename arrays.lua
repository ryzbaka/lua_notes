function printArray(x)
    for i = 1, #x, 1 do
        print(x[i])
    end
end

local someArray = { 1, 2, 3 }
for i = 1, #someArray, 1 do -- # is used to get the size of arrays in lua
    print(someArray[i])
end
print(someArray[0]) -- will be nil since lua arrays are 1-indexed
for i = #someArray, 1, -1 do
    print(someArray[i])
end


for index, value in ipairs(someArray) do
    print(index .. ":" .. value)
end
print("********")
printArray(someArray)
print("***")
table.insert(someArray, 4)
printArray(someArray)
print("***")
table.remove(someArray)
printArray(someArray)
